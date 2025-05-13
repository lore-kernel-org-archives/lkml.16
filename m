Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCEA2BF3F0;
	Tue, 13 May 2025 17:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747158520; cv=none; b=kMR+Dvc6T5972k7iaDxWNLQEkgz9SbLUJndguyCOOryu3qYGJfN/wPvQST3+Lzu0tqnAmGcc5xnSfrzOeVWoe4+tf2nqehdDMPBbDCZ13zfLePGFTZMvVIa98VM2mrSy/BslmF/JU169/kAVKI0QNBQFuxhWH7BEB/o1JnlsiOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747158520; c=relaxed/simple;
	bh=MKbnyQ0gD2Fqp1THWt3CWw5I2tKaXqFQNxCka3VW0DU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IhSIrIhM2UwFfxbqDn99XCO+K3imTXDn8iN+1AvI2cN86YRAKPh1MyFW/INEQXh9C6DKK3QsM6ld0kmcY9cAiQu1vHaNe5BqjrUcV5/GIQHGYr8LqVFGpLq+/OoZ3VM1Kvyakgv7LOvOHPWd2aWvwbD+8DI8944Z3eBaENrNdOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KXmyDrTu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KXmyDrTu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1D23C4CEEB;
	Tue, 13 May 2025 17:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747158519;
	bh=MKbnyQ0gD2Fqp1THWt3CWw5I2tKaXqFQNxCka3VW0DU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KXmyDrTuIGExnWRf5dlxT5jbRW+66A1hwYxjQYwHCWBEw/YX56pDixECzOCHkhXy5
	 hy742VvkK/pRUKPaV+uhWaYnc5TGum7Romr+hTbP24c6lhTXKtseShlBRN7VKa970a
	 tEVjqxsM/MCiLDa1VI/KfYWMqZNt+2BVkjjny9Hxuum5hYSkk7H+I57Y0FWJBlej85
	 JTo2upGCPJ0w31/pO5qvPFcOuBirnOYx4c3PiaB2UPhr6aHnTZ2D3wEbdu8D8ZkVGi
	 xpld6VO6AJCfwgQXbx8z9e1saLLORzIE8cICZat5JlFiu4LgVVSa1p+H59EPtPlih5
	 Jpml9QRtjdEvQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 13 May 2025 19:47:56 +0200
Subject: [PATCH v4 03/26] arm64/sysreg: Add ICC_PPI_PRIORITY<n>_EL1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-gicv5-host-v4-3-b36e9b15a6c3@kernel.org>
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

Add ICC_PPI_PRIORITY<n>_EL1 sysreg description.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 83 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 17002b1b00caad81a4dd387097f2b71ef21d70dc..ca6d81b1c6a3d7d66d4b02479123e842aa2bbe62 100644
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

