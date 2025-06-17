Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999C521C16D
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750171358; cv=none; b=GCpksOX2Arcoz5etk4fFfcYNW2e8nH8p8XTcJt0XRC+/UMPwcWfqpvHbw63PjxeK2qJ0u7yFfDUjP9LJ3lCeyoz4/oTzveeWv73jcBBQzUOjwiTMbAoaiGv5RMU60EK0V4oVL+YOD7C4OuZA0UJIdA477Uuq4PR9kO3bes8gcRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750171358; c=relaxed/simple;
	bh=bYdXHZgcVr0efBjTgUPsB8+QuqvjW8HoLU5Tp9AdihQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Is5kzsPu48uJuftoHtmcW+Gi3Y3A0mYq+aslx0Ttde8aFslO8g9RT/H0keueiPJFZhUsy5OgEnuP5D39KAZ0JVQSGVLpqvuKLH7FzBRddeugR0KUn300Cxw9PwanqG5CgaYjvvioHKsh63sbvNXXDO6ZxtycUo5yDBfSrJDUouQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Qiveonxq; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Qiveonxq"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-553543ddfc7so6233862e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 07:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750171354; x=1750776154; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0xlu3CSgyiphpvjrJ4zGRNfneVAXEwqkV8GfJcaFYtI=;
        b=QiveonxqdrRLMX9k4hobfSqIumO2vT6j/GmEvWxTx9mJCiZGY4CDiZlDhv6YMnEouM
         VJiT87HOS9rKUxmS/K3jVARBolteplWl6TwKAD8ODbeonvL1qQ9SSLgLbXBphTFS8Cs4
         hDCeus9kg9AFCpJXqkvrOcmdNIU1yRSmW4RNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750171354; x=1750776154;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0xlu3CSgyiphpvjrJ4zGRNfneVAXEwqkV8GfJcaFYtI=;
        b=P1H6cdIuTBNiGH2/sm7sIfatM7645DC8vQ2C4C/yrtKVqF4taWNdWWMZonwrcUbu2F
         qeGrnkia/aCwPTgmTyu9z/n2o6SH91gZ+Oo77CU7zqmdWwm+Gw+TUEg6yKA7gbCT5Tyl
         FKe98G9CF9EvbqigBnngsgFiw36vjU9jWMxAjUrhR8L+J3QHGURDLS0Ycc/t4aBY/GBY
         LKmUVr2tj+7jqIh3vr0O8FW57aAsW2zVj4nEFEdyiFw/AtO/azblMbf2veMkTL9eexl0
         9O/rzUHzyVMmgh7Ith2J2x9hrAFGnVHPr+2dbTidn1W4DYDwwB+vtQ9rg7lCqyY8Y/wf
         zNRA==
X-Forwarded-Encrypted: i=1; AJvYcCUuinDy64KUk8LkrSPD5by7pH6ICFBWCnw5P/4db12TltzFLtGqSLWnuzvySXJYVdBQM0VLKKV3tHelTAU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw028BHDbRHK502C5clIcOw/5ZoAfAhPuaC6kdRC9UJ06rxNEs4
	i184OjKUdiaLTEdr2xdcMd0kQ710THVsyCdWDlXAMQ6s+7Yq59nuDm8bwRNTGkdlhQ==
X-Gm-Gg: ASbGncsYzdxeWyduujFGwx2DubXQ6PPV0hjQsRcnYv12X/cyKUcIOfb1cTrDw5BCvK1
	a6fVEhSpNiTLTBdhpr2Z7d0WGfRGF3GZTS3GCYS/lbgctyYlTFwXp5ss7DeJMIu3M/a76yyKrbP
	r1grwsBxtMxtw4OqtPsO+YgkjajNfqis+Ko36k2sriSkXdUkNrRQf2ufqOg++lQG+DzS8sZiDPt
	1noCm05r1PmDu4SS+rXC5geRCABY2B3fY5RL1f/7qiCv2qQlPzcM/Y02yoqjWRmO+we6m0PvlP5
	0X1pgsySdmB/UxEQqsmdGss9oY4KpbEJR3N1fVkv5nI8905Fe97OPKATBRBFGKqrJS6t9cvxIrw
	/cnJLR7AXDWofhzAjyD5/mqXiXtqkRmq50Q3RpxSGow==
X-Google-Smtp-Source: AGHT+IHSNhO5TwkGdfM9rWVrhKnKMpikCyF46rs9ZtD7y07NlXl7lvAuPvpPwbsqhlOXn7g3p/KjdQ==
X-Received: by 2002:a05:6512:3e0d:b0:553:a8bb:7472 with SMTP id 2adb3069b0e04-553b6e8c40amr3461768e87.15.1750171353679;
        Tue, 17 Jun 2025 07:42:33 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ae234437sm1814992e87.53.2025.06.17.07.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:42:33 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 17 Jun 2025 14:42:23 +0000
Subject: [PATCH v7 2/5] media: Documentation: Add note about UVCH length
 field
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-uvc-meta-v7-2-9c50623e2286@chromium.org>
References: <20250617-uvc-meta-v7-0-9c50623e2286@chromium.org>
In-Reply-To: <20250617-uvc-meta-v7-0-9c50623e2286@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans de Goede <hansg@kernel.org>, Hans de Goede <hansg@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The documentation currently describes the UVC length field as the "length
of the rest of the block", which can be misleading. The driver limits the
data copied to a maximum of 12 bytes.

This change adds a clarifying sentence to the documentation to make this
restriction explicit.

Reviewed-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 Documentation/userspace-api/media/v4l/metafmt-uvc.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/metafmt-uvc.rst b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
index 784346d14bbdbf28348262084d5b0646d30bd1da..4c05e9e54683a2bf844ddf26f99d0d9713ef05de 100644
--- a/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
+++ b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
@@ -44,7 +44,9 @@ Each individual block contains the following fields:
         them
     * - :cspan:`1` *The rest is an exact copy of the UVC payload header:*
     * - __u8 length;
-      - length of the rest of the block, including this field
+      - length of the rest of the block, including this field. Please note that
+        regardless of this value, for V4L2_META_FMT_UVC the kernel will never
+        copy more than 2-12 bytes.
     * - __u8 flags;
       - Flags, indicating presence of other standard UVC fields
     * - __u8 buf[];

-- 
2.50.0.rc2.692.g299adb8693-goog

