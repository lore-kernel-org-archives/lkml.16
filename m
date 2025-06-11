Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA4721A45D;
	Wed, 11 Jun 2025 08:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749629965; cv=none; b=TK2NiPQAP1uEKCCXckw9R/xI9JMuHJWKEyIibtSOUvaFuoyU5RaebKM9SUJGfmFDdv0Qs2Czd4fLzkG84XXCB1oxof45bb1gzqFcGoIn0+8wjgNg8Mm9RieLupC5p7ntsAFq4DbI3IY0ZPTzrI9ub5sCopzU0Z5GOH5aHFcHf4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749629965; c=relaxed/simple;
	bh=BgskhzIjhoBBKnyDbYf2UllhqZ0Rn5azDGC2A7sKqU0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WDr3Q5avq9m+3/uutbY/DEKHg2Hpd+OD+kqPbMQXocZJcvHrTtnMrttqXXyvz2Y6nXk3BnGGuHmHjcIaGKAk48rK+r9lvKfmpM8kfyh37oaX5yAGAIDxffhb5vXIyJdmOynXV3yXvSVYLeC+TEAS6Vpx3JyKrYhXs4BFthYCgUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y9vxpw8w; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y9vxpw8w"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6fafb6899c2so6786776d6.0;
        Wed, 11 Jun 2025 01:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749629963; x=1750234763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vfmr4VZFRC3blHBv6tjDEsekB2JKza+TxJ7wwghY+Nc=;
        b=Y9vxpw8wEK+NZCrHPb+aU/nkyCBge3GJu0JYA8Sasc0MLMpTP3fG74BKzJgLWP07Vm
         +0ZsOkv3iivs1pU9R/SfhOzvq9G6TVqhl1eEEA3EynMGjPSwWsp7PDNdJViHi8qnyrPD
         spptYMPkPzLD71rzAwlWKjJIhzvuVoHygD2VTo72ba3cFDA9dhtQlLVNIr3KBINkwLXD
         vmbcn1O06m9XA26Ee/TgME9i/6mQRunBuU7Lgppyvu3CuoSONGw1l/G27qlcZWGzDgYl
         MWDaDoZCknaHHqzy6kzmEQjGruKSEWhUhvbaSWlcPKcsiNCdxnzZj4UtGMguVX1rWkAd
         BtGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749629963; x=1750234763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vfmr4VZFRC3blHBv6tjDEsekB2JKza+TxJ7wwghY+Nc=;
        b=KDJhM+myTbLA743jPDzKy7lPCRzApVD4Bp4XKJdoayZjs2MyhERXwbqGS4Y4k0noYS
         HvAdAc2+UJusKFs5MjtRzWPcT9TWoIxKDuZAzXNwDfnawOi4/lGXNp8xBk1pS1HZfRwP
         xSYB/tjRRik4Bwo8P/SMn4kKQUZJFUJG+578Z4+QfTWna0+aoh8SZnSJvmiJlqBAaL0x
         gNMbz3g6obyk4wUfCGP/hiX2/Eif1t1ptFP3SBvRWul/dWzEpMYM0RVGzb5/Qibi9EOy
         2aQ7ZRTBmtBepHg15j7uptFFLkl3DFaHleyZ9EL7Z5KQhSi05OASk1JbceXDwY4PhU4N
         EkXA==
X-Forwarded-Encrypted: i=1; AJvYcCUCOrELppTGq7WFMCeDs5JPSIGUce++993lvK2VHJxoQG5I7wlRrvgi3M98y+AzGp0L0fqOxxfjIT/g@vger.kernel.org, AJvYcCVZIYFCwoU6OaJAoRWbm0jT7OCNVjxi/3+DZEokCbt6L41nB/s+ncTGXOWVnoQgfrADmrEehihnEskdRBLP@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq5/L6t8YyieL3pcGyfY7AQvh+nned1egQXyBYDh5Iu0gEq1SD
	1KWOXzf+4L2DzsaSt311zJkPTPC7VnXtBvl+R9P9HyjAdfpRR1rzy74O
X-Gm-Gg: ASbGnctWOUkZoBDeMYnF6s0ehjYTjJimyX1k+BBDdB4O2ro7tkUFf9pNIMYxxU70CvF
	LdQPrv0YXvQhGT6ED2Wn6sTxBHGvAUE0B2uF1jjBh+oLFedqApJRBokb/9Q5lt6Wn+KHAN2LUKa
	Wr1S84VKFng0Px5vHd4rs29XFTm59pnWUchb1cyPk7BnpNnZPQiFlu/z+7Oy/vNH3x6J9ndg9Dg
	rTc72PQNv3ajVvO/OPNxilYCKGC6y2l6L1XFkWyp+R7CVJqtWOSYhCjdD49ChJCe6TQwL2AT+TU
	8AycFEUi/h0BEdBt9aXI7LPIpv0ut1JGOR7W0g==
X-Google-Smtp-Source: AGHT+IHLmdiPK1/hfZ3hYVAS6e/Qa18yyzLJzaoN2F5VMxeq5n4N2SYxR2jD2YHscybgUqgzRxu9HA==
X-Received: by 2002:a05:6214:226a:b0:6fa:a65a:224d with SMTP id 6a1803df08f44-6fb2c37a204mr38375446d6.4.1749629962729;
        Wed, 11 Jun 2025 01:19:22 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09b366easm78768726d6.114.2025.06.11.01.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:19:22 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v4 0/2] riscv: sophgo: add USB phy support for CV18XX series
Date: Wed, 11 Jun 2025 16:18:01 +0800
Message-ID: <20250611081804.1196397-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add USB PHY support for CV18XX/SG200X series

Changed from v3:
1. patch 1: remove vbus-gpio, switch-gpio and dr_mode properties.
2. patch 2: remove all logic related to the bindings change.
3. remove the syscon header file.

Changed from v2:
1. add item description for switch gpios.

Changed from v1:
1. remove dr_mode property and use default mode instead.
2. improve the description of `vbus_det-gpios` and `sophgo,switch-gpios`

Inochi Amaoto (2):
  dt-bindings: phy: Add Sophgo CV1800 USB phy
  phy: sophgo: Add USB 2.0 PHY driver for Sophgo CV18XX/SG200X

 .../bindings/phy/sophgo,cv1800b-usb2-phy.yaml |  54 +++++
 drivers/phy/Kconfig                           |   1 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/sophgo/Kconfig                    |  19 ++
 drivers/phy/sophgo/Makefile                   |   2 +
 drivers/phy/sophgo/phy-cv1800-usb2.c          | 222 ++++++++++++++++++
 6 files changed, 299 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/sophgo,cv1800b-usb2-phy.yaml
 create mode 100644 drivers/phy/sophgo/Kconfig
 create mode 100644 drivers/phy/sophgo/Makefile
 create mode 100644 drivers/phy/sophgo/phy-cv1800-usb2.c

--
2.49.0

