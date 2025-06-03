Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698E71FBE83;
	Tue,  3 Jun 2025 10:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748945265; cv=none; b=VCSPup8ZZ27AB0yaftFglGxt7wu4/T0fdvQMLWeeA3tvKIkxbypKa4l+1CZbNJguGzUpcACbHhWoplzH+vwA1nye6ebKvth0y+r3VyWO/wHEHUVRNDVL2AhK0bkYt2UjJ4afNNKQcuhWH9W+O84pq5amt6C1A5dZPfF+294Ehuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748945265; c=relaxed/simple;
	bh=0KB9DHZ30l98BjT0p5Vpiito370iNfWRNS/uGnyqswY=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bOFDZn328meoYBh0N+5135jhL3HbTPghyK0Udie370VCcX3794IUxmGN3JhiLkdOEvvh3/AeiIbfxl3oWXWVrYI25dvJKBgO5GC0wjikxfxVTT/06ayxX9TdACELsgDNF65nnGXpPeqhd1KBA+/UjBCaMyURKZYpjpoVCCQBca0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ZTdrYtw+; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZTdrYtw+"
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 553A7d5T491699;
	Tue, 3 Jun 2025 05:07:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748945259;
	bh=Us19Ty/9n8yZsApwmlVDeaLsgtr1VaqGDivNaYz1zGU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ZTdrYtw+8ejrz+MiEONG/IhLdVkwNJntRs/SnsXKUSCvWhZCmUdwWsnToxJct+3zZ
	 kooD9bWptWcWax9ppNYCTFnwUeOq33dKOZrouaI4Ae66rLn40fT4PqE7LpjVrEYfxK
	 gt1rvOVMquVWKsYTESwwaGnPjBnZvFXYU5AXFLBc=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 553A7d0f3454256
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 3 Jun 2025 05:07:39 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Jun 2025 05:07:38 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Jun 2025 05:07:38 -0500
Received: from localhost (uda0492258.dhcp.ti.com [172.24.227.169])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 553A7cT1182257;
	Tue, 3 Jun 2025 05:07:38 -0500
Date: Tue, 3 Jun 2025 15:37:37 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Jayesh Choudhary <j-choudhary@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <devicetree@vger.kernel.org>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <s-vadapalli@ti.com>, <rogerq@kernel.org>,
        <afd@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 3/4] arm64: dts: ti: k3-j721s2-main: Make the "scm_conf"
 node a "simple-bus"
Message-ID: <72fc5b90-5c51-49d9-8757-1971e5dbc208@ti.com>
References: <20250603095609.33569-1-j-choudhary@ti.com>
 <20250603095609.33569-4-j-choudhary@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250603095609.33569-4-j-choudhary@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Tue, Jun 03, 2025 at 03:26:08PM +0530, Jayesh Choudhary wrote:
> The "scm_conf" bus need not be "syscon". Now that we have "pcie*_ctrl"
> child nodes for "ti,syscon-pcie-ctrl" property in "pcie" nodes, change
> "scm_conf" node to "simple-bus".
> Also remove "reg" property as it is not needed by "simple-bus".
> 
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Regards,
Siddharth.
