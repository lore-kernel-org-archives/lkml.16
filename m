Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E6A4207A;
	Sat, 21 Jun 2025 16:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750524040; cv=none; b=lZ/IjtnPnwH/iV7fpYg3edXy45ct/VbhUPxfNe2+ScW2xXdBHKSW6fmfuQa55whA14E5Dg7KvDoVfaXUecnXJiSb9NzfovHfSZeTIwzTOv/bqMhYDdJgwWBCcxuc7Bkkt+nyy+vUoYIHIYiZsUaA7244fklGwgL+IJuz6Y9oY+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750524040; c=relaxed/simple;
	bh=EVmf8TzEW8JxRdGdURPPOuBKozXNkpk3zCaggC36l1A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=fQt5cLIXFqsIMpNGyBxzHls/2y23oAQWe6Snp/wisrupnS2Zosy8Kwrj73FfvLSJK+PxbmnLKwVvSFnq68Ybqg8PTeJ2juyv7nVcKy1qbTMt5P2MSCxvEkBnVa8EauVLC/7PxAsa8uSXbBSUSqCVBzNCP/Y3N9OzVYwZT+kDvqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LBocfqm2; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LBocfqm2"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553ba7f11cbso3264169e87.1;
        Sat, 21 Jun 2025 09:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750524037; x=1751128837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sR1NMUT1yhTOJR/QHSq5p3ddT3ng4Ofa4jScIH8rNIo=;
        b=LBocfqm2GWewhVAEr6qbO+k74BwgONjtWwrWwET21bLUuDbea8t8OheHVf4BZfX9VV
         Uv3zTgrqwB0Gur6F5O8UPhiJ6CQFi1qqCsVX1Ovx1CBQH9xwo1PTAYC+qQdcUIEmlhC0
         JjgD+cZcthT+5ENNgavQ4I8yvXZuSHD5/jayb4n/3k4HzHojKdq7pCNdijNIBEA/YQ65
         7Qd8gGU0Z3UwBXKvPX2bZQUuNjwbwhDP1npJqn4mLdc0TVL2phfxQa8CsbF1FrC+kVfZ
         I0CtNxSI79Io0+ZcfEZjH832WxQbexyrHnvwOWLr98tfaRzRbESFHtRGAy/hFZrthtbe
         NITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750524037; x=1751128837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sR1NMUT1yhTOJR/QHSq5p3ddT3ng4Ofa4jScIH8rNIo=;
        b=pCqizihzmK8y4QR1V3aGJMgMw0ps2NOLcflK2iqAd+gtSvyLRaOs++AvYADS1fsy0c
         +vGk0u5KExBHsAKVt/8lCmR40IpIhcrxQCrCoqOtikPDl39Mr5MV5iMjR+4pzQmIyNKV
         mlyPm5pClatvBVTjPHHafbSF8bHerzlUPdAuz0d5tdt8K+UMjMExbW6q24q0synPSTq5
         uBhmfM0rm6mo3UcQs+QjIKDxNR5dR7ZQ3PFFUL8zT1HEA6rawYwW0DqCznURYId5VeGg
         zeY+fZB/LzEZP+0JIvP62ujP3KBbaTQg714H1b6TQ+lqRhI+XabDuze+E2c29hn+fnB6
         zY+w==
X-Forwarded-Encrypted: i=1; AJvYcCW8idN8XgiiFwWWsfr7ojFu7ypklDFcvfE32P6KUz1N9T02wvVkBM7VVrrrKGsg7Fo8TAx5XZHAXX2tGXY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhxfo0XylfvfuSXT0nhxmMnLDWJEkfJT5UrMmCZghl+goRyGnf
	pq8yGi2IxMKMpM2iEbXzcNQIl+ZIxkN8GX7CUt2b8JmDSN73cPRsoHnK
X-Gm-Gg: ASbGncuXcQI/GqQl2T919sJZSntjeiKmNXuFPPSq8P0aeWG7CUinEORJaZ4QdtzCbFU
	bRvskvMYd7sWUCd7QGKdxDK7Y0RYltvWRyXRxXAJ5heSTf5sDgUhFaodpXUKjc0Nm0nULfrkPJ7
	UbXHGtgdADxuY0pCiHPpo8NijsFk7DIFfDXWgKUmI1cMSA+Yx1q1rbT/SACMBVyDWF0MCAJvK7H
	mKU4/Oo4xnTewqWSCQ33X6b7gab/ADcAwYdW4dbWRxIaYC80tlA4hqLAV/u+CnoTtP9kPLib/41
	Et02cFOzec41FZZk8UiYkANY/q25j3cQMuZRXs48qCT+5R2LzCyKuEQcmooaDuwMq1PSEOrCd+o
	IEwZ8r0NthtpucnHtkO8ap1wR
X-Google-Smtp-Source: AGHT+IHxqWLBSElMYJDacdsNFfRrwGmh+pbTfsDtlw+a+l6yrvBq/9PzP7Rt0WQhltV3zTXUv10ruQ==
X-Received: by 2002:a05:6512:4014:b0:553:acf9:c430 with SMTP id 2adb3069b0e04-553e3ba865emr2701926e87.17.1750524036540;
        Sat, 21 Jun 2025 09:40:36 -0700 (PDT)
Received: from uuba.fritz.box (89-166-61-133.bb.dnainternet.fi. [89.166.61.133])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b980dc32bsm6561081fa.94.2025.06.21.09.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 09:40:36 -0700 (PDT)
From: =?UTF-8?q?Hanne-Lotta=20M=C3=A4enp=C3=A4=C3=A4?= <hannelotta@gmail.com>
To: gregkh@linuxfoundation.org,
	kekrby@gmail.com,
	elder@kernel.org,
	quic_zijuhu@quicinc.com,
	sumit.garg@kernel.org,
	skhan@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	=?UTF-8?q?Hanne-Lotta=20M=C3=A4enp=C3=A4=C3=A4?= <hannelotta@gmail.com>
Subject: [PATCH] usb: core: Use sysfs_emit_at() when showing dynamic IDs
Date: Sat, 21 Jun 2025 19:40:05 +0300
Message-Id: <20250621164005.4004-1-hannelotta@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When formatting the dynamic USB device IDs to show to
the user space, instead of scnprintf() function use
sysfs_emit_at(). The functions are equivalent, but
using the latter is recommended as it ensures that
no buffer overruns occur.

Testing the change can be done by assigning new IDs
to the USB driver's sysfs attribute new_id,
and then checking that the same values are returned.

For example:

echo 4533 7515 > /sys/bus/usb/drivers/usbfs/new_id
cat /sys/bus/usb/drivers/usbfs/new_id

The output should match the assigned IDs (4533 7515).

Signed-off-by: Hanne-Lotta Mäenpää <hannelotta@gmail.com>
---
 drivers/usb/core/driver.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index 460d4dde5994..c3177034b779 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -119,11 +119,11 @@ ssize_t usb_show_dynids(struct usb_dynids *dynids, char *buf)
 	guard(mutex)(&usb_dynids_lock);
 	list_for_each_entry(dynid, &dynids->list, node)
 		if (dynid->id.bInterfaceClass != 0)
-			count += scnprintf(&buf[count], PAGE_SIZE - count, "%04x %04x %02x\n",
+			count += sysfs_emit_at(&buf[count], count, "%04x %04x %02x\n",
 					   dynid->id.idVendor, dynid->id.idProduct,
 					   dynid->id.bInterfaceClass);
 		else
-			count += scnprintf(&buf[count], PAGE_SIZE - count, "%04x %04x\n",
+			count += sysfs_emit_at(&buf[count], count, "%04x %04x\n",
 					   dynid->id.idVendor, dynid->id.idProduct);
 	return count;
 }
-- 
2.39.5

