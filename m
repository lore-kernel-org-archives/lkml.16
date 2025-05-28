Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CEB1862;
	Wed, 28 May 2025 00:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748393396; cv=none; b=lNKjlx+L8rTuylF6ecqRVWWlEDRrZcWeWARg+5VEu32uOItxtXKXjtrBGGp2+EDrl8bwzij6hVLptweesZezbxT03L4Fj5d9Sx17doomOffqTxMJB5lU8CwuT9oZbFitOKaIN3F3CNyvCZzx2ALfsecybAAt5/XsLWIVs7GLf+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748393396; c=relaxed/simple;
	bh=UP5GY7XZ7AXk4ERP4xYgMbsCZ6Je0utO4prKcps1Mc8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dJVPA4+H7YWzf09kr4wvDdiye+dC/Flv89KlE6FZYZHb7EAdQ464HRgT9aNJlNabrm+BdtHB0L0qkG80Nl/fjEw0hsrJl9GuAsTk8ZXGYD//LFTXwrWuEKJk4E4+Res6a6GZi/7pO/4tr0g/NY+ikRQW5eX45KVuei645yt1IVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gYLE49OQ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gYLE49OQ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-441ab63a415so46762755e9.3;
        Tue, 27 May 2025 17:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748393391; x=1748998191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V8Ij8onCf52xheqmc2qe3RP8a3Ssnk8iEmidFGMfVrU=;
        b=gYLE49OQCRjkf74jbLHXkyF81Be2wfakcrXlEC+d+UCG7PCmPu0yelcu69lmjHXNSA
         bVrAT1L542EQu0kc+GqYNiv/WEN6WdO/TogybL9VIQE7zxb56I5N3fAmPwR/DAd5lWq+
         X42Pd2lf8VwFACcfKEN+MNQ/AYK4FMMcQ7jOQSG58zsg96PNuWTiyo2u+xcELhQqJD0K
         mB9IBt5MZfq3Wmj0kuCeftba35ao9Thgn2De+6gjtpaDxCLhA6ZqT309vPUmzXToU8n6
         5imFjyDlS2BhuDt6pcUB+CrwjJ1Q1h2v3qMYMXROV1QLk+LHtarijG/XczQZ9EecsRZN
         vs3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748393391; x=1748998191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V8Ij8onCf52xheqmc2qe3RP8a3Ssnk8iEmidFGMfVrU=;
        b=rwnpKWWIgtrrXkC7DgATLJjXtB97w2c1lMzKHhdPQUyXinUSvVLfcheNSxbw+qLkML
         wmqF8kKnrCZ7CmMxCq51VZOszYD+0WXLdP60ZV1/ysbqTvGFJKP5XSb96rL1Wz2Kvm4G
         mbe3CSPp06LKsxaVYTwmjCaljUJOpOtCG891l5zgu4dV9nQS8qGb75sfKX4AbiDiyJ2B
         9OPie07gliTsyM0mEAOgy8fB/CRgZMDvVi1ec/+EEOMUNk0hyieKxvkrRn2vHFYyhkMH
         JBZapxwJ5PvOcMvdqqlwDVgQYtADv+Qw7dqxrS4jVvb89u046joQ4ByCXGFUSEZKImdX
         U3Sw==
X-Forwarded-Encrypted: i=1; AJvYcCU4XIhJpM5w2JGS40GIMK0GbhidRexUSwKVeczcfCqXhCdksfd9jY/s/XYvqHVG1duyBeuOKUeFBpIb@vger.kernel.org, AJvYcCUnBySXCwZKG/lc72PPELOoaq59IxWCvqfB25ENqi8YPKARTdl3qNVpzcrd772gEv7nz52SH+iZNl/+@vger.kernel.org, AJvYcCVPaWCPgStMGtN5Bk3XPo7wGYiGOFXZLF6Lzy3LYAC9csRFcfdMXaZLSYdcIBGn7hzCZCAQNlPPRdwUF5T/@vger.kernel.org
X-Gm-Message-State: AOJu0YzhZin+u/yQq+NbjAiXUy8RZxojf7DCw+LkFoWk61723WCOunUR
	jYNXLOX5GlY6RzPvAgtgq/5IXOsqEzhbTHfKyp5RDJoEjeRhrqpuJwwvf0f60g==
X-Gm-Gg: ASbGncv3IhHXL4dLs5tLxBloWO2noVNg6fU2TnkyoH6V9AZBDeiK42SugbQkVZ2Azsz
	nnr41IdA25hl5SQcf/NowBFXRdFthVP3mWJm+DSeKe4DGMhfdGkCxeq9orvJvmZUrjZSrlKIrFc
	a5ZiHEsUuK7Cp4r/Cezucqr+tERAr6HtQzAPopTE2oBjcv17Bs4DgrFsqn5nARh2M0RqU7LH9dn
	XwFO6amjJDbPMoSnfsnVx8P/+Afde/cCHs3gHQCgaHt3l6UZsvBqsUnh+kJuaV7qM/Zvwh0jtPk
	gl7CNbc47/xEx+1O0n6UryG23HJYiajiBF1y5BkoJSpCpWUaVoAUmaX8DoUCLZZj7rcahtt75lr
	X75KUwFW/g5wUXtsY9zEL
X-Google-Smtp-Source: AGHT+IHcxU6aNGZPUNx2rE24EdHV9amVQWZ1VZ4F35//6YBbDqLewMgXBIC1BIl8+u3JvGDIOOEMdA==
X-Received: by 2002:a05:600c:3b19:b0:442:e9eb:cba2 with SMTP id 5b1f17b1804b1-44c8f25dab7mr157966145e9.0.1748393391501;
        Tue, 27 May 2025 17:49:51 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-44fccee6c54sm33682535e9.1.2025.05.27.17.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 17:49:50 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 0/5] clk: add support for Airoha AN7583 clock
Date: Wed, 28 May 2025 02:49:13 +0200
Message-ID: <20250528004924.19970-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series introduce some cleanup and support for
clock and reset of Airoha AN7583.

The implementation is similar to EN7581 but AN7583 introduce
new reset and more clock divisor support.

Christian Marangi (5):
  clk: en7523: convert driver to regmap API
  clk: en7523: generalize register clocks function
  dt-bindings: reset: add binding for Airoha AN7583 SoC reset
  dt-bindings: clock: airoha: Document support for AN7583 clock
  clk: en7523: add support for Airoha AN7583 clock

 .../bindings/clock/airoha,en7523-scu.yaml     |  16 +-
 drivers/clk/clk-en7523.c                      | 476 +++++++++++++-----
 .../dt-bindings/reset/airoha,an7583-reset.h   |  61 +++
 3 files changed, 425 insertions(+), 128 deletions(-)
 create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h

-- 
2.48.1

