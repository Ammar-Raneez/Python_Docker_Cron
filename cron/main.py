import os

def main():
    """
    Main function
    """

    print('Cron job started...')
    print(f'Username: {os.getenv('USERNAME')}')
    print(f'Password: {os.getenv('PASSWORD')}')
    # perform some operation


if __name__ == '__main__':
    main()
