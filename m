Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8E8288CB9
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 18:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748976243; cv=none; b=mB0plkkNYVURKhNQ3Be9AkTkNWO+ByoBTsFHkKvQutZhrl7fXFpzopFtonjWPU9iGbm1YuMQokVjY9ewFO+1aeM5Te5fmg11I8BgE3AJVso8gX6zv+mHsnYDWLswfEnRMzdJFhuThlqED9tR9kB4uFrP172mqTd9FuDLaTJ85ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748976243; c=relaxed/simple;
	bh=BTKy6rwniCmZTgA6Z39+urHx80l/dpJ0s7iL3/6zO80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JlSu/pymLlBG2VWQfTo8XtoSl8xYoUSKyJpEnpl9ycATVfqQNRuFAdqwz4VdKTuVwMG7I1b4DaYUqCk6dc3cQLG5no9Amg2kKxn8Uvyqq/o2SzdBsyFUd8+ZO42eZkLz0jOttcSKCXpF+LZ/BEPI1hUIRFhZqJcdfLrhER56bkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q1Y0oH/7; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q1Y0oH/7"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-442fda876a6so53518715e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 11:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748976239; x=1749581039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59qNnoC0PZCUiRqcfCTJ4/Iv3mXqvFEjwoviJeNS6GU=;
        b=Q1Y0oH/7oCz6QKclxJ4tCzkRboCDNsQ2ebzUg2SkkPXyrNq8v1gAbHFj6ydQpwceQD
         iPmdzM30lPfMdbVv+/qb94PqK1D3ly9r5Z+ZFsV9KiDZ0QwtgwRpKSv2Z/eu+T5ZMT37
         K0Lpkbk14Tr9aCBXpjxvq4X/gncgfLjXSeWvlBXRSmu/t8d9mAM1Cobw2FY8l4dvSved
         hEpQHun/kuomppTH0tl63TWmuciMx6dew0XYImINHCfK2IpoyOcbXWEuetmQVwpZcbnH
         KYyJXKohkeQNOYOMHuWW2m2RQBreHVBBYfOq8JPFJ7++aIMYbFHXM1KvGtdrm7O7bEl2
         Sipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748976239; x=1749581039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=59qNnoC0PZCUiRqcfCTJ4/Iv3mXqvFEjwoviJeNS6GU=;
        b=iC5DRyfmMJsGCcHS1F2DsbVsxaBVxafS4zXMtGyVnX/oZIWi5x0NmZah4WEjatQPt4
         GpAoQvT3JwXiJjKbfAcywQ8FAELklL5UKTtd4JcBlUYUXalHSf8F4QirypaxT2cr6s53
         L0DMUHkAt6X+yIB0fVVN1t2mXHEFI30Zs5N538yGY0sln1oOSv354+AvjFzdlM1XVbiG
         ja2asdvW5LjGpxDZJt6Jp7BAiCWVqb8sBe4I0yT+ib+muIr7q0bUlFDk+HWgBYwFGidX
         gETexancStVSIF6OFRYONerj1wh3e2NbqQGhzCSHdlw5EnVEcgdOSjV2jBaNY/cVzT20
         XSgw==
X-Forwarded-Encrypted: i=1; AJvYcCWVhd9OBfsyzrkI2q1IHm5ryMpzvDv/C2pVL4ovOrXGeBjDnHG6uZxH159EHT79kk/BaTvIDNhDXlXmcx0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3OIngpmRpvKQakAYR5ckD9NmEXe8F9dtPQ7UKATOHJjZeRWzf
	TBDl+bCMpIEFS9xjInuM0Sic/EprfT7LQHAWfzumY7mgtqWAvTvxvyvW
X-Gm-Gg: ASbGncvnbN806DgCvyH65XoLJvxQn8/DdG9WDimmYSbSDtFZKUUBhwqKh3saNrYKyYM
	DF1Hk2cCH2nnJu4wmul7X3e3XTviId6JFRRSbkbSFLixDQ3fviowZaxMmGRMO48Sjg+RNKhApUb
	igezy6tmAcg/CBsKjqGHT8ORPTb0+T+pwNXRzeOj3/MsSCl3gmV46JIlYQJ9zlGGk2nNXo9PbBn
	H5M46ypC4hvMtgrxly2CT8yJwc71g9aF0n04XDDpmot8aPzDkCAoam3IQp8tB26Ey8X+TPMuDyf
	Bv28egZPLcXFOPArlnQxb568kCW2pZCiDXNHSnErNFPE57t04lHnBRc25NiqZyEO3y81oBcVJS/
	1i2gnDCUXr1c=
X-Google-Smtp-Source: AGHT+IFnATrJDqDfVpdsS2vtesr8sPjEo8vJu41t/gzywoAWihVtY+HSNGfLyfB4D8RIIV9M5t1LWg==
X-Received: by 2002:a7b:c048:0:b0:450:c9e3:995c with SMTP id 5b1f17b1804b1-451e2173e0emr42217685e9.12.1748976239019;
        Tue, 03 Jun 2025 11:43:59 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe73f83sm18449959f8f.49.2025.06.03.11.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 11:43:58 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 2/4] staging: gpib: Add local include file for commands
Date: Tue,  3 Jun 2025 20:43:18 +0200
Message-ID: <20250603184320.30594-3-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250603184320.30594-1-dpenkler@gmail.com>
References: <20250603184320.30594-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the functions and enums needed only by the kernel drivers
that were removed from the uapi/gpib.h include file to a separate
local include file.

Include this new file in the gpibP.h local include file.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/include/gpibP.h    |   1 +
 drivers/staging/gpib/include/gpib_cmd.h | 112 ++++++++++++++++++++++++
 2 files changed, 113 insertions(+)
 create mode 100644 drivers/staging/gpib/include/gpib_cmd.h

diff --git a/drivers/staging/gpib/include/gpibP.h b/drivers/staging/gpib/include/gpibP.h
index 0af72934ce24..1b27f37e0ba0 100644
--- a/drivers/staging/gpib/include/gpibP.h
+++ b/drivers/staging/gpib/include/gpibP.h
@@ -11,6 +11,7 @@
 
 #include "gpib_types.h"
 #include "gpib_proto.h"
+#include "gpib_cmd.h"
 #include "gpib.h"
 #include "gpib_ioctl.h"
 
diff --git a/drivers/staging/gpib/include/gpib_cmd.h b/drivers/staging/gpib/include/gpib_cmd.h
new file mode 100644
index 000000000000..9e96a3bfa22d
--- /dev/null
+++ b/drivers/staging/gpib/include/gpib_cmd.h
@@ -0,0 +1,112 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _GPIB_CMD_H
+#define _GPIB_CMD_H
+
+#include <linux/types.h>
+
+/* Command byte definitions tests and functions */
+
+/* mask of bits that actually matter in a command byte */
+enum {
+	gpib_command_mask = 0x7f,
+};
+
+/* Possible GPIB command messages */
+
+enum cmd_byte {
+	GTL = 0x1,	/* go to local			*/
+	SDC = 0x4,	/* selected device clear	*/
+	PP_CONFIG = 0x5,
+	GET = 0x8,	/* group execute trigger	*/
+	TCT = 0x9,	/* take control			*/
+	LLO = 0x11,	/* local lockout		*/
+	DCL = 0x14,	/* device clear			*/
+	PPU = 0x15,	/* parallel poll unconfigure	*/
+	SPE = 0x18,	/* serial poll enable		*/
+	SPD = 0x19,	/* serial poll disable		*/
+	CFE = 0x1f,     /* configure enable */
+	LAD = 0x20,	/* value to be 'ored' in to obtain listen address */
+	UNL = 0x3F,	/* unlisten			*/
+	TAD = 0x40,	/* value to be 'ored' in to obtain talk address	  */
+	UNT = 0x5F,	/* untalk			*/
+	SAD = 0x60,	/* my secondary address (base) */
+	PPE = 0x60,	/* parallel poll enable (base)	*/
+	PPD = 0x70	/* parallel poll disable	*/
+};
+
+/* confine address to range 0 to 30. */
+static inline unsigned int gpib_address_restrict(u32 addr)
+{
+	addr &= 0x1f;
+	if (addr == 0x1f)
+		addr = 0;
+	return addr;
+}
+
+static inline u8 MLA(u32 addr)
+{
+	return gpib_address_restrict(addr) | LAD;
+}
+
+static inline u8 MTA(u32 addr)
+{
+	return gpib_address_restrict(addr) | TAD;
+}
+
+static inline u8 MSA(u32 addr)
+{
+	return (addr & 0x1f) | SAD;
+}
+
+static inline s32 gpib_address_equal(u32 pad1, s32 sad1, u32 pad2, s32 sad2)
+{
+	if (pad1 == pad2) {
+		if (sad1 == sad2)
+			return 1;
+		if (sad1 < 0 && sad2 < 0)
+			return 1;
+	}
+
+	return 0;
+}
+
+static inline s32 is_PPE(u8 command)
+{
+	return (command & 0x70) == 0x60;
+}
+
+static inline s32 is_PPD(u8 command)
+{
+	return (command & 0x70) == 0x70;
+}
+
+static inline s32 in_addressed_command_group(u8 command)
+{
+	return (command & 0x70) == 0x0;
+}
+
+static inline s32 in_universal_command_group(u8 command)
+{
+	return (command & 0x70) == 0x10;
+}
+
+static inline s32 in_listen_address_group(u8 command)
+{
+	return (command & 0x60) == 0x20;
+}
+
+static inline s32 in_talk_address_group(u8 command)
+{
+	return (command & 0x60) == 0x40;
+}
+
+static inline s32 in_primary_command_group(u8 command)
+{
+	return in_addressed_command_group(command) ||
+		in_universal_command_group(command) ||
+		in_listen_address_group(command) ||
+		in_talk_address_group(command);
+}
+
+#endif /* _GPIB_CMD_H */
-- 
2.49.0

