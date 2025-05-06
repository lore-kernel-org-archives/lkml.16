Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D616280005;
	Tue,  6 May 2025 12:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746534249; cv=none; b=S+q/8ul5SG4oi+KhpBup1uKC3/8nRZVu+Ufpab3mTOvkI1JhUjpe9h/4EMLEr/hC9RC5145kN2Aen2FOWiygOX/GVAJ7kRRL2t14vB2F9lQDVBOY7Y5CTmtgbOfSmO4D2yMsuuDnGcAvZRc+Sm5u2NG4SQ+5bHqOnVXr0qhjfa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746534249; c=relaxed/simple;
	bh=gXuthZuxBZQLsvBkFkEhlBn3G2hxd3VqLQiwIZeC8vM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M5bnshawnKN9OyJQfa2mjNXktqCCytH0wVpssFklQte9y3zQBnd4ar0KJcIrwdjNaZY2TUHuLL1RgmdazZ6VOuYDb3injQkz19eHFHwTu5/KcPt7aLDcYRiGaVq2twI5PMc67tSGrat77KlLJOLvC6lV6Y/EF8jGVsVp3SwhNt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LIuiJrfZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LIuiJrfZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2053DC4CEE4;
	Tue,  6 May 2025 12:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746534249;
	bh=gXuthZuxBZQLsvBkFkEhlBn3G2hxd3VqLQiwIZeC8vM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LIuiJrfZlpwYGShMeEz3c4uNe4TJvSX1MHc5TzTDqc4bIiSrdQwxwmPPkroUDklxi
	 8YTD/WpcL1LiD5yj993yR38P7Ngyj1lgpe1olPykvMs3wsnlr4i7F760V/fbUe3P7q
	 YFdF89AHYk+CHDk1cQivQk5AgOncOvfHZzp69TxkeRDayDp/YtbUtMygGvEPFzXeYV
	 irUhF++We6A9fVn2v+B8q5N/EPn5bvGTBfV/v+TpU6SXLocTfoO2xLjvn6mqgvo3AV
	 rDu8y9oO76bJ5m3PRwO1ppEUZSr7pdGxCVz/R5nvZ9pBf3TH9Sqw3sby+mK1ivvAPm
	 6wnqlrQWpkKfQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 06 May 2025 14:23:31 +0200
Subject: [PATCH v3 02/25] arm64/sysreg: Add GCIE field to ID_AA64PFR2_EL1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-gicv5-host-v3-2-6edd5a92fd09@kernel.org>
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

Add field reporting the GCIE feature to ID_AA64PFR2_EL1 sysreg.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index f9476848a2edfad53bb4af7f68bc05cb2a4af9ce..06e1fb5e126b41b7e41fffa0a00553d73197ac3c 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1023,7 +1023,10 @@ UnsignedEnum	19:16	UINJ
 	0b0000	NI
 	0b0001	IMP
 EndEnum
-Res0	15:12
+UnsignedEnum	15:12	GCIE
+	0b0000	NI
+	0b0001	IMP
+EndEnum
 UnsignedEnum	11:8	MTEFAR
 	0b0000	NI
 	0b0001	IMP

-- 
2.48.0

