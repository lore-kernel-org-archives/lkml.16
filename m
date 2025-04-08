Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F24264F9F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 07:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744098126; cv=none; b=WPbd9z7NGeVnLzRI8FY1khlNvGF834wjtq6WAPMdKYioDrEpWMpAhJxAkSM6J/LaHc94IvJIX1Gv2HfNSshwJgnwUWa5pUVzkunYty/yJVpuOcBpWTKh9dcjGNfSYhd1N27qYmGIOwfug8XTjPBVdLBT49ok3H0bvJmH2RwcDe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744098126; c=relaxed/simple;
	bh=lDs8uuZIX3R1BllHLsG6wX7t4bhweRN0/qgCa0AtwY4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JXzdX3R74XE6Neoq6Lkc0ElStVyY5plzKpAQrDyHRKP51sEuCiKLx0Go0xVv8rnCoh30gtGeDch9tM7cuuhlmDOFc7xpvIHVHJwuqU6QhR3Skq91zzvrntoY7Mbwjqfm9EjHWmu+nvyQw0kxx5S+WqCpdeTC1dw/61lcw7DnKys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=yvwqgYRb; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="yvwqgYRb"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4394a823036so48120265e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 00:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744098123; x=1744702923; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5KSliEoaziBiXlj55FlhsxOKjSAwpZNPBiyshYdPCKo=;
        b=yvwqgYRbI07YXo1L1czS2a3pK0tMQfgCaUPgKfhSiT9luR1Hanqex0cc7Bfe1DoqOR
         418dSX9vaQ4umGB8ZUlPKddTJ09VeUTbaznfxG1o8y119RuK9iZQao6Y1UzEVB3tFyWi
         MUkjHwd90+Pla7NW6tfJzgbULUDhJEfnT0M+XUE4CraDsvhMRBKrLNG5n8a1ukqNUMRC
         78Bjwvh6nn9+ob+5P7+G1jNSb4c2ltduKAK2UmDF4sQimGryJhmlKbBibakJTalN8U0b
         nr/Hxrdqp0zqh3nXWNFBATG+nsJCpoZARte0Z4agiziFBw/Ll4oH0IBuDvExL2QLZMB/
         veaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744098123; x=1744702923;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5KSliEoaziBiXlj55FlhsxOKjSAwpZNPBiyshYdPCKo=;
        b=QJ9JrpZf+NJQvKFcAhyDc/B7kPY+NFMVDUcIv88eOFcIBsHUCi6uPT3Yc09ak4lX52
         SXL+sA+20zgctloRKJ+HCO4V95I1rcG2FsB33/jiHKdz50UnWYlabJkADFxqgCe2YdM1
         A6J2MpwpI8Yj6SfCPNg8Mocz+d5qypyXN/phbZnll8o9M+j6fKwrMkH6gPFQ+SbIaoro
         NtpMxacy8eLnZUe/l7mdFRZLNpuezO6J6qGyvkiavWdRFowspcCBKpNo3p6E7YTUUwkb
         HSPYwBd2WjySf70w5L2ld/+BaUTFhi9oo/ftKoPFXTtWwh5jxAl7VfNQSz3uIzRtpD+s
         NR5g==
X-Gm-Message-State: AOJu0Yw+i6xvV0oc2OsJ/RN52I0sdCuXDApj7sGVbVmNslrXZH8CtR7P
	1sWYczCbNYsk9r7j0DYC5o9gqf6Ol3hVbv0/Qsa2kgtUUrs9zCOa6qv9I7QWsEw=
X-Gm-Gg: ASbGncsUm7EWxW2IL52HbyxXvnBN4t/RliQWtWHBWQ75NPlc4eg39GSU1qA58zU4T/v
	7I7v59D3JzFfRK/R+o9/uOhds3ocgyzAnxOYFylmNcWtKoWZzJUoO8vjTipUR8c+9T8QCJBNxA2
	1fzcWErCigf/ohCjY00rLGxWxXu9T2+uRN3a8lIGl56pSndYl/CUNOx9gfdjbZBYNGD3VtfihxR
	YONvFaBSdXptB1sVh+B3Z+UGd8N7QX8kZ3z1DDJrD21lhh5aBXqJFZCx0t9f4dOm4b8jNA16glN
	9W9amEbC0Hrzj0asOsPgpQE+B49IQ0IWd7gnAA==
X-Google-Smtp-Source: AGHT+IEOwLVOTlI4m4uj7zOwwVtrtm680vmN2VG7dTu/ruWCUt9xbSA2/3fAuyKxU4vnMQjWrfnPCA==
X-Received: by 2002:a05:600c:a016:b0:439:9b2a:1b2f with SMTP id 5b1f17b1804b1-43ee0613661mr146416045e9.3.1744098122886;
        Tue, 08 Apr 2025 00:42:02 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3009644dsm13876928f8f.6.2025.04.08.00.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:42:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/2] serial: convert GPIO chips to using new value setters
Date: Tue, 08 Apr 2025 09:41:59 +0200
Message-Id: <20250408-gpiochip-set-rv-tty-v1-0-fb49444827d4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEfT9GcC/x3MQQqAIBBG4avIrBswK4KuEi3Kfms2JSpRhHdPW
 n6L916KCIJIg3op4JIo51FQV4rsPh8bWNZiMtp0ujE9b15Ou4vniMTh4pQe1jC1w6LbFqBS+gA
 n938dp5w/x05rD2UAAAA=
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=829;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=lDs8uuZIX3R1BllHLsG6wX7t4bhweRN0/qgCa0AtwY4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9NNJEvZIMxQPI/OdfZHz33PDWuvxwthdor+4N
 7Kkv0hZmRiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TTSQAKCRARpy6gFHHX
 coNXEACCDtdktaflEawsexSUIwVZ8sTv2djibKqe3xiQN1nbQHEvKQlMWec9YDEwFepuP+4Qs+q
 4ldDiM/F4A5wV5vrsMsb5AmAasdACVaSRCZagqJWAm4d1/T7KH1bDLGY3ZMQvaGFDPtHPv4lpaO
 ulKEFb4CLRUlx7w/sZewdfAQ7y+lIzlqZb3yUhr6uS2ZRhprQCxFDxRuNKssFTF2NYpVsL3a3SV
 ioh3iQGxvqV4/hzl/qOscMMpePkt7kG0GhMc4059nDnz7DkhZXobKQwqCB8zOnyFk6joTb53SC5
 +yb+XR9wXvfJoUSYEGFcdQKbOdztxtpDuwV3xyPifky+53N37tm1k+AHl7jvhIk3mob9agd/W+f
 iSYVve6gvmI+GuFIIaeuJ7l8/YC+Kug207n7o/DJXeYu0odl/nKCfwadWquj6Aufsc4RaMmj+Fe
 tpE4Yc89XmoTU7FEsgyne9fXmRQr1clfrHRFccnDdeSXS9EUGkZBNJ8/ZDjtN3dNXvbW11eUDzy
 RcNTnIL0WQ8nquxadvHhg9XvGzVqnAho0yzfBPz3Cdikb9uYvCBiulgcrpv4EvLwtwueHZXGtsS
 QGfTAQVFIJ4sM78ZjmFqjOCnShk3nHga8KDuXJDMXmNtsmwRkCcY9ZC6FaK+h4ckbTCBay/wM1G
 IitRcqGfkKdP6IA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. We're in the process of
converting all GPIO drivers to using the new API. This series converts
all GPIO controllers under drivers/tty/serial/.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (2):
      serial: max310x: use new GPIO line value setter callbacks
      serial: sc16is7xx: use new GPIO line value setter callbacks

 drivers/tty/serial/max310x.c   | 7 +++++--
 drivers/tty/serial/sc16is7xx.c | 7 +++++--
 2 files changed, 10 insertions(+), 4 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250327-gpiochip-set-rv-tty-0e21feb044ee

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

