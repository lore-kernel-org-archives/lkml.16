Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A801A0BC9;
	Tue,  3 Jun 2025 10:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748945253; cv=none; b=HI3+8QCZ1bilYi/CSIsOk6DPFYL0cTDXe7/tGh7VsT7PC/XuQIW5Ondu8CfNHMXaHo71m7TyDLs4wcrwlbcyEe6e/HXUV3+icrlrOAHdcPlpPSgnypughsOLsTUMk9eAI92RSlqhCKLNGaJGU4s7wNd+3z9/t1PExVJxtBtS/Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748945253; c=relaxed/simple;
	bh=1OqiDLcfRix5lVitqzaskQnpC1cyTMigAOjWii/fJnQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M52yTbS8OM3UiY+ZzPJdGna1oPVpy0L6IfltL+uA23Bm9osFOAqdSGV8JQVF2bK/i8dfIXVfZq6vvDO1eZLlwSAplAa+uN0TywSOojmR7cOOoYClDqV0s0j3jI3AG8bdzdoSx2WE2tSMXGZRsCKbrb3yo7MJ+16Fbb/cptcq2Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=uc9ZcM79; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="uc9ZcM79"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 553A7RYU434801;
	Tue, 3 Jun 2025 05:07:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748945247;
	bh=9envwYzZ92clWlakOTwEB8OwjhYiaIjEdDGYyGrbM9I=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=uc9ZcM797rALfcu0pPISYFmZytwxqQlE2KwzzfUqTNUgiSkCBtCP5Zo74i2mAoVZo
	 hyLpyo/bd//gNNDXeD8peqymFytRcuiYxu7Q4MP6MuiF4rN1QdwLsF8+H4iJ6Mwk55
	 MEm+O+HqhPCWWn9hWwb0LDrxoIt3e4FgT8PU69YA=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 553A7RPW3669887
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 3 Jun 2025 05:07:27 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Jun 2025 05:07:26 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Jun 2025 05:07:26 -0500
Received: from localhost (uda0492258.dhcp.ti.com [172.24.227.169])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 553A7QFm270530;
	Tue, 3 Jun 2025 05:07:26 -0500
Date: Tue, 3 Jun 2025 15:37:25 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Jayesh Choudhary <j-choudhary@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <devicetree@vger.kernel.org>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <s-vadapalli@ti.com>, <rogerq@kernel.org>,
        <afd@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/4] arm64: dts: ti: k3-j7200-main: Make the "scm_conf"
 node a "simple-bus"
Message-ID: <953c4aae-9010-488b-aa11-4cc540cef127@ti.com>
References: <20250603095609.33569-1-j-choudhary@ti.com>
 <20250603095609.33569-3-j-choudhary@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250603095609.33569-3-j-choudhary@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Tue, Jun 03, 2025 at 03:26:07PM +0530, Jayesh Choudhary wrote:
> The "scm_conf" bus need not be "syscon". Now that we have "pcie*_ctrl"
> child nodes for "ti,syscon-pcie-ctrl" property in "pcie" nodes, change
> "scm_conf" node to "simple-bus".
> Also remove "reg" property as it is not needed by "simple-bus".
> 
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Regards,
Siddharth.
