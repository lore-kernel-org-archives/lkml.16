Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8479E13AA27
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 05:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743571819; cv=none; b=NpfI9aRiaOqS65JE+svGWMfBFYEYtR2BvCm23jXvXcCWnA41HISNICST76X+Z/DDCPQVFzdGseZzMAi7NvfsZMtN7Huwqha6HnHuUqIyHfvhi4ifsB6Jv+9O8SjGftDnTudIx9ldawTwWRSOfED1INZ8Iel0LEc7rmeMeHpikUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743571819; c=relaxed/simple;
	bh=JwpKu/+tGG2LlLB7gE/cIZ2fMysXP9H0X8/B1275Z2k=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:Subject; b=XtRKE+qW13oViOOkv0XjekzYi6IRNrIwMcKpmBZ2glEoXqV16vc9pD7zUtQHIW1BIPipqqVGxP04txACTcSwfJOQ/axbsabY3mTY/Y0QYmlB2TlE5H7980y96wlA5+4/3sGN6zMySIHW88Bd6FME1ym3SrM5RfLoI/HulQs4qyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S0ioUDuy; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S0ioUDuy"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c58974ed57so662393685a.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 22:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743571816; x=1744176616; darn=vger.kernel.org;
        h=subject:cc:to:from:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=idNiOgMZsEH2VTfUxWSO5JKrc2BwA/5DisQk46kD/dU=;
        b=S0ioUDuyqjitEYVxKW52mQ427Mn0qEJkUkeYyZCvTkA/BIE/likiWMzsCSNr0G1EgI
         ku/aPACIAPwpQlR7krjP4RbCzLgUs9AofCwTIQeK9PbmElDc7OVyLkvp7n45r+b2GSd7
         MLkJsRQmjivjIypE6C+FJljiPdcvdc1CAvc8hRdfADmhZWKkBIhydt2w0VnaG/hfzAoJ
         cSKTPUKzh3LggPQ0WAjIz81mjjtjq/dQeLN2eEKARXepYoeQxT+b+D4PCzB1bK4wfewX
         A0dATmyi6RBUUvQfLzcbHK7LykSGjmN+KF/aJwrqK0iB8ZvT2WmfhjM9SJpNqa5AWVsJ
         WTbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743571816; x=1744176616;
        h=subject:cc:to:from:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=idNiOgMZsEH2VTfUxWSO5JKrc2BwA/5DisQk46kD/dU=;
        b=oXXCmSBfjOM3W1YWFOF5E3jDk6FP+5RQKl92tkNV/nACpU04fRvNd6S1yuiZLYG3Ss
         0dUIzKbftAYOaVngaAKbzJOzqX1fSsm7Vg47KekF/tH1b9CsmpSurydllDzFARfNVWdZ
         5fvV/x5BKfnjTQ5hJx82gxXO6dESOsmHPaChx0FMNWnD06784oDxJk42mtfrviiQryP/
         H/iLwYdMTJrFybdITzp+BJqsqYd0hCYwlL3Na11bwnc3WV6QypFEn783pb9zpdH7upDz
         iPci/DhVRdowKBUSA7OryMziU0+pJgSb9UeMDBaT91XtTvikelqYljVMuBHlNwMHmcE8
         SRSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXn2y5aeEL7KG9ayrtI5+lTuNb8z6RBCLNjbeFNA8fhrwTT939yxFyUPYv4ASGEQWwzsCGiAX1ySmsotQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFielk7HCpatNU/p26qJ9geG8oV499YRkG1pnzECqSMv/BdOd3
	yqXwjBLaA4lg6Vs+N6d+Hw0exQefDwdpU0W8kwti89m63ILzwaztbm8qH4YWs1A=
X-Gm-Gg: ASbGncuYoiFVnOC08XM4lsmnddciswZ3RXi+mPgzOu0Gy0iOtMwZ0jnfQKRIbpA7MlT
	gvsDSgflL/XVw547JjbC13AOsdHKjqBYopj5iCVni1hdzCvHnjAC6dZiBtXnBStOCPHDomWK5mj
	DZA0TZCtA88F0HeCwB0T123jgk7M6t3ISCsCdLtalaciYgM2VPx2vInvGmNYkhQb2zYDYNPer4D
	wqWZOxfeFDMTy1R7tLEVz2L3g9JdGJbcze8ARbKxUVBA+K2SCZU5yFU9Jd00le1ihny9r8rEROI
	4H2IN5AEizF4kiR9CZXFj0NT0h47cd+YtVdklUwfxktHjg==
X-Google-Smtp-Source: AGHT+IE4I0NZwNVd4uEbHMV8JQvvGeLpr9v5J/IbgjMUWDtDQ/W/PsoyRIIZ7Psng/SgNcvpsazy3Q==
X-Received: by 2002:a05:620a:2726:b0:7c5:3ca5:58f5 with SMTP id af79cd13be357-7c75ba71f5fmr767116185a.3.1743571816129;
        Tue, 01 Apr 2025 22:30:16 -0700 (PDT)
Received: from [127.0.1.1] ([73.123.232.110])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5f7764e60sm750934985a.86.2025.04.01.22.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 22:30:15 -0700 (PDT)
Message-ID: <67eccb67.050a0220.dd435.b100@mx.google.com>
Date: Tue, 01 Apr 2025 22:30:15 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============2708167609590510838=="
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: gshahrouzi@gmail.com
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com,
 eamanu@riseup.net, linux-kernel@vger.kernel.org,
 kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
 gshahrouzi@gmail.com
Subject: [PATCH] staging: rtl8723bs: Remove trailing whitespace

--===============2708167609590510838==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

>From 3ffe31ac00fdfb94ffc521d8ab0fa60196e69c7a Mon Sep 17 00:00:00 2001
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Date: Wed, 2 Apr 2025 01:22:59 -0400
Subject: [PATCH] staging: rtl8723bs: Remove trailing whitespace

Remove trailing whitespace to comply with kernel coding style.

Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
 drivers/staging/rtl8723bs/include/hal_pwr_seq.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_pwr_seq.h b/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
index b93d74a5b9a5..48bf7f66a06e 100644
--- a/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
+++ b/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
@@ -209,7 +209,7 @@
 #define RTL8723B_TRANS_END															\
 	/* format */																\
 	/* { offset, cut_msk, fab_msk|interface_msk, base|cmd, msk, value }, comments here*/								\
-	{0xFFFF, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, 0, PWR_CMD_END, 0, 0}, 
+	{0xFFFF, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, 0, PWR_CMD_END, 0, 0},
 
 
 extern struct wlan_pwr_cfg rtl8723B_power_on_flow[RTL8723B_TRANS_CARDEMU_TO_ACT_STEPS+RTL8723B_TRANS_END_STEPS];
-- 
2.43.0


--===============2708167609590510838==--
