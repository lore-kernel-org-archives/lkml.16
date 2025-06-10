Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17872BCF6A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749560336; cv=none; b=jn3qbYLekG8p7joZxTFiOIcMcjhaQFKRk9Vl6Ohf+BnAHazwONeFTeCyMiovPpTsQ0s4R6j80Ged3HikOppUM2KNDzhmsMW68i62sPv/W0ZxuK8Y33/kfDg0g3CFFlQxt8i2CkUBhEyArNts+nD0gpJpxFHD4T6Tai6NRwWwtAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749560336; c=relaxed/simple;
	bh=05OIsI59Mrk5Bva8tD3Tj97OCifK3I9bavdc5XUI98c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MOmf3RYRiilbPcuF4Kv0PzyHjUhYky+rRJpvgBPk8+vAmMq2B85KJDc6qBiETNyh3wA3DlXXQJHbgogcAP8j+t8888XCP5mwCjz/gUwKLZC0ms8bQM8HIxAUdx7IiA85g3nd3QHLemqAoh4nCn7lccZfSpN2Pe3UTt7RRn8WrjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=UNPnTrAN; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="UNPnTrAN"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so42252535e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 05:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749560333; x=1750165133; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5x+mnEUir4fkDc+MLWw6JgW3TRK970S3tDGL3/yrdqE=;
        b=UNPnTrANHP+tbU4brgORZEYbqIkIZFC/oOQYz/qxyRmvB+DuTPgiyc2MEmeigRirok
         DF7V47AxfOH6pvGhwX0CaXwXDdzR+n4VOG+wRqgozGLWWMsx0RSh1n/GZIfjFry8/xYV
         /74v6k54Yi0Pj24XTZmk1svoxbvdCJA9TqCawoCdqpLgVHWKVIbmYefV+QzjlAVnzUHu
         2OoLXLrCScMCXUvFkwDeJuh0Pm+Al1JfTahbZSPCWtRtE9L1QC/UjQWYkXTlq4hgRP/t
         VhRyvG5IMSz08FTnhJvi4vHQMKqSt/G/u7Hv3ZEkeDze/JOwR/0enZTeHjRZghTfpyr5
         Dw9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749560333; x=1750165133;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5x+mnEUir4fkDc+MLWw6JgW3TRK970S3tDGL3/yrdqE=;
        b=hB50R1zpkUSNWKhf7zfeq6Xa2LS/Ie5V51/x1kACIndElP8D2SnURjMAGCMH1gvdiw
         HV1NiLYYz6YZ2OnjPP5JuAehTbB7m5cJUqbG2jwtJcQepQkoxSNgwr4AbFDzcWeStXGr
         D2i1tn1MJ47qLlAlQsniS6AMOPgnvhREBiIT07NolxL+efVgRSGJab7Djo5xR7DvcTlt
         9c/oV+D2nyNUungXihYH9YlUJyZrb/GI4pgA9JSF6ZmsdiAUtTWYIrDnspuWcBBq36fH
         Rdu7lck/pM7noxKOasOdvFmI2qWrYGR53IYfIxHabDIjK1+PO5b98KHz3i3MIoJxKKWY
         VRoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAi9RdVz/z/XDDxsAUBCi3rX/KIGITF1QvCAAaP6Cf08ROkGLyy9cXCjAEkQgQnt+TUQtSTMDeOPxubIU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnlmwTVUWWUyrGAueBVQjir8R+ZBB0MmWh9QI0qWjBW+sZbD+e
	8o64o2djNAdwO9fjzp3ZjNl87N3RGIxvFdeXOA2XA4DxA1anwlKjQayg73T6LWIxJZ8=
X-Gm-Gg: ASbGncs/ZWj5eE4OJf94JmyWOQbWDqWNFvjyzTaWwwz0u/nL+YIlB3tK5BWlF5d8Lmg
	LPaqTo23qtTTX9YDaQw9+r0lEVc0MpYV4DA71uPK2KHJiecor+wHxzxmTmBmyONgs4sNF1rjkNz
	1YVq8VWdkJrpl3Cltdxk3nJz5AiwlLUZzQscFGXaPOW/8XUMGgZYeaioqboNY0TBJZEP56D6vZ/
	sFp2OEg6dDSNkOaI08cjbB5z6H7rbRnpMSPl1dZNtNsibbWeb3+LXK8EJ52m33ZRpv3q/0xrveV
	9K/uruMke+4+KklpWA+0ZIcSq1epCTMXgOhAFjNpBKGEWyX5Zq1srg==
X-Google-Smtp-Source: AGHT+IEDGhvv2nDonOgnsKogzyq+swTtYxyvrREWxOsZO7ZfnDXOt861Hu1/sqcb1L9f+E/RkUy0oA==
X-Received: by 2002:a05:600c:6388:b0:43b:c857:e9d7 with SMTP id 5b1f17b1804b1-4531d6fdab8mr27771825e9.5.1749560333059;
        Tue, 10 Jun 2025 05:58:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45209ce17f9sm143671135e9.11.2025.06.10.05.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:58:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/4] pinctrl: intel: use new GPIO line value setter
 callbacks
Date: Tue, 10 Jun 2025 14:58:46 +0200
Message-Id: <20250610-gpiochip-set-rv-pinctrl-intel-v1-0-d7a773ff864e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAYsSGgC/x3MQQqDMBAF0KvIrDuQBG3Vq5QuJE7iB4lhEqQg3
 r2hy7d5FxVRSKG5u0jlRMGRGuyjI78tKQpjbSZn3GCe1nDMOPyGzEUq68kZyVfdGanKztL712S
 Dm5axp3ZklYDv/39/7vsH9i9Hjm8AAAA=
X-Change-ID: 20250610-gpiochip-set-rv-pinctrl-intel-e4c791f29a84
To: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1217;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=05OIsI59Mrk5Bva8tD3Tj97OCifK3I9bavdc5XUI98c=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCwIneW7R5vtD6ViY12SUc5xejQd1zdzdl6kq
 JkcgsdGZ8aJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgsCAAKCRARpy6gFHHX
 cp6qD/9MjPEZOmQOG41wPugteoUMZCe9ji/YPVIB6hjg7fEVeqvtgIHdllHZ8TCpTjzpR3t0pFk
 JzCJnYI5d9xlRpRT+mvtcL5NDADpPBF9AARaWSNhhSC31Oh+4y+I/4buapM/IA+eWxgKT2jW9Dk
 RNO1JNnmDWkShDyf0H0NetzDjQbKZ7GtFGORGjpmyXmHwX8L4PHFG7h7uFx4dp0at2iFNRTfFhM
 FZGvuNpR/rcf5wm+ScScdRqDbmK/+lGhp5f9VIQH1jvgPcks897XRiQpFdBpYHWs3jQrizqt9R5
 q2ZWeafbI3un1twJ3DxP0Ui7W9iCE/nHtRFpYY8mPxcHDl82Hjg+tMCE/ZgfSQ6YsEFe29Sgjij
 Y90NMpeZ0shXHExstEBdEQi7Fe39TBRLT1em0Z25LwaP2kQnYR/+GaGd4BBc/ZOWdCEjk7UfFJM
 thEGGx15Gmm23lsHSXM4rjE2DSiKHISzqUeBmZYTFlOEPnCqyh+rNFkbCPM68TGvVmPejB1iOAp
 NmF494nukwcKtVrh/JG5+lMOHVr8+ITVMrvFth9fvtZNfuJIW3Pdjpw/USJ9iT/vnEuyaetJat2
 bC9GEo8OVogqBJHcpS8kNV8LcIeSXFJzmvKYRDKHeYw0m7U6/6PhkLP+BD4+MXjTDBvEUoVYof1
 VT10eaWljz+Sfig==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. This series
converts all GPIO chips in intel pin control drivers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (4):
      pinctrl: baytrail: use new GPIO line value setter callbacks
      pinctrl: cherryview: use new GPIO line value setter callbacks
      pinctrl: intel: use new GPIO line value setter callbacks
      pinctrl: lynxpoint: use new GPIO line value setter callbacks

 drivers/pinctrl/intel/pinctrl-baytrail.c   |  8 +++++---
 drivers/pinctrl/intel/pinctrl-cherryview.c |  6 ++++--
 drivers/pinctrl/intel/pinctrl-intel.c      | 19 +++++++++++++------
 drivers/pinctrl/intel/pinctrl-lynxpoint.c  |  6 ++++--
 4 files changed, 26 insertions(+), 13 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250610-gpiochip-set-rv-pinctrl-intel-e4c791f29a84

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

