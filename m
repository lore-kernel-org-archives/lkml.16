Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBF31A841F;
	Sun,  6 Jul 2025 04:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751775858; cv=none; b=eO2Im+eNMrVXrXTJEgU9xP3NhLjNZMlbCGdVjrj+QuNUbEFcykfICgtd1lEcq4OIaTrNiRb1il+/McU5W2fxZNy/cPvqzAHzRNBEkZCAJr4GLJ9ILHSRmexbSkAJ2ixalSVfAcZs7ygOHShvWvbKi9O9qhbdlcYjosgMg+4mxvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751775858; c=relaxed/simple;
	bh=Yr4ngwcAi7n2V3RAqtpKa8MM41VL6Hyw61afifQklLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j3C+yPJp9+iCKB4tF0YlOJO5MQNQ//RAHUkzwX7imw7u/CnB2Xad0/ndOlFO5CysS1YoLhcdtyryQ+/qWqhjd4BJeQPaD8vLga7G6NasAxkdqK5ncKcQ3gAhzrFT2zPjWkELtVYxkxxapMk5S5KgNH9oRSwvRBaxb6aoaQsewVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zbecbmtd; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zbecbmtd"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so1577954b3a.1;
        Sat, 05 Jul 2025 21:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751775856; x=1752380656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gTfGXPyjwWbwYggXhGjVsZrke/lrobe8f9NW1l4bYM4=;
        b=ZbecbmtdMnEjidInsDUq4FgNDgdgN7olMb2+bKF5t3MH0Kq5PfSfcE6VFtYZtnAama
         Em2FI7zNPugOQ9qsAfOoKN2yyp4Cj1keYSndK80ILpOX6gKmYv4mhru+kvs8ks8H6alx
         PJLtk6fuw13p6S7dJjipZo3IwqfHGi7UDDu2n6FESORMBUo6M+CQ1U8QgYkC94rFzt3O
         H0NPPN2rAdy0mPdwcx2HjwhOgzjTjTIh95P5+cboNdKBrQX1/XpPjYKyfp/z1CIn/iaw
         Nffzvqkiwet02OXqXssf6Nx3QDpSPKFNcvYXRGnfNTAoKWOYEGGupukysFhbWd1r6snP
         DP5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751775856; x=1752380656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gTfGXPyjwWbwYggXhGjVsZrke/lrobe8f9NW1l4bYM4=;
        b=phb6JzmxU1DiRXkB9aQw9PskTu10cZVhyEyf5UmdO5ZgmjPPJWXsWUivil3Y11HPRb
         6fXpQHlzhuDvck//hzZS2vWIZ6848rts/CqKTeeMBbnfNj17CIr1tBhQR8iLwdwg3JOd
         vbs/SPl0IRXx0IBZjFO5mZ5+cKkY7LWshQG9xC4I9W7oKmD/N7yWqCP1yJB5Wwe8EuB4
         94bgnkpQcLwhSkxWaT2oETDfe0JjYgLVvJmcdz3SkGqSzAsde7Sq5UPib3Wp3MuVb6w6
         eNWNjxcg8jLFerZQT0U5NbD6vMTpM324wwIbIsC7ajDNx2fmgFnbYxQqDLJAWXKrqHwf
         c93A==
X-Forwarded-Encrypted: i=1; AJvYcCU2NIprAKeZmzYVKgNJFAlVrU4atb2mZZdQFJNp+wt12/q22cuV8oQrIg6DdDPjOHzvloibGtKHSNQJCVna@vger.kernel.org, AJvYcCWwBZJ+Sg+mlw/L/JWsD2yWYojrWfnT+N7NGbbY3MZ6fh3c5YKBIov5TIQ9OsL5f2IpPSPyyS6zAcc5@vger.kernel.org
X-Gm-Message-State: AOJu0Yz410zcLEIe1WqH4Fv4Njr7ypUvPcgWmzGc82SiNXSUx9aWYkvK
	PJM6xtLHMjoKCxpAVaFpQ+EiUAUl8sQyArG1c4Gt2ObgHlN4+ch5Hlz6
X-Gm-Gg: ASbGncv9Xrwf39NqZMlho8esZVz+OyU3KAE9JSmBppoUJp7uX+Nf4ueLaZn7DeC9iiG
	dyXG1/HlJXBsTSWyckIhT8yrqbbutwfw8VKXfq1jsKS+0xfV1K8mdfwfkJdfn7cdWMnO2XmB70s
	Om/vhRYkwpyTpziMmZmE0egolEThZV4bqYGoirB3wwOMTnAzLHH0dg5TXbs2B8JHnprzq2JgIXR
	iU+jp2E25qv1rF+XGGLXQ3EPNXfi+uLtUbWqzo+0UuTNho1TnW2r/4259buC0SUwTcvCGM8JMJ2
	dJ9mjgnn06gJjfR6z9nrOeg/cx7zn/PodOPy3xX92W31Ts78ouDA98T3wpkACQFDCPzrjin7odo
	A2uEsXHegslYuV3OCzN0K08OCEFKcCyjhOhGXHoM=
X-Google-Smtp-Source: AGHT+IF18DUV/d88jcrhrYvIvU1ums7AXMfBmWhfxadJSu8r9gEGoO1K989AmSn7ygBQCoB15CKQnw==
X-Received: by 2002:a05:6a00:4b52:b0:73b:ac3d:9d6b with SMTP id d2e1a72fcca58-74ce5f5fc4cmr10057178b3a.4.1751775855713;
        Sat, 05 Jul 2025 21:24:15 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce417f206sm5287067b3a.76.2025.07.05.21.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 21:24:15 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Tao Ren <taoren@meta.com>
Cc: Tao Ren <rentao.bupt@gmail.com>
Subject: [PATCH v2 4/9] ARM: dts: aspeed: Add facebook-bmc-flash-layout-128-data64.dtsi
Date: Sat,  5 Jul 2025 21:23:54 -0700
Message-ID: <20250706042404.138128-5-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250706042404.138128-1-rentao.bupt@gmail.com>
References: <20250706042404.138128-1-rentao.bupt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tao Ren <rentao.bupt@gmail.com>

Add facebook-bmc-flash-layout-128-data64.dts (with 64MB datastore) to be
used by Meta Network BMC platforms.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
Changes in v2:
  - None (the patch is introduced in v2 per Andrew's suggestion).

 .../facebook-bmc-flash-layout-128-data64.dtsi | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128-data64.dtsi

diff --git a/arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128-data64.dtsi b/arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128-data64.dtsi
new file mode 100644
index 000000000000..efd92232cda2
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128-data64.dtsi
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2020 Facebook Inc.
+
+partitions {
+	compatible = "fixed-partitions";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	/*
+	 * u-boot partition: 896KB.
+	 */
+	u-boot@0 {
+		reg = <0x0 0xe0000>;
+		label = "u-boot";
+	};
+
+	/*
+	 * u-boot environment variables: 64KB.
+	 */
+	u-boot-env@e0000 {
+		reg = <0xe0000 0x10000>;
+		label = "env";
+	};
+
+	/*
+	 * image metadata partition (64KB), used by Facebook internal
+	 * tools.
+	 */
+	image-meta@f0000 {
+		reg = <0xf0000 0x10000>;
+		label = "meta";
+	};
+
+	/*
+	 * FIT image: 63 MB.
+	 */
+	fit@100000 {
+		reg = <0x100000 0x3f00000>;
+		label = "fit";
+	};
+
+	/*
+	 * "data0" partition (64MB) is used by Facebook BMC platforms as
+	 * persistent data store.
+	 */
+	data0@4000000 {
+		reg = <0x4000000 0x4000000>;
+		label = "data0";
+	};
+
+	/*
+	 * Although the master partition can be created by enabling
+	 * MTD_PARTITIONED_MASTER option, below "flash0" partition is
+	 * explicitly created to avoid breaking legacy applications.
+	 */
+	flash0@0 {
+		reg = <0x0 0x8000000>;
+		label = "flash0";
+	};
+};
-- 
2.47.1

