Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1D2293C52
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 17:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751304245; cv=none; b=TgLycyMWfbZniwSDhnZTwb3WOzSNtPzdgf/UulwAK0L7hztCXGq+/SgBv0qFxs4c347s22K/v6WIdzGqFLGTi+ihfr6ybHbTjZkbkdtPF7CCcH8DCHgdH+5+UDwQwLzJhj49WPuo8ZwKNBE4Fqq7s4g/PhqA0jhGQ8akEnOfRF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751304245; c=relaxed/simple;
	bh=ueqwGGpg/Hdx6+MscgKsRoTQxKysqzX4M9FHcWBPNVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QD+XAN5Z+plCsbl04CvS+TUWP9oc6tcyGlK4FE2aLn/amGbrJF7Wy5E5l2/ozuOx1RLxmP6WJpbDQtFxIGdZkdaQ/6iyczlRQIA2qUQssQYtAE64l8/W1n1Xnv/BStUX+4dNCsAWdiuK7Nt368PXzn/VMEDTQ6GfdWOipGeuBG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YmXWKfoe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YmXWKfoe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43E83C4CEE3;
	Mon, 30 Jun 2025 17:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751304244;
	bh=ueqwGGpg/Hdx6+MscgKsRoTQxKysqzX4M9FHcWBPNVs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YmXWKfoepfC+IOxd3fRYxk+rNtDWqofPK8oO6MXqxviQGqUYMeMJBz4pKljOhOtvZ
	 WSQcgGIvyRKqJPSZp6Yx/TCN3Dq2gGbMMatggHAZE1oQjg7Jrq00oUrpkgcntMYLgZ
	 jA/jXUOJjncAKGQY6TTlL5miCjg8h1z3LA3VjNqA=
Date: Mon, 30 Jun 2025 19:24:01 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Reuven Abliyev <reuven.abliyev@intel.com>, linux-kernel@vger.kernel.org
Subject: Re: [char-misc-next v2 2/5] mei: make char device control its own
 lifetime
Message-ID: <2025063039-grab-reclining-1ad8@gregkh>
References: <20250630091942.2116676-1-alexander.usyskin@intel.com>
 <20250630091942.2116676-3-alexander.usyskin@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630091942.2116676-3-alexander.usyskin@intel.com>

On Mon, Jun 30, 2025 at 12:19:39PM +0300, Alexander Usyskin wrote:
> Allocate character device dynamically and allow to
> control its own lifetime as it may outlive mei_device
> structure while character device closes after parent
> device is removed from the system.
> 
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> ---
>  drivers/misc/mei/main.c    | 36 +++++++++++++++++++++++-------------
>  drivers/misc/mei/mei_dev.h |  4 ++--
>  2 files changed, 25 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/misc/mei/main.c b/drivers/misc/mei/main.c
> index 95d4c1d8e4e6..5335cf39d663 100644
> --- a/drivers/misc/mei/main.c
> +++ b/drivers/misc/mei/main.c
> @@ -51,7 +51,9 @@ static int mei_open(struct inode *inode, struct file *file)
>  
>  	int err;
>  
> -	dev = container_of(inode->i_cdev, struct mei_device, cdev);
> +	dev = idr_find(&mei_idr, iminor(inode));
> +	if (!dev)
> +		return -ENODEV;
>  
>  	mutex_lock(&dev->device_lock);
>  
> @@ -1118,7 +1120,10 @@ void mei_set_devstate(struct mei_device *dev, enum mei_dev_state state)
>  
>  	dev->dev_state = state;
>  
> -	clsdev = class_find_device_by_devt(&mei_class, dev->cdev.dev);
> +	if (!dev->cdev)

How can this happen?

> +		return;

No error reported?


> +
> +	clsdev = class_find_device_by_devt(&mei_class, dev->cdev->dev);
>  	if (clsdev) {
>  		sysfs_notify(&clsdev->kobj, NULL, "dev_state");
>  		put_device(clsdev);
> @@ -1223,16 +1228,21 @@ int mei_register(struct mei_device *dev, struct device *parent)
>  
>  	/* Fill in the data structures */
>  	devno = MKDEV(MAJOR(mei_devt), dev->minor);
> -	cdev_init(&dev->cdev, &mei_fops);
> -	dev->cdev.owner = parent->driver->owner;
> -	cdev_set_parent(&dev->cdev, &parent->kobj);
> +	dev->cdev = cdev_alloc();
> +	if (!dev->cdev) {
> +		ret = -ENOMEM;
> +		goto err;
> +	}
> +	dev->cdev->ops = &mei_fops;
> +	dev->cdev->owner = parent->driver->owner;
> +	cdev_set_parent(dev->cdev, &parent->kobj);
>  
>  	/* Add the device */
> -	ret = cdev_add(&dev->cdev, devno, 1);
> +	ret = cdev_add(dev->cdev, devno, 1);

Shouldn't this be cdev_device_add()?  If not, who frees the cdev when it
is done?

>  	if (ret) {
>  		dev_err(parent, "unable to add device %d:%d\n",
>  			MAJOR(mei_devt), dev->minor);
> -		goto err_dev_add;
> +		goto err_del_cdev;

The error name was correct, why change it?

>  	}
>  
>  	clsdev = device_create_with_groups(&mei_class, parent, devno,
> @@ -1243,16 +1253,16 @@ int mei_register(struct mei_device *dev, struct device *parent)
>  		dev_err(parent, "unable to create device %d:%d\n",
>  			MAJOR(mei_devt), dev->minor);
>  		ret = PTR_ERR(clsdev);
> -		goto err_dev_create;
> +		goto err_del_cdev;
>  	}
>  
>  	mei_dbgfs_register(dev, dev_name(clsdev));
>  
>  	return 0;
>  
> -err_dev_create:
> -	cdev_del(&dev->cdev);
> -err_dev_add:
> +err_del_cdev:
> +	cdev_del(dev->cdev);
> +err:
>  	mei_minor_free(dev);
>  	return ret;
>  }
> @@ -1262,8 +1272,8 @@ void mei_deregister(struct mei_device *dev)
>  {
>  	int devno;
>  
> -	devno = dev->cdev.dev;
> -	cdev_del(&dev->cdev);
> +	devno = dev->cdev->dev;
> +	cdev_del(dev->cdev);

Was this tested?  What happens when cdev_del() is called like this?  Is
the memory really freed?

>  
>  	mei_dbgfs_deregister(dev);
>  
> diff --git a/drivers/misc/mei/mei_dev.h b/drivers/misc/mei/mei_dev.h
> index 37d7fb15cad7..0cc943afa80a 100644
> --- a/drivers/misc/mei/mei_dev.h
> +++ b/drivers/misc/mei/mei_dev.h
> @@ -471,7 +471,7 @@ struct mei_dev_timeouts {
>   * struct mei_device -  MEI private device struct
>   *
>   * @dev         : device on a bus
> - * @cdev        : character device
> + * @cdev        : character device pointer
>   * @minor       : minor number allocated for device
>   *
>   * @write_list  : write pending list
> @@ -557,7 +557,7 @@ struct mei_dev_timeouts {
>   */
>  struct mei_device {
>  	struct device *dev;
> -	struct cdev cdev;
> +	struct cdev *cdev;

So now nothing owns the lifetime of the mei_device object?  Do things
still work at this point in time in the patch series?

thanks,

greg k-h
