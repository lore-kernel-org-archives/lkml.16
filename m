Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01202E2F10;
	Tue, 24 Jun 2025 18:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750790663; cv=none; b=mnWODosiGLgRwQhKHUAxEqxIUjqA2KKOcQLnczTXoLd0vjEyar4jilaTl1jWhLu1VU/UBUk0EveWEBIsueyLU8/+QqXLB6KZEPPdIJTL73rgyogbZpa/YcavkXK2q51yvvE3InafvdWbzDBdQMjjmqzXSv8NurnIcE1hQw5jVAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750790663; c=relaxed/simple;
	bh=Hq1gQTtxPY6jIvcuvHyrud2ohXQYFyqke/BHta3Xj3E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KAPa3fgtpo0l9wprB3cvwiiDZEhXTjkQyLjOjas4+x8Ipp+mRVeUi2cnJzSBQu3zYNyMkVyR5fSoS8aPvaU0O5AlcHC2Ypgg17tpjI09pWA2jBF6pruiASkWeeguBOF/Q86IyJXfbUy6h2LUCTCktHLMXayJN+Grou8N+83aDEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=RLevw8TN; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="RLevw8TN"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55OIiGCu1631072;
	Tue, 24 Jun 2025 13:44:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750790656;
	bh=q/WQvyfAI0EGy8oSkgnEC3wFCyTVgfp49vgP3UAnGP8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=RLevw8TNGPq5ciOZgB+bBfS9CrHANWmhavqYDNagAD/XHbop5Q+xVOP0iYP46gjW4
	 2yPkxt164qVgUFISv5pr8ZsXX7aWPBuV4X1PQUNxndJKsm8mo2sbgVzbLUgPqKy5di
	 6AD1Kkf6Hn/zVYBH9dKur7+OEFpbwrbMbRP1MrVM=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55OIiG8e1800409
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 24 Jun 2025 13:44:16 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 24
 Jun 2025 13:44:15 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 24 Jun 2025 13:44:15 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55OIiBGt2253453;
	Tue, 24 Jun 2025 13:44:12 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Bryan Brattlof <bb@ti.com>,
        Dhruva Gole
	<d-gole@ti.com>, Andrew Davis <afd@ti.com>,
        Michael Walle <mwalle@kernel.org>
CC: Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62p-j722s: fix pinctrl-single size
Date: Wed, 25 Jun 2025 00:14:08 +0530
Message-ID: <175079060338.1874839.7157016701678665684.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618065239.1904953-1-mwalle@kernel.org>
References: <20250618065239.1904953-1-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Michael Walle,

On Wed, 18 Jun 2025 08:52:39 +0200, Michael Walle wrote:
> Pinmux registers ends at 0x000f42ac (including). Thus, the size argument
> of the pinctrl-single node has to be 0x2b0. Fix it.
> 
> This will fix the following error:
> pinctrl-single f4000.pinctrl: mux offset out of range: 0x2ac (0x2ac)
> 
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am62p-j722s: fix pinctrl-single size
      commit: fdc8ad019ab9a2308b8cef54fbc366f482fb746f

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
--
Vignesh

