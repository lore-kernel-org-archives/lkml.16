Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864DC22B8AC;
	Tue,  8 Apr 2025 15:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744126978; cv=none; b=njPl7Bur1N9yYJkh9r3/YChdtucTpLyMlAPOBniKsQb5DiRKgdqiz93C7cBwZZReNXsrIsa0pq3vtSH1Jd/d1mAt9oJE1ulcCYhWYjQMILZBd+GEfuoJ993jUMDknPD/E6gB8fWwv8ZJpDK+9pwnJVU5H1EpE/omhL1H8Gf+AZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744126978; c=relaxed/simple;
	bh=jtozxlDlFArb33Vwn4r3NVMWeWlV1gMBeUBT/QzmsQA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZupVKZ2Pupm5n17YMSSx+kT1M8TXItT2fe69awHDm5Yq+A2QYWSO0uw2OShXu3jVjuuBWqhjiqELFfQpo/aXD8Xyeu3qDEFMNOxLCyh/y8+pCsqBjH5RUZyihV/8VublK4Mf+Y7CmNI/zJBS8v55FFE3AlE9SvIKILTvQ9Qy0QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g6pIhRM4; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g6pIhRM4"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39c0e0bc733so4927322f8f.1;
        Tue, 08 Apr 2025 08:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744126975; x=1744731775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gu5G8CnhO94dSAWaShWe9FJyZsw97QYskm73IppyfbE=;
        b=g6pIhRM4pe178Ng0vUD7CBOeEte+9DiiFt3cE9rWUoVwTKNBkO6YHZOOmcYBEbGbTs
         WfQ8yYQ9ZgFTOL2bEBrBfSHIEzRn5s3RR4LSr3CArPeT5Sfg4fDHc5xQDfkSm/GAWEsB
         1+3+Cp4Fo3WzS8LjiWtql6pVDKM7n50h+cwa1reD28qYAyqAnP6JiQWOOS9exfJn6Lcp
         VcoRxqnwj4/jzGX1l5VC+aa3zc6bFEJ0sYcY98kakURSFZj6G7JTqV0HryV515bVnOS9
         0abD+DcalgCooTSmIkNFw+clM5Fie4l/Npka3MAXbH/i3iIGluq9bC55WvxQS/9ICD4P
         kTaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744126975; x=1744731775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gu5G8CnhO94dSAWaShWe9FJyZsw97QYskm73IppyfbE=;
        b=eeSI2YODjGR7m1bfxahvk+CxWCokEE0MIwOdXETJxUsbtsXzdyWDktLswQbBPAGZhd
         l5+gnw2euzqXCIGxbtKN7TZ7cN5D1wzBVZlH7HCbFMsbody2XGXJYgWy08fBz2f8h5DI
         3IEuSnJanvcaUJi2W+n9qkUEXo6xifG8G/7bFle3BjBUWqns8cJ5qM3Qtx8AHQTnZzwg
         Du/8UUEaUXmUpk4eDOmN2CRsdTdFj06CA+gv1BD8elIMNsHSUkRPQuYNLmaguVpDrehK
         JBqURDC+cPtpde7jtLzKNpP6tMoxNQAvr38fZnCDrO1KBOVgXwzamsJu0xS/Z02DPwqg
         HmSg==
X-Forwarded-Encrypted: i=1; AJvYcCV0ckYGOxnLxXnoohf+3bk0C03ppjP4nH1zXaOUPlz4V8KDLFll2HPjpFyOI4d6exw2RBQfAxelAsJR3nVp@vger.kernel.org, AJvYcCVopjxHqUx+1BaW2Cp61/yezinyZTsvueb7lnyNR5LihRJXnIj/lJyrQ7wKOhp7aMydkRNxhRiE1tSi@vger.kernel.org
X-Gm-Message-State: AOJu0Yz99d0l4/ELiXRXuSKW9hbF/X595XlLikL23XpVUijkbR3Dp7PG
	451nLm6ESDOUZs3Dz5PZLYyKyrfRL3hYx2qPxPx7/hxU8WZa7+I3
X-Gm-Gg: ASbGncvD/Q2VVNh5KqpuinMc3CqnVt57r/O+NM3Pv4ku54XEISssXdBcfeRkdnBvCY1
	MDTDCrbf5GFfVzWbdJqRJAt69fa2JEsHZvVI+DQTssE/yudivy3VBWy8BvFerdB2ktHQFY8jg4N
	fWVcS94eK+6rwg8u/+OEmMQzvawsWKr+eyUrDfriTmaX1hyLtF7M9dtZTvKqc2Y7+PJLzEQrdG+
	sCk/wc+KIwVWD6O1E0tU3UtBMhxpoMchiqiupeQ4cvDCrvHLdSPUCfSWJPLOEOhqp/Nr82RXlKI
	PpYkDK2VQu5xa0hFSXBHLf0XQ9FaYbo9uSRffIDy7MVRNvohOOUYkyNqQc2BKXfbKPMr3y2KML0
	DvXNgvxU=
X-Google-Smtp-Source: AGHT+IEYi6zlzoKa/yDqzOVKsn45DDMykY+WgG+Uz9FkgPjhijbvcZRMIAXjw/tOkhVFBEr3GkyMnA==
X-Received: by 2002:a5d:64e6:0:b0:39c:1efb:ec93 with SMTP id ffacd0b85a97d-39cba98b7edmr15444584f8f.48.1744126974756;
        Tue, 08 Apr 2025 08:42:54 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2e6sm164476675e9.18.2025.04.08.08.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 08:42:54 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/6] dt-bindings: dsp: fsl,dsp: document 'access-controllers' property
Date: Tue,  8 Apr 2025 11:42:32 -0400
Message-Id: <20250408154236.49421-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250408154236.49421-1-laurentiumihalcea111@gmail.com>
References: <20250408154236.49421-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Some DSP instances may have their access to certain peripherals
conditioned by a bus access controller such as the one from the
AIPSTZ bridge.

Add the optional 'access-controllers' property, which may be used
in such cases.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/dsp/fsl,dsp.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
index b8693e4b4b0d..e610b7636a08 100644
--- a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
+++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
@@ -91,6 +91,9 @@ properties:
       - const: runstall
       - const: softreset
 
+  access-controllers:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.34.1

