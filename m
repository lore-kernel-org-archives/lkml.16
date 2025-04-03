Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB951A23AA
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 22:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743719341; cv=none; b=WlsTWG3pR1eRVF4qL9yn1LjH60ph/Csc+tGaMHmMXd+WUccgcG1Xc/Js9ix0VDAHxipJujqqX2V6NbTKo9Z97mT3jzvPAKSdpBE3FsoSkJz+tzoLOSVbAQSHHL1sNfEjOB/pJfUoi83CI8nw2Xasfj10DvVQMDzAiPduMs1r9xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743719341; c=relaxed/simple;
	bh=VNOHXYzanmqg7O/00y98gBzoYRvCo/KtlZ8xLKauaR8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PO54GHu5M+pfhA3jdL46ZVN1E+KhNekxoTJ2nWq4Y0IYjnfQZ/1fFVwPzjVlyr3NI20t+xMxZ5GIpVHQU9HgiAduz3jO5pAK4FaApUNp81pp9/U1MpEOxUUm/nptAmxCdBHfRIl4QWtYiRMAJXQtqomgdHVijjxeUyQsUDTVe0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KfAIgQnU; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KfAIgQnU"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4766631a6a4so13978731cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 15:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743719338; x=1744324138; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=spI9PNT3CiPhRFNnxyIZwUOLBX1aSj6NeXw6KtRgKRA=;
        b=KfAIgQnU9y1tZSGigwSNLTT74PJRSQmOkA/BJqGxhSPwxJ5euRAyGY4tjKq35vEutC
         46CH6wOuSo3BkE/Jntm0YSpDT8z8qfQFRzA0FED2py8bD7Wq/RanR2Zu+Ln/2GoAdny8
         0zTr+dJNcpVVjR2zoZuQzrIf3O8DyDWzk/ZQ/lVOC9BBY3BUxk30ma+ncgO+kYy3/xHn
         G3nuUHU7foSnpHYD8zMzG198vDmKX/nWdr0cbyemgfLeHJ/48JxlblBvl7tj+g5c8oOM
         9TfLusjR5VT7hZdlHrihe3aFQ8CnYjFLCSAZjJWYu025LUuxMPd9r3IU3cgl6FskkCof
         oKyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743719338; x=1744324138;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=spI9PNT3CiPhRFNnxyIZwUOLBX1aSj6NeXw6KtRgKRA=;
        b=wv9cFS1eYzGdD4naG4FJ/pI0nrH730jPoFhaxywVz3lQMTZa2GEMSpf8y5x/NvMsn4
         zXdsNQ+nPUaHwDsf5cK560Eo2P6SESPUmueTsR9lh+V99MbYWnA0BEUfOFQ64PYG329l
         gd52NmqeD5Q0WLuz56vPr+xhiruJie7SB4zgd5wGZXUkQoJ85oEyzuW6Z1rwztlXi4Ua
         0FDAkwhUeIHNmX5qb8gSHzOX3zdKyR+XHcXzHW0jUzACn/K3dae14FuJR781zE9LrWRV
         pNJs6PP355aMYd0fWBFMfM/F6OND8EzKvEaeJRprg8Yze2+yoScfMpNWXUTMxCu1nBcH
         7l3g==
X-Forwarded-Encrypted: i=1; AJvYcCU3CTMmgo3NQufMtJue7CGuFV909Tq9u1+AuxifEL3oMI3RpQUJ1ujbMmirpF6dOid0IaGQBVwfD1oGxhc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtD1RzP/t76yrjFswx4hVhUG5lJgkw/8y8vMtEFJJX4XDCpsp6
	0tEEJWMM7dXhr7rlyJRQkaQw6FDKtP7ceX+SF2nBxHXwiOXNtB8M
X-Gm-Gg: ASbGnctwDapAp9DOk7/tFCCDGZohTQm2bpIehTM7O7ikHDOoVek80ubDJMj4uOzdnnH
	xDFHS5a16czDpMPO8ezwWfHCt7V44WaUDxGCmdiYFtLoQa1ohgrp5Wbre8a3h9sM+vKCBiHVsGJ
	jGXLps2EYq6FnOT7f1LF8NkLxiM4KpZMboeCTMUYs3LojIJGkI2cOYDkvi0W0R9bUHwGsK6OHrE
	/UwnwiW1mfmP6amhV5/67tPy3rRZpfZqEHqV1Mkmn5hzGR+6WGi2yIK8VY6U/FjGwgKlIv4W8c6
	EGIhXKvAyElgVeP9brCGXUeE/euJQdBAsUXCpAtXjxKVN/tP
X-Google-Smtp-Source: AGHT+IE9WgGCJ2iSics3es7U5UWvXNoEZFFhxKCgKyK/HuseosMRyE2bue6YHDURYTFx8izS281UYQ==
X-Received: by 2002:a05:622a:1102:b0:476:fde3:8a63 with SMTP id d75a77b69052e-479249d5d28mr16541771cf.33.1743719337778;
        Thu, 03 Apr 2025 15:28:57 -0700 (PDT)
Received: from HP-650 ([105.112.123.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76e96e566sm129960585a.63.2025.04.03.15.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 15:28:57 -0700 (PDT)
Date: Thu, 3 Apr 2025 23:28:42 +0100
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Julia Lawall <julia.lawall@inria.fr>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v2] staging: rtl8723bs: modify struct field to use standard
 bool type
Message-ID: <Z+8LmpgIIWlfhmSX@HP-650>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The struct sta_info field uses the uint values 0 and 1 to represent false
and true values respectively.

Convert cases to use the bool type instead to ensure consistency
with other parts of the containing code where true or false has
been used.

reported by Coccinelle.

Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
Changes since v2:
* Improved commit message based on suggestion from Julia Lawall
* Clarity was provided to Greg Kroah-Hartman by Dan Carpenter on why
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

