Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145C0267AF3;
	Tue,  8 Apr 2025 10:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744109465; cv=none; b=R8oSIExyb070v8LSljLV+CrDx+TwLd52WA35Qm3NfuDYpmtgF7Opc1IJr5YdU5gPcUibB1YtATRsnBN4eyCWPDOspPb7yzsEKRZz1FxqyfI+lz47491l0EWDV+6rzyfcm3wuOB0UkporMkFrF8lZXEQIM/ZAqG/WdUDB+SWfyJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744109465; c=relaxed/simple;
	bh=Tv02OqEETUJL5RhGfHRLiUOkxm6hkdgtGZBz124yXQU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hc5IZkeGOcRvFx+UyndOiHvfXsUA0VPYaK2jO19V91Uu5Cbm3HHJHD/azJ74iY5OroM/yBKmm+ChJWlmf+VxeHG1bd9Y0wVIsDWWFGiTvdonlBzs79vgEybmBFFE25YCPJb6mIiWDcP6Z0T/nuG0rDesucr8VH23tOva/VFRSag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tQXMHk9f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tQXMHk9f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1F63C4CEE7;
	Tue,  8 Apr 2025 10:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744109464;
	bh=Tv02OqEETUJL5RhGfHRLiUOkxm6hkdgtGZBz124yXQU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tQXMHk9fNNskMb5ZIzN4/MHk7noFhLHI/ogsrVPQqc6BboroIWnQ0P9VkObRnoHlC
	 puBUSqgUYDOTvahy7fEZrgOhv1YzNp0oAKzxuNHVjEoQpcp7TRwW4fu6OguAy7a+U3
	 lskhmbazxBjqUUCC2PP49TsRzlYP6mV3fzjmsOqZiVsAGWUA8UywX9h2EvXI7Jb3Eh
	 ABdHls/ciZCClLmms/SMw/e4lD/amzS/ifqmSxa/jXV9r6Qt9Wdi6O0nCxwweuOjI3
	 KcqQGtK13cGvbZl2i7kXTL8UI5jJeSkG2wwAYYVT6DttjmZvN36xGY9NnFyDfFtVQU
	 t6eoKBUimZtcw==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 08 Apr 2025 12:50:03 +0200
Subject: [PATCH 04/24] arm64/sysreg: Add ICC_ICSR_EL1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gicv5-host-v1-4-1f26db465f8d@kernel.org>
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

Add ICC_ICSR_EL1 register sysreg description.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 0cc1268c0bfad8266da47b441e80c603e46c00ae..985f2cdb67cfec6df335a3951ecb63f128f6da55 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2310,6 +2310,20 @@ Field	31	C
 Field	30:0	P
 EndSysreg
 
+Sysreg	ICC_ICSR_EL1	3	0	12	10	4
+Res0	63:48
+Field	47:32	IAFFID
+Res0	31:16
+Field	15:11	Priority
+Res0	10:6
+Field	5	HM
+Field	4	Active
+Field	3	IRM
+Field	2	Pending
+Field	1	Enabled
+Field	0	F
+EndSysreg
+
 SysregFields	ICC_PPI_PRIORITYRx_EL1
 Res0	63:61
 Field	60:56	Priority7

-- 
2.48.0

