Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9A017A304
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744808875; cv=none; b=fS+lUkvGTWBZzea70OxzBdDHGw01LKCNxtZ0tL7JMKQzxAePNZqk4bSEkC9FWeb7xKjrLGIM0Hd5ijEnlOjULMdgSd49b7SPcr3YyG+vD3Mm9uIcaHxoleEVwbaBuOaev1/t9+4x9iyp5bE7A94U88lemeTZPWnpc7PcLn7NTkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744808875; c=relaxed/simple;
	bh=T4h0Qre/mIOSlMXo3Yr8NeEL2pNQs3X77eQfmfVCN30=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qwsF63d/qDew0LA3/Tq1TBtj7wEo3XH3SXYv8u5PxYXTrMhcuOwDBttHLa69OvirESUtrYVoCgW1IY61WmoaCiTnrHfFoV0GyFinOZyKPaC+16FWsgaQheSdUV0qEZOCr7oNvmOO5vytxEN1pZRXpwvTWSYCPmiECJDGRG3eRT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QzHWBBeA; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QzHWBBeA"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so55566575e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 06:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744808871; x=1745413671; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nVi2C6WXa2d1wRatlCAKYxbFJ2sUwQ9evBa+lyOMzw0=;
        b=QzHWBBeAMJSdyeZgq8vooRUxwVxYbPLW4up1qv3mVVRGfr9Kd+PPOPBlt7yHwHE+2y
         n/tvv3sk//C2FUy008YbAQbBhlBSX1VQMcgDUGkj5elpNDdzQuWimoNkDLSpB/6VjwQT
         qazxCzLDQW8wm85mg24vxjaOMk3vtA0/2Bkj6TFnb+lgXZk7fmMfRwnNpqhez45eAHdx
         t+6K9VQT9FiKBSmNf4TG0MWBFhB0pG1QmI/JyNwtgsHLNuk9XBuaaz2h83rU6JgPprdt
         aVUgR9AFIdJObRaZpeHu5hVl/NK07ZcZ0pbeca3gViWO8W4GrsH5qNikxztDQc7zbcZl
         HhnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744808871; x=1745413671;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nVi2C6WXa2d1wRatlCAKYxbFJ2sUwQ9evBa+lyOMzw0=;
        b=YxT3YZS29qEQQxiYP7kOBLYT614NxiZWrSwY4HwIiThwCOVbxKUSdm03/dUIf323hc
         MXB0Kz0MJBwBVYMDVv3YEGO8Leto/B0vePhcSYfGzEau3y0SdeeOeYBAmZw72GcTKgHO
         gw8KiElyxAiqe+lAtPXaDtQLrTnOervO+hmf3URf2TumqkMOcmkm0qFj5uEfOX0hM3xI
         92FOYv+IBIFEDXCCCewHxvuZXNxw8vyIKPidu2p88oyGyviWiUBejmoalYD25lJ+6u6T
         jW96/jHfbf2JBpLddc5FjDBE44Dsvb+1zsmmdNM5cy2TTm6A2DbVGEJYBAdrXqgthSSU
         2QeA==
X-Forwarded-Encrypted: i=1; AJvYcCVzUecEowHzcn1aT3whp4m9/eFJ5oMqRV2kyyjKJPqd/k6vZKSe/QZjM8xvJ9R3dJKtbf3D0b8QWZ/5Lnc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0voOGQnt6fEhkib2FZT/15G8s5SkD7QSJUfSUIbe4/3ne6147
	hb9nPdFJoRsR/XLJ5QP/V5DFIGzjk0L6E5KJtN86Q240bWkm+qw=
X-Gm-Gg: ASbGncspagHRmWPqq8woMjazpIo9R5UF8xloFbekYja1RMiL0IH6G5XxRzPHBTxFzR0
	wUPPSXjDs++ivXd1oVGqVyufIuZu1v7FUmEeS/SqA/BofwNIcHNmwuqHrkYYeTBai9gU8rMYNUM
	y9R5Tfoh6El7b9xXHjH+Vu+/cZrenm0lAoJLBaN1cDnRKMZ+99zh9AI9mEfVl1tGf3YA5qXY7u0
	NKIbaDxT+2hwOkAP7pA4NYt4Z92FG27HuTYVKDk96//xz1Xk6zyHVKS0TIUDsg9dSQy0RcdsVwo
	Atbi/tAk2bz6cm3866Tmkoyz+dEuY/VfR558mR3AQQvacLiy7CoSlw==
X-Google-Smtp-Source: AGHT+IFb8J+NNbk+VOYcmnH5z8UaoC9eNwMxuBvzfTteJDrUd57AhkcZ95OMgGfajO2gFLJb7lIQhw==
X-Received: by 2002:a05:600c:4e8e:b0:43d:ed:acd5 with SMTP id 5b1f17b1804b1-4405d616aa7mr21535135e9.10.1744808870684;
        Wed, 16 Apr 2025 06:07:50 -0700 (PDT)
Received: from octinomon (ericanang.plus.com. [81.174.158.113])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b58ca92sm20678415e9.30.2025.04.16.06.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 06:07:50 -0700 (PDT)
Date: Wed, 16 Apr 2025 14:07:44 +0100
From: Jules Irenge <jbi.octave@gmail.com>
To: dpenkler@gmail.com
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: gpib: Fix Kconfig
Message-ID: <Z_-rcegWISUc6zhk@octinomon>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Chekpatch reports a warning in Kconfig

WARNING: please write a help paragraph that fully describes the config symbol
         with at least 4 lines

To fix this , more accurate description is added.

Signed-off-by: Jules Irenge <jbi.octave@gmail.com>
---
 drivers/staging/gpib/Kconfig | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/Kconfig b/drivers/staging/gpib/Kconfig
index aa01538d5beb..1255035a995a 100644
--- a/drivers/staging/gpib/Kconfig
+++ b/drivers/staging/gpib/Kconfig
@@ -41,10 +41,11 @@ config GPIB_AGILENT_82357A
 	select GPIB_COMMON
 	depends on USB
 	help
-	  Enable support for Agilent/Keysight 82357x USB dongles.
+	  Enable support for the Agilent/Keysight 82357A and 82357B USB-to-GPIB adapters.
+	  This device allows GPIB instruments to be controlled over a USB connection.
 
-	  To compile this driver as a module, choose M here: the module will be
-	  called agilent_82357a.
+	  To compile this driver as a module, choose M here. The resulting module will be
+	  named agilent_82357a.
 
 config GPIB_CEC_PCI
 	tristate "CEC PCI board"
-- 
2.49.0

