Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6302021771D
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 10:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743156020; cv=none; b=GOLco+piJgD3F+nUA7AFTkIi8SrFw8g6ZD+EmMy6Ox1xpKRDCpZ1iCqRFE1s6LUmScOTgLn896ETl4iawblJl3d0SZVQrhMyW+geDScbqUItloxu+sTQ6C34Q7pl0FPIRELxBoAbNfA0VlV+k2pFShHu92os+PsaUVS02T/DHaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743156020; c=relaxed/simple;
	bh=VAxMnppZDd0EsjFlPAHPDvkheirt5PDlBP3XZemzIlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J9htAtb4yGUnd8HHCXsKbeDoBpvQEKb6CdWQgsc5HQPdVMN6olXvuw7AfUDiPdrMWGpHu5wnYk9kP1txOt3Oh7nxkLX8709DwBKWBh9CmaCw7JEsosE+xsJD4uAAMPr8XfJcecJEueAA7+hfwpbzUqJCjNq9Y9//2NvbWE/tgwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gRjdAwiz; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gRjdAwiz"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39727fe912cso635706f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 03:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743156016; x=1743760816; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uMHy4UXVXze7CguX+fTXXYQovkguTPZAbEfyyQdz7+s=;
        b=gRjdAwizbI2GB3mpJ0tuxllHhWl0gs/tAULTfZ2mfewHdZpDlIOeDma/iytqf1UzxN
         ocf+uk72V3eRFg4BWf5h9pgVtsojIXJMWaueALkbX53tK3GmFoW6C27xzQSrVGUSkQ3c
         NdU9FgGqxpTr8LluBHUXTwl6+jIuGlzWW+wB3vW1VHrQU2EhReQhMYiGigPb8Sx9itqp
         bq4jidTcD/JdMVKxBEiGUsmDFn1yFsAo3mooRgLvXEoM2niY+RO8KYvdnpvV5lpnNGGT
         KgkJGYqa+sZjGKKH/y+BUhty9ueYFPUr23INntKMp0GkHj0x+7rZ8RKoQ9SgSVKVuDaW
         sdcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743156016; x=1743760816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uMHy4UXVXze7CguX+fTXXYQovkguTPZAbEfyyQdz7+s=;
        b=mqCf+rzGqlyU7N3oKkQV9OTyQovlVUGRsp3c4MPQZJW6YwKq9PTJa9r4QkxR2zs4Kx
         BPMtKSE6lGNb+4CjikGsZKJrn2jJYkXTElvPLcWj/hQQ3g5XkintPPPwve76MNl8ddDl
         BhU3Myv58P2FZFnm2evSU6eS1rwlDzzznHCtO9DMZv23zFwO+zdjubUw2qQDuI+XQ5+G
         xsYrZOlu1rI7w7xRlITJJckl7b7ZepgS/FnrEtIETRgTozUY9dBEkVWQPcHDFPeAIVDR
         dW9lK3aOYSW+w1LXaFW3KBRP8t3EsUC+X+x6T3/ggQ0ckVS/TTu0Nh2Q3NV5MBrhvXxx
         8m2A==
X-Gm-Message-State: AOJu0YxPkSYDlhulf6UZ0fGi/mKfsNbWQehArX91nNlXSod4zmEMKZdu
	pE7vpPExizGE26lM/PtjkaI4MqN2yjQnllLEVjqfSJPkg2QqP4Gu4CzLMzFOIg0=
X-Gm-Gg: ASbGncsyVnICYdyP7lWlVm6/6iCuL3cYjCLRQ+auYu1ygAjVpY200g+Z9/vthRQQIuN
	c7AP+9HeKTLloTZuxMsWMblNMlFkMVePSPAQxpnz+9YvWR7Hl9WF5e6YnCWQsUKEIHMG5z30Ow/
	eJPV+LyTBqYC6gyUqUHyY6TM489Ke6ELz4cyDMGq+Ie7Ks/n09KxSvqVXWxHA/ljUJ/qb+j+C/M
	K640ILqqsd6YtOZnPjMvnnohm1dGuVZ4dG5aKT+dssbH2l0sO24TmV+1qgCwoAGeMNzSS3JqTr6
	BIWLJ+twVV4NOhZ9ovW3ugrOgTknPWwQIH3LWFcivTrqjJ0lEIsX3lOTuzAZ
X-Google-Smtp-Source: AGHT+IGj9pQvphUGd9QRvl74y+vh1brVfy4aIv4DoMY75sWkzHFUx8Bt1I9v28FP8We3YasMPehrOQ==
X-Received: by 2002:a05:6000:1fa9:b0:399:71d4:b8 with SMTP id ffacd0b85a97d-39ad17505efmr6306834f8f.23.1743156015550;
        Fri, 28 Mar 2025 03:00:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d8fccfe2fsm22243795e9.22.2025.03.28.03.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 03:00:15 -0700 (PDT)
Date: Fri, 28 Mar 2025 13:00:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Marc Zyngier <maz@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-scsi@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	Nishanth Menon <nm@ti.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Dhruva Gole <d-gole@ti.com>, Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Logan Gunthorpe <logang@deltatee.com>,
	Dave Jiang <dave.jiang@intel.com>, Jon Mason <jdmason@kudzu.us>,
	Allen Hubbe <allenbh@gmail.com>, ntb@lists.linux.dev,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	Michael Kelley <mhklinux@outlook.com>, Wei Liu <wei.liu@kernel.org>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	linux-hyperv@vger.kernel.org, Wei Huang <wei.huang2@amd.com>,
	Jonathan Cameron <Jonathan.Cameron@huwei.com>
Subject: Re: [patch V2 09/10] scsi: ufs: qcom: Remove the MSI descriptor abuse
Message-ID: <f0df759f-42b2-450c-90c6-25953093e244@stanley.mountain>
References: <20250313130212.450198939@linutronix.de>
 <20250313130321.963504017@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313130321.963504017@linutronix.de>

On Thu, Mar 13, 2025 at 02:03:51PM +0100, Thomas Gleixner wrote:
> @@ -1799,8 +1803,7 @@ static irqreturn_t ufs_qcom_mcq_esi_hand
>  static int ufs_qcom_config_esi(struct ufs_hba *hba)
>  {
>  	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> -	struct msi_desc *desc;
> -	struct msi_desc *failed_desc = NULL;
> +	struct ufs_qcom_irq *qi;
>  	int nr_irqs, ret;
>  
>  	if (host->esi_enabled)
> @@ -1811,47 +1814,47 @@ static int ufs_qcom_config_esi(struct uf
>  	 * 2. Poll queues do not need ESI.
>  	 */
>  	nr_irqs = hba->nr_hw_queues - hba->nr_queues[HCTX_TYPE_POLL];
> +	qi = devm_kcalloc(hba->dev, nr_irqs, sizeof(*qi), GFP_KERNEL);
> +	if (qi)

This NULL check is reversed.  Missing !.

regards,
dan carpenter

> +		return -ENOMEM;
> +
>  	ret = platform_device_msi_init_and_alloc_irqs(hba->dev, nr_irqs,
>  						      ufs_qcom_write_msi_msg);

