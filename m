Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7742741A9;
	Thu,  8 May 2025 14:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746715108; cv=none; b=Pi8DKpnlZSMRB2Af8swBoHwltdTkQoARQWPVJf8IirQFbAurGnih/R0Iu1vxE8UDkTru8ScQZOtrBym1qNbfNC8yib81e727/lNBT1jm1o31vCEihzL+4Z68DgnGuHWI95YMKUr1nfUTHs9hpbyLa89vaZmg/B040Fg13Mq7HCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746715108; c=relaxed/simple;
	bh=PNKJEEVGycdJ+tQ+sEFPJNzy8pM5+OVhBFEET0bQUc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NHw96e7uqcXbnDnG46XPicInQkVc8WDPo9XPvWXvY0W5ghNyZmlMHCD+B8o1znVYjjcDcnY1j3Eq/vrA3ln6XZQcqAP/eloj4SPI1Np0WBqIfSNVFICW0eTd3ch+IJH0gqgMsO+nmoci5I3/jRsic5r3SaFbaKbapZq9Ly9f9QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zp5DkMhg; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zp5DkMhg"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5fbeadf2275so1912428a12.2;
        Thu, 08 May 2025 07:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746715105; x=1747319905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oj8LqzgywDdLktNaQl2/tPROCtLvy0Eh+7/G4UMG7Lw=;
        b=Zp5DkMhgNjvxjg5NT0r2JQGSFFZ9KCRv6XlQs+FHYNAog/GbO140juChIkc/iDMmyK
         XQkp46o8HPjWiIkTEHA2/ZmudLDFu4pgBLpfT21yJlMacgTZyxU7aGbxWWGbiJGb6M6b
         d2aOIsrNCKNlee6txt3f3X5NnstzM4LKM0G5VlhnxqnsTEj+bdXtaft5vVQo7cIyRch5
         dOAp859b4LQvOOO2meCid+7BNs4d3WW+7xoSfHillpXLZQ4B7HK1UPJIcT4f4hrf6Gko
         gR6EJf7F0e7hEMhbUSFQJXu/ojFxYKJMh06L8jEZKj2iAoEsBSY1z5/aJS41GFt3zw2A
         QK2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746715105; x=1747319905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oj8LqzgywDdLktNaQl2/tPROCtLvy0Eh+7/G4UMG7Lw=;
        b=ZhhPyg5anlTpcA9efXfsqkyC6h+GyVqOnq8Bm9olNj+BQn6GXGoHQ7nyqg9yQ2+oU9
         VlnRUP34Q1NpNpqy+ZRCEI2XBjTkbXAXnc/WNjXaFe5Wcu+DO4XCx2q8I7koDj9LpUAi
         CijCK05aZfcAOPbgmkWBAiisOUa/ZYVI2p0MG5K1evZYimUxHwDlU3/JatNdw4Dmf6Nc
         hS4pwo4ZLGsZy08LZeR0Z3Li9Taq6laJUZ/xV4DM4+YxEj/UhUNxqEf/1tg/0XFEt80y
         BvDRy+m7vbwMqm56U+BwxT4qoWUrmfJWIfWWdjcgX2fwlUJK/mqmBKHvfEYaSxIftVcU
         EgAw==
X-Forwarded-Encrypted: i=1; AJvYcCUsfZMy0Esf3L1Xw3Qd0Z6W1ccm13OjDt5tNUzaMLr1P/vSLNX4/+K1VaU9HZZQpR4OxNl1MTpQ8ZT9BtyC@vger.kernel.org, AJvYcCWO4pdejF+EQ2epA3fjLYkgmsBO7Jm5V5fl0BclAKPwvRbPrBJI391f/PF2H3KzyJaTVGoVAVN3iBaj@vger.kernel.org
X-Gm-Message-State: AOJu0YzgfKXWEIROwVw0DlHfnTbb4PxwiB5wfeHRV/5VB+o3h6Xo2d8j
	TMYmasS3KtZVc8VLWMFh0LWRS+K3/zoAuHEuLJliS76VwIJ7uis0dshZmQ==
X-Gm-Gg: ASbGncvWH77NKs0Z0gLYexZbhfKgjXsRkXpQmxGDwgzF8Z+/q7Ryttwa6kWIQDNeeSM
	1neJz1dJ+sA9CSnB97mwxiVzzVe/0xpYf8CoDEHsGIeD9Iyk1pxiVAfmmjOzcDVup8XChOK1iFy
	yjGtRJmYPGwQdRJ3FG6VsocJaLbnecldZwbBZo5PtOSVvdBLGaXtLuEl2+NM89UkHUMres1+3BR
	KSzBxK64hAYkguLvjGhxnNXu4jlxbOKyf2F9RPfUUjrPdf+euQTjDmziTnDRVt8eRAp/JHsHsLZ
	s3Rbf1LtDkPpsAKiPZqY6kVF5J5WZLvuGFg6PqJwEEC9
X-Google-Smtp-Source: AGHT+IHlhlxOOdULj9YyxP5tKVZCcW98GcmcdYH7wlwGRJSBEHOER+Y0YszAepIn8G0/TnH9VAFodA==
X-Received: by 2002:a17:907:9488:b0:ac1:f5a4:6da5 with SMTP id a640c23a62f3a-ad1e8dbe7f5mr642051166b.37.1746715104477;
        Thu, 08 May 2025 07:38:24 -0700 (PDT)
Received: from wslxew242.. ([188.193.103.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1ed2f588csm334443166b.42.2025.05.08.07.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 07:38:24 -0700 (PDT)
From: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/4] dt-bindings: vendor-prefixes: Add Ultratronik
Date: Thu,  8 May 2025 16:38:13 +0200
Message-ID: <20250508143818.2574558-2-goran.radni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250508143818.2574558-1-goran.radni@gmail.com>
References: <20250508143818.2574558-1-goran.radni@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Ultratronik GmbH is a German electronics company:
https://www.ultratronik-ems.de/

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Goran Rađenović <goran.radni@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 86f6a19b28ae..e9f534c21bf5 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1607,6 +1607,8 @@ patternProperties:
     description: Universal Scientific Industrial Co., Ltd.
   "^usr,.*":
     description: U.S. Robotics Corporation
+  "^ultratronik,.*":
+    description: Ultratronik GmbH
   "^utoo,.*":
     description: Aigo Digital Technology Co., Ltd.
   "^v3,.*":
-- 
2.43.0

