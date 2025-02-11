Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8140262171
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 17:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739294497; cv=none; b=pYaw92CfhrJ1RUFxRxbKG8IrCXJlLzoCtj8tpTwSPvyubZTBddE3FCDzDnDmuNLBsk0Sto7MCSyKunSTH2aF5bcUv8iKUfthjUc0ty153pxkXa8qQ2hJuE3/hQhmSnj7SXquV0Bzk1/7oLTjUD/CKs9YuYpMVgrTEIw3AL08rnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739294497; c=relaxed/simple;
	bh=wpqNQV32wwuzU7KuRVIuBU6OCxwGFa2PYAN0afq+VhI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=joONWzLoioGETgSAyS3oLtN6yB6VF/fImZ2FkR2S8NHZLTARzKhD97lOfB12a28gI2gfaT2SlP79F0zvhNEmWvoSSCKVqrKfjuf4Ra6pL5mftZi4B1i6yC2agFzz+BG4t39jFn3u9YVJfjgHMtrchHJNwPo4oIWh6OfGcSJwP+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=LTsvDAhs; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="LTsvDAhs"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51B4w02E021617;
	Tue, 11 Feb 2025 11:21:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=qANaQhwI9DPELG1hOOxZWma4nEJ58RRmyMHxC248s2w=; b=
	LTsvDAhs2s11FwOO4caOF+bIYdSdNBv6aKY9Dtfz6f98jSaI52AiVpE9yckPR7w1
	eWolKne7xN7LcXZQXo5sAFhk5jD7EqhcnRIXeQ9/Q7e1dX5xx4N4SOdhy3LXiVyt
	EnzqDO6h68f5+L+PS6h2B0emdDhSbDdarMAJYIk2EM2Vvrcw+GVzVp6Va0e2w4bB
	unIe8IiNNV28FodaNHWqpwLPuMr5p/y/YGIhiKue55bpEh7rz01dUjCLOSLkyCyw
	QKEajm8rg4SFO21UxCf51G2ZUwMbJKqmR2ZR4GzIRnhC3sfqyh6ObTLo2Z+EjWaT
	XD+twrn2fBaq7OSn+UMAug==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 44p5j752nt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 11:21:10 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 11 Feb
 2025 17:21:08 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Tue, 11 Feb 2025 17:21:08 +0000
Received: from [198.90.208.18] (ediswws06.ad.cirrus.com [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 18A61820248;
	Tue, 11 Feb 2025 17:21:08 +0000 (UTC)
Message-ID: <0e9c1cca-592f-4983-93f4-ab2f76a3c97e@opensource.cirrus.com>
Date: Tue, 11 Feb 2025 17:21:08 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] firmware: cs_dsp: Remove usage of GFP_DMA
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
        "Simon Trimmer" <simont@opensource.cirrus.com>,
        Charles Keepax
	<ckeepax@opensource.cirrus.com>,
        Mark Brown <broonie@kernel.org>
CC: <patches@opensource.cirrus.com>, <linux-kernel@vger.kernel.org>
References: <20250211-cs_dsp-gfp_dma-v1-0-afc346363832@linutronix.de>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20250211-cs_dsp-gfp_dma-v1-0-afc346363832@linutronix.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EPD800ZC c=1 sm=1 tr=0 ts=67ab8706 cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=xrMomawZRJLbmtPqatQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: DL1WQ917TdbL_decKwckp_wOfUuompju
X-Proofpoint-ORIG-GUID: DL1WQ917TdbL_decKwckp_wOfUuompju
X-Proofpoint-Spam-Reason: safe

On 11/02/2025 5:03 pm, Thomas Weißschuh wrote:
> Also drop the bounce buffer in cs_dsp_coeff_write_ctrl_raw().
> 
> The bounce buffer in cs_dsp_coeff_write_ctrl_raw() could theoretically
> also be removed. That would be a functional change as the output may be
> modified in error cases.
> As I don't know the driver very well I left that part out.
> 
> Not tested on real hardware.
> This came up while porting kunit to mips64.
> Apparently GFP_DMA does not work there, but IMO the usage of GFP_DMA by
> cs_dsp is unnecessary in the first place.
> 

You're sure that all I2C and SPI bus controllers now handle non-DMA-safe
buffers correctly?

> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> ---
> Thomas Weißschuh (2):
>        firmware: cs_dsp: Remove usage of GFP_DMA
>        firmware: cs_dsp: Remove bounce buffer in cs_dsp_coeff_write_ctrl_raw()
> 
>   drivers/firmware/cirrus/cs_dsp.c | 15 +++------------
>   1 file changed, 3 insertions(+), 12 deletions(-)
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250211-cs_dsp-gfp_dma-0581bdd09dd5
> 
> Best regards,

