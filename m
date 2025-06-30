Received: from esa1.hc555-34.eu.iphmx.com (esa1.hc555-34.eu.iphmx.com [23.90.104.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DE325C833
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 11:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.90.104.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751282736; cv=none; b=r3An7cj5S+vCq1ZUg4djbIu1p166iwpyt0CO0RCxigJAsf6THHJQrYCrM9PclrMFjySYRCQReuyzH/cN7PqJTA34e+leKXRvdGMXO8HfRbQUcg127Z3gyic7CvCwjgZWtBkyT6SP9HNB0sHcjSO9I6zezTKjPpPqSmQgVYdww2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751282736; c=relaxed/simple;
	bh=rtGozj1Eecsc0Y022urCuSqjhAue5dzTmGXqpT9ZSF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hLkhQf+34NJIRGuIwVjjQ9m5jqRoxcX1L3cc4sjC5/0/vC0ocdawz5yg93fAakonnMPN7MFHpmWTL0xCYX0JFo0/yu144hnp4fdUceR55SEHOmszxytj9gTjtMNIqKmSxeinPMyw3I/0J7pkp3rNCX4G6Md0obS4mfXIqw404SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com; spf=pass smtp.mailfrom=mobileye.com; dkim=fail (0-bit key) header.d=mobileye.com header.i=@mobileye.com header.b=Zdato96S reason="key not found in DNS"; arc=none smtp.client-ip=23.90.104.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mobileye.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mobileye.com header.i=@mobileye.com header.b="Zdato96S"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1751282733; x=1782818733;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rtGozj1Eecsc0Y022urCuSqjhAue5dzTmGXqpT9ZSF0=;
  b=Zdato96SMsdpspCP6+o3hW1QhQvbvnTRjEGNmovk3kWtvnU3mmdAzMkO
   13WIuE1hYqZbsTeGSzqtm8VEm+UjB9dxP0LxVkvsul+ceJksezkSU2mXq
   gqreCTyQdTBhgwa3ElorCXpDqCTw9mG8G7dKQVg7WnK6/Ca8YSbuVDw67
   pmRJu08sauYsT/AtB6fxG4dxNCthqQXvPc8zLXg0aLQDrjGE+ENCp0P5s
   Y4ViQOjI2o/8V3O6xmY+q14fyq8m/+nAiI3qyW+snQIIBdmwZu3BXsPb7
   /vDoNToPckUrmGzuv9HqzOJm+er1wWf4y1dUru/x9TShPCoYUvkdi4uVo
   g==;
X-CSE-ConnectionGUID: jt4cel4LSSyMcgztyyK8gA==
X-CSE-MsgGUID: XUCIx9tMQJm/fIYqhoQdSw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 14:24:22 +0300
X-CSE-ConnectionGUID: IGZG9yLwTFKAHMP+1UGyIQ==
X-CSE-MsgGUID: bfdPHOXyTq2LEkMUeDkMhw==
Received: from unknown (HELO epgd034.me-corp.lan) ([10.154.54.6])
  by ces04_data.me-crop.lan with SMTP; 30 Jun 2025 14:24:20 +0300
Received: by epgd034.me-corp.lan (sSMTP sendmail emulation); Mon, 30 Jun 2025 14:24:21 +0300
From: Pnina Feder <pnina.feder@mobileye.com>
To: bjorn@kernel.org
Cc: alex@ghiti.fr,
	bjorn@rivosinc.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	mick@ics.forth.gr,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	Pnina Feder <pnina.feder@mobileye.com>
Subject: [PATCH 1/1] riscv: Change memblock reserved name to be recognized on kexec
Date: Mon, 30 Jun 2025 14:21:30 +0300
Message-ID: <20250630112309.97162-4-pnina.feder@mobileye.com>
In-Reply-To: <20250409182129.634415-1-bjorn@kernel.org>
References: <20250409182129.634415-1-bjorn@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

memblock resreved exposes as Reserved on iomem,
kexec tool doesn't take those parts to vmcore, but
the kernel use those address and it needed when opening the vmcore.
Without this fix the crash-tool fails.

Fixes: e94eb7ea6f20 ("riscv: Properly export reserved regions in /proc/iomem")
Signed-off-by: Pnina Feder <pnina.feder@mobileye.com>
---
 arch/riscv/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 14888e5ea19a..16e0cebed170 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -249,7 +249,7 @@ static int __init reserve_memblock_reserved_regions(void)
 			if (start > mem->end || end < mem->start)
 				continue;
 
-			reserve_region_with_split(mem, start, end, "Reserved");
+			reserve_region_with_split(mem, start, end, "Reserved-memblock");
 		}
 	}
 
-- 
2.43.0

