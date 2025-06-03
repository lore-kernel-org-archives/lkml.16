Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260E6229B18;
	Tue,  3 Jun 2025 10:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748945285; cv=none; b=kkwRlncbb8qPUfwxp8we3K1wYfmUubp1OSs9kPlDRbyMqrpfGy7UpXBeb1+oNEVKoxaP6yxzqan5eaa0F8JaTCIKtOC+4v9tOzJn0WBaL8gKPZtmf+g69opkZmGmvN8/QzfYAiQyH4NN8IUYzLo9sokroH3EQE9a9N8/yjrKt/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748945285; c=relaxed/simple;
	bh=fyJqtLaTmmjd3JQN2ayURXOocJTaZNwtij3fVj9V84o=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YUGF/KlOmtB7pEvAyfXANQqiWeg+zw6G4u3J+TorYOTJHady9kXnsK5PX4KsxgSqDQ6E/1Kk9XpUESg0Sx3SftN5upxI4MnaKSj+NRsz5PYZcuT3nRkld4h1v+lMvS6QQguwk+MXI4q+4EKdEQjqAl0niPMOh/yfW0F4H2ZRNTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=o+3aDeys; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="o+3aDeys"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 553A7xI7435063;
	Tue, 3 Jun 2025 05:07:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748945279;
	bh=xDKYE0RUpwu1znZZ0ZxqvSRJT4VZQqn6KZ9hJd3Cbes=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=o+3aDeysJ9Xk8Fpn90vvtO6PSDcTcMcg6oCz7OEQmO/OmmV6gyqckSLgmz5WE1Dwp
	 2O5/6F8j6Wm3QN6Sm1IwG3ClLNwo1UHycSLdQE/B5LeJK24gPvdNnm8OUjblHbRR9b
	 QpEWYbXByadDZyj4Zl0kZWsV13oOsBKRjimaLWp8=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 553A7x7T3669969
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 3 Jun 2025 05:07:59 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Jun 2025 05:07:59 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Jun 2025 05:07:59 -0500
Received: from localhost (uda0492258.dhcp.ti.com [172.24.227.169])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 553A7wqC182526;
	Tue, 3 Jun 2025 05:07:58 -0500
Date: Tue, 3 Jun 2025 15:37:57 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Jayesh Choudhary <j-choudhary@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <devicetree@vger.kernel.org>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <s-vadapalli@ti.com>, <rogerq@kernel.org>,
        <afd@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 4/4] arm64: dts: ti: k3-j784s4-j742s2-main-common: Remove
 "reg" from "scm_conf"
Message-ID: <ae4c61e8-570d-456f-8af7-428c565f23da@ti.com>
References: <20250603095609.33569-1-j-choudhary@ti.com>
 <20250603095609.33569-5-j-choudhary@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250603095609.33569-5-j-choudhary@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Tue, Jun 03, 2025 at 03:26:09PM +0530, Jayesh Choudhary wrote:
> Remove "reg" property from "scm_conf" node as it is not needed by
> "simple-bus".
> 
> Fixes: 7287d423f138 ("arm64: dts: ti: k3-j784s4-main: Add system controller and SERDES lane mux")
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Regards,
Siddharth.
