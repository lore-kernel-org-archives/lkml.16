Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D2227D769
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 12:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744117151; cv=none; b=HnOtOETWvZtpyIcmDuIiFU1ussr67EmCMjAsEXJ6Q2HXEMHP3y783rv6coypg8Uz+6lbv589Z4p/a4wcBWwz0fn/lh1/MgNDsOkEj3WVFgg89swYak5TTTugUcP6TCm/UOxhLghvrOtrmSuIw+XAfTGR5lp8XIZA76rBT+m58sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744117151; c=relaxed/simple;
	bh=56UFcJd+cny+RJSE4ASEku42icOHbo+F8jsHDB/KZXs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ikEgeSZaZpg+h2DF3U+Y6531Z4SEI+5atin/sJ0kaS+ijYrkhras20wmfTG0MJmI143F3OU6YlN8W5FyYiJHJCnz4zXgw8VBL4kEkwP/0qNl36ilVbHIUJa2HN75vFjjUfxWB1YmmTIhFjZhj0e0zJw6NlrPKL1jUy4UyuvIcs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ZUlCpXUO; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ZUlCpXUO"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39c2688619bso3367202f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 05:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744117148; x=1744721948; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MlPD6UmTKDrvcl8iMNArvTcmNGeakqnKSKCJEwvJ8i4=;
        b=ZUlCpXUOIOrJ+8AbdVsU+jQ2beqY8jy1yFEZh7EK3dycKDwWYxZL5XM+0hYUrh3RxK
         5xtpgouefnfNxwvANnpY1oL7k8rOGO1WfbG9qSSDNr39hTZwJ/Od43JQUOXBBexumALz
         OdDfbrdFSxrj0TGCWU/qA1pdhBRMTRD05CWJoWRtAFbGsc96y8sNS1Em7aAIjIBGS0WF
         TvTMkpoAHV9kPJWgjNZixgOWCjBF+se9/LODOV7pvmWe/vD8esqy4IATq8hgPEY/wWG6
         Wlfpfzo3gsxk/v2Ijbuw57zUCBZxW3s0P8UqKS6stOIy1WKhXZTnXo8pDVb1bSbq0t3e
         KhjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744117148; x=1744721948;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MlPD6UmTKDrvcl8iMNArvTcmNGeakqnKSKCJEwvJ8i4=;
        b=e3jCwbOgCIFxqgSWomj42ihYtAhHKVKxvrzDUkGoK7ky+7o4XduGqt1nfjUR8eg920
         Z3hRhk3Or6vvWjPJx4gF6OVWCv+D7poFBPaGNJw4YpsKshfazNCW/25PN6eVUx35MXKa
         ulVRzcFpBTagjaHIKGLqMub1ZHeZEQpEQQdvDycMq4j2fuaLXn58+zGDpGs7adxMg9xw
         sqlqDLrXXEyztG/zR4fWPRt52v/p4mfg8f+oDct7mw8cFcnPB7y/Q6QMfq7+3K4PiOQZ
         uCalZ815rqqpwyADll69Nq1D5Gkyh0/o2SK9ZegkI/xisTcNkmv+m6tRqQsXQFvI15LW
         uZdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXO5XTyDx4fqic61tMklB6qb4LX6AfkStw62DL7ADBVXjDLty+nTDxez4E2BfifzIY6SJd9azqp0mu2+xQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YywECqo6sTt+pG266IXJQegb7YxJHcWg414IH7kJyZUPmj1nx+C
	MAGN+R6af8xCxBB84nwpJqdRv5ZtuFiZWkH1VcQWFn+axn3MtNyiprpmfU5SbG4=
X-Gm-Gg: ASbGncsb3PqOtvb5jNygZo5iYF2bvl5xEMitK+bufEQxu+spptHde2qWMs+QYXveU9/
	b1mAwj0ugnfhvgy1V8ggeRuIgGKqlds9KqYmOl+ZZuwsVrMLadOTCk2gsGopg8nKqZ65JI+CwnL
	mR/FjGdPMb+RIcgvBAatQEdIB1OnstD3HIVEoIxq03Jo8ZNG03tBn/P63axO6XQc6HVtwLjlpSU
	SBsVBrhGHTE8KZ8uvIq6O+FT/1plyATbaLXjmVolg2ivkW5u1jRQ2Oq4aJVmoum8WS4qzItyMeo
	EzB1w+JCLcfFp2418LRy/62S9xFRpnh+oTO/nQ==
X-Google-Smtp-Source: AGHT+IGkXjN5qtJmkBtIehVIzJHV8dp9lfBLoe92z7LUIF53uF/JRZAl+scS9BRrlB21U+HR9VKQnA==
X-Received: by 2002:a05:6000:4387:b0:391:4231:40a with SMTP id ffacd0b85a97d-39cba9328a4mr15125150f8f.33.1744117147943;
        Tue, 08 Apr 2025 05:59:07 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16a5776sm165820155e9.22.2025.04.08.05.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 05:59:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/6] gpio: extend build coverage with COMPILE_TEST=y
Date: Tue, 08 Apr 2025 14:59:00 +0200
Message-Id: <20250408-gpio-compile-test-v1-0-140e108e9392@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJQd9WcC/x3MTQqAIBBA4avIrBsw7f8q0SJsqoFKUYkgvHvS8
 lu890IgzxRgEC94ujmwvTLKQoDZ52sj5CUblFS11KrBzbFFY0/HB2GkELE3laq7dumlJsid87T
 y8z/HKaUP8JQ56GMAAAA=
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=966;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=56UFcJd+cny+RJSE4ASEku42icOHbo+F8jsHDB/KZXs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9R2W9Gy3ksEsbvwWuUemSsRZ3R5tZGcm1pBHn
 V8cXprRvEWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/UdlgAKCRARpy6gFHHX
 coBMEAC5Rov3DU3OcmZbw01q4M81iTHD8ZkdLXejUs53cDJizyOuTjbIWLlVaitk+oYxbm8S6gT
 CUP5WYG9Qdl0/yC9X4rvX6jY2vmC/nh+9OEPYJKEcAb7aS8bb9L6uv7Lvu/CTl876hEyUirScHr
 bCj/Hkxbap+gL2gyJQWTmm5L1sLGZIlXsL/kQaQvpHvgiJfFaDb/D6l0dWHP1aYLkzZXJ5eqL8Q
 jA+9e6aPIprNMhz5MP3Q20nJbPGWrQuhGrO3yTm+08OQbebq2D8na/HjLkQBP3JURdtnT9rIHvP
 T680bgoGLS0AH0pkxkWpj7zPwvZBdj4S+UjWcej95RfS3RrGNvipTb++9RuJCjBSrGGo3cbtNKr
 td22Kxcfwl7w1I7qtz9ghvgqM/dlHyMQLJN56HYrS2oZSK22c8EGxe6YzFs32N09POpBL4VfePd
 bkK48vhplDkYrAJdmQJsEVZnLJ2e2zG+LygtIfsBY/y6+RGbhR/Ait+FM+x48raiAewYC5ZzWuS
 6oOemIsSBGkL/5GSPoBjivmRQtx/Z9U8K7pWRSKFIvjxI4z7iAt5v3iy8LN2aR+0wDtN63ypL5O
 VELYaZ9Y/pjjVTHM+xvFeyOAQQX5ui4ZTa5yjGTnCjukHgdNzOmzGdFIyh1rhkaYt0TlocSdWYe
 SVHtGRjFC/01PSw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

There are some drivers that aren't build with allmodconfig that don't
have any requirements on arch/ headers so make them depend on
COMPILE_TEST and extend the build coverage.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (6):
      gpio: zynq: enable building the modules with COMPILE_TEST=y
      gpio: msc313: enable building the module with COMPILE_TEST=y
      gpio: pl061: enable building the module with COMPILE_TEST=y
      gpio: rtd: enable building the module with COMPILE_TEST=y
      gpio: tb10x: enable building the module with COMPILE_TEST=y
      gpio: tn48m: enable building the module with COMPILE_TEST=y

 drivers/gpio/Kconfig | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)
---
base-commit: 0e871365f7f9aeb9b590e345458b2083e067cd13
change-id: 20250326-gpio-compile-test-9c42587d903e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

