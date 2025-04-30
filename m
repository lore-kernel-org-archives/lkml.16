Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADBE235051
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 12:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746016164; cv=none; b=sledfKehFaluJgYcnLIpn8gUvPfTCisCbwt3hYuPZmJGv3VLtAn+dCMXIy5wMZttSTpGso7ORut2NcDeJvAS78lPqpaFa7PNJUnMmBprfJ1IzH5WVxvYbtJYtEb6d2/UixU3U0gGOOdnm7NRGdUCJlerPiovqb4DQYlMKjkJwLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746016164; c=relaxed/simple;
	bh=65YaHnPW1syjynifrJVzhjCU7krexJAzh8rYWDgDGYg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ovfz50RAAHiBObK6V7f9aOUkHsOhL18GDopTMbWO1aooc2cuZGmauxNb9om7OwrNvWrmu7dm7f9Kw6MD7CLi/chk7L7AVGrtXmpuQoc67xikXtMh9tnSuJShbf71AQVBHj9Ca7Uf0hqwNmhc7CvYIRc9BNu+fFAJCuVTBfJZQAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=t/f3CgWJ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="t/f3CgWJ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so63975195e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 05:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746016160; x=1746620960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Hin90Q/qlFrY1uw8hPFIj/AZ5kwtshzSEzUknrcF5Y=;
        b=t/f3CgWJYostu1N+d1eN/RuSZX4U6Y1tAYQdRcjwhmew9I0Rey/2JjdpyJEkP3MhUE
         tu6GM9eXXjCy1GOjMKDSThxJGtcKXmzU+E068WcrZOUMZKtTsC7TWF8hA3v9gx2AYQwD
         M6xee8MgTN4dY8TBTIIuFC5fN0c2hXbPur21veWq9ey4C8ndaQylNxDxQ+nAU/4XhdYm
         Mis7kwVzZTjJHZ9uwOT3o1tVxIW1ILF1/+F2Q0i8W6RES8t9OOSruN/VifGFAL3GFMoH
         Lm+GkbW1gyL38w2Mp6u2P2JTqe/ZpE3DOndjQsWo43D3edw63OJs889Us9qfgYMALMgV
         uULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746016160; x=1746620960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Hin90Q/qlFrY1uw8hPFIj/AZ5kwtshzSEzUknrcF5Y=;
        b=NG8yqtgf8bjAfWNWeY9NLMqdKhGwX/53UyxDiUXE5ovLgh4Yklvw+2ECs15Ysxlx3n
         3IWVsL+eLw6lHXshXoxBVoazLlS7WXia9+7tn07MomEZCiMhiIQdobWGSLow8csKqM1B
         WprDLUjVO0yq3mu9CvVuKxJOVvZgRMDkgyd+se6v6hxDbUYtloBHXEzkQXdvBFTEqQKg
         iFZUbD63gshjQ9AFEdE8+8SpaZu0SLZ+3kopmQ95d4+q/dLIWpl9WhbLzZpFOfhHzjmb
         L5sA69pE7H0t4Ir0TfVkqal9woe+ryJpXNRwRFsGuNHeB2c0QgalY9nPW4fit/paerSA
         uOnw==
X-Gm-Message-State: AOJu0YycYklYO3zd/do/WUrTF6f0+eRsEhKc8cwNN6hZtkdThWJuAJeF
	QGMrUnUNNSkE63OTudfhSH95hH2S9K2VQQfKYYKxdPxTH1F/gNp0K/Q8S5xgGWs=
X-Gm-Gg: ASbGncs9gw5ed96bkSPNndkiXfwPTCffUhI2Areto0wpf8A/rCPqnUfKVQirPRF68MP
	V7f4umqnOQytBDxe7Bsk6XQ8V/rBzCaPeIOn3XCtc8bX3VfuS5ygCpCCEPxQ5/pkkB0dXjz8pWw
	cBS4GY9WeM+iU+0fHN9WqY36bcRrEjr3tgozFIHF5NC0YlZUilPSfvBBzifq69hf+qK4qYv60Zi
	FO169xnh/O3CXuAd4Nz3jm2CGgMY2PsgI8aR0xaa1kJfvzjal15Jz+ZiemfWew35YCD0Dz8D+3y
	PFSOEf77ZFZrR/COr+wsMea2NBbLwGu1EgakUOq79w==
X-Google-Smtp-Source: AGHT+IEcVop7LCHK+PW7qs+wyQUaCY++bj3vcdHwg7JuOrBDny/qNmv6fx8+wazaQUivLi52v9gpWg==
X-Received: by 2002:a05:600c:4703:b0:43d:160:cd9e with SMTP id 5b1f17b1804b1-441b1f3aa00mr28328895e9.17.1746016160460;
        Wed, 30 Apr 2025 05:29:20 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6298:7254:d3df:f23e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2bbf046sm22914175e9.35.2025.04.30.05.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 05:29:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Nicolas Pitre <npitre@baylibre.com>
Cc: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH] vt: add new dynamically generated files to .gitignore
Date: Wed, 30 Apr 2025 14:29:17 +0200
Message-ID: <20250430122917.72105-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add new dynamically generated headers to the local .gitignore.

Fixes: b11a041179e7 ("vt: introduce gen_ucs_width_table.py to create ucs_width_table.h")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/tty/vt/.gitignore | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/tty/vt/.gitignore b/drivers/tty/vt/.gitignore
index 0221709b177d..49ce44edad65 100644
--- a/drivers/tty/vt/.gitignore
+++ b/drivers/tty/vt/.gitignore
@@ -2,3 +2,5 @@
 /conmakehash
 /consolemap_deftbl.c
 /defkeymap.c
+/ucs_recompose_table.h
+/ucs_width_table.h
-- 
2.45.2

