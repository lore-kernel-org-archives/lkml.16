Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA43EA29
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 11:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746357885; cv=none; b=tTNkZ/uhEfUUPYVW91PC5fpcXMD+4H6NkDi++nsHPXcp0jw5GPmbCDv5iaCz2QpI52nqN+5HUqECXFBo408m2oMh1Tm2u0IMnX4phyg5fKcu4aME8xZdakk8Ig75cixPuplUy3RSVlqct92NUwaHPTpWfG/Ta30uyY9CseL1KUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746357885; c=relaxed/simple;
	bh=dB+eSdk5bmJLofe21KHiRL9lm/wFp6a0skcb5cnR6rU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KUP1u2tpeUogaxhMIN0ERcWNEEy1k0+LoVzQh0CPc73sG9YeuQqB4D8H2xQZOuSWvQ0IzqZVMg25roHZe7aNue3LdE1Biu3Fk5fg+GkoQbd/eKkENyAs7s/rUDVJyiZTvC5f2tlReORZtpq6Y5kPXiI1qfa+MS2pzWbnelRzcqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=afOhK/bt; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="afOhK/bt"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso32137485e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 04:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746357881; x=1746962681; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rCvX4uJY7+qc0Sa1nCHPGxvQLNSrnb7aHcxG3bQRQw8=;
        b=afOhK/bt9WYNcxRQ81bpkpz3FhoaVFXsFrnqMkOndLgbxFonqwK1MfBziOR9LltpsG
         LckHJcH66eXE6jfEZ88Qe4wjZbQE5f40nGTzaLUvqRJoSeSBaAYQBy4D+Z/b6yEF8cGc
         kAdCaM9YjYQpznlRefu6LR82LkHkGA7Oj5JxqIzpmfh10ZPl1fdV6ZvqZ6Jn0bwGT4Gj
         zIneHE4TqwoWtlAAvkoNAyyeCnun9PKfRJh2YmglNURbj25HyHVoj1U6zaZBlP3Mp5Hd
         dRXW3R0Yl57EUMEkSzcIxjcNOFkm2qgX30CQCMwksfHbVKOaG7K23se8D6rwRbE/3C+3
         HRpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746357881; x=1746962681;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rCvX4uJY7+qc0Sa1nCHPGxvQLNSrnb7aHcxG3bQRQw8=;
        b=idbrH/jw8IKpB6r2J/1rb6dbqoLfF9EttRdWQccc/hMsFUCB/oIt9BXmzZVyf8yWuw
         zKQ00+dI4r+NB4f8hEOF4YO5YqPz2DFqtuFso+sXC2sldsgUe48tTtbnHgPfRtH070fQ
         v3WxNG511eN+B7UdE0/cK8351FQraDwtG8JgeZCKICivjYKN+OQ0GzeGbD/1JaJdOamE
         Kk8LXgziL2ltxSU32h3dDzurKYqI0jf88pIm1JHnu37tsJupeL2rYogSnsdqq4+rdNfb
         9+0OIsrx1Wq6gMJof8mqDwbMZ0rb1YPCMhDpuRufnq7a66PPa+cIpvuY7VbnV3e/XeFN
         V/Fw==
X-Forwarded-Encrypted: i=1; AJvYcCVIBGL/zKdFSNrSfWFyXhqs9xfRCLYjrp+zCICo4gJhgskqamxYQFmSgHFnLCkfdOoyaG9eH2hN8ABB1/g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnWSAngJ9053VIMxH6w7QBoxP/GPbGV9Qrh9dOHontziXfOlwD
	lYd1153I+FbXPOrAr4ndS2QUhB2PqsXLQOSkhV82YjrNu9mLKbhmIFXVYm08Y+k=
X-Gm-Gg: ASbGnctqO4Zic82w17laDqF4nhG3lyXZmvlmYeo5AG4qCzbjgjWgmwbqw2rMPe51uW4
	pWJsv2Mzd6temtJhBtQX1pUJM/XrfvegnYWltK7CVQ6i0sqDJiP/864dxLshQM6JfMuVZMxc5f2
	M18SFYVDiqcMGqcfac/9T0H/EKCcWnBr9I+LybeopA33ke3oNetB/uKX0EzdSzAEJTGqsY7PhIf
	10KSxjLYoK5ON/w+ZAgsz3fwFIIB/e7x10rwbb2z66uAb3s9rMljo7HgxuDrqd4PcjM0zd4yP3o
	pUvsHmql3BngRNoX33qTsAh+yX9CQ2SwS+8JukP0kYJj
X-Google-Smtp-Source: AGHT+IF/nTjowgFTpX4DBmNA53Y4LVnmPuQntazuU/vu02j6XLWVnIjjuNgsMm6A3VC25/HRU1jVEA==
X-Received: by 2002:a05:600c:4e88:b0:441:b19c:96fe with SMTP id 5b1f17b1804b1-441c48bdfe5mr30770245e9.10.1746357880705;
        Sun, 04 May 2025 04:24:40 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:e0a:e50:3860:9356:7b97:9d4d:d944])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2ad784asm144447685e9.7.2025.05.04.04.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 04:24:40 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
Date: Sun, 04 May 2025 13:24:39 +0200
Subject: [PATCH] arm64: Kconfig.platforms: remove useless select for
 ARCH_K3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250504-kconfig-v1-1-ab0216f4fa98@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAHZOF2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUwMT3ezk/Ly0zHRdM4s0Q2PLtKQ0Y2NzJaDqgqLUtMwKsEnRsbW1AH7
 Au9tZAAAA
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Nishanth Menon <nm@ti.com>
Cc: Andrew Davis <afd@ti.com>, vishalm@ti.com, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Guillaume La Roque <glaroque@baylibre.com>
X-Mailer: b4 0.14.1

After patch done on TI_MESSAGE_MANAGER[1] and TI_SCI_PROTOCOL[2] driver
select on ARCH_K3 are not needed anymore.

Remove it and give possibility to enable this driver in modules.

[1] https://lore.kernel.org/all/20180828005311.8529-1-nm@ti.com/
[2] https://lore.kernel.org/all/20250220-ti-firmware-v2-1-ff26883c6ce9@baylibre.com/

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 arch/arm64/Kconfig.platforms | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 8b76821f190f..5b63a42c4dff 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -138,8 +138,6 @@ config ARCH_K3
 	select PM_GENERIC_DOMAINS if PM
 	select MAILBOX
 	select SOC_TI
-	select TI_MESSAGE_MANAGER
-	select TI_SCI_PROTOCOL
 	select TI_K3_SOCINFO
 	help
 	  This enables support for Texas Instruments' K3 multicore SoC

---
base-commit: e8ab83e34bdc458b5cd77f201e4ed04807978fb1
change-id: 20250504-kconfig-68f139fbf337

Best regards,
-- 
Guillaume La Roque <glaroque@baylibre.com>

