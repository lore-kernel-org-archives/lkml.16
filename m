Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF5B27C178
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 13:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745500097; cv=none; b=SpEbar1SwUk07PB1RkekpVtbmPKiCBbrm51tj19grJQLJV4+arf+TwZo5bFVsQKlbF3EqKbiMbJcAApAsGo2AYXlrgsn6pcbafb2b0LQftQubIjwLUQMtITzDD/fzFcsRqS9Xs98kFCjEtLCjf2x4Z6uNquEI8mqlKj7pmUiIoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745500097; c=relaxed/simple;
	bh=dBh43d05JPaTFzI4tVAr4KW3VJiwFVSs07sUTiMBl3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NHUQ2Pj6cvcvYFwWtgRAp9v6AdSYPu4PxsFCHwSL3nYF86Qexk31VWXrpEqdUWtVu9uICx0Rz8IgRYA4Vl1by8PYGRYt0DptBiQrDQvgbG/y/54P8nZEdgPm+84pzZd2/5VuwdzmwJDu5i/NYjYGVH/XLCHF8QScxv62bardksU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=gmc2XK7y; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="gmc2XK7y"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c59e7039eeso146059985a.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 06:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1745500094; x=1746104894; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t9tjejH+aT/nxyoiEDM11iJSGPvdQo5zscD8cSUP0nQ=;
        b=gmc2XK7ywcHfJhe7Xx9/im0XXRHXrVay6vPULQELd4jmwYurJ6swWAB2Mm6HSTSg9M
         8tSirpMIBuBrqE/dt0wk+No3C5395so8+zQ9TJFRwSYnAOk4sMx8YPJRyCDKEi/gj19b
         //SyDxACsXkSDkc+KEf3RPc2Z2CVctAiER8Xjg/fHSWz8dT6Yb9MeIy5O/FVHy34LBeZ
         9qrlbzJP6MlTxLVzhIYsW2/XvSIn22aY8Hnqf40MrGBNs4/kKn6DVysvxFnq544XGysG
         CSpwLMPbjonk5Xog8xD4qFTsO4dR17F6j/l/3cFaNsX0PI8/mIQgkGA9ELrRoXu5vwkx
         3QVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745500094; x=1746104894;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t9tjejH+aT/nxyoiEDM11iJSGPvdQo5zscD8cSUP0nQ=;
        b=Rcoy6pNlSPvTCjl+zvw4n5vZETbLQ8m73/3JNlVagO8AbvI3vId4iCv2t+BYGvPgeU
         Zh5r8IjHf5VCuz24NLNkn9ZnpiW06SysHvSu+S+UVmpWZH8lCl3C9b4DH3p39T8CFFAj
         UL3pMZFOLk4h146bk5/9waSrWE5xIEQUbx7lCBmHY4A6zGgEG9YBP3y+gMCpUsKIyeNN
         KG917kOacqzGvtOGCt4jQd7qKXzTFSYlI8j54kfgSwbwKoKhktWspOncXjo97zisiPwe
         bwu4DKXaGP67fypE6kGmnYIVgtacaiiFZ4Fav2JWGP5S4opfqcmYEzzR9Bd8u2SMDApj
         lyCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVk0bnD8R0kpPfZvnfLYoGtG1nsj4bC7Gwp6/ah5zv1P/4/yGTZMJ5E1yRp5sQ9oXCt181zMqjoIIAAPSY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzagY6AEheXARJT90XLdO525FmnG3BrAtOc0F3Ij+VbRrV5Ht02
	ovFLb1qrM3tw7VUEh/ggcMzTq+d60JmWM1Yw6DFah2nWR8ckfuec6gtHgmzZlo0=
X-Gm-Gg: ASbGnctlLoC6N2wzj0izdisqG6MwRLBn2NezDxzg5Jx9MPvl6HGqAGyHge8Yv2si+BX
	8lDZUW0io9Vs8aO4/mZ9Bbi/y96NjUpqaSjV9ddpdAxSgfPZvS0hp8PrRfg6qVr3IwLIfhCMwRK
	lTCPZDdTkYBNLKILUPnyNd8ccWDqslkr+35q/BKZRRVJUlXSHZC5XNwsff5fkEwXZeSAnZ7JYC+
	xYi9kr55l2T6abQqZywiU68IDoitN/EbBn90LO9sQu6oUl4rztjjPLy+T4CihJOoRZAd9NFOJGC
	ci3vD5jsfGqqf51UcDD5UoBwxgBm5YgbciHS5zefJedZscRWnlH2+Us5tlgS6vNFI9riiKFE4D5
	LByKUhcUvdFlbtM3mcTs=
X-Google-Smtp-Source: AGHT+IFf1O6xGhdHKl6+2HV6nVAPSFzlmWIRSiCQgOhIrXIGUIOWfO/3KcZH+AEpqhBBAwnRKtBRCg==
X-Received: by 2002:a05:620a:2442:b0:7c5:5296:55be with SMTP id af79cd13be357-7c956ede013mr373709185a.27.1745500094571;
        Thu, 24 Apr 2025 06:08:14 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958c92188sm85129885a.23.2025.04.24.06.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 06:08:13 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1u7wJJ-00000007U7r-1YtD;
	Thu, 24 Apr 2025 10:08:13 -0300
Date: Thu, 24 Apr 2025 10:08:13 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Abhijit Gangurde <abhijit.gangurde@amd.com>
Cc: shannon.nelson@amd.com, brett.creeley@amd.com, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	corbet@lwn.net, leon@kernel.org, andrew+netdev@lunn.ch,
	allen.hubbe@amd.com, nikhil.agarwal@amd.com,
	linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andrew Boyer <andrew.boyer@amd.com>
Subject: Re: [PATCH 08/14] RDMA/ionic: Register auxiliary module for ionic
 ethernet adapter
Message-ID: <20250424130813.GZ1213339@ziepe.ca>
References: <20250423102913.438027-1-abhijit.gangurde@amd.com>
 <20250423102913.438027-9-abhijit.gangurde@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423102913.438027-9-abhijit.gangurde@amd.com>

On Wed, Apr 23, 2025 at 03:59:07PM +0530, Abhijit Gangurde wrote:
> +static int ionic_aux_probe(struct auxiliary_device *adev,
> +			   const struct auxiliary_device_id *id)
> +{
> +	struct ionic_aux_dev *ionic_adev;
> +	struct net_device *ndev;
> +	struct ionic_ibdev *dev;
> +
> +	ionic_adev = container_of(adev, struct ionic_aux_dev, adev);
> +	ndev = ionic_api_get_netdev_from_handle(ionic_adev->handle);

It must not do this, the net_device should not go into the IB driver,
like this that will create a huge complex tangled mess.

The netdev(s) come in indirectly through the gid table and through the
net notifiers and ib_device_set_netdev() and they should only be
touched in paths dealing with specific areas.

So don't use things like netdev_err, we have ib_err/dev_err and
related instead for IB drivers to use.

> +struct ionic_ibdev {
> +	struct ib_device	ibdev;
> +
> +	struct device		*hwdev;
> +	struct net_device	*ndev;

Same here, this member should not exist, and it didn't hold a
refcount for this pointer.

Jason
