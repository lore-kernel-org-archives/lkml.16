Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B49277016;
	Sat,  5 Jul 2025 07:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751701227; cv=none; b=dvazokmOZrZnOAwYUnYka59jgFnDiSapdjEyYuZQmV5oX5ytre9idwuPYSTj9ok3DEv6LXAh28r3kqyXvWjx+PrCb2WZ/zg0X8hZ0iHfSvn4GJMp/w9TuJCoux2k/AtroyUOShiMyiEg30atZ31pNCM7NDm6/7FUVlQOY0xP5eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751701227; c=relaxed/simple;
	bh=JJszYn717x6LknTSTvPVWMHkPjW4vHXCWm4HWl2cKPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L2S77DUI3pRB0J6qTGnkKaRhf4mF3eNJoDTXFa16NQqCUWs1XtwkU5lvr1XDa9qLwpB3Z0AuqBgWmkEPfBDzhOl6TwWBzqn5d1HBVO8UHT0s0uaBRytm+Z861RrQ59kT2EVKO6olZlwcO9hJjtOH8BPYI6JOVJqBRbg89IOPzP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hEGXZRJx; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hEGXZRJx"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-748d982e97cso1518670b3a.1;
        Sat, 05 Jul 2025 00:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751701225; x=1752306025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7TdtCKmCXZJuQXIsMKlprNk8AhOeK48KprK7+CyhBCY=;
        b=hEGXZRJxGX2srKeB8vung3biJFfXzkxT3kpzfOqtqee0iSaiP7T6e8V3ZhYqZFfi8s
         SXZnU0kpi8qm6d5TB8dKZUl3Iuoa1Ufm/2oSTZzzrtgOaU3G+GcXela/lCP9elKpU8Fy
         TWfOTZ7+OpewrfgPDiMSGqb7IfiwW5AtLy5aswbkZI7qr5VgGastKtHYAOb3UXl9YG8I
         vGNZ5j0aJ3gu7pvKdjzM6BNDGChCZL6R5Wun8BONudPcTGmUeShHCjA0arIh1oHgylXy
         wTAZYmnCZPiuPQ73veSZO8gXCH3BFLk+/6X7b26EEnUT2hKLg5GAb5fqZohoYHetRl9V
         RYFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751701225; x=1752306025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7TdtCKmCXZJuQXIsMKlprNk8AhOeK48KprK7+CyhBCY=;
        b=vNqNlIFH2l2Rw0JjN3uoqT8MqjKogPHeJbfv+ijsLMklfj4t1U0a5e5wGtKvMFTN5c
         HsovKiTEKb3m0U/rBwF9L92hn9AYMXwLe1WaBxosw4E/2Q2r93N/Fb1FhnLnTlgIdW14
         rB5swUeAqizS1JH6QDSkflyKv33cycO8ZzNMG3c418a738rhkDE1IZxMvejYSigpkSH5
         3x8XALba5f2atlzRZqTEco1YKog2q/SIDgu2YVlKdNJtzkTdCKItt2wO35jXC0wC55ue
         PxaN7KlbqdkFAz5W1ZYnVYQtqFQ8t0SFbWHuPq93ei5V+7GwjGzgMRRtpYBykWGEuDBj
         92Hg==
X-Forwarded-Encrypted: i=1; AJvYcCXiOLH0ezQUYpBu1LtKAsxryE7oMeMxS1eiPkC8JauQEenwMitZwireGJonfRonrt4y9qzguOfYUIb0gxA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyllX8v2hzaPVNCwhvK9OjKoiQ9CNLGh8BM579BJBqqUbjI0xaw
	0XnvMI2+FIDx/I3V87OevOSwu9d8wVNHLcqLxUXx2l3Y8USGdK/T9r2l0Dg0o5M9wFRr8Q==
X-Gm-Gg: ASbGncuZnjfJk9QCRNevgV2U1tdR58cF/T1MR1LI88DKpvPBk1LicmHAvcQ5lb2MzKK
	bsCxs4n+jUIIeGE+cPJnxQ6Bn++aPUX8p6fMbe47ZAQlVF4/Ce5sKsSEflJKaBUuOQNiYQDfzJ2
	O6v+A39oiarM1yfHvkvfaC5pQ+3Y8veGQFkk86y1qlTq8UzMPLXlNzrIR+cR2eEc70L+m8Uvwyb
	hizkE3lWwPcuTuzy+juFxYW3C89PE7W8QS2us/0gUxlc1pD2/R5s5R7+eG2RfiArFmM0d7kZtNW
	NQTz6QA0hZ8wwyn2tU3BeUKfDh+lmu3Ofh+hr6IfEeNu3FCMWjQiFOP5gO29XsnOKF4i1n1XkDn
	AYa8Py4c=
X-Google-Smtp-Source: AGHT+IHjXclbDebSZEtYRCAUOrQLhMMCQODW3kWiRYwINLupbFQ06Dfe9PNiuFjlOuB4EbYy6RonEw==
X-Received: by 2002:a05:6a00:14c9:b0:748:eb38:8830 with SMTP id d2e1a72fcca58-74ce6669b0emr6653982b3a.13.1751701224987;
        Sat, 05 Jul 2025 00:40:24 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce417e852sm3993616b3a.85.2025.07.05.00.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 00:40:24 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Guo Ren <guoren@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/3] dt-bindings: riscv: add Sophgo SG2042_EVB_V1.X/V2.0 bindings
Date: Sat,  5 Jul 2025 15:39:54 +0800
Message-ID: <204c8214aa084d592e8dc45d6c5ca23381937b54.1751700954.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1751700954.git.rabenda.cn@gmail.com>
References: <cover.1751700954.git.rabenda.cn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DT binding documentation for the Sophgo SG2042_EVB_V1.X/V2.0 board [1].

Link: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x8-EVB [1]

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Han Gao <rabenda.cn@gmail.com>
---
 Documentation/devicetree/bindings/riscv/sophgo.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/riscv/sophgo.yaml
index b4c4d7a7d7ad..e21b65938a65 100644
--- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
+++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
@@ -34,6 +34,8 @@ properties:
       - items:
           - enum:
               - milkv,pioneer
+              - sophgo,sg2042-evb-v1
+              - sophgo,sg2042-evb-v2
           - const: sophgo,sg2042
       - items:
           - enum:
-- 
2.47.2

