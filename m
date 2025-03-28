Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C7021B8F2
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168669; cv=none; b=EZKv0QFJxH3LbU5eyjGBfpoMDZs5PxuoLR64K0o0epPJNRB6avlEwRUPKw7N/g8xxJWNCjcanN1la8h6Nx47W/HEaKMRygfc0Xu2XrbX3qMVY9dIVkbTQjg8OtS5hsAaoOCQKSe+XnOpUhjLnu1wWnKXggqQrKLMkf1IJS3TayQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168669; c=relaxed/simple;
	bh=l1zcOTqbAXM+6Af1i6qiSSUmTQ2DiJduP75aVq1nYPQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qiZLrbzz7gK0IUV7HLUc0p3Pd4PBIwvukjZxwFkR1juUW1yJbDvpPZwrQTG9yew6ovrQmCzEbq8rOfTCjjM7ysbiMjKp3Vn0Kh+DSwZmqtu4WvZj/+nP20/w0o2nVU6aH0feS5JvTOY4ZCtF3OoulJdwDgHLt5TR7YnI6eyCkak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JhmUU5BP; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JhmUU5BP"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e5c9662131so3359380a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 06:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168659; x=1743773459; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2UDpkJYTJ8+02Ga55OV2M/CiQAcpkegARGuSb5F8VZs=;
        b=JhmUU5BPBvJeOyfDkeklAzkrzwVlKhvacXEhqq6HkJN6iZFC/69NkvY2fla2w4bGy0
         J5E1ItAYhwzZVEoX1BuKC2llkVduktlsJe2dWg0YGaSCZKjvDyq+DznybGtGcSafcPCm
         TLvCloNJ632tZq62eKfrOcozRt4tyavWo3rm3aMYupK0X66cRw5kwAzaqff/HUG/vvjn
         1vA+D6ywTG407kziUKNVcj4/tYYy6TANU234J2OJ+iFd5OzOPo559fOFi5CZNknLT0xk
         a8p5WoGdrOI+S9j+txpXDffYQZf2BkyvmA+D5JKoTfi9SB+msAoIRnL9VdkUr6lwy+aI
         koOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168659; x=1743773459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2UDpkJYTJ8+02Ga55OV2M/CiQAcpkegARGuSb5F8VZs=;
        b=iNP+tjIzjInIvdtkiodsq17rQQTevOVITWuqEmI0EN0mEw9/o0/ssMYe99Z4Qk9UMl
         u2IQn4oJrkbOcs7zFnWNtuiiJ/alztG8udbxZQi9ZPM309m0OfvcEz/Xdl40+U3GKpdD
         VdLVgeXdJZJO/QilkUUgiA0thi8s42r7bQvgRplPswegOw/nJMQbr4eAAWlqGN34Ryw2
         9LKeIvDns+xwn4iCzsXOMZ+WsNbyGGCViXqSYUUo0/llHDfi/BbVPRmWnJbfMlOR4RcO
         WmWg1KlGH2YB5zRM+JD+03wIcM/FvhL3KYRwJDFZgdm3AAXMcWmCCAM2rDDRvmFdvVb7
         uOFg==
X-Forwarded-Encrypted: i=1; AJvYcCX5O1rZqMgTg3kRFEJJPRyeAoPBSr/8EiD7GW+q5yilgrJ1D7h4t369kn1j1MYL6vAb1ibCUPvxNcQMgDg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDrwEDcXh93uV1sY6IORsP0m2Er0BrY+X+RKtMnFiUoGHCyKkw
	bnGoQ0K0bVp6AlMAWbDj1Owy+bCkQ6j0g7+7ZynXSsGwfx3802rFYbNDA+vl62g=
X-Gm-Gg: ASbGncud4MoMvnI3p/j8FY3q4nOtcPGbLzJ0u1oXh7XN88MdXy+Wd3+J/5kw1oJJvCZ
	HTVkwQlJGsH0MbO4NKhBqECxE0PgC1efm3YEpf41TmawZ6VVrwf2beaiG4UZv+aEjgFLH4myk0G
	b+Ckj57FYraW5IpAx7s2GOv2PfN9Mgsq3QxABrtBxAHPmita7ivqbmq/8NwxgnTpJEGhq1toCCw
	bnrpTHYTKeOgC1YbJrehX7nHMJScsotnlSq4M5UO7s5prMkF4TzQneJf2sxkok2/hdOfHTGjs2+
	CW30XWGu1+vDhus+PAxo5+yc4rh0wHiFlc6gBdEhUKkHymuNfFWvRM2DvXbCt7kDQ5am5Cu3Ehp
	jAHZkL+11by/SNXzC8LUseWnEVogm
X-Google-Smtp-Source: AGHT+IHY77zJB2+ZvJcaGKZHiHxoVE2X4zdszR83ffWy9ORQ0cPQA29Aq9xL4S7dGRJozxmx6Qfd9w==
X-Received: by 2002:a05:6402:3554:b0:5ec:96a6:e1cd with SMTP id 4fb4d7f45d1cf-5ed8e061508mr6757044a12.2.1743168659356;
        Fri, 28 Mar 2025 06:30:59 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:30:59 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:28:57 +0000
Subject: [PATCH v2 11/32] mfd: sec: fix open parenthesis alignment
 (multiple)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-11-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

checkpatch complains about unexpected alignment issues in this file -
update the code accordingly.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
* make new alignment more readable (Krzysztof)
---
 drivers/mfd/sec-common.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 782dec1956a5fd7bf0dbb2159f9d222ad3fea942..1a6f14dda825adeaeee1a677459c7399c144d553 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -149,9 +149,9 @@ sec_pmic_parse_dt_pdata(struct device *dev)
 		return ERR_PTR(-ENOMEM);
 
 	pd->manual_poweroff = of_property_read_bool(dev->of_node,
-						"samsung,s2mps11-acokb-ground");
+						    "samsung,s2mps11-acokb-ground");
 	pd->disable_wrstbi = of_property_read_bool(dev->of_node,
-						"samsung,s2mps11-wrstbi-ground");
+						   "samsung,s2mps11-wrstbi-ground");
 	return pd;
 }
 
@@ -264,8 +264,8 @@ void sec_pmic_shutdown(struct device *dev)
 		 * ignore the rest.
 		 */
 		dev_warn(sec_pmic->dev,
-			"Unsupported device %lu for manual power off\n",
-			sec_pmic->device_type);
+			 "Unsupported device %lu for manual power off\n",
+			 sec_pmic->device_type);
 		return;
 	}
 

-- 
2.49.0.472.ge94155a9ec-goog

