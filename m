Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B85205AB2;
	Sun, 18 May 2025 11:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747568957; cv=none; b=C0fqKEv0voUuwnfcXp1P/+b1WUKqTtsaknBDPq0kyrRlbFWDoJAsXP/6OB3/pBZPkbSO7s/EsupczLYZQXJfJeGGqKwwUBfxI0VGaHR9b/f3tVjfi6CiHWG/OTNJLVvODmQXwuTNQp9eezCuVFItnC0BL5uZPSqfKF9+B4Ftp0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747568957; c=relaxed/simple;
	bh=HiKOzxeOt45QTgKhQrYLef7NcSGu+e/SqcM3but3h/0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lNrJyKvjz1tKIsKWnokfIPe3crcitJ4wHyfigmyF5LBaqJ1pdDgmVQh78jN4cfCzEiQNXzzSnVxbO9BMVb1R7EU3ND4ybXYKwsIY0FDZ47tWAQpB/6zaXqV4pej7tzrSVDCZGYFDYBq2+lPf3hWj7bft+h+RxmMMwlZv39ObGy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c0i7oNn8; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c0i7oNn8"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-52edc9ad68aso33747e0c.0;
        Sun, 18 May 2025 04:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747568955; x=1748173755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZVCyW1p+zUGd8ZnX+1lDj4SV+WumcGrGBjrEJGb8j2c=;
        b=c0i7oNn8PUh8B823T34SNEVq9lPwegVWhwLAoOIWvOPpdB0w6kbRoTs+2tn8ZXWMVs
         R25cBJ//M87fx/dnUFOS7LAcrTQ5jyKajwVWb9KUDEPq3z1d6ZTKi3cwpU2uoDeCQYnv
         peCwN0SxLFNCecmOW11lDWoDxNi46+E3z538yMNmYWsOtMtIKhXh+bns1I6sjD4hGGgL
         9Fg3cLQjE6s768wBADHgfOwl+WpAzHXz30rd0NaOcWzs0yg0D4lwaEJH+J8Z+yhojDpV
         8WUirl/qHk/PPK9cOOFJuD4nHY+FOMa6ef9HjOmryBa9rf5dJfihyrooszDaQh4MnKfk
         wXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747568955; x=1748173755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZVCyW1p+zUGd8ZnX+1lDj4SV+WumcGrGBjrEJGb8j2c=;
        b=kxZsDKbweXs9Xgz8Phgi/JWgFD+ptvu68D5JfSqZlPcNAmFiqGWAboD5Xg+3VXJjA0
         AOcImcYe0VVtuKthUgFq7GCi/toO/qH2CW0ezyQhxSOq98NjpKtLtiwTKr8PvhfMRrM8
         NVSrBvnM3P6XT4e7aCPgtv8LF1SnV2qI3M3Nk6ZeRt4bYgMvHxdTX86+JmdV41qXYe0H
         vi7e1fsBKXJ7Xgd6TPlySRX6Oy+QmHlLZU3/zTHI5TbWgVD10bUa31rVu687LoqlNd7Y
         5dNUoCMjsTspuxQ0IzeD7Tfx1VtrV8rfAH6NTXL4C/22geARRGwWi5t3ja5m3QId9bHQ
         vepw==
X-Forwarded-Encrypted: i=1; AJvYcCUwsurd6abe24Pqbad0Ehb4yldEAHKt3poai1QCHo3ZMkiFv/97jL9mL+vF4hb11PdnwXLa1GTcoJeJYso=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYGML0l3aAhlIMPjfR2Tmedut4Bi+YntngTME/lK8zmFvExNY1
	uUyLVv5g96iNdc1hZtBPJR5RzkP03eb267+mFv1NO2SR3GlEiM91JnqL
X-Gm-Gg: ASbGnct+Lt3WOJrEyYSG4qOd4nd2MAHPRBPuyWMhCtQLIiaKgs/5U6oZ4rwAINTET0f
	5opqMpZM0K6egeN+sFOpKMPyBsQKwamG2xxKdsEkFDBNd9BBE4FXWZ13aZ62VDn5wFiSAigjHB5
	xSzwX5C9eoxpt8LQ2VQ3WgEkyMX6xoo28zrwNbbmlLdw8PVZwkznyvhwJXS808zqNkOClEtdE4x
	ZiyI1mSC5IquGWt7POYmgz2/qYEqSIVCNnKK5ZBXmovWYcoE6QEkSSOeXjG7XTtXdAOfSvioZCY
	ilXqKRxROjPpvczAanHjGMJ++FRK5sJnJtGfb8DFUMOSnRPDiYb8+2+HnX7+6UQbN04Gw5NXLna
	pGnAGoPG1O4Zahdqf2f1gze9VRmZw
X-Google-Smtp-Source: AGHT+IG+foBn+D+HEw6LXJFoab8xmAOzeSF/BhV0UQskSTow3H49661XYEZ6YEFTViFVpOW4DpnRXQ==
X-Received: by 2002:a05:6122:6170:b0:52b:789:2d0 with SMTP id 71dfb90a1353d-52dbcd389e5mr6752245e0c.5.1747568954636;
        Sun, 18 May 2025 04:49:14 -0700 (PDT)
Received: from Ubuntu.. (syn-097-097-020-058.res.spectrum.com. [97.97.20.58])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dba910b9dsm5088621e0c.4.2025.05.18.04.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 04:49:14 -0700 (PDT)
From: Jonathan Velez <jonvelez12345@gmail.com>
To: Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Velez <jonvelez12345@gmail.com>
Subject: [PATCH] docs: usb: dwc3: add documentation of 'sg' field in dwc3_request struct
Date: Sun, 18 May 2025 11:48:59 +0000
Message-ID: <20250518114859.9215-1-jonvelez12345@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

core: Add documentation of "sg" field in the dwc3_request struct.

Signed-off-by: Jonathan Velez <jonvelez12345@gmail.com>
---
 drivers/usb/dwc3/core.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index f11570c8ffd0..bb140dde07d6 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -942,6 +942,7 @@ struct dwc3_hwparams {
  * @request: struct usb_request to be transferred
  * @list: a list_head used for request queueing
  * @dep: struct dwc3_ep owning this request
+ * @sg: pointer to the scatter-gather list for transfers
  * @start_sg: pointer to the sg which should be queued next
  * @num_pending_sgs: counter to pending sgs
  * @remaining: amount of data remaining
-- 
2.43.0

