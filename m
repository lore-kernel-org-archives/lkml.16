Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0990433AC;
	Wed,  9 Apr 2025 11:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744197230; cv=none; b=PvQ3IjiFa47bq6gSo1Ld3/7RCSuON2RxJpydk9v05xhQIjH1y4+jIqe4+XXtV67MMRGjPWYB4AxBj4k7jAWY8oRrQFCVGeek3C5wL0olC6YlkOBpQEntffSs3+QC8VpQY3tMbM5toW89hf+rRcMe92hcCXIZVyrD2XGxcs5dxrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744197230; c=relaxed/simple;
	bh=qvZ41SeZUWTJUM2/0wOjudaZGd/o08OfWeoXOJTa5LQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mlD54hVIctHwKpbRVqyAMhlgq/4M+stztxPpojLb11rb74qke890oRsR6plwTeOeONmEBJl0r9oU2jwpxpUn9Gpe74DpkhzA3ISxPFDccLwL0/CdxR5ceeM/JhpYd1w8RAijhuMA3MBPkDiv26F4BzWsCyKLNzPDfyRW8BU+ufY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ndkVFXp2; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=T3ygFDei; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ndkVFXp2";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="T3ygFDei"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744197226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1UIP4ZGix9p5MaH9RHiON2iNZ1qNwydPjYtJFAn6h60=;
	b=ndkVFXp2m4OiYv7D2NIsqsFhmpQaMrSMq4M/Fxl214eOX7BqCBLgBejQ21mYGWpaoi+Sed
	fiChITipD81wOCRi1M013UAXtjJ8J6bKfMJYV1HWIIDrukJA6EYi75IbNO9Y3p0eGnjNJj
	qxCEh2pnxJuTBIYoHrH09g6phqYuPdkGfnqjCf//lvjqIY2aU8etRxte3SLw7MEaCPoDkS
	/l6+j6s0C5wQiifRFsEnK6u/w9o2aw+nK+fSQBlY7Ks9EIm0gFH4UHtBNWirDgvr6VqJKu
	KS/1NxaCjEu+Vg4I1Y2I8mlQqJFIlJzoAhpOnOPOxI38446wm31YohyCasKkMA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744197226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1UIP4ZGix9p5MaH9RHiON2iNZ1qNwydPjYtJFAn6h60=;
	b=T3ygFDeiKIpY65OR/wfBjvG7m5xLPXI2LXSCfvJFe1hMWt2WW8vCSUQfhLAenBcfB8+5oZ
	dJ6r7/B2gnhDWvBA==
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier
 <maz@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>, Timothy Hayes
 <timothy.hayes@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Lorenzo
 Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH 22/24] irqchip/gic-v5: Add GICv5 ITS support
In-Reply-To: <20250408-gicv5-host-v1-22-1f26db465f8d@kernel.org>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-22-1f26db465f8d@kernel.org>
Date: Wed, 09 Apr 2025 13:13:46 +0200
Message-ID: <87tt6xtwnp.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Apr 08 2025 at 12:50, Lorenzo Pieralisi wrote:
>  
> +void gicv5_irs_syncr(void)
> +{
> +	u32 syncr;
> +	u32 statusr;
> +	int ret;
> +	struct gicv5_irs_chip_data *irs_data;
> +
> +	irs_data = list_first_entry_or_null(&irs_nodes,
> +					    struct gicv5_irs_chip_data, entry);
> +	if (WARN_ON(!irs_data))
> +		return;
> +
> +	syncr = FIELD_PREP(GICV5_IRS_SYNCR_SYNC, 1);
> +	irs_writel(irs_data, syncr, GICV5_IRS_SYNCR);
> +
> +	ret = readl_relaxed_poll_timeout_atomic(
> +			irs_data->irs_base + GICV5_IRS_SYNC_STATUSR, statusr,
> +			FIELD_GET(GICV5_IRS_SYNC_STATUSR_IDLE, statusr), 1,
> +			USEC_PER_SEC);
> +
> +	if (ret == -ETIMEDOUT)
> +		pr_err_ratelimited("SYNCR timeout...\n");

This timeout poll thing looks very familiar by now. Third variant :)

> +static int gicv5_its_wait_for_invalidation(struct gicv5_its_chip_data *its)
> +{
> +	int ret;
> +	u32 statusr;
> +
> +	ret = readl_relaxed_poll_timeout_atomic(
> +			its->its_base + GICV5_ITS_STATUSR, statusr,
> +			FIELD_GET(GICV5_ITS_STATUSR_IDLE, statusr), 1,
> +			USEC_PER_SEC);
> +
> +	if (ret == -ETIMEDOUT)
> +		pr_err_ratelimited("STATUSR timeout...\n");
> +
> +	return ret;
> +}

And number four follows suit :)

> +
> +static void gicv5_its_syncr(struct gicv5_its_chip_data *its,
> +			    struct gicv5_its_dev *its_dev)
> +{
> +	int ret;
> +	u64 syncr;
> +	u32 statusr;
> +
> +	syncr = FIELD_PREP(GICV5_ITS_SYNCR_SYNC, 1) |
> +		FIELD_PREP(GICV5_ITS_SYNCR_DEVICEID, its_dev->device_id);
> +
> +	its_writeq(its, syncr, GICV5_ITS_SYNCR);
> +
> +	ret = readl_relaxed_poll_timeout_atomic(
> +			its->its_base + GICV5_ITS_SYNC_STATUSR, statusr,
> +			FIELD_GET(GICV5_ITS_SYNC_STATUSR_IDLE, statusr), 1,
> +			USEC_PER_SEC);
> +
> +	if (ret == -ETIMEDOUT)
> +		pr_err_ratelimited("SYNCR timeout...\n");
> +}

Along with #5 

Thanks,

        tglx
