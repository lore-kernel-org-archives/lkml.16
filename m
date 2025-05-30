Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6505A230BF9
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 14:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748615371; cv=none; b=juEmH11M4VM+xE7qun3vKq51ycGmp5sx0eJaN2MjGwBxtVqQxuYNwRM0/k5kFmvBkH9L6ZSusSM5EhAaa1x/rhFR3vQnLLE9mguE8ZlFo3Let4W/wQvyPE4Yv2oIYlCKWn8Lz9igWds4kfdmVfHbDmvKMTKWusvGNrU3kjrKli8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748615371; c=relaxed/simple;
	bh=rIK3waljLR/fjrG3pLbMe1YHZ8NPs75JNeBxI+CrkHo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MvRdh4XlhU0fJSfaUkQpMKbCwEhJO7uNARqKLC2wYahCYczb550dEAcZKN+pXwbYKQOrbKxROBvOBdIDLnY47GHb0aStfLmxtmY0v9HClIpkTo21HssjQB0ewDz1FHihhLpLB4q9HpETAZbQE7wplCJOHQaB9cxQGNBze3zFUMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=V1bBNXR2; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="V1bBNXR2"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a36e090102so1187544f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 07:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748615367; x=1749220167; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fry8EoRGYXADxHvT9pFJrNSVR8dhwD8t+hXmtglUTHo=;
        b=V1bBNXR2XuOVKTXFQNzJRExkF5KAQ8nO5bhgMOY9Jo3aWfmNA1TQ9C8QW6+5QMRdxM
         PJOUWI6ogmP9vUEXSUWD1IC7bHvetnjZZW8BOV/ocWOubuhZPGShifOUC68BHEyN86rX
         4choYtWVpaJqsqDmePCCQgKkhR9VPtxqKhtXlNBS4WAtu/Yh176hYyK+g+KaO3wqgWsH
         4SdPcYczWgg19daKZXzPU2cCGLv2Tl03BQCFg5pxY7oplhQaQV06bxyFeMit+aI9qaTe
         LpG2Z37vQ0vGLZOOutk1sw3sROqZX1iCAlyKvkEmTmd8uamKylSM1zDRc0iAmsmI6Khg
         V74g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748615368; x=1749220168;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fry8EoRGYXADxHvT9pFJrNSVR8dhwD8t+hXmtglUTHo=;
        b=FfZL2WptIfYscBL4WDYNEE6QR2C+rsHUO7t89w7cxe5jnKr6WcTDzBU4/jstYbKZj5
         pI3JsCQ/K+15ZkcKTeQXGoVE2Bc7G/crZL470j/TZxADQE0taSlvz+sox5smOfIOAsy+
         vjbnZdBjVX5DcJgkh11ZhCIIDFuANSuRO5RBIhOQ/agAEIV9MnDfT2LMbL5ifyBJGWsa
         EpVSPmfpaw4sWAk9wCK80y7H6VOZMFW7bktj+pPflbIbKgeGdE7auWB3pFTJ1TZk0OdP
         inhwdvd0UxTca9P6RHdOK3htb9mchRnw73kmrG5WCDgSgpyz7j6eB25C4f7DCAwCAunK
         +m0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXhYyLDArVheUEUbTFNFV2IyPzZ+WmKVB3OSvCVwcvW95AaiuGDzFM6mQa5tNaELlYTEbozu/lqk/I5GsI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzK1Zp8SCtLBpU+osqtbDHhGY972wMiACZu/Cw+nPQdvZdkHqi4
	mw4YUfdey1Xo7K6vzWNx5/4RrlMQ8Hj8SYo1Xra72/N5goFYcBM6gsY2rTdMD+sJMvA=
X-Gm-Gg: ASbGncuLZSGwZXXaiNA9TApDBZH5Xc9h+fZlUb7iq40RY/DDxBJPiZGJa44bz+2mzHC
	Mu3u2XR7LhKIHdZOePNAzffSspn/PyXnWMahmuP57VHAS1fqF00B7jnF1JPPaShi+Z1k/kNDkci
	z4UV6GW+FYgXsd+PJa2ko3NZjjrePo4jfDQZQaXtlPGD+qKwQMeSshT/07BwMosj8w+wR+QhMAV
	TdiWj+Sp5Wd/WQQTUqq5Ocv/9T1B9udfsJRB7H2+Uvo0h3l/LM7XXt6vYyWbbSfoVxnQN9vgpaE
	zH1CmflAl4yr+0SBkOCmNUIDUxOnRgpA8C3RR2+pJT9WeB5+RL3Da/stdeOGixrpdC/ylT7BEOw
	/y2xttKZcLZLYguIgM6mvutzGcEEL3H8=
X-Google-Smtp-Source: AGHT+IFyD1vZ35wqGpI6Aklg8LYxAbef6kulzWJMlMm0iEgURUY6T4yiqBz7bO5ajBNrPSUXmDGzvA==
X-Received: by 2002:a05:6000:25ca:b0:3a4:df80:7284 with SMTP id ffacd0b85a97d-3a4f7a0234fmr2964955f8f.1.1748615367604;
        Fri, 30 May 2025 07:29:27 -0700 (PDT)
Received: from [192.168.0.2] (host-80-116-51-117.retail.telecomitalia.it. [80.116.51.117])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00a0421sm4979870f8f.97.2025.05.30.07.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 07:29:27 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Subject: [PATCH v2 0/2] iio: adc: ad7606: enable Vdrive and Vrefin power
 supply voltages
Date: Fri, 30 May 2025 16:27:55 +0200
Message-Id: <20250530-wip-bl-ad7606-reference-voltages-v2-0-d5e1ad7e6f14@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGvAOWgC/5WNQQ6CMBBFr0K6dkw7kSquvIdh0ZYpTIKUtKRKC
 He3cgOX7+fnvU0kikxJ3KtNRMqcOEwF8FQJN5ipJ+CusECJtayxgTfPYEcw3VVLDZE8RZocQQ7
 jYnpKgNpfmhplp9CJopnLhz9H4tkWHjgtIa5HMavf+oc8K5DQ2JtXmrz0KB/WrCPbSGcXXqLd9
 /0LL0Cvj9MAAAA=
X-Change-ID: 20250529-wip-bl-ad7606-reference-voltages-26f49520d12c
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=806;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=rIK3waljLR/fjrG3pLbMe1YHZ8NPs75JNeBxI+CrkHo=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYsiwPJDvd0WwoMIzeuafY5k+D/P8ZR78ZzR+r7+zZFOoo
 ++Xr16zO0pZGMS4GGTFFFnqEiNMQm+HSikvYJwNM4eVCWQIAxenAExkii8jw5JOziX9lc0Oyxx9
 Hy4uiD0XtdjD1qjT9cbdXLvarStnbGT4nysVlJ5nHll99HPZuTMLPoiH6j8LW31HaRKHk7KSSHo
 7IwA=
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

Enable Vdrive and Vrefin power supply voltages. Related fdt properties
are already defined in ad7606 dt_schema.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Changes in v2:
- fix "ret < 0" as just "ret",
- set more appropriate error message.
- Link to v1: https://lore.kernel.org/r/20250529-wip-bl-ad7606-reference-voltages-v1-0-9b8f16ef0f20@baylibre.com

---
Angelo Dureghello (2):
      iio: adc: ad7606: enable Vdrive power supply
      iio: adc: ad7606: add enabling of optional Vrefin voltage

 drivers/iio/adc/ad7606.c | 10 ++++++++++
 1 file changed, 10 insertions(+)
---
base-commit: aa1b3efb8425b572d67df2f5d47ee4ed25571428
change-id: 20250529-wip-bl-ad7606-reference-voltages-26f49520d12c

Best regards,
-- 
Angelo Dureghello <adureghello@baylibre.com>

