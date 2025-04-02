Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECECF1E89C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 12:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743597740; cv=none; b=CafGo6ZhpmRme6Xr3RcOFkDH9WOvu6N1Q0IGriWx2Ymg4quT1SF0H4NYX6mpKwyJ00faoe/TS3IMpRx2tsXc79vB3ZAVG67KudjL+HRiDzkSo6GP3xncFLKyXSZEVKQ43jbCXlO/lONk2CjpAJkAPsGxJf1pqdtA7NIj1zBsDA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743597740; c=relaxed/simple;
	bh=R4OCPC5GIW5rDlf8DLopCRzwBaWhDmTzxMbuMc6KxPs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DFEYT+g3JL6nScRY8nMEo+aIJK072KHiMAtUY5FRMBBYdJgiaLMXtQ90iA3KZIoYfKUHmj1AtggrsyMHYnH8ujXWKzQwpCfATVxz5vbbfjFHc7lulQ+G2hwI9UaG+H2UqO5YOEIPOkwSD9Y6p8OxrRgEn3Bf57262b4IqDS+pjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g9akKPf4; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g9akKPf4"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c56321b22cso76528985a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 05:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743597738; x=1744202538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gMesyxSaPdR5MylDGUVskOG3tbpdc/ALanBjO7+rOAQ=;
        b=g9akKPf4AMzPQdRiBC4bE3kdrhGNkri+WRav7s4zO/AKe6IEisT6GGXNmtTcGHQoYK
         xtJwbRGOZJESe2ZhH75uB5plWNiaQSxZ6KW6xS5Nlm2Qqplpx2lb4ztmS87DWm65pjVE
         ap8cTsRr/1Zc0Zb9ayefGcuEwGGJxMZuhWt3hGCixD21ezHcLcgVCkXT9n52QJeJAj6E
         paPntwn0aNokaWhlsHvzZFT6rZ3JH3KyiL08W/ahwOLtA906QrLN3n/3ki3i9t6bNv+S
         Jvh4uYCoOOPo5VAHXu1cCgUlRbEj+bASBWb8+TBmm9jKDKaGgj+CnELOvqu2H9+ln68D
         d/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743597738; x=1744202538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gMesyxSaPdR5MylDGUVskOG3tbpdc/ALanBjO7+rOAQ=;
        b=aAM9P5WT2Qd8+5rBekXxRFOpX1JX2IBQZHN1FsX3oTj42jqpsGxjGMAf2Fc5S68+Nu
         r2J+ZtWMQp6E8qa3kdeUHsURrwQYQlRT+xyCAkkB7UjWB09VbAbrw+/4CnhS9yVzkXew
         aCh0Izl68xYlhBNwLX3SNyJ+JfHjQkOY7wQhXNIITNIeZTOMltulGYa4R9i2gW4CGxXt
         8noQ2AvC+mze3+lfDr+VfjHTJHGp4CqOFqh+/nRiHT90aW1hrMZK94Kg+PEBHlHWM1cI
         chO0vcGpmJChd0kmJzw6GjENl1jvuRKqu8aTNDehaN7Q+vNcaiPIig8O7/N0EVLh3Qq1
         jAOA==
X-Forwarded-Encrypted: i=1; AJvYcCXLQ7igIbslvHmXmSLP1bWQmliaR9vJRvZxlM+E7aXsbNKykQoj3qMQs+tWxHBDlijQORu2/XZhd0Qzul4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHU3PbCMLy3flzo8Nhuy7aGsjl4DE7p2C7BpYEZcbPmGg96V2w
	CO2FD3reN1nPpRXEYvwjKEkP/nk/memlhRz9Pm91tmvfnPkHhHHK
X-Gm-Gg: ASbGncv3kVa1j5qTH/vdtmVrsW1qj+BTY1kysvQFg78L3JRzDfXudtk3/7tPGCGPBL7
	tJz1GDnno2ub8vU4UoQhk8YSLLORi3fUjqkLnkE3PRnmdHNaqa4GEBvUDOfTnWwItNCf0c9sNqD
	sbkkZlO4jd4+MgvCQs6vB+qu9Hd/iw+xTM0X9Tx15+zEZo//dV921YhJcrQw/drmP/dzo77/MFR
	PpIURbuymPJbPVO1xSbd95isCR9m3KDR/15FnLjDCZCAjM5Hu+hDPY3NbbzLW/oPRKTJrxNu4SD
	ljJAoMDMxsFAxPpiDJiggE+UW4XzEXB1Dv6auvdASyJNNPDYZKZuKaoNhvIr+Gc4dGj3o4+DtAC
	ORdrhOAcraSEUaDGdXJJlsG4=
X-Google-Smtp-Source: AGHT+IEvCJhIE1lGLlolmFROkAGgo6HK15aytIN0zxVdJcGxXPm3q4rCkbA7uRuwdJucvIaKAu4A3g==
X-Received: by 2002:a05:620a:17ab:b0:7c0:b350:820 with SMTP id af79cd13be357-7c76820f723mr236313785a.5.1743597737702;
        Wed, 02 Apr 2025 05:42:17 -0700 (PDT)
Received: from theriatric.mshome.net (c-73-123-232-110.hsd1.ma.comcast.net. [73.123.232.110])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5f7764fefsm781128685a.85.2025.04.02.05.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 05:42:17 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: linux-staging@lists.linux.dev
Cc: philipp.g.hortmann@gmail.com,
	eamanu@riseup.net,
	linux-kernel@vger.kernel.org,
	kernelmentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	gregkh@linuxfoundation.org,
	Gabriel Shahrouzi <gshahrouzi@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: Remove trailing whitespace
Date: Wed,  2 Apr 2025 08:42:07 -0400
Message-ID: <20250402124207.5024-1-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove trailing whitespace to comply with kernel coding style.

Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
Changes in v2:
	- Resend using git send-email to fix formatting issues in email body.
---
 drivers/staging/rtl8723bs/include/hal_pwr_seq.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git drivers/staging/rtl8723bs/include/hal_pwr_seq.h drivers/staging/rtl8723bs/include/hal_pwr_seq.h
index b93d74a5b9a5..48bf7f66a06e 100644
--- drivers/staging/rtl8723bs/include/hal_pwr_seq.h
+++ drivers/staging/rtl8723bs/include/hal_pwr_seq.h
@@ -209,7 +209,7 @@
 #define RTL8723B_TRANS_END															\
 	/* format */																\
 	/* { offset, cut_msk, fab_msk|interface_msk, base|cmd, msk, value }, comments here*/								\
-	{0xFFFF, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, 0, PWR_CMD_END, 0, 0}, 
+	{0xFFFF, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, 0, PWR_CMD_END, 0, 0},
 
 
 extern struct wlan_pwr_cfg rtl8723B_power_on_flow[RTL8723B_TRANS_CARDEMU_TO_ACT_STEPS+RTL8723B_TRANS_END_STEPS];
-- 
2.43.0

