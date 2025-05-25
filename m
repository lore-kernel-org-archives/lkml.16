Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F87972610
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 02:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748141306; cv=none; b=J36aMQ8ui/QsSHPLA2SytrlqY4QQv8S9wGScxM6kxYMxQ8AJorWGjKIC85GYl2eRzgkofGovzb1LSmFj/BRSmEN2+lgeFL3OqGB3USgC35BMYMdwyihnVmS9TOP5roFlOLq5vsKI9ttRgJYyvQpmr4C1l6ca9YKEKE7psTmRwFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748141306; c=relaxed/simple;
	bh=pWTqB9al9MLBk/zKau+VF7mb/iqHgOdoI6eDiMU93vw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BopQqEBv3iJ6WZPXuvfYKaWmgL1BQpfkT0uhOMr7sTL5ZfnqKvZTCwgdnPydIlXN0SXhThP7y+oRixORntz2GhtBQo4/BZQfLa/63/SkXP6Nx3pz7++tZz4PjusTR0ky6PSswYQUqfZD0J3ICBxZD47Y6SL77Rg9MZkptv9R76c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NCnIOXLh; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NCnIOXLh"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e7b9972069dso827494276.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 19:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748141303; x=1748746103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J5H8miVdrreeo2R5rwgILx0vbH1/jlB+6nndREjSBVQ=;
        b=NCnIOXLhtwW9wHTfQM2XoYhAi0ubHQUezgf9F4ky17qWkxjT88oqj4AiAhakVviZhq
         aE3evIThQ31Ctbx8zUJ6jJEzrpxNbv973IvaK8aNlmxRV5skrQhNrBEqabI07xoSFWAB
         YL5ptnD7i/ZBgi3A1x0bSfnOT752LYtes4eAoPbRsKTepK1qUZ6YNyT7gqxYB5KL7Fa9
         z5nnh9f13so3Tt9XM5/K3qTzBUh9L0TaXjGpqs7RxKJBUE5677VdSK8fYXB0BPRTVBpK
         1hZ2l7CzYiwLz/jAphME6GZJw78uhNEKHWlJ3xyeVFBOEFL4JQPE4kTJERKRdRPsDRjo
         sSSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748141303; x=1748746103;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J5H8miVdrreeo2R5rwgILx0vbH1/jlB+6nndREjSBVQ=;
        b=FonorLrJAa4W+oGx8wZKEtW3KEs90+nFbJliHs20ZQ8L6k3sv44mU6ISYY8Q3iXBkx
         q9U/yuNOKWfnCWpGwYWEfB3Xn9QhVDXKpTjHJ3UTCSzxNEZusVZhw3NtdlOyodVauvWi
         GqRKbf09qRzfqNr9gQ6HIGiPdKxDx8guRjAlLVvExqVzQUZVglWOBxQ4LJSzA6M//tb6
         MV1mwwxmonGCzagbPBE+lTOunGPkhDMdNISpbCMONSheFr9qR+Jm/yL4ksF2ZYpIYrVE
         TCD6fAA1zaZ7xBFgeJ/9hEgvuD7aQ9y3ibzbBg61/pd1PBQvuwCi975EiLSttHMmpk/b
         tNhg==
X-Forwarded-Encrypted: i=1; AJvYcCVmz59af3bQRPX4jKKNhwEwWGRPaiwlyXbFK+sEEydvHCf7wY14gh36w05c9r+jAgfXvyw7KOkm6Pj3wzQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKz0riWynmvN3/pQrDYjXnK2Ugbjfopi5tO6l5rjBuUG310Vk8
	0FYujj48vPAYpnJZj3F0AZWE5qz57cfU+XN2PKjAiDtbuUTUwCy9BYL9
X-Gm-Gg: ASbGncuTE/hoXLyOYXI1ZEPuthVj4FtymlCDFAe2QpxMVWGVhNigt6AZ6DvqsbWYjtt
	P82Vnwyx+zJi0IRFTYnW33YSuyP2dNApmf1dn5ADEun4Q++BY2XP32vdMiF2ReuErCQDhqg1fjp
	mY81XYTvPfgjn56ahdT4Psaep1A3sSfA9+/kmOEHnroSM6JScl0mplx9FH5aODLK/Zm2jBQ3c9o
	D+NR1NpY1eyNxa2c63EBouMarx1HKrmyNEeW3wMssJ6sctRqy5n48Ok1Sku+jKUxMhMQX1xqiZi
	7hNxF32IkiG2ypgF65bDhWDAJDPy38vpLMzGDv2p12OIFR4GajE5rbiHq3QN3Ro5zVu7qHWhzdu
	7x54=
X-Google-Smtp-Source: AGHT+IGTYIpzzoB4R49eo/70y47qmccpJpO+y0657G/ZHOyDrLFSgO2Wihs19PpbwoGxGQMTdisH3g==
X-Received: by 2002:a05:6902:330a:b0:e73:2da2:c300 with SMTP id 3f1490d57ef6-e7d91d84308mr3757453276.44.1748141302842;
        Sat, 24 May 2025 19:48:22 -0700 (PDT)
Received: from maquina-virtual-para-linux.. ([191.156.247.35])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e7d696663ddsm2172687276.21.2025.05.24.19.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 19:48:21 -0700 (PDT)
From: Donny Turizo <donnyturizo13@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Donny Turizo <donnyturizo13@gmail.com>
Subject: [PATCH v3] staging: rtl8723bs: Fix camelCase to snake_case style in core files
Date: Sun, 25 May 2025 02:48:14 +0000
Message-ID: <20250525024814.4362-1-donnyturizo13@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch renames the functions _Read_MACREG and _Write_MACREG to
_Read_macreg and _Write_macreg respectively, aligning them with the
Linux kernel's naming convention of using snake_case for identifiers.

These changes improve code readability and maintain consistency with
the kernel coding style, particularly in the rtl8723bs staging driver.

No functional changes introduced.

Signed-off-by: Donny Turizo <donnyturizo13@gmail.com>

---
v2: Rebased the patch onto Greg Kroah-Hartman's staging branch for
proper submission base.

v3: Updated the commit message body to provide a clear description of
the changes.
Changed the "From" field to use my real name as author.
Updated the existing Signed-off-by line to reflect my real name.
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 557bfdf092c2..81f795a82711 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -9,8 +9,8 @@
 #include <linux/jiffies.h>
 
 static struct _cmd_callback rtw_cmd_callback[] = {
-	{GEN_CMD_CODE(_Read_MACREG), NULL}, /*0*/
-	{GEN_CMD_CODE(_Write_MACREG), NULL},
+	{GEN_CMD_CODE(_read_macreg), NULL}, /*0*/
+	{GEN_CMD_CODE(_write_macreg), NULL},
 	{GEN_CMD_CODE(_Read_BBREG), &rtw_getbbrfreg_cmdrsp_callback},
 	{GEN_CMD_CODE(_Write_BBREG), NULL},
 	{GEN_CMD_CODE(_Read_RFREG), &rtw_getbbrfreg_cmdrsp_callback},
-- 
2.43.0

