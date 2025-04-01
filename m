Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731E420E03F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 17:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743526806; cv=none; b=nG6W5fwbs/L57NAeP4uRzuCl9zVo3KS5H6st0/AHVYLoCpKfT6TSVxsvysdUWeFH4WGLJsf7grjItrLNdY9MG7pF4UXG9cIoxNRic5UE/ihQ4EHnuwRkt4poLds5V/lNtYoiBx78JsrU/MjB1tXkEwpOmhVWjU/Wg0LVPbC/PAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743526806; c=relaxed/simple;
	bh=8Z/Q1Yqqxhozl8RrcKexRki6sw2jFiBNt//dnoasYvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mjlomF13sBT5OikQeGCnQZfB2VAKiccOYjMfrsxrjE0INCeTw8Vz4sgKMJoZT9hhoq7qoag2DbK97IPBF3zlBG7MStChyhARzc5Tf/ufAzqQkDgQhPf2oUVJO5RbixkcjANOv91GDRnbDAWZteZ4dDeFBFFw0U8Dhit3C1/UXPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L1Qkwdc+; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L1Qkwdc+"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so16966835e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 10:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743526803; x=1744131603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2gIv3lfUsZudSX+4KjXfNYnF9gzZiOWchSCAyXPUHRA=;
        b=L1Qkwdc++hhYAYYo2HVzHFF0+rZ+4jBr8I6i8pmCCxOGtxq12vKjMhkYD06dL++7bw
         WkINB0oRCR4+ovVnJiYKmNxYnTVLwt1yz03IlEcXVqacTDs5+tZayPGETwvzYhFv2ix5
         Dx+VrPllT2Eg1W+S0qOJt7DV2Dz2kYUQV9IwWm7qjuwOFmETDzg4Y5S0VeOwAvBAQECP
         /pkCa4YC4Wtujw5kwhEFcVm7lB7G7+e8uHrj/ceUJBM7c73cSsHw+6wJ2VZ6M+ZPd/Pg
         c8ePTATP6qlsZitdcnboSriwAWw9fAWLVwVOFda0gLuwhZ81rWGZ4jH1Jt0l9UOTeDz4
         9S0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743526803; x=1744131603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2gIv3lfUsZudSX+4KjXfNYnF9gzZiOWchSCAyXPUHRA=;
        b=aLQUgUdz/VgVqM5GLNyRqil4Yv5DzVnjk0Jt7+DoPRIaw4nZyWXjxw3k0++sE8SLUc
         hWzjL18FLgTKptknyp3unJoDN/y2SW7Zpg+FIOfxJO2daiFEWNmniGiGI0YzgSgPwOT5
         hZ8nJYkDUdLPCh3XEjeBCYKnQ/iEiahTRTrKqAJzcRyH+1K0zCSzs5v5gBGrwEWpkQ3c
         IQiz4SfmpjrQCM/AGJFXr6SM8pEwx68pyb7XKPoMfotkUwIqXy+LNfBzcQusE0BTygD3
         H/SSRuHfxa7+KcynjGqYGRuYDoF9690drWBLJpcfXPV+NeP3NJpHCmdmbA+t7C3O5so0
         sx0A==
X-Forwarded-Encrypted: i=1; AJvYcCXuEu51+kx1ADpAtnhGwQq9yeEgvhr3gYqu3hmI44e0weZfa1yhlusgUet9eN3KWzPK629/F1bZKNJJDMA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwe5HC879937A0tTjTZfisvycvptsduD1swa1HxxeO8zz2I6rs
	iQZi5xMdhgIQ8tVs4xn7LQ5SP2LkU2OcEeehrSi8FPXH/CWXPqMc
X-Gm-Gg: ASbGncsIStdiPtHs8nk4KzSRtCpavlK6VbPrYLhNK+Mdw84bLt9zFNJ6PMRPPm0w9oK
	S6PC07OTjjs+pdSPcz+xyonY4oIbhQ7LmJKMnTA6XWivm0ufuPewIYyT78Tl635eUOE8zKmLZlD
	InCvnPEcPd3t6W8kjlXgza5EJzcSMtSSG2lfzGSO7fDrLRlH8/x8cBAynZHA3M3tJknLDDPFfd5
	710g9bCcsYIteSiNEhZmJsF4Tw8f/ApnuqEE67FY/p5mVDHkEe6rYetsI++5HJ5CPlWBhahZ58Q
	613R3p17FWfqDJi30m8o0qPXz6gdv8Mzy7m8p4Q=
X-Google-Smtp-Source: AGHT+IFSgsTbCWtBoeDbXY6I9urDkDUv7DQvWlpcTV0hHI0IuTaiNzFmS1JTlnH4rFWfxvOkaBq/KQ==
X-Received: by 2002:a05:600c:470d:b0:43c:f470:7605 with SMTP id 5b1f17b1804b1-43db622ade6mr116598445e9.12.1743526802414;
        Tue, 01 Apr 2025 10:00:02 -0700 (PDT)
Received: from pc.. ([41.206.42.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fccfe2fsm161520215e9.22.2025.04.01.09.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 10:00:02 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] staging: rtl8723bs: add spaces between ternary and binary operators
Date: Tue,  1 Apr 2025 19:59:34 +0300
Message-ID: <a147e8cb87627fdc218bdc6df70c980df90fde29.1743524096.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743524096.git.karanja99erick@gmail.com>
References: <cover.1743524096.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spacing around binary arithmetic (`+`) and shift (`>>`) operators
to improve readability and adhere to the Linux kernel coding style.

Reported by checkpatch:

	CHECK: spaces needed around 'operator'

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_CfoTracking.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c b/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
index 928c58be6c9b..3b43f8cfd6f4 100644
--- a/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
+++ b/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
@@ -155,9 +155,9 @@ void ODM_CfoTracking(void *pDM_VOID)
 		/* 4 1.6 Big jump */
 		if (pCfoTrack->bAdjust) {
 			if (CFO_ave > CFO_TH_XTAL_LOW)
-				Adjust_Xtal = Adjust_Xtal+((CFO_ave-CFO_TH_XTAL_LOW)>>2);
+				Adjust_Xtal = Adjust_Xtal + ((CFO_ave-CFO_TH_XTAL_LOW) >> 2);
 			else if (CFO_ave < (-CFO_TH_XTAL_LOW))
-				Adjust_Xtal = Adjust_Xtal+((CFO_TH_XTAL_LOW-CFO_ave)>>2);
+				Adjust_Xtal = Adjust_Xtal + ((CFO_TH_XTAL_LOW-CFO_ave) >> 2);
 		}
 
 		/* 4 1.7 Adjust Crystal Cap. */
-- 
2.43.0

