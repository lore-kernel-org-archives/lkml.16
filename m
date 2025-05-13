Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EA22BF989;
	Tue, 13 May 2025 17:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747158515; cv=none; b=U+TPvdC89vRU4//p422i0FHN7TVPHwOi1taCbMc+jB2S7nBemF/E7BhS73dK1tgGRhQrkAyap67rc+6E3vlc90nbq1XdrE0LQJhXaFK7NEF49wCDYzdU2SyUbQjRnrRp3qtWAAf24/LvmK6zsoKSejjH6QnjpenCfHN4ZiFf6S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747158515; c=relaxed/simple;
	bh=3IEW2nofTzt0kiCtUrFN1XMdmJDoRXO5ZF48Jiu810g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RBViLjKmhlwVSLe+hA2RIkPlxLS4YLU7hIj9sBcSFx+PBizZggSbUVXyZYsZJRuvozi+EQqJWNg5HV8SxsI5ID6jnGi+VPA+xAwkxHpwXoEpNWckhWZoVVRKnZ9MzBLXfrkVAzUv0dKARLpey9hmBVCtF4W62I3wMpFu3GpeCpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b5crflDY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b5crflDY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 927C4C4CEE4;
	Tue, 13 May 2025 17:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747158515;
	bh=3IEW2nofTzt0kiCtUrFN1XMdmJDoRXO5ZF48Jiu810g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=b5crflDYfwj58ztU9sYCcUfoQL0Mu071jl7dsqOeermpV+Ela7yGFZdY56b+PMyJT
	 fHCLuIOqAMyoDs6m12BIUye3id9D/Tls1x+KvtMvyeANfllFQdzstNopH77gWvrsJw
	 gTORC2ZNQXdPcCYomT5S+LD0Ewaw6FQ3Zuft+34cE3JBpII/hgVtPAGhnNaqs/cLTG
	 ulI+z3bnk9FnQNe5Ej95ocnatRSoeXW1YNuhmB7FSscgQr2BYS6hKezfOG7OkWexnw
	 Pn01e5Os3w0aTTcbp65msU0N1R6OmStJ1aw+aQUYs3KgiZJehsT1tWBejbL6XjGWN9
	 CwpwkYU6FhSJQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 13 May 2025 19:47:55 +0200
Subject: [PATCH v4 02/26] arm64/sysreg: Add GCIE field to ID_AA64PFR2_EL1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-gicv5-host-v4-2-b36e9b15a6c3@kernel.org>
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

Add field reporting the GCIE feature to ID_AA64PFR2_EL1 sysreg.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index bdf044c5d11b6dd68d21fa06410221c58fc42f97..17002b1b00caad81a4dd387097f2b71ef21d70dc 100644
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

