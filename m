Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C43242914
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 08:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670772; cv=none; b=hfEeOmEtR4pYA4iOhaYFTS4zIhebgwzmNw2AUc+EGriaayXx2PeuMsAw1oxDX0ThGQLBGKtBpGz8CYGuppU44+uof2phLDIEwRYoV5Q6BWJio3DXvCCrkAI26Fnptvn79Dg5A7uAQfq+m+OWyfBQstexa4HuaP9dKTcPO7z9V9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670772; c=relaxed/simple;
	bh=+fAAJ/+/3MbgFo3bOsjQzn5S6tmp2xnmlCT4juP9rJM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JUJp9y/o/JDyvAzSAOF2S3hLnvYp2RnfH0uCP9PKW3sIIo5BRtUz5gAYTym9lhDVYY4SpF30UKDpH9Z5fOWGESsyqP0LjktvXKCdPu7m+pTc+N8E7iwG3k8KESEgP6v29Ragcz41U5YUDeFKQTDrTVMKLcxx4RGbn+CYDUs14Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sKCadj3y; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sKCadj3y"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5ec9d24acfbso3304841a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 01:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670759; x=1744275559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IvD3NPE37fI+ZqUrH7EmoQBagetQaG70If7tawsO/t4=;
        b=sKCadj3yJo3JCJcQbG8ljCh98ao0jmPNWJjFoo/83PbHsIxh1WRJrXCyEFNnjHnnaE
         dUnPsC5DCafvc49EySVtc6597ytJncgH42PRCo04bQmbkSfbIK8oOz1gxmGqWtISnEP9
         Y81Do0JzErnbwsdNRiAub5aQmyDszrvT6IHnEJrMu+1HIThiYzIVbUWrNYO/s0sU7+qz
         K+J2UMlFbL96hqJRIuonbrQU/oO/dJBnij6zsYA7161bz6kXiOSV0cWg/KcDTunezmP2
         ZrjZDHF2uyeROZ/8ugTOmcsHo+sKLhOhcfPy82/jB/eKIoaIUD0ra9VN+O58Y+igJE2w
         fdYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670759; x=1744275559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IvD3NPE37fI+ZqUrH7EmoQBagetQaG70If7tawsO/t4=;
        b=eTCl/fN3WqDFrVqhZpHIJum/hgW+Ty9laj+B/kRdPReKvOOC4EBoOTY5HVjcXs5vbn
         8bOGOpm3kuJ15AFuz3bjd8EY66E0CFQU8VXKIA3IZKz8X+wXhWt1S+SQp05+ISvxQuYC
         EtNiaG4BzRPbyDIu4wlnqnwcpJSr1Y0R7dXH6F4lAR9185Wwr+PNFmQtylmJh+i8j4mE
         xrlzTk3lZlTByjrhaZvb1A/vql6sxVdTZSB1giRSxjBY61zyy3kg6pqg72+Iyj/yZ2fy
         wwipQOmwUACrpy5XIdpYXDzzqPHI1tp/F9zUOdY0I+irxBiV/5LEYshz+w1L8UfkorvA
         LEKg==
X-Forwarded-Encrypted: i=1; AJvYcCXwacN61hiTqtIEcqXRgmyAStAEk7Lha0wFG8tBnIlge4KEXQxTdPTBH6ma307VHTmZeKpzbXFKtjzjwL8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/Eail1bsBdMY2RGaQTJ0rJfTyy/2zaKoK9Ya7N6XMli53E9c9
	wKALw/+MJtdTl2GVoMs0wGtsFpklrGzxNj0816ePbgy90sYj1PDDXpDbW3DScSo=
X-Gm-Gg: ASbGnctjXqDPo6fAXBkZ58TCEYMc00Z5dymH/jo/yW9/+uWSWmrWMJ25hy1ijpRNlE7
	agbciPVZliFM9tNpqaOgm9H0p6Xu22B3mj/NbT6t+Nu3EMEAXjmUh7bxbNzNTtqva+jCmeb6nyh
	a5A28+qpK8PcZPxQLZNChTLkEoYqJqP+ysEe55Tp7aLkJ6Wjp5ONd2mE0PKVU6rn2jnu4382jZn
	Moqa/4PefSPebAUt0/XGf8FEg70nTUcrKkvGHhk8+9uiVuLCuWxmzIFfeiDV8UFizL/8SA07HP/
	pD2KZm42TfKPz4RvzsjMapQlKAPIMm2LW0saAzWVdeXAry16LR6neAQST11nli1PgH34sh5obAo
	Pntm5MbRfdS3qfanc5g3XVqjXahjqs8iQ6l+lB5s=
X-Google-Smtp-Source: AGHT+IFW856PFsje+adb2s76FgPUdBl97yj4uiiEZ9rOztAG85/+V2CgHnNshHz2zvEqYifTEoo+Rw==
X-Received: by 2002:a05:6402:1d55:b0:5ed:5cf6:e168 with SMTP id 4fb4d7f45d1cf-5f084177cb9mr2170046a12.9.1743670759408;
        Thu, 03 Apr 2025 01:59:19 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:19 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:24 +0100
Subject: [PATCH v3 32/32] MAINTAINERS: add myself as reviewer for Samsung
 S2M MFD
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-32-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
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

