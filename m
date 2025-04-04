Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9FA1F94C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 08:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743753661; cv=none; b=awaOFivs8pODCWHsP6i/ecOazcp+ohCUniIJMNOMMEkJxSSw+pXhIQWrXGmiq4rhfiKleWu1VuA7c5q89ZVPKlF9NE4pkBjClrbtngHoeXvJCMRAa6c8ZfSpNwOxCOZol9uI9cd1lzohWOTe/1XdkNaxawTOQ+2PrgZYSJOiCmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743753661; c=relaxed/simple;
	bh=pr0/25F8iIEDARQYcJhcKSuVvjTXR5ohp+UJj7cy7aI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=d1PQqyXrtMcO0kK2XS3FrljJorWja+TA90Ppq9goeUL3SVY2LOHzhQ6bNfbJus3QSut0C+pdnjlY+sW/lI13PwWNBMiuumeUr5+PooHaYIGPRW4vIwc8/QJWBDDwfLXTp/W8exLxmXqPAwzDfDp/ek29LVsbDekT0uJohf0Ylz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=fZTAsPvO; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="fZTAsPvO"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38f2f391864so942059f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 01:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743753655; x=1744358455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yx20aOl6hxNq71ohoplbiMtIwtQJkykeNvp+f1I4+W0=;
        b=fZTAsPvO4hdg1K/x5vi86Yyu82MnOJceQ3onai+bDz46omGtA+OCKLKnvYrhlu9OBH
         xrkeQ0q1xgIZD+gfX71/gl+wo9eUn6N1KdiAyf4VFDQhoGIN7IV+6ELH3yibzKrmcd9o
         NHjYQCo2Mno8VFIKdPswc/1INaCx8+02HKfE98kxMZeH0Qby5azeXuuJTXnVgTfK4VoQ
         mKZifOTnHzQIM3tk478xfaB32CgI23WtAl3Q9kZ4DxTSUCdty+WXTphypFweNcL/9934
         mFQj0NlqWOLUKD6lXfUd+G8U6AjqEn3DQ4aoNhCDDDllc5XzW9tQsxa2kRmR2/Qkl26s
         u5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743753655; x=1744358455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yx20aOl6hxNq71ohoplbiMtIwtQJkykeNvp+f1I4+W0=;
        b=LnuIAUMBP5m/danj1BcMmEPvDve0/SLgg8uHITU5dhkRxhRIjIt31qJkisjpYwbiBZ
         shaHRc66T1DluhXV4XxzYJpmZP0RRCCAgvwIgVfolWmO3ykBSGF/NVeCfMRn6bAsad7g
         Pfo6qF5FnarHuwS8TjUeVmNSQB9jHg7SQ6F7xxg5n2l0punegPg+hCrk7jzDot6U9IiV
         gfahDKuasvLJ8nklCrI4b4hLBCHd7KJaUHtdMlKCMzf0RBlG9TVbdm6017IcfUND7r+/
         Favtu2pbqbkUcyKNeA5wAw1GwOn4j5W1avbHlISeoXuumqwXkrnFqxiwceM3m9Sova9+
         28Tw==
X-Forwarded-Encrypted: i=1; AJvYcCWgPgR0/EF1kvT/qCreNmXtKcaDhpeWBCbtF2RB6db6XfljbCgeOOwjeYK8VuZUSPqzFs6oUdPta5DCJEE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCgJQi6uhbjxqGkUqsswaPaL9EtjAeJAuyVuTBJQePq/mY3wmQ
	D+8OW7SEEfwqafHsDjAmIlZwdm9RPIDfcwrR0vjMg7JCEhFyViJTOUa7RGqhSPw=
X-Gm-Gg: ASbGncu77RxjBc/feox4kYteQVWeYSgAHH8HUPsXIgSQ9rz9J+8bKmidG1rHY+2UauQ
	WZurH+qSexGq1Vqxe6mNSV/TmREYT7HX7j43sKORSVlvXilc7Kae2N+fndMvMHCVA30+Sh6jJSz
	4T1K/WXoJo0Cvwj943mmwGf4wfn6KKKnv/+w1bNY0tJ3fOqljtq+Sc0KxTE5ReAN9y3kiLmnhww
	AKZ0RWqmJYcbgFD32TT24jweN0GXK6mddTmFHI4K//4khwpu5J2VSlgty3lGbbIIuHrTcwnyHAF
	Psg6p9uCNghH1gx/EDeb2otyf1OseLiqxBWpmtd9DycWGjTlWdpuH2ghLO141uMojFhgMC294g+
	a9cgn3uG4byQ=
X-Google-Smtp-Source: AGHT+IH92EJqbZhbFVGJDEY6lA8Jg2sdloS5bO5Q4lOiIY+vLsPpGyrboeSaBmRz18vx/ZTSttV78A==
X-Received: by 2002:a5d:64cd:0:b0:390:eebc:6f32 with SMTP id ffacd0b85a97d-39d1466220fmr1243506f8f.48.1743753655066;
        Fri, 04 Apr 2025 01:00:55 -0700 (PDT)
Received: from localhost (p200300f65f14610400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f14:6104::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43ea8d2bc7fsm50496335e9.0.2025.04.04.01.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 01:00:54 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Generalize ARM/RISC-V/RENESAS ARCHITECTURE
Date: Fri,  4 Apr 2025 10:00:43 +0200
Message-ID: <20250404080045.367845-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1057; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=pr0/25F8iIEDARQYcJhcKSuVvjTXR5ohp+UJj7cy7aI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBn75GtwXL7vChmr7X6CN1PdBtkkIelvq/R+QaBy PKUstjArYaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ++RrQAKCRCPgPtYfRL+ TiZOCAC7TV74Eg4xchbUyT6fdfyvJy2FDymVP9icFTyJ0jdpcJeSeJiIeLIDmV0rG67gfwtS4jl k75rfRgnth5JJ8AQb/OIibPdiAOY85um9QdLl169kEc6ZJidQQmIyHFa7xeqLm/MwsjWhfG2EiC y/ejXE/CGin2/ph+Y/VbGldTKy8XsCEfFJ3EQYN97dX8oU0rPlLO94BDt+lgTG40bMwGStsO/j2 XhCDSbp6LmgZswLYwXx6bShCkWZPEQAW6CofoDOukTsIjz5NmG46Oe0bR1yQ+WJbT9mcfyN5Cs8 dunLewUFiXcnCJW4AiIaH+IMAJnuSbvmxhSGFTyt00rsnpFd
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Triggered by noticing that the pwm-rcar driver isn't covered by the
Renesas maintainer entry, add this driver to it. Instead of adding it
explicitly, just add a file regex for "rcar" (and drop the one entry
that gets redundant by that).

Looking at the output of

	$ git ls-files | grep rcar

only shows files related to that architecture, so no X: line is
currently needed.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4cc3cfd35665..77155718a9e9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3061,10 +3061,10 @@ F:	arch/arm/include/debug/renesas-scif.S
 F:	arch/arm/mach-shmobile/
 F:	arch/arm64/boot/dts/renesas/
 F:	arch/riscv/boot/dts/renesas/
-F:	drivers/nvmem/rcar-efuse.c
 F:	drivers/pmdomain/renesas/
 F:	drivers/soc/renesas/
 F:	include/linux/soc/renesas/
+N:	rcar
 K:	\brenesas,
 
 ARM/RISCPC ARCHITECTURE

base-commit: a2cc6ff5ec8f91bc463fd3b0c26b61166a07eb11
-- 
2.47.2

