Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9869B2E3399
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 00:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743639474; cv=none; b=jr/s2quSwApcOjAgLun4suwlDT83gIrFbsua09GQVhDFNV70c59e+SxBgRIEcXDAFeUGg9lmgSjkocMLZTugjTkEg2jRd2OiKb+RcVMoSk9HccdpupkjWFAFRIJ+gWIiUK7y5Q+2/1JurLE+D4vhsExmRCTJeK50ZOJse604DWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743639474; c=relaxed/simple;
	bh=lQS4ILMHudgZnoFkuuWQtzQru9rvUMdKZa7T9T4nCE0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=grIY7T7Jk+RX1u+21YB1mEqCZcphgkOraVel811OeqVSbbRSRcXwA17nc26LeaeEVR7OgMoqUO2PbxoYFAeXlG5Vm+DC1qXqwzeuLYshkOiybc5Dy/igc1J+UN4lARXnspxlX7q9JVfCdBGjBsIrj4SVi5/8qYubPO/4sOs0G1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GYsBxSjj; arc=none smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GYsBxSjj"
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-39c0e0bc733so296090f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 17:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743639471; x=1744244271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WaNe1THj7jAMauZ+XWm1kJQFr9+oN7TD1YulnniykuU=;
        b=GYsBxSjjGGWubqCw4EiYxuhF9vcTTDJnl8ri3yYB8wiG5PwgtWBL9BFnPI2X6FG1Xi
         zm/KtXl5IySbe2LEUstmf+0sQlfTwFh2QGbR/FYziHmMaB6vZpaK2n6i6PInfMIOTgLu
         tzx96eWJd9AIr0ycQbK4uFjcAKlQnSsnJBsrs8OLAOeYSsYbC14iNDQTDVWf9PY/s2MA
         JU6PRLU1lv10UWEu8AqdhYtWQv9TaTPumXp8TCnjMDSNscLfPeNrArSyFGO2L5z0puDS
         edXhvCxRpIOa6iFfSh88PryUp9LqKm9e+aN5Bcts5v7OAwSkNptcc+JTIcMDOJKVG8Uu
         ljZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743639471; x=1744244271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WaNe1THj7jAMauZ+XWm1kJQFr9+oN7TD1YulnniykuU=;
        b=ebnD/6GICaAO9b1A5DHC70nYMsVX5cm0ZxA5Bz0PjmJO38xQGEGlpIjtYKYxFRbU5q
         xbS/i86/3WlIVpo6SVxGhtByK974WJX0TPNr9Aq3/YlMshnYim6cf0jVGiSWVp+tEqFi
         lKE8SsYCc2s9kxq+xghsFT62RdZGqhuCfCjShY6M3iIN7dxKS4gcG3tdzP/0CFoRZNNK
         dPXEq/K306gkuDFeWQQGEIm5XMQQF554I5a0x/wy3d/JFzBIRGfL9QZmkJtTjQM3FfFC
         ckFhO0UcdzKCW/8LXMs+ZMWuQJbP9Km3XGqosaQ8mpnkz9UCXA1/BiezGEEmCnWjeMkf
         3GPA==
X-Forwarded-Encrypted: i=1; AJvYcCWr/PwgXOILqkxr6G4oAjogCmhDXsX5zxxLj3kDSRV0bvCzkeZ81n0y2YmddxXvcgSq1sfIqJUxpv/4c+M=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx4XQrPXe0HQAJrGmHMlMYyQY+nx4ydgKN247SeEbthseiQNHf
	5poJRRQuUjElBw90oYuGf7hDh3lnwPVxLAtEQvn/CumCkbuOE/H0
X-Gm-Gg: ASbGnctdi7FrqlPqbZ2Ll2EN3gkqzjd9VL0Fy6gdBpniKlHV12asf275uTPtN73sL7U
	cH69nPIoiHv0yq7KT8bPyBP9IsCpIUgd8P4aUWZMEzP5hr6BxFxRaEGLNVe2McgdZoyN9yUaqft
	J7lalc3qVGsGZ+E2FH0wcOAS2Wh2UbkABIVhoY/mnvFmBpAqA2sCwvVSdHByM9JcE0wBDu99NXp
	5X5TZPw87HEUsZUj3QVTfebG33ZTTEWrtpPdVl4UxriaCDv2i5FMVKenIc4nMtejY2nnBfTc/AQ
	GyDCmCFoqzXITXtTQCTaaHVifFZkgsokvDHx5wVUyziR8Q7AdPzQyChhwpJiltoz
X-Google-Smtp-Source: AGHT+IFX4EGKGwjZ/B7B0Z2W502N718VlfIqEydxIIY5HkliydHgTiZt+B1VkjYzzhgyehCuq4Wlcg==
X-Received: by 2002:a05:6000:220d:b0:39c:16a0:fef4 with SMTP id ffacd0b85a97d-39c2f8e0dabmr418220f8f.24.1743639470690;
        Wed, 02 Apr 2025 17:17:50 -0700 (PDT)
Received: from localhost.localdomain ([109.72.196.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a0a90sm255250f8f.21.2025.04.02.17.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 17:17:49 -0700 (PDT)
From: Mohammad Mahdi Anbaraki <m.mahdianbaraki@gmail.com>
To: geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Mohammad Mahdi Anbaraki <m.mahdianbaraki@gmail.com>
Subject: [PATCH] m64k/kernel: replace strncpy() with strscpy()
Date: Thu,  3 Apr 2025 03:46:27 +0330
Message-ID: <20250403001628.29920-1-m.mahdianbaraki@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Swapped out strncpy() for strscpy() in parse_uboot_commandline() while
copying to commandp. strscpy() makes sure the string is properly null-
terminated and gives a more useful return value so it's just a safer 
choice overall.

Link: https://github.com/KSPP/linux/issues/90
Signed-off-by: Mohammad Mahdi Anbaraki <m.mahdianbaraki@gmail.com>
---
 arch/m68k/kernel/uboot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/kernel/uboot.c b/arch/m68k/kernel/uboot.c
index 5e52ea150..fa7c279ea 100644
--- a/arch/m68k/kernel/uboot.c
+++ b/arch/m68k/kernel/uboot.c
@@ -73,7 +73,7 @@ static void __init parse_uboot_commandline(char *commandp, int size)
 	uboot_cmd_end = sp[5];
 
 	if (uboot_cmd_start && uboot_cmd_end)
-		strncpy(commandp, (const char *)uboot_cmd_start, size);
+		strscpy(commandp, (const char *)uboot_cmd_start, size);
 
 #if defined(CONFIG_BLK_DEV_INITRD)
 	uboot_initrd_start = sp[2];
-- 
2.43.0

