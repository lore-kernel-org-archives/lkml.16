Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1108D22A4EF;
	Fri,  2 May 2025 14:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746197011; cv=none; b=RXy75eTj1J1rPteb+3LQkLgBiu6pdgPep4FBXE5fDodmXWghatqIkMnv2eoBm9k0O2cj7LcGQtp6f+VXqfHRRzqvrsulrEhbnKAeS5x0AexaCUFyASeCEY/K33vz0fzUzlHDbRSaX/EjXSblQLZDxjN2127QrzcQ5LsTNJqnfIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746197011; c=relaxed/simple;
	bh=WsWmfgRUsAUKnzHtIz42wX0Xmlkcwu4wsLOii8++LRU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n1AGTUgX0uU7bpwDKTULqm7vl6sgZA+/efv1Yddt/20Du7KZvHXliIlynM+fEgIO6MX8m+9s/pHeStnT8iMB5bSeZBqcyetq9VMkr1h4vNgPDGm/TUA7AAQasn8x9m1e1EFpmkOov4vD+QulvD6zHhf2JE1oM3q0aQUUvRnDJL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=QJIOLxi0; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="QJIOLxi0"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 542EhMb9251096
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 09:43:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746197002;
	bh=XFn+hOnf9zq0L8ZJbLyMTxETpp+UGQGS34ngpAHtMqk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=QJIOLxi0PCJS5/mK9FB9i8TCyvAefymLc3sInip4s6z9dWd3JQ0VWNrgrdSA43RrV
	 WHVg4oTb003UUoLPdIPVjvwocTqCaLYRvuC5RaZT4rghhSXbmu5lc7hPknfW/uSOcy
	 dQd8GsjzdtAKgtHn4RRxw1FCnRCM1w8n3GBVQGrM=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 542EhM0j037209
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 09:43:22 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 09:43:21 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 09:43:21 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 542EhLV6127656;
	Fri, 2 May 2025 09:43:21 -0500
From: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Judith Mendez <jm@ti.com>
CC: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah
	<m-shah@ti.com>,
        Udit Kumar <u-kumar1@ti.com>
Subject: Re: [PATCH v3 0/3] Misc MMC updates
Date: Fri, 2 May 2025 09:43:19 -0500
Message-ID: <174619698064.3122712.13100882645410277717.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250429151454.4160506-1-jm@ti.com>
References: <20250429151454.4160506-1-jm@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Judith Mendez,

On Tue, 29 Apr 2025 10:14:51 -0500, Judith Mendez wrote:
> This patch series includes updates for eMMC and SD nodes across
> Sitara K3 SoC boards:
> 
> Add boot phase flag to MMC nodes and dependency nodes to support SD and
> eMMC boot.
> Add non-removable flag to eMMC nodes to void having to redetect
> eMMC after suspend/resume.
> Remove disable-wp for eMMC nodes since property is specific to SD.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/3] arm64: dts: ti: k3-am6*: Add boot phase flag to support MMC boot
      commit: db3cd905b8c8cd40f15a34e30a225704bb8a2fcb
[2/3] arm64: dts: ti: k3-am62*: Add non-removable flag for eMMC
      commit: d16e7d34352c4107a81888e9aab4ea4748076e70
[3/3] arm64: dts: ti: k3-am6*: Remove disable-wp for eMMC
      commit: ef839ba8142f14513ba396a033110526b7008096

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

