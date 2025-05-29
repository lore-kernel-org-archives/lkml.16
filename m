Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B78218AB3;
	Thu, 29 May 2025 20:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748550508; cv=none; b=NuJA1rjdNKgRPJJQ2DAN1fQ85rz+CFhhyxrJxa0yt08M/dIY7Lqd4zCavXh1tL10L9PHpTYy/pxRFJzKBIYs810YRBbpUug9cFYy2RxAJJEUQhsmN/TG7V6VEleCm5154DoWwS9j/gchynEJY+UbRkwUiHGlNs333zg6cfyCOXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748550508; c=relaxed/simple;
	bh=HktfipjCtbNhdpQdjG/jx9IyuttYJiKuu2cQchPP5AQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XyY4HkgI/GOa9EorEEUg3KNwt/RHrUQesP3yu8leiPSTXtTgvOWwpBf1d4qL/+Srfl75U+O1IMsq3vSE/7mxO5ZTMQe5/GNPGD4vTvMc3nOMf5Sjcdt+9BP6huMv080S/JEHtCx0UY+oJi3tFUPYUKJURwwz3vv0CTD2nFkrD98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jiB/cQhb; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jiB/cQhb"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-40337dd3847so821965b6e.0;
        Thu, 29 May 2025 13:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748550506; x=1749155306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=80W2fxDPnqr3BsAdMQ1F8twH1xONkZpWztd0paXrfPc=;
        b=jiB/cQhb78Cq/MYQpECsAwKNcc/VqrvV1kSyA5phtElYnJF5Zq5322viBwAWczpy9a
         mEXL1BMYL26dAF8zG0cuJbmL3yQVegzpjfrV/rmuKhDI8oUcPcjS9qw/zsmHYcfTxD/j
         7YonSClF09xNmF3XgF93Na4Ce0ol/yy/yEovyLdjufnftemAdsmuzZX79K+Qp5RY7/WH
         +wWo3B7X07oTl0lrtF1agOeTcSYPT/Zb+ihGTmtr91jrIuwVBCCML1XM6oTd2DxXlSZL
         /0RoEI73MVtWjc9XK1u72MtkjoJQDXgJOGCZtZcTzF3R6eja5uGBAUsSwkFLU48oHomp
         KFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748550506; x=1749155306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=80W2fxDPnqr3BsAdMQ1F8twH1xONkZpWztd0paXrfPc=;
        b=SKoDdUcmIs8aCrRVd5NcKb3Pod62/+6MQjrWaRO8HivoKLw1zqxnwO0BXyktJFBVgn
         FS8F9iiInplM1vaRueafTDQq+OqJvp19xqYaAr0WxinTHhIwj4CYCTNAxKGSmFY0G2bo
         6l5vjkCVbK0BZE+ZXmL4PhvR/2Pi2LM01jKVYzxW0fy6JTBnWOGCSGw26AbqmRJEitrY
         5cskn0550G5UkzOEe0IutsRnFkBBRlORdnS95YFmMMWNKYd4mqk7h9Um+etK0sAfsRZz
         HKN1kTOHkkX5xSML/k+kcmoeJDCBPh7RSN3C6RmwlDsIOx3HUAdcL+fk6r49K4qjvhOj
         ZZIA==
X-Forwarded-Encrypted: i=1; AJvYcCWYdm9T9wHyhsy6W1m2J3LOPOw++Hs2Xl/zCom9ZTD45eEvCiwA6U2FwmdcWBcMRCigQY/MXb82jQqxyqqYD6WRLW1b@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqq5lXoyjhNIpyy10gDP/EtQOzpZDf0y3LPv9jEN6oGXJIBbIG
	9h44/YuUV3fONELZWxJJyQU+7kk3RbWdfyXzufovnENnbE6KEsXU0nwozkukTA==
X-Gm-Gg: ASbGncsa4jOztJjCosWS0HbJobXW/XqO3EnzQS8wPRvLgczS1MFVHolA9m0L9hH0yfq
	5f5Fq/fe8YgNZKOArV9uT7cMGBoJ79hBEOSLEu2xxdmy9kGnYKWhKfSZUsAZDRktR5kvk4k9hDA
	JY5tQqbpg9eA+GroXqfl2dONLbeVNVri3WA9kML1cp9gdKkJa6OTvVqG414UI6wY2w0f3ydsTnC
	sMZvCT+lwDaYJltZVuehzYDJrSbwjfB5QB47SQUsbnL/lXJrOQXpukdf7nqXj/vbMEd86Rp4Hv0
	1M15VIdtn3CxwqxTEwOh1EowEfINj2mmdwAGJL6n3rcHqB5v9/Yb4rqNkRu002ECw4SjwHOVKVo
	b0j2b2zA9gUpJz+lQlzS4fRxwveIH
X-Google-Smtp-Source: AGHT+IHxaknsXmZ//EqapzVARMwWBL6kJPnekK+QuGfKiKPeEPq2HebqX/wW+TibfpKE9ZIKmGR5qw==
X-Received: by 2002:a05:6808:3205:b0:3f6:abbf:bb88 with SMTP id 5614622812f47-406797191cbmr641215b6e.29.1748550506170;
        Thu, 29 May 2025 13:28:26 -0700 (PDT)
Received: from localhost.localdomain.adc.delllabs.net ([143.166.81.254])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40678bf36e7sm129240b6e.1.2025.05.29.13.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 13:28:25 -0700 (PDT)
From: Stuart Hayes <stuart.w.hayes@gmail.com>
To: linux-kernel@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Cc: Stuart Hayes <stuart.w.hayes@gmail.com>
Subject: [PATCH v3 1/4] platform/x86: dell_rbu: Fix lock context warning
Date: Thu, 29 May 2025 15:27:55 -0500
Message-ID: <20250529202758.8440-2-stuart.w.hayes@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250529202758.8440-1-stuart.w.hayes@gmail.com>
References: <20250529202758.8440-1-stuart.w.hayes@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a sparse lock context warning.

Signed-off-by: Stuart Hayes <stuart.w.hayes@gmail.com>
---
 drivers/platform/x86/dell/dell_rbu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell/dell_rbu.c b/drivers/platform/x86/dell/dell_rbu.c
index e30ca325938c..7b019fb72e86 100644
--- a/drivers/platform/x86/dell/dell_rbu.c
+++ b/drivers/platform/x86/dell/dell_rbu.c
@@ -91,7 +91,7 @@ static void init_packet_head(void)
 	rbu_data.imagesize = 0;
 }
 
-static int create_packet(void *data, size_t length)
+static int create_packet(void *data, size_t length) __must_hold(&rbu_data.lock)
 {
 	struct packet_data *newpacket;
 	int ordernum = 0;
-- 
2.47.1

