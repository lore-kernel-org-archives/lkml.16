Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66911FC3
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 00:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747872262; cv=none; b=fZpjoKvFZ7pI6DrnXYY83SZb+t/uQYuLvI2w8PfeJJ/wo0PH65paxojorRD0Zg4vkEvXerkxn5yRCeSIBCYD6uczNiPieZ7qAhF0Un54OF1YN7OPHtk0Jemgf02jphTtTpc6ZqUHP4Gs/YCtDs7mb9bCCxepuazdfuQUGwU1kFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747872262; c=relaxed/simple;
	bh=W4yB40FiAaCk/xqT7ZPPMrPUWM4NHo/wIGtimYl7NNE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h22kTXNiKAv3d/eDS0VanmBcmqzU1T/+Mfqrq3ZrozZL485vTl+Cl99MCLY1iKUCvxLHo5IcLXDZxKwVuPADfoiu3a11V4ctAI7b424lrpx05N10v8TyabXEYMAilLlTteykbSx/eHl7mv0SOm4WaHsVSp7OiDbdo9lmvvWYRzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WDVz6KnL; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WDVz6KnL"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e7d6bedd114so281014276.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 17:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747872259; x=1748477059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jzDtUWLQ5OctTkMEHdbiFd69EqXd1Iy9q0PXLZJRg+U=;
        b=WDVz6KnLJpbbjG/o6JqCKcp0YVF2VhxcckWRrYg2m7wAm7/MsXi/+uPOzZ+t3EHTry
         0mXPPkO7YAw9NBcBPdqCrFKXQ0cHvlmlG9crVGYpsBz0oykAEwAz0Z4tDYBvffyBZOBL
         GIDbX9VoNAV0fbg30u6cMOVhemDTAQpIlLfglXlP4rpMj9aI8kSmbUfi0wtsnWugig98
         4ZdBY1Bbrh5ZFskPzQj3aYEqGOLxqRlhEt8RP3BeC04Ma6ftZwruYVkS+Xzt3LPLRhAA
         GkgbC2LRlk//PbHcKLzYkwldA1DfezxGeqAocORXjapIMqpiv0LHvwCwC7F8GGsm1oTA
         RzPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747872259; x=1748477059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jzDtUWLQ5OctTkMEHdbiFd69EqXd1Iy9q0PXLZJRg+U=;
        b=fc3fe9TrVDnRPBECPsXlIpiCw3N0Tolr0WOE358HGQNafP6E1R0eVI/dGF3IjumTui
         8P/JZtPlk70YaKfeyEH8fJU3XwvOS9pyWjVGqynGMm2hMrMXQCeiYnBt/OK+pixkcKjo
         oNWtX02CUF0R0LjLFzFPLHeDpUk6+G6mo8QpkuX+wGBY/zqF8isNzMfc0t+/2BokmaOV
         vGf/nitSLfJW7UPHDxCWLsK649Sm5U9tQuCbwlbuw9czp8CSeZIB58riPI8CebFude8Y
         QEvt0cx5VitIIZOAZCAVZcfhYTy06SDcK/eyxBqAHCKe0OxihXnhZIE9IzWDUzk6CvFR
         Rrzg==
X-Forwarded-Encrypted: i=1; AJvYcCXSD15kNuBGFU0Ir9l7miVa8SMoFVnjpiULR1juYbCui8LvFFibCum/loi0qw3usOkOxw9PcXGxSN0ig+Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNroUqy+PvoUGZDoXyD+TZ+3bKi1OnrFmLgLumTvW9g1rfDaDO
	14kN7ekbwb2SaMTW5cv0foqoICqYGRaaewG0vtv0nioco9bMSdQkAfyx
X-Gm-Gg: ASbGncv7UrEEtN5ct5ilLllh9+ebBihnmte4X0eouUnJqZsXYZWjwe0tZIvcOq535To
	zkXqD4dJDhnXpAGuqCe3LGu1kO5zneHhykOT/zvog2vjpeuz/PpBuLZ4UWtzgDti7yhEt94BHQ4
	7IDM9bWGlxoY3wlt15pZQNTynJ06w5uuFpSDk9w7ypnWLx9YtVacxQE+R3fa+35fq+vKj2hydWx
	VLOailKJXRRWBSUsOMO01kI3gMo04uBO5Em+JZyBSGy5wQYOWbAWUxMgnLLGRwa45ARImNo5B6N
	JPuuTE9FFI+XMk2TzLsPPI3vvazSjHp5rY+WkQi2cJdesJ5gl3KbKntDCv4KkN1SzUqWBx19pvF
	/toMgV++DXGKSTA==
X-Google-Smtp-Source: AGHT+IG1gbwbkOe2NFXGXFi6HncDqQ0q8jQAUQLMNmPbAs5WYqS/ko/F3P0XQTjNFJpx0JCK3HGnYQ==
X-Received: by 2002:a05:6902:1243:b0:e7d:6cab:e78b with SMTP id 3f1490d57ef6-e7d6cabe9bamr1080052276.31.1747872259544;
        Wed, 21 May 2025 17:04:19 -0700 (PDT)
Received: from maquina-virtual-para-linux.. ([191.156.44.169])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e7d5f282b67sm663183276.39.2025.05.21.17.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 17:04:19 -0700 (PDT)
From: Donny Turizo <donnyturizo13@gmail.com>
To: gregkh@linuxfoundation.org
Cc: devel@driverdev.osuosl.org,
	linux-kernel@vger.kernel.org,
	Donny Turizo <donnyturizo13@gmail.com>
Subject: [PATCH v2] drivers/staging/rtl8723bs: Fix camelCase to snake_case style in core files
Date: Thu, 22 May 2025 00:04:12 +0000
Message-ID: <20250522000412.22210-1-donnyturizo13@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Donny Turizo <donnyturizo13@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 437934dd255e..49bcefb5e8d2 100644
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

base-commit: a481f0ebf213e0ccb85f70c07bfcd733d2dc6783
prerequisite-patch-id: 669780b7fd46182223f192ddc59e8fe8a549c490
-- 
2.43.0

