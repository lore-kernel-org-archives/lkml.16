Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B3927FB0C;
	Tue,  6 May 2025 12:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746534284; cv=none; b=BqSG76e+HoVZNP8qLaXjWZldL2yNJsM3cjScxhVP/sn7oeZXuVTxvjhMMuzxyU5xLi7jM2/E3KoFz79waLabZeuE/FLg4408fOHJsmGwdNcSPVjojKv+Le5K5h4helQsMlxNW8Ahdr2h+wTi6UIP5OsICT7toqcMADT1tvRlTrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746534284; c=relaxed/simple;
	bh=IR60XZsATfdTuIxQzwSdrYf53KWRtcmnuEgRG5+wtmQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j+dXP/qIxLwMm4H2bd2xn2XBp/FbU9JWSy7Q9EkN+bNYVzx4hKQMbStAfzKYEdw9vEjeBHEvvMHenR9TU4X5tYWQVLFkJe1E6ZbpXUHQ39y87uWJThrUDISnjwqaiAj+gs1d31AN/DyKTCwWs1HRZw/LmQz/Tb6BNG9G0053uFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IPq+lEj0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IPq+lEj0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56887C4CEED;
	Tue,  6 May 2025 12:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746534284;
	bh=IR60XZsATfdTuIxQzwSdrYf53KWRtcmnuEgRG5+wtmQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IPq+lEj0IohqZZ+lCvThNpzSlpPVBeaBJ/A5uHGRPgnr0rI8PahBUCST9vy9sz4ez
	 3cY8FFFsyev5Y0nYLdwlGAaOpUwUM+jsLXeRodgwPD5TCUQ+rseUzXggaLGl5Y1i7Y
	 43mJX2AS0HOsZyj+JKZ/XrHjK4OXardHCqWoymLKJS2zCu8s43czarXjDs0t3wXFXp
	 FIEpwY9KCiuFmOvhgu7vAnYNxMZpTxRgZ63zA30ic/jpEhm9Z5oAe15LkR2FTQHhZK
	 L0l2qqRWdb3J+UaYSXbaSC67TjQbySsQjIzOBluy1oFm3ryEQMw1IAbsclhojPCIoB
	 Lr7PbuSvicrjg==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 06 May 2025 14:23:39 +0200
Subject: [PATCH v3 10/25] arm64/sysreg: Add ICC_PCR_EL1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-gicv5-host-v3-10-6edd5a92fd09@kernel.org>
References: <20250506-gicv5-host-v3-0-6edd5a92fd09@kernel.org>
In-Reply-To: <20250506-gicv5-host-v3-0-6edd5a92fd09@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Mark Rutland <mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.14.2

Add ICC_PCR_EL1 register description.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index c96243505031ea680c04a693fee2c96ad19e30ea..9a2ddab8661c85586b0e91f7eaabd5a6b3409c67 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2806,6 +2806,11 @@ Res0	31:1
 Field	0	EN
 EndSysreg
 
+Sysreg	ICC_PCR_EL1	3	1	12	0	2
+Res0	63:5
+Field	4:0	PRIORITY
+EndSysreg
+
 Sysreg	CSSELR_EL1	3	2	0	0	0
 Res0	63:5
 Field	4	TnD

-- 
2.48.0

