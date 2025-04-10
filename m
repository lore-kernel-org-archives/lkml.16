Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753C528CF55
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744290427; cv=none; b=g++vvdpwDz9J/fKT4tSCuGziApeuUGmgEVueGNKl/DzuBRRvqtt/+yNs6Vdjoj8P8NZaF4lGZOxnstke2uYYvi/OAatK6HMwedLQL58mwsfCo4QhmsYMxFb+Ovsoo2gf76xDLXUToJii2lL21PWj1TId6tWl3ohlmlnfa0Zmi5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744290427; c=relaxed/simple;
	bh=gD/ivy8TozAfZl09YY5BEmq3r9BlB+mpS1btyHwFBW0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RpKzymdxfTvmvX77uSM5PurzYB51D3Q8v97loDni446svYsDf0TYtWyjgAY4xFvOk7s+8r5Q9ed5q+ZEeW6R5dGcrwPUcnxfltoA2hSrTm0MuqPOc1GcxnTvOtW+fybR1BxDkS7bx1cx4wWcklo+/+y5ejtUC+Wx/d+FVuxECE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b79puNDR; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b79puNDR"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso384845f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 06:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744290424; x=1744895224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xb4/K9i3KehiCtF/Usls0i0omViTubWO0lqe6s2Xk6Q=;
        b=b79puNDRKJy/NtWm7YHTzhyxI/TXMHd2I4l/Dz45ReWqPZwDVpKGTeEyJCvQ6RgRvU
         cAn6cmuazbpXTMtzN9nt1oM4fswtbCOdFWVZzPBeSTrPP99PZawOnKSsJ0/lyz5O2mkg
         XzhN47AlYEzFGdwTndFWhtpeZMWkumeucSmVcvfZa9YG1txSXn0o0GWW+RlpusvuwiuL
         LYuqq8eyrlQu/FI+cnKoViRc9h+1C2fNIW6BT2wcPH4r13R1yUmdHzVT0zPNIKozhear
         +X0F9H6h86+mllBdyN1bjIT7NrtTKp+8TXkPnUp8yflxs81mG9StxdDeNkaNkZSXzz9g
         kKyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744290424; x=1744895224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xb4/K9i3KehiCtF/Usls0i0omViTubWO0lqe6s2Xk6Q=;
        b=gIiYYJc9xuGjlGGikySDT5JfAw9IevIVk60bw4X/lnnJUWPOP7Nwdz4pyvwrlKVy8f
         c1C/ZdCBdkncnVtNXE5Iu21iRHWXCC5IZHZ4R6Phpq/ElW5UEJNmRaqNAe5+jlsaIfG1
         anCgQTW9jgm5Ko60OqGUXqMBgT57b0XcN0vGb51pQ1yaQH4+p1R4wj+5fb8XGxgydMqV
         xcYx20ddG27rJsamHOS4iF8RJzwXX9qt0y4C1aN3TUhfJ/Fu0UGtWEiDUKZJa3jOxf9T
         41NTplu2S05IPgDk5wR10Tt0evlJorq7Qt9FKB0f7tDSKq0B4lf3AK6DtQtRdfbo53Mq
         /EYA==
X-Forwarded-Encrypted: i=1; AJvYcCXzPgpkuXiXMnbEVVsTLq6G51w071YVzblpWlG0Kap6Sfwnq6o1T8/xzfPsUhQovsI6D5jGqkDiQAHg/hw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXMRLmHQ1JcY+LFrjg6JuyDSSb6dGXT3mQRoGOP+vVOTQuNLqk
	4TVQiU7jcA4uqNsJApVyszPNkXN8w+BT6RLxzgSFT45BZ0pFgteH
X-Gm-Gg: ASbGncu76fKRa25N4P0mVzAq91MGqCIz1IxZQcEm4H7cMhaS5YB8+vviNSy0SdQOVZM
	9shDkisCfU6KNs+/dYQCSo/r4cLXYhrr3qY2mNKZEKzcf1990Iv4DhWWRFInXDEnc8tS2Z1ydzq
	nZU7mBUJamXkDiKdZvREmYuW0rNQS+w67h9RW5uqnj2ay4jtCGf40yKYIlqQhZvE3KQ/90xYoNp
	rLRLLlFhsGGLIxFhLK83EUXK1Bhwsg/nKBHELssKPRnw7hMALDoeti9mzGFtiU5o9QK1poeoJbt
	hHwZ7YSgl6SNKXrqp+CEpWDzoaeAGTdLQRo2Gg==
X-Google-Smtp-Source: AGHT+IHJXFAWfo5VZ1vG/fakJyccgk0mpHMtlCd905bv/mlWMdNr7tRkIyIJsjHbOLe4gopOeRo1JQ==
X-Received: by 2002:a5d:5f4f:0:b0:390:eebc:6f32 with SMTP id ffacd0b85a97d-39d8fda7660mr2252641f8f.48.1744290423424;
        Thu, 10 Apr 2025 06:07:03 -0700 (PDT)
Received: from pc.. ([197.155.71.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2075fc6dsm55013045e9.28.2025.04.10.06.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 06:07:02 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] staging: rtl8723bs: Initialize variables at declaration in rtl8723bs_recv.c
Date: Thu, 10 Apr 2025 16:06:11 +0300
Message-ID: <6acc4efa84d38f5da7cb718d383664832bfb0370.1744285781.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744285781.git.karanja99erick@gmail.com>
References: <cover.1744285781.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the code more concise and readable by integrating the initialization
directly into the variable declaration in cases where the initialization
is simple and doesn't depend on other variables or complex expressions.

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
index 28c914ec2604..8d0d8e8e837e 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
@@ -367,14 +367,11 @@ static void rtl8723bs_recv_tasklet(struct tasklet_struct *t)
  */
 s32 rtl8723bs_init_recv_priv(struct adapter *padapter)
 {
-	s32 res;
+	s32 res = _SUCCESS;
 	u32 i, n;
-	struct recv_priv *precvpriv;
+	struct recv_priv *precvpriv = &padapter->recvpriv;
 	struct recv_buf *precvbuf;
 
-	res = _SUCCESS;
-	precvpriv = &padapter->recvpriv;
-
 	/* 3 1. init recv buffer */
 	INIT_LIST_HEAD(&precvpriv->free_recv_buf_queue.queue);
 	spin_lock_init(&precvpriv->free_recv_buf_queue.lock);
@@ -453,11 +450,9 @@ s32 rtl8723bs_init_recv_priv(struct adapter *padapter)
 void rtl8723bs_free_recv_priv(struct adapter *padapter)
 {
 	u32 i;
-	struct recv_priv *precvpriv;
+	struct recv_priv *precvpriv = &padapter->recvpriv;
 	struct recv_buf *precvbuf;
 
-	precvpriv = &padapter->recvpriv;
-
 	/* 3 1. kill tasklet */
 	tasklet_kill(&precvpriv->recv_tasklet);
 
-- 
2.43.0

