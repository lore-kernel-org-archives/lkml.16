Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A361DE8BB
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 10:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751884039; cv=none; b=ZhCRit3SqGIjuCB8tEXYFfexALmJlpCKvXSFzSxLM+G5rYP98xVyjPX/A1cWdxqOZpmiHlP9RcpIrdoNG0zqxkPFrP/z857IppyJ8Xr2jGu3eiIQeuB5koUAS1elJKqtSFwxdjwyPBWXLX120RuVc3eJ2yRkQButR8y/AxWM064=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751884039; c=relaxed/simple;
	bh=xFUNUc5m5ajWoG/fAc3PfI2ibizJRteLWpJOojk196U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TDhCg8AkD1S2L+AFH9xYX707TK9I02DsS4qTWFkvddO5s82ZdXwS1LGvm0JXDwaXKnS80JUXsfiuomkZzPgoXt8vDAr1Tbmd+OHZBfRzytcUSGDlyEyQvKgF3Kr3LMAQuafulw/G/nfhEzr6Hhwvn+losldr/Utakb60TL98vOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YNZKposv; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YNZKposv"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-235ea292956so24769855ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 03:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751884036; x=1752488836; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UrCguQvMCX0qN0EKrycpjflp0FRWcgp0pAKxoev4M7U=;
        b=YNZKposvjQSErj8F+ZstHuGLurQsHkaiIGNtvQi3GI2HkLtEGEvEH0XLxc8HXLpBb1
         stx3ecuLmfejyyHVBhb8llXyxE8CCGYPkudOLGJ10/10lgSlfb2+hgttYmKH4fkk9agn
         XMKKQL3b5qAYN7w4CPqpZ2tYSSSvIqyc1iySg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751884036; x=1752488836;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UrCguQvMCX0qN0EKrycpjflp0FRWcgp0pAKxoev4M7U=;
        b=gb9YyEduoEa5rkkkAeIVdRUMCzPAeJ7h0Gxmqqpd5q7/B/Z2Clgqy0txfa2L0AI0Mx
         MNWFvU91yBx3aL8E2DhxlcbdJitTZsOTdzRqwKWcUCk7blKnnGHxHopNaejI0r1OU/vQ
         Q4xs/96G1UG2pmRU3ES1bt70sQzJPljn9J/fHRoL8TNhgi9xTmSamaQO4msXjPL/abKB
         57YXhPbKfYeM92Om3A9fj14zVcyjkaWA71xDHizKPAz0OeKlRfXpDTc8fPLo7QFzYhEd
         xLyMTy1WvTW1CVyhLY/UNSrN1A+f22xK+/buAon9LCflJzZZYBmgLPBjSOKU7Dv/qwBF
         Eypg==
X-Forwarded-Encrypted: i=1; AJvYcCU+CV7bgGE5gIGACDHQCMVM/HvJRbCYmiWLggGB2R0noYuuY7peqNF/n4FS1YAeCCJgqXZG1piYWASEkSI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVe0OuU7wEH8q1RqDX8klOghnv3qaOWfhEt2glCoAoTj5yBIMb
	8HhIugpK45uQHHIyQy/NfO4CYpqG7QTxSkc2ZrcIozZ/GWP1LtaJa+SiUk8ikdna6w6qDWcwIb8
	XADQ=
X-Gm-Gg: ASbGnct0WPwUftEhPWN6sPg/RDut8OdzTRekNnVf3cWr9/mkQTiONkm1KebDiNwUm4g
	j523Wv+mJp6nX7EJR4toxlEIbvqM1edX5xXTfbV1DZQOoAIsNnkBe1CCliqdQLX8b+Chim85V5b
	yCNHxjFe0ImlfoNju2VR1LuFO9X0WuJppyF10Zo9KMts7e4+ILmLH9TUM6X8PNp5pRoQNCH1CmI
	+fKVMSTbDUGJckuc6SbQyOdzquxIzSp9COogQLV+8JG4qvileyx8hX8cByJo13SOXD0MuGklqLB
	Z6nHCGSTDJihNr5bRe7r7zEP6eDLo7DzRhd9kFwHL+v1yUVkr3Y/M3vkXXqjoecsOC/2GyBm5i4
	rzIBqsLaFn5sEGJtCy2MXI5EJ6Ec8irk=
X-Google-Smtp-Source: AGHT+IFDfxeN+onnny+B6L+7wHiiEtPBfsMaJLUeKdhihyzBWk863pmDXzSYrNTM3um5yiBK4Jo6vQ==
X-Received: by 2002:a17:903:138a:b0:235:eb71:a386 with SMTP id d9443c01a7336-23c875e8180mr142789935ad.50.1751884036508;
        Mon, 07 Jul 2025 03:27:16 -0700 (PDT)
Received: from yuanhsinte-p620-1.tpe.corp.google.com ([2401:fa00:1:10:53d3:893:10bb:1dc3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8434f0d8sm82986895ad.82.2025.07.07.03.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 03:27:16 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Mon, 07 Jul 2025 18:27:10 +0800
Subject: [PATCH 6.6] thermal/of: Fix mask mismatch when no trips subnode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-trip-point-v1-1-8f89d158eda0@chromium.org>
X-B4-Tracking: v=1; b=H4sIAP2ga2gC/x3MPQqAMAxA4atIZiO1/gS9ijiIjZqlllREKN7d4
 vgN7yWIrMIRxiKB8i1RTp9RlwWsx+J3RnHZYI3tDBnCSyVgOMVfSI1beNjcsFILOQjKmzz/bIK
 +6mF+3w8zmkmzYQAAAA==
X-Change-ID: 20250707-trip-point-73dae9fd9c74
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.15-dev-2a633

After commit 725f31f300e3 ("thermal/of: support thermal zones w/o trips
subnode") was backported on 6.6 stable branch as commit d3304dbc2d5f
("thermal/of: support thermal zones w/o trips subnode"), thermal zones
w/o trips subnode still fail to register since `mask` argument is not
set correctly. When number of trips subnode is 0, `mask` must be 0 to
pass the check in `thermal_zone_device_register_with_trips()`.

Set `mask` to 0 when there's no trips subnode.

Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
 drivers/thermal/thermal_of.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index 0f520cf923a1e684411a3077ad283551395eec11..97aeb869abf5179dfa512dd744725121ec7fd0d9 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -514,7 +514,7 @@ static struct thermal_zone_device *thermal_of_zone_register(struct device_node *
 	of_ops->bind = thermal_of_bind;
 	of_ops->unbind = thermal_of_unbind;
 
-	mask = GENMASK_ULL((ntrips) - 1, 0);
+	mask = ntrips ? GENMASK_ULL((ntrips) - 1, 0) : 0;
 
 	tz = thermal_zone_device_register_with_trips(np->name, trips, ntrips,
 						     mask, data, of_ops, &tzp,

---
base-commit: a5df3a702b2cba82bcfb066fa9f5e4a349c33924
change-id: 20250707-trip-point-73dae9fd9c74

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>

