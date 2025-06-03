Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD952AD02;
	Tue,  3 Jun 2025 10:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748945247; cv=none; b=pNopLPRBILYClGrDZWWqD6ElmfBVQudEcfkdb/1UJt1PsALwARgKCrCj4X/89POAmPveNrZFkLz1lhiFKk6jAjPtjnXYzCJxKg+Sivw2cyfsBqUDFF6/GGTzdb2rMGiLa3WQm+y0feoylCd2uJv8BZ6CYFi44o+aZywR16a+MoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748945247; c=relaxed/simple;
	bh=4NNt+oonThJOyr3r1o3U420YqiKyFl0lFLan4yT5x4I=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sSrCrL5Mzx/s0sYEU7o30ebRAzMW6OiHWtg6ag4OrUW6TYxMIRZlP9hAZ0LEtoU6VlA9HbUEi48Fy7cr8rsCK7nxzVxtVR5N3YawFpTZ0h95lH+/KV7fTpWhiH+4uiOug8AqTSgguj5oUMy24N2jwOnt+/Vl8N3zPDevmGnYGds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=BlCeF9SJ; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="BlCeF9SJ"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 553A7GDS434785;
	Tue, 3 Jun 2025 05:07:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748945236;
	bh=ul6C1jde32+k/Ax4bB5nm+Dxftnf31QUbJjxwxORUjc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=BlCeF9SJIC7cQ2Gn1x8JzXOkHClw4e0EOz1jplTy7koht6jBo1yColXPf4Wv45TES
	 lwB7rc4qaAoui/7RCyvLf94YVF8Hg0lf/vlPk5352S3j77FVcEMy827Im3Pc0dDGtY
	 DOJs7Y+LIdXiE4G4opJhwZ+o3n6QBUPtSxN3k0/A=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 553A7Gn41246250
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 3 Jun 2025 05:07:16 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Jun 2025 05:07:15 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Jun 2025 05:07:15 -0500
Received: from localhost (uda0492258.dhcp.ti.com [172.24.227.169])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 553A7Fun181914;
	Tue, 3 Jun 2025 05:07:15 -0500
Date: Tue, 3 Jun 2025 15:37:14 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Jayesh Choudhary <j-choudhary@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <devicetree@vger.kernel.org>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <s-vadapalli@ti.com>, <rogerq@kernel.org>,
        <afd@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/4] arm64: dts: ti: k3-j721e-main: Make the "scm_conf"
 node a "simple-bus"
Message-ID: <0cda49d8-bab3-4197-a6e7-0da39da73bfd@ti.com>
References: <20250603095609.33569-1-j-choudhary@ti.com>
 <20250603095609.33569-2-j-choudhary@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250603095609.33569-2-j-choudhary@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Tue, Jun 03, 2025 at 03:26:06PM +0530, Jayesh Choudhary wrote:
> The "scm_conf" bus need not be "syscon". Now that we have "pcie*_ctrl"
> child nodes for "ti,syscon-pcie-ctrl" property in "pcie" nodes, change
> "scm_conf" node to "simple-bus".
> Also remove "reg" property as it is not needed by "simple-bus".
> 
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Regards,
Siddharth.
