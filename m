Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640BA205E26
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 09:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738660928; cv=none; b=L1DWf0ukG2npOj7vGe5vU5amnOUsTKRu7g1rdsksNxO8SiDu9S4lrZ2NBSKc09fwk7KZZ3UncXJF/dQSwTtif8GqO/ST4WF+GldahPaD/LXcuBb5VRXEj7jt8Lemb/ly60+T5NWE4JDLB6Ue06membEe3qzwO55ykLv1J5kwI6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738660928; c=relaxed/simple;
	bh=Pe4d8kIUN5zoh93SY5cGANpckrQhty2Yz3aKij2IXSo=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NRO4i5yIiMqkVqzvAnVujjepAjMUCNs3OAww26p5jpgob8j9xaS0BVFKcT+tVZ7VTLa+3aWhOkELLJM4oi6QJoauM2Fbd0eD/6qVQK10OQU6KbqNsSYM6CR8TtWK3VfWoo3pDUytQghljItJXUl8uuvA9iSnLGuSk4v9ZrQJTPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=kEtbyw7x; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kEtbyw7x"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5149Lsek2368541
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 4 Feb 2025 03:21:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738660914;
	bh=8cN5+tDhDsOjCuLX6KKfkJAHkDeJm18uVS+YxjH5TI8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=kEtbyw7xkmCyRFUQCniMkJIGyVu30MUDFqNElzZNPHs07W3GUWk2sULruzO9aPOcz
	 mIW4jzYl8MQMpxkbOh+8LlEtUrVHAITcQMMk1RhY/YdOWDJFoVqcf/AscTRVUPSuz8
	 UU43fSFq4Zt5ZhM/VEPFvYxYNebsGbcnes/8z/TY=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5149Ls3D082798;
	Tue, 4 Feb 2025 03:21:54 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Feb 2025 03:21:53 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Feb 2025 03:21:53 -0600
Received: from localhost (lcpd911.dhcp.ti.com [172.24.227.226])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5149LqRv035601;
	Tue, 4 Feb 2025 03:21:53 -0600
Date: Tue, 4 Feb 2025 14:51:52 +0530
From: Dhruva Gole <d-gole@ti.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>,
        Pankaj Dubey
	<pankaj.dubey@samsung.com>,
        Will McVicker <willmcvicker@google.com>,
        John
 Madieu <john.madieu.xa@bp.renesas.com>,
        Nishanth Menon <nm@ti.com>, Vaishnav
 Achath <vaishnav.a@ti.com>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mfd: syscon: Restore device_node_to_regmap() for
 non-syscon nodes
Message-ID: <20250204092152.iyjqcz25jp6uelci@lcpd911>
References: <20250124191644.2309790-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250124191644.2309790-1-robh@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Jan 24, 2025 at 13:16:44 -0600, Rob Herring (Arm) wrote:
> Commit ba5095ebbc7a ("mfd: syscon: Allow syscon nodes without a
> "syscon" compatible") broke drivers which call device_node_to_regmap()
> on nodes without a "syscon" compatible. Restore the prior behavior for
> device_node_to_regmap().
> 
> This also makes using device_node_to_regmap() incompatible with
> of_syscon_register_regmap() again, so add kerneldoc for
> device_node_to_regmap() and syscon_node_to_regmap() to make it clear
> how and when each one should be used.
> 
> Fixes: ba5095ebbc7a ("mfd: syscon: Allow syscon nodes without a "syscon" compatible")
> Cc: Will McVicker <willmcvicker@google.com>
> Cc: John Madieu <john.madieu.xa@bp.renesas.com>
> Cc: Nishanth Menon <nm@ti.com>
> Reported-by: Vaishnav Achath <vaishnav.a@ti.com>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  drivers/mfd/syscon.c | 29 ++++++++++++++++++++++++++---
>  1 file changed, 26 insertions(+), 3 deletions(-)

Tested this for basic boot on TI K3 AM625-SK with next-20250204.
Tested-by: Dhruva Gole <d-gole@ti.com>

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated
