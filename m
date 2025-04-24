Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF7213B5AE
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 13:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745501639; cv=none; b=HJnJHoemuz5i/yg9kxrKnSg03GN48nq85AehbgZLeNWsUfHvZ7SYS6qzXehl278JNTjT5B9Gw/OhHcRiX8OlXbmNyiIxX5DXYwCveBu5nboNMOMvKLhJWC8FHO92guJhtNlC6Vdysx5DjqPBvFSU7/fvVmazdMIN5GrsiTnQ2+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745501639; c=relaxed/simple;
	bh=sqXiuW7QgekFc+m/AzNUGNRQL3UFeBn/z7zkLXUM3mE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C46j9UrbY4V8RF6kRuXJG0mZ8yJnj1GPUr6iFNGGWeY9K72F1C41pkgn+upXVpas6+naitrPHjVKQKewn4aW2ZuHiThzO2PuWCqbdtJisgPsAKuU3cjXKkb0oLUphDE0qG6+nnMDwJep50BMwirS9tSWCD3IsLaI+yQQ25aRaNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=KDoY0tYz; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="KDoY0tYz"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-306bf444ba2so1046044a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 06:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1745501636; x=1746106436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AbhNACai9YLrn1yt1Tb15iRWkwDZ5cisgZPoV8CoM9E=;
        b=KDoY0tYz8/ChA4kvJvtYUIHXAwpTIVkB83l33p0HhBUm+tGg9s+iECD6LYunpwTS2O
         k2lhRiy1Gha9qC/IEMoizQ1S6PzWV+V6hsLnVtu9GoSqVIEYT5t9ozWJu+esjBX6jolY
         lieLwftbiNncYhfJ5BRW5hFtvhXhOa4k424c8Pv9cct4alNldaVGTAdtq7nV485snYg9
         eDTVfJp4ZEldktjQ7geNqetT3ZioVTKldvcx1qmUWfemXkNk7mGgEMPBWGvcB8ZsEUr8
         xjJMg8qODeItFXGac+EnTtL9ZPje/8+cgPZ7RfvcuWNIHQRZeg33KEjqWTp38WR0oR73
         jEig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745501636; x=1746106436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AbhNACai9YLrn1yt1Tb15iRWkwDZ5cisgZPoV8CoM9E=;
        b=iUhhagMkJG8jYxaDFVAn1GiZe6F5emDpuD/zDkp9LGTw902kpWaADtC0lKngOt6jrk
         cWsRg/wN6VQvKtZr4EYjoyQHhOzoVpQhs2vVLs/13F6X/kPyx9WsCCB+sjR03lsyDNdm
         7UTzu4r6EhYetQd6EDZNoDBDY84c/ilyymDCDYOi5Pzh8zCrmcZdg1T1psiHwGQtQgUv
         8yGY/eI9WAWZ1UYBUKz8s1nB2bYZARKzR0vuQoeg7DifxREA/PqjdYtI7eMY2VqFYpbr
         i1DNywLjVqb0GIBASiZZtj2ECznD80Fa+RvFrvWQEWbsfDol+olWeQxRjMaeh33BJxi1
         0TuA==
X-Forwarded-Encrypted: i=1; AJvYcCVlSasaTYQsYHEJrQpFFkzUQJuNRJWZXe3gaFZow/MhgPyl5TM+CDeEsR+T9mUXaKSSO6IY+7Uos7OeOOE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUAcYdf9TZQHa6NMuF0KWyuO8QIl7oACn08iBLmTiHmvjnznsm
	Jv9Hqkk1xnlaEs4Sx029k9AWhval6wjXW2ldPAnwcXMjv67AcHy4KY3I1WaMp4Y=
X-Gm-Gg: ASbGncsxM9G9I76u0soexZUKRi7q3lIGP83/qYOo/Uidi8NsxTK+HQHppu0wAnc38mo
	Ozm2zAgZG2/PTO0Z+XXkf07Nbhl3xOJx0kJImVQG4uc9iO76QKzupLq7sbgVveqn/4Vr5lrxXu5
	xQ/nXiKR3/K8QMpoliHZ+qm9WMkuPqybYZ8UUdT9Kjm5BxwuQtAk3Wrv7kbi8bZXsNwl+AUDYXJ
	fWIw1Zd81j7MwI2DFSGRkDRu7hMs4x/y5rWkspYbuIGxUq8mhzxk5HT3IwK5ABmR2FY+FBqfoDK
	UrjGxiNfHQdVc0ZB33pAmLipNuEmUA2FFH7MMf7fuKEGf8irc++89V4GO5ZcXTQy3fd4/WLlSFS
	fBLi2S1NtcQhhQ7LBFrlfLaZGWYECLLSOLDjjVrEFy58ePA==
X-Google-Smtp-Source: AGHT+IGlie1KSArwUeL1LNFF71oxoDTffzrOyj3YHjM1awwxZeNDH3PxsaKbgN0LGNj0P4vPalJjjw==
X-Received: by 2002:a17:90b:54cd:b0:2ff:62f8:9a12 with SMTP id 98e67ed59e1d1-309ed319e19mr3209116a91.23.1745501636506;
        Thu, 24 Apr 2025 06:33:56 -0700 (PDT)
Received: from localhost.localdomain (60-248-18-139.hinet-ip.hinet.net. [60.248.18.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef0d5c72sm1321147a91.43.2025.04.24.06.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 06:33:56 -0700 (PDT)
From: Chiang Brian <chiang.brian@inventec.com>
X-Google-Original-From: Chiang Brian <chiang.brian@inventec.corp-partner.google.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chiang Brian <chiang.brian@inventec.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] dt-bindings: trivial: Add tps53685 support
Date: Thu, 24 Apr 2025 21:25:38 +0800
Message-Id: <20250424132538.2004510-3-chiang.brian@inventec.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250424132538.2004510-1-chiang.brian@inventec.corp-partner.google.com>
References: <20250424132538.2004510-1-chiang.brian@inventec.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chiang Brian <chiang.brian@inventec.com>

Add device type support for tps53685

Signed-off-by: Chiang Brian <chiang.brian@inventec.com>
---
V1 -> V2:
  1. Correct the subject and commit message

 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 8da408107e55..e0017ba594dd 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -392,6 +392,8 @@ properties:
           - ti,tps53679
             # TI Dual channel DCAP+ multiphase controller TPS53681
           - ti,tps53681
+            # TI Dual channel DCAP+ multiphase controller TPS53685 with AMD-SVI3
+          - ti,tps53685
             # TI Dual channel DCAP+ multiphase controller TPS53688
           - ti,tps53688
             # TI DC-DC converters on PMBus
-- 
2.43.0

