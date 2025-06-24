Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD482566A;
	Tue, 24 Jun 2025 18:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750790643; cv=none; b=mC8hR84SeWBexBNHef0CeEHjqvNB9SAJZ0GiIaOKggEtHS4PfX+L/3Dww+t4+yREB4cEdG4Bv1mmxXtcK6IA9uTPMn4vcQ3zrxaAoa27IyxUQOF7v1GLiHSOaaVud8aAT2YQkI8nukmpn3K/PWazv77Lo09bmCWgUuhhr5nL7nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750790643; c=relaxed/simple;
	bh=4XBT3ISaw2KBYxJ6RfSzaeMT6YpHw2zgEWbU4vnm1PI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oKsPnOqgSH28dv7vYQCxlV0uRHPFKBtUcoqwpy4wsibXAq6un/rLQ0/42w3zYq3PCzjTMjHcorzpF5bnclu9qS1RJVsy2YyuVR7fxwRd2jS0u3EiMJ4S6iwaFT41SpA/m6DhKJqx68DT9Yui90TKz7TubVTIM1Z+llk8g0FOlqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=yNdCM3fM; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="yNdCM3fM"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55OIhuEu1631030;
	Tue, 24 Jun 2025 13:43:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750790636;
	bh=/3xmZQajfkAmQDGGPmRvO73eeqfBxMjIyl1Zj6r5Eqw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=yNdCM3fMFWo/Pys2rbNE8oY5KCLTh7sxMjKCYguf5R9m4lrZ5WTM4ei0yBkOlG/dl
	 RRmiPD1CYufLlN+qW7hWBxRYAxNVA+GJnEVL3l2/rPSyd5qjKqqaJwOV5pTzMNGmvY
	 Li2nIep4uiwCktUXfoq9hXIqqAt2jewuIYHT5PEw=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55OIhuuE1960099
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 24 Jun 2025 13:43:56 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 24
 Jun 2025 13:43:56 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 24 Jun 2025 13:43:55 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55OIhqrB2253076;
	Tue, 24 Jun 2025 13:43:53 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Michael Walle <mwalle@kernel.org>
CC: Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-j722s-main: Add audio-refclk0 node
Date: Wed, 25 Jun 2025 00:13:48 +0530
Message-ID: <175079060338.1874839.9922739903045678282.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618090724.1917731-1-mwalle@kernel.org>
References: <20250618090724.1917731-1-mwalle@kernel.org>
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

On Wed, 18 Jun 2025 11:07:24 +0200, Michael Walle wrote:
> Add the node for the AUDIO_EXT_REFCLK0 clock output.
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-j722s-main: Add audio-refclk0 node
      commit: a947e57796894f5557183dc1c106804239e30212

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

