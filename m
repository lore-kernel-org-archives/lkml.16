Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BF723E336
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 09:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747819714; cv=none; b=prnybio5tD+dNerUTZ3snMj+3FxETUkM3lzPub1ExLEJJeBC9Z3AgryvMyJCv1OVMKxAHhaqwZnT1zhSCWHFZanPUENAfDkRojlpGpJoNRviD8zkUWqXnIIE3OMpckA50v+dn7Hqx/85QpbIDqdqQvSCfaUoi+mpj7kXGEa7oT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747819714; c=relaxed/simple;
	bh=FKD70PE5Epxp3lEHLPKpUCel+rzHcrPmnKbb2/plsmE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ppuDDEXrLrPJnEL2h+n86QqmdNYMj4YxZNfT57WaZHJYSlofgeopnY8uexBapQziz0bH0pLvNymS3BEcS5Dbu88WhnZZca/7GpGqB/ni44szmv9IeoO8gAfzIyYxRtGIcXszF/UA4tpT9CMjK+6iF7rD0sdQH8K8dnAdarbJk4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=dpbYy8La; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="dpbYy8La"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ad5a11c2942so205670566b.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 02:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747819711; x=1748424511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K4ZKx8OEuhG5n3iA9Ht1qjJNqikHTEvlSRpqNyHprtI=;
        b=dpbYy8LarCP2vvASLPTuCPbtlTK7i7/C9YiSAac3EMOUGzMRccHzqO8CB30K7HM2DC
         Tbd4vxIf3UmUFkZu4AlXr5T2qPm4Gyxt/fW4Pvh1Zw0yKIJfIhVPnNNpamAX3ywWgoSz
         DYKyHpqbbwK2xIlONSrqbI7m21jA76mupAYuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747819711; x=1748424511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K4ZKx8OEuhG5n3iA9Ht1qjJNqikHTEvlSRpqNyHprtI=;
        b=QAQzEoWffr/SZ6btuqzXP2QqNSmzRNBh37/YOQwLutbjfULm8Jpzg/khy8uTEmZhvf
         esZtJ5kh4fZd0vNPPw1gPHlBoffR1wdkQRFHM8X/elmEZaC4t7uH2fG2rfBo0sab4oNe
         LheZKUxae3AZHPF93CPWWJVdqYS6hf+eluvXGFPe410KtUXQFmKdb+P9Nol1heF01lld
         568Y6JED7EK7pnBG+AIwjFlxU50ttnXRVp+fl9KfSa100JPRuaeZhMXh2MetHmsF8+zO
         ysdK9ncgXpcPCgfaPAOcTRpTaG7gf/SZ2yYZIGQiV6towexqZd8IjGttilNwu3hJD11l
         PR9g==
X-Gm-Message-State: AOJu0YzkNugH6tOHo0Fa+KpJqdJ7I0wgsEX6xWOqHH5ExlZEpmv6aLlC
	M7d4uAyiJqdGdV/IILlM0H/RKfgWXIP2/wn3LdUU7SlzXSbULeIYjuMH2jxEjTADSyAEDHLdBZ7
	+ZP/8
X-Gm-Gg: ASbGncug3zgHrM25BFITgzEutUiLrHEeuoPAb59Hqe4VYNtnkjQ8qSxWTWiXLR7qzpl
	HE0DVcOxHAchj3ZZjJShBArcPBIUAQYoV5FnfD7riRL9D4vkIblvahZ75iIDU+y56Izi1kt8e5/
	5uMKbQ/30TtyKTpXIsPSPrqgKECVgbHRcVG3H4kSfJ1CZzBqztaVmyf8nsWI433hC5k5pYDVGSC
	x8xNw1JHpdwpDrt84K5tkOGYwuVXBtB0xaaZ5OUfN6qkRK2JEqSrBtOFDw+oTgLIIEJC+5xQUTI
	Gy2raHSAsukZizsf8PUVAX8+VtbmXR+jIQr+MaFpWJId13yYP9gRJpQe0cT7ye69o5wykTbeI+q
	6+hzaZ/adehXt
X-Google-Smtp-Source: AGHT+IFNzWiTTqQss9HBBtI+Nr/N9FAThr7Gi7sc3HVIWm4O6Gp1xrzlrO/3vjZUf5bm0cbWUM6fkQ==
X-Received: by 2002:a17:906:5582:b0:ad5:4b4e:e2f9 with SMTP id a640c23a62f3a-ad54b4ee44emr1238839666b.1.1747819711158;
        Wed, 21 May 2025 02:28:31 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:cfc5:5070:d6f4:1d86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d275d9fsm867442466b.74.2025.05.21.02.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 02:28:30 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] ARM: dts: imx28: add pwm7 muxing options
Date: Wed, 21 May 2025 11:28:20 +0200
Message-ID: <20250521092826.1035448-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250521092826.1035448-1-dario.binacchi@amarulasolutions.com>
References: <20250521092826.1035448-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/nxp/mxs/imx28.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/mxs/imx28.dtsi b/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
index bbea8b77386f..ece46d0e7c7f 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
+++ b/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
@@ -755,6 +755,16 @@ MX28_PAD_PWM4__PWM_4
 					fsl,pull-up = <MXS_PULL_DISABLE>;
 				};
 
+				pwm7_pins_a: pwm7@0 {
+					reg = <0>;
+					fsl,pinmux-ids = <
+						MX28_PAD_SAIF1_SDATA0__PWM_7
+					>;
+					fsl,drive-strength = <MXS_DRIVE_4mA>;
+					fsl,voltage = <MXS_VOLTAGE_HIGH>;
+					fsl,pull-up = <MXS_PULL_DISABLE>;
+				};
+
 				lcdif_24bit_pins_a: lcdif-24bit@0 {
 					reg = <0>;
 					fsl,pinmux-ids = <
-- 
2.43.0

