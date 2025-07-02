Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2431E130F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 04:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751429072; cv=none; b=u7yKoKbU2+dBB2/kZ9dWIfMT8SP3SDQtY4i6bWtFRyLvTlg0q+zUwYJqwDNZLqPARvDAQuRwLzk0FKzhZMUU/hpZS8Bk4T01hgmF7fCIqoDXlQqOHs2+MAPz+r65sBD5I2B/gUZIUz3+59+Iq0vwRYK8BJH+JykMkaqjNaYpJgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751429072; c=relaxed/simple;
	bh=2zaGRg9xjy8jrN3iRp7IaHZQPQgXPbTUx2OAyUH0m7g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aXcbvT7KMYWuQXJ4mFBWS6yBOFf3gqWQSz5pNYGUe70LjKIKCjQEFemb/a4flV9rMlh5np+V/un4E55A5DyG/W/w13rqP4ofimxfbrkRtjdyDD/gPi28juyHAUAkvcq4GXkSvd/obTvg0FOqx3/efh5bMKor9NKsX18l8lxab0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z9o0E0f0; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z9o0E0f0"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-23c703c471dso843805ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 21:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751429070; x=1752033870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lEMe5If37CsAL6U9beslG7nLz1tz3xe07ZHEdYWOd40=;
        b=Z9o0E0f0rqhxGpN7p4wAdV7f26rpkaFIR5V8Rqen7QNLCCNth7+psTqcqe6HmsyetA
         XPvSOmNbq8tUDqbe5AD3o00R2RiIfEv+9cuueXlDquNk5QAkOo5VhhPV+KbSHn2rRIXg
         NT0w97fZlIiXnWPKa+V5R/twryxYDzfYBARC/jLYxcHlfmxQn2Fr5bXlJ5EGbNygALIL
         Pbn8ZPDKBPrWMcAqTvpNgNu0nku76357J90X09/9XeMRyL+S0HEycnHMOacMFzrS09Gx
         kEIb2H/5ZVf4VKvo+B9+QSDInBgEaY17i1o2iWnxvheC6JaxoilbuZ9ynoNd+zi/jRNF
         ev0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751429070; x=1752033870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lEMe5If37CsAL6U9beslG7nLz1tz3xe07ZHEdYWOd40=;
        b=kdyKfsYA/qYVhNIv0pN3m7JZXbCXv/DxE8hTPN5GphZ8sDnvQkZk5hEq1M8Xl+zN+h
         DAI3AHlqYCBBf0XZl7sEQJQbguQIgQbsx+RaGcENlibYeSrpgTDb5vysa1CmaDSkcZaY
         qjPwgGwzFHzRq6pSGsHnVdABvMHEIGerrluBP+IVwFAv7AhDkyCT9/cnai6gkT5L1zdz
         WAHQWlQ0MWtfzP/zcUamlT2fqCW9fC15Z9FpHpD32VwtqfqvA8XGYH2TAUxtdaFCAdLu
         SmdGZ2ZyS9qEAo7Vt+2ZRv3oICecABqYWzgdoDydgMEyIdpFvAvoYGTYR1mVtKvGRETP
         TdCg==
X-Gm-Message-State: AOJu0YxIkVv/BVQ5uIJ1FaGQUGY5qJbV/qo1aMTcC/6WkXk/42TsYIIV
	bhBTgT8Wjn8oKCnP8p0T2v9luAmFUtfcjXBWZ5UvzbfD069wiIKgD9fhr6gwvA==
X-Gm-Gg: ASbGncuZISGThV5XxlmJLfugohPMIqbRjJojtGkKf875xT1PxKmcm8vfxKsNyik0BvD
	xiIHH6DYRNEAP1Casqt2+a2g5vJIFr3QCKzoENQJCpXFbukD/SjTiTmuqoN4RM8kwSA+8K+3KZp
	v2A5wgL/veCEFlyBWxTzwv39/Sv+ZzFp6QgV+Fbjvek5JarDXbLuKoPaZvheKGo8y3nLFZMOaPs
	Gy6NYs7j0/rct8vD5ZBJ6X6zscsBIsCQOKDckiWSWfHSMKQUNKxcOtLUXYAeCYNcdHVpa88gm1v
	kG2j0qKeog/I+Gy071UqgmFrmGbQ3QEAjJwdFkshz9WE39fF2/n5poAHAeitoA==
X-Google-Smtp-Source: AGHT+IFR7xqMX6iwK6ZaKGMWmfFBMbz6Jykr2RrB8cdHL5LHHsjp5yjMMSroHrZcBbvTdOSjx6VJ0A==
X-Received: by 2002:a17:902:f642:b0:231:fd73:f8e5 with SMTP id d9443c01a7336-23c6e82a382mr15967845ad.24.1751429070049;
        Tue, 01 Jul 2025 21:04:30 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2e1971sm125738845ad.39.2025.07.01.21.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 21:04:29 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id C75C9420A74B; Wed, 02 Jul 2025 11:04:27 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux i3c <linux-i3c@lists.infradead.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH v2] i3c: Fix i3c_device_do_priv_xfers() kernel-doc indentation
Date: Wed,  2 Jul 2025 11:04:24 +0700
Message-ID: <20250702040424.18577-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1697; i=bagasdotme@gmail.com; h=from:subject; bh=2zaGRg9xjy8jrN3iRp7IaHZQPQgXPbTUx2OAyUH0m7g=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkp602LW0s9LK2n73S/dzx8t8COt5ZRct4CuzJNXHIZl EK9rn7uKGVhEONikBVTZJmUyNd0epeRyIX2tY4wc1iZQIYwcHEKwERUTzAyLOo/IeVZ8/qQ7fd+ rXIBmUuLDzEv9YlatZd7A0ObstLZAEaGnoQnhYGHJLfKWb2f9Ol6KEen5tcDASdnrUpjX8Hls/Y /MwA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Sphinx reports indentation warning on i3c_device_do_priv_xfers() return
value list:

Documentation/driver-api/i3c/device-driver-api:9: ./drivers/i3c/device.c:31: ERROR: Unexpected indentation. [docutils]

Format the list as bullet list to fix the warning.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
Changes since v1 [1]:

  * Follow kernel-doc style on return list
  * Patch subject massage (Frank)
  * Drop Fixes: tag (Frank)

[1]: https://lore.kernel.org/r/20250626042201.44594-1-bagasdotme@gmail.com/

 drivers/i3c/device.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
index e80e4875691467..2396545763ff85 100644
--- a/drivers/i3c/device.c
+++ b/drivers/i3c/device.c
@@ -26,11 +26,12 @@
  *
  * This function can sleep and thus cannot be called in atomic context.
  *
- * Return: 0 in case of success, a negative error core otherwise.
- *	   -EAGAIN: controller lost address arbitration. Target
- *		    (IBI, HJ or controller role request) win the bus. Client
- *		    driver needs to resend the 'xfers' some time later.
- *		    See I3C spec ver 1.1.1 09-Jun-2021. Section: 5.1.2.2.3.
+ * Return:
+ * * 0 in case of success, a negative error core otherwise.
+ * * -EAGAIN: controller lost address arbitration. Target (IBI, HJ or
+ *   controller role request) win the bus. Client driver needs to resend the
+ *   'xfers' some time later. See I3C spec ver 1.1.1 09-Jun-2021. Section:
+ *   5.1.2.2.3.
  */
 int i3c_device_do_priv_xfers(struct i3c_device *dev,
 			     struct i3c_priv_xfer *xfers,
-- 
An old man doll... just what I always wanted! - Clara

