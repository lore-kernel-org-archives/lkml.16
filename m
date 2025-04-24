Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB77B221D99;
	Thu, 24 Apr 2025 10:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745490355; cv=none; b=T3JkUysXoEZNOybScKIrMiVWAUAx0qGXmbRjHoauRjmiqdE0KlwRz4jXIRBjJcfQtw/9xg6hFL+Q8D7uV5mj+0V1f3xWWPsmO5iUmti1mMQ94MKbd+ixv2xkxz7Cc7RkRPPjqi1qdodlrTzGQ6iNnBX+dlt2S7xTEBkY5BkKJls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745490355; c=relaxed/simple;
	bh=gXuthZuxBZQLsvBkFkEhlBn3G2hxd3VqLQiwIZeC8vM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wew9O4awe71akv+7wpeiHeqPy6IfzPCIAo6DQhwRlQwAvW+qpFqltraBYXdGyBG8WJ25JQbxQCL3Cm1XdIYUXwdocrKCi6Sc3hKG+9jrZqnB0KfvnR1729qwNWCEkhlukhKf4H30k+Whgc8kZczZr6Gwd+sV8rrEF4q15LRLDjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DN/PzKxj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DN/PzKxj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8258BC4CEE4;
	Thu, 24 Apr 2025 10:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745490354;
	bh=gXuthZuxBZQLsvBkFkEhlBn3G2hxd3VqLQiwIZeC8vM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DN/PzKxjvI3evpwtZN4r2tZUQEoS/a2Zx/DdzZy7YH0sh0/iWXis7bsoCy09pK4m/
	 ggaeHfMfW5gljpOg1my/dbM8zKMQLtSyZhAW0YPD+BoRtEmzxoHocArQC7oO1za/BD
	 y883D9Ztguhx7mbShUtMZr0wVP+q9D9nDVs/1yFJ98vGIT3KzZV6PBfQ4TGtbkRm67
	 OGSr/x8vzXTzEyCUyZ2FY1OcnfbLoLNlLXzGx9Y/xYPutQX1xLZyqQl0OPmMCkkUY/
	 uvZaYSGZ7XZY0Y8B7vmjsltbyAdOHHjouprr/ZGrdkjxuTU6VD3mdgdBUgr33oGxjb
	 WniyC0bcVCHfg==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 24 Apr 2025 12:25:13 +0200
Subject: [PATCH v2 02/22] arm64/sysreg: Add GCIE field to ID_AA64PFR2_EL1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-gicv5-host-v2-2-545edcaf012b@kernel.org>
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

