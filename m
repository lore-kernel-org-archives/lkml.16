Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305801B414B;
	Fri, 25 Apr 2025 21:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745615357; cv=none; b=A0oBr0uxOdBWwNvScz3L7CsyW8iTL7CYKP6KTIZK3UEEFVfpE7zLAJxUFGjdmMQoh5lGQqrBkbHGRSs57pZPNsX8jO9hWnCzMayydteOVf33J+qaA1Y1eYE51nrbvbX7gktCESgI5MZGBGwf5fn8Bk/xNmAkEJ3bMAugrElTULI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745615357; c=relaxed/simple;
	bh=/VyuKX/2Z7ayvme7V4TSX20vu+YsytWY6qoWRTej6nw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bTtYBfJXA+2+JVE8IlqtAe8+MwT5aQ+mdVUVAJAqwvTuN6Tf569C8cTtbGQ2dr8z4TuY1ocyOMjzgOmGyODDO3VcOpon72UU5uvw1lauoTyJv51kQT7zWKIF1vOXtY4ee+wzl6rxpFpbR54AfYhc3SBRwf+MG4A+B7M7NOV957A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ebT9O2Oa; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ebT9O2Oa"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PL96Qu3026950
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 16:09:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745615346;
	bh=eru1uAB6XxcdGB6ETHFsUgF8NYEghEFeFKagaGASKFg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ebT9O2OaydUolYzIqIHMWRYDr7i7ZqMtelypk66uLG4HCw45+NbwXZrTjK8Xj0+gM
	 lqLJKK/cgADx8Phr6K8tHWarZHR2F3KD+Uf+FiLZmXP2TQh2XfHniwPhew8gSpy/Jr
	 F6FYAiQ/T/yTv1muWidAen7Ts+l5EuYSxDVX6hB0=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PL96c5122444
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 16:09:06 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 16:09:05 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 16:09:05 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PL95iw092863;
	Fri, 25 Apr 2025 16:09:05 -0500
From: Nishanth Menon <nm@ti.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Jan Kiszka <jan.kiszka@siemens.com>, Andrew
 Davis <afd@ti.com>
CC: Nishanth Menon <nm@ti.com>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] Fix remaining TI K3 CHECK_DTBS warnings
Date: Fri, 25 Apr 2025 16:09:04 -0500
Message-ID: <174561533074.210099.18320816568415769793.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250421214620.3770172-1-afd@ti.com>
References: <20250421214620.3770172-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Andrew Davis,

On Mon, 21 Apr 2025 16:46:17 -0500, Andrew Davis wrote:
> Until we resolve this thread[0] we do not have a set direction for
> modeling our device's controller devices. For now as the AM654 MAIN
> domain controller region is already one of the messy combination
> syscon + child device containing nodes, no harm in silencing this last
> DT check warning in the meantime.
> 
> Depending on the outcome of [0], this series can be safely unwound in
> a couple ways without any backwards nor forwards compatibility breaks.
> So no need to wait on the outcome there to take this series.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/3] dt-bindings: mfd: ti,j721e-system-controller: Add compatible string for AM654
      commit: 5959618631fec502ec0963f4082d565f7fbfff04
[2/3] arm64: dts: ti: k3-am65-main: add system controller compatible
      commit: 4765253055cc8ab3fdc5f9eb5b121d867e209fb1
[3/3] arm64: dts: ti: am65x: Add missing power-supply for Rocktech-rk101 panel
      commit: ae3ac9ffd59acf46b8934f4e7a5fa7a6803ac959

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

