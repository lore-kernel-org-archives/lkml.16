Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA661ADC68
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 16:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738425862; cv=none; b=LdMdjlc1kHqJ+//hj/pduj3f0O0G65aJVQk/APCkCeiIXA3JSTLt8GQRUxeet8fGWBwDtHW3BxXrCCz2VMyfiQtN/6QyS6RBhtU7mvLQIL11CTwkj2mi2wul9F6M4xtxuV64X6DXgdhpnimdvRIout23Y4iHVqZE9e1u535g2xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738425862; c=relaxed/simple;
	bh=KtceULTfdDsUj55KcdcM3ju2T2sUybiXtJOlp5XvovI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XJ7AVWpRw0WLGmGJ8iEaHp60Bv/bagNonIHmi6e78DpyU70KfPbZIlsX1m4W40ebmqNibQP1gQLkQ8P7KZf1AizKLZVry8bKo4cPuqIS3XShkNMFlkT5JYKM6Ea6g42zQZo99+mb97qwrLCGdYNhBn2AEb/FtUZ32l7fclZqO7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mK5NEsPp; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mK5NEsPp"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-216728b1836so50828045ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 08:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738425860; x=1739030660; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PD3elKhBBrhryeUJej2rhEevK6Z6OCKdP8pilTUiFmI=;
        b=mK5NEsPpeRXP2Y3zcj5i+5OayQvkkC/xv2fEl6YlSfCW4p9DyuaHlOpcPHXLjX3jOb
         dvcA4z8RG0muZAp9N1qCzPKtHnATNGAOOQ/bhRikSoWQfdTwO0s+Y/tTCHfvwTRZEV8s
         l6EnYkt8CcXfBFmiNlIDzumdpyrMzOa1BgnMX03+lzGOuFQUhYaZYZr62yrEpO8/jhmp
         fQrKRx6fexye3pEXsChPFLmbRXN1Se/qHgQPuU0s5JOuiWx1LnAkooX4FZbiOc3hJJs3
         OEwj/8vIcfgK3SaWcb7AxvJYsi3DssxfO+lnuK34bEPcx/qBSDSS+sKfu1Zzh8p0bl5i
         YavQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738425860; x=1739030660;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PD3elKhBBrhryeUJej2rhEevK6Z6OCKdP8pilTUiFmI=;
        b=xPdxwRPgdZ2JRpgw4FIUruRqC/lJ8ZYWTUj8MPVx4ujZWgkEwEWm82yweYH3FMx84d
         z/Fwv+s8VKQQjom/KxGSwCIA30wZC8jLI3zmxNJ2ZbL4zGOjBabADVK6E8hBVdqLuFoA
         hW4MOX1ng0eUCCW4aWjf3m+O69bt88paXzNJQi0iXl0djV/xHDWgX9GgTlza3gy21TEy
         xOF7vmTgihO5LP5StjonHycoW+lNnOiSD7AUH801yiAxKDJAXMyvEPCwACvg3OLJ6nwL
         vNRRMjOyfX72nIvmG4BY6VKCiOCil2UMqAPaec09JjW9il0bfWAQpDI1E5HcaCd4fWuV
         9zaA==
X-Forwarded-Encrypted: i=1; AJvYcCUAhOkLvrCoInJpr1Nc4EckYE+gUbZHTEROjOY45UrAlcfc7MGWGPZrgZK1zljb3gR3R/Zl2QOlUf393PQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFwTNPOtvUTDU2H2/dFBFQnG/ajwbFHLEjFCtXofftieU5QN3m
	RdiZkSYxejp6UPtWZgEGnBwGfjZBnKlunrLeERg4zONCfQCWNpSViK/W6SSClg==
X-Gm-Gg: ASbGnctLIplJAs390q7eIGnc/1qKXXXdYA3gW7Wq65yU5gtORKCZZNRQEYdpxRa7W0o
	mH942UBynvxCLGx3Kn0eYJeKNMV9Et68xa91m8N3limIstloJzTWrtNMLdUB+909Ky5/CZyFK6j
	PGtZxR57SsSLiMN/p7if+hjpARDPyUlf56nJ32mgMus7QzgzQvesgmljJFpOSeIPEJIJMvoeMYd
	DwKb88PiRmQ7u3HyuJ+PjxrHIrHJgcCoZdCr66GUFlbNENm9N+2EprFWNFLAx/QppLXj/WeZq8B
	R7QqBCYtrQgyHY8Beo3ZU+PGZXw=
X-Google-Smtp-Source: AGHT+IHMiquJqImn6K84gT1weLJxq5o/E72F/zmLI6WDRKNBWyZi82ZnYP+0ysd0qODUl9LYt+ulyw==
X-Received: by 2002:a05:6a21:32a4:b0:1e1:b329:3cd with SMTP id adf61e73a8af0-1ed7a638554mr25944662637.20.1738425860203;
        Sat, 01 Feb 2025 08:04:20 -0800 (PST)
Received: from thinkpad ([120.56.202.249])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acebe3842a4sm4856617a12.20.2025.02.01.08.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 08:04:19 -0800 (PST)
Date: Sat, 1 Feb 2025 21:34:13 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Cc: James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
	andersson@kernel.org, bvanassche@acm.org, ebiggers@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>,
	Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: Re: [PATCH V11] scsi: ufs: qcom: Enable UFS Shared ICE Feature
Message-ID: <20250201160413.eyhtn2edwnslxijy@thinkpad>
References: <20250127151815.6049-1-quic_rdwivedi@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250127151815.6049-1-quic_rdwivedi@quicinc.com>

On Mon, Jan 27, 2025 at 08:48:15PM +0530, Ram Kumar Dwivedi wrote:
> By default, the UFS controller allocates a fixed number of RX
> and TX engines statically. Consequently, when UFS reads are in
> progress, the TX ICE engines remain idle, and vice versa.
> This leads to inefficient utilization of RX and TX engines.
> 
> To address this limitation, enable the UFS shared ICE feature for
> Qualcomm UFS V5.0 and above. This feature utilizes a pool of crypto
> cores for both TX streams (UFS Write – Encryption) and RX streams
> (UFS Read – Decryption). With this approach, crypto cores are
> dynamically allocated to either the RX or TX stream as needed.
> 
> Co-developed-by: Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>
> Signed-off-by: Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>
> Co-developed-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

One nit below.

> ---
> Changes from v10:
> 1. Addressed Manivannan's comment to align the shared ICE register
>    definitions with the existing vendor-specific registers.
> 
> Changes from v9:
> 1. Addressed Manivannan's comment to pair ufs_qcom_config_ice_allocator
>    with ufs_qcom_ice_enable.
> 2. Addressed Manivannan's comment to avoid guarding the definitions.
> 3. Addressed Manivannan's comment to align bit definitions.
> 2. Addressed Manivannan's comment to use enum for register definitions.
> 
> Changes from v8:
> 1. Addressed Manivannan's comment to call ufs_qcom_config_ice_allocator()
>    from ufs_qcom_ice_enable().
> 2. Addressed Manivannan's comment to place UFS_QCOM_CAP_ICE_CONFIG
>    definition outside of the ufs_qcom_host struct.
> 3. Addressed Manivannan's comment to align ICE definitions with
>    other definitions.
> 
> Changes from v7:
> 1. Addressed Eric's comment to perform ice configuration only if
>    UFSHCD_CAP_CRYPTO is enabled.
>  
> Changes from v6: 
> 1. Addressed Eric's comment to replace is_ice_config_supported() helper
>    function with a conditional check for UFS_QCOM_CAP_ICE_CONFIG.
> 
> Changes from v5: 
> 1. Addressed Bart's comment to declare the "val" variable with
>    the "static" keyword.
> 
> Changes from v4:
> 1. Addressed Bart's comment to use get_unaligned_le32() instead of
>    bit shifting and to declare val with the const keyword.
> 
> Changes from v3:
> 1. Addressed Bart's comment to change the data type of "config" to u32
>    and "val" to uint8_t.
> 
> Changes from v2:
> 1. Refactored the code to have a single algorithm in the code and
> enabled by default.
> 2. Revised the commit message to incorporate the refactored change.
> 3. Qcom host capabilities are now enabled in a separate function.
> 
> Changes from v1:
> 1. Addressed Rob's and Krzysztof's comment to fix dt binding compilation
>    issue.
> 2. Addressed Rob's comment to enable the nodes in example.
> 3. Addressed Eric's comment to rephrase patch commit description.
>    Used terminology as ICE allocator instead of ICE algorithm.
> 4. Addressed Christophe's comment to align the comment as per kernel doc.
> ---
>  drivers/ufs/host/ufs-qcom.c | 37 ++++++++++++++++++++++++++++++++++
>  drivers/ufs/host/ufs-qcom.h | 40 ++++++++++++++++++++++++++++++++++++-
>  2 files changed, 76 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 68040b2ab5f8..83bf156eb171 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -15,6 +15,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/reset-controller.h>
>  #include <linux/time.h>
> +#include <linux/unaligned.h>
>  
>  #include <soc/qcom/ice.h>
>  
> @@ -105,6 +106,26 @@ static struct ufs_qcom_host *rcdev_to_ufs_host(struct reset_controller_dev *rcd)
>  }
>  
>  #ifdef CONFIG_SCSI_UFS_CRYPTO
> +/**
> + * ufs_qcom_config_ice_allocator() - ICE core allocator configuration
> + *
> + * @host: pointer to qcom specific variant structure.
> + */
> +static void ufs_qcom_config_ice_allocator(struct ufs_qcom_host *host)
> +{
> +	struct ufs_hba *hba = host->hba;
> +	static const uint8_t val[4] = { NUM_RX_R1W0, NUM_TX_R0W1, NUM_RX_R1W1, NUM_TX_R1W1 };
> +	u32 config;
> +
> +	if (!(host->caps & UFS_QCOM_CAP_ICE_CONFIG) ||
> +			!(host->hba->caps & UFSHCD_CAP_CRYPTO))
> +		return;
> +
> +	config = get_unaligned_le32(val);
> +
> +	ufshcd_writel(hba, ICE_ALLOCATOR_TYPE, REG_UFS_MEM_ICE_CONFIG);
> +	ufshcd_writel(hba, config, REG_UFS_MEM_ICE_NUM_CORE);
> +}
>  
>  static inline void ufs_qcom_ice_enable(struct ufs_qcom_host *host)
>  {
> @@ -196,6 +217,11 @@ static inline int ufs_qcom_ice_suspend(struct ufs_qcom_host *host)
>  {
>  	return 0;
>  }
> +
> +static void ufs_qcom_config_ice_allocator(struct ufs_qcom_host *host)
> +{
> +}
> +
>  #endif
>  
>  static void ufs_qcom_disable_lane_clks(struct ufs_qcom_host *host)
> @@ -439,6 +465,7 @@ static int ufs_qcom_hce_enable_notify(struct ufs_hba *hba,
>  		err = ufs_qcom_check_hibern8(hba);
>  		ufs_qcom_enable_hw_clk_gating(hba);
>  		ufs_qcom_ice_enable(host);
> +		ufs_qcom_config_ice_allocator(host);
>  		break;
>  	default:
>  		dev_err(hba->dev, "%s: invalid status %d\n", __func__, status);
> @@ -932,6 +959,14 @@ static void ufs_qcom_set_host_params(struct ufs_hba *hba)
>  	host_params->hs_tx_gear = host_params->hs_rx_gear = ufs_qcom_get_hs_gear(hba);
>  }
>  
> +static void ufs_qcom_set_host_caps(struct ufs_hba *hba)
> +{
> +	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> +
> +	if (host->hw_ver.major >= 0x5)
> +		host->caps |= UFS_QCOM_CAP_ICE_CONFIG;
> +}
> +
>  static void ufs_qcom_set_caps(struct ufs_hba *hba)
>  {
>  	hba->caps |= UFSHCD_CAP_CLK_GATING | UFSHCD_CAP_HIBERN8_WITH_CLK_GATING;
> @@ -940,6 +975,8 @@ static void ufs_qcom_set_caps(struct ufs_hba *hba)
>  	hba->caps |= UFSHCD_CAP_WB_EN;
>  	hba->caps |= UFSHCD_CAP_AGGR_POWER_COLLAPSE;
>  	hba->caps |= UFSHCD_CAP_RPM_AUTOSUSPEND;
> +
> +	ufs_qcom_set_host_caps(hba);
>  }
>  
>  /**
> diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
> index b9de170983c9..d4241e6793d1 100644
> --- a/drivers/ufs/host/ufs-qcom.h
> +++ b/drivers/ufs/host/ufs-qcom.h
> @@ -50,6 +50,10 @@ enum {
>  	 */
>  	UFS_AH8_CFG				= 0xFC,
>  
> +	/* bit definition for REG_UFS_MEM_ICE_CONFIG register */

This is not a bit definition. Please drop the comment.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
