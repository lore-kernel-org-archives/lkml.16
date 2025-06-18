Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9A31D7E26;
	Wed, 18 Jun 2025 03:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750216376; cv=none; b=Kk+rtBxg3FK/VKmL+AZ5ef75wRxE3fb+IIL3AC+/hO/b2q1cRA89j1l5Bxpk8y6yFbtJOS111TjJg2PDDZn8f5Tg6yCRdsCye6wgNG9iW0CqaD0ReqGSp8SX5jKoVVCJPWk1BGyOE0rGrNJ81BIiEfgICQHV8Zbd0MvcuTkCh94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750216376; c=relaxed/simple;
	bh=ktV8hgQhTmZKELriqt5A7lzUoAJwbdgckiDQ88mnWDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dWh19i0rK2JqHB2Cc2juFNlEJwuSsxkiieLcfQ+ptU6BogNdh/F5QSadaPIgoocSIkpTnoaSGw2VEWoZ6AJKqN3/loAwnutWCbi2sggBfKU6yvCdi+ufyiXv3hI6j9LntW8E848p22Cogmn6wqz+meDMe2BsVBy+2wQeYdNhZSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j77z4N/1; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j77z4N/1"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3138d31e40aso6358731a91.1;
        Tue, 17 Jun 2025 20:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750216374; x=1750821174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxtR8f3zNuWY8ESAfyPo4qfcZH0MTD+lNydzwpGAHoc=;
        b=j77z4N/1y8/Cmb8SEtBngkUv2LqS1YkNxyChb9pmRGp5OuDWJgjhlPtdx1npXPIkHj
         z6SuqJvG0mEgGVlIZz2YymMi/LVpuVXbZXoV8c229pS0zJLM0ENZ/FDX/2/3u/3C7zD1
         PuW7KfUSFY1XEJn32ZLX7DWxCpEWMsCsRY4O3fNl2xqu61wZuYBgbr/1FpKixR3gHa7P
         DDdzmW6QCriyEbmdb1+ipLUtOBlnZwr2T52X5ZYRWR1iqzv89QNvUB/Ikez5zJtvuz1M
         TwALBD7JlUISLZtAIl6WjldyemfkoSbANBPJ7DSdVE30sC3shGZr7FDsmyd2OzsOwgF5
         kCYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750216374; x=1750821174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fxtR8f3zNuWY8ESAfyPo4qfcZH0MTD+lNydzwpGAHoc=;
        b=mso3q3jQbrUz81iHd/iI62Y5CU0A4tEjIHJl9vk71NVHHwoE60Ld/GUWNLCo3ORYd6
         C1qPzpNGhR4y0hSwh0qbwT9sCguDaE+kywl/fDNDcHPK3XnAST86rZ0lVriUA+4wrRWu
         xzI1EA2SlNHJYKOgjKfO7TuM9CYJ5+VTx/qMgYNtauD6EnVpfqylvrFbY57qisflpYy/
         6EdnkSu0ffd3kPpbf8XgL2+KBK5Egn00vcU/K63PAo70dQNgRtKENtKFujXX/VfysB6h
         IpR2iRrC5nQc4M4/mnmsXvvFbzvMOpTKV+fSGs90Em1IVhutGs9SPvHKnO8akMQ6HTV8
         jkSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUS+Wc6ROxsVUK50opn6Ilj2K2sagm3C4G0qPvGMIS/7duPUISFf7CBOyvZsoAlNchisscV9wJBGYfFzHqo@vger.kernel.org, AJvYcCWiAfBCmcdOJhY9GEqUDrTwVbPF9SP82OmpkxhVwJDZKMPLKqOPCj6fFj4QV5eyllIATXXzt4fPlV2x@vger.kernel.org
X-Gm-Message-State: AOJu0YyJFBDf4hlqgC2BOMNVOBo6N8PEw/MYQXm9EuOeUhJ/UEy409uW
	mC63gmvwZFYNyqFYUPMCNIlwB/gybhLLck2G0kGQqK1Z/GEJ2cKTjAHL
X-Gm-Gg: ASbGncsKw/Lb6jcji6uppIn9ISCzq/4MVwtRyi5VN+anHl+F/min3AR+HCxDvEYYRRT
	1KcOKReKPgpTzmkSnc6TvsToni+mkCYowGdbNkNvo1XFHP8y6dBTItEh01Ruf58oDyay0E6CCLF
	BZZEjnehiLZKLOYc6xq2UQhzXv3BrBm8vzFhZJS3PDuzCLIRzYvnjlIap83OqX9+4g/fqYYpDBC
	7vEM/hkHBkbOFon0gj20+V35aBj1lEOaIlUPNnmEqNj2vpmMbzB05OV9PejyYzogz2JVxpEzrD2
	zIjmlwuO4fmmCnwiRFasKnRrr5whXT+Ex2r7Vj2wCNbl1oK9aKkkUSRhsOb3xQ==
X-Google-Smtp-Source: AGHT+IHRI7h23bZzE8G1/NzKXA2jFwp08Y53wfU3eAL9uKH1xrpt17pvruqfqTfEBZAik8++WIVP2A==
X-Received: by 2002:a17:90b:3a05:b0:313:62ee:45a with SMTP id 98e67ed59e1d1-313f1cd69femr22420814a91.13.1750216374059;
        Tue, 17 Jun 2025 20:12:54 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2365d88bf54sm89057425ad.46.2025.06.17.20.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 20:12:53 -0700 (PDT)
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
Subject: [PATCH 1/2] dt-bindings: usb: dwc2: rename sophgo usb compatible string
Date: Wed, 18 Jun 2025 11:11:29 +0800
Message-ID: <20250618031132.373216-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618031132.373216-1-inochiama@gmail.com>
References: <20250618031132.373216-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The support for Sophgo CV1800 series SoC introduces a wildcard compatible
string "sophgo,cv1800-usb", rename it to sophgo,cv1800b-usb to match a
real world SoC. As the compatible string is not used in any board dts.
It is safe to rename it.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 Documentation/devicetree/bindings/usb/dwc2.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentation/devicetree/bindings/usb/dwc2.yaml
index e83d30a91b88..6c3a10991b8b 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.yaml
+++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
@@ -59,7 +59,7 @@ properties:
       - const: amcc,dwc-otg
       - const: apm,apm82181-dwc-otg
       - const: snps,dwc2
-      - const: sophgo,cv1800-usb
+      - const: sophgo,cv1800b-usb
       - const: st,stm32f4x9-fsotg
       - const: st,stm32f4x9-hsotg
       - const: st,stm32f7-hsotg
-- 
2.49.0

