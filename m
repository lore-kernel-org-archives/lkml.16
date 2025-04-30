Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30638211A35
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 11:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746014185; cv=none; b=CHUdZ+b1CvLBhMgN1CdP2DWjlu0FY/APzaLpev/37sorM0eej+Lyr3TaMi/XJNiKOLa0tuTdM53u/PiEsxTS9Mnqr6EZleb7DjYMVpj/XKW05x5JbAErZzCG2a21Rer/0br2+DX0MlOkowIcyikEX/bqkFhWC008LAT8Tm/YGwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746014185; c=relaxed/simple;
	bh=+DkcJUUcvjZeQMMqsoPFA0SMW+ilrUpwRUdNYgKcY/w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NB3fAbVZhzvS5PT2+W/l4O4J4AuMOaieLw+LnM/Dm/vu8Op6ehp3fvbWOn+BY7W8SMG+Vt1CvCGaYfGgsHf+NRzfVriS7gX2ieMDNInxoyvEKHNwxD44jqPAIQ7VpmYRsEsT9RnYqv3DVJVIQBCQOAYjaIigXJgc2iq2tX6Dkl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=kdIyckdR; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="kdIyckdR"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso35562675e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 04:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746014179; x=1746618979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GohQdJZxAc8Y+aN/5Hw8gvn3YsSdchhiUeIPWILiUng=;
        b=kdIyckdR1UAKRvYRqT0A2xjg3y99aiUO3ec76HOC3M4pUyRLm29jPu3fvBi5BokhXb
         DMSMgIWo+KA2frvsWz7I2r1rxuNnUl/Avx6goYs1ytJQBDy7GfBSb04wXoYrYjQsUk/0
         CoYf9gR1fPkd/njBzFZghA1TObxoX7Rf+Fntswz19erzEHUf8nylmKSfExKSfdN+DsHX
         wj4gVzRCGG3+LTV2J1Q9FOqVEKKAoBExnTVcEM5ltwE7Cu7qAdvU72K6+GuzXkNjQS6j
         11GpVuuEkAWG3YiPIUSv3kVfV3eKrTHMZolCS/qMv+N8scYenfBXq/xfRuWf1RlBD6Le
         Ur/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746014179; x=1746618979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GohQdJZxAc8Y+aN/5Hw8gvn3YsSdchhiUeIPWILiUng=;
        b=eRHTgxqlWLfcjQSs/G48Dfc/OWkJPu8PKgQCQIGMC4PY1cPWPTfV+s4MoqjXm+UcT/
         EOcsvvdXZ+1jJsux2d//QOgdXStaVjlnNzX5qsupdQw49C83x1xciXF/TRrCHxJUMKuN
         gZcggQG90PDhmBFpbT12k3AnvHEERsXBonbiZmYLdNd3H4RjUEZsrl6sP7yFKadU8R89
         YlGxrxYJUiTe4Ixl0i5L7i5pO1U9dDE+xaz2YKtPM5TYuuSn9JQKMP2wsl5a2KC4oHF9
         1EAg0SsqQduCbZ+ZXXn0GJ/4/bAmdrxj+AoLFY3aG5jyxJEdnThtGEJwWoyq9siV93sp
         I36A==
X-Forwarded-Encrypted: i=1; AJvYcCU8aCYyEiQ7LJYZ2f1ALFFEy2ho/XafrTOVkhHxQJkBDkenmyNq8aaWxRjwjrWBsmo/KVOP1Hm6pYglaaw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwenBnP6ZnpNaF48NIQdmIOjh2lr7LgucGk616bvadjG5jQ/mPD
	PYnt8URsQRsXldAfNELFKF7W9hJUaOS3u3sNkZgB3SVgvpcfnbNHa+xWL1sTMXI=
X-Gm-Gg: ASbGnct4DeefNPzBMb4sUzaFVKBjDr7i/XzEAcZEHOvn/Z0jlmHi5YCVhzpZOWzr6Vn
	dwkb719ry/JMWfDK4loTb8JwfQBeqDmOJvzU62p/8rL28InzZ37X3SjNkGkseC21MLkQg72OTBk
	y9sLLQDuGc1lJZjrR/u60KqFJMW03ip022f6hjbg3MYXomTtaem4IH9F4498HYac+i5VjoAJMJ7
	5RKlGDsJUyqs/8sQkZpfA1fqMRMRT2oMRvA93wEwwLCimHDoqZjRFiEe/JJVQi8a4KKFBNRCdUR
	Si4ewpRF/hIfTzfLWr3yY4ri9MFLDwHk2pu2E4sCm4pURIe/X6DIUIYipcSHZT31gDNGzMR1Z0l
	1b6cYdJI=
X-Google-Smtp-Source: AGHT+IEFUxJ3WS1utlqV3dUgwG8Ke3V4D4/4+XSpcrhNtH5kcCGmSwkWKeP1OKP5WBD/Gq6BCFoz1A==
X-Received: by 2002:a05:600c:4f01:b0:43c:ec4c:25b1 with SMTP id 5b1f17b1804b1-441b1f5b8ecmr23207415e9.23.1746014179328;
        Wed, 30 Apr 2025 04:56:19 -0700 (PDT)
Received: from localhost (p200300f65f00780800000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f00:7808::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b2bb5ec8sm22522495e9.23.2025.04.30.04.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 04:56:18 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: David Lechner <dlechner@baylibre.com>,
	Kent Gibson <warthog618@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/4] pwm: userspace support
Date: Wed, 30 Apr 2025 13:55:57 +0200
Message-ID: <cover.1746010245.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1504; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=+DkcJUUcvjZeQMMqsoPFA0SMW+ilrUpwRUdNYgKcY/w=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoEg/OenXMSbEhIAiQ3asN3UyPcph3/OJSxaPPs EoaKbzFDJWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaBIPzgAKCRCPgPtYfRL+ ThoiCACDLpGudfttYVlsIvqzM4lEf+ATXZTPxXP68F6gKP3MJpjM/SxvxvcvJ06UKmctxt+ykRo EEGe1GgisB05tOntMASuo1TEzlOxSIsgX31V92CJArJ6j/V/+IlEiFgyn5dm2fG4FYHfO4LCXhW Bepgs52KMDBaS8eiCENsDYyFSli4EX9pWsSJ9qtAhocdx+y+r2B7/OboAPlcpxua3tFrWySjwIt iMqvxxnyTPTuqTcx7E1jzgOtbQO1HYO8zg8584V/TfJWX+Rg9UpfMFy3uUXm9rr7xeZyNpa8pFW STznxVQ3kGvBzTxskzU9/UCkJ6eBxCr09vwnbYA//M1+AHX4
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

after the feedback I got from David on v7[1] and some internal
discussion here comes a new version of the patch.

Apart from rebasing to a newer base (current pwm/for-next) the only
change in the relevant patch #4 about return values from the
PWM_IOCTL_SETEXACTWF ioctl. Instead of returning 1 if the request failed
to apply exactly, return -EDOM.

The earlier patches in this series prepare that and implement a
similar change in pwm_set_waveform_might_sleep() to simplify also other
users of this function. Patch #3 is only a documentation update that is
not strictly related to the userspace chardev, but reflects the changes
in patches #1 and #2.

Feedback welcome.

Best regards
Uwe

[1] https://lore.kernel.org/linux-pwm/20250416094316.2494767-2-u.kleine-koenig@baylibre.com

Uwe Kleine-König (4):
  pwm: Let pwm_set_waveform_might_sleep() fail for exact but impossible
    requests
  pwm: Let pwm_set_waveform_might_sleep() return 0 instead of 1 after
    rounding up
  pwm: Formally describe the procedure used to pick a hardware waveform
    setting
  pwm: Add support for pwmchip devices for faster and easier userspace
    access

 drivers/pwm/core.c       | 369 ++++++++++++++++++++++++++++++++++++---
 include/linux/pwm.h      |   3 +
 include/uapi/linux/pwm.h |  53 ++++++
 3 files changed, 404 insertions(+), 21 deletions(-)
 create mode 100644 include/uapi/linux/pwm.h


base-commit: e373991eb9ff0a9617634017c7f19fd36ec4f208
-- 
2.47.2

