Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60241284B27;
	Tue,  6 May 2025 12:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746534351; cv=none; b=iWVnrDgKMKn6KS6DgCsxb9tQV6iKsHYnndMucoCEQ4e0Krzv1gNZqifAmbBAmmNGuaN+58x8H2z12gJZctLoMmxiM1pbMQA+g4KdNpm5chIVPNLkwVoxpt/5j2gUQKVBnpVsI9ehS3nLmxYS7QPrBwiL1YqFvUd3bBhvfZGaXag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746534351; c=relaxed/simple;
	bh=Dhr0rsx9WpeMa8aspdbgl7YO+d4d6KcEE2+waQCoYbI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DUIkXyAPVasPMzdab9bY7M2Lu/syAIFSmTOl/ssn8PbR+x1Db2uVinoDODUm30pyY7HA/zGis6kiiO5Bvdrr2y14W6MZBlSecJZCc7ADYXt+tzKEumEV9p2zB1ILz7ygTwWI4/SXjH92m4pWAXV58g4ZdHv6nXHuWBUnh+EBjZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dq5cTMty; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dq5cTMty"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58A11C4CEF0;
	Tue,  6 May 2025 12:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746534351;
	bh=Dhr0rsx9WpeMa8aspdbgl7YO+d4d6KcEE2+waQCoYbI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Dq5cTMtyj0wHuo1T5aHKQkBcSlr+6GhC/2Qcc90isxK0fDRSfA0/Qo/GQnLnu53YZ
	 6S/53TJ5C1EXGWuq4Qd55nzieRvN0xzjjM3zme/3EvAv4Wj3tLhELaUTdAMAidfbFd
	 kIbLU6kV4uSUVi8DAvFe09ZzCOdtMaL8hHvY51pQKaTND8dkWddz1nSt6/ZiBZ90+8
	 uK2I0XBLiZ7PxGSEZFtnHWlCj1BsFMF9AXFId2lfnYLepQi8xtoX+EyKVmoF7H2krc
	 T24abHve5ye3qgA806xvLjWw+4bjpPF648cjcMWeaQ982/BBEa3ZbF+LAkI0/8E+ro
	 6WBwFb1pMheHA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 06 May 2025 14:23:54 +0200
Subject: [PATCH v3 25/25] arm64: Kconfig: Enable GICv5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-gicv5-host-v3-25-6edd5a92fd09@kernel.org>
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

Enable GICv5 driver code for the ARM64 architecture.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index a182295e6f08bfa0f3e6f630dc4adfe797a4d273..f1b3c695b376717979ae864865238ae12ad65ca2 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -128,6 +128,7 @@ config ARM64
 	select ARM_GIC_V2M if PCI
 	select ARM_GIC_V3
 	select ARM_GIC_V3_ITS if PCI
+	select ARM_GIC_V5
 	select ARM_PSCI_FW
 	select BUILDTIME_TABLE_SORT
 	select CLONE_BACKWARDS

-- 
2.48.0

