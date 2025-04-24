Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF4E18B495
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745513219; cv=none; b=Uur58vPTxsvPs7u/lcvAu6qJ7T7WXFJBhwoh6J6n8yebQH9rryOTFEjcE2y1CxlkIaMTBe3HrT02ju7C3lDETUKcMQdMaFRyxkLkFpAadO9GW5vLBgFKTvhxMum/7lDitQmXgZiyLkcC0bDV1r5UDJCXXYJEVhkBT8SmFowQaFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745513219; c=relaxed/simple;
	bh=DnRed+2MKUgAgSOFAHNxY55sUYcrnMx6/ynGP7lOLk4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fjLiWfEiLBj/dCqUG+f2wYRubpCVnx3acEtDLz2zOiuH6sWvRqqGrTWD5ZU4LJV6eTU8cyl5bBUVT0gDcSAZ6PP/U0XpcWMj28k3LjRKQdswepEtNhLYQ0v9aB2LrSGB+iWqFPnW53AQV9hufKlXNRcl3Qp4Bvk/RwE33OKjytg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RwAlL8Y6; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RwAlL8Y6"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3995ff6b066so757374f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745513216; x=1746118016; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tX6BYTT8dOmFs+pdX/MFx3gTZUblYOPi9JW4PiTBaik=;
        b=RwAlL8Y6JL9Z9PBq3SbbH20WadmAVsX33K9VlYuEK2P8aOl3uBnhp87sKGqG11NOFe
         H8A020oCy3ZUz0D5opFKOxbUGpibuutgVEAGi6N3gMdq1kkCAb6g/mo15qSt47cDQr9r
         NjnjNgqOCt3FSsPAVLikpEMGt8HMx5fCGNl6ULWMX8sGz43tXtsWT8UNfBVdC7PxfpKO
         /x60DFHOdy7iSGvd0j8Zu162kIg032T5Q+Xyn4uun1Xn6U+Dzv9bn/HbvjzlWyQP3Jqx
         GnKlug3MavzAU0ygcLdV9HyrLBUcFa93EiOrEQUJdu/xXRdjEfbOvTziM83LaejAPDeT
         Hg0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745513216; x=1746118016;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tX6BYTT8dOmFs+pdX/MFx3gTZUblYOPi9JW4PiTBaik=;
        b=MyVVSrQ/OuKBKX3bU0iTKcZ4C5oMceRmvKeHr2sx1tMWTu/Hzj9091nbSGQzwc+FpD
         wNFb9Gi4vhl7C9o9dggujcrY6xtiTNpgZUDyWymNQ7+75HsEDADgLZwypN9aq6VfOAeo
         vBATJ4aXHSLYqWn3faTcpcX3wD2of1PfMCjL/Snk0NEnaNiNAMpXMDHfaOZ5pmkHLmTC
         Yw7P3X2f0zsST7sOFnIunnef5eC7PjX1etdi5ReR+34ZIzXU5a7UtCV3z14Vc0LSXICL
         r+OR7HznSXGGE6cMbjDNlJ2yC85+wov8gilJqWV/gxKRzC8H5pEohAYgRZvVrmCHGv/W
         fiYw==
X-Forwarded-Encrypted: i=1; AJvYcCUGnykU+LhgXoBqjbKC374mQl6cGEJE72UvvfrFjQ2hl/bLh5TpFDqn67CLPgufmWeFX0OdQoygE5/Xnxg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+x1fByNj4LB0vskD+ewXuZWuy0IMqHjY/XVHKa8HV2NrEeHsV
	2zMd/3E7Xu6HUUGPhj9S+2IabkbSbf+5OTXLF8GveZB9V5zMEdH4Fehl65LoTC4=
X-Gm-Gg: ASbGncuhwK75xZrkvZRH8orMLE3p/s0N1OLkIbWClQt8deTuc5Wq+X9mfFKbGrmsbLi
	h6rjp1tcXncs+MAnefoVZtSl5g2FS5qljIMBUU4SJsz1+4youQwWUyztVpRdbNELxrLqm9+uI+J
	YcFwJ9rLnkpuYhQPJ1XtqgoKm5doYrKokwQ9LxtHjm7LfT2uUfCuMg0cv7UU4rOSXga7np7T5ya
	gaqV3xMgc4DncBD4BUot+iqjJIDaZGhwkj4O+odtp/xI2fUa6nGQkwwWsTfH0xhPt4J45/Tp/rn
	k8WF9uQJeo+NLoKc+5KWGh/loXwrLso+2ltiNRcuUBwJM2QYnN4WH1jTaMxyVtrr6QQQCGfvXAa
	37081VoA9kONK8SBTntLoI1gA
X-Google-Smtp-Source: AGHT+IGbtUZ1epAFM71uoldTFr4VYxXQceNxeQpoJpuw+knCHDf5n5FvydE+by/rlcAYTosCU00hYw==
X-Received: by 2002:a05:6000:184d:b0:39c:13fd:ea9c with SMTP id ffacd0b85a97d-3a072bb7529mr36617f8f.47.1745513215697;
        Thu, 24 Apr 2025 09:46:55 -0700 (PDT)
Received: from andreas-VirtualBox (089144201082.atnat0010.highway.a1.net. [89.144.201.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a807bsm2633243f8f.20.2025.04.24.09.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 09:46:54 -0700 (PDT)
Date: Thu, 24 Apr 2025 18:46:52 +0200
From: Andreas Kleinbichler <andi.kleinbichler@gmail.com>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] [Patch]: staging: greybus: camera: fix alignment should
 match open parentheses
Message-ID: <aApq_JPIBhnGqfiR@andreas-VirtualBox>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Correct the alignment of the parameters to match the open parenthesis.

Reported by checkpatch:

        CHECK: Alignment should match open parenthesis

Signed-off-by: Andreas Kleinbichler <andi.kleinbichler@gmail.com>
---
 drivers/staging/greybus/camera.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
index ec9fddfc0b14..a1b76df39a8f 100644
--- a/drivers/staging/greybus/camera.c
+++ b/drivers/staging/greybus/camera.c
@@ -263,9 +263,10 @@ static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
  * Validate the stream configuration response verifying padding is correctly
  * set and the returned number of streams is supported
  */
-static const int gb_camera_configure_streams_validate_response(struct gb_camera *gcam,
-		struct gb_camera_configure_streams_response *resp,
-		unsigned int nstreams)
+static const int gb_camera_configure_streams_validate_response
+	(struct gb_camera *gcam,
+	 struct gb_camera_configure_streams_response *resp,
+	 unsigned int nstreams)
 {
 	unsigned int i;
 
-- 
2.43.0

