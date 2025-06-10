Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE5C29A30F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749559135; cv=none; b=e2uKcn0LUSmxCS5RfeEYSGLDt1/sUmhWCIwfajoTJhjXgwmN3IZ2/jSQw8756DVNtZm3osjFM5KimXIEm2k3Iv69dcI7YtihswaF3VW9t4/VMgC6lLvAQlN1N6PSGitj6LRtiRH2msQVrn7LfPfHFM1kKLoU1siUchLUXbkFawg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749559135; c=relaxed/simple;
	bh=sGr/PNAndJxKtPVU5XNTYT21VZPL04qdLeA8uRGJeaE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LYeutlZ6TouGLWxZCKysd+u3aQ5OxNwdr/B7DokGo9b6zDbvG3bji+QVHW1CkxwUHkqjqkq+CogXHjOH+CLyQV4LXhS9UpGCF9LfZZXWyqGwwgzWnjPTvIr2ZY9hZ8Jh5o9n4+bqSSKB2pKXWuqatMD2nO8E0uur7J1enndY+8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=npQKOjWj; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="npQKOjWj"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a510432236so4228971f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 05:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749559132; x=1750163932; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rU7/4my6HqhkT0+Lx2O0XgxysZx4KZxVdbslyauHUzc=;
        b=npQKOjWjLURUeTn6hFa1JzLNNFJE2Cs+FLWyFIfPvRtm/MVZH0LQQW8XJ61DI7Mhf5
         IwrOdPxZYw2RdxYVqPGVkGishj2Pf13Jcyiwx8Z169xWyNgMGa0EUHmnfP9kmRmtvhtr
         OAWZJywIdF0PGc9TdOj9LcaLEXtJCeCOnP/8LZ4b8+ByKf0GAXK41yoZWcV2gDPe0TcM
         IcDsqMMVnmcaiFzn78jT7R9saU/R+Qfg54UAPk8y/dTA4L/9DebR/iSVoIz92nYC5eiw
         RPkAnPTCAgyBPSaqH9v67XDr89Eq1wcyRZkxQkJSq6vgH4o/Tgq811Uq8S54CYZ8gLbB
         K+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749559132; x=1750163932;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rU7/4my6HqhkT0+Lx2O0XgxysZx4KZxVdbslyauHUzc=;
        b=nAltPqsoQxnneijf/fa5a/q0ZSEw2uOWvsJkXnrw98kSZyYEMXuMYsJPuNc8QXLQhK
         tBa1sTbz6HMZWb/le/LO9AXadnb8d3vISgYDh7osWsfY+IBTXFscp0OUmCHaeuRqFXla
         DUSNstdvH/bvKPq/Gi/IlWz5UfBszpjaWWBYbTpKybS9zNku3eGeFYJzC1PYm0u+inTC
         cbH8BpWQK/84qfZXSlwzL5U4r80u6BiugZMKGqY9sDUG7CMgIccTa3u8R7inYRC62fVd
         u9GvDVqzXEF+5TOqtGaQLnUmiORtfLn0glFRRuAqSk6Jizy4QRQsClUvfFcwBEtDK2Y/
         1zWw==
X-Forwarded-Encrypted: i=1; AJvYcCU8Y/7VWz68TOnASKN1yOVcNzgNFrlC0TP5yusfah2HDDL6T9KEkl3ZhzTR2jBT6ZYuML85EK2+IjngWzs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxKgCa2sLcldKS+6S3hbeW0OUxfVvF8lrD6mUpdcO7sPrIQvVG
	C3DHctdIwkz6C3I0Wl7lALLA195NMZVJyH0BagU+/cuJkxrmVnHlDstGMOPa88iLdtI=
X-Gm-Gg: ASbGncvXZRF/2uuy726YGv3SafnJm2zogNo438qF0TCZkZ6VQZ0GG2pLfuPNvus5Fy4
	keVbf+bcgZdkko0uxH/yt1YcNmyhmBaw9MbWMPTTxbTwKF4AZe6jtwirCXb1Td4OlIzweIrxMRN
	RobUGcYc/yHmqxXcbA2CSXU7Xb13icnTSdLQ4rR82+J872GGzTC/fvcRajkKfBoZuKskKWaUiP6
	EOtJYE/FV5Z3DxKkqBg7v+f5N8mUIzH7dJ3uDdOQ+ud0Ul0m21Jug42oWVZVRYz9zzpI+BlokUw
	YXyjQlvzf8n56QwUXAK9xCBcvHJfI0uU6Tt7fSk7US4h5v5LydnMVop+Mura0uc=
X-Google-Smtp-Source: AGHT+IFUBxicO7hQVJhltf8pKkjk8eVddbD5uhxdka17FsMWwGoc9zt6HgcPXCEgQzPEEyRBJN+3Qw==
X-Received: by 2002:a05:6000:24c7:b0:3a4:f71e:d2e with SMTP id ffacd0b85a97d-3a531ce8887mr13210295f8f.56.1749559132270;
        Tue, 10 Jun 2025 05:38:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229de7csm12374676f8f.14.2025.06.10.05.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:38:51 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/2] soc: use new GPIO line value setter callbacks
Date: Tue, 10 Jun 2025 14:38:49 +0200
Message-Id: <20250610-gpiochip-set-rv-soc-v1-0-1a0c36c9deed@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFknSGgC/x3MQQqAIBBA0avErBtQM6KuEi3CppyNihMRiHdPW
 r7F/wWEMpPA0hXI9LBwDA2678D5PVyEfDSDUWZUoxnwShyd54RCN+YHJTrUlvQxW23PSUErU6a
 T3/+6brV+xtJg+mUAAAA=
X-Change-ID: 20250523-gpiochip-set-rv-soc-14e1d9414f70
To: Qiang Zhao <qiang.zhao@nxp.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=923;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=sGr/PNAndJxKtPVU5XNTYT21VZPL04qdLeA8uRGJeaE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCda3jdxUjB3y8y65I+EGMTPUKfUhIEDVrAHr
 JBuGF9gOJ2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgnWgAKCRARpy6gFHHX
 cs12EACyEHdV65zoM07w3fER71x+bL/lzzv9ak6UL5WWCzMWUhqXM9fuKnO9LcmVm7mqDVNveiN
 AUdXK0/68zZkddeVHu3ENhI9tm92CrnaFx1V2dLwfSBZ7ASs5GEIXvbV3X8Dni3dGphkpvJ4Xny
 gacdtzbCW7nrjji3x1moDcgcET9rxgkmlmmzMcT8+avcRJ68DS3xkcr1GQKPM2RQ/PoKKiQa4Ci
 G2NQC5B3wBRVHkMAz04e7aGy1UOxNekQrxf+0QzO5zgfVb/oo/QF4wqd90GNJSlgjrDlIq5D9mU
 /nJn7XnqWUim/BFCyBola7xRLAr0tdrRKwdmrDdRVULix6Z0CXPXoUgNg9WH6ZSRAgFjSpQRCrB
 vnPqDPNpD/kpE3zZ3W419DvEvcfWKN77fmoIIlgEZt52ZAUV6qc0kOeNxbnEt5JZZSDfloLKTel
 yxBEzzydWWDhu6eCO9iZ+sqZA0266BG1djyrNkXJKzayOLu14ADuG2ul81SZ1DozyPTiO1PIXse
 Z5+pwSdNtIhCqSzmPK3Qod/pzzh/DrDzvMbfB5azT2yP8RymRe7ERcn8iVfr0LcAKOozsb6tx8l
 SxZwGqbUdg/HDLqLVXMx7GWD55Rc+O61o+zkaJxX2U2+7ElCLC6F7YHw6p/4rnKaU8Suw50DagU
 mF0i2p7lsP7AuBQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. This series
converts all GPIO chips implemented under drivers/soc/.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (2):
      soc: fsl: qe: use new GPIO line value setter callbacks
      soc: renesas: pwc-rzv2m: use new GPIO line value setter callbacks

 drivers/soc/fsl/qe/gpio.c       | 6 ++++--
 drivers/soc/renesas/pwc-rzv2m.c | 8 +++++---
 2 files changed, 9 insertions(+), 5 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250523-gpiochip-set-rv-soc-14e1d9414f70

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

