Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DA72AD02;
	Wed, 14 May 2025 06:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747205088; cv=none; b=gcL5DlFCgKEpTck13pk2HxFNwoyIQtsU/mLPdDacTLl+ftc8azqag+mpDxMAwpxO5u0QV/dUQ5035BEweDifUE7t/j8Jg9MfQecFHydi0MJyGci7iW7UYLKaw0zzoZYDKy0wSsL7vdu3VLP25FKY/eX0CL8YorwR0EUeLBGtMlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747205088; c=relaxed/simple;
	bh=ijzwnnI/HGCOYp81pOseMCjlmDojsIOrtfsqtslA87M=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=EcgAqOo+msQFW0gJrY7aSxgMn0dhAZTdYManj2U6CNOaeWL48acWX5yZ80KLwlDjeaHiEwBgd7INCvW+xQFDhGP2lZS1JezTxnOY9Z6WhSGUWX5M2tQjYEQW32097kVDOinKMtMI2vGtPwUxmjOhStjj8NZv+ofdKG6fAQIxyR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZJIIWHRX; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZJIIWHRX"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-73972a54919so6390201b3a.3;
        Tue, 13 May 2025 23:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747205086; x=1747809886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:date
         :subject:cc:to:from:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TcDZQwTmMdtyKKt05qTa4r45+8RvNA2opPyhd5OidXw=;
        b=ZJIIWHRXDOIKBxqBiUpVIQZTrFiWVRDG5GNxOpxDWAtDV+OShfdB4YYbYF5s06sC9e
         FWlQbWfiXnObrGpAIx4EapXp9cUaL8oFmQnFHayUB8bQWFM955nPYP3HR22A+6kQcTEP
         eTqTnXb7BZJvI+RWBjBy3e0OUGqP2TCxUjBN+yzBDKwYQPzPyzfewA8KqIa7n/2ljYqP
         +osMxZ3RwhwYNgCjnkJ7RKrZUKvJMhtsA+bY3/zBQhqCwDBm3Emb8SR2qZ7gT7Tvd35/
         RkEO5w4i9w1LPfsa6qmKS2tlv97N3eEthT9Q6AdflrwOlo1nl/XKO0IBbqIl9AGlhys/
         p9iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747205086; x=1747809886;
        h=content-transfer-encoding:mime-version:references:in-reply-to:date
         :subject:cc:to:from:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TcDZQwTmMdtyKKt05qTa4r45+8RvNA2opPyhd5OidXw=;
        b=AvQgkNHBlA1+Gmk0MaRPjhtJyqC5R3gtlS+0lEEQDagQzhZbO5wweSEBwN+2AvTdpa
         fhnLcNs531x57a2hCGD23gJJijCKlkiD06byER45Ruq6RGQeovZB4u1zFP2CCt0h4RzW
         YBEL5k3SvPhqh2nzVdaxhT9J9PWvFrVpSLpsXKiRo5jQiRcHd0umKfWT2r8+8b2VqhsG
         7xyUqp0hHuanaP1ziFxZ8u+EhL/K2wq5x14c+wMHbPU7pehZWxAGzkBe7AZ5PGoJ8J8D
         xQ7TtjOJIF+SoaWHHP3+S5u0gK//kZ5pdr5ZNw7NvziX1imN8rEXlx+CKQpfj/U4kuoK
         7LMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqb9WvD5SQLLo3/TYZsoD5PtweeZonvheHDx6rNlw5Mft+/QNk+WFvCBWUqRZNX4XZXtPhzWLTxi+74Ao=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2pf5xf1SAgkUuxzRI7pqKNI9suKU5+cfVMo4Mv8+RXBlEYnHz
	XhsJGHXk8tP2a3wcvQEdbjwqs1j5D7XL5+kWIMDxT1l5VH/nOg38
X-Gm-Gg: ASbGncsFT46DGk6EVRqNd0Z9mYBEF0ltlLc7xdP87TfvQ4snk0sqk+8oubQfk4Hgyk1
	sQuuSnUk1FaGqPP6LVHWH9QJzN/YFnJBd0oZ0u/yFo5qLYFIP8XAOG81ycHb5CjfCc2rkNc5uOP
	1SNorRFikeFNUrX6yD0Ee1/U8iFf9fUkSUb29Xj/suB6LkGgAPoQYRdjFfvBtKWE1ZQBntvqtKw
	iclREdkW9fmKju3lwKJ02Ex3CAjsi8tZlOqiXkJyUVt1UtYP67EG845KEjmClwJQVN0F1TAhZb5
	3T8BTnV62LIId7BVQXVvGmB/erD7ueYII6r4mJ7wW7GX3hHOoR+4jAaKPpa2qRYdqZSNfq2a
X-Google-Smtp-Source: AGHT+IFwIZrYPD3WbXFDRklDUuXUJrldwY/u0s/EqxIvE+gIjhV/Huxd9CKq/cSzMKDp1d6ZGWTLgw==
X-Received: by 2002:a05:6a20:729f:b0:1f5:9024:3246 with SMTP id adf61e73a8af0-215ff0eba21mr2915171637.17.1747205086397;
        Tue, 13 May 2025 23:44:46 -0700 (PDT)
Received: from dea88b1475bb.. (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7742d13sm92517375ad.90.2025.05.13.23.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 23:44:46 -0700 (PDT)
Message-ID: <68243bde.170a0220.12d995.13f9@mx.google.com>
X-Google-Original-Message-ID: <20250514064430.284576-1-LeoWang>
From: leo.jt.wang@gmail.com
X-Google-Original-From: LeoWang
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	george.kw.lee@fii-foxconn.com,
	leo.jt.wang@fii-foxconn.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH V2 1/2] dt-bindings: arm: aspeed: add Meta Clemente board
Date: Wed, 14 May 2025 14:44:30 +0800
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6822b830.050a0220.27a24d.d064@mx.google.com>
References: <6822b830.050a0220.27a24d.d064@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leo Wang <leo.jt.wang@fii-foxconn.com>

Document the new compatibles used on Meta Clemente.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Leo Wang <leo.jt.wang@fii-foxconn.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index a3736f134130..4416a40dcd86 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -81,6 +81,7 @@ properties:
               - asus,x4tf-bmc
               - facebook,bletchley-bmc
               - facebook,catalina-bmc
+              - facebook,clemente-bmc
               - facebook,cloudripper-bmc
               - facebook,elbert-bmc
               - facebook,fuji-bmc
-- 
2.43.0

