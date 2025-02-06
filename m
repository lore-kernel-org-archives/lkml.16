Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE0618B03
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 10:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738837923; cv=none; b=aUH7Z1lK0gVluqpAP1nMBhvcD8NohKE5XK6AWPKcuOPpMDdoSruiagor6BpGle2oWNaFMf5mZMndwyp1ecgxg2MQm3Dbv/VICfryw91nn3rpnsH91w2NLH4KefIjJrmGamtl/Q1j0fmfQ1GpF+hO6Rp/fgtk2yTGpbVtpdW1Y+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738837923; c=relaxed/simple;
	bh=bUGeXmWT5XSJqfUBD8u87jiMstXWrf8zNBVNAGPLRmU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DyimMDJS67iojAJWkC9+2tYDaorXOxI05aRxDXTrIE9JuGBc2xUMcYrhJ+NWVi//ghDI99g9ZtiE7At9TG/9XJrgB+RhWAlZXFO4tllBK/8S6FzzMc2NpNOH4b1IB+80JV+uBo+r/zHtb7bCXMDIkPr2KJYFW5l9Lz4ELtrIiYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KsoWnIYn; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KsoWnIYn"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2f9b91dff71so1018299a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 02:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738837921; x=1739442721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oOv2q05Wc/8r3cHmnMTiInwipXGNLksWe6Qh8TWn+5Q=;
        b=KsoWnIYnf6+wjsActtFDS4uLXK+zBsS1DFciRfk0gqoenoflcanYrxsBw/pF9S5XPB
         KVQB1yrKZq1seU87QPOKwzFo2nmswPu9tIIhqYdGR1+VSYOwE8qUZ3LJtLVofD07Se3l
         ALb79SOzK6/tSsFQHzBtmglPUVz5JKkDvreMoySJgTRGX3gBITUOCMIqdHMKNVP5mwnY
         m8cP5m6nAt/9dQkTH/g0rD2DlF68urVdIkh5W02TA47tlLerF2TxlZELit63Eby0ju0W
         6srsTL1TfiLvbI9S7lHCf4HCOyb2YbFj/bgHc/VDT48t8dx6SgPRsRWkFGYImrLEIVVQ
         GmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738837921; x=1739442721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oOv2q05Wc/8r3cHmnMTiInwipXGNLksWe6Qh8TWn+5Q=;
        b=bu4pTpz45W0OazhCGWuj1DWJwWFRXo0udQnyhwoyvRm5NHKoj1YKPDIqy1j6WwHdj6
         8Ws5oVesyFl5GpV/TOP5NDGHbSVzWXiOt8J79kvEu1k0S6QV5XLO3vi9lRGK19Ghh8N4
         S8JKCiqthhGzaSitK5nQ0ohuDUe/murkmxKqFOYvrxdcQ9xGb/0AShJmZob/WFdAYNRa
         VSCkCbzaWTj8wcvGPGnUhSrOHH9qAvP1gHedv9XEWk8rq+bIaXCZZhzmYpSouxHQ5TOG
         xGhX/XL/Ewi0HLDwxMGiiL/iCq63A9dAiewyEBRz7+pEXlrAoPWd3WtIgDXiWpjdZERr
         c6UA==
X-Forwarded-Encrypted: i=1; AJvYcCVA/AtnAA62Z0ReIAN2zJOpipRGb3xbCSvIC9o28NfdZZ9HRteEWTMTt2i0RaSDGAS4mhLkG3ywPdSbyZs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw25OjL9s1BaD946KUN8yxsGSC+fc1Wwv3S2BaAaBR40IQLkFhJ
	Lg/Y9Ghwb+/xTi3AgYOfFbDQJmLgUul/mjUvUnboI/FBidDtOCZmGCQ27g==
X-Gm-Gg: ASbGncsm8PuUTO+jtUPMP0QgtMJd3K56ce5tA2JsrJQHq1YPyNMFFCAq6/YScJkiXdy
	QuhZPU25Va7Ax9qCnJRmC6kOqqbkuCJGfA+gIRh7yVCw7Nvlv9E2cxgbVihBPzj/LwqQ7qD/5YZ
	sHHYkA+u7I2tnx8XDtYG/IA1wRsFWinzWuD4Z71HDW6ckZEBugodkM8NhJJwCrsMO2WgnFXQhmL
	IBSxQ6gJjJWt5v6AV0MAzaZJVBJnSUqMhgeBXS3mDkXfWkF/V4NNRkTOLVJ+tSSfB/aDBYPavtq
	Mx/n3WY3bG7X3cNTlOo=
X-Google-Smtp-Source: AGHT+IFZ2RiVwsZRFuasmx/shuC9Fbx8yXoXLOhOqYBu/h3MUD+eOdqS5z1t/mIinpFLRUwHbUGZtg==
X-Received: by 2002:a17:90a:6fc4:b0:2fa:15ab:4dff with SMTP id 98e67ed59e1d1-2fa15ab5041mr566133a91.31.1738837921445;
        Thu, 06 Feb 2025 02:32:01 -0800 (PST)
Received: from HOME-PC ([223.185.135.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa099f59f0sm1010247a91.5.2025.02.06.02.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 02:32:01 -0800 (PST)
From: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
To: michael.hennerich@analog.com
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	linux-kernel@vger.kernel.org,
	Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
Subject: [PATCH drivers-next] regulator: ad5398: Fix incorrect power down bit mask
Date: Thu,  6 Feb 2025 16:01:53 +0530
Message-Id: <20250206103153.59114-1-dheeraj.linuxdev@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

AD5398_SW_POWER_DOWN was defined with a bit position outside the valid
range of the device's 16-bit register. The bitwise operation with an
unsigned short would always evaluate to 0, making the power down check
ineffective.

Update AD5398_SW_POWER_DOWN to use a valid bit position within the
16-bit range of the register.

Fixes: 19d022d67d73 ("regulator: ad5398: change enable bit name to improve readibility")
Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
---
 drivers/regulator/ad5398.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/ad5398.c b/drivers/regulator/ad5398.c
index 0274f41d0233..eb2a666a45cb 100644
--- a/drivers/regulator/ad5398.c
+++ b/drivers/regulator/ad5398.c
@@ -16,7 +16,7 @@
 #include <linux/regulator/machine.h>
 #include <linux/regulator/of_regulator.h>
 
-#define AD5398_SW_POWER_DOWN	BIT(16)
+#define AD5398_SW_POWER_DOWN	BIT(15)
 
 struct ad5398_chip_info {
 	struct i2c_client *client;
-- 
2.34.1

