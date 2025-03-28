Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE8A235BFB
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168687; cv=none; b=hg7SXFiXiiho/AnX3FEFT13xlh9Z134HTLjeu0j20qstnyl12fQ+gHi04leKSA1QKxFS4QjWY9xe+Ln1lUqHGZTyMMhSGSW4NRggZdDnHr6UegMDhPfMwDHstf06cmVMXc9wUt3up3q177HO7w23Q+JRY9tP039SyNYyeAtREv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168687; c=relaxed/simple;
	bh=+fAAJ/+/3MbgFo3bOsjQzn5S6tmp2xnmlCT4juP9rJM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ARsgMQEJkVVRRPJpbdNGL0Tu6xpM2f00oBv9nTOB4ysto88NAz1Eu4TNKfTeCrAw32jAm/enxsEZmK678GW8Kw4iA5R1xowFej/hAN3HtDBRhf4sZs8clCDtyiLTVrBJRg2mFI2JAKQJJDYgP/oJZBzxJMwfS8gL++7Ho2aD6k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hwUlwKuB; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hwUlwKuB"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e8be1c6ff8so4132334a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 06:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168671; x=1743773471; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IvD3NPE37fI+ZqUrH7EmoQBagetQaG70If7tawsO/t4=;
        b=hwUlwKuBZEhEFyR8lpcPfVHC15a0AICLojQ4JY2LoB6ggUiO1gF2pWCHuo0ybTNct2
         PBTFuFIKhzTIsmSw5vSpcBv8NzrSQDM7DNl9v47UiFwpQ131T7Nz88eKxeI1kzZj9UwC
         dJseQsWqRladaQF4AkGCI9LJTvUm48xYFe/btTW/A/DR7soJxqQE1rdihrKMO/zHtr0x
         h2w1oK8ulWm9FMQB5KDIFnACJ0tmPINxSFJMhIMdzhgk80K0xzSPxFrMVV9wtiPv5uGX
         fI6im/mzTtm9OoEPXTgDYKoJkPu3zgkFrEKro/FHMCQvkuY/Yd4ZS1MverqaiK3Npatx
         4JEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168671; x=1743773471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IvD3NPE37fI+ZqUrH7EmoQBagetQaG70If7tawsO/t4=;
        b=H7yxKt5/cUsI092pVe2IdNFEYVSg4yEoKWtrLethMY2Mx3yxyArF4Jx2HDLRP9jVYB
         pjmrFKSmfMuTnbTuv6zqvZOLy0/9Y+njWFrcl/wBvW1vsSJARq0xT/HhE8RHonxWfa1/
         KiJsdZzfrzCGsJqAj1+KrShXFS2jVyrZaWqANM0b+EZnKyOFjITUIq+NVzo3fTAMn0OG
         iu4e+40xFy80mV1kKPgqoQ9v7qbSh/F1lHWcJV8wEziPjIt4PAKGQFLCs2kw9Zz264+r
         24oGHfB7ycNDpw2hhBn1Ld3h3QMuizZ91swbKYlAcUL0bZYVzozGOnzd3GGA6YfDFUcL
         BvdA==
X-Forwarded-Encrypted: i=1; AJvYcCWNCteYbwI5B2dHqQS0lVH015UfXxiaeoEFIrsu+TGsZub6gyG0+rvYhYI/v7LIDharcsu7rK9CxZk1Fl0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwrCbsZlQS48zioHGKQbjudByyf5xk5IPxDfSin5OcRD4Fopko
	B4SuNNDM2pNtIv+l1IM9M7K8h2d4Xng/x5neNO6cTqTc1dFOokIqfYIlAo+vqmY=
X-Gm-Gg: ASbGnctn3XV8+hat4ax/uVixtf4MTJh+Tym5ILjm1XUHskfPmd6Tss7IqUmo6HPIFPi
	ZJ8VVfhMEDLwoemVXdiA5IoTCJiLLvajrfyo1bPwyqcyUG+H/t6CGWjw3z8kRQzS1Bd8gUqQo/s
	wR52Bn9ZJgxiyucEvQ6ZHxEthwxc9q/nvWeQiYVMjvSbIfoeycmOiYJxkrpRQ/SrmBq2vzj2EJn
	U60HfDqdaANWjCgKP8umM3n5rQlIP/EjWJjN1gTeLnKSg1wkpCbSJcbDVa1Af4z6PYT6qaEaBZT
	u848mK0ZZ86o3xETRLEBkP4Swvw2WQ4QaJNmEX88f+xstNoRqxhS53M0OhmnQ0bIlKyWfIUblNw
	rsCQe7PtiQJKk0LpD/66Cej4UsEPL
X-Google-Smtp-Source: AGHT+IFcXivfke8CF3Ua6fUT95VkCgqgOsG78wJbvWFT6tJJvWhz2bwcboGbcdFVisEshC8NwxZTJA==
X-Received: by 2002:a05:6402:2547:b0:5ed:3228:cfee with SMTP id 4fb4d7f45d1cf-5ed8be108a2mr7864450a12.0.1743168671175;
        Fri, 28 Mar 2025 06:31:11 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:31:10 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:29:18 +0000
Subject: [PATCH v2 32/32] MAINTAINERS: add myself as reviewer for Samsung
 S2M MFD
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-32-b54dee33fb6b@linaro.org>
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

I'm working on a Samsung device which includes this MFD and would like
to be Cc'ed to further contributions and help on reviewing them. Add me
as reviewer.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d4d577b54d798938b7a8ff0c2bdbd0b61f87650f..9f05af52b062d8cab0f8b48b2625432108604c3e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21397,6 +21397,7 @@ F:	drivers/platform/x86/samsung-laptop.c
 
 SAMSUNG MULTIFUNCTION PMIC DEVICE DRIVERS
 M:	Krzysztof Kozlowski <krzk@kernel.org>
+R:	André Draszik <andre.draszik@linaro.org>
 L:	linux-kernel@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained

-- 
2.49.0.472.ge94155a9ec-goog

