Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFC62C0309;
	Tue, 13 May 2025 17:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747158576; cv=none; b=d4SItOQxUPWBkTH0EyWk9xXXZiI0Lp8+FHYVqNJBe0IFqhIy90jnfxQHUFewpxubcGVfeqmeD/0vVwuRLNVQB7bUftHcpksaJNcJQ38rV9swcRiAz+masq/iBpI68Qo1GzzX7or/WNRAvssZsLS2RBA7jyKFGWKXoBSpVIoBKNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747158576; c=relaxed/simple;
	bh=mdkTMbIN+57B3kZ//NeOWEWqaYazGWHS3ni+iWa/mOA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZuITTal53zgKVY732qDw8QoXigY9ERFvFHE89LtQ8fbW+Bs3x/A5ECDlhVtS6U74V4AK3NY2nHYNpiRdCoHf/L6Rux8f1cCBxDe11pPfuqUEZlI1KwGX/myKHyhbNl8EgB313XZhfe1Xq3EaYBCqworEi+OMBuyILc7CKHpU8+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J2UkiN5D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J2UkiN5D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F038C4CEEB;
	Tue, 13 May 2025 17:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747158575;
	bh=mdkTMbIN+57B3kZ//NeOWEWqaYazGWHS3ni+iWa/mOA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=J2UkiN5DPxECSjDIsqlPfEWelsxc3sAqnSoU0Hu1/ltbUnkQSF+yEdn4LL2eYyLoG
	 J85h+45Pncv8itLXzebTiV5mu4rF4hZn9xQITRv75NIUNT5VoDI9odwvVmJpbH57Rw
	 lQP2C6ypMoxtUhuFPbky8c0c/4OKdgeTt9uAlQhTg22R03QtmmxA0IyeIIpsPQkAtU
	 xhJ44p1vKPrrqGdPvToXnOi8lL6v5ZdMSmS5BYokHs9YDifTj1Epjqsse884xyktSk
	 OvE98V3d5fQFGPOgYYrj2ImRWAC31s8muX90KFp2BM8lbiVBmvmgNG99MxTeb7VHfy
	 PKYEQ7gKyB0NA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 13 May 2025 19:48:07 +0200
Subject: [PATCH v4 14/26] arm64/sysreg: Add ICH_HFGITR_EL2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-gicv5-host-v4-14-b36e9b15a6c3@kernel.org>
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

Add ICH_HFGITR_EL2 register description to sysreg.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 0927754d9fe2c5addbd9693d83b7324f1af66d3e..d2f53fb7929c69895fe8a21ba625d058a844d447 100644
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

