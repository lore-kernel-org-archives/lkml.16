Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5CE15E5B8
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 17:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738950348; cv=none; b=peQWBNKuO6KKyIQKea6+AEccTDj+RfnSxPhxNg476CnbJE8E/5aWFBpLBeiwQPbmQzw0GIcXAukOLPForWgCwicbVDZbBHZqOSfsZnzek6OnX9clyuj6Ph5WVzFLxIaTBrSdh0FMthd8IqNUr35XIcQ+ZwOFS0W3OJ40EALt5YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738950348; c=relaxed/simple;
	bh=1n2D3kbQu/2T1snSz3XeOWiwdrifTmgl1iDSxF4sG+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g5A+uq2LgtEt/vdEafmOYvOz2A3GGRSaMJgYZCyEr9pT1RHEOaYOauQszIiV0I1mZFh8lo6O7bx79fjv/pG8YwdM2jjkePyT6WKxP652nMj2FBiJxqF7/SVQnayhAHf2wQt1aymLkUkh+yzBCwjvWm8gAN7r8U9BdmPWjodxkDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MTtwxVsg; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MTtwxVsg"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21670dce0a7so56733905ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 09:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738950346; x=1739555146; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z+JB3bnwSE6+9YUnxotFUzDTAjUGU19z7ZryXPIUrCo=;
        b=MTtwxVsgB6mKlJDT2tPwyyPvYnluDtDt99QxkU+DxrVm8mgcA66orJ1wDXMmz3kpBD
         VmFVugIvXnbmsF+jURAqYUGrUO4NU8i06/98trKO7JEATni5Ev6UWu2DEOwui9Z5Rw/t
         EXVCqLYplEUpYY3M+Ylt/WrbnE67FliwDWEMrh5BiP101BXcIh3sdEmPzXyEhLjvw8cY
         9/9CIOv3+11I4qp9TKRZpHSqzeNqp4EfHPeVL9gknUvggL4bhxSgRHIe8EvGyLO6lJhq
         JKbZiIiSEBC1FSHvb0V3EBgOCmJlDCZazJH/EmmrUeqhNuynSZR+6EGEJ+LYar9KdBo/
         nm/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738950346; x=1739555146;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z+JB3bnwSE6+9YUnxotFUzDTAjUGU19z7ZryXPIUrCo=;
        b=WnMbowHFvjrb/tABUgMjVsAY0AvSxxjSLt44TXe5WRnbhK6IfGQoiXJzMac//sVSJk
         sTy2PwNh60XN26FzbKveoA3XLd2LSFqzWJHVdi4HSe2qs/vSSTVuIrjltsiQGMiRCnxd
         E3Rz+MbnAAHulw1QjirMRLRsrbmsmdCdCuD20XbFiRltIFSHdKdXSaCRXOcjAReq4ZRs
         XnzJQKcjEii3rqo1z3UlE8KtrtiO7BPqSVzhJMwfl21OEy42TR65E4CYAZXeGjcIte/s
         krzlsH9G7iDIYlRsAW1MjaXLz532H/DDh+AcNFFmzNNofPb9oOeduQMpTcWJIj+BYVit
         b85w==
X-Forwarded-Encrypted: i=1; AJvYcCWNQl10MFrcN04CVwy27kGKx328jqt7mNx58g+WfjQCYrvW9AIqAvlT5jJaV7b05SPdtyFmuUmtMQfrf28=@vger.kernel.org
X-Gm-Message-State: AOJu0YyucY8uNgNmizD5ewI1DQnKfCXQ9rZzRaoB4ViJuDp7ckUBokmt
	ebeg9/NMIfsO6yEe+wcVIBfMPD1moZ3e2yyrKxOw3VryxNxf5lelzp6HqdU6JQ==
X-Gm-Gg: ASbGncuPg1SFfJ6KVjseVW8i9k1YKK7nRRVX3dnPvdQWK/RFB+v8z99ss3iNp9N0cGR
	WXWRmkWWjfZ9zyRCE7hgSUTe27TkJmuuENHLhNoAHkWU/P8B/XZrgBK9aLC5//4O6s1CjqWzvEu
	JBwvk86hTSiTsOTpadbDBBpnNIQ0BEU527vrO65ljaVlkSA8dux07TKPLAbu6iiYYXKuzmeCixM
	MpCv2l25hZwKhjjd9QEn2+tzqhkQDVnF3u1ltKzYL8Hk4KKP2aR1OZ+llFQ+bJDqX1YV8CKWnu0
	FXmHRnn3oo1ydmKm9BJEkF6X5w==
X-Google-Smtp-Source: AGHT+IG+Cl8Ot1QSlDFwyezPC8kwSDkMJLbgZ64PcdAQ30MNdRJAiOTPikSW9UMmgUO6SsuhjU56HQ==
X-Received: by 2002:a05:6a20:4386:b0:1e1:b727:181a with SMTP id adf61e73a8af0-1ee03a8f420mr8506711637.24.1738950346087;
        Fri, 07 Feb 2025 09:45:46 -0800 (PST)
Received: from thinkpad ([120.60.76.168])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad51aebb9f4sm2919278a12.9.2025.02.07.09.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 09:45:45 -0800 (PST)
Date: Fri, 7 Feb 2025 23:15:42 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: linux@treblig.org
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: Remove unused functions
Message-ID: <20250207174542.mewk2gvxq6mxjiwz@thinkpad>
References: <20250127215859.261105-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250127215859.261105-1-linux@treblig.org>

On Mon, Jan 27, 2025 at 09:58:59PM +0000, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> mhi_device_get() and mhi_queue_dma() haven't been used since 2020's
> commit 189ff97cca53 ("bus: mhi: core: Add support for data transfer")
> added them.
> 
> Remove them.
> 
> Note that mhi_queue_dma_sync() is used and has been left.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Applied to mhi-next!

- Mani

> ---
>  drivers/bus/mhi/host/main.c | 19 -------------------
>  drivers/bus/mhi/host/pm.c   | 14 --------------
>  include/linux/mhi.h         | 18 ------------------
>  3 files changed, 51 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> index 4de75674f193..4c91ffd6ed0e 100644
> --- a/drivers/bus/mhi/host/main.c
> +++ b/drivers/bus/mhi/host/main.c
> @@ -1181,25 +1181,6 @@ int mhi_queue_skb(struct mhi_device *mhi_dev, enum dma_data_direction dir,
>  }
>  EXPORT_SYMBOL_GPL(mhi_queue_skb);
>  
> -int mhi_queue_dma(struct mhi_device *mhi_dev, enum dma_data_direction dir,
> -		  struct mhi_buf *mhi_buf, size_t len, enum mhi_flags mflags)
> -{
> -	struct mhi_chan *mhi_chan = (dir == DMA_TO_DEVICE) ? mhi_dev->ul_chan :
> -							     mhi_dev->dl_chan;
> -	struct mhi_buf_info buf_info = { };
> -
> -	buf_info.p_addr = mhi_buf->dma_addr;
> -	buf_info.cb_buf = mhi_buf;
> -	buf_info.pre_mapped = true;
> -	buf_info.len = len;
> -
> -	if (unlikely(mhi_chan->pre_alloc))
> -		return -EINVAL;
> -
> -	return mhi_queue(mhi_dev, &buf_info, dir, mflags);
> -}
> -EXPORT_SYMBOL_GPL(mhi_queue_dma);
> -
>  int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
>  			struct mhi_buf_info *info, enum mhi_flags flags)
>  {
> diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
> index 11c0e751f223..2fb27e6f8f88 100644
> --- a/drivers/bus/mhi/host/pm.c
> +++ b/drivers/bus/mhi/host/pm.c
> @@ -1296,20 +1296,6 @@ int mhi_force_rddm_mode(struct mhi_controller *mhi_cntrl)
>  }
>  EXPORT_SYMBOL_GPL(mhi_force_rddm_mode);
>  
> -void mhi_device_get(struct mhi_device *mhi_dev)
> -{
> -	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
> -
> -	mhi_dev->dev_wake++;
> -	read_lock_bh(&mhi_cntrl->pm_lock);
> -	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
> -		mhi_trigger_resume(mhi_cntrl);
> -
> -	mhi_cntrl->wake_get(mhi_cntrl, true);
> -	read_unlock_bh(&mhi_cntrl->pm_lock);
> -}
> -EXPORT_SYMBOL_GPL(mhi_device_get);
> -
>  int mhi_device_get_sync(struct mhi_device *mhi_dev)
>  {
>  	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index 059dc94d20bb..dd372b0123a6 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -720,12 +720,6 @@ enum mhi_state mhi_get_mhi_state(struct mhi_controller *mhi_cntrl);
>   */
>  void mhi_soc_reset(struct mhi_controller *mhi_cntrl);
>  
> -/**
> - * mhi_device_get - Disable device low power mode
> - * @mhi_dev: Device associated with the channel
> - */
> -void mhi_device_get(struct mhi_device *mhi_dev);
> -
>  /**
>   * mhi_device_get_sync - Disable device low power mode. Synchronously
>   *                       take the controller out of suspended state
> @@ -776,18 +770,6 @@ int mhi_prepare_for_transfer_autoqueue(struct mhi_device *mhi_dev);
>   */
>  void mhi_unprepare_from_transfer(struct mhi_device *mhi_dev);
>  
> -/**
> - * mhi_queue_dma - Send or receive DMA mapped buffers from client device
> - *                 over MHI channel
> - * @mhi_dev: Device associated with the channels
> - * @dir: DMA direction for the channel
> - * @mhi_buf: Buffer for holding the DMA mapped data
> - * @len: Buffer length
> - * @mflags: MHI transfer flags used for the transfer
> - */
> -int mhi_queue_dma(struct mhi_device *mhi_dev, enum dma_data_direction dir,
> -		  struct mhi_buf *mhi_buf, size_t len, enum mhi_flags mflags);
> -
>  /**
>   * mhi_queue_buf - Send or receive raw buffers from client device over MHI
>   *                 channel
> -- 
> 2.48.1
> 

-- 
மணிவண்ணன் சதாசிவம்
