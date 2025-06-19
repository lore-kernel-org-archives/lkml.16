Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36C4265CA2
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 09:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750323780; cv=none; b=eCqT56kCxW+yJEGt75Sc8DhHPzOtFSQItaoPjyK9qqR1ogp+gJByo3WOjzS7l1nVLLaDHpebD3a8OcDdrxYFsCUv/EMuTuu7rEn2hCUc48wLQp2BC4ZoVzV2ryISSYZn0+3okKadXfWu+jck/ALqo6EpwygZ2nPN+wjozLwvlYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750323780; c=relaxed/simple;
	bh=p68X2LwCukixUyKxNtKjThY5BUyTXZHMnFUBGp0QScw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=J9yqOObT8KsE19ennO04uL1iNYw1IRcT5DsDjZ4QgRA2BHGZU785WpaBCxuSA1nQ9aMuhydwcttiULqXUXaHKejkQg3AYul9ucsLiHRUZU/MssQFUKmfURFTqqZe5r2VU4CgnbvNVz0ap9ezEMpB1hiY1IxMkfrK4vzQXosSh30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bztpo7PG; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bztpo7PG"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a54700a463so294543f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 02:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750323777; x=1750928577; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DusPyjFwA6hQUAOLAD+62j5hfi8cHkigQfHDAENKko8=;
        b=bztpo7PGFWGOo0MnpW5cqBV60KndDVA7f88dcwff90pVDBdKvRMkqVONkvztXQQ1S5
         h4Y1NmCaVcpHgPM1Dg6dUgr+N24Tn4REHeAyRauu9szgH+JmRmpeeh7YycrH3lQ6CgoP
         fWZL5HmsIA169BeMKyV53R9YCm53rKEEO9CN/tAGH9IF1UeTI0cb4tb84EsczT+sWBaN
         btR8yHiZQlqpY3hlUHKWZdq7Y+54EsRT5LeobsEKfx8ZIqW5LVEqDqC0/eS2IlQdZVbw
         ni4cWx+Byf1EataG+W+W+mG/DD38FaLvuIcYtLpltY//glRRu70ETrXayEtc/VEnvj3W
         iG0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750323777; x=1750928577;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DusPyjFwA6hQUAOLAD+62j5hfi8cHkigQfHDAENKko8=;
        b=SPjsAcCjp0G5n2MLWzkFlYKhpFVoavQqLBN7aGAnYNEiuvcudGcncR5j+MaGUctZP7
         J9zFYI1svCCVrCJSyI2t6OvJXONy7tG5uPfgXPE9cEjh7k/uU5TtYKVWmYXri5vTCszM
         C0BTc6Lhz9IzVlx2+JIz0Uf0mujilCqsg5TkTj44b5KbKNNoycN9QcnoONBbbtWFBwCj
         oRNz5SnV6EaP299YyuYOCkEHyp/bAAFWHRzXdpZ/JmJAG0PpeGc3RvdDW5POpiINUF04
         /lhJDJZlfYg+X2McFK9a3me6ISmMni8wYZTb38fq7TsJ1tOx1+DFwt1Nbsitb6oDu/CF
         hgeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcDwzwjwv+mcnTLu4qear+P6QgjfM9JQBX0DLVZIbbISpTcIhG4/bs9menCGQMA9UpFg8J9M3sMrpEHn4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw0meANNjlsLByjMlvEGGVZKGysSAq/sqrbMlufozI+n42USyL
	3t4wUNgbajd+rp3lR01wJzx3Euh1bO3zwhESQTD4siiAoyqtBVzOPfSqwczIunqa4zzKUCDn87K
	jPzAhUjI=
X-Gm-Gg: ASbGncsVDAgySaYFhvKk8atA8We5Q2nOZN5jd0xHrX2ner8SQF3xwmVe5jm6pV4wPM2
	1elsiF3JA5iTBo+ytkoaW8iptM9RiDnHNaRuFvDpBlzJg1s4TGqTl9yx+FSoFj9wlsGylhXPN6L
	AGcgZ7hv1U8Ef4mnp2kCbeJIuiqZT3Td0+TmYjc6w/K9CimdEhXA8IsahhFsDzFXCYfm9yemqLJ
	ZLmglxZOUavUcuUJdBvDduO2Hy81R/k24n8y52lKJvEZC6BjeYqKejxyLmiAekVbM1SFDsDLoBT
	hesrHewklzBR0kaQQFeF0Sc1QkCRSKU7xwShGGvkeTqjTLDx+noy1njg
X-Google-Smtp-Source: AGHT+IGvE5L837+Dg0xhWf5Cmw4XLAlAsHE88dQx10xuxUobHFHpSpEqxC+bUzkw2NgPb1hll5IFsw==
X-Received: by 2002:a05:6000:1448:b0:3a3:6478:e08 with SMTP id ffacd0b85a97d-3a6c96e5663mr1961814f8f.23.1750323776675;
        Thu, 19 Jun 2025 02:02:56 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c485:fe15:c9ab:c72f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b798d3sm18874645f8f.100.2025.06.19.02.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 02:02:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 0/2] USB: serial: use new GPIO line value setter
 callbacks
Date: Thu, 19 Jun 2025 11:02:39 +0200
Message-Id: <20250619-gpiochip-set-rv-usb-serial-v2-0-8c43e4a4c810@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC/SU2gC/33NQQ6CMBCF4auQWTumLcWIK+9hWNQywCSEkik2G
 sLdLbh3+b/F91aIJEwRbsUKQokjhymHORXgBzf1hNzmBqNMpSpTYj9z8APPGGlBSfiKT9wNN6L
 tbGu9N21FHWRgFur4feCPJvfAcQnyOb6S3tcfe9HqH5s0KnR1aUvvtKrpeh95chLOQXpotm37A
 hrMKNnFAAAA
X-Change-ID: 20250523-gpiochip-set-rv-usb-serial-4f4d4cc2d5ef
To: Johan Hovold <johan@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1247;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=p68X2LwCukixUyKxNtKjThY5BUyTXZHMnFUBGp0QScw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoU9I7wwYr2jSwqkCaWIaVoeDQRgiQ/aT58vBFn
 z+TiHfxJKOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFPSOwAKCRARpy6gFHHX
 clUyD/9wujfUhGZ85OqdpaLV0cZHT1NKmp5g+8X1yCp8eIxUGZ2JMTeOrU+JfdtL1+a23JXXwZu
 tDFEbeLuhpRLog9LRe1C7a8hrNWzkRU5PDDAzILP2jkZeoSKsS5f0b9mJUeQw1luF2G0EJv+zMj
 2Z9rrpSmwD/L7jVG2fOLAgKDA4Lj0WPsxRxru4tfUWsLEDqqcYbTa4a3d0urImTDzZyuWY/+785
 9sHGGFXU2UdseUt0ST4UX4sqtPIlRBcuOa2AAPthKPFHjjDG2prYMCU+F8Eq39dpEehqQnqYc3S
 uIkIwmhlxObUCQOellJYTfkHpgcmYwOqS4nk5Izv2g9ofSfigCiS/8c6QeIAxCBUGkaGUR00NF5
 dB+2Rh2xKG4ldF5j00S5qpnwc7GfM3a6dzBGOoWLR2XMSy22JIfbu8GxsifIvstBYBlch+0OgLz
 I77ULq0j9jHW3ceRtOQjcb42fTVk3bDFSbIfEVa6RP/gAttNWRFrPki7mjOrKrR3dI4YY0Zajz5
 6wnxWLt8kufHFq7qnHFEKbV+ckud0LS0d/Ppp3yCwZZopL4LWFZC7n4lPnUOxLhIPvm+JNAzo8e
 PTgSIOMLm913shGugix4yrMuEhE1swvNbHiE/IRRux7l0xMRVEmn+CoLraPvvaIHX76sCeP5aqN
 KEXLB8+kaQOBYXA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. This series
converts all GPIO chips implemented under drivers/usb/serial/.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- reduce the number of changes in patch 2/2 by simply changing the
  function prototype and returning a value without reshuffling the
  implementation (Johan)
- Link to v1: https://lore.kernel.org/r/20250610-gpiochip-set-rv-usb-serial-v1-0-a9343ca109e8@linaro.org

---
Bartosz Golaszewski (2):
      USB: serial: ftdi_sio: use new GPIO line value setter callbacks
      USB: serial: cp210x: use new GPIO line value setter callbacks

 drivers/usb/serial/cp210x.c   | 10 ++++++----
 drivers/usb/serial/ftdi_sio.c | 18 ++++++++++++------
 2 files changed, 18 insertions(+), 10 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250523-gpiochip-set-rv-usb-serial-4f4d4cc2d5ef

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

