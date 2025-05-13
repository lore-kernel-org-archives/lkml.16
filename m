Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E1E2BF965;
	Tue, 13 May 2025 17:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747158558; cv=none; b=VVwbXoj6z7vaiZgaif3PfyQNJmbPTWqVNOSHuO8GaOOXBn06JXABdd0MmzwgvtVLaBLLw/ctyjx19O7UOgCFcpLmCoYvRjQ98JUOfo1YjzWK7gGEtiJ9iYW4GTl/eCB9l5BbZBBG8/doMOeon9iE+UY+qxKcgeEJoVwISSoByW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747158558; c=relaxed/simple;
	bh=491q3sKfB+wf5tIEnM/LnvWYhJJpm4qRjaOllN5VUfc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DAfAw0pXtKdVFrvJMEJQxYHfMdHwclnFL3bVTH3zIbYQJGVlbCz4URG7RFdU2rsaHjfZyiFAdXjJUbU7Jdp2Fe0geAkX4OVD+jATgStvBfuk7mv9hGu+2rxNPywDwk1nvyD5hWLp0U4kLCjB4P2p5foUBD5JuAKw9SUYW1ebjZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eHH6AxKN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eHH6AxKN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96C86C4AF09;
	Tue, 13 May 2025 17:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747158558;
	bh=491q3sKfB+wf5tIEnM/LnvWYhJJpm4qRjaOllN5VUfc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eHH6AxKNnQznSJvXS+JZzLL7gQww9avRciR2BIMVBW4RZfn5EuxKWtF0ZXeyf9eHQ
	 hXiCWl7DFQEjo69OY5NqgFJZWeexn/j/taFoAWUgHlg7Lh/erZ0LMSlXOaqbfkjtIz
	 HGcLdTPQ1BK5o1RaTIGgFds0ila0uioDRv3xQTmRloQXMwXCz7N+SaFgOMrMRDt7x4
	 7h1dWj+Yk51Uwem4T+2HKHgqhKyaOoWGxuxSAzNdLzcsorxgZXzQZTM9EzqGoPwUGm
	 gS0sDDsKclbYjyp8Hwf9J6RkXBbJeezaRVtXFFdPDbj8GI5KI46/wXrVljvBIO/s90
	 H+x7aWyab8zog==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 13 May 2025 19:48:04 +0200
Subject: [PATCH v4 11/26] arm64/sysreg: Add ICC_IDR0_EL1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-gicv5-host-v4-11-b36e9b15a6c3@kernel.org>
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
In-Reply-To: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
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

Add ICC_IDR0_EL1 register description.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index b26e11b6e109850947be30dd2fb9c044d21c0aaa..d54c9783acb85f1049dbe51f9a37157d0fe03292 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2385,6 +2385,22 @@ Sysreg	ICC_PPI_HMR1_EL1	3	0	12	10	1
 Fields ICC_PPI_HMRx_EL1
 EndSysreg
 
+Sysreg	ICC_IDR0_EL1	3	0	12	10	2
+Res0	63:12
+UnsignedEnum	11:8	GCIE_LEGACY
+	0b0000	NI
+	0b0001	IMP
+EndEnum
+UnsignedEnum	7:4	PRI_BITS
+	0b0011	4BITS
+	0b0100	5BITS
+EndEnum
+UnsignedEnum	3:0	ID_BITS
+	0b0000	16BITS
+	0b0001	24BITS
+EndEnum
+EndSysreg
+
 Sysreg	ICC_ICSR_EL1	3	0	12	10	4
 Res0	63:48
 Field	47:32	IAFFID

-- 
2.48.0

