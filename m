Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EBB298CC6
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 20:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747340718; cv=none; b=D1NvMM7uRN+Xt+pikEcEu9Y3U2If7cEUyG/xRs1AiQRJCOQAUQUll953KcuQkY9aIzsyo+nGdSa/LatyOlgMLYeL+qO883tBBtrpHHwz1J5v4HAluD9ASEa9RBwclqcBapVDCS4ObhF7jpKZM298iyU7BdrXIQfGRoJIqMHmzHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747340718; c=relaxed/simple;
	bh=cEMlm+36YbPPJ9hANH6fcWzYz4CWIwOAXvDkXtiIIpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MBh5eLGh4/WjbcDRZsaSc6J7UWj/RLQabWTaE96+LiCciTp1v0TTb8CK1CqOfGxLq5PL8bpVwIjttxK058ZjYtkca6GF742be9bEdkCTlPb245SXzgtGJieh+yKXA6U0XUdbRjtZOnk5hlXwXc3BRySwrBJRqNtEaqFMQViAgF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oyfdx/tg; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oyfdx/tg"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22e45088d6eso17039495ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 13:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747340716; x=1747945516; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zUTfWForHlbZrJBv1cAxwqbk62WlolptWTpwwDZry+A=;
        b=oyfdx/tgvwOZSqHmy5qDSJcJBFsEiCgGTLd8hbPsSUHX28Q5m1c5+HdYVrU9NVU3hz
         YJdCPaZYTAMoPCaMwumWKfbJaeOYbphJ3hrYk/kZo3t5zWT+rc7DHtELfm3Cc+GKHn7l
         YPfHurVH/m5DvN8CYpib/ujWUlW+1ipNQvJTQlleg4qroWn78zOsYCtno89y/oDPH1K9
         U11/hUdFnZozOJ2roq5vOdZCipRPR46SuWaru51XIn7V4yJPPDx/ibQOe6bSVa4/gkvu
         j8lOuOUWv2nHZva3bpe5qcS4CxsKYuvCzvVbUWIEzT+WMqSeyhXKRyLND9IcL60sghdn
         Rizw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747340716; x=1747945516;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zUTfWForHlbZrJBv1cAxwqbk62WlolptWTpwwDZry+A=;
        b=YU9FavXxLoWVm2S4AwQss5BIPXVh3pMd0AV4hYpq5ysKIpqojrUcmERyDsrEav+Gjt
         9GW+yoT3lqEuuZsz+6MO9czXj9efyEIK4UQcaO8MLKk8bwSNIvSzXhkY4yKkCzVYXZr6
         2YYPugu7Q4Zk0U8fTO2/Lu3qgV1/KwHaHFGh2cwlgEF1vmV/pmdrj1+/L6gSUWDhRBXt
         CZTB7kDRgszbTvkxItixY8G+gv0NiAaFlOJ6oTXrfEdbZKTs1zqH+lelM2k03PyKhtmK
         6VDy4XPHd4QQDa+R/zKwfSdSEPaRmrhXwwJ5/biGjr2Gp2IqDB2CUJHVNXGRQYTwMdU8
         sPSQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8QAhQ7nrTWeAHCbATuJhtLjzt6GLbYRdf2FASwU7uR/9Gz+CLRiJqcTOfwOj9tDFyb5+ehAbfRnAjXN4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxdmWRLNXu30pn7JqM0MFT3g6jHFmnKnCLBYJsKfZt4TKjGocc
	Ys/Jkk58Se411uocYlRpHCm3bI/AaccBPin6l/BlW5f76uqiX8IcrE5zMfDmzrcsSEZv8r4xZ59
	WZApi
X-Gm-Gg: ASbGnct6UiTL+j706RhqsdYvUfPAFR+lthFR3ufm1C2mb1sL7WQrm39RdqZEr5WaeYo
	ldUm5yQMX+fhTo1v08ASb0ut4DMfaHQOGzuBPLil6vhmsXWPI7ZBWM/3236MIvyuO3g3s/Uuljp
	K7+zDdotxojxV2mwv0crkBNEWRTEjxKn192fBusUUaGEsK381awOHKWsl3hFVq9U70W/4y112mx
	r/YE0ALwHOu7AAol6Ouag40hIsc3oOABqmGUmbgEqloK52IihA0GJH/5C5ipiE0WClR0E8NG/6Q
	o6pqjKTyQHFehlp+SV0BaC/VR90swnpDwIVPjBRiP7QH1VGcSxKTYV8=
X-Google-Smtp-Source: AGHT+IH7u31BXIHf5hNai5YAN/j8hWa4qZF2kgL+u1GNmBbTs/yeUNpckzK4SUgqojO2Yx9Bj5NmpQ==
X-Received: by 2002:a17:903:b8f:b0:224:c76:5e57 with SMTP id d9443c01a7336-231d459bee3mr8271575ad.39.1747340715957;
        Thu, 15 May 2025 13:25:15 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:1d7a:b4f2:fe56:fa4e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4b017b0sm1879275ad.95.2025.05.15.13.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 13:25:15 -0700 (PDT)
Date: Thu, 15 May 2025 14:25:13 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Dawei Li <dawei.li@linux.dev>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, set_pte_at@outlook.com
Subject: Re: [PATCH v2 2/3] rpmsg: char: Implement eptdev based on anon inode
Message-ID: <aCZNqVbGKa_EaCBT@p14s>
References: <20250509155927.109258-1-dawei.li@linux.dev>
 <20250509155927.109258-3-dawei.li@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509155927.109258-3-dawei.li@linux.dev>

On Fri, May 09, 2025 at 11:59:26PM +0800, Dawei Li wrote:
> Introduce new eptdev abstraction based on anon inode. The new API is
> exactly same with legacy one except:
> 
> - It's anonymous and devnode/path free.
> - Its fops->open() is empty.
> 
> Signed-off-by: Dawei Li <dawei.li@linux.dev>
> ---
>  drivers/rpmsg/rpmsg_char.c | 44 ++++++++++++++++++++++++++++++++++++++
>  drivers/rpmsg/rpmsg_char.h | 19 ++++++++++++++++
>  2 files changed, 63 insertions(+)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 5b2a883d6236..b0ec05f88013 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -13,6 +13,7 @@
>  
>  #define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
>  
> +#include <linux/anon_inodes.h>
>  #include <linux/cdev.h>
>  #include <linux/device.h>
>  #include <linux/fs.h>
> @@ -517,6 +518,49 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
>  }
>  EXPORT_SYMBOL(rpmsg_chrdev_eptdev_create);
>  
> +static const struct file_operations rpmsg_eptdev_anon_fops = {
> +	.owner = THIS_MODULE,
> +	.release = rpmsg_eptdev_release,
> +	.read_iter = rpmsg_eptdev_read_iter,
> +	.write_iter = rpmsg_eptdev_write_iter,
> +	.poll = rpmsg_eptdev_poll,
> +	.unlocked_ioctl = rpmsg_eptdev_ioctl,
> +	.compat_ioctl = compat_ptr_ioctl,
> +};
> +
> +int rpmsg_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
> +			struct rpmsg_channel_info chinfo, int *pfd)

rpmsg_anonymous_eptdev_create()

> +{
> +	struct rpmsg_eptdev *eptdev;
> +	int ret, fd;
> +
> +	eptdev = __rpmsg_chrdev_eptdev_alloc(rpdev, parent, false);
> +	if (IS_ERR(eptdev))
> +		return PTR_ERR(eptdev);
> +
> +	ret =  __rpmsg_chrdev_eptdev_add(eptdev, chinfo, false);
> +	if (ret) {
> +		dev_err(&eptdev->dev, "failed to add %s\n", eptdev->chinfo.name);
> +		return ret;
> +	}
> +
> +	fd = anon_inode_getfd("rpmsg-eptdev", &rpmsg_eptdev_anon_fops, eptdev, O_RDWR | O_CLOEXEC);
> +	if (fd < 0) {
> +		put_device(&eptdev->dev);
> +		return fd;
> +	}
> +
> +	mutex_lock(&eptdev->ept_lock);
> +	ret = __rpmsg_eptdev_open(eptdev);
> +	mutex_unlock(&eptdev->ept_lock);
> +
> +	if (!ret)
> +		*pfd = fd;
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(rpmsg_eptdev_create);
> +
>  static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
>  {
>  	struct rpmsg_channel_info chinfo;
> diff --git a/drivers/rpmsg/rpmsg_char.h b/drivers/rpmsg/rpmsg_char.h
> index 117d9cbc52f0..8cc2c14537da 100644
> --- a/drivers/rpmsg/rpmsg_char.h
> +++ b/drivers/rpmsg/rpmsg_char.h
> @@ -19,6 +19,19 @@
>  int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
>  			       struct rpmsg_channel_info chinfo);
>  
> +/**
> + * rpmsg_eptdev_create() - register ep device and its associated fd based on an endpoint
> + * @rpdev:  prepared rpdev to be used for creating endpoints
> + * @parent: parent device
> + * @chinfo: associated endpoint channel information.
> + * @pfd: fd in represent of endpoint device
> + *
> + * This function create a new rpmsg endpoint device and its associated fd to instantiate a new
> + * endpoint based on chinfo information.
> + */
> +int rpmsg_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
> +			struct rpmsg_channel_info chinfo, int *pfd);
> +
>  /**
>   * rpmsg_chrdev_eptdev_destroy() - destroy created char device endpoint.
>   * @data: private data associated to the endpoint device
> @@ -36,6 +49,12 @@ static inline int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct
>  	return -ENXIO;
>  }
>  
> +static inline int rpmsg_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
> +				      struct rpmsg_channel_info chinfo, int *pfd)
> +{
> +	return -ENXIO;
> +}
> +
>  static inline int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data)
>  {
>  	return -ENXIO;
> -- 
> 2.25.1
> 
