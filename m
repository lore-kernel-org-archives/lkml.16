Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456E0218ACA
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 08:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748595379; cv=none; b=Fexb4m3Mh3igwEssLNxA5Kce8Jht+QOCHilfN3JqV8aAU07NFczC/HFnhgF2oBvJLgbcOCd2T7Jss8RGc/qWJElsSb1pOi5iilxoBcNfWoMNopsj0YAbV7lZHkh0rDgffhKdq9A/lEM+30gk5mKdCYWQp2hFV/Y9wKbEcnUnrdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748595379; c=relaxed/simple;
	bh=UWE2jdlEzI9YD+Dg6NIoCE8U1hSoBC3xQFtAghveJv4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G0saVSxlla8jaEHi1POgADSdDHC1HRh+9EtxC7uXfGi2xbolu3KJaQUFSwpuI/FClZsynog1MRhDlN4K3CqDOwcpFevae70h+kFker6FsgzbUgpwhrJI09476/gFfn0pdMotA1n3XRkVUU8R4GILlPF6A+IFHZjtzvE2i5JiYRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x/ONuqt7; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x/ONuqt7"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a36f26584bso988639f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 01:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748595375; x=1749200175; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sSnECUFkt1/JvJRDNh/81S1RiOSnxf9TGj9i5tAOdx8=;
        b=x/ONuqt7Fj2rWWivm6D3uMSQdssDP6CWdUEEvRsnxY7iO6r1O5rZCLPXUo2K3e3+dz
         p+cd11CNgXYJ5y/04LEfJWQOayt4JlYiTIhSeUjd8qSPfkGZHRuy+93Y9D0rkF0/1yCa
         AgsBlE3twDA/+C6qyFVr0+9zc6r6RP+MztYFdA+1sIBlVJNr/NoX/SNtjVzodiKkZGRI
         N+VIVpchr+Heh7bHLgqiqBfl77B+bIx2/4cmuB6hIQ099ODqmWslonr5xMxBRThK2XG2
         2qBMGPUBCVS7q7Fv/oTKvwhFXDBKyIRKK+6gJLmiG0NiCH3rbBFKNc3feKx80GfvCgB/
         tkbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748595375; x=1749200175;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sSnECUFkt1/JvJRDNh/81S1RiOSnxf9TGj9i5tAOdx8=;
        b=u9ODKCmeKaAnYDhYN6zTwrZXsLZUPMhhVIv8pOG051RmDJBZLH1rNErS1KhBHwI3wC
         0+4hLCQrLbiA7TNvWfUTBpiDh4z6sMx8tIM3NwkqwRDZjAC+flm79I9WGrTTJGBwGrG4
         fEmB12ibNT3ihEBtyz4uSGqW4rSmuh+C7D/WyX/Z2qZYE7btJkKIY0kQyPmwSqmNMbmC
         q8wuwla0ffpOK85QBwGIObxdrL4rLzXgm708NzTWEM4l62htQRbvQwgm12cfXhv9s/yR
         YmuUuSVVKtgkXw62a+vFTpkxNyFNPkpRlNFGq6Aug+cIxpC068fUHMLKRAmBQA5hE/XB
         cCxg==
X-Forwarded-Encrypted: i=1; AJvYcCXsIFiGVRFaZcYB18Ne3sk1acPreuXKM/cwCflq0L2Cnq3W3LfSNocWZKHcVAdg65LVi8KDwHB+A0Y4GlY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQJ9mCOCxZXnb+pozfVGe4JWkvVgbUZyEbINOoFI142ObVU29N
	nBrNUAWR+BnqHzCBFg2qlMMi77caRQHeNWxtxggSjczne58hiFuVkijT2Lm+UkJQKOk=
X-Gm-Gg: ASbGnctYJ/cQkp5O3B/JJjTZZDYUpV04qm2+C1jEred6D69kenKj2GY3cX0oRCUAwKo
	elNTzQrKBvXnLJc9hI/qnx6kDlZqGEoAs4Es/X/cMDeNtN1w6Z+4uHDCsMd2muCY35ChcWSOCBb
	TqGxZIYT1NBlwvmHOzqMqLq9eJpfHxJfsTMQU7WydZF2Fqh1H0yuydwGXMo+LAjFewGZCGFl1oH
	VsZ9d5DdOU9uJbcOQUMVVXf0K/WrNyp7TA4tAfJ1YFaZhREvtKQlknktYy9OUD25VGAM5SglsZY
	Qw70wtPVkK/JR016HusBtE/lSnfbdWUBAAluLw8/rtpvR5RRhmuRlUY/OWNHi6q6c6Zy4arzK3s
	gS+Vx8mf0shCztnQP
X-Google-Smtp-Source: AGHT+IEdTEPwz3I3fiIOCvTUuIwyDXev7/ivsylgXDu6Xsiav4J6EpqE94XmbzdMFCw668axV924fg==
X-Received: by 2002:a05:6000:1a8a:b0:3a4:dfc2:b9e1 with SMTP id ffacd0b85a97d-3a4f89a7e71mr1193613f8f.2.1748595375484;
        Fri, 30 May 2025 01:56:15 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00a0a96sm4271388f8f.96.2025.05.30.01.56.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 01:56:15 -0700 (PDT)
Message-ID: <68c54d56-3e44-4f43-8bd6-f6b7fa1f379b@linaro.org>
Date: Fri, 30 May 2025 09:56:13 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] mtd: nand: qpic_common: prevent out of bounds
 access of BAM arrays
To: Gabor Juhos <j4g8y7@gmail.com>, Mark Brown <broonie@kernel.org>,
 Md Sadre Alam <quic_mdalam@quicinc.com>,
 Varadarajan Narayanan <quic_varada@quicinc.com>,
 Sricharan Ramabadhran <quic_srichara@quicinc.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lakshmi Sowjanya D <quic_laksd@quicinc.com>
References: <20250529-qpic-snand-avoid-mem-corruption-v2-0-2f0d13afc7d2@gmail.com>
 <KuueBg3qliXMt9QN9kV_5_on2xJV-BEWZAsktO_Ce-Fq1iBAPCFypbYUVZxlV4LjF0AUZG57KqiXZZ3uefQrXw==@protonmail.internalid>
 <20250529-qpic-snand-avoid-mem-corruption-v2-2-2f0d13afc7d2@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250529-qpic-snand-avoid-mem-corruption-v2-2-2f0d13afc7d2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/05/2025 18:25, Gabor Juhos wrote:
> The common QPIC code does not do any boundary checking when it handles
> the command elements and scatter gater list arrays of a BAM transaction,
> thus it allows to access out of bounds elements in those.
> 
> Although it is the responsibility of the given driver to allocate enough
> space for all possible BAM transaction variations, however there can be
> mistakes in the driver code which can lead to hidden memory corruption
> issues which are hard to debug.
> 
> This kind of problem has been observed during testing the 'spi-qpic-snand'
> driver. Although the driver has been fixed with a preceding patch, but it
> still makes sense to reduce the chance of having such errors again later.
> 
> In order to prevent such errors, change the qcom_alloc_bam_transaction()
> function to store the number of elements of the arrays in the
> 'bam_transaction' strucutre during allocation. Also, add sanity checks to
> the qcom_prep_bam_dma_desc_{cmd,data}() functions to avoid using out of
> bounds indices for the arrays.
> 
> Tested-by: Lakshmi Sowjanya D <quic_laksd@quicinc.com>     # on SDX75
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---
> Changes in v2:
>    - remove the inline qcom_err_bam_array_full() function and print the error
>      messages directly from the respective functions instead
>    - add 'Tested-by' tag from Lakshmi Sowjanya D, and remove the
>      "Tested with the 'spi-qpic-snand' driver only." line from the
>      commit message as SDX75 uses the qcom_nandc driver
>    - move the note about of the preferred merging order into the cover letter
> ---
>   drivers/mtd/nand/qpic_common.c       | 30 ++++++++++++++++++++++++++----
>   include/linux/mtd/nand-qpic-common.h |  8 ++++++++
>   2 files changed, 34 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/nand/qpic_common.c b/drivers/mtd/nand/qpic_common.c
> index e0ed25b5afea9b289b767cd3d9c2d7572ed52008..30f17d959300cc7448d0c2e9e2516c52655494f0 100644
> --- a/drivers/mtd/nand/qpic_common.c
> +++ b/drivers/mtd/nand/qpic_common.c
> @@ -57,14 +57,15 @@ qcom_alloc_bam_transaction(struct qcom_nand_controller *nandc)
>   	bam_txn_buf += sizeof(*bam_txn);
> 
>   	bam_txn->bam_ce = bam_txn_buf;
> -	bam_txn_buf +=
> -		sizeof(*bam_txn->bam_ce) * QPIC_PER_CW_CMD_ELEMENTS * num_cw;
> +	bam_txn->bam_ce_nitems = QPIC_PER_CW_CMD_ELEMENTS * num_cw;
> +	bam_txn_buf += sizeof(*bam_txn->bam_ce) * bam_txn->bam_ce_nitems;
> 
>   	bam_txn->cmd_sgl = bam_txn_buf;
> -	bam_txn_buf +=
> -		sizeof(*bam_txn->cmd_sgl) * QPIC_PER_CW_CMD_SGL * num_cw;
> +	bam_txn->cmd_sgl_nitems = QPIC_PER_CW_CMD_SGL * num_cw;
> +	bam_txn_buf += sizeof(*bam_txn->cmd_sgl) * bam_txn->cmd_sgl_nitems;
> 
>   	bam_txn->data_sgl = bam_txn_buf;
> +	bam_txn->data_sgl_nitems = QPIC_PER_CW_DATA_SGL * num_cw;
> 
>   	init_completion(&bam_txn->txn_done);
> 
> @@ -237,6 +238,11 @@ int qcom_prep_bam_dma_desc_cmd(struct qcom_nand_controller *nandc, bool read,
>   	struct bam_cmd_element *bam_ce_buffer;
>   	struct bam_transaction *bam_txn = nandc->bam_txn;
> 
> +	if (bam_txn->bam_ce_pos + size > bam_txn->bam_ce_nitems) {
> +		dev_err(nandc->dev, "BAM %s array is full\n", "CE");
> +		return -EINVAL;
> +	}
> +
>   	bam_ce_buffer = &bam_txn->bam_ce[bam_txn->bam_ce_pos];
> 
>   	/* fill the command desc */
> @@ -258,6 +264,12 @@ int qcom_prep_bam_dma_desc_cmd(struct qcom_nand_controller *nandc, bool read,
> 
>   	/* use the separate sgl after this command */
>   	if (flags & NAND_BAM_NEXT_SGL) {
> +		if (bam_txn->cmd_sgl_pos >= bam_txn->cmd_sgl_nitems) {
> +			dev_err(nandc->dev, "BAM %s array is full\n",
> +				"CMD sgl");
> +			return -EINVAL;
> +		}
> +
>   		bam_ce_buffer = &bam_txn->bam_ce[bam_txn->bam_ce_start];
>   		bam_ce_size = (bam_txn->bam_ce_pos -
>   				bam_txn->bam_ce_start) *
> @@ -297,10 +309,20 @@ int qcom_prep_bam_dma_desc_data(struct qcom_nand_controller *nandc, bool read,
>   	struct bam_transaction *bam_txn = nandc->bam_txn;
> 
>   	if (read) {
> +		if (bam_txn->rx_sgl_pos >= bam_txn->data_sgl_nitems) {
> +			dev_err(nandc->dev, "BAM %s array is full\n", "RX sgl");
> +			return -EINVAL;
> +		}
> +
>   		sg_set_buf(&bam_txn->data_sgl[bam_txn->rx_sgl_pos],
>   			   vaddr, size);
>   		bam_txn->rx_sgl_pos++;
>   	} else {
> +		if (bam_txn->tx_sgl_pos >= bam_txn->data_sgl_nitems) {
> +			dev_err(nandc->dev, "BAM %s array is full\n", "TX sgl");
> +			return -EINVAL;
> +		}
> +
>   		sg_set_buf(&bam_txn->data_sgl[bam_txn->tx_sgl_pos],
>   			   vaddr, size);
>   		bam_txn->tx_sgl_pos++;
> diff --git a/include/linux/mtd/nand-qpic-common.h b/include/linux/mtd/nand-qpic-common.h
> index cd7172e6c1bbffeee0363a14044980a72ea17723..3ca4073a496b8fd2a99112a9caefd3f110260568 100644
> --- a/include/linux/mtd/nand-qpic-common.h
> +++ b/include/linux/mtd/nand-qpic-common.h
> @@ -240,6 +240,9 @@
>    * @last_data_desc - last DMA desc in data channel (tx/rx).
>    * @last_cmd_desc - last DMA desc in command channel.
>    * @txn_done - completion for NAND transfer.
> + * @bam_ce_nitems - the number of elements in the @bam_ce array
> + * @cmd_sgl_nitems - the number of elements in the @cmd_sgl array
> + * @data_sgl_nitems - the number of elements in the @data_sgl array
>    * @bam_ce_pos - the index in bam_ce which is available for next sgl
>    * @bam_ce_start - the index in bam_ce which marks the start position ce
>    *		   for current sgl. It will be used for size calculation
> @@ -258,6 +261,11 @@ struct bam_transaction {
>   	struct dma_async_tx_descriptor *last_data_desc;
>   	struct dma_async_tx_descriptor *last_cmd_desc;
>   	struct completion txn_done;
> +
> +	unsigned int bam_ce_nitems;
> +	unsigned int cmd_sgl_nitems;
> +	unsigned int data_sgl_nitems;
> +
>   	struct_group(bam_positions,
>   		u32 bam_ce_pos;
>   		u32 bam_ce_start;
> 
> --
> 2.49.0
> 
> 

This one doesn't apply to -next

deckard 
{~/Development/worktree/reviews/linux-next-25-05-30-daily-reviews}±(linux-next-25-05-30-daily-reviews); 
greetings, earthling [1.052Mb]$ ☞ b4 shazam 
20250529-qpic-snand-avoid-mem-corruption-v2-0-2f0d13afc7d2@gm
Grabbing thread from 
lore.kernel.org/all/20250529-qpic-snand-avoid-mem-corruption-v2-0-2f0d13afc7d2@gmail.com/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 3 messages in the thread
Analyzing 12 code-review messages
Checking attestation on all messages, may take a moment...
---
   ✓ [PATCH v2 1/2] spi: spi-qpic-snand: reallocate BAM transactions
   ✓ [PATCH v2 2/2] mtd: nand: qpic_common: prevent out of bounds access 
of BAM arrays
   ---
   ✓ Signed: DKIM/gmail.com
---
Total patches: 2
---
  Base: using specified base-commit b00d6864a4c948529dc6ddd2df76bf175bf27c63
Applying: spi: spi-qpic-snand: reallocate BAM transactions
Applying: mtd: nand: qpic_common: prevent out of bounds access of BAM arrays
Patch failed at 0002 mtd: nand: qpic_common: prevent out of bounds 
access of BAM arrays
error: patch failed: drivers/mtd/nand/qpic_common.c:237
error: drivers/mtd/nand/qpic_common.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
hint: When you have resolved this problem, run "git am --continue".
hint: If you prefer to skip this patch, run "git am --skip" instead.
hint: To restore the original branch and stop patching, run "git am 
--abort".
hint: Disable this message with "git config set advice.mergeConflict false"
deckard 
{~/Development/worktree/reviews/linux-next-25-05-30-daily-reviews}±(linux-next-25-05-30-daily-reviews); 
greetings, earthling [1.052Mb]$ ☞ git-log-graph
* 4ae57ce867d8f - (HEAD -> linux-next-25-05-30-daily-reviews) spi: 
spi-qpic-snand: reallocate BAM transactions (8 seconds ago)

