Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DEF7083C;
	Tue, 10 Jun 2025 05:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749534680; cv=none; b=FUWWRjE8fIYCdNfNLsisqshrQfjEGNxILJpAqhofKJm4x5XlzewDoXd6eVTd4tFj6fx+yk3IqcaLnCzleqX332/5Yn40LidRfXSO0Ogkv6jTikudMttnczC48WJiWMXlrLuI0eCiYMQDodOsucpecdsxemYMkOzMYuM6B84iqo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749534680; c=relaxed/simple;
	bh=e4OTsFMMlmb+XEBaO8FUXxhnEip/H2bZYifJGe0n3+o=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z1HCeHu8SY4XC+/hqy83fGGfRR1PEd+bBPOMg2QwMs0ZXZT5TqTL6g6kiZ+buWL79AGG9Du8VfbRGX7oXXyl41OYm1HU/pptjaaGtMzXgSJMFBmwXBbNFieNtbd6Bz5aho/Az5ikAA9yM/bneUXMi2EI4XmMxc/LrbQ6MCxix+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=uF0srVgC; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="uF0srVgC"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55A5p5PG990140;
	Tue, 10 Jun 2025 00:51:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749534665;
	bh=ubVv6Vi59J/Kq5R4zgkakD6l3jcATZeCXAQgr62ypkg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=uF0srVgCv6ggp9b0C3x1VOobnO00RD68u0yRg5Abo668OpX5uvAfJ8veVlz4g6JEe
	 kNBzZjvmzL8uobW7nAjH047J54JyXWC42gDRlkRgKEFBKFb2btsOQxOwEgl/NjS0ow
	 Axtd3/gx00w8KS1NcyPv41eqDSy0J/0KWDssv/3s=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55A5p5551902086
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 10 Jun 2025 00:51:05 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 10
 Jun 2025 00:51:05 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 10 Jun 2025 00:51:05 -0500
Received: from localhost ([172.24.227.169])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55A5p4ic2424215;
	Tue, 10 Jun 2025 00:51:04 -0500
Date: Tue, 10 Jun 2025 11:21:03 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Hrushikesh Salunke <h-salunke@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <s-vadapalli@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <danishanwar@ti.com>
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am642-evm-pcie0-ep: Add boot phase
 tag to "pcie0_ep"
Message-ID: <88554900-b280-425f-b79d-d065b10290a5@ti.com>
References: <20250610054920.2395509-1-h-salunke@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250610054920.2395509-1-h-salunke@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Tue, Jun 10, 2025 at 11:19:20AM +0530, Hrushikesh Salunke wrote:
> AM64X SoC has one instance of PCIe which is PCIe0. To support PCIe boot
> on AM64X SoC, PCIe0 needs to be in endpoint mode and it needs to be
> functional at all stages of PCIe boot process. Thus add the
> "bootph-all" boot phase tag to "pcie0_ep" device tree node.
> 
> Signed-off-by: Hrushikesh Salunke <h-salunke@ti.com>

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Regards,
Siddharth.
