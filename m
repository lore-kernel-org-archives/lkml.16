Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEBB254875
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 19:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745953272; cv=none; b=oKt61iPIG3aV+3wDRAyzJWeS1qPRUDaptZ7pEFZv1JJBdZS9/kALc+jff8/7tDP2glJGi3dC44X/VEJyYhxwx3uKbFISG5zjtwz16iVMacTFEeqRsFQbaHnk6g9FqdKzxd860B2eDEMHchHS/XEBDesUoA82MwCEyft+wvGx22A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745953272; c=relaxed/simple;
	bh=zlj30lyM4eVyR7FFYAFTYUbQXW6lBnZVNqgK8nT1pbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YPE31NamfR2okIxaAO6iG1xy6AvfBORyAF+6Fq4s3QEi1dA7cV3UXxQzU/bmrS2gtYqnB0sTuZT6d90G9uPrb7ZoNd8pC1UJLuN5fG5iJZ7/z5lLrwffo0EDodhO9hP1Y/WL65LhrgApvB8WHNaC26X94Yy4HRI+aZ8QfUcNhI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FPlSiVmX; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FPlSiVmX"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22401f4d35aso79312635ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 12:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745953270; x=1746558070; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zpGa+bckbuvJP7m5D/Txn2xIA7nwgAhG2SPr14XaYzs=;
        b=FPlSiVmXV2D2PiJFtjFaNxbF66bpD0hl/jRmRN5eFvPuwRlM/nAl1P3CXRqQuJilt/
         uW8BE3z+hvXBIbp245h+wBX/mghclEoQubdb+lpOWKgzGesrEteH4gyJUIhSvNpuQF8z
         hxUOU5sjGYdSUmR+BEHpOPUWwXwGG1sheifd8rqJO7dcyUh4ck7erGCN20g4tHtaXHo8
         wnSrX1ofzZgO9uNcqbe4/ngfi45UHGimdi599pSNVmhvezpHilmthV8DUyYp2MREb1AH
         61spxQv4bFNhU4dHgvth1wYTDZ5hvlJg+hO6nc6HLcUayDO8EpIU+9iinTmnmC8OQZjJ
         rERg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745953270; x=1746558070;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zpGa+bckbuvJP7m5D/Txn2xIA7nwgAhG2SPr14XaYzs=;
        b=jK0AndQtTQA4BFdAY8rpzs+HOSHhrvlmj3R8SBtPLgGttrBiY+rtoMbo/zKV2D3mON
         RKx0EsrZ7hpUhYx+cMlq5ULNeBg/eZysX0mDa4Hh67ONMgUrhAEJIAOhtpCJTgAgN2zp
         DIiz5yjviWe+wy01xMeqXbEDJV65Z91HpNXI+7v2+oxqYVEhjwH9OYDpM4u9+vmUFDmY
         dnKulvbFuZbsByIP6WFCJyYREH4KxEp9B8kV6MG5jyON7pla8VutgY2dA9zZf4YTcG+e
         3ZrP1DAdoqzp+1a4iZ/MVv5PuDHzrlhaMK4wLyhVZN1HdpxpaEkzPI2brEDtRN9kQ9p5
         z9Ag==
X-Forwarded-Encrypted: i=1; AJvYcCVjQcirBcVb/305cbIHp2zaGazd5XvchJff2bUm/4elMeKYQ/88cKD77RG6UbOGTvsPnCNbbt8Zki3iJxw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4o2gC8YCgusTcXHlcsJ/XOCU4grcPNx93XNT8ia4MsNIcXUb2
	bhHbw6ukOGA/ZdW0rzJO4MLlABFDn+CGzAMkGuNRtm5zn3Q3ZCIQaNvKtRoK6co=
X-Gm-Gg: ASbGncudZ+4zdnmFnfyK2dCfyrIH+7ybuMJ19xr2XHjZK8bHKYY8W/0ZJsF4AzzA9Aq
	2T9s+4kkbFxMwF+NbXepyLxfl1PiiyFrSWMLGYfm49bswITJ3RD6OJJJNJLYSJMoRnqsaZt0XNz
	jHRE8+kU7kPvYVLENi2T449Sz22/AytdAasXP+Hh4JC2ubwaT47tJf4pnwhxVP5fw/ibhQb1xeC
	BNMvtU6XoZoSaANerbKMHZ9G0NJqvl8Jhl43o2oWYi48PnLViriA3PotxuM3euv8kWfdhwS4bsI
	ofKvtubiPsjQk8CdHPHrFHibo6iR1J4qkrdmJKmk8JkY
X-Google-Smtp-Source: AGHT+IEVtr/yC0OCZi67VUcBjFX/DwSpKJBMPsUaSpQ0/mI7DQHTRu+gj3DdEoU3UGNpoATnJz1CiQ==
X-Received: by 2002:a17:90b:3809:b0:2ff:784b:ffe with SMTP id 98e67ed59e1d1-30a332f6e67mr387455a91.11.1745953270256;
        Tue, 29 Apr 2025 12:01:10 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:b7e6:7a64:93dc:60a1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d76edcsm106398905ad.12.2025.04.29.12.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 12:01:09 -0700 (PDT)
Date: Tue, 29 Apr 2025 13:01:07 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: linux@treblig.org
Cc: arnaud.pouliquen@foss.st.com, andersson@kernel.org, corbet@lwn.net,
	linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] rpmsg: Remove unused method pointers
 *send_offchannel
Message-ID: <aBEh85gDlaEywWtX@p14s>
References: <20250424142746.79062-1-linux@treblig.org>
 <20250424142746.79062-4-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424142746.79062-4-linux@treblig.org>

Hi,

On Thu, Apr 24, 2025 at 03:27:46PM +0100, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> After the previous patch, there are no implementers of the
> send_offchannel() and trysend_offchannel() methods.
> 
> Remove them.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  drivers/rpmsg/rpmsg_internal.h | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
> index 42c7007be1b5..397e4926bd02 100644
> --- a/drivers/rpmsg/rpmsg_internal.h
> +++ b/drivers/rpmsg/rpmsg_internal.h
> @@ -50,10 +50,8 @@ struct rpmsg_device_ops {
>   * @destroy_ept:	see @rpmsg_destroy_ept(), required
>   * @send:		see @rpmsg_send(), required
>   * @sendto:		see @rpmsg_sendto(), optional
> - * @send_offchannel:	see @rpmsg_send_offchannel(), optional
>   * @trysend:		see @rpmsg_trysend(), required
>   * @trysendto:		see @rpmsg_trysendto(), optional
> - * @trysend_offchannel:	see @rpmsg_trysend_offchannel(), optional
>   * @poll:		see @rpmsg_poll(), optional
>   * @set_flow_control:	see @rpmsg_set_flow_control(), optional
>   * @get_mtu:		see @rpmsg_get_mtu(), optional
> @@ -67,13 +65,9 @@ struct rpmsg_endpoint_ops {
>  
>  	int (*send)(struct rpmsg_endpoint *ept, void *data, int len);
>  	int (*sendto)(struct rpmsg_endpoint *ept, void *data, int len, u32 dst);
> -	int (*send_offchannel)(struct rpmsg_endpoint *ept, u32 src, u32 dst,
> -				  void *data, int len);
>  
>  	int (*trysend)(struct rpmsg_endpoint *ept, void *data, int len);
>  	int (*trysendto)(struct rpmsg_endpoint *ept, void *data, int len, u32 dst);
> -	int (*trysend_offchannel)(struct rpmsg_endpoint *ept, u32 src, u32 dst,
> -			     void *data, int len);
>  	__poll_t (*poll)(struct rpmsg_endpoint *ept, struct file *filp,
>  			     poll_table *wait);
>  	int (*set_flow_control)(struct rpmsg_endpoint *ept, bool pause, u32 dst);

I'm good with this patchset.  Can you fix the last paragraph in the comment for
function rpmsg_send_offchannel_raw() and remove the reference to "_offchannel"?

Thanks,
Mathieu

> -- 
> 2.49.0
> 
