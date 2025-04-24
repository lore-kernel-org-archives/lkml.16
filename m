Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96B1244682;
	Thu, 24 Apr 2025 10:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745490365; cv=none; b=u1tZ8DQsvV4+gewypwJHKdv5hNQI2J2Lw1mJLKw2qwXfIHv/VqIQI65Tv9whv8yJzl3rP7V1NM3+HcK58l2/MTcaFR/dIslrQrmI0jwwmI5fCxe8EgXCHD5UIUSWcq/qHQ610eenA/i3Rm0LcOlyDafxBSFMtOGC+OnDfDhE5h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745490365; c=relaxed/simple;
	bh=Tv02OqEETUJL5RhGfHRLiUOkxm6hkdgtGZBz124yXQU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CeAfTkoiK1vFYn/zsmyEmXUDgvOVLao+6gLoQuJMqy57M7KOx4oImpI3Wj3aq9/5KEr1u7FgP5QJbwf0R/zYjuQ44lI4XA0vZ26+V8NdylTOBs81Vzs1ONrP1VkhL/M7XngdDT3fjvAPMk899LZOYY6JIGAhAa6dW6BAJctuTGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tCOQHF59; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tCOQHF59"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C2C4C4CEE4;
	Thu, 24 Apr 2025 10:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745490365;
	bh=Tv02OqEETUJL5RhGfHRLiUOkxm6hkdgtGZBz124yXQU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tCOQHF59GpB2B1LJWI0AyNHF1OYdRKMq0qYGT6YcOqJM0NPVvrOGTepWXKnzIz5xg
	 wyYdhY0i7kB9Dbuv7h5my+LJVK5Q38P8neCv3KBEJO2VADJ+4BBL1fuVbL/Mfx9IpD
	 3e52tQLysUfUIFBWna0G9DGDeKdwsdmyE3Y7l+hkr4KrRdIdXKpbH+FedgHYsN1aHV
	 xAUyZ2d/rwBDtpBJj+834kOWMuB1zORrQlsdgJt6QddCXg4CU3dr829jLsNwyJklcP
	 kSt9vxusDd3FaV1feRWnX1yCSWbXUEZxiHwh9nu9SrXGdcofcqir7zfFyMRYCOzP7O
	 FafIMG/HoUhoA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 24 Apr 2025 12:25:15 +0200
Subject: [PATCH v2 04/22] arm64/sysreg: Add ICC_ICSR_EL1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-gicv5-host-v2-4-545edcaf012b@kernel.org>
References: <20250424-gicv5-host-v2-0-545edcaf012b@kernel.org>
In-Reply-To: <20250424-gicv5-host-v2-0-545edcaf012b@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.14.2

Add ICC_ICSR_EL1 register sysreg description.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 0cc1268c0bfad8266da47b441e80c603e46c00ae..985f2cdb67cfec6df335a3951ecb63f128f6da55 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2310,6 +2310,20 @@ Field	31	C
 Field	30:0	P
 EndSysreg
 
+Sysreg	ICC_ICSR_EL1	3	0	12	10	4
+Res0	63:48
+Field	47:32	IAFFID
+Res0	31:16
+Field	15:11	Priority
+Res0	10:6
+Field	5	HM
+Field	4	Active
+Field	3	IRM
+Field	2	Pending
+Field	1	Enabled
+Field	0	F
+EndSysreg
+
 SysregFields	ICC_PPI_PRIORITYRx_EL1
 Res0	63:61
 Field	60:56	Priority7

-- 
2.48.0

