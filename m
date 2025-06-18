Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A879F1BD9F0;
	Wed, 18 Jun 2025 03:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750216373; cv=none; b=jvelXFfab6p702MmOU1+4N0Y0MWYTtVvDk+TyvJk0UXiup/PlZdSZ50OzDqX5i4sE/56hyhfSGVOFfEzmntl+tPMQkv0i9wayknNGK+doX7P18wAv2xNKne5PyMqT03ZT2qtjXmeaRzFFeXPawMnpnLnvMYF8mENmVvZkwLz5hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750216373; c=relaxed/simple;
	bh=snU775//kiO8hT9dWLIma8QLQBoQGPOkDX0gzwV8JmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RDn3P5tERhuEvXz3CBSg+tB5iiuttVHhn0wTHlF6mOwra+B5L3lNQpbQB8j6Q0kSGsUhN/cPVt/lJ30t6EL32N4MLvptBDZgzBSZqm8zimxfD4qbXm9lBQxMnb83QHKhFIsY0fms2kEK2rjLoJ5Jyb7MByngF6tZwOUOL0mUC4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BSOhZlwL; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BSOhZlwL"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-236470b2dceso57162785ad.0;
        Tue, 17 Jun 2025 20:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750216371; x=1750821171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bN1ufSIz6Wdr6sIyj7BRHf668iy1Pf2mMb4+ZdyIh2E=;
        b=BSOhZlwLVpoeXI79DEyR9FTpQZgye0Pfk1ovW8z1VT3ErqTENvuVP5PQQG/R7j73TS
         zgsNxnVw81+I/YhL5MVtnHsmLXJ2Nfkk5hTd+kwpQDBOQQZVhqotW13VyMV990l+BPWU
         IxlAceQed0tnp95vVS2oKGWiJ4tIujVcPebRiCuN2x/ic960TZQ+P+bcguBDcoKCprQ8
         1+F1NMBdFbu3o1Mh0n66GHj9pD1pj4YpABmf/dgxOSui8fIkpSMuMiwvQCxV48EOCbhf
         udBQrKseMhqPoqv8nsJkDJ09O9HEg6QYP6ZAugZ1E8kxehaxE1MdnkGeE/uWawl+60lM
         f3jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750216371; x=1750821171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bN1ufSIz6Wdr6sIyj7BRHf668iy1Pf2mMb4+ZdyIh2E=;
        b=Mh/BTiAET1ceXGLUPyrfGtmKzrUHhY6OtnYad9yXwF3gn4LRq678zl0npl1iZbWtmW
         LoryNXQQbtOEhnsGlN/XKJdOyfFVN9Z+AMdKfsGwvbxkQ8zDE/C+l29JAqJV30ivncnf
         Bn3ClEiUICcb3zFRpy8936UlVvF+2IoteE2Qw9bM1Scoq5sHUs4IOvdO1CqWojdlXwHi
         YDn+9hZ+iIwywkiw5YOEVII+RfkpBiDqIed9W1qh/+yni/kBZJhQimhHRQAYLQJGQyOo
         trDaPgJ8uwWHaiDBOICzky2G02mL2x1/Di4hhK4UN1cKR5O4Ne04o3TvExFcbAZr+kw9
         LKSw==
X-Forwarded-Encrypted: i=1; AJvYcCVwTEdu7H4Or+JfQM2hpnN01buuawJ2NEThGpKoP91NfKY8phqpsScdKxej05oDwL5B6H9sdCuWFTGb@vger.kernel.org, AJvYcCXjfcD0YQ3i8yBfdTt0dfepIxYpgCdoqGuKhklbYUgUGzSQdf8wGAQp/3Xs0pT7tf3rqb7mbctuuancx63t@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwt3yyYek/mpeUdGBjw1/taJRmhb5y8ELASiFe/oqLUpyRaPe8
	UU4KBKuXYUgn99nOk1g3Mx6wtsM9zMQuk/UkbzzYs2lldoFslkHVi5za
X-Gm-Gg: ASbGncs7N/qEYPUBMafnj8bAhK3Jc3I2uIAygIyTaFRyqMn4uiuQ5nPqb4GDVFavsDd
	N9wkHuKSQuzr5o6NLLYyUgoFA7J1hcZukPhH6njpy0J3g8mRf9fie5PsxdofYvI5L5N69EZB8p5
	EwA13tiDdu1UxZGqavWzD0bT7xPg7ccm/clr36HWjZgCjBw/JWWp0Gb58G9oKSvuQzmQIFFAOb6
	YHJ+Lrolh5a16xrsaSA3s4BR0Gtdr9kzVJvrLu2OXtq84GTLDO+PsJOslLTknLv1+u7IjHsq1gI
	emthKLjiBaNt88SmFEJaaSVsyaVfwV4IEY/AiqufGu/3iRFs/FfzL2rYcGY6eA==
X-Google-Smtp-Source: AGHT+IGlk8EgvUOrNowxfJO2EgnlRzNvjbjQNVRsCmwDyUQL2qNF7QpmdsaUlm4gLUxNgjcVNHsS2A==
X-Received: by 2002:a17:903:46cb:b0:234:dd3f:80fd with SMTP id d9443c01a7336-2366b316c17mr244719105ad.2.1750216370686;
        Tue, 17 Jun 2025 20:12:50 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2365d8a1847sm89028055ad.67.2025.06.17.20.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 20:12:50 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 0/2] riscv: sophgo: rename compatible string of the USB device for cv18xx
Date: Wed, 18 Jun 2025 11:11:28 +0800
Message-ID: <20250618031132.373216-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Old days I added the USB support with a wildcard compatible string.
It is not formal and it is more clear to use a compatible for a
real world SoC. As the usb device is not used in any board device
tree (The patch for USB phy is under review), I think it is good
to correct this mistake before submitting the device node.

Inochi Amaoto (2):
  dt-bindings: usb: dwc2: rename sophgo usb compatible string
  usb: dwc2: follow compatible string change for Sophgo CV18XX/SG200X
    series SoC

 Documentation/devicetree/bindings/usb/dwc2.yaml | 2 +-
 drivers/usb/dwc2/params.c                       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

--
2.49.0

