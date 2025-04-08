Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5820269B0B;
	Tue,  8 Apr 2025 10:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744109482; cv=none; b=Fw1lIqCJN2usFb7e4kWM78AxQpy6a6j6clmVfh334c+Y/MEgUT3bE78qVJ0du+raqSROO61wG46FW8YokE8etp7eWNbyxeJToGA5/huxmiMGsJkcddaOQY6wMjaX9IFi8qoU2arrkBIISN3STa/rYEE52PAPWw5577NM1Nm5+R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744109482; c=relaxed/simple;
	bh=aABGEIrWEsGcFFHRxubhJftIId76X0k2qcZSdwnplek=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fdX7DE0XqCIOM+tavD3troUYkBwL59TSKwUJk6ua3hgU/JNfzKW2ZmmII/uNVJ0UABpc7L46UXo3lcDQjTKzTcNattVQ8UxpOcyX+2wkM+/WVts4Y08Hs+sxiWpXpWpIvkswI0wPoizM0C+MJGrFnEE1XG6xiAEe/+1KVbzQ2rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RvsNNxRY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RvsNNxRY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABACAC4CEEC;
	Tue,  8 Apr 2025 10:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744109482;
	bh=aABGEIrWEsGcFFHRxubhJftIId76X0k2qcZSdwnplek=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RvsNNxRYx8hl2H8vVr6dYtg/DVIBjG4wppMV7ADcrrQU2V0F5PAW2DVEUBP0WZYFW
	 fvauJoAxLLj94F6myogejoqESUqFI/qHbRUfVxwkk3SvppKejErXGmVS/LvUILm1PK
	 73MC0pTsyLYaAlc4ED23L7JW8McYqv8TnM0wpDPo3hOmYMOKPWbFl5nzalFc7wzxGj
	 d2WN92oTkpFzGjzKhTgtuXZhQv2X2/Z0halB0D1amvs3bqho9nAV90YEFefEkf4FfA
	 HlKZkydDIEfHnSPXgYb1BWecy2nFA0viHXopm6M6SmwYZ0dXxmY7rDlo81wCA6X4Xd
	 bgaIDOelYJcwA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 08 Apr 2025 12:50:08 +0200
Subject: [PATCH 09/24] arm64/sysreg: Add ICC_CR0_EL1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gicv5-host-v1-9-1f26db465f8d@kernel.org>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
In-Reply-To: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
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
index 7acad93718c56729ce2a333ed007243ec554dbc9..c96243505031ea680c04a693fee2c96ad19e30ea 100644
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

