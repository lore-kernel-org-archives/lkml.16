Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B249825333E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 11:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746014185; cv=none; b=KhaFQeUOnS5UZplhKhXgMBjE8hnI9Kjj7dsSw7WgUIoetFmyBTLPZ12d6yah8vDxKQOiM8cIK87vZVhcISrrc0+S4jwQNCaqaU2NAh/WwQUdXnWUd7JwPnXm50xKtbx5ftL6pFSpwNuXQib/ajQSW70/cU03j2ozFOGG5mlyOnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746014185; c=relaxed/simple;
	bh=hyejLcti/TcNJx1m4d9G/GtC0oEJ7Qey4FsXMzEq1kM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k30qvQJ4wcuzj7O5ypKo3gX/+wlSQiXYM6g75xKNxHjb3bK/8yXmWoz4f0nrXq/STDVJbSBWAbfIT5nvSU/x/YrvP9VPFaKhfeDKENb/O46O+4l2mMFPOrnbVcgycK7jYZ71bb9ZJS5L5nuJ77qrCaO1TZXzpSTnxdnkom4UP7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Cmd+EBH6; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Cmd+EBH6"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso5585116f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 04:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746014181; x=1746618981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k9zyhrEUi6nJJ+PGWbcpcUtk00EBlhKzJBA8nF+tlnE=;
        b=Cmd+EBH6KzksutEoo7mkFf6TTdtPYgI5jqylReWF8QgEU9TR2Y8z4TGL+v6wPiNOIx
         2Bo5Vx/JAO3AjS/ozbH8an8PrqqanoSBMWUCWgMzfAAtReANgP93p9a4K7ovQQsh8DfI
         QtyzpRjGYv+zYMFiFVkqwX3uBT4iqlXBglBQYY0KujyZxNY8Mvqhp44SgOjy9A33UENl
         qQjgybdSHYpLwAUMMGlu9wejD1kIjBhcJpbYEIBkQ9JlghT7WuIG/CX16cjS1pdPk9Qa
         GFhEFiZ7dxzQunwoPb5qAaFWyYMlALsHWr0/a4WUme5QY/WPS7vt8uVnsYr3WOBNcPh2
         fr/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746014181; x=1746618981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k9zyhrEUi6nJJ+PGWbcpcUtk00EBlhKzJBA8nF+tlnE=;
        b=GQfvzzjuGFzCr8Ohu4saV7G2DGHN1oYkVm60IVGJK4nASUTJDMz+jNWqYIco9eJdqm
         gtuelYHtHYNnW+2rBIpgvzLOlyH72qJvLYcG0TZbCbHc7YZuGsg674qAq36bAV0n2YIa
         uBcSNxZQlqrCIQGdoNSWW1rwdyhNqYnEkzKZmjeSC/3r6ePsYSx+MrT3ioBfYJjn/mMc
         jzWTOwZn2SB5vA5VkK7TmMZx0Bdq9i5dqJOpvLTDxJMsua9VT1G+zj12J1QyNP41EFaF
         4mH7AoDKUhfLuW3tO3HIeC3juUenSg7u7yc2+YzX2irKH5pnFXGr8BHsl33aYPd9P33a
         M3iQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJPHvjjgMrvbQ7yVwbObjRry0I5WMn4m0Ub3UikNwv9e8ucG3FAX00tigqv8s8CZQIy5zJfNTLiAdIR/0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu9S6Q0WtA9FPJsMz/EGN5ubcopbORDuFepP96JMLe7M2yTieY
	MTHzuBqq6Cd0GScXvb2JS2OwYayyS80ey/NtpYoXZeQwBdjKWPYS6HkcLZDjosc=
X-Gm-Gg: ASbGncsCe0uNi38st8BC0Kh2HSzhzhIvkjgSxV2tDqmjPwcZJbEBoWfl9XRhj+Rte8V
	2Vp5N9gI0lj6uOnXtTSxOwT+hPWu59JF8l9QOpASbjj5zmZiW9rDW7Kj2Rg/qaW6nYCirlTsLgM
	LK8Opb3rbLZyf9oCPJ+XHS2+dm3KHKhG94u5GHEUqkPDYUS8ltpAJ0RIrbyj9L1jhZgmTGv/ofy
	VJnUUmtms35r3gVrbRegN11IbMw7XG0WiAqR/kJ85UJ6IfLjSU2xtggA7prOGT2vRj5hwa3WnWb
	HKkfX00huqvC9OjAqU3zYw2dPGpniRUmXyzAziPH4UgAEKwQgGaV49eD/tQ1VGZN5RrZzWy/4rd
	zDH3k6nI=
X-Google-Smtp-Source: AGHT+IE1s1XezmIzMYkUPHDqKoWM6AWJrgqc4UeJ0XNV8UbwybnVCGNfE/QYiRjyiS9OH4wYytTVoQ==
X-Received: by 2002:a5d:5f92:0:b0:39e:cbe0:4f3c with SMTP id ffacd0b85a97d-3a08f799858mr2396763f8f.8.1746014180982;
        Wed, 30 Apr 2025 04:56:20 -0700 (PDT)
Received: from localhost (p200300f65f00780800000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f00:7808::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a073e5bc8bsm16507524f8f.81.2025.04.30.04.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 04:56:20 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: David Lechner <dlechner@baylibre.com>,
	Kent Gibson <warthog618@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/4] pwm: Let pwm_set_waveform_might_sleep() fail for exact but impossible requests
Date: Wed, 30 Apr 2025 13:55:58 +0200
Message-ID:  <20538a46719584dafd8a1395c886780a97dcdf79.1746010245.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1746010245.git.u.kleine-koenig@baylibre.com>
References: <cover.1746010245.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2581; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=hyejLcti/TcNJx1m4d9G/GtC0oEJ7Qey4FsXMzEq1kM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoEg/TjhmrL1w5soCslBFVn+FiS6bMxvpaMz7kw bhK4duk4ZKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaBIP0wAKCRCPgPtYfRL+ TrRFB/9SDqf599BXlRzVARugVjRfSAG7ZLX+L0zzUolOI7hTKk4k+Cx/KTz57KcPAm/S7gjyMIO XA4Vq+H9hXub/FU1TutxJflnKT34X7oCAXBSz4Pz0xmZeFs/TcD7ekiSZYYl4xngz4ZoqSLQ0s3 JMvRfxnUh8QiyH3RaUixsF+p6W+Wapt7QmgfwppNyorxAZDfdi/sROV6Nw61IgCVID/9e1pA7CS HfIpXiJMCe0whRDWqwIvc+QLJWdy0KdPvvg7ETYXMm2tYgyGYmwD8sWcxVF8BH+RfHSsY+UlQ8r 0ZtR4FAlNPvZjtfZEVRdyT1NGwBosJXb5XRgnr/4Ok7P7u2b
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Up to now pwm_set_waveform_might_sleep() returned 1 for exact requests
that couldn't be served exactly. In contrast to
pwm_round_waveform_might_sleep() and pwm_set_waveform_might_sleep() with
exact = false this is an error condition. So simplify handling for
callers of pwm_set_waveform_might_sleep() by returning -EDOM instead of
1 in this case.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/core.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index e0a90c4cd723..28cb6ab0f62d 100644
--- a/drivers/pwm/core.c
+++ b/drivers/pwm/core.c
@@ -404,15 +404,16 @@ static int __pwm_set_waveform(struct pwm_device *pwm,
  * Typically a requested waveform cannot be implemented exactly, e.g. because
  * you requested .period_length_ns = 100 ns, but the hardware can only set
  * periods that are a multiple of 8.5 ns. With that hardware passing @exact =
- * true results in pwm_set_waveform_might_sleep() failing and returning 1. If
- * @exact = false you get a period of 93.5 ns (i.e. the biggest period not bigger
- * than the requested value).
+ * true results in pwm_set_waveform_might_sleep() failing and returning -EDOM.
+ * If @exact = false you get a period of 93.5 ns (i.e. the biggest period not
+ * bigger than the requested value).
  * Note that even with @exact = true, some rounding by less than 1 ns is
  * possible/needed. In the above example requesting .period_length_ns = 94 and
  * @exact = true, you get the hardware configured with period = 93.5 ns.
  *
- * Returns: 0 on success, 1 if was rounded up (if !@exact) or no perfect match was
- * possible (if @exact), or a negative errno
+ * Returns: 0 on success, 1 if was rounded up (if !@exact), -EDOM if setting
+ * failed due to the exact waveform not being possible (if @exact), or a
+ * different negative errno on failure.
  * Context: May sleep.
  */
 int pwm_set_waveform_might_sleep(struct pwm_device *pwm,
@@ -440,6 +441,16 @@ int pwm_set_waveform_might_sleep(struct pwm_device *pwm,
 		err = __pwm_set_waveform(pwm, wf, exact);
 	}
 
+	/*
+	 * map err == 1 to -EDOM for exact requests. Also make sure that -EDOM is
+	 * only returned in exactly that case. Note that __pwm_set_waveform()
+	 * should never return -EDOM which justifies the unlikely().
+	 */
+	if (unlikely(err == -EDOM))
+		err = -EINVAL;
+	else if (exact && err == 1)
+		err = -EDOM;
+
 	return err;
 }
 EXPORT_SYMBOL_GPL(pwm_set_waveform_might_sleep);
-- 
2.47.2

