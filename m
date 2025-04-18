Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A240F21B8F6;
	Fri, 18 Apr 2025 18:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745002763; cv=none; b=lf6yEQi+f5eyARaL8vpxVdT+S3hTDF8JPe8A+kGq5rVx75aHK7sxPNwn4o69lRuVZj/Y4CyP2nEMQis7M2JwvQ4utInGjSJl9RFO8Gw/Icatt8v8wNJLL65fGnbRi8prgGa+B5DaC6Q/B6PkwaWgjaPq9Vka4Akfac+E4yczzYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745002763; c=relaxed/simple;
	bh=Muvjs+87MR4WmidM7XoxjgPGdWtz4H83lMhEzLC+O+I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cl+b5IRhqrkpLNHvxzva2h20xz+s8Zmn2YGVi7FRbkXzs/Lx78Gf+sXl5htK/tlzJ+NlHM2rFMrYcpxyy8XjreoQJ6GtiI6PKr7sZz8K5rtWXuj4MikLVEW58mkYERGO66CbySei59B8iqoSxwLdvF14gNvAwMRYFYCoTbbFbiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=B3dClyDw; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="B3dClyDw"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53IIx7qB1061303
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 13:59:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745002747;
	bh=X2G5/5/aAisSzKjyV7EBV8zGEk7A9T5kYyHgWCioKnw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=B3dClyDw+NuDZ5IZDB+Nihcgfzhe2TwJI2iGr0Ufs7mhe9cTmguLbyV8ti9E+k4lq
	 ZojyIoSva6bArPI1DnCathw9cXqnwOEXfoXBeBlN9ST1m6teD3FE70Oz0qINYf6e1e
	 VK/W2dSDjdGLRDYTK8jg2YhKdgVCYIlxakENEx4s=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53IIx7Rw114102
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Apr 2025 13:59:07 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 18
 Apr 2025 13:59:07 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 18 Apr 2025 13:59:07 -0500
Received: from localhost ([10.249.36.23])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53IIx7Du118597;
	Fri, 18 Apr 2025 13:59:07 -0500
From: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Francesco Dolcini <francesco@dolcini.it>
CC: Nishanth Menon <nm@ti.com>,
        Francesco Dolcini
	<francesco.dolcini@toradex.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] arm64: dts: ti: k3-am625-verdin: Add EEPROM compatible fallback
Date: Fri, 18 Apr 2025 13:59:05 -0500
Message-ID: <174500273668.95966.9173410184787875475.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250408202655.6329-1-francesco@dolcini.it>
References: <20250408202655.6329-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Francesco Dolcini,

On Tue, 08 Apr 2025 22:26:55 +0200, Francesco Dolcini wrote:
> According to the AT24 EEPROM bindings the compatible string should
> contain first the actual manufacturer, and second the corresponding
> atmel model.
> 
> Add the atmel compatible fallback accordingly.
> 
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am625-verdin: Add EEPROM compatible fallback
      commit: c026c5e6ed9323304b88bbb2feb6f039eca114d0

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
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

