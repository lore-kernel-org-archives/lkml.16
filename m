Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CEB2F43
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 19:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745004521; cv=none; b=VU32DMWj62zF64v2rIFtfXFdrWxyBExXB2HTdqn3Fr0g+86nJyIZw2aZn59eNPx2AH6b347U9GDV0HuXP3XtlrXv4GTv9DI9OkQPpC4f5zmXRnQeu/IaJ7P3J75l3Jtnu/go+9zdSA539c0tvujGgphEWkyGuMJT+SVTrewNNg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745004521; c=relaxed/simple;
	bh=pldKwZeWZ/TTY/3g7iYVb3KfoWWlepwU0moIQdJxB5Q=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZJCwoxp+ADcKsVU7Zk82f14Gt26cd3fWtE5nxykXsJ4QdYyx8VHI+vpY5ATm8bQS09YNTxxpzXe2AUyepO0RtaEDSKjvJSs2puRilDTAUvK8TuBRlbI+qJpkztOnKsNSb6eQadmj182YesdrSRCyMPirPCFC14fVZpNXoKQrhDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=vfR37JR4; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vfR37JR4"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53IJSXHU1006059
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 14:28:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745004513;
	bh=XLbyLsf9FX0KbpSXX6bUE1SzNZRH7YkQFATpdZmpDj8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=vfR37JR4ziX3aKK7Sc5kZ1T6B8WdM2lLYwnxsKwAa5pL5DqJHZB6e+eIjVHK6Qwi+
	 S7TA2pFd8Mh8y/4lGTNhRkq3zjss80sN5fllVkP4uY/0T0g5gvOiVejcfYBaNHTXYd
	 csS0gWpo20a6BNwV3hDWCXodTacMi8V3YBLnuC9E=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53IJSX27001929
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Apr 2025 14:28:33 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 18
 Apr 2025 14:28:32 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 18 Apr 2025 14:28:32 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53IJSWcR017086;
	Fri, 18 Apr 2025 14:28:32 -0500
Date: Fri, 18 Apr 2025 14:28:32 -0500
From: Bryan Brattlof <bb@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
CC: Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] soc: ti: k3-socinfo: Add JTAG ID for AM62LX
Message-ID: <20250418192832.tw22jacridxoaw2q@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250417084904.2869369-1-vigneshr@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250417084904.2869369-1-vigneshr@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On April 17, 2025 thus sayeth Vignesh Raghavendra:
> Add JTAG ID information for AM62Lx SoC so as to enable SoC detection in
> kernel.
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
>  drivers/soc/ti/k3-socinfo.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Bryan Brattlof <bb@ti.com>

~Bryan

