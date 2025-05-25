Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12BA1CD1F
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 06:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748155475; cv=none; b=QcbUsHeg4OByqNxSLBr9QZKpMHzuUzWTRoKSEZBkv/jqvAcZDxKbHHYZcnv8i00noLqiTtKGDXNmBmyiEg2Cce+btzDS3ccpQsaYUuHZv6C436NF4B8notGPEaaIV4mgf19QYjmsFi754Fj/FXPNuKq3SRWjim5DBpYSt5JhYxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748155475; c=relaxed/simple;
	bh=Dd1q7WRp33ehmP8qO24QWF92ZWz2jd1JUhpcvFdYDjE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dVl21yIsenUyqPt4ydou2jdunb9O3Zgb8Wu8W169hk/a4qQVB+a9MwYF/xMKMHtLyNn5+7IkalNVzyXyewqykmeRQ/tLKwqXsfz0754MnulPN0pl89aA4lHd6MpIX0Ho6nX4WLaMMPs9I2ngEanfalaFZln9DAu+vhZPmmyQdrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KetFxG/n; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KetFxG/n"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-70ccf9a4ab3so9963077b3.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 23:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748155472; x=1748760272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZTzscTj+YcQ1SwnnplFh8eTlzFm7X3URXr/8FG1Ysm8=;
        b=KetFxG/njFbiOKWRXjDW6299QgaiAMw3kATA3muKf8b3ZbJ6DZZlSiyNedr6UDuXv7
         7aF89KcyPiOrXpzVmmqUDPbnRQlRyZnIjdG30YFlVra6HsOUP15C4woxHqWPEp16yPic
         EltfqYXtkvuK8N2Y5EE7yEtmuPrGsKSOVF9/Vum0buLEntHNAKLyZKB8xOZ/92xN81Pp
         1N6rwkvACT2cxPzwBTmx/kzuIllYyV/TQx1VAFYAebDxc4YF04QxJQxMk96uOynOFCKJ
         0HrU8MS21xtnTyuAjfwwbnIC0NWhnBUu6bQqb/CFpio7ncWvIUh4P60Y9/S4Op3erWRS
         5+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748155472; x=1748760272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZTzscTj+YcQ1SwnnplFh8eTlzFm7X3URXr/8FG1Ysm8=;
        b=SwUnkmrMGcATMz/mQjb01mo6NTim3NmeUS4DEsORuw8rq9RFIle+RyL58eIA2pLLK5
         +W160YKPORA5dZMoDP6yBfLdjtZNx30k/RIwaFUf9j0rRevwscGTKvM6CaR/jvahfgat
         Tp9hYkWXDb7fS6D6y8eb0dQV3gSB9XbUTSuh4F7xzZx66KB1j1FmBcBf1COsUM6aB/67
         Ixe1In3QA4YMy+W4b4xORVrPDbP7IWnlL08lGfwDQvh7plk+fjF8BfnAUsPf5MdI+9b2
         Ud2EbSinbgLWS2PuyOglVm73SxbnnY76TRu/DJnvhXdZjBC1gqTovw9R272wgIufTBW0
         ClHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvWPEgM6jMKYMxM+CkNMUVGSBd0W1y3/APISBYBNOshldLFV/2K/bix/brNqpU2/xOE3MuDKtfCjaRV9c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5v1gkkAEAOn+hyTj9r9v1/hZdD70X7YodF6QzmBc0s9j6cSOM
	v64CZAgHn0mshwT8hRh0mp5KpbSbPTECaSGjZ8H8SlD+oOemFwXxUxM8vQb3NQ==
X-Gm-Gg: ASbGncs3ECbVSpQTMVHKyJwoCHKVL1V9KjEqIeJJcQhV4ycFoI4rjVQrMHtm53F7RSF
	aI6qz7JbyqigKDKSm00bRs7v+Y1chEKfhjZsNicEoUfXKK/cSaq0QGEs2bgxOoGBsrqQEwONOzt
	zzoqB2RGkQWAHblbw5LKa4tjRjHfoHAO9MbZ12lSMO3ioyqs/Ou3/yRe7Nu6y6puK9PwMcENrOV
	ZAAfv/LRGpZW00V9DtMpc/Yb1ujvGzVIPucQYvWiEnuP6Pz08MZ/rWr05XBXUKRimXmYzMfI+wD
	YtbDK1JMfKc5sUp4tol6tHpbsPWOPjMxiEn20Xhb94klSPAjdX7DLccc0Ow8FnL297HJ2su77oJ
	0eIc=
X-Google-Smtp-Source: AGHT+IG80Kj8pAlqxh//VhzPivSEgHHMLwge+CNbDXCkpO8hiEvMp/AhC8cTEnZXB1F2CHEOOEcfXQ==
X-Received: by 2002:a05:690c:4d8a:b0:70d:fe74:17ff with SMTP id 00721157ae682-70e2dabc1c4mr45381827b3.26.1748155472300;
        Sat, 24 May 2025 23:44:32 -0700 (PDT)
Received: from maquina-virtual-para-linux.. ([191.156.247.35])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70e23250267sm8666637b3.65.2025.05.24.23.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 23:44:31 -0700 (PDT)
From: Donny Turizo <donnyturizo13@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Donny Turizo <donnyturizo13@gmail.com>
Subject: [PATCH v4] staging: rtl8723bs: Fix camelCase to snake_case style in core files
Date: Sun, 25 May 2025 06:44:25 +0000
Message-ID: <20250525064426.9662-1-donnyturizo13@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch renames functions _Read_Macreg and _Write_Macreg to
_read_macreg and _write_macreg respectively, aligning them with the
Linux kernel naming convention of using snake_case for identifiers.

These Changes improve code readability and maintain consistency with
the kernel coding style, particulary in the rtl8723bs staging driver.

No functional changes introduced.

Signed-off-by: Donny Turizo <donnyturizo13@gmail.com>

---
v2: Corrected the base branch used for the patch.

v3: Rebased onto a branch not maintained by Greg Kroah-Hartmant.
Also updated the commit message body, changed the "From" field to my
real name, and updated the Signed-off-by line accordingly.

v4: Rebased properly onto Greg Kroah-Hartman staging tree to ensure
correct upstream submission.

In v2, the patch was rebased onto the correct tree, but in v3 it was
rebased onto a branch not maintained by Greg Kroah-Hartman by mistake
This version fixes that by ensuring the patch is based properly on
GREGKH staging tree, required for upstream acceptance.
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
-- 
2.43.0

