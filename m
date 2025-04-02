Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE57E23A566
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 11:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743593546; cv=none; b=hM2YaHpd/EiCprWWS7dBMNnbUMYncIy4U1/7lIajgP2Qf/p48139f5CTfRK7GkXNTDIY0GkqAPEE7mTuV6bxupIlz2DBvq1FsFSbseCXSTzFUlTaYZ20oN9uG8hH0D+sEPbz5QuQ3F/iAvp5ZNlGqAhTiXJBkaiRlxHcRVOSoeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743593546; c=relaxed/simple;
	bh=BQLUAOp8hcz96+CVPWzJUqpppAiY0RYSuWrm0lq7OXU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IGwE0A3wq2ekn/yyt7/AYa9C1TCNMJkFlkXBO4pNwrmMcQdhQUmbziR419+Mmeu2mgSzmxqnnwBhC62ZNeO6sG3y4eooXQOsECUQSi7SNzE87TvMZxy0uXqQ4k//0p6AX7w3Yzp1cf9M6AQKmr4BnFUWnD9gX4oRCjIDcfDqvRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gFsIMfwe; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gFsIMfwe"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c54b651310so823648285a.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 04:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743593544; x=1744198344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DCEThd8C9jqT4F27805omvPg19dzW3dBb7AMvXXeLjo=;
        b=gFsIMfwe22UsO4fH0j51HRcwMtFZhsl1Y8fQ+BDduMBO/vCySQlWF4VRGUmrYb+uXa
         CaTxn+/NlM/lqiQaXEuRrN79Bm4hClps9iw6EO3lql5GfcyG74v/r79/fPi6wLzWZggw
         x9VKUWHAzjRrz+t1oaw+yRPCmRu7YTuUX3R0WmKQCfR7ktZTGkBK1oNnqK7HFZKv+SQK
         Bk+9i658bCtD/mLEnVBbD6Kh1TpFaNPfQUtTkyrm2cDeyyISnYPKIcDN2JTVegUs/OZa
         MCozlX12QbQ0RzLF24gvjsv83V5u07qqn44DBI0L5AW9mxAtRkIarDF9s+vOOVyptNWQ
         a8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743593544; x=1744198344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DCEThd8C9jqT4F27805omvPg19dzW3dBb7AMvXXeLjo=;
        b=m5rr7vcmJrQUbbDTkY1/kSuzay/L11ZQCS0lF1LCljOjDJZHVTpcaj+czFWcQnHBnC
         bpIlwVjxja8+2sE+6bNINVeNX/PumpE/uiRW0xn0DOGat+CdYjtGpQiez2GvxN6D0Nk/
         oSKXLzH+hVWqmUwhOpXwLBI4vrvoGf5aeQstFDewCkBD4BehUbeQ3YXAE3aCaQ48Fenw
         j5jenZPyPplQEN53g7LH/2Gg1c9TJ7IwDog1BnRBwJbCcAqCRxjOxyi96A9LDWu8Qr3f
         ceCKwI4kZ3fIpg6tAiUL0VVmjixFbSdBJujqx5XxwQ4QVv8sgbeYSBudwIFyJB9ZGnVb
         nrxA==
X-Forwarded-Encrypted: i=1; AJvYcCXtZOWv8GI6xaVxJ45jnYcGExJUd+4RJPOO1n0QKhxAC63dW379G06GyxvwSXGfCAgm6V6gYhmaDKnhshE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDSk+LlZuwY87auOyccsuIy4EbhdsDtxltDq4Xr0nOTLu9FQtJ
	0/anihdFpHlcPgN5FjdLpykx2HnaC1VFcDXzUx7IammEI0HUCbjo7jCJ3ROiyns=
X-Gm-Gg: ASbGncuDf84ZT1DzpWlaH2Fipq/6DXSorMA15hCikGYYf8bvXEMH5BhC68mfHELuWy4
	5eABeo8p7U8I6nEZR/zMLImBsFxKxlndjAAqHRMmWLG/E92w2axQVk3a/jGoaH2sTE/vlswgY4I
	BAm8F2n3NrmRuUazsbRtIu9RW3EezvDebOz7TeMK7eF0xUw+uR0wwH0rV1/2U6h4xJxleVhp9/I
	IId37aS3wFbvc+0E8IsqaiKotQA0E5vS+LzVoArcJltbjlE739UHGIeei6F41QOaXgK2BEiq0K1
	q59LNqtUgHmyXE6Od9ox5zspR1e3r+lJbx1+causW1J0CRoG9s58vI3ooEg=
X-Google-Smtp-Source: AGHT+IHXQUOQ4MUkeVIP8CSDJIrsR3b+i6sounU51uvTk7vk1bAa+2aCEmd5MUwLwXE94lWa1jKKDg==
X-Received: by 2002:a05:620a:2a0b:b0:7c5:43c2:a907 with SMTP id af79cd13be357-7c69072edbcmr2178988285a.26.1743593543771;
        Wed, 02 Apr 2025 04:32:23 -0700 (PDT)
Received: from theriatric.mshome.net ([73.123.232.110])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5f777dea3sm779839985a.102.2025.04.02.04.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 04:32:23 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: linux-staging@lists.linux.dev
Cc: philipp.g.hortmann@gmail.com,
	eamanu@riseup.net,
	linux-kernel@vger.kernel.org,
	kernelmentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	Gabriel Shahrouzi <gshahrouzi@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Remove trailing whitespace
Date: Wed,  2 Apr 2025 07:31:58 -0400
Message-ID: <20250402113158.45760-1-gshahrouzi@gmail.com>
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

