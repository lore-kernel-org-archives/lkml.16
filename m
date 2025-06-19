Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1D1219A6B;
	Thu, 19 Jun 2025 06:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750313131; cv=none; b=mGrPq5o5CoqVj/SuQIuDxkFA7lKhz04p3jQRVeKyz4Ibk4tIkezBTJk/CbjNPtmjLHEl+s83RdorMvnUbnXj6d9itsfRZ3ZhShAJk+yNouEeQpa+CvlNqA9xdIPEJoabJPkvtLa/HmuLZz36nbu7iAfeTJcEIjfFJuo3hWDey4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750313131; c=relaxed/simple;
	bh=Ogiw8EsJ+KJIyBByYR9AOX0+PVQFpvWshZyaLqVVN5w=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gG1vKrYFD0FxwXfpHmOhgT1+KNSmmVFKxcjjRzKE74kWKJbo6W7S6SmZTZwf5Qt0ZGsgyN+INnduU23812R+m839dD1YGAAfeCQuq7vV2eKSw5cJDRc9IoJalosYFJ6iYy4U9OCgRhyhqlzwNdFqBbw/EHyOQAO/8zUxJJa5PVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=eAtYBi/h; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="eAtYBi/h"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55J65MYE501592;
	Thu, 19 Jun 2025 01:05:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750313122;
	bh=YK+Gj/0u2hys6DnhOqcAJq/Yz44aEkVVmMrGi6rPzMI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=eAtYBi/hBnw4kRlaFXvk186EPxxrHHAg11Q3O7cYXYUk2gj31e0KeQpCfoRjnWb2X
	 /sXQe5pYzAJ5muMMQY63rJrMVEK7HZ5VTdrThPFFtn6TzxbmvCJMeuppQxYASk3jxV
	 VDOpWDCeHcpc/yGJ88fB44e0Yki42JXMdfUQRItc=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55J65Mc71060565
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 19 Jun 2025 01:05:22 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 19
 Jun 2025 01:05:21 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 19 Jun 2025 01:05:21 -0500
Received: from localhost (uda0492258.dhcp.ti.com [172.24.227.169])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55J65L6W627745;
	Thu, 19 Jun 2025 01:05:21 -0500
Date: Thu, 19 Jun 2025 11:35:20 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Hrushikesh Salunke <h-salunke@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <s-vadapalli@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <danishanwar@ti.com>, <srk@ti.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-am69-sk: Add idle-states for
 remaining SERDES instances
Message-ID: <afb54fe8-a271-4074-8249-669219954c4c@ti.com>
References: <20250609115921.2380611-1-h-salunke@ti.com>
 <ec2c7fab-6f4d-4163-90a9-16dddec80adb@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ec2c7fab-6f4d-4163-90a9-16dddec80adb@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Wed, Jun 11, 2025 at 06:23:24PM +0530, Siddharth Vadapalli wrote:
> On Mon, Jun 09, 2025 at 05:29:21PM +0530, Hrushikesh Salunke wrote:
> > In AM69 SoC there are 4 instances of the 4 lane SERDES. So in
> > "serdes_ln_ctrl" node there are total 16 entries in "mux-reg-mask"
> > property. But "idle-states" is defined only for the lanes of first two
> > SERDES instances. For completeness, set the "idle-states" of lanes of
> > remaining SERDES instances to a default value of "unused".
> > 
> > Signed-off-by: Hrushikesh Salunke <h-salunke@ti.com>
> 
> Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>

I failed to notice that this change will introduce a regression on
AM69-SK for CPSW AND Display which rely on the SERDES Lane Mapping for
SERDES2 and SERDES4 being at their reset value of "zero". This patch
should be fixed by updating it to the following:

	<J784S4_SERDES2_LANE0_IP2_UNUSED>, <J784S4_SERDES2_LANE1_IP2_UNUSED>,
	<J784S4_SERDES2_LANE2_QSGMII_LANE1>, <J784S4_SERDES2_LANE3_QSGMII_LANE2>,
	<J784S4_SERDES4_LANE0_EDP_LANE0>, <J784S4_SERDES4_LANE1_EDP_LANE1>,
	<J784S4_SERDES4_LANE2_EDP_LANE2>, <J784S4_SERDES4_LANE3_EDP_LANE3>;


Regards,
Siddharth.
