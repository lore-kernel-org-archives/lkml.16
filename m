Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C705A1F542A;
	Sun,  8 Jun 2025 23:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749425009; cv=none; b=bwKNoHK2kuzIAZPYNRD/9HxlSpheQKXUhpJ5JD2HpKNPjb4jxb6nzyYkU1Mt+iRJNCbumhV16dP9x8hgqtAJogFc8HzabMX0BeGeH0OcfYqK0oUPrLlgXYio+4Elm5MC4kUE9eZszS2Ew7bh2LiajCmLPjWrCzYNqHuGygN94k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749425009; c=relaxed/simple;
	bh=8nyJl2VTV7GMu2rxJX2z1GOD9jD0hX3cPo2UqJPGUSA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rN7Zqqc1XG9Bycv9EhwslTy3oiMFAxGC7XPaD7sHS+xXJkzQtIx4Z22CzhBB9Yb5od/2Ws7Jj1FtQzjgic0wGO5eQoyyfAl4fneMhjZPNmcSDYV7eGPC7/lZRq0nu8Ll3bZj7krFhXqw4N90/NKR+kW0BqVJywLTcqNIm0rzKQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iWBeHBwU; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iWBeHBwU"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6f8aa9e6ffdso37161506d6.3;
        Sun, 08 Jun 2025 16:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749425007; x=1750029807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B4ztGDayPcphCzpFWNN1YhJ9kz12KF6Ra5BCbScpRJE=;
        b=iWBeHBwUMbx6EJjVwEUebPCH74yAOTO8CGP1AQhEj91T8d3rFlXCnSwHkPqJxNvff0
         vzN2EX141Rp/DNOtOdeMaWLAKxR1v4LGrXGOLkjD3BnRN8zhNDBvNnLt/WURuqRdSPDd
         YhPMyfLtevo5HuG/5mk+JoAb1kkyl412fWe+/0EOIyn1rSt1yc3kz7JqcguwJpSdfhcS
         UuR/i5BA28h3lK69CJ3d4t7tQO3E9tOv7m0QUEtNF1ID81Grcp8nECAN1MXstERqpLH8
         RHOkdsPVsCfU9TMeMRhlFR1Ly5t4j25HaVsxg44tXVhUJL9uK6wgUPFg6wjBa6YfJqk1
         fgDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749425007; x=1750029807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B4ztGDayPcphCzpFWNN1YhJ9kz12KF6Ra5BCbScpRJE=;
        b=u/djdxQruiA29apUYRDIfUGWia/M/fQX9lKuRRy8AP3w4W+cufmYzZ0LrGB9nwISS7
         tlpT8XBd+vsyk7aUrs18DrOhsKmd6dvB1sQarffRRqmsAKk3NwDLZrl4g/fCwjmVtZIa
         oCARspHEQLamyfgWXK2w57iu4W1FRjeAS7O/Xun7AVGuO76wFsGgtE/9lDdfXa1UhE6A
         KRCOA+T8iLujlSgQZ9k3cjzMkbHF0MtydLlp9Zk/HVGtmhaMqLdVeIGGwinQ9fj5PrfH
         idqwIAuKB3mxJE5aUcttTPW3m/0fExU5vvDgPf3qXbEkB9lDdOCi1yDzdMJpr36+gXom
         YKhA==
X-Forwarded-Encrypted: i=1; AJvYcCV66bNoxQRs6zFavIs6a4c+dkD04kYkwVTPNOE5FZ2s8kBouXl6AxQnJnHoZpM4AyvGJgr34CbwN54nl6/b@vger.kernel.org, AJvYcCX4PzIrYXm2LaLfY+VeaPhayS9mx3jwSTLDgbgYutDFqtdoaQX8LhlYvh4MQro5nN7u5EsaFLoP0aW1@vger.kernel.org
X-Gm-Message-State: AOJu0YyaJBubUHmvJ4uoZHEx3n88aPURf12Sxk8gTjmeeaxLC5Cg0aoP
	kNXtMUJO+Cf+w4sqagm/eLGh1wJTN4d1Klj8UhPVlHCWxIWRpAwpGXFi
X-Gm-Gg: ASbGncvsiQtcGkN9oTGYGTpPLQInINzhA0GHi5jzuAg/5kCKrIQYO+75rG8TkCaGqlW
	pWvegCO1HgZJIlVH15fbKm7851gmsOyXtoFArPxKmoi6lyVV0puiHUMYkBJxG87l2kiWFSUjq/t
	2CmbA01hARRK2kxgdv7CMj/K1tqYh/6vCcO1OOwZ2ED0y4YQTec4tQXS94mHHhF2KZ3XVYZ6vIq
	F0k6X+XILuwnMqwGYphKHqBoXaq/7B0M6T9kW+pZo1I07TdVI0XKkYDuryTfKwMtN8YxgKkDh5W
	BfnLTO47+l07pw//W9tLrpPnhqs=
X-Google-Smtp-Source: AGHT+IHtUJpvNl5aNUZVpUdg2XqDfl4bs/f4Qypy9pWtukoC9Rh8xegAclLHRNalOR8QtthxDIY2QA==
X-Received: by 2002:ad4:4ee6:0:b0:6fa:ff79:2cfe with SMTP id 6a1803df08f44-6fb08f6d9bcmr168703316d6.12.1749425006716;
        Sun, 08 Jun 2025 16:23:26 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09ab8a25sm44213946d6.13.2025.06.08.16.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 16:23:26 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 0/4] riscv: sophgo: cv18xx: Add reset generator support
Date: Mon,  9 Jun 2025 07:22:06 +0800
Message-ID: <20250608232214.771855-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Like SG2042, CV1800 Series SoCs also have simple bit reset generator.
Add necessary code and bindings for it.

Changes from v1:
1. rebase to v6.16-rc1
2. patch 1: apply Rob's tag
2. patch 4: fix wrong reset ID

Inochi Amaoto (4):
  dt-bindings: reset: sophgo: Add CV1800B support
  reset: simple: add support for Sophgo CV1800B
  riscv: dts: sophgo: add reset generator for Sophgo CV1800 series SoC
  riscv: dts: sophgo: add reset configuration for Sophgo CV1800 series
    SoC

 .../bindings/reset/sophgo,sg2042-reset.yaml   |  1 +
 arch/riscv/boot/dts/sophgo/cv180x.dtsi        | 25 +++++
 arch/riscv/boot/dts/sophgo/cv18xx-reset.h     | 98 +++++++++++++++++++
 drivers/reset/reset-simple.c                  |  2 +
 4 files changed, 126 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-reset.h

--
2.49.0

