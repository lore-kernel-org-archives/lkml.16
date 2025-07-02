Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1121F153A;
	Wed,  2 Jul 2025 05:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751432670; cv=none; b=tuTjnfaMrpa6Fq74AarrMRrJaCj+Ga1htOwpEzo5evNqfhHbKqqGlmDhgL7A99BDtJ1xTZlCSCshb2kXJQ7niRuDgyIkojA7pKd54OOWcsonl7bemPragKN/DWqeOulIYG1Opzq4a76ptd1Styewrb6bmD3fzt0HFJPfsxNKUpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751432670; c=relaxed/simple;
	bh=RPZnWyEnrV401R5diozOcrTYy96YFnpOjsG3yTQ6AFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OvzfcoggA+kFmvDLqhRA+EPjkJiv1FcNCX/9f7O8+ZU5ZUk8iRQ6eUgRaZjKSrMbXtwhHzX5Ty24FPa3Q3jfdR9hgvo+h+0WssPMueVCoFPD56NpS8Tmpbr9kK01zyRUufyXR5h9zwNIuOFKwJ4Wf5AmKc/kdcwm9Wsf1mylYbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SgBFR6bX; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SgBFR6bX"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3141b84bf65so6235262a91.1;
        Tue, 01 Jul 2025 22:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751432669; x=1752037469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWSrZ7MoIPETCcOnlwZzNW8Pica/y+0lnik37Sdi1T4=;
        b=SgBFR6bX6jdkJAfW5BKtCQPj9c5F78ADemq+luyYlNAYOOO9tn7Fu2MCrLrWpO01Q0
         ucTR4i1+7QrrK5ndofp5zcYBTqy5woGdPlc1G03j/Gn3hi6TTPaAb+Eer3D+xHKQxseP
         W+wikW3GLlkk+aHFdbDRpB0TRkPOq2gAoG8Dhb0RzEnEFEkZtx7yuEB1Y7kAm7xXT0KH
         a3dHbmRMRcxGjEV4zo/A6heNkJZoknSFsSRosWIJshvUCkAJ2fdGKxE0Kzah6enGe0Eo
         7ateKojS3hnmhfATNCDEgWFGhhRWwooDZaXr/RPFM7Nxu2qXsBBw/eCqTBuAJE56zL+i
         YLkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751432669; x=1752037469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uWSrZ7MoIPETCcOnlwZzNW8Pica/y+0lnik37Sdi1T4=;
        b=d0Advxj9YRX+gWjNT5EAqJ+axsT9LfDowMz8VSLBp1KuNtkUyNMN7N09tzpGIvNc5B
         9zBV1s0zRzOtLXXbm+r0xEhXtDhlqZhS+DYuD/VfpAqdtDxJ1aWYYSwPfItfYusCS+qk
         7bJ3LGpFeuNtAeH5HNFxlI04yqwCK/av1NyaxX2xsnkj+1Ph35kgfFRuiRkxCE/McM32
         +BGhH1dfIYHuy8mQeg1mLLMccV3bRoVEq2+xCOqnFwNTvWKA9QWTsvb1+QDRra/3QaZ+
         pPffkx8tRb8Pkb+3xOz0Htg5LURLZbKGq26lKaLO79sGjwn0NUhtid/ZeTIuQu4PpRNu
         5mNw==
X-Forwarded-Encrypted: i=1; AJvYcCVQ1hirDnsqyR/pR4GhK1ZTB4vjK5jgG89dJXdQZ8aBraTP+s3y/CCg+fh6gLdSBzZNAkNItQvdzm25JNgW@vger.kernel.org, AJvYcCVpmie5DiqAHYbvbvhSJRZKgQapA5hZ/AmM/HrIpkOz1mjwh5d650VTut/OXT9iROHdrICp+GAY5Tbn@vger.kernel.org
X-Gm-Message-State: AOJu0Yz36TNERL9obWkRMq6aaBTbjhqg/FaaAGWgs0ZK3xSmu4hqPrcB
	a1WyGfE7UuxoR1/RooNA4kDyUH59m9q4MOQR3qQKECTJryz1ZTwN2JD/
X-Gm-Gg: ASbGncvV6mVVLfFU5lNxTmM9pctpo2SmJUEnr/WNBKfBCUq0vT4YLKW63QYlsIxHXnl
	DP00HZlKRMw+bNxam6kjKi6EKLY3kb3dx2PNI3QGWxh5Z/Px68R9F7neCR4Tx8dC+yZWvkFhP/7
	kjm/uzTqxLjqf9kZc+G23JZKfnKLMTy+kfvcKNITeGLj1SmgGUlkdPyqIlTehSjOqdYtXxRkxT/
	vd6kp93DbDyVtC1E1YAi68KmeFCPpu5WHGs+1h2iDnTwEfSojXqfjzPl75LfaX+dXW38fRVmfuz
	1CF1gPSQfiHbyBgqiRW3wtQN8N9h0QqPYlgJcpcoKOZdfRH6Aejk4CektmgbJa4SVCln8EwsgiQ
	Xs7pUD+E2u24psyJDgA2CiMJjniyCK/OsJ2ILcZY=
X-Google-Smtp-Source: AGHT+IGuJYvsdkS94RVkJwX3+DQ9VYFkHN7fl6zwMk3S0tAKLSb9AffKnRoc93xoFKLH+aUzWSJPCA==
X-Received: by 2002:a17:90b:224d:b0:311:ad7f:329f with SMTP id 98e67ed59e1d1-31a90c08804mr2307161a91.31.1751432668615;
        Tue, 01 Jul 2025 22:04:28 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f54270a5sm18168323a91.25.2025.07.01.22.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:04:28 -0700 (PDT)
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
Subject: [PATCH 2/5] ARM: dts: aspeed: Remove eMMC from ast2600-facebook-netbmc-common.dtsi
Date: Tue,  1 Jul 2025 22:04:13 -0700
Message-ID: <20250702050421.13729-3-rentao.bupt@gmail.com>
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

Remove eMMC device entries from ast2600-facebook-netbmc-common.dtsi
because eMMC will be removed from future Meta/Facebook AST2600 network
OpenBMC platforms.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 .../dts/aspeed/ast2600-facebook-netbmc-common.dtsi   | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi b/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi
index 00e5887c926f..83c9789d45b1 100644
--- a/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi
+++ b/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi
@@ -152,18 +152,6 @@ &vhub {
 	status = "okay";
 };
 
-&emmc_controller {
-	status = "okay";
-};
-
-&emmc {
-	status = "okay";
-
-	non-removable;
-	max-frequency = <25000000>;
-	bus-width = <4>;
-};
-
 &rtc {
 	status = "okay";
 };
-- 
2.47.1

