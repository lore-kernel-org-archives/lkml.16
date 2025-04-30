Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401202101A0
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 09:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746004818; cv=none; b=RkIWzErvusWKgv91gP1+i+MA0prHul/NuBH3hliZMcKHrsdsEzX1Panm7CEumknTi3Ey0Tfq9uE/Z+ficj3PR8+ereAkeL6MQwteAuHWiS1oYd4Ni8D4wddNH/5DaCH5ffXpHSCjKNy5y1jJCMdOEuDbDYzKZGb99/USUvi4mio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746004818; c=relaxed/simple;
	bh=cW9d/Rmy90twKu1nBcAQ96FnqVatSg6nDwNqik5oPGU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WYJLt7gNbcEvjFr1HRacJhdJDCZWBvB2tP7wF/q+QKYAOqwpMCYPb9T5D2LysOzqW1A7xSRAg9Zjcox5gTtYL6nzu5NXUeqnJ+AOWgNIfZf/y6lXoYrRlTXBq8gwMO3u4qR8VRktKp/qp5fwxH6gOa9EW6va0P1VR0kIhuIFQEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0HpGLRqg; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=owWpbGxV; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0HpGLRqg";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="owWpbGxV"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746004814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MMRGtc/YdjBCDNnawNBEVkHA44KGSgJESgxXTj3UFMo=;
	b=0HpGLRqgYfB+K2JbbFVAHHOtYZAtcCvOcTgmlUi8HqwVny7swKGQPS88+vwfwZPsm3KKny
	CafoWtTExPZxKLBxrod7N5yTj7zAd1U45n4ITxgM4v/vNmhyUjF7MXmMF8jRCg0MKJzBSq
	u8nqBZdELEicIr2dJ8JhTYKXi11+86wCkBUHnnT975rf+pS99GGzn63R8oVHxsU/FY9+Dk
	nGrLgKG23qavsvyTDvVUW0eUDAfVCpIZVrR44+vMaVVEaE/zy3hvNCVQ/wqUrxNBEP+yt8
	q4xKh/WEiE3ql1koPKu2Tvf8lKOSgSJ1ZfFZlExMDSIyGTQ2m/imNsYJqD/aDQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746004814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MMRGtc/YdjBCDNnawNBEVkHA44KGSgJESgxXTj3UFMo=;
	b=owWpbGxV7bQiBdT5uJNkafd86cFIs2zF4ShVTcYq4gs+pxHiI1ChB2rxmKKliPCzHoLJje
	VpbPBSt/A6mm5hDw==
Subject: [PATCH v2 0/2] vdso: Work around and reject absolute relocations
Date: Wed, 30 Apr 2025 11:20:12 +0200
Message-Id: <20250430-vdso-absolute-reloc-v2-0-5efcc3bc4b26@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEzrEWgC/22NywrCMBBFf6Vk7Ugy2pcr/0O6SJupHSiJJGmol
 P67seDO5Tlwz91EIM8UxK3YhKfEgZ3NgKdCDJO2TwI2mQVKLOUVG0gmONB9cPMSCTzNbgCNWGF
 7GVRdKZGXL08jr0f10WWeOETn38dJUl/767V/e0mBhLaptdSjUbIv7zPbJXpneT0bEt2+7x9RW
 oCwugAAAA==
X-Change-ID: 20250428-vdso-absolute-reloc-a226293c1761
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Nam Cao <namcao@linutronix.de>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Thomas Gleixner <tglx@linutronix.de>, Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jan Stancek <jstancek@redhat.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746004814; l=978;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=cW9d/Rmy90twKu1nBcAQ96FnqVatSg6nDwNqik5oPGU=;
 b=E4tZW5xu2Y4p5MVLh0Z1lPtgUgZiuJwUW175Ppl7/Mg6uyIxi4z+s1LtWmfYGdOtT6SX7KI7z
 mRhtg5RVmd5BXyj5WpzKtw+/xq1NxMnuN7yrFWEvJK+DEENpNVaSi8J
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

GCC on arm64 would incorrectly emit absolute relocations in vDSO code.
Work around those and break the build if new ones appear.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Changes in v2:
- Link to openend (invalid) GCC bug containing more explanations
- Refine commit messages
- Don't fail on commit absolute relocations in debug info
- Link to v1: https://lore.kernel.org/r/20250429-vdso-absolute-reloc-v1-0-987a0afd10b5@linutronix.de

---
Thomas Weißschuh (2):
      arm64: vdso: Work around invalid absolute relocations from GCC
      vdso: Reject absolute relocations during build

 arch/arm64/include/asm/vdso/gettimeofday.h | 13 +++++++++++++
 lib/vdso/Makefile.include                  |  6 ++++++
 2 files changed, 19 insertions(+)
---
base-commit: b4432656b36e5cc1d50a1f2dc15357543add530e
change-id: 20250428-vdso-absolute-reloc-a226293c1761

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>

