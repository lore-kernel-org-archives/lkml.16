Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE942E54A3;
	Thu,  3 Jul 2025 12:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751545774; cv=none; b=HN2KiuTeO6wjdacBY1ni50AQsSNKXi1n7W5Y5wK7r/2tQUETtCzILj502cOcpZcsIxMsse+XtsVZLtDmI9RvDavTkX0xS/8JGkCsGmm/lKFdjvEiOLOxjZfJZ54BIhs9BogJdStVzqw2a3+bB6TY5GaIBCKb8vxtb0NKWSGEKt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751545774; c=relaxed/simple;
	bh=K8/EHraQ8aTm3z4RyUSswD+kGyG4M7jw0E+V20Jl/LU=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W0lYxOSV0SOC+LlgQRbeHf5JFOAqYWD2hEiatnEZPHZHu7L/9i7lOZyibCf8/cyE0AHhe/uodAHdNMwg4p6PBWHkfw3/ufMeODWS/pf1VFVfOB2iJDDTcjDtK8H+bKUD0maDxzPIJvW3YQHBgSKzPpj2HdtULE7wBL2i2/i3cCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=c7DGm9E0; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="c7DGm9E0"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 563CTK8v019018;
	Thu, 3 Jul 2025 07:29:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751545760;
	bh=gRGh0xj2sFwXyDAbZuoSz3Vo8ynObNCqrGhzTXEKe0U=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=c7DGm9E0FbN4Y4wHnT/8eA7m9OtbdlnZy7tvegICLYXIuWrXApoESA8Q1hwEsZQWM
	 13QaQqXjp1RmOzDlUC6WCr1yKUh9BxXh4ICJKup90yiryutZo1fSoctaLvkyOGtE8E
	 s2XB1DGoi+JuBmXuDxYiEntckbwK/XDFI79sgY6w=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 563CTKDN2328478
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 3 Jul 2025 07:29:20 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 3
 Jul 2025 07:29:19 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 3 Jul 2025 07:29:19 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 563CTJHM1104720;
	Thu, 3 Jul 2025 07:29:19 -0500
Date: Thu, 3 Jul 2025 07:29:19 -0500
From: Bryan Brattlof <bb@ti.com>
To: Andrew Davis <afd@ti.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: Enable overlays for all DTB files
Message-ID: <20250703122919.yif56scd6fclnrle@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250702145314.71996-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250702145314.71996-1-afd@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On July  2, 2025 thus sayeth Andrew Davis:
> Allow overlays to be applied to any DTB without manually enabling it
> for each file. This adds around ~10% to the total size of the DTB files
> on average.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
> 
> Note that Broadcom's DTS already do this, so there is precedent for this.
> And we do this unconditionally in our Yocto Distros[0] already, this just
> moves this so everyone gets overlay support for all boards.
> 
> [0] https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc#n5
> 
>  arch/arm64/boot/dts/ti/Makefile | 22 +---------------------
>  1 file changed, 1 insertion(+), 21 deletions(-)

With the current size of the kernel and initrd these days, +10% of a few 
KBs is not even a rounding error IMHO :)

Acked-by: Bryan Brattlof <bb@ti.com>

~Bryan
