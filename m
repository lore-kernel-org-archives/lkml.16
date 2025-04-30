Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF00F14D70E;
	Wed, 30 Apr 2025 02:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745978996; cv=none; b=DzL+w0mMyAyhKVUdyh5CQW31SJlZ9jmdLxFe2R60md29inHHbrfqIvPa9eopsAcN3tq8XVXQuWGMbBxayC8nsDcgRaO+NCuyMxOehO96Jvg21sgp/xFQu9OjnDsZr5fSxecRFIxjlTg20YIF28NRq1ZIvGC0B+/xdCLZXzQ3PZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745978996; c=relaxed/simple;
	bh=UJwi8S2oSOPUAClcHP/ida1jA2kT2gCpm9OIeZ8USW8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bT8yR/I4W7VoKcdllVYrN8OefjBVeXai0Z099msrQ2gQwVpXiw9Z6MbFivroWHLI549DaHUBtyfogtuoCLLfKeIk8ZYzXBu9jmIXVZNnUU/pE1StlKSYBrMrT3Y4JFYn5QYW0foBxDM9aVF2k/X79cJoKy/+OufrSzqzSX3Aniw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b43p9ZtY; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b43p9ZtY"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c922169051so369245885a.0;
        Tue, 29 Apr 2025 19:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745978993; x=1746583793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4Oe7PG99/AZHHENXUgxt/svqannmrv3ouX9muUCFhc=;
        b=b43p9ZtYLDmmDeL0gK146XwBFKehoSsxFSogEM5QTnx58y6sNmNkbRVaKB6jcSsjvz
         6MyTQZiD7XqyO8d3fIy7jE6iy3jCedF9uHT3tOn7GDPEruLrznojsEXWMmpjaD+MQInB
         B7YB/nuryMeQwtBHckNf6eUZOYBNI7PEQaH/LoGgWirIf4stBMm5ulQELzheu2OLxG7n
         PhosvZKcRZpngiYu6Q3RFiF8/D7qy9lRmDOrLVbcJ35FHLcO17S+o6jxLZegvd5QRexi
         w5vQZ/9GALRcRb7RIjo30TqZad9RG4WvHfA5N4ZrInn2xEoiky5R3n422YSudeJO+nii
         advQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745978993; x=1746583793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R4Oe7PG99/AZHHENXUgxt/svqannmrv3ouX9muUCFhc=;
        b=ikXTrjX1tb7sen59PO4or9LyY8AgPICjP3o3z+G88nvIrukYYMdiNAwVkJlSLkZIPH
         UoTVp91GbApfN6ki5Im71kS20KyOteGELX2AadcH6PFFX73saWzX0yxSjECnMazfSTWp
         TBbuOtT1IS7Za3LjU7SjbVIcWAZEReW6IpMNx1rcgnPwbKQ33QBt/uT2RAVk+8tzYnNN
         zrncNmMHtMcmUTtbvcNdb+ZVRbu09kaht+D4GlTdtUFfyZ1mc6vIMsnDHo9cFnNi/bpg
         qzwOohQOdRfgocjfbA4qCMb45Xhw/9mg1Ph2tp3IdSJlE6NGDxgF1HSyGzTa+Mt+v7Zu
         V12A==
X-Forwarded-Encrypted: i=1; AJvYcCUhDJmo73KRCPcm2NX045DzeSo1qXjgtvnGopaEyGMUNw6I+W4KRomohJRY8AB/eIjh2ZJehSr9Ueku5jpG@vger.kernel.org, AJvYcCWbHPPf9ktk5mjQ7PqCuzXUUDAIzRzOChhONcj30i8/R0bCW1uFPNX4REPxxO6yfbSI4AmGDsTxWff7@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6GoXYpb0FLWUzNBfiaq/0r1c70sZAKNvlmjoTPP5P8lxUEUrs
	jlKoxuF74UrmvDRYzHRCejg9aVmCIhK+IV+1T95rTHBfzX4Ygnck
X-Gm-Gg: ASbGncu6fX9CYghiq2bsBcqzbbmGYRtic+u3gPi+KGlHMye87wEbLwBdpexJwwxpxmu
	XOSPBqVcPVBWJgaDhqYXcSq3R+O1/N5NqQuu11hvGbYdSi/lNSidKOgpd5Q6Bzj0rfE8ntdn7I5
	yQfM5D/YjnZMmXK5BTSkxXBhItp+abjIehIoSB/5h43aPUfCTaHaZcvCmfrDfwAmhyMxlcu9U4I
	XVak7gqBY8affQiKxfFR3ly9hdRi6JMSLEDvJ6Fk4tjbxiJM3m6IOCvCIoGK9M1TiXtxEdPo21E
	M7qVLn8v4RMXZ4E0
X-Google-Smtp-Source: AGHT+IFl/15L7e190rP7iw7nPmXMdXFhJpjehDYpux7CYj2PcXkTXFwv+NJEHvRt1t5lmdRnXR6OJA==
X-Received: by 2002:ad4:594d:0:b0:6e8:fe16:4d4f with SMTP id 6a1803df08f44-6f4fcee0e3emr26949656d6.26.1745978993602;
        Tue, 29 Apr 2025 19:09:53 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f4fe835410sm2791136d6.71.2025.04.29.19.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 19:09:53 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
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
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 1/3] dt-bindings: clock: sophgo: Use precise compatible for CV1800 series SoC
Date: Wed, 30 Apr 2025 10:09:29 +0800
Message-ID: <20250430020932.307198-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430020932.307198-1-inochiama@gmail.com>
References: <20250430020932.307198-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As previous binding uses a wildcard compatible for existed clock device
of CV1800 series SoC, it is not suitable for existed requirement.

Add new precise compatible for existed clock devices of CV1800 series
SoCs.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/clock/sophgo,cv1800-clk.yaml           | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.yaml b/Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.yaml
index 59ef41adb539..c52e130db887 100644
--- a/Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.yaml
@@ -11,10 +11,15 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - sophgo,cv1800-clk
-      - sophgo,cv1810-clk
-      - sophgo,sg2000-clk
+    oneOf:
+      - const: sophgo,cv1800-clk
+        deprecated: true
+      - const: sophgo,cv1800b-clk
+      - const: sophgo,cv1810-clk
+        deprecated: true
+      - const: sophgo,cv1812h-clk
+      - const: sophgo,sg2000-clk
+      - const: sophgo,sg2002-clk
 
   reg:
     maxItems: 1
-- 
2.49.0

