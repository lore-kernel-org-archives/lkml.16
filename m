Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D65161320
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 22:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743719859; cv=none; b=Zc4OWe1pBBKrdS6yvJHYtE1NWkpkrm2Xm18mINQPTkUMng9H1vKb0wVBwYgAQg2+iiG2HqTildkmi7AI8H5XQ2/S2blPq49oN4gqFAfMLDG8wOnE6cqutubtF7EuGi3FDC2pcqi5hwAa0zvky8enS33F+I6hSApnjxZdVkWhSJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743719859; c=relaxed/simple;
	bh=At8uSe/LEVNX/ynY+/JK1XlphOknc3w2iRCiAYOjeM0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tKckjoo20mnFyicud+3VXM0/YFyy5py/5oc5zH61s0f/ZDe+Nz3xQSEoU+sdZ/+qTQi+Mw85fMqbkcot2vojjzmuV16Ni5gI8a5pVkjicL41mQSBpBHd/yrtXJo9Yre9GLbpiywYhdHN4n53KWP8Y8AQPPGzHZA7B4+vAiuMi+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GcvDpDaQ; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GcvDpDaQ"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4768f90bf36so12849971cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 15:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743719856; x=1744324656; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iS5DlcsngnCJobVCdaTdFPwlcd069NhSqsAB1daMs48=;
        b=GcvDpDaQXqHSh3R8d3dD7J1rdkcHos6ymoehZLIDtvdUldJlRoxjJKvpCHSCH/HL/v
         OfY2nIFB7jBxQkfU/TVo8LYacCsVMvjGSlXB/jXJ9qNBPHz4DGTHYmZiAoYVHmo6IBkN
         anHW0riwXuqfLUAcStWqJBt3QPqzhPndXnNBKXEPe4To0eSxnNzRIGgJCUH5qxKSzQwn
         idZZJCCTs0I5zQKw1WZHCFeYvV/5if2faBzL9OQKjDvWmrhT2XCH6D2uCkP06EUO/xHP
         SSl+cSq+xd9cJNjRUgnt/snsSqHekChSZzAvesfMWK6xyT7tYfoeb86HDq8kfDhbU94M
         s/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743719856; x=1744324656;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iS5DlcsngnCJobVCdaTdFPwlcd069NhSqsAB1daMs48=;
        b=nZMJTr7ahVSa/kFQXhHnWpb3YEnVfOiQyuyg/NLtDT/kML3q0A4k5GXZUMev62iqu1
         UzBgMj5c7wdtC0csVo5xbUdQje7itzy4Bn+XNDiJHgnzRf8aOIpwmXjAg3vFcx5FMkoK
         oXjy5f+bdy0BTEQ/6P3CArLLp7AXcZyBElJT1ixIj7A6NQNssyJ4YQd9HMUj+4PNiRxz
         PqD4tVIS1Sfa0P46/P6BuuTcYYtn7iGeYwGRPJeVCb/iyFffmdzkaoBMPSbWNC5iYCqS
         FbFitf5xia1PCO77DcDfXjUeMxdS6hVBqe9JpV8cvurV0wN11SpCtiHAEvsh9+VFIAu/
         6tmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVflHj08CIJbPP1fR/WVTMBrFbCVlEMYnWHczQbAU46fHmLkLkUpSElqhH9ix7hHmWTL9GuacSnkjU3ml8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyifqu/wHdYBZn25JvKb0gJ2PI3qFVGqyEgAc7ShOyKf6avvxqw
	SumrljK6nFI2+gqxPHbukHPZcv9mvIsSNMIMpVh6ypUPIr+PyMHm
X-Gm-Gg: ASbGncuRCNeN/hfck8g1XrnLJHpIp6ulwfvhhzrdZjlSVEH61NortmhI5Cv8z6BxOem
	0fTWvHJauCLQqYn0vlIYHDBRDaGIs+9d/y1GgYm8tgZ++vbvjzqdV9NSpKypLAcXw8XFOOxbfQ8
	b+C58GTvKY/y1dg0dz1EzyF+QfniNnTE+t2Ah2iIJOZBrUowidPkssmzi4PCzWdMY1+UwJrhBdq
	XLF10lfQ7KK/pFPSmQ/Viny/PFBMnNytOY6C284eYEevrMOVLAwmH2iOe2TI2g+LlRMZjl9o5FP
	ZB4HdxcYPlTlqVm4cHV/Nir2nn47mrTgLki+OG5X7Pw3gfZS
X-Google-Smtp-Source: AGHT+IHOYzS/ETMdRtbIcc2MnSQWpwELYBtALOBruownenEL6MzCzPF39/WnjxszG3KCe1lFNRrCqQ==
X-Received: by 2002:a05:6214:da7:b0:6ed:14cd:d179 with SMTP id 6a1803df08f44-6f00debc935mr14074396d6.3.1743719856558;
        Thu, 03 Apr 2025 15:37:36 -0700 (PDT)
Received: from HP-650 ([105.112.123.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ef0f14e827sm12758436d6.109.2025.04.03.15.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 15:37:36 -0700 (PDT)
Date: Thu, 3 Apr 2025 23:37:24 +0100
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Julia Lawall <julia.lawall@inria.fr>, outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v3] staging: rtl8723bs: modify struct field to use standard
 bool type
Message-ID: <Z+8NpFYvxPTvjGje@HP-650>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The struct field uses the uint values 0 and 1 to represent false and
true values respectively.

Convert cases to use the bool type instead to ensure consistency
with other parts of the containing code where true or false has
been used.

reported by Coccinelle:

Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
Changes in v3:
	- Added more patch recipients
Changes in v2:
	- Improved commit message based on suggestion from Julia Lawal
	- Clarity was provided to Greg Kroah-Hartman by Dan Carpenter on why
	it is safe to make the change to the struct.

 drivers/staging/rtl8723bs/core/rtw_ap.c      | 2 +-
 drivers/staging/rtl8723bs/include/sta_info.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index ed6942e289a5..82f54f769ed1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -389,7 +389,7 @@ void update_bmc_sta(struct adapter *padapter)
 		psta->qos_option = 0;
 		psta->htpriv.ht_option = false;
 
-		psta->ieee8021x_blocked = 0;
+		psta->ieee8021x_blocked = false;
 
 		memset((void *)&psta->sta_stats, 0, sizeof(struct stainfo_stats));
 
diff --git a/drivers/staging/rtl8723bs/include/sta_info.h b/drivers/staging/rtl8723bs/include/sta_info.h
index b3535fed3de7..63343998266a 100644
--- a/drivers/staging/rtl8723bs/include/sta_info.h
+++ b/drivers/staging/rtl8723bs/include/sta_info.h
@@ -86,7 +86,7 @@ struct sta_info {
 	uint qos_option;
 	u8 hwaddr[ETH_ALEN];
 
-	uint	ieee8021x_blocked;	/* 0: allowed, 1:blocked */
+	bool ieee8021x_blocked;
 	uint	dot118021XPrivacy; /* aes, tkip... */
 	union Keytype	dot11tkiptxmickey;
 	union Keytype	dot11tkiprxmickey;
-- 
2.34.1

