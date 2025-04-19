Received: from sender4-op-o16.zoho.com (sender4-op-o16.zoho.com [136.143.188.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDBB3BBC9;
	Sat, 19 Apr 2025 17:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745082646; cv=pass; b=aFTpdGuGRQh3Uv2+svB14Y9Ko+Br9XqK+vb5H61pv3mKiPlKjB1Bb47/jLGEHDfMPRY1++1/1GtzZ3KJSHJ8Uda7heEDd/0zQZ/V2yCAnqZJRfLMk284Uc2oQxAHSfF7QcdvUgAF8yHulC1GHUHNaUwRJ89D/LZZTNiS9lP3ODU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745082646; c=relaxed/simple;
	bh=FScS832+VFdZStqXHlWridVxQQzyABZcH6GmzQcbCaA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QYaTBL0P/0Hi6S4qQUkgYI1XvWLqsi8COE9VgsvHJiKbz5FH4HRp5DVjmjbDf658bxMQPoLmkwt9ylaoQRTDexkoNDwN2KvNLArir/VLOYud3/PFMtCLyvrdpXyVfkLfuAjQXPBYOrMWfAA7GWuYIyubheT/DbvC/IOmAAM4A2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=E9E+SLpW; arc=pass smtp.client-ip=136.143.188.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="E9E+SLpW"
ARC-Seal: i=1; a=rsa-sha256; t=1745082620; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kUPtjhyulj4lKNZSr5Q506nPr9Rhwq7BjADHGzZk6aGdlfuF0hQhyDy3kmqP65sKUMmiNlMlCSeCNx7cGlXnSuxeQdx8nEnx8TUTGJl2HjuYdl6YqOqcD6u1boF35DwZ7dQVuaLlpJsgRUywBBNIj2CX8ME1LX6BcANYYnebhcw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745082620; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zc6hW+RokbtJ0HkiqvbdqKYh3HQtrMeP7KANf84SHQU=; 
	b=DYOPJQgPAPgdubZGMf+TVfjRYjlp3smGoeUOiTPOoNkin0Sb94UIJnCTTiNbpp2lTzmzhMPZ3ZhEylRvr6KJiX+9LyXEeFZsE3S3fxGDgF00dHVCgyzKdgUK0QpKTzhtUq3Xiel435HdOJNX8YcVI0SAADxURLKaWEtbb2dfyPA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745082620;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=zc6hW+RokbtJ0HkiqvbdqKYh3HQtrMeP7KANf84SHQU=;
	b=E9E+SLpWImkk9kyjBZ1vaTepXEWMnulIwzrUi0fqLjZbcqni5rOxVuJiDe5+hTW7
	aK8C/+dfGrK4x86Gbbq4XPWNRjvctpehJZb3NPHJOJW7qNEz86IdpRxKs9wbwU0J7FE
	CGm52atno1IotD7UZ3O0vriwGUDn0tD4SPL7xPCs=
Received: by mx.zohomail.com with SMTPS id 1745082617967477.42022053116546;
	Sat, 19 Apr 2025 10:10:17 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH v2 0/2] reset: canaan: add Kendryte K230 reset support
Date: Sun, 20 Apr 2025 01:09:43 +0800
Message-Id: <20250420-k230-reset-v2-0-f1b4a016e438@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANjYA2gC/1XMQQ7CIBCF4as0sxYzUKrFlfcwXShM7aRaDGCja
 bi7tDuX/0vet0CkwBThVC0QaObIfiqhdhXY4TrdSbArDQpVgxq1GFWNIlCkJGpl2qM99EiugXJ
 4Ber5s2GXrvTAMfnw3exZruvKaDTqj5mlQOHQOiulaQ3dzv6dHt6Pe+uf0OWcf1S31ZSmAAAA
X-Change-ID: 20250404-k230-reset-32987c6f0ed5
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Junhui Liu <junhui.liu@pigmoral.tech>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745082602; l=1733;
 i=junhui.liu@pigmoral.tech; s=20250223; h=from:subject:message-id;
 bh=FScS832+VFdZStqXHlWridVxQQzyABZcH6GmzQcbCaA=;
 b=ntVwPG4tNYZHH4Spqv0J8dovVCQpHAe6gzM+PcyDRQMdVcz7dFr1zaHI000Z7hcmCKFs59mNq
 QjQdVUUgCr6AtZhupq0pmKpeP3w0owPe5h/zG0bUbr+aMRJBDJ4/1id
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=ZRZkOjG47iI+To+oAo2R4KIpMwtz8r0TffJ5/nO2tcg=
X-ZohoMailClient: External

This patch series add reset controller support for the Canaan Kendryte
K230 SoC.

Tested on CanMV-K230-V1.1 board. Some of the HW_DONE and SW_DONE reset
type was tested by reseting the submodule and checking the reset
register value[1]. The CPU reset type was tested by a temporary rproc
driver[2][3].

link: https://gist.github.com/pigmoral/cc45de673775575750ac7fe49d4456a2 [1]
link: https://github.com/pigmoral/linux/tree/k230/rproc-cpu0 [2]
link: https://github.com/pigmoral/linux/tree/k230/rproc-cpu1 [3]

---
Changes in v2:
- Turn to_k230_rst from macro to inline function
- Use guard to replace spin_lock_irqsave and spin_unlock_irqrestore
- Remove assert and deassert operations for self-clearing reset types,
  only reserve the reset operation
- Add delay to accommodate the reset time
- Remove blank line inside read-modify-write operations
- Remove redundant default case in enum switch
- Update copyright dates and my email address
- Link to v1: https://lore.kernel.org/r/20240924-k230-reset-v1-0-d0cdc11989eb@outlook.com

---
Junhui Liu (2):
      dt-bindings: reset: add support for canaan,k230-rst
      reset: canaan: add reset driver for Kendryte K230

 .../devicetree/bindings/reset/canaan,k230-rst.yaml |  39 +++
 drivers/reset/Kconfig                              |   9 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-k230.c                         | 355 +++++++++++++++++++++
 include/dt-bindings/reset/canaan,k230-rst.h        |  90 ++++++
 5 files changed, 494 insertions(+)
---
base-commit: 8560697b23dc2f405cb463af2b17256a9888129d
change-id: 20250404-k230-reset-32987c6f0ed5

Best regards,
-- 
Junhui Liu <junhui.liu@pigmoral.tech>

