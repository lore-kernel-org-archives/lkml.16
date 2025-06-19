Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC5A25C82D
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 06:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750315933; cv=none; b=QJ/nPXEtnpA3s2DZ2m8D+Rjv1GreMKfNi44LARyp1jD/wckiU5IaBazQvNIMHiQ6cZWyMfhwZkFMPDLD1nkt/Z6FabaXQjKEqA6cXWKb6q3rWiIQNtNxrhJRnY6dZHIWEMC9EHUZM1LU7wk6n5mTZEKrmQH+UgNi9tCUuJ/P9Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750315933; c=relaxed/simple;
	bh=vTkAa9ab8P3d7M5ZfBuJWat+nu9vNVeDtEHmtLB9ffM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pypoVN0ZyWN0e8slisBpR5zTr4jKvBDSW4O1WFfjflMTyNrPEkeiOT8j9jY+cQWiKcn3xs44p2XFZNcvGEzGb+bjpXS4B1IvjHBxqLcQe1pUz1ilBs4JGsWkSoZOFrYrsAMDvKl6DgYSdg54bjy6BTNtCB1p/IJE883zo1U1QDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=JjOEky1Z; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="JjOEky1Z"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b31c84b8052so576704a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 23:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1750315930; x=1750920730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tyc/ZwsFTwGzAn7NCPctGLPawAwJLaWNe6XZPrsmHNM=;
        b=JjOEky1Z3TYZeP2EHWMmMi9dCKcMmS7uukhcIu3k/axJbpxMJiD+U6MCf6qgV+se+7
         Fug5nVujkKDA3roESccYUqbuGlE1ariZPxsgtwkC+PSZpagC9mGUPoXkgt5OuRLtbQoA
         mWe3LOXZGt5UHJSHE31e/F3Bhk2X26aleymzOxSJtbW0F54ra7W2gmNR5J7aKTej9jYv
         jNsZBbRu/LKmSYjpC0ChB5TiQsTfQcNxFYTBrw8lu7WUBsoKP4XjwhNsbb/SWeTwl8pG
         8k6JEAF0dLMfzPGLnF2ITRRzZphiyCot1NKxRlBZJFloZxL/W/VgSqCgvzwiuHipr8UV
         oQUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750315930; x=1750920730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tyc/ZwsFTwGzAn7NCPctGLPawAwJLaWNe6XZPrsmHNM=;
        b=QFiGBCX9X5sO4C3dmcQcVgQ/B0fs/IgMJY1ZxLufGkYD1eI6C3+aZgs7YMj2NTg8td
         +WFyL4gO8Nt5/vF/4d4c/znCvbSp1WzIq8Sb98mMuM16aF9MBeW+m+JxSnOlX7uUpilV
         AW6S4xnh2X2KxYjDz5pEt124stKR50HF0ZhEyXUhRW1Xu/n8JdpQY9vwTTtNEcliTZHi
         wykxUs3hpVv0exWPTB/4J+N/S67atkZ1S7lX30s8kgPMJaLQhSLeAPJVp2I8JUMpBgpn
         JMCb4ccqfdm48d3T9D53d46M5J37q/gd6+qSQvl6bdHfpasSzc3Ni1+LUWibP9SOM8Pk
         3FCA==
X-Forwarded-Encrypted: i=1; AJvYcCUxEP8O/J1FZurP1C0ITp5YtUIlVS7J1IesN77qDSHXgloG4ub+LrqPgJuX4Yxip6pys754Z93e3Hu9d1Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+3ORzdVklw/6450jMgaG8oxK1aTENfkt0hDKHCSYkeaKxzqdL
	zfl8c5R31w6pV6JxaNVyaQlnkxIYIO27z2UI9vfqVZMYgK5M9zImfFsEpDRuhnPBXho=
X-Gm-Gg: ASbGncstAdIox2fieB5pXv5lYfpOkD+akTSOtGeLX2ozs7XTB7/JdjJ2xXurdVCZpMZ
	fVEywS2UdbzKuIvZKrJo5jY+wzPjpPrbtmQWnz8iYwmowx0oNqqUc5ovtA9M0hdfWrxlo4RkpuW
	BQ724DD76ak5Yae4KJ+lDaLC3Q9XjiWTg2C9W6Q7k5IvTkVt/TT75tVT+ybZV6QIU7Oq2f9yg7n
	OjX26+BSNRYXcPDg9+nDL9wJywaMknpepElrdbkqAyyKd5S9MAK6i3GEQjQkn5YDnDJZJPPGMpW
	a2IyfhfLMzUjcqHfywlynzZWB1K6ZTdMvgd7GXa+drFesu3jzjxEckhlo9xzayFaXUMlx4zik8d
	XoQ0y9N9t9t/frhhJsCFU6jzDh1dkDrZuwbxr+wCv4Bk=
X-Google-Smtp-Source: AGHT+IHFllvzeC+jkwZRci77Xq9jPnNMVSwy/rv0obWLKmjC4A3qh3npkrSM+CceheH60WMDv9owuw==
X-Received: by 2002:a17:90b:1801:b0:313:db0b:75db with SMTP id 98e67ed59e1d1-313f1d8008amr34611806a91.33.1750315929599;
        Wed, 18 Jun 2025 23:52:09 -0700 (PDT)
Received: from localhost.localdomain (60-250-242-163.hinet-ip.hinet.net. [60.250.242.163])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365dfdb9a0sm113108155ad.239.2025.06.18.23.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 23:52:09 -0700 (PDT)
From: Chiang Brian <chiang.brian@inventec.com>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chiang Brian <chiang.brian@inventec.com>
Subject: [PATCH v10 1/2] dt-bindings: trivial: Add tps53685 support
Date: Thu, 19 Jun 2025 14:42:22 +0800
Message-Id: <20250619064223.3165523-2-chiang.brian@inventec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250619064223.3165523-1-chiang.brian@inventec.com>
References: <20250619064223.3165523-1-chiang.brian@inventec.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device type support for tps53685

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Chiang Brian <chiang.brian@inventec.com>
---
v9 -> v10:
- No code changed
- Link to v9: https://lore.kernel.org/all/20250610102556.236300-2-chiang.brian@inventec.com/

v8 -> v9:
- No code changed, correct the order of Acked-by tag
- Link to v8: https://lore.kernel.org/all/20250602042454.184643-2-chiang.brian@inventec.com/

v3 -> v8:
- No code changed, included Acked-by tag from v2 review
- Patch kept in sync with series version
- Link to v3: https://lore.kernel.org/all/20250515081449.1433772-2-chiang.brian@inventec.com/

v2 -> v3:
- Fix the order of patches
- Link to v2: https://lore.kernel.org/all/20250424132538.2004510-3-chiang.brian@inventec.corp-partner.google.com/

v1 -> v2:
- Correct the subject and commit message
- Link to v1: https://lore.kernel.org/all/20250314032802.3187097-1-chiang.brian@inventec.com/


 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 27930708ccd5..a613b9c3f6ea 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -396,6 +396,8 @@ properties:
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

