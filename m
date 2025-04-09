Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE64D265CD8
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 14:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744207363; cv=none; b=JeMwjJhz2HUBBm9r7LfnfemIzCsMleIkeAqRVy5Zzpp1kQDZb6xpUu3/wvBOF7p3ldNGysCTC5cuwYRiBdJAY5EmWX4o6MG8yEczdm4kC3RGrBOC7WCwDymE1I2uv38Y9D26U3cMW6mHoMS1sNVvMfciHB1VLa4Rq9uEW7El8TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744207363; c=relaxed/simple;
	bh=mG96fuhZeMSiI4R/GosBkkESrvmzH8d+f53dlK48H50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xh4j3yyLGmec9RfLTriU3J/3J1AHpew/mUlRuQqdRmtSrVFDutjQhhlfTxCW1/y1Z3hcw5Cm/Dc2wP5QY3yb/MIygq7bLEhoQLocy4rVFultwAsFFq2SErkswYFxX/YapwRNT7YoPsE4S+FZpDHDSbXtKuvBlbnZIeQb49nAV5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=c6/2GOgr; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="c6/2GOgr"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac25d2b2354so1230407466b.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 07:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744207360; x=1744812160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KqfKoc5OtBfHsLnQESTgykRUnwgehQk6QiKSOB65pWU=;
        b=c6/2GOgrVvbSHtrK+LOIIbr0+LrQoYbcN751ah95zeEs2SdrJmgGHXWszmRH7Gkc8E
         qzW3EcCRkcAs0Bq2D+QGLK9MIMpqDJPLX079X9EkB8/CIiwJHqaNO2m+usSsi3rGCJkg
         OD6V1PDrycsWyNzHrcBRHV/WFhSxU6A1nYqVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744207360; x=1744812160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KqfKoc5OtBfHsLnQESTgykRUnwgehQk6QiKSOB65pWU=;
        b=p1i3tGXMSfDaYkqnk7LR3kUnVgykNHA0/MLsv1tp5rrb1vm+ERCOPRyzgEzISuBmf/
         8fIuEs8PYMafsYvmzKkplgCbnVD4vKI3m75qfSo8EVrYWxbbXilHgASb/fhE7WaCWdqW
         kz9KQTNGN9uueEWzQOwI8k0B05eKpdoGWkUJGbsxdpb2oQtcONri45ENvG/x1MJD8utq
         Rs9rIerUPN9I9gRLHUrBE81JZ/JzuPy20j40Hfegaj3+ObLlsACvAUl8SY29cLJw9UwO
         DaQVHvWwv/h6t2MljpRsKF49c9UBWrinwAvLwOYii7m/TpXkhF0ZdJqeaonZDKkg/dVK
         Jz8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXfkxyxHgZDxuSFmTu6bWVXz+YCmTYdTFEmvVT33PZNYDVoKTtzgfmwp40Y9TKOJUseSH0BblwmA7wBTwA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQNZV74Dy/MnKS3Ii6JYgIsGta8GwDfiHJIuWNiEmntSei9b5t
	foAqTrwocIiO5dbwgubdHlSzxjn6SpCMdtPJXUM9EYAHkVUlyuA6XoM94SVYcQ==
X-Gm-Gg: ASbGncv/eaaYJRc4kePNJgTv1mKfjAXjrSz8NuQ2+x5AaOVn0TLYfiTbFmL4xVWGPpe
	B6MbzF0O1y25ehj7H0VjpRETQ+xCnX77xSKQTBsdIw5OQ60jkiAqyGtVtSxFGLtmoPJDjsWMR0Z
	LnBgvezZpf0cLl0A8zefMqZ1AUMDFwSS5TiAm9vt4QJHtTWsEevhbyKHO0N9eOaUU+HmgIJ6fdc
	Yo72nK517uySeWn9dI4zfFSv6gKnF6hDcUMF0bR50JVfrHrA4uWJbEZobHPRgt1UebYvtcwz2I3
	l/SbZRMycUV96Jxjnb6M2CV+ww4pdNOSKfNahbh3bXMBkdKTRe5RaQHFtDsVlUdSH2//CqSKxgb
	mW9D6rieIZtbzgIhl2ewYPJiQbe3oxFkdyw==
X-Google-Smtp-Source: AGHT+IEWLkJa6H04bRvIjATOXf67M7GaZevp9XaqI0gC2rlSAY+sEhjXK4b4hzkWvOJzYrzvKZi5EQ==
X-Received: by 2002:a17:907:9714:b0:ac2:84db:5916 with SMTP id a640c23a62f3a-aca9b6acee1mr356442466b.31.1744207358401;
        Wed, 09 Apr 2025 07:02:38 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (185.155.90.34.bc.googleusercontent.com. [34.90.155.185])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1be95d0sm102657966b.55.2025.04.09.07.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 07:02:38 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jameson Thies <jthies@google.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Madhu M <madhu.m@intel.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] usb: typec: ucsi: displayport: Fix NULL pointer access
Date: Wed,  9 Apr 2025 14:02:21 +0000
Message-ID: <20250409140221.654892-3-akuchynski@chromium.org>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
In-Reply-To: <20250409140221.654892-1-akuchynski@chromium.org>
References: <20250409140221.654892-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch ensures that the UCSI driver waits for all pending tasks in the
ucsi_displayport_work workqueue to finish executing before proceeding with
the partner removal.

Cc: stable@vger.kernel.org
Fixes: af8622f6a585 ("usb: typec: ucsi: Support for DisplayPort alt mode")
Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/ucsi/displayport.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucsi/displayport.c
index acd053d4e38c..8aae80b457d7 100644
--- a/drivers/usb/typec/ucsi/displayport.c
+++ b/drivers/usb/typec/ucsi/displayport.c
@@ -299,6 +299,8 @@ void ucsi_displayport_remove_partner(struct typec_altmode *alt)
 	if (!dp)
 		return;
 
+	cancel_work_sync(&dp->work);
+
 	dp->data.conf = 0;
 	dp->data.status = 0;
 	dp->initialized = false;
-- 
2.49.0.504.g3bcea36a83-goog

