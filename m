Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981EA277032
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 17:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749143101; cv=none; b=ihTeI3gWk3vFSulfkau6Q0SnU6pM1ijr4JRmYaHDkRt9a7t54Yebywi7fAkdcyBTXYAiGx3/bq+/AH3cH2kwh0/LvgkQEgIZkTNN1910xE0Be+M0eQ/lFyIFfBBBYxyuE5ZZUGJM5kTDjMMsiEdZwnu1IVY5jNtAtnkfUgT6xmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749143101; c=relaxed/simple;
	bh=+ztx+saxdpo8WjLXWjfvlFkWk9/y7B6T3vhKNHZol2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j40kZ3FgXUEReDmE0BchaIrUYFm3neTtNu8venwEA1C2PwBZ16ydv0OTOn/fGqCT7ol1lJDITFUpgu4mCXmicC/hcVPCs0fmPYrD4or08fWw5D4ZJS8FeSBc8ZF6nDMBFfKioNMRQ/c3jLcyUQwxMIsE/sj8qioX+t0LPHmFLrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=URpV1ayP; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="URpV1ayP"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-742c9907967so1197909b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 10:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749143098; x=1749747898; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SbbUkUUtWYP7VuElEDtlyDh5ofC9gH6hUBqQUj6UZLM=;
        b=URpV1ayPErWQO4AF2LZ/LMXXoUF5JhO0+TwoJmfzp4hbzHfTxjB1QUFgVk4TYWbLzd
         P2G3OViWygb88QfAXSN87owVHrJ+BVMpIAvK4yESvRlgCs7a1Wgdcx8jKSwhhC8uTy2O
         wK/XM4ZhQ4tXsja+RAhGMgtAAUpLhMj9oQz4fBomath34Q4s+Cc9V23KRthVblm6WBql
         AqEG+hkTCJU0nXmBqGiJw2XT2MjbuLCnC1bOiACpptqHbQMk07n1ZaK1u4GEoscNlodH
         gyzqCNnmaL7MilahS0SUwSDhLWSAXDyhQ75Aa106kHDr/MjRp2vTYCl4XW4i1u9wM5tC
         527Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749143098; x=1749747898;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SbbUkUUtWYP7VuElEDtlyDh5ofC9gH6hUBqQUj6UZLM=;
        b=vm4kEkI40groHacR00EZ3stWbhFhNhU70qpxLabUWqLhvP1AWQsqLoCWjvHRa6uRoe
         w1A61FFZLAL3m68hxmiq//YnXv03YbmY6eDCDCuzMavkX+CNOC4zCX3AyGzDzl8Ungf1
         xyuwEPCTgmfKxiGt/UOwk8XM/ArI1UpST/EOpM7wzTyTSRux7KAfHtxDItLEVPMOShgl
         FxOTWFesvvaDN1qn84bwJsk0kqAy437CHT3rNoF80+F5zA1WEufrrfftpMK7w7fvgiE4
         hKLfqvh5oy2bixK512dfbS6SSHQzQ/7pJKv7Id77IONGFr9M920SWbmXuzaSmQo5/j6v
         TW3w==
X-Forwarded-Encrypted: i=1; AJvYcCUiAKQncVnHGjtTc0VZB87ICW6FjioPiZavM2ks5t1ymt7A5R2ePErRgk1wtNXtnwsqXnu34Sz8qvdorsA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxM5t3jStID4NbtsmMS3XhY8kwFTeI7OK67FANcsOd1zmHY/fpa
	oCT7VUbvEVdBUGvzp5yE+uCqyUAS/X+Y8QVFDwEnlTik+6BU6OGQCjes1M+dJyikzg5UA4hANAr
	Db6M=
X-Gm-Gg: ASbGncvPNjscF65ejvOaD2LTzusF81rSNohozUYLvPDRz1n9BfIhgmY3LnZdu2ckxt0
	Yc001QXHaJwza6nheEs3JlIscrBk3EmWOW4Q9jQDdM00js+XtT7mWzIO/2pFH00xvJOQVUF/35T
	h5vwmnqePwxXbLXcuPJ0plpwvwyoPPYuwMmXB9ATSJugTeQAV+uEMwQE8H3ZBJOQSXt5RUvxf6H
	owe29aRKaeV5B095ysuez5Xd3ujz7zBVMaRJthoMWy9ehebCzfisrN8K2EzgtGSxRec9pMeVr/Q
	KXScQ2rtHbH52t3dSf24aPxbqMeS76YWoGJqwaHK4RYfeIZNf2KLVSwag/8r
X-Google-Smtp-Source: AGHT+IGUk6E7tZs4jvxQ/2qMmPkdZRrWLxZE7gyBNwvHo8bKeonXU/fKOmrVEc9T6w5FAgWfrpOsnw==
X-Received: by 2002:a05:6a00:2e24:b0:740:aa33:c6f8 with SMTP id d2e1a72fcca58-74827e73bb6mr648718b3a.7.1749143097742;
        Thu, 05 Jun 2025 10:04:57 -0700 (PDT)
Received: from thinkpad ([120.60.50.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afed4bafsm13054775b3a.79.2025.06.05.10.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 10:04:57 -0700 (PDT)
Date: Thu, 5 Jun 2025 22:34:50 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: jeff.hugo@oss.qualcomm.com, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, quic_bqiang@quicinc.com, 
	can.guo@oss.qualcomm.com, Mayank Rana <mayank.rana@oss.qualcomm.com>
Subject: Re: [PATCH v2] mhi: host: Add standard elf image download
 functionality
Message-ID: <sdhop6vyvt4y63tbbtorqfd5xa4ckbiwxdad5g6zzwlljqvd6q@eoaqmairdeey>
References: <20250603-standard_elf_image_load_support-v2-1-cce97644e99e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250603-standard_elf_image_load_support-v2-1-cce97644e99e@oss.qualcomm.com>

On Tue, Jun 03, 2025 at 02:05:44AM -0700, Qiang Yu wrote:
> From: Mayank Rana <mayank.rana@oss.qualcomm.com>
> 
> Currently, the FBC image is a non-standard ELF file that contains a single
> ELF header, followed by segments for SBL, RDDM, and AMSS. Some devices are
> unable to process this non-standard ELF format and therefore require
> special handling during image loading.
> 

What are those "some devices"? Why are they not able to process this format
which is used across the rest of the Qcom devices?

> Add standard_elf_image flag to determine whether the device can process
> the non-standard ELF format. If this flag is set, a standard ELF image
> must be loaded, meaning the first 512 KB of the FBC image should be
> skipped when loading the AMSS image over the BHIe interface.

Please explain what is present in the first 512KiB and why skipping that is
required.

> Note that
> this flag does not affect the SBL image download process.
> 
> Signed-off-by: Mayank Rana <mayank.rana@oss.qualcomm.com>
> Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
> Changes in v2:
> - V1 patch is paused because of no user. WLAN team plan to add support for
>   new WLAN chip that requires this patch, so send v2.
> - Change author and SOB with new mail address.
> - Reword commit message.
> - Place standard_elf_image flag after wake_set in struct mhi_controller
> - Link to v1: https://lore.kernel.org/mhi/1689907189-21844-1-git-send-email-quic_qianyu@quicinc.com/
> ---
>  drivers/bus/mhi/host/boot.c | 7 +++++++
>  include/linux/mhi.h         | 4 ++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> index efa3b6dddf4d2f937535243bd8e8ed32109150a4..f1686a8e0681d49f778838820b44f4c845ddbd1f 100644
> --- a/drivers/bus/mhi/host/boot.c
> +++ b/drivers/bus/mhi/host/boot.c
> @@ -584,6 +584,13 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  	 * device transitioning into MHI READY state
>  	 */
>  	if (fw_load_type == MHI_FW_LOAD_FBC) {
> +		dev_dbg(dev, "standard_elf_image:%s\n",
> +			(mhi_cntrl->standard_elf_image ? "True" : "False"));

This print is just a noise even for debug.

> +		if (mhi_cntrl->standard_elf_image) {
> +			fw_data += mhi_cntrl->sbl_size;
> +			fw_sz -= mhi_cntrl->sbl_size;

Is it possible to detect the image type during runtime instead of using a flag?
Also, the flag is currently unused. So it should come along an user.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
