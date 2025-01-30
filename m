Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F592770C
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 01:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738201640; cv=none; b=Tf6U0M0h+nICvbxFaTDqSvhgaIMkcCV2ZmVQCfmxSc8onR9Da7zoommKLIW2yLdgrQdGZb0OhPxsQrJ6NuCfwy9onUxbX3M0nP7dSQ+l8uEEI+y10lFWnOnV7FjQ+wP+CXa0mXlxeF3PgAYiGWf/g1uDO0I4RIkraHKhrhM9Bqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738201640; c=relaxed/simple;
	bh=X/iSvOTB/wbKNXaxQSPONie+uYtlDEHuVl3r9XGxDM4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gvfF8w2bBJ9v4P2zTYNxYFCqIUMFbyd3fF0Ng6Car5TnwpdSxDhqaeOXRIjNwc39giOj7oe/qLGhLrbrJpEHQwZbSoPAW1mZ9kEMjWn+JSZ4b4cISZerV9nsaBXMb5k+IN7Fogv4nZTII2+Etb956HPdqKyarMqZV+rnmIxNKLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ql04vFw5; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ql04vFw5"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2166022c5caso3485355ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 17:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738201638; x=1738806438; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0AcaB2qNtUW0VMQCKzd+TYyVTdsZuz2s/p6vcBSzGMs=;
        b=ql04vFw5KJ8DIVUq3MYnazJHadcBkcwMT/Fs6ROVwMz9zy1z/yU7ZTRXwtwq65D0mq
         tBw/vUCEew9E3annNh5kHcVM/HSGswCcBPf4L8htOWvLuO0b8Ggldwztl58nN3VsikZX
         K1USXLt1biOGvh4K4aJK3jYZBh1oeJEanEd/BFQlDOR5yROyWg+dvy8cpMe9+sEwOY/p
         XldRp84AN/3yZ84JnU9D1dVtqZc4CMozToklJh8zTP0V+A6XYgmmFgogWQnscOmCsZTs
         iOPZzS/sNToYDeMPdHWGaicNg3ehexDCpcnd8krAPYa+L1UOAxmFDEJCW4Sk+PrKhBNE
         KSNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738201638; x=1738806438;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0AcaB2qNtUW0VMQCKzd+TYyVTdsZuz2s/p6vcBSzGMs=;
        b=mbV541pULFxKFyZDzDWDTxIHj+YCjR9PLcW+J7w5Zw4Oz1p/tVh7bbiyVw6m7JF/gQ
         ULKKLODL+8i6QEl4Dc1yEE21sDgRo4TTdZyg1y5rGGBpHUAD9yy1xY/azk6bwqR5AFTT
         HAC/sbEZ/vDqGZ38qfyPu2r1M68243vr0mvvggsdgh7ci7DMNpxhPO5ud/YEMrtVk5s5
         P47j0TfzczzF2wTHwLn6/1T21uJpugvsfKdp3JUKBLiBEj5iKEEgTBY8P3cvuvmsBSH0
         o3+3/9jSwoVLh76dNRw6n42XTH0sbd0IB/y30dMFMPIcPjcjoFBcy4P0tAhCGLljHKT1
         XWrg==
X-Forwarded-Encrypted: i=1; AJvYcCXlNUkmFR+fD9JugAUS6Ohgibrr73Pwe1OX7ZFAqKxyB810o674MAjEYk3P7HE9PU9OgJE0kcNBOshEx3A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMZSWLmbwchglh9QQiasSFxp6nmkshLs4EGLBfymgys+WXzksN
	7jXKU2O4Gew5Ywx/fxUbBQe45xXZU9q2POCGZi3WvH42DStgzPfmxsbAiWVznw==
X-Gm-Gg: ASbGnctbj6pPjeLPs1Cdhv4QV7hcfyODoF2834YIqidQiKflIZx4QmnvO1p65uwfimi
	5w5kp546IwS4LLvFdS4bi6wLYm7WgFX3HKxyXXg3dxHYA52RDSYQJdwoTT3ta2Svd8VnNHIch08
	+mALSaIiOStK1JqzuMonShm6tNuftyTsIRm/zLiVFky3Vhu7Ofk+qgFithM/xnyuj5DRQtsgj3o
	RL/GCn8tZm5sSKSEjQHEGtA6OY/Kt5bsWsoqjMMH3i+Nk8yMMgAW3YvowFjUjNFeZZPwOdTBAz4
	JCYJuPGhcsZQAXrnPiE412TM62JW8Aa8uwZ+xS9Mkx85ESP5D3s=
X-Google-Smtp-Source: AGHT+IEsdePDFqR2DsAE0H82TGCtsTr+UgPg6bSto8fx7D9rKq+fJhl9BWxGuZJ4NtsnWXfcyxPCPg==
X-Received: by 2002:a17:903:124a:b0:215:65f3:27f2 with SMTP id d9443c01a7336-21dd7c35654mr69208505ad.8.1738201637754;
        Wed, 29 Jan 2025 17:47:17 -0800 (PST)
Received: from google.com (28.67.125.34.bc.googleusercontent.com. [34.125.67.28])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31ee375sm2658565ad.24.2025.01.29.17.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 17:47:16 -0800 (PST)
Sender: Benson Leung <bleung@google.com>
Date: Thu, 30 Jan 2025 01:47:12 +0000
From: Benson Leung <bleung@chromium.org>
To: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	tzungbi@kernel.org
Cc: bleung@chromium.org, bleung@google.com, jthies@google.com,
	akuchynski@chromium.org, ukaszb@chromium.org, pmalani@chromium.org,
	abhishekpandit@chromium.org
Subject: [PATCH] MAINTAINERS: cros_ec_typec, cros_ec_ucsi, cros_usbpd_notify:
 Update maintainers
Message-ID: <Z5raIM_qhCF7oOB8@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Add a few new members of ChromeOS USB team for the USB Type-C related
drivers for ChromeOS: cros_ec_typec, cros_ec_ucsi, and cros_usbpd_notify.

 Łukasz Bartosik <ukaszb@chromium.org>
 Jameson Thies <jthies@google.com>
 Andrei Kuchynski <akuchynski@chromium.org>

Prashant has also moved to a different team, so by his request, remove him
from maintainers of these drivers too.

Signed-off-by: Benson Leung <bleung@chromium.org>
---
 MAINTAINERS | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 51e5f43c6354..c62d592a1910 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5481,16 +5481,19 @@ S:	Maintained
 F:	drivers/platform/chrome/cros_ec_uart.c
 
 CHROMEOS EC USB PD NOTIFY DRIVER
-M:	Prashant Malani <pmalani@chromium.org>
+M:	Łukasz Bartosik <ukaszb@chromium.org>
+M:	Andrei Kuchynski <akuchynski@chromium.org>
+M:	Jameson Thies <jthies@google.com>
 L:	chrome-platform@lists.linux.dev
 S:	Maintained
 F:	drivers/platform/chrome/cros_usbpd_notify.c
 F:	include/linux/platform_data/cros_usbpd_notify.h
 
 CHROMEOS EC USB TYPE-C DRIVER
-M:	Prashant Malani <pmalani@chromium.org>
 M:	Benson Leung <bleung@chromium.org>
 M:	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
+M:	Jameson Thies <jthies@google.com>
+M:	Andrei Kuchynski <akuchynski@chromium.org>
 L:	chrome-platform@lists.linux.dev
 S:	Maintained
 F:	drivers/platform/chrome/cros_ec_typec.*
@@ -5513,6 +5516,8 @@ F:	drivers/watchdog/cros_ec_wdt.c
 CHROMEOS UCSI DRIVER
 M:	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
 M:	Łukasz Bartosik <ukaszb@chromium.org>
+M:	Jameson Thies <jthies@google.com>
+M:	Andrei Kuchynski <akuchynski@chromium.org>
 L:	chrome-platform@lists.linux.dev
 S:	Maintained
 F:	drivers/usb/typec/ucsi/cros_ec_ucsi.c
-- 
2.48.1.262.g85cc9f2d1e-goog
