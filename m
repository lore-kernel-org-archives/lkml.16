Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EDE20E03C;
	Wed, 30 Apr 2025 07:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745996847; cv=none; b=TL2V7l+tMGCjVg7q8+wL8Ay192FeThB6Jiaflni6exTTahzfvd5kj989MTs3R1ioNAn4Vplh7hyTbT5l1nomsF9itkPmPXk48J3X4CRN4itxCRpn8JkFUMUPPH5IWnB+DURF3EQjcJUbYT6R/1E/8YWGm1yx5vw7lAgvqJ73RY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745996847; c=relaxed/simple;
	bh=3p4uTNZuJCVCY04RngL3HijVPVoeTTwZHmaA3AfSjYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gf8v416WwZ6jVAhvC+LkOPCNDSXQheuhQ+tjBsqW2iMhlKVebqPxS1jKq3vkCWT90MYLWcYFwbXZzRYXIqfRlENyIMqj6gDUnKdCAyIUs7U5a5ujahH0rZFA7t46Iul6Lwv/JdcW87BTP4h1fi9/gFUQX39bwe+VwirEHlymdoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kZ5dxnmP; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kZ5dxnmP"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9eb12so10851451a12.1;
        Wed, 30 Apr 2025 00:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745996844; x=1746601644; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bjD6o/anWPJqHcfWOgZVCotzX69raOWCDkK+7Q297NU=;
        b=kZ5dxnmPFBqJr5iLDqG6xG5sQ7dH0JZqz9bfTWjS9ddmTQBYMayYbwGptBFr9YMGFT
         E41iiUDLZKAYd38VIBBmwAtKY2l1wdfkmRQ3PN76d/CSmBsXqR5JZw4q1x7CudDT6olm
         cbH9LHfVMWXhNgjOg32KNQ65uwPOnzvXl8mtXpDUh8Hv0TpNrZnqEjFO3UbMNL2UGctJ
         OftSepRzECUypvs0u2Wnhsnt/nCueDaRJwLa5200Ps04AnqVFQtN6ECsmaXm6nO3rrg4
         oevf1gnOTiJ3McRY63C0BPjNCaKtVS1Vzb6BRLFT3IMoefs+lHuWjL+q5fFYRf+6IIrd
         uvSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745996844; x=1746601644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bjD6o/anWPJqHcfWOgZVCotzX69raOWCDkK+7Q297NU=;
        b=aZl8WVzQw9y/VkIWzDfPn5xcIE/y3l4fQQp0Nu5Kd9GnzEj4lyJB9cLidq6US2Dg9F
         qPTZ9L0jHo7D3Wd7uyrUL9WXtXDsWngVsc33nJ2u7rLD9ApHH+320nSx8FUQYti6ACJD
         H6KdH3GWCZAzl722cHPwbRU2OwhiWjNJvJzops7zS783n/VN14y2ylAHG1uc0apeKKJK
         OHrQFZ5BYGwaTIZ552WkMf0uM8suimzZfL2bxK1C5iRToihtyOhPEEyZwnOmMVQ/JmPK
         5OdEo0jF4SZrG+YOvVg4XN/70mObneAh21oyTh/2tjSSCHsa9lp3nfp7eP26raPU3IUX
         +oMw==
X-Forwarded-Encrypted: i=1; AJvYcCUFIqXQmXOYPZtp1h34BvQ9RxOQHfPTtTCbRQBAcl7npn8/o/ngL3WhOmHKmuGT6s22cAHWb0SbfwOkY/9R@vger.kernel.org, AJvYcCX+7svjeheFgKQiz1F/1QQvygOsSIUOAMC3PhOHesc3pc5XXrj00Kx1ch7lYeSabbUgBxPXgHRO0XZJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzmPJ1uVBPgsClYGpPqrDub9QlkqKBagwvz+NXGPn70NBKjLS76
	JVBHQOyH3HjraVR5tLiW7HsASZK2tmR50aymYDQfxKwpW79v5qYn
X-Gm-Gg: ASbGncsZL3xklCSGnkeasjydAq49oAen01GttOd9/rVOYwf36s3KmorLUsGT5KrL3Ci
	MbhVUpcD0jDRTkUivUrlvgmfDYLAaHcEoLz4cfWHIY3aeTd6fNKFL96I5zO+uGnImDOVq3MdwAf
	J9Q1DPsTIsIrg40VPYaJom+tExXVSWg7dbe7k/u892IzhBtoo6AZ3kEPULz9HhaJPLV0+eEF9KV
	o/NNuThA3wVPOJwinzGQxH6+YNvr2zA14F//uUvWNLx9wdrkDuR5lgDEjkan5by/MpwO3M9HZxD
	aSY2ui8fyu117sKtgts9tqqeq+HM+af/daSUqLwMG2me1V5lkIfOF/zeb+o9Ji0BkYfr7++GbYk
	VZreGOgFFqTw=
X-Google-Smtp-Source: AGHT+IGy8lPaSG6g3uyt1tMJXqadrwwZjz+zmAhTL9j+tzHaJW6EPVja61ZR7mlmlOOJA5VlbLXZkQ==
X-Received: by 2002:a05:6402:2345:b0:5ed:2762:727a with SMTP id 4fb4d7f45d1cf-5f8aef7ef1cmr1055997a12.11.1745996844210;
        Wed, 30 Apr 2025 00:07:24 -0700 (PDT)
Received: from hex.my.domain (83.8.121.197.ipv4.supernova.orange.pl. [83.8.121.197])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7013fec3csm8334314a12.19.2025.04.30.00.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 00:07:23 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Wed, 30 Apr 2025 09:07:10 +0200
Subject: [PATCH v8 6/9] regulator: bcm590xx: Use dev_err_probe for
 regulator register error
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-bcm59054-v8-6-e4cf638169a4@gmail.com>
References: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
In-Reply-To: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Stanislav Jakubek <stano.jakubek@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745996831; l=1115;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=3p4uTNZuJCVCY04RngL3HijVPVoeTTwZHmaA3AfSjYs=;
 b=MOZ5SfrNp5aZLJw/b/aGeXsAUTZ17aBm26czPcfPC/rsnP9lCtVIG2WEwzAz/UKJZKJW8a77j
 sUmuysLSACwAV/xddDwZIeLUK4T10EpC+ayGvk4hardmmeSUtchMS2j
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

Instead of calling dev_err() and returning PTR_ERR(...) separately, use
a single "return dev_err_probe" statement.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v4:
- Added this commit
---
 drivers/regulator/bcm590xx-regulator.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/regulator/bcm590xx-regulator.c b/drivers/regulator/bcm590xx-regulator.c
index 9f0cda46b01506080ae5fa709104a8df4d174a8d..a17311fa30e4d48c0a4925778d7bed486ac7a982 100644
--- a/drivers/regulator/bcm590xx-regulator.c
+++ b/drivers/regulator/bcm590xx-regulator.c
@@ -340,12 +340,10 @@ static int bcm590xx_probe(struct platform_device *pdev)
 
 		rdev = devm_regulator_register(&pdev->dev, &pmu->desc[i],
 					       &config);
-		if (IS_ERR(rdev)) {
-			dev_err(bcm590xx->dev,
-				"failed to register %s regulator\n",
-				pdev->name);
-			return PTR_ERR(rdev);
-		}
+		if (IS_ERR(rdev))
+			return dev_err_probe(bcm590xx->dev, PTR_ERR(rdev),
+					     "failed to register %s regulator\n",
+					     pdev->name);
 	}
 
 	return 0;

-- 
2.49.0

