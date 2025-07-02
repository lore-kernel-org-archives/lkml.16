Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEB11F8751;
	Wed,  2 Jul 2025 05:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751432674; cv=none; b=QR8TuAHfzNLVitI0CzlcPcWhsu093g6tOlYPQm+wDmrvbfX05YlPxVnp0CgDRf9xLkOyeMQmYnWeLLI7aKMnNvI1crmOsOaHrp8IclE/QWG7C0vhuXi/18N3B4KVA5Pykzve1WoAO1MAkcUhkt6eXhW2UpWnrIUsB31BZOv3Vmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751432674; c=relaxed/simple;
	bh=6jrh8FvFCCpVpziXCKvBd0fiZPusXArM/5ZrGnFWymk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qa0lBMxZrBPxRXuBM5Nh0CjHowyGX/gwzgISjr97dGD45qnzcqw3Pvb6w76Q/k4QVMLmydU/hfwnjtGcjSDQxTyVfOFMMZFQGdSnoJWxm0EdKfX/dtlYqRfUYdxMgdXYtrnkMwOtXkSrfiB7/UuRn77Ob1Tnyb38nfzoPn2/aeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mb4GUVJK; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mb4GUVJK"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3122368d7cfso4085859a91.1;
        Tue, 01 Jul 2025 22:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751432672; x=1752037472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LIMFKP9o9HCYgCUtge56j7nt4ExnHtWvQ7QUrOurhM8=;
        b=mb4GUVJKzZLxnrPlg6XIysnd62Z4gRCJKSvL4LCbJRwUYK2J9N9klN+Z+0PvifM4ig
         41KXknZIHrBWSZ21SoCHhTHpphvVXcgfyKCgBA3EshPwtGt30NU82wUJyJ12HxDbwfbu
         I/KTtOAZVed0yAnq86b9AIo8ouJVaKzs25n07nHcVooROABuILSg02FSqEklqu/EiW5+
         FwomZKDHIjT2cgyyzutAJHeKTZjDV9VyOTQrCfZsKhcXR77qTp1gca2JX3BREAIRH6QA
         ZMUQmFk2Nwb/QZ5Ejfta85n6uA27ZX93kDrpgL95Dcgz/OB1VYWNP0W6R3BBrgahUrN0
         7dSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751432672; x=1752037472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LIMFKP9o9HCYgCUtge56j7nt4ExnHtWvQ7QUrOurhM8=;
        b=gp6Zg4u4UCFAC/tTd4R074n0UKuPh2K9LTtRkGYkFfZ0IBSxhEgIeA/6XAYjiUCR2j
         lPAl6o90rysP8zyW/l3bxLltZwqSmG9o0L82hV2gzOY/cBX8upvHSOZkrtO023+sE2PP
         6XsRy7jD8IF7p+Dr3BJClht9FCR82UQj6PRRYn7bS7eZpfwPW7d20QWEibPqmuByVwTD
         drVPuCD59nP8pLALy42ppcUJiu73fgCuS0oys5+VCrW8vTzkbkShupYEFCaHVEPnQl1L
         VlF7wYjjsh32IZM41cACyqglFzdQ3BOjt3NIrSyPq0tpZx21g8MvEOtp03qJUpMRcfXt
         AZUg==
X-Forwarded-Encrypted: i=1; AJvYcCVj0r5KWIG2F1QnO9gF5F4+JWTT9WYaBHZ2LsnR8AOeX3+gxDxZYkH5CVIw3aUD366/zHYxSQVx967t@vger.kernel.org, AJvYcCXqFq3/a3sNyg0eJlOjvoa6+CSMVgLbwx0twzuFgfMFjB9tgCCmEKax03mpjU/PYK3nL/9YkHQscHDTQWkX@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9/Tzha20hT+WU2a1w3HV+UJ+IaDJUF73s6hoEdMIS1Mt92Im9
	ZySedCBoSk9xkodlbml0yBxrZal5c+xTCoCKK9VSb0wji5OzclixBwOu
X-Gm-Gg: ASbGncsiTQErimNCnLfaC6B3rHRI2XtYWWzIlwwA+73jioZFTeyF6gvKP0pT90OCAB9
	KbgIMAvS781PNBBeeUZ6d8/za1YSV9e7jTas79qJhfNqdRgboQcWJLCqOXZDh6agVQawHSPGQ4h
	OrJS4GhvSzpshH5Cf2S748UG1IkWGWMG3XBAH+BmkIIJLeM9fzAmQ1Vs2AOkUZdQPCCkwYTSM1O
	gUsIvABvMfHe8IjX1E187OCETOJUMsL3c7O94gE7SB0KT/ScNXfou+WwAUz69snacPlMrCkYtTM
	SNtT1ZUiHee7f7ueYTRKMO4XKsdgEIh1NWDuMTIdFqjFhrnjVfBpLyn5YXljhN7GzDYT+xy0GNS
	hbQEroDgndh/7s14Du3A8kSrgfLHG3ThbMW1a4fU=
X-Google-Smtp-Source: AGHT+IEQ3S87fa9ZqPvK0q7rgVUNEWS84VK96kAXRXHNuFvPbQyf8Vjt0suBBc0zAlqL2fFCZPSi+w==
X-Received: by 2002:a17:90b:4c0a:b0:311:e8cc:425e with SMTP id 98e67ed59e1d1-31a90c0e00fmr2518373a91.31.1751432671900;
        Tue, 01 Jul 2025 22:04:31 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f54270a5sm18168323a91.25.2025.07.01.22.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:04:31 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Tao Ren <taoren@meta.com>
Cc: Tao Ren <rentao.bupt@gmail.com>
Subject: [PATCH 4/5] ARM: dts: aspeed: fuji: Enable eMMC device
Date: Tue,  1 Jul 2025 22:04:15 -0700
Message-ID: <20250702050421.13729-5-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250702050421.13729-1-rentao.bupt@gmail.com>
References: <20250702050421.13729-1-rentao.bupt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tao Ren <rentao.bupt@gmail.com>

Enable eMMC device in Fuji dts because the eMMC entries were removed
from ast2600-facebook-netbmc-common.dtsi.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 .../arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts
index f23c26a3441d..8602ede3ec7e 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts
@@ -1249,3 +1249,15 @@ &mac3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rgmii4_default>;
 };
+
+&emmc_controller {
+	status = "okay";
+};
+
+&emmc {
+	status = "okay";
+
+	non-removable;
+	max-frequency = <25000000>;
+	bus-width = <4>;
+};
-- 
2.47.1

