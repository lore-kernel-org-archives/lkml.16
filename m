Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5391F28002E;
	Tue,  6 May 2025 12:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746534302; cv=none; b=W9b6pUZeGjq7WYfwUDYHPZoFGhZajrR4FpeFLnvjGTKUxhzjd3UyYxj8OFOH9FFVAr4COVObvVg/xDk+ucnfqPeXAf7iX3tIpij4R8VdnSZxCSQmMO6C8RDP29CBG2ijCpWRxN4ZWHg6MGTlUiik2w9eXhTvvufHUO2grVeqNQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746534302; c=relaxed/simple;
	bh=9zWp7WGj091+ZG2FSlP0T7J3sn+1tw+UEtNEfbmUjxQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GFS5G/5r6uZ4WVNI05ggpvE5lYd/pcrZizDZh64WMkxehd8EmtciEaxEovXZMF9Mnlq6qlvfocQWsIKR0pvl5mrwW9Fmww6WEQyefb31LD9SapGgBVGTkbN5RmX8ZzHTF0I1Ma/+vFZV0gjAxU0T9df1Jnpbabh/ibnNjpZzPfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cfAMOE6r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cfAMOE6r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF52DC4CEED;
	Tue,  6 May 2025 12:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746534301;
	bh=9zWp7WGj091+ZG2FSlP0T7J3sn+1tw+UEtNEfbmUjxQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cfAMOE6rM51h+vapY6Xn21DKVYkTo51ypb6iPcT9PE7cjAG/ALQZOkQ8xnP/Ricx0
	 HHg9ajhQSqsE9RBXKI9NlRbZVhOOYArRbq0BgTPiY/5iuc88RyTfwsFEk6LX0bTQ1n
	 DO5OMlrkpH3XSvu7bXc21OaTarPGtiOBdytP4HQrvAHNm72gHHnWlsG+mv021FizXL
	 LlIDg6OrnX5TF/cYUKqMN37T6V60yu/3mUa+/8m6BrNghl6DUqdU3TibKA1eJ6TwwQ
	 FvunlvQkLzeaXMvKuS0QnGj/7wg78fG8lTpeDF8h+UQUC1SRuPW6blpE6HXly094oA
	 otig4Ezlw6/nQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 06 May 2025 14:23:43 +0200
Subject: [PATCH v3 14/25] arm64/sysreg: Add ICH_HFGITR_EL2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-gicv5-host-v3-14-6edd5a92fd09@kernel.org>
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

Add ICH_HFGITR_EL2 register description to sysreg.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 1b519e35000be328acfe26d51e098059f9cf9ef2..5af0dea6e775ea680686dbe4bc836b5f5b69fbc7 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -3616,6 +3616,21 @@ Res0	1
 Field	0	ICC_APR_EL1
 EndSysreg
 
+Sysreg	ICH_HFGITR_EL2	3	4	12	9	7
+Res0	63:11
+Field	10	GICRCDNMIA
+Field	9	GICRCDIA
+Field	8	GICCDDI
+Field	7	GICCDEOI
+Field	6	GICCDHM
+Field	5	GICCRDRCFG
+Field	4	GICCDPEND
+Field	3	GICCDAFF
+Field	2	GICCDPRI
+Field	1	GICCDDIS
+Field	0	GICCDEN
+EndSysreg
+
 Sysreg	ICH_HCR_EL2	3	4	12	11	0
 Res0	63:32
 Field	31:27	EOIcount

-- 
2.48.0

