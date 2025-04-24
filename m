Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E09242D73;
	Thu, 24 Apr 2025 10:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745490360; cv=none; b=WVMG9uCh+OsMWSpVVOnKsUUtEwPNs1DeOa4B1MqWiLteDmwp8s0ehbzV+DZVtxxAo9J4COTHNvJD2Jiledxh1ZjVhExi6uaYZhJqRfkBASWzlqObE05CszenXfTe6WyW8BxmaUhI6/B7zXxZ4uHgLIe30IClK4jO6xLHr8AohRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745490360; c=relaxed/simple;
	bh=TEy69hatB9WvAQZk1Qj5SRXNdR02N3m6osQeJAFrqRk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YqFsrsW/qttHpCdh/vWOcVhlXrMKCk4EMdU8TxkkkgCJ+a4L0z7CEBo5jT55GprAfeS+dSSEwxMku22UOlyJZYQgV/fiPaWMvuAnswCH2KtJ+ifUw5r1fZwAUwTROSFJ7OBHgMFBjHG4dPnzK5Ez/bDCJGpUgekQemXjPU7gpSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KA15Nqno; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KA15Nqno"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B441C4CEE3;
	Thu, 24 Apr 2025 10:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745490359;
	bh=TEy69hatB9WvAQZk1Qj5SRXNdR02N3m6osQeJAFrqRk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KA15NqnoNNLGZtHty+zT0MAYmtgI5unjRVmOAGYqnksi1yMeeNx9GSiTjCtMn5G+I
	 IRzm7DNRDbqV/Tz6J9SGnym0Sq/979QXWvLieyvMJ51i00iWlo8ngTNg11sLq6SEyO
	 mUhk12TWZPlbTetukKFeD+Rx71DQWTUXqN+VxVqFTV13JJoowCvjjZSBEY8o7j8MmE
	 gVXEkXXKqN8TN8JkNX0+hWfXHSc4TpsmnnfkiszxWTeCx138BdET27Cm6ADlStS9rZ
	 2GffQxptAbfH2il6DAiH9dxjUEe/tYNB7VXxlGBnAslLhxDyEaOqxFuzE6r+EoWFKW
	 NFbKm3dAcdFrw==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 24 Apr 2025 12:25:14 +0200
Subject: [PATCH v2 03/22] arm64/sysreg: Add ICC_PPI_PRIORITY<n>_EL1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-gicv5-host-v2-3-545edcaf012b@kernel.org>
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

Add ICC_PPI_PRIORITY<n>_EL1 sysreg description.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 83 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 06e1fb5e126b41b7e41fffa0a00553d73197ac3c..0cc1268c0bfad8266da47b441e80c603e46c00ae 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2310,6 +2310,89 @@ Field	31	C
 Field	30:0	P
 EndSysreg
 
+SysregFields	ICC_PPI_PRIORITYRx_EL1
+Res0	63:61
+Field	60:56	Priority7
+Res0	55:53
+Field	52:48	Priority6
+Res0	47:45
+Field	44:40	Priority5
+Res0	39:37
+Field	36:32	Priority4
+Res0	31:29
+Field	28:24	Priority3
+Res0	23:21
+Field	20:16	Priority2
+Res0	15:13
+Field	12:8	Priority1
+Res0	7:5
+Field	4:0	Priority0
+EndSysregFields
+
+Sysreg	ICC_PPI_PRIORITYR0_EL1	3	0	12	14	0
+Fields	ICC_PPI_PRIORITYRx_EL1
+EndSysreg
+
+Sysreg	ICC_PPI_PRIORITYR1_EL1	3	0	12	14	1
+Fields	ICC_PPI_PRIORITYRx_EL1
+EndSysreg
+
+Sysreg	ICC_PPI_PRIORITYR2_EL1	3	0	12	14	2
+Fields	ICC_PPI_PRIORITYRx_EL1
+EndSysreg
+
+Sysreg	ICC_PPI_PRIORITYR3_EL1	3	0	12	14	3
+Fields	ICC_PPI_PRIORITYRx_EL1
+EndSysreg
+
+Sysreg	ICC_PPI_PRIORITYR4_EL1	3	0	12	14	4
+Fields	ICC_PPI_PRIORITYRx_EL1
+EndSysreg
+
+Sysreg	ICC_PPI_PRIORITYR5_EL1	3	0	12	14	5
+Fields	ICC_PPI_PRIORITYRx_EL1
+EndSysreg
+
+Sysreg	ICC_PPI_PRIORITYR6_EL1	3	0	12	14	6
+Fields	ICC_PPI_PRIORITYRx_EL1
+EndSysreg
+
+Sysreg	ICC_PPI_PRIORITYR7_EL1	3	0	12	14	7
+Fields	ICC_PPI_PRIORITYRx_EL1
+EndSysreg
+
+Sysreg	ICC_PPI_PRIORITYR8_EL1	3	0	12	15	0
+Fields	ICC_PPI_PRIORITYRx_EL1
+EndSysreg
+
+Sysreg	ICC_PPI_PRIORITYR9_EL1	3	0	12	15	1
+Fields	ICC_PPI_PRIORITYRx_EL1
+EndSysreg
+
+Sysreg	ICC_PPI_PRIORITYR10_EL1	3	0	12	15	2
+Fields	ICC_PPI_PRIORITYRx_EL1
+EndSysreg
+
+Sysreg	ICC_PPI_PRIORITYR11_EL1	3	0	12	15	3
+Fields	ICC_PPI_PRIORITYRx_EL1
+EndSysreg
+
+Sysreg	ICC_PPI_PRIORITYR12_EL1	3	0	12	15	4
+Fields	ICC_PPI_PRIORITYRx_EL1
+EndSysreg
+
+Sysreg	ICC_PPI_PRIORITYR13_EL1	3	0	12	15	5
+Fields	ICC_PPI_PRIORITYRx_EL1
+EndSysreg
+
+Sysreg	ICC_PPI_PRIORITYR14_EL1	3	0	12	15	6
+Fields	ICC_PPI_PRIORITYRx_EL1
+EndSysreg
+
+Sysreg	ICC_PPI_PRIORITYR15_EL1	3	0	12	15	7
+Fields	ICC_PPI_PRIORITYRx_EL1
+EndSysreg
+
 Sysreg	PMSELR_EL0	3	3	9	12	5
 Res0	63:5
 Field	4:0	SEL

-- 
2.48.0

