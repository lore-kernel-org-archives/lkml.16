Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EFE1FDE19
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 11:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746790373; cv=none; b=VhGaBJWzLJWDNJyKXLW/YZsUtm0rRWX9tRBDnZlGEPt9p5fMfAMHsshXZE9s2mBSMZMvzcrvTe6ahjkdWeTvf5pbmiHV/HjFQ6+ybRkzA88Ca/iqLuR9NdrErxnOfy2qUWKTwZb52YSR7U7iriw9IMNVbblQj8jpOJBy22L3GQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746790373; c=relaxed/simple;
	bh=fECvtAxE8b7X7GjAA3zCTwu/8sUjdEey/3Ep1Ox374U=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U3dMHpvMVBD0dqzbZakXX6BFIdYNQVtN/6x2i9IAsNT1mPnix38cSVpljL7bpd6ZCr+icjHw16qOd5M6f9+c0Z9E1Uq8I1kSndPHzVnG2dgkUx4xajDBA6CSKGVTK43+HpwbZAm251qpTKIOFRdfFSdSL2fu8DOaTARPYjddnQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=dAmm3ZkO; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="dAmm3ZkO"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 549BWdrC1390739
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 May 2025 06:32:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746790359;
	bh=qSETgrsVMB4OUyqU4p3tpNCMc9bknN2FBok7iwVPUnA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=dAmm3ZkO7yJ3NvTubB4FvQ9p6cj2opGD6Sx3NgNFLXWtcwppEOFgkCHIYj/9+7Xh9
	 jCFx5EyA2ncbPE6Eq8Wl4U1jisFrNHCpGHCZ2yKpjLnBn8X6GguFWUxS9eLQhZorQV
	 dEIrknq+PZid+Fx2ErE6gaVBTSmgRiFbjGsuBsAw=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 549BWdaB024266
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 May 2025 06:32:39 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 May 2025 06:32:39 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 May 2025 06:32:39 -0500
Received: from localhost (lcpd911.dhcp.ti.com [172.24.227.226])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 549BWcbG092720;
	Fri, 9 May 2025 06:32:39 -0500
Date: Fri, 9 May 2025 17:02:38 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
CC: Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/1] soc: ti: wkup_m3_ipc: Use dev_err_probe
Message-ID: <20250509113238.sjj5lj47hh3y4hts@lcpd911>
References: <20250509093652.1866566-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250509093652.1866566-1-alexander.stein@ew.tq-group.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On May 09, 2025 at 11:36:52 +0200, Alexander Stein wrote:
> During probe the mailbox channel might not yet be available. Use
> dev_err_probe to silence this deferred probe error message:
> wkup_m3_ipc 44e11324.wkup_m3_ipc: IPC Request for A8->M3 Channel failed! -517
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/soc/ti/wkup_m3_ipc.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/soc/ti/wkup_m3_ipc.c b/drivers/soc/ti/wkup_m3_ipc.c
> index 79dde9a7ec639..5845fc652adcf 100644
> --- a/drivers/soc/ti/wkup_m3_ipc.c
> +++ b/drivers/soc/ti/wkup_m3_ipc.c
> @@ -644,11 +644,9 @@ static int wkup_m3_ipc_probe(struct platform_device *pdev)
>  
>  	m3_ipc->mbox = mbox_request_channel(&m3_ipc->mbox_client, 0);
>  
> -	if (IS_ERR(m3_ipc->mbox)) {
> -		dev_err(dev, "IPC Request for A8->M3 Channel failed! %ld\n",
> -			PTR_ERR(m3_ipc->mbox));
> -		return PTR_ERR(m3_ipc->mbox);
> -	}
> +	if (IS_ERR(m3_ipc->mbox))
> +		return dev_err_probe(dev, PTR_ERR(m3_ipc->mbox),
> +				     "IPC Request for A8->M3 Channel failed!\n");

Reviewed-by: Dhruva Gole <d-gole@ti.com>

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated
