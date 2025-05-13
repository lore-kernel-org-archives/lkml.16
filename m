Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4619D2C033A;
	Tue, 13 May 2025 17:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747158550; cv=none; b=EOv2MhdSg4ZUk79T8qgCxHxm3FP+B3oy4BmpoSZQNk8iXGJzAzjUa0vuQTbOLWGTKaljMkdFAl6BsxtOINE1YAFC3j8RGmcQq1PnVf32ZqMRo1XAzqy5PeBew0ABnFeay1Z+Mg69UtmYca1RWbGBU6t7+/VwSM6GcLwgGPFo1oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747158550; c=relaxed/simple;
	bh=blKjRfmZHvu6i2fAUWDaSvQKalFM8f3PzPgROBKQEq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tyV9hSZS7YtsPsGZMjSYeNdBipLtrwMJtWUlrbUPyeGQo2s2UyXW4Wy+lUdUAObqS6NL+bUf09di8e+4aiXHBbCYO2hEt2o9s53/+jLY279kD+TdHFssXGiGpu51lqOVWUgJJtUidcHT2DOHbfs3LMU3hbhRzX9HStdzFfvbE7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rlln4h/y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rlln4h/y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DF3FC4CEEB;
	Tue, 13 May 2025 17:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747158550;
	bh=blKjRfmZHvu6i2fAUWDaSvQKalFM8f3PzPgROBKQEq0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Rlln4h/yJiIN+AmRst1iAq+KS00F6eccGZ6fwU/6la3CmYKsJeTIasC/9fJvCx7an
	 9Jetr/u3cRa4MjeLA/nvIj94QbMIAKzmMvOkaQVgpP5/UeMeenYEYgT7HPPZLfTHc7
	 Cd5vljfuLhn6SLGl2HVdTll1Iu4m0C0Atq6RLOgAePGznxUZLi2f0bsPnA1eP1fMJ3
	 3uoPxuVDULD0hhK76pI4BPOWOpI7sqCUrr6bGizjYYGOpCq1QBNWMeHkS/EBrfaaNq
	 AushHU3uw4s+NufVE0fnP+wWEPPbCKXMuKBWpYiKCE8TemVpqSy08InrixRQ2YGrUr
	 7J2wx1xe22d6g==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 13 May 2025 19:48:02 +0200
Subject: [PATCH v4 09/26] arm64/sysreg: Add ICC_CR0_EL1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-gicv5-host-v4-9-b36e9b15a6c3@kernel.org>
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

Add ICC_CR0_EL1 register description.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 004c5b250faba742a0d5e195eeade822a8ad713f..60fd9bd44fa92af2634e49d9a650bb1c9049983c 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2798,6 +2798,14 @@ Res0	14:12
 Field	11:0	AFFINITY
 EndSysreg
 
+Sysreg	ICC_CR0_EL1	3	1	12	0	1
+Res0	63:39
+Field	38	PID
+Field	37:32	IPPT
+Res0	31:1
+Field	0	EN
+EndSysreg
+
 Sysreg	CSSELR_EL1	3	2	0	0	0
 Res0	63:5
 Field	4	TnD

-- 
2.48.0

