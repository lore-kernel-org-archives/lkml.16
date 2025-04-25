Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D1F22D7A7
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 07:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745567283; cv=none; b=lVtLcMx4JaIr23e6ifN6tE2RlRv9zKwihdI4LgBGWCRFieCgRr2U5L7SpYou1xQtsyQbXRFKyjmWzWjhEjqcoLL5LwOPhZJmEMBrQRNC1/uTDkGc7yiFntyqlZ0LWdzxrZKMZpzI26wCGuzpVb0J2oA197CTrBt5b1z79eEh+Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745567283; c=relaxed/simple;
	bh=f7h8dxvV7ChOf0zR9pxS70TS/wjvGYnZMMlO0a4r8D8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NDbz285D5+JcKyCNCXpKHEg/fI2soRIFGULEyxtpBaj2hvZLqSWwL+TpyA/QKkiQ2tpf7y8O4H8jGopYfYwmHYPG0zfrkH77A7JmBgK8DH9Mp5HStYY9Uog0yjzb9/BPgr9ZIjXVOBV78wzD2OVqMI4E2LOGnQa7HVmjEjx/GoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RWWFpaZx; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RWWFpaZx"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-736b350a22cso1642657b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 00:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745567281; x=1746172081; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LXYXeX99yUYQ64wKe7OdIaME+qdUHpQKuv9wqgqo5Cs=;
        b=RWWFpaZxkLRx+H2sOdgvh35bwYAVrE22g4rw6im295QLwFZN6SmuZ3dugN3oQifO3v
         tQmr/eJU1WwyHisU0m9vpaE7QVrjx288n/Rz9R1Qbkn0R3VPaKE7bUpHq039VZvgvmCX
         YLRoGCLzZovjuGK4gGOGFrG3P2pHNPkSsUbJx/WFaW9FKE46CPD7uzwH+f4cZ1xBPyAA
         ZcPjCteXGiV08TVhlJHO8R8QTtEDpN1oCt8+apvor4xE2D6M49FRJqQheKFoxkT6c1S/
         +09ltCMYnYlYoSPisMyPT7FI6C5vy6G8ozkH8scOu0yhy5IYmMd6p3d1/Fsqt3ay7Koe
         7j6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745567281; x=1746172081;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LXYXeX99yUYQ64wKe7OdIaME+qdUHpQKuv9wqgqo5Cs=;
        b=Y9TzHpR07yMNGAOveNbwAEPoFjBHPG5oJ9nRzZiwdsirg+URUXsz2Mu58cGeMuM9KX
         SIy8Fd/o6MSVmAC600VVZrCk+KKMFUL7ubyXHgnVLi/jAzExHiDRKuO3J6l9P60KJgMD
         M3TPNJC1CcuWW06MN18IOYhXaGG0ToVPgrYj4BLiQU8Wv/uXGYcNMFJfCYubfaXJlgOq
         M5GcUqpGJHFav/3Mc6GRlW4paRAhqEUHVrcQiZ6mVOvFWDVFn73ZxjZ1Nzrpn+jvDUmd
         SMhUnKQfArnWvPJYzMApSc9mzeqBNfHjMnEEzIydqZyYk7byE/jjQesGqqa67f7VAEY6
         xgag==
X-Forwarded-Encrypted: i=1; AJvYcCXKMi2kiFMC9wl3ckw/aaF8/E41l6UHYbdEd6k2BKV9b+ZqOWtd5Ap4wywhtoWU9xpNf4hlfvL8c3xneeI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1Uvh+0Iay4XQJcaIDdsCVGkWikuGansfIykLHJYJax3r15pOy
	aw6LFiRhX8/nUUsIGldFKmwVM702nfE8yuy9/W59jRvvYp8LhDQlpzUaZBz2wA==
X-Gm-Gg: ASbGncu8mbaM+hMtYWXqBh4J5Dhbig4eW7J2kvSSs2XUBHj8sTrp73Ko13oApuTVugt
	Nxs5RAhS9RgUwBcI625v5X7CXFg/03cAr5vDKHxt9soJ/KvuLk58mqe18BGEwo8bkJ+i+lfymXx
	4HB2YpO7Sk7q1PYvXuxIJkrrBCQ4tMtD8cQPDORQ6q7C3fNDcpAtCsNiXpRahd4xkeU4sRIX4hC
	+MnTRxwyZ13wFLtPeSorx7d8SlaKs0OSoezwVL19QPwkMD0AXRKIn2ObmvJ4KCoYQJdCz9olP6g
	DBbLcf4oTKpaEUMyshG8xCEeeza+uhi+Itk89bsQUr8LEqjHpt4=
X-Google-Smtp-Source: AGHT+IFC/H/dBuQro0RKj49t41PCO5t1nJ6DAmlcyxyxl51nS8GK+dmHa5dgtUQcySuxJPxP0VqInQ==
X-Received: by 2002:a05:6a00:179e:b0:730:927c:d451 with SMTP id d2e1a72fcca58-73fd90457demr1937127b3a.20.1745567280870;
        Fri, 25 Apr 2025 00:48:00 -0700 (PDT)
Received: from thinkpad ([120.60.77.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a6a317sm2647101b3a.93.2025.04.25.00.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 00:48:00 -0700 (PDT)
Date: Fri, 25 Apr 2025 13:17:54 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
	broonie@kernel.org, absahu@codeaurora.org, bbrezillon@kernel.org, 
	architt@codeaurora.org, quic_srichara@quicinc.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH v4 1/3] mtd: rawnand: qcom: Pass 18 bit offset from NANDc
 base to BAM base
Message-ID: <bsj6kvqjo3pfbsakex5quamk5tkrtigxdcoyu5bj3nt37zsgc5@7h7zidzbcs7p>
References: <20250410100019.2872271-1-quic_mdalam@quicinc.com>
 <20250410100019.2872271-2-quic_mdalam@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250410100019.2872271-2-quic_mdalam@quicinc.com>

On Thu, Apr 10, 2025 at 03:30:17PM +0530, Md Sadre Alam wrote:
> The BAM command descriptor provides only 18 bits to specify the NAND
> register offset. 

s/NAND register offset/BAM register offset

> Additionally, in the BAM command descriptor, the NAND
> register offset is supposed to be specified as "(NANDc base - BAM base)

Same here.

> + reg_off". Since, the BAM controller expecting the value in the form of
> "NANDc base - BAM base", so that added a new field 'bam_offset' in the NAND
> properties structure and use it while preparing the command descriptor.
> 
> Previously, the driver was specifying the NANDc base address in the BAM
> command descriptor.
> 
> Cc: stable@vger.kernel.org
> Fixes: 8d6b6d7e135e ("mtd: nand: qcom: support for command descriptor formation")
> Tested-by: Lakshmi Sowjanya D <quic_laksd@quicinc.com>
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/mtd/nand/qpic_common.c       | 8 ++++----
>  drivers/mtd/nand/raw/qcom_nandc.c    | 4 ++++
>  drivers/spi/spi-qpic-snand.c         | 1 +
>  include/linux/mtd/nand-qpic-common.h | 4 +---
>  4 files changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/nand/qpic_common.c b/drivers/mtd/nand/qpic_common.c
> index e0ed25b5afea..4dc4d65e7d32 100644
> --- a/drivers/mtd/nand/qpic_common.c
> +++ b/drivers/mtd/nand/qpic_common.c
> @@ -236,21 +236,21 @@ int qcom_prep_bam_dma_desc_cmd(struct qcom_nand_controller *nandc, bool read,
>  	int i, ret;
>  	struct bam_cmd_element *bam_ce_buffer;
>  	struct bam_transaction *bam_txn = nandc->bam_txn;
> +	u32 offset;
>  
>  	bam_ce_buffer = &bam_txn->bam_ce[bam_txn->bam_ce_pos];
>  
>  	/* fill the command desc */
>  	for (i = 0; i < size; i++) {
> +		offset = nandc->props->bam_offset + reg_off + 4 * i;
>  		if (read)
>  			bam_prep_ce(&bam_ce_buffer[i],
> -				    nandc_reg_phys(nandc, reg_off + 4 * i),
> -				    BAM_READ_COMMAND,
> +				    offset, BAM_READ_COMMAND,
>  				    reg_buf_dma_addr(nandc,
>  						     (__le32 *)vaddr + i));
>  		else
>  			bam_prep_ce_le32(&bam_ce_buffer[i],
> -					 nandc_reg_phys(nandc, reg_off + 4 * i),
> -					 BAM_WRITE_COMMAND,
> +					 offset, BAM_WRITE_COMMAND,
>  					 *((__le32 *)vaddr + i));
>  	}
>  
> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
> index 5eaa0be367cd..ef2dd158ca34 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> @@ -2360,6 +2360,7 @@ static const struct qcom_nandc_props ipq806x_nandc_props = {
>  	.supports_bam = false,
>  	.use_codeword_fixup = true,
>  	.dev_cmd_reg_start = 0x0,
> +	.bam_offset = 0x30000,
>  };
>  
>  static const struct qcom_nandc_props ipq4019_nandc_props = {
> @@ -2367,6 +2368,7 @@ static const struct qcom_nandc_props ipq4019_nandc_props = {
>  	.supports_bam = true,
>  	.nandc_part_of_qpic = true,
>  	.dev_cmd_reg_start = 0x0,
> +	.bam_offset = 0x30000,
>  };
>  
>  static const struct qcom_nandc_props ipq8074_nandc_props = {
> @@ -2374,6 +2376,7 @@ static const struct qcom_nandc_props ipq8074_nandc_props = {
>  	.supports_bam = true,
>  	.nandc_part_of_qpic = true,
>  	.dev_cmd_reg_start = 0x7000,
> +	.bam_offset = 0x30000,
>  };
>  
>  static const struct qcom_nandc_props sdx55_nandc_props = {
> @@ -2382,6 +2385,7 @@ static const struct qcom_nandc_props sdx55_nandc_props = {
>  	.nandc_part_of_qpic = true,
>  	.qpic_version2 = true,
>  	.dev_cmd_reg_start = 0x7000,
> +	.bam_offset = 0x30000,
>  };
>  
>  /*
> diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
> index a2af731049d4..89c774bf85a6 100644
> --- a/drivers/spi/spi-qpic-snand.c
> +++ b/drivers/spi/spi-qpic-snand.c
> @@ -1605,6 +1605,7 @@ static void qcom_spi_remove(struct platform_device *pdev)
>  
>  static const struct qcom_nandc_props ipq9574_snandc_props = {
>  	.dev_cmd_reg_start = 0x7000,
> +	.bam_offset = 0x30000,
>  	.supports_bam = true,
>  };
>  
> diff --git a/include/linux/mtd/nand-qpic-common.h b/include/linux/mtd/nand-qpic-common.h
> index cd7172e6c1bb..e8462deda6db 100644
> --- a/include/linux/mtd/nand-qpic-common.h
> +++ b/include/linux/mtd/nand-qpic-common.h
> @@ -199,9 +199,6 @@
>   */
>  #define dev_cmd_reg_addr(nandc, reg) ((nandc)->props->dev_cmd_reg_start + (reg))
>  
> -/* Returns the NAND register physical address */
> -#define nandc_reg_phys(chip, offset) ((chip)->base_phys + (offset))
> -
>  /* Returns the dma address for reg read buffer */
>  #define reg_buf_dma_addr(chip, vaddr) \
>  	((chip)->reg_read_dma + \
> @@ -454,6 +451,7 @@ struct qcom_nand_controller {
>  struct qcom_nandc_props {
>  	u32 ecc_modes;
>  	u32 dev_cmd_reg_start;
> +	u32 bam_offset;
>  	bool supports_bam;
>  	bool nandc_part_of_qpic;
>  	bool qpic_version2;
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
