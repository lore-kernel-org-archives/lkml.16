Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D25299933
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 20:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747340649; cv=none; b=KLhjz8M4ikCAAvRk1kH92Se2cHElj2UYPSjtdqVURzwUlKPgVNX4Ttajn3lDBMS7X7TDlmaDo0DbLTu/XdG1LkZM66k1/WIs2WrIDdR2gIeOpGmd766dL7kvuu1eWBoeRUErHJNqezG3/9qyhGhYzwqGge8As6neAheO6ubvbC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747340649; c=relaxed/simple;
	bh=+kMqPl0JDQX7QaGiLL+7LffY8No4gEZI/PY3gX1O+3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rRwoHK8QkYTmrT8fg7fCPPDkwcVF+b8ACx07C1ZD9fvLdPRtfspKB3Cl3WkeIbgdeQWyjL/bRMe4aF/xsF/gVX8O5JO0N6abCWfEScE7dRqJJjvPQcxGSXEKdAsbPwwoHlh+GqmRAhaWQ9ytTMA9peeF6GUKXV58rZUbAsa1rko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vR31NpxZ; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vR31NpxZ"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-30e7bfef27dso295043a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 13:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747340647; x=1747945447; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V2VSQyhTZNV0jvE/2WckSMtS0BAnsxh057td4KI4roM=;
        b=vR31NpxZu4LV64sFMxPKBqLZ+9y+SSKZxWVxHeusVkHcDu5dT10QZKZx1+vaGlngZg
         UXCFikaqCNIg1M8GsfRWXZj9MmZBVH1NbMSLE54OdXehyoATD15boYIb/ZelZwrtNK8m
         7r+TOWfE0CqOd0jJ5+O1qKxshvBa/hYDzZENc66sp9orB6eBT1M7qG3xjVDtifADklFe
         8opgwi1+XkdSbc/RvtcKNYE5+AXBtZ1CzpIuKhoI1q6zkAhZXZApzbkTRggdR384bRhF
         l4ita13wBQrJ6Byo4UqWMI0FShyhfc4GzKIM8RWFrnDw6c6E8Kzs2Uchs92+rzMxhTGS
         +orA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747340647; x=1747945447;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V2VSQyhTZNV0jvE/2WckSMtS0BAnsxh057td4KI4roM=;
        b=nY3DHkHfWtBwqweSiPXUeRLOtHHk1LevbcHNTd1zKy23I0LAowULUPv6VbZWpnkFi/
         5KmtpD3jcua4sqr12TcoE85fPcEikbHqsuoXdnvB8QbcFswoi1NGGC3dLZzybyW7Dzmn
         Y0UitsRClsdpp6hN3TFmpS6xURDHR8opjflohu3/IdljUvd7R6aidQ35RDUn47zJGLCX
         pkI2UTRYaQb4ishxILUOI/C/q/y+uRZcrpX0dzlt6Ho0s+T9ghlLmXeuZGwvL5TFl0ys
         IN1KHcKEr3Gj/i9QzZffIJs844R7D4UuhSZhS7fO4IkDGYLuAKA2lJ+qYTTJPlYP+zpe
         ocaw==
X-Forwarded-Encrypted: i=1; AJvYcCUz+SHqmDd80sMMaCoaJnWw5ReWqkx48NnFVDIE1y8t7jpXCsdKt8iEaqhWvJuOOQ61PK4RRVNb5jUcPdw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzL1P/td4WpisLZPBKrF/bJQSc7fYSe4JOjF03YQ4hs3eUtGHvE
	Nwcg5GiVfYO/hyfKGIQVXQ9T/SQCfB9XI0t6Z1lPir4tRG0uM6fS3VghVUSLFqkiQfk=
X-Gm-Gg: ASbGnct2izD1+9VdhkuNpowBrEdy42w9ljAHKQ+8OYB3euyS4ktJDU6Gkd2PsUArJE4
	ixZ5NEjRRvocqWFRvpN9kgB8eiNVZH2B6BEAikeGdoN3hlY+7kAmfLV/QBf9E0ydq+WFzZOUE/o
	YkpswZrJNGL+5aP62MPG6xN6ZwiKwwfGTYnZiEaWfW/hZhdfz7hQsAHP5o/4xZbLKSP9BKdxTNE
	cRecCUV4LlHyfVVMUjxABp+BCetCS3TxW9dCUsFN9FREPm7n8+V1bAtJ4YTwIceKu0gds/JQbq+
	k5ugC5CdXqgdXHrro7zM40z6H6CJOoNMIDrQM9EsvIQCUpGiFvvf8evnR5Et025hYQ==
X-Google-Smtp-Source: AGHT+IEUFKVx7oIa2XqCPU17O56pYWL4lei0a4c8lfjHEvBMewyutxU8qjTgh8IMG0LEf2+RATTOXg==
X-Received: by 2002:a17:90b:3a88:b0:30e:7b3b:b901 with SMTP id 98e67ed59e1d1-30e7d558c1emr1000521a91.18.1747340646700;
        Thu, 15 May 2025 13:24:06 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:1d7a:b4f2:fe56:fa4e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e334fb0d0sm3879347a91.41.2025.05.15.13.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 13:24:06 -0700 (PDT)
Date: Thu, 15 May 2025 14:24:04 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Dawei Li <dawei.li@linux.dev>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, set_pte_at@outlook.com
Subject: Re: [PATCH v2 1/3] rpmsg: char: Reuse eptdev logic for anon device
Message-ID: <aCZNZPkb5oPZiz9G@p14s>
References: <20250509155927.109258-1-dawei.li@linux.dev>
 <20250509155927.109258-2-dawei.li@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509155927.109258-2-dawei.li@linux.dev>

Hi,

On Fri, May 09, 2025 at 11:59:25PM +0800, Dawei Li wrote:
> Current uAPI implementation for rpmsg ctrl & char device manipulation is
> abstracted in procedures below:
> 
> Current uAPI implementation for rpmsg ctrl & char device manipulation is
> abstracted in procedures below:
> - fd = open("/dev/rpmsg_ctrlX")
> - ioctl(fd, RPMSG_CREATE_EPT_IOCTL, &info); /dev/rpmsgY devnode is
>   generated.
> - fd_ep = open("/dev/rpmsgY", O_RDWR)
> - operations on fd_ep(write, read, poll ioctl)
> - ioctl(fd_ep, RPMSG_DESTROY_EPT_IOCTL)
> - close(fd_ep)
> - close(fd)
> 
> This /dev/rpmsgY abstraction is less favorable for:
> - Performance issue: It's time consuming for some operations are
> invovled:
>   - Device node creation.
>     Depends on specific config, especially CONFIG_DEVTMPFS, the overall
>     overhead is based on coordination between DEVTMPFS and userspace
>     tools such as udev and mdev.
> 
>   - Extra kernel-space switch cost.
> 
>   - Other major costs brought by heavy-weight logic like device_add().
> 
> - /dev/rpmsgY node can be opened only once. It doesn't make much sense
>     that a dynamically created device node can be opened only once.
> 
> - For some container application such as docker, a client can't access
>   host's dev unless specified explicitly. But in case of /dev/rpmsgY, which
>   is generated dynamically and whose existence is unknown for clients in
>   advance, this uAPI based on device node doesn't fit well.
> 
> An anon inode based approach is introduced to address the issues above.
> Rather than generating device node and opening it, rpmsg code just make
> a anon inode representing eptdev and return the fd to userspace.

Please change occurences of "anon" for "anonyous".  "Anon" was used to avoid
writing "anonymous" all the time in the code, but description should not use the
shorthand.  In the title, this patch and all other patches.

> 
> The legacy abstraction based on struct dev and struct cdev is honored
> for:
> - Avoid legacy uAPI break(RPMSG_CREATE_EPT_IOCTL)
> - Reuse existing logic:
>   -- dev_err() and friends.
>   -- Life cycle management of struct device.
> 
> Signed-off-by: Dawei Li <dawei.li@linux.dev>
> ---
>  drivers/rpmsg/rpmsg_char.c | 80 ++++++++++++++++++++++++++------------
>  1 file changed, 56 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index eec7642d2686..5b2a883d6236 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -91,7 +91,8 @@ int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data)
>  	/* wake up any blocked readers */
>  	wake_up_interruptible(&eptdev->readq);
>  
> -	cdev_device_del(&eptdev->cdev, &eptdev->dev);
> +	if (eptdev->dev.devt)
> +		cdev_device_del(&eptdev->cdev, &eptdev->dev);
>  	put_device(&eptdev->dev);
>  
>  	return 0;
> @@ -132,21 +133,17 @@ static int rpmsg_ept_flow_cb(struct rpmsg_device *rpdev, void *priv, bool enable
>  	return 0;
>  }
>  
> -static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
> +static int __rpmsg_eptdev_open(struct rpmsg_eptdev *eptdev)
>  {
> -	struct rpmsg_eptdev *eptdev = cdev_to_eptdev(inode->i_cdev);
>  	struct rpmsg_endpoint *ept;
>  	struct rpmsg_device *rpdev = eptdev->rpdev;
>  	struct device *dev = &eptdev->dev;
>  
> -	mutex_lock(&eptdev->ept_lock);
>  	if (eptdev->ept) {
> -		mutex_unlock(&eptdev->ept_lock);
>  		return -EBUSY;
>  	}
>  
>  	if (!eptdev->rpdev) {
> -		mutex_unlock(&eptdev->ept_lock);
>  		return -ENETRESET;
>  	}
>  
> @@ -164,21 +161,32 @@ static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
>  	if (!ept) {
>  		dev_err(dev, "failed to open %s\n", eptdev->chinfo.name);
>  		put_device(dev);
> -		mutex_unlock(&eptdev->ept_lock);
>  		return -EINVAL;
>  	}
>  
>  	ept->flow_cb = rpmsg_ept_flow_cb;
>  	eptdev->ept = ept;
> -	filp->private_data = eptdev;
> -	mutex_unlock(&eptdev->ept_lock);
>  
>  	return 0;
>  }
>  
> -static int rpmsg_eptdev_release(struct inode *inode, struct file *filp)
> +static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
>  {
>  	struct rpmsg_eptdev *eptdev = cdev_to_eptdev(inode->i_cdev);
> +	int ret;
> +
> +	mutex_lock(&eptdev->ept_lock);
> +	ret = __rpmsg_eptdev_open(eptdev);
> +	if (!ret)
> +		filp->private_data = eptdev;
> +	mutex_unlock(&eptdev->ept_lock);
> +
> +	return ret;
> +}
> +
> +static int rpmsg_eptdev_release(struct inode *inode, struct file *filp)
> +{
> +	struct rpmsg_eptdev *eptdev = filp->private_data;
>  	struct device *dev = &eptdev->dev;
>  
>  	/* Close the endpoint, if it's not already destroyed by the parent */
> @@ -400,12 +408,13 @@ static void rpmsg_eptdev_release_device(struct device *dev)
>  	struct rpmsg_eptdev *eptdev = dev_to_eptdev(dev);
>  
>  	ida_free(&rpmsg_ept_ida, dev->id);
> -	ida_free(&rpmsg_minor_ida, MINOR(eptdev->dev.devt));
> +	if (eptdev->dev.devt)
> +		ida_free(&rpmsg_minor_ida, MINOR(eptdev->dev.devt));
>  	kfree(eptdev);
>  }
>  
> -static struct rpmsg_eptdev *rpmsg_chrdev_eptdev_alloc(struct rpmsg_device *rpdev,
> -						      struct device *parent)
> +static struct rpmsg_eptdev *__rpmsg_chrdev_eptdev_alloc(struct rpmsg_device *rpdev,
> +							struct device *parent, bool cdev)


I would simply rename this rpmsg_eptdev_alloc() and then use is in
rpmsg_chrdev_eptdev_alloc() and rpmsg_anonynous_eptdev_alloc()

>  {
>  	struct rpmsg_eptdev *eptdev;
>  	struct device *dev;
> @@ -428,33 +437,50 @@ static struct rpmsg_eptdev *rpmsg_chrdev_eptdev_alloc(struct rpmsg_device *rpdev
>  	dev->groups = rpmsg_eptdev_groups;
>  	dev_set_drvdata(dev, eptdev);
>  
> -	cdev_init(&eptdev->cdev, &rpmsg_eptdev_fops);
> -	eptdev->cdev.owner = THIS_MODULE;
> +	if (cdev) {
> +		cdev_init(&eptdev->cdev, &rpmsg_eptdev_fops);
> +		eptdev->cdev.owner = THIS_MODULE;
> +	}
>  
>  	return eptdev;
>  }
>  
> -static int rpmsg_chrdev_eptdev_add(struct rpmsg_eptdev *eptdev, struct rpmsg_channel_info chinfo)
> +static struct rpmsg_eptdev *rpmsg_chrdev_eptdev_alloc(struct rpmsg_device *rpdev,
> +						      struct device *parent)
> +{
> +	return __rpmsg_chrdev_eptdev_alloc(rpdev, parent, true);
> +}
> +
> +static int __rpmsg_chrdev_eptdev_add(struct rpmsg_eptdev *eptdev,
> +				     struct rpmsg_channel_info chinfo, bool cdev)

Same here, rpmsg_eptdev_add()

>  {
>  	struct device *dev = &eptdev->dev;
>  	int ret;
>  
>  	eptdev->chinfo = chinfo;
>  
> -	ret = ida_alloc_max(&rpmsg_minor_ida, RPMSG_DEV_MAX - 1, GFP_KERNEL);
> -	if (ret < 0)
> -		goto free_eptdev;
> -	dev->devt = MKDEV(MAJOR(rpmsg_major), ret);
> +	if (cdev) {
> +		ret = ida_alloc_max(&rpmsg_minor_ida, RPMSG_DEV_MAX - 1, GFP_KERNEL);
> +		if (ret < 0)
> +			goto free_eptdev;
>  
> +		dev->devt = MKDEV(MAJOR(rpmsg_major), ret);
> +	}
> +
> +	/* Anon inode device still need dev name for dev_err() and friends */
>  	ret = ida_alloc(&rpmsg_ept_ida, GFP_KERNEL);
>  	if (ret < 0)
>  		goto free_minor_ida;
>  	dev->id = ret;
>  	dev_set_name(dev, "rpmsg%d", ret);
>  
> -	ret = cdev_device_add(&eptdev->cdev, &eptdev->dev);
> -	if (ret)
> -		goto free_ept_ida;
> +	ret = 0;
> +
> +	if (cdev) {
> +		ret = cdev_device_add(&eptdev->cdev, &eptdev->dev);
> +		if (ret)
> +			goto free_ept_ida;
> +	}
>  
>  	/* We can now rely on the release function for cleanup */
>  	dev->release = rpmsg_eptdev_release_device;
> @@ -464,7 +490,8 @@ static int rpmsg_chrdev_eptdev_add(struct rpmsg_eptdev *eptdev, struct rpmsg_cha
>  free_ept_ida:
>  	ida_free(&rpmsg_ept_ida, dev->id);
>  free_minor_ida:
> -	ida_free(&rpmsg_minor_ida, MINOR(dev->devt));
> +	if (cdev)
> +		ida_free(&rpmsg_minor_ida, MINOR(dev->devt));
>  free_eptdev:
>  	put_device(dev);
>  	kfree(eptdev);
> @@ -472,6 +499,11 @@ static int rpmsg_chrdev_eptdev_add(struct rpmsg_eptdev *eptdev, struct rpmsg_cha
>  	return ret;
>  }
>  
> +static int rpmsg_chrdev_eptdev_add(struct rpmsg_eptdev *eptdev, struct rpmsg_channel_info chinfo)
> +{
> +	return __rpmsg_chrdev_eptdev_add(eptdev, chinfo, true);
> +}
> +
>  int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
>  			       struct rpmsg_channel_info chinfo)
>  {
> -- 
> 2.25.1
> 
