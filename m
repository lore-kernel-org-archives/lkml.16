Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A684426A098;
	Tue,  8 Apr 2025 10:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744107697; cv=none; b=XmEtC5qr0n16zCck+fl7SyxFe3f+BWKYtpsh/SD6GImKp8kSvHKBgIYXAq/niXQhqw9J5kD42O9qhrESLMvSzVcLbApuHW7Ge1B6RKUOFduzu7va8A8UVmpXjCR5otfJskRMaRRI4OSosna6t0JpDTRm9qbaWOuPR5G+QdIrFAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744107697; c=relaxed/simple;
	bh=nETQKSnCcvm1AKuhmE8CfkD32LpdKCI5lwW/Zi5YJrk=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RmaA+HyZi8RgCrhpLfSDr0AGnGcqPnljNtRGJXWXCBhzV6cO5lDmztYgWq+2hebry592CPTMRFT9xW8wBvHuWq6Xk1EGwPsRoFg6tJwcFC5n+YfzobIIgN1FbSd7bky1IoznNJHYq/iHwjq/jPwG9i2M4KclrwbaSUznOYYatRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=jkEDR1JB; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jkEDR1JB"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 538ALT6e502981
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Apr 2025 05:21:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744107689;
	bh=wduqzuUnyN4v6B979S2NkcvhwxgSQYfa7l4KxdYqumQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=jkEDR1JBjJ4DR4EYmAYLvk52/VVVopl++GdGfwpP5+26Mvr/PXpar4Ff6NbmJ99oa
	 ut/KdUUfUC3vvkPM1WxQ89gkjdQPjt5rXf3STJILjDl5l477r3kzqCob4oYxR/OMQ5
	 r73sb8jjjRUsgwVTMceIDAVL9XaIMfPFVzVKOohY=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 538ALSih117396
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Apr 2025 05:21:29 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 8
 Apr 2025 05:21:28 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 8 Apr 2025 05:21:28 -0500
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 538ALRuv130575;
	Tue, 8 Apr 2025 05:21:27 -0500
Date: Tue, 8 Apr 2025 15:51:26 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: Re: [PATCH 0/2] J722S: Disable WIZ0 and WIZ1 in SoC file
Message-ID: <20250408102126.uzmhkkt5ebiaotvq@uda0492258>
References: <20250408060636.3413856-1-s-vadapalli@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250408060636.3413856-1-s-vadapalli@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Tue, Apr 08, 2025 at 11:36:34AM +0530, Siddharth Vadapalli wrote:
> Hello,
> 
> This series disables the "serdes_wiz0" and "serdes_wiz1" device-tree
> nodes in the J722S SoC file and enables them in the board files where
> they are required along with "serdes0" and "serdes1". There are two
> reasons behind this change:
> 1. To follow the existing convention of disabling nodes in the SoC file
>    and enabling them in the board file as required.
> 2. To address situations where a board file hasn't explicitly disabled
>    "serdes_wiz0" and "serdes_wiz1" (example: am67a-beagley-ai.dts)
>    as a result of which booting the board displays the following errors:
>      wiz bus@f0000:phy@f000000: probe with driver wiz failed with error -12
>      ...
>      wiz bus@f0000:phy@f010000: probe with driver wiz failed with error -12

Since this series fixes the above errors on Beagley-AI, I will include
the "Fixes" tag in the commit message of the respective patches in this
series and post the v2 series.

Regards,
Siddharth.
