Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EAF2E426C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 14:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751034205; cv=none; b=e6kjyuiTKvCOIulQ8XAUBtEfv1KZnRNvLhlLcPX6AVp2hr/fjE5wTJsosgPOMjp5TN90UHGWM0xVwug+/H/JXVlZPSKaMUo7xFY1Q7KG20XnSnK0v+foKC4oGENGWZx/NRbB0wBOFwh871esmmGYMsQ1vgY9cSp8k2VMILZQMlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751034205; c=relaxed/simple;
	bh=E/I9W6fX+DhSmsmtI3yC9YfnKc4TowcG2XvObw3IonQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ju4cUJxOJTf9tmXsWUAVYwGvCHJoDTPA8xHJiwrRK9jwvdkKKeh6pSFP5oeJQ9vHlOJpxhKwePHeziJ4JJyziMkSG0lKbGZqnFgEDVTw46U9pQIoV8L+ry5DOug4cICkXw6W6ynoSQLKyQWcCGOYDYeVBYQSm5h7/hVfwFixdS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=vyOnL0Sc; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="vyOnL0Sc"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7d098f7bd77so251451685a.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 07:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751034203; x=1751639003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpaBoGbv3UwS2ctJ5MNrLd4WnRBIdXYjgTh8qQmsLHk=;
        b=vyOnL0ScpdHDCvKl57jCczsekDM9IM1QoaW+iyOJlWxRzrOUhBr16IPASxwBTGflyK
         ted2mCV9+ImgzVD0BxXBqjybykmqTYUytYVaDqUjhoUBVi72v9x0ts7BS/Fydg69C75X
         MT2btvkVIY/0Esfgz83iESJo/GJNNvTNdDMz3sdSLAbc0P9tdUG6Kp5sSJ2RNaF770Ct
         TBSeNMnsMELfSFM36W72FIY1L+glqtZbB5lpeYN0aARIWETa/nLY9Rvhi5ISTOSgV0Xw
         WZYlgzRgHQIFLQIK4mOfWQbWQ/cWvKayh8jxVAImPWeJ8o6D9fFH9q0XfVGNyK4cG1e7
         YKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034203; x=1751639003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpaBoGbv3UwS2ctJ5MNrLd4WnRBIdXYjgTh8qQmsLHk=;
        b=B7P/gGFN99BdlYNYWzPtLBySGPICc1qov3bRx5dC4GleYcY8Ny9A8e9n52UBTpA6ds
         Qet/CW/JoWmdJhuD3/1xGMBVBfpjqa4F5jVu4SiYlB4jKLW62C6n0B92kBYYXWCy4XX2
         e+0mmUYtTQqiCYH2F4V6ltkN5f6xLMkLbAFx1hSzH45CMN3ez4EVdLdjEPJmxxGLdbbo
         baIt9Ok90ErQrrwfwPOqGdoPSuizEYuXEJ++fSgIsgwjF5LqRVB66pC4s2D7ki+6k1hJ
         7QstwhOmwJTnUtCo4TqZt1ySlXXhaBNj6HBL3NfOURlkQfDuKh3NbyRQjj3N/N2/VtNJ
         ysZA==
X-Forwarded-Encrypted: i=1; AJvYcCV4ucFuF6wM6OOL7ejaXtfmYeM+EYI5NvdN9PIRlthI63nbTB+2xWzXfSWXApF1Uq7GriDq0jg0RwYjCF4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAlZZi55k55J36Gd6lUMjl15+OO1dcn1slfKxL3xGuMgk2Kt5x
	pGMBhnf++UrqjmzaBDZjwz69swGLuQk35DgiK/UbRpaIrZDx0z/2FRHypofBXGqF4pM=
X-Gm-Gg: ASbGncuNZKtSd2peTLw1Cpx6RLfbBr9VINChfDoBwSl/C5euPWfTc/dbJbf6Gcx0L5s
	ONQfXe15VP+yYBVfozVXqq0Qu1Nq4nlRBUnTtdVeH1ERxYme2jTUAJ1C8+J2WdojWnwDSHMvADn
	yhdRIdhxP6H+3oIck8llLEr4Iy0iWB+aybsTKDN1ZEtyPLkWTNuNlczoRBm+13VF4t0jVNs2aaj
	nZCftL+7lGPt5yENnObrp2K9MDaZ+VjETcV+giVkLu1Y1u7oPmvh751XViIHWcYX1Y1gkUgzzN5
	LoTsQmdK4W16HEfu/q+Ople1pUdKvLrov0XAoTV9wK9ZLSV2kaudIUwIbTUV9Camzx3utvQ2387
	NEp/omAMBTM9fNL4HfqEwSUpjS6CyeqZ9gLA=
X-Google-Smtp-Source: AGHT+IE88bXOLiCjUu2+zVcecKfJf8g4CQ5BFAJMyhK2OHk7mseb/EKQgLzh833iCYXdtJd2+G7LJg==
X-Received: by 2002:a05:620a:2729:b0:7d3:a7d9:1120 with SMTP id af79cd13be357-7d43bc15837mr1028658485a.24.1751034202759;
        Fri, 27 Jun 2025 07:23:22 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44323b4c4sm135708785a.106.2025.06.27.07.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:23:22 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 7/8] riscv: dts: spacemit: define fixed regulators
Date: Fri, 27 Jun 2025 09:23:06 -0500
Message-ID: <20250627142309.1444135-8-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250627142309.1444135-1-elder@riscstar.com>
References: <20250627142309.1444135-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define the DC power input and the 4v power as fixed supplies in the
Banana Pi BPI-F3.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 7c9f91c88e01a..a1c184b814262 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -28,6 +28,25 @@ led1 {
 			default-state = "on";
 		};
 	};
+
+	reg_dc_in: dc-in-12v {
+		compatible = "regulator-fixed";
+		regulator-name = "dc_in_12v";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_vcc_4v: vcc-4v {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_4v";
+		regulator-min-microvolt = <4000000>;
+		regulator-max-microvolt = <4000000>;
+		regulator-boot-on;
+		regulator-always-on;
+		vin-supply = <&reg_dc_in>;
+	};
 };
 
 &emmc {
-- 
2.45.2

