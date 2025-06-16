Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFD92877F3
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750082048; cv=none; b=inn8ux3B6KDHc9+MAzpDIjJSFgFmIdHeEKglBqdoDSxjriZdKFxN5rIaXH+bcAln+yG25hphHyD/RsE1RJQryDdg94l24+u9D1z+TlWPOvoGJ01I/h1OX9isPjgNZYiWrRR1gSc7n+XiEOUhdTfqi84eR4phAzLq+uD6GpwTRMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750082048; c=relaxed/simple;
	bh=WdYsA4gcGJ4whUTHaU62r1/1/AwXMOqpKKD02j5KM2I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LGKIUbRrw/FvgSpf4Trgdm54qSSy5XabgNojlaerU4O2/KogV1k30HIXWXNTLMPQnyikreE6g9CGmH9suvBxResIUGApLNcXC7gY9ki27htrBKlEm+ZFrV+mn0M3HpbD51xXHUNynVUpOdSwEAhOYzZ1HMZd1CHobRVivXgyIHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=RtBmYFvs; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="RtBmYFvs"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-60780d74c8cso8276076a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 06:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1750082044; x=1750686844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xJCI+6qwU3+gkjXsqHZde1TYEMyw88mnCNmjbKL5ih4=;
        b=RtBmYFvsW6Vw+ZL7FzFrE7wKDDtpCgAP3oBtY45llLJtfuIX5KB6kx+wl6KUVXW0wk
         AdjTflrSENkq8zVE1hn0C6SP7zMnPPh1FgAIiYI9Jranwe2S5LUJveuHvb2UrJYzH/eq
         ti2Lp0fuYXFr17hqjopDJRft1CSGHtXGdpyEIDoKKCYZP3FgOyha8/l3Z6oNimZ3doeP
         MBp12iEZovAIAA2B5T80taXplc7XWAnBMHZz8RWe49gY02aUOZBJ91mgYTftvKMFrQRu
         YvcI4G22TNevck4mSmfYTuwWsipLdgBLZBqy2PImcpD7i60AQA0wQ4lerrYyHpWIg39B
         Xa6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750082044; x=1750686844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xJCI+6qwU3+gkjXsqHZde1TYEMyw88mnCNmjbKL5ih4=;
        b=U9ZQuk30Q/whQ5I6a4j8fFPjtDPC5Gx+o1+oXhf/kAVWdJSQOs5hKZf6oxniuN48n0
         WVHwbqqHU+Tisbg9NrbQaoMZZJIgyB7PaP86kz1f1s4PIxKXH3+0Y1d1YckjxcPyT7Ab
         Y6CGZpnxLWrPIjjIyBraQUhpKTBDCT6lR3boodYUA3fDi48LILpRw6I3KiC42QKcbhg1
         SQd9P4ItXaIWFhyvSEXS18o22SAaqLMNCX2zvuIjQ1ae2VDvhjlGAMLTIPcQdf19kfsW
         Fwd8MfesfNK4FQCU+5Ejl0tC1bRN6DxmJods3k6HFpLQo9NWz22bp5/KwzhDePwoNj72
         0V4w==
X-Forwarded-Encrypted: i=1; AJvYcCUas0+e8zEA48DI2it2AIYjzlVFR6+pcY6o3X6G5s4HHM72oZgCiRqo9NER4L771CYgQ8CqXt4JDW7hvzg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdRP2fBAsZPwCSnlWCkn3KPZ1ZfuJ3YxrSoYgq/RFkt3jws4BE
	RWLu2g7kf6FrEJjS9mkTfyfBTQVmjm3SLswzUWY11RnTUsr8wJ9Ip2g92FPdaN0jb+A=
X-Gm-Gg: ASbGncvwvcggn8r2CjgE1vrnVAs4DfvhSqMTVj4oxK3o2STSxspFcO6LP3QNZ5ZPyHm
	p/zCCYM2pXo85eL38nIJNvwZpQYPH+uJb/M8q692e0j0j01SdBH+90caWhMVHy/6DmUgEBMjk6/
	L8nG8xGVeq2hMR21NiDVuiGRP57f0oji/q8DK/wSUjC54lumgdYYyTkh7D7DpQ8o7HYs4axkIOI
	6ITwg7KSs6hTYbLZmFulwUlO/A/iaXcdxAVrTG56Ef7FbQhx3DW0T+gEsxO9ZSqpfF8nUqyBNx+
	qhWytGhnKqATV64SZFPDWWJ0K08NEDK76FTnViHoU1q4Ea/SL8VBYa58gf54lzUw90qUnyZPf5f
	Zdjy8826W4BTyjY0B
X-Google-Smtp-Source: AGHT+IFIEkskkJG9WLW+Hv9ZKWW2DbdD0zYs82b6WVAC9yGzm6OdzcpBZetxbCKgKVtLW2Au71dzLw==
X-Received: by 2002:a17:906:c14c:b0:ade:484d:1518 with SMTP id a640c23a62f3a-adfad38b235mr948743466b.26.1750082044401;
        Mon, 16 Jun 2025 06:54:04 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec897a70bsm662748966b.154.2025.06.16.06.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:54:03 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	len.brown@intel.com,
	pavel@kernel.org,
	ulf.hansson@linaro.org,
	jic23@kernel.org,
	daniel.lezcano@linaro.org,
	dmitry.torokhov@gmail.com
Cc: claudiu.beznea@tuxon.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	bhelgaas@google.com,
	geert@linux-m68k.org,
	linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	fabrizio.castro.jz@renesas.com,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 0/2] PM: domains: Detach on device_unbind_cleanup()
Date: Mon, 16 Jun 2025 16:53:55 +0300
Message-ID: <20250616135357.3929441-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series drops the dev_pm_domain_detach() from platform bus remove and
adds it in device_unbind_cleanup() to avoid runtime resumming the device
after it was detached from its PM domain.

Please provide your feedback.

Thank you,
Claudiu

Changes in v4:
- added a flag in dev_pm_info that is saved in dev_pm_domain_attach()
  and used in device_unbind_cleanup()

Changes in v3:
- add devm_pm_domain_attach()

Changes in v2:
- dropped the devres group open/close approach and use
  devm_pm_domain_attach()
- adjusted patch description to reflect the new approach

Claudiu Beznea (2):
  PM: domains: Add domain detach_power_off state
  driver core: platform: Drop dev_pm_domain_detach()

 drivers/base/dd.c           | 2 ++
 drivers/base/platform.c     | 6 +-----
 drivers/base/power/common.c | 3 +++
 include/linux/pm.h          | 1 +
 4 files changed, 7 insertions(+), 5 deletions(-)

-- 
2.43.0

