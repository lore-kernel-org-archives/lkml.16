Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EAA283151;
	Tue,  6 May 2025 12:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746534324; cv=none; b=OaVlWwJeS5Q0DIZ8MhbCQ8XwdIh8aEUqncP2xCPw0P7sMWOdVzs1aDTsz5O+H8mTwnzWdHZu+uktYCxEjlfVfmnco0JMN7VjE0in87Eu3Gbua6sJ48eoRADBVlrhRFYmE07IzOQ3Whf7s3Kurc0LRXr4qeWIC1CUMICQ0Iqp1vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746534324; c=relaxed/simple;
	bh=LkJPqDgTcvITvCjal2jF9oi6QEuwQiB0J4qVejeTgGo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DBNgvfkiYLhrrIPZ4jTHcIST0j3WwnJ/rgy5is817hva+G0V/OtPT7AtodcWnJ0u+HL9x2WOo9Bk++AarEmzoIeZSYapbPYRdLDMSzOYFAGrT+Pm3GohS+Zx6cFOiprs3SC7XF1AjW30R8lMq92K5iV2G5oFdQ/czFqpIVuZS/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=si/dNJrI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="si/dNJrI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E91D6C4CEED;
	Tue,  6 May 2025 12:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746534323;
	bh=LkJPqDgTcvITvCjal2jF9oi6QEuwQiB0J4qVejeTgGo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=si/dNJrItQIGWeK2KZFfpSsZviqgsXgarUFlD4/UIoW4g1I6Gr0wl47GRXx5tTTO5
	 kIHzMQS3GNk3BTCoW/Wv/vPVHPuqIuVwb+QmQ4jA7kiTuIVvxPf8MfXL3V5vKTrYlV
	 wqaK354RaMvOqz94y8q92UqdXvFuKez4Rtx17rqc9ts7pUQVLKXJX9Y8dtIa7FeHH6
	 TzblnceZwpLe0ws8vrXYL2pUy7ZezzU0M3n0a07F7mI1KIrl3z/BYJemAHR6iBGhiL
	 cWKCiJiQZyxsjRjdH/YdlBiEC1lRHMmXdukvilgD2Jn9y8eBIeSxjj6z30YKLvZ42G
	 f/zKEDtHlKJhw==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 06 May 2025 14:23:48 +0200
Subject: [PATCH v3 19/25] arm64: Add support for GICv5 GSB barriers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-gicv5-host-v3-19-6edd5a92fd09@kernel.org>
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

The GICv5 architecture introduces two barriers instructions
(GSB SYS, GSB ACK) that are used to manage interrupt effects.

Rework macro used to emit the SB barrier instruction and implement
the GSB barriers on top of it.

Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/barrier.h |  3 +++
 arch/arm64/include/asm/sysreg.h  | 10 +++++++---
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/barrier.h b/arch/arm64/include/asm/barrier.h
index 1ca947d5c93963d33fe8fb02d6037fc71bd9fd7a..f5801b0ba9e9e7e0433f16ffedf0ec7dfb3e358e 100644
--- a/arch/arm64/include/asm/barrier.h
+++ b/arch/arm64/include/asm/barrier.h
@@ -44,6 +44,9 @@
 						 SB_BARRIER_INSN"nop\n",	\
 						 ARM64_HAS_SB))
 
+#define gsb_ack()	asm volatile(GSB_ACK_BARRIER_INSN : : : "memory")
+#define gsb_sys()	asm volatile(GSB_SYS_BARRIER_INSN : : : "memory")
+
 #ifdef CONFIG_ARM64_PSEUDO_NMI
 #define pmr_sync()						\
 	do {							\
diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index 2639d3633073de10f5040a7efff059021f847530..e7734f90bb723bfbd8be99f16dd6d6fdc7fa57e8 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -112,10 +112,14 @@
 /* Register-based PAN access, for save/restore purposes */
 #define SYS_PSTATE_PAN			sys_reg(3, 0, 4, 2, 3)
 
-#define __SYS_BARRIER_INSN(CRm, op2, Rt) \
-	__emit_inst(0xd5000000 | sys_insn(0, 3, 3, (CRm), (op2)) | ((Rt) & 0x1f))
+#define __SYS_BARRIER_INSN(op0, op1, CRn, CRm, op2, Rt)		\
+	__emit_inst(0xd5000000				|	\
+	sys_insn((op0), (op1), (CRn), (CRm), (op2))	|	\
+	((Rt) & 0x1f))
 
-#define SB_BARRIER_INSN			__SYS_BARRIER_INSN(0, 7, 31)
+#define SB_BARRIER_INSN			__SYS_BARRIER_INSN(0, 3, 3, 0, 7, 31)
+#define GSB_SYS_BARRIER_INSN		__SYS_BARRIER_INSN(1, 0, 12, 0, 0, 31)
+#define GSB_ACK_BARRIER_INSN		__SYS_BARRIER_INSN(1, 0, 12, 0, 1, 31)
 
 #define SYS_DC_ISW			sys_insn(1, 0, 7, 6, 2)
 #define SYS_DC_IGSW			sys_insn(1, 0, 7, 6, 4)

-- 
2.48.0

