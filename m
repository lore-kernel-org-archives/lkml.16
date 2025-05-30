Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E261E47A5;
	Fri, 30 May 2025 04:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748580776; cv=none; b=BoRdTC8G8DUGXHMoh/+ONWnIDZjkNBxVb3MFlg4uzHCz9mOBTDziZA9hmBTUQtMugea3E9ZMWa8QP6V9zFSJleuhUDm+IWU7a7H9by/clAo5g8A/nHLI1VO1v6zP9JZkAYTSYuAuoOti1ugQ+2cVLmF0U5fIEahCKim81+6QwXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748580776; c=relaxed/simple;
	bh=lIy9lQF6KQemcmSb1H0BVpIpGPrWQCkeNWub3bZKo28=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FSm6VQbMfWDYCGQUytjVgG0MXYQoVyJLx+hCdQQ9EFL0+t91kaseNB6jN5PTi92lrhCoPM49qYuNAh9tTmNvPiUFp5ZO6lviq9H7QE8JCzFD6edILAVAodJhAsrqiBgZ+DfBZuqA0hoNYpOnxAt6MzOcSBww9UKNpcf3Kvoy1EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=HZyCGBCu; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="HZyCGBCu"
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54U4qlft2592111;
	Thu, 29 May 2025 23:52:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748580767;
	bh=ZTJ34juyqAHwoLk5x+rIDM1Ap9TP08Q7eCw87Fb5WxA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=HZyCGBCurMCFyDuypzN2LQc5vtS/R3d5H5kztRAfLqvaeeWQw6KXe6Pz2IygULZRh
	 NwDLL8ZhpH2XtNzGTu+KBKRolT1N2D1reE+aklXnmtXgFCPK0jytss4fTKpd53NR/8
	 KKS/UDM5JvK7SSlmpZCFb0W6TgOHAGnRF70GQYok=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54U4qleA578099
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 29 May 2025 23:52:47 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 29
 May 2025 23:52:47 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 29 May 2025 23:52:47 -0500
Received: from localhost (uda0492258.dhcp.ti.com [172.24.227.169])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54U4qkuW2554777;
	Thu, 29 May 2025 23:52:46 -0500
Date: Fri, 30 May 2025 10:22:45 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>
Subject: Re: [PATCH 01/13] arm64: dts: ti: k3-am625-beagleplay: Enable
 "cpsw3g" in the board file
Message-ID: <de244dbc-774c-465f-99a2-17d452085986@ti.com>
References: <20250529133443.1252293-1-s-vadapalli@ti.com>
 <20250529133443.1252293-2-s-vadapalli@ti.com>
 <ec227d43-5e0b-4de5-9329-63aa2bffbd99@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ec227d43-5e0b-4de5-9329-63aa2bffbd99@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Thu, May 29, 2025 at 03:37:22PM +0200, Krzysztof Kozlowski wrote:
> On 29/05/2025 15:34, Siddharth Vadapalli wrote:
> > In preparation for disabling "cpsw3g" device-tree node in the SoC file,
> > namely "k3-am62-main.dtsi", enable it in the board file. The motivation
> > for this change is that of following the existing convention of disabling
> > nodes in the SoC file and only enabling the required ones in the board
> > file.
> 
> 
> That's not separate commit. You disable in DTSI and enable in DTS in the
> same one, to avoid any duplicated statuses like in this case (even if
> one is default).

I will squash the commits. Thank you for reviewing the patch.

Regards,
Siddharth.
