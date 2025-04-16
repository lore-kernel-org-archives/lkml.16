Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B6324CEEB
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 20:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744836146; cv=none; b=e7gYBMxg+wNsiHQ37Tr6l6X5X9hvmOilCKiND/1htvbrNwxzQGEpJYgrSPfvJkWtr+i1x/AoqYNPsnjqEd+pQw+L8aH8CP7P14WZnSjrzHHch2EMyYPM85kez4h4qdpKjzudeGGCdkbgyey0rh0VwFF9WNGnBzJ0vWWOWxbWoDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744836146; c=relaxed/simple;
	bh=7nOnj/t3IWRKRJuUCHCZoJzmMsnxpf6ffPgcSoWr688=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RiPsWWoAwTYdhTPsk8Y979H2kKVzTPHLvp4hZ6HdaPeigsaQYJkzuaEKYvb6YKxRDHqqt0MnE8K1KcIA0fDb+HmQ0I8mMww2mRnl8Jl1iTC98jQNtrtb+HfLTAPUydyeWGOKfu6WpoecJMuPj0J9xiGf0nbeSoqgMr3hqmFkxVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=BXCmwlF3; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="BXCmwlF3"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-306b78ae2d1so11280a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744836144; x=1745440944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=akTpKyJqwtY/MzR6JYTv6U/YQl7Z23JU2ZL/gi1Jfw0=;
        b=BXCmwlF3ghiq/vq97YA02lboCNCKxXsjjaYSOdVMtK8WPb8xVxT+Yk2ejGvS6y2Od+
         XLRlR6fzM3yIbcfjAdmjVVYddmafyJWXhQDe27Ixc6NzzKMrRRxjVdcTNW9yD6KJq1EZ
         M/VuhouNim4d5XywC+QeWzWIViHSoJKrfCf+v0qDqJNxt/JpTiraHT4RFfQXSsGOe6vZ
         X8hYsWndn9jb159VjWnoJ7hghEVRhlVMzJecrIqxFLDPJ18tb8nL4UiL75OcFe7z+5pE
         eMVnkvgFZnInWQWaZwTUIxfUVWucek7OaphIAb628H/VQkvWFSoufLo05O4KWvGIrhET
         i1xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744836144; x=1745440944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=akTpKyJqwtY/MzR6JYTv6U/YQl7Z23JU2ZL/gi1Jfw0=;
        b=pIOtCJ7Liq7H0jIaYMHTiIj9R1Gdsfo0/fSU1mhpcE4Ppfxrzu+MKkWbGpryj6eTb4
         1eBk6iYhiMc5FDsITXHWgvGWEuKlAiolP/xQZdvlQxiXmrnWQW4NCFz7mwe4+a3L3WB8
         /BO4m7NJKsI/R15o3L+e1c4hcCCcGrYq2OGsTE4rF0SEfXKlYc2IYktJ63PmQiK/aiwa
         PIZlrQ+TgZLgqQ4xEa6JMD6J4j3rde+7F+6sDPkll8A6WoR/yfbPPvY5N0QsSQQoD6fP
         5IYMBg5K6g+eHoSkUd4kdM0+OOGYqzGC5wWbH7tMrOIe/m6cuG6SMEqdNHaLzjusmW48
         rDBg==
X-Forwarded-Encrypted: i=1; AJvYcCXoloSPoYx2Ma7GfpeNrv/bnS/FmxPO2C0YbfjabS5AZJypzo10WkZTHXY+I+LYXJR4NWm0062OWoN50l8=@vger.kernel.org
X-Gm-Message-State: AOJu0YziUaqHisopk/Sj/Q0/nPtUk7o+gM+UJMGFf5kS0XThwvE3wphl
	/djHBd+9olPvdBXofT7ovvU6I/F0OTPle2GB2+c2dp5yEfwFfe9SCBYNbd4PMQ==
X-Gm-Gg: ASbGncuPY8egQjekG4KYClSyWAgVulj+AZc/yfvTL/yfwPeiQnWWpgBVEnzvioPQtXX
	u65TsiWJHGD3JGkQ1uBkHUUr9Sj5ZwZjQHTkDxMD2/yHcmMTE0bmEtlE6Xnw1Wqanqu3aN97TaE
	C8iP8HIy2hcCwDmCHrRG57PpkO9npBc7pWm/pIa2ryjLtzBOZTh2tgSR1KiR4Hk3MWLG+uxPs2B
	LVG9vBywsona3wh21rgKGxeE33XyGxnirZDx3LB7hiVcsXkAn6RA367htOTb3Amblq0YjS81wm5
	57BEWUP/5YAFcEi8jgjC8VM7HKOxlwvWixHBmZYg0EOR+zkNehx9X+7L2CST8fJ9W5qNMDo5rFv
	XmBbnDg==
X-Google-Smtp-Source: AGHT+IEahXeFFjWp0p2qul0O2oupUGo/5kKivWmtqB61asyg9Eiq7M16/a86vLVksRu/6PZ7myUDpg==
X-Received: by 2002:a17:90b:2b50:b0:301:1bce:c26f with SMTP id 98e67ed59e1d1-30863d1de1cmr4820746a91.3.1744836144196;
        Wed, 16 Apr 2025 13:42:24 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-308545a257esm2151852a91.2.2025.04.16.13.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:42:23 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 14/18] staging: gpib: lpvo_usb: struct gpib_interface
Date: Wed, 16 Apr 2025 20:42:00 +0000
Message-ID: <20250416204204.8009-15-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416204204.8009-1-matchstick@neverthere.org>
References: <20250416204204.8009-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index 47f56fea28a6..494cfa21b938 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -1055,7 +1055,7 @@ static int usb_gpib_t1_delay(struct gpib_board *board, unsigned int nano_sec)
  *   ***  module dispatch table and init/exit functions	 ***
  */
 
-static gpib_interface_t usb_gpib_interface = {
+static struct gpib_interface usb_gpib_interface = {
 	.name = NAME,
 	.attach = usb_gpib_attach,
 	.detach = usb_gpib_detach,
-- 
2.43.0

