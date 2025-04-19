Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8E42AE8C
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 10:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745059982; cv=none; b=hxO9KOKPqvDRj+CHB/tKRMT1WLBlVeeTb8df9VfMIO5ptURaF4ATh1BPjyXiV6XLrH5FGAyOfU3nU8lprAOuwYwTP1EPUIheBqc+mBt/HFJW93zbsEY1GsFJJ5vst/0DbVDHE04zNAD8Wj28I266Pi/8U7t3g0Crnh3yl8TyqXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745059982; c=relaxed/simple;
	bh=pFV8+APZ4afiOUH9jKEl7rLalv/bvsUYNtAAe10IZIc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qkcMWyKQxqFCRk25TaGnrfePZStjEsMUJblrx3u5+dHDaVt5UEikLHsncJy4h+vMBnuWofKuUIiPaVXKWre/ZP3n9vZ21VqKmqI61fI73DBRYt2j/qc0vWxqFzmiUn3nKq6AnUxe9lSjcJSfoN3vv67siTH3zn4IBwF8gz0x8Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nVhdpb2D; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nVhdpb2D"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso16937505e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 03:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745059979; x=1745664779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wFWYZupELLcAGnpt4Vy83r92Wa9TGPIc4ZEGsiqHyQ4=;
        b=nVhdpb2DNCKwxLLvvIUL4S3kQ1sgdbx4lGmHAMkBetTXqHhyoawg5rP+5bztAvrPCA
         tslGBWISnyNiak8v1YC7LaGCoJXgxi+ghuZJWNSwBBVDSihlTq4bXZIqGur+TaNMrl/l
         coNR6c3/wLhAC62WOmc3MnpbIBWBWOZhCqW8gIpTVFzz9tQFWQdxBE7iOd10thpz7Vyh
         P6Qe2jwnjdNzmb3pIdYUE/Csv/KewbCMluu4xX8oJF/WTMkJ1IQZwzay82BgViunEjNH
         IH/MmRPhKPXeuogM+fr9qJ5zxgd4FFUpTLBlVXltsnAT6Azh13fAT1NTecw1ddhKMBmh
         TQag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745059979; x=1745664779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wFWYZupELLcAGnpt4Vy83r92Wa9TGPIc4ZEGsiqHyQ4=;
        b=wSnWojUsEFljrv/Ikn1AbKBjzQncfXf0wxI/eaCBbm2bA4boklVNgZRNw0L37oB21Z
         FkNJFZLATMH9B/1Wp5hCHMWVwjFTwWuYkCsx/oEYrvoL6tgeL27ZicjsrVrOq73RRfS6
         3P2k5xD2iXf/4Pu/iXavjJ9EZupibYFE/DPUB7SolaguIHye0vDJj44RlWGDo0zRNt+P
         hel1JKYO9ol/MUVeI/c1iOKH/gYWh/Nwog1+Uv2Ec6tUOocfWWveeG+7lSxOGSkMQkdz
         m9peahP9/jADdUSHoLV+JqzVb9mU2gm2qD5h+oIBsR8/vIR0I7mQX3gdZp05qBnQClDA
         3u6g==
X-Forwarded-Encrypted: i=1; AJvYcCV8hyQvZaQZaAgx1BzTlF1tkGO+FtObnRON6ghH9xxQuYbl4JwbKP07g8jFbzeYkCyUdBDiB5+dLQAo1bA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwyzclFBOWoGeohV8dp8+RbhbTmZucvGvkxp09ZdzNDWg4RPRL
	fbNDECcFtCJ5VkLHcKswFu82Rdfnsr1OucGBkc9bPEwS0rrArRNp
X-Gm-Gg: ASbGncvmXomFZGxx97cY78veMpW2xDVDArIgrUJMQAX1fXdZHuIJS+lU0ZrGrh0sDgh
	kgsGa+B40V2Zl2+OYDRGYguSfp2OohU3WtBV8FJliZf64+DLeKpFPVKJBcoi5+pUimYmFMz9JeY
	OJxfcrvmIRMuIt5eYFht7XK4hhoGSR/pRuMG6jE49n+Pye2uEHRslJmSmp2xaPyiuYpSDfWjaGx
	ovANN+BvPBqYHzWPVj5JhgTJXbBIAPtqrZ8WFAJKlTTmljhj56onQZHzy/AbyII7NG3VSEwm12T
	C0AdtISkFM+PSHsA9YbsIxS9wMAzBfmp8LC6A20+OujIUNgCXxSFBZ0bzNMRGVUesKj58yJDBBI
	fiLfhDISETeo=
X-Google-Smtp-Source: AGHT+IHQ+MXguJN8Aa1j3IBdwBDm20XnrgHtQh87ohXGPTj1gd8ZpivxPZL5sQXTV0FZDXnAg3v/nA==
X-Received: by 2002:a05:600c:13c3:b0:43b:bb72:1dce with SMTP id 5b1f17b1804b1-440697104f3mr46649965e9.5.1745059978924;
        Sat, 19 Apr 2025 03:52:58 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44034fd8f37sm99471545e9.0.2025.04.19.03.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 03:52:58 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: marcello.carla@gmx.com,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH] staging: gpib: Fix lpvo request_system_control
Date: Sat, 19 Apr 2025 12:52:54 +0200
Message-ID: <20250419105254.28359-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The board should not set the controller-in-charge status in
request_system_control. It can only become controller-in-charge
by issuing an interface_clear.

Remove the setting of controller-in-charge from request_system_control.

Fixes: fce79512a96a ("staging: gpib: Add LPVO DIY USB GPIB driver")
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index 2e315c7756c4..3cf5037c0cd2 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -916,7 +916,6 @@ static int usb_gpib_request_system_control(struct gpib_board *board, int request
 	if (!request_control)
 		return -EINVAL;
 
-	set_bit(CIC_NUM, &board->status);
 	DIA_LOG(1, "done with %d -> %lx\n", request_control, board->status);
 	return 0;
 }
-- 
2.49.0

