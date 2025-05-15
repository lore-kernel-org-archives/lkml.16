Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021CA28642D;
	Thu, 15 May 2025 19:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747337984; cv=none; b=Vtx1lJcnES/v2OFaxqHhPLml6nS98xbWYsnjiKwJ1Z4N/1b3fyqVhthOamzPUxhq32Mdq3y/Yqyc3MtqbWwxstCOlRNYo7pOPaO5KZgRPA67nTSHfIu3NdNJ0xS5PMpZnoH+KktpU1wq6n1b8klFzsDkFAgQdwM8/uA0zz2rkBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747337984; c=relaxed/simple;
	bh=MJfAK3c7sgX3bIlslZgAN72r8gP9KS/K7tVV1XvW7Sc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MBV0P51EpM2HJFfNf6Fi1kdayrJrR1c0x7kJ/W73TOGU61v1b0j3oGmgJcP3iif2zEakaywy69yev2idwXrmSopi915Mzz+uM436IH6fd0sUrTDIWA1dCMeuZw6lzTPF1qwdYABfzof4rlUDJT+4GJEZ8a3JDhw9Rg/cSgZSH0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TbXUJERQ; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TbXUJERQ"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so1611565e87.1;
        Thu, 15 May 2025 12:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747337981; x=1747942781; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fiQ0h1gm+58SwWG/Ylv3xbw2eD5gYtt7QUrqncv1bU0=;
        b=TbXUJERQfW/gu+qU1yEnnJ6y/RTTP7/VbwZFbi6FcJda0LecY/4RIgDRJvv1qIGbR1
         d8McfSfbL+WWsEwwG/sylI1j9E5lRJjX2g+T1RPzjFOKFz4UUShtbwZNrhBJB0rBprz0
         XMR3CVtVsxvgWKSDAsT7YwmDB3JJy8Kt7+z6Biuj0bIQ8TuxR28Xr0+O/Ecf1wWy7j3Q
         Pd87obSZtCoutxL6IFQStSEKuPRubTdYX0jElUx6dLe5MSAXblet4oo1ZbcVLtkLjkJV
         jS5SqcTFCb7fTz+BVX522/89K/fiyeZJPK28kHSSwsl3eV77j5/nfiTwWY+X1TjfFz+G
         Hwug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747337981; x=1747942781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fiQ0h1gm+58SwWG/Ylv3xbw2eD5gYtt7QUrqncv1bU0=;
        b=U3Ir1WwlfIJ2jsAgOH0JcWEf6iNQ1gjQfifh1OLO41db5/q5qvXvBzFepwyoHgYTA4
         JBpWgxEIjv/l0SEyfX/+NELuzmkmRWZ0DBp5t8PYr29HnI5o8gljEDNQfos7a3JNNJTH
         I+tpbhw3FyyKBbUKCQFybFw4AS1bzGh1idlVwZenJYLk90BkjLBa4Lpo+fzwVtAx5JPg
         CmCSw2zrRPHHow61qyZzvyI9zn2k4yDI98ddRf3aU69S/RWssyvcKwuOdasp/7uX3Klw
         FvbyyID8WY1YZbm9u2HEgoYy39NVncLrDA2peGnUIyofcZ2QUcJmz5iFCyLzbDgyl5mJ
         aBFQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8XKghpDvlpuXW0sVru0AH+tflLrIA2+sjau9GUr7+iUX9LC0WfMSbhw7LQTNOocvlenHTx0PrebRRMqNp@vger.kernel.org, AJvYcCUv1gBvsEHEI7Wnumhxcgbrebjlu/+n0VJpR3t7GxUmNoVPfLE34Qa/40sWdm+TE/rxUGB2zFEL0nIv@vger.kernel.org
X-Gm-Message-State: AOJu0YxI3hZ4Q9hhrHfMHC9BVrQtSnwl9ySWjy6RNuHy8UkOb7Nu7BDs
	7AGBvPHOv+K9V54Y3UDd7rAAid5Gm0++hU8z7HE6LkjSBIf9PkogZUpT
X-Gm-Gg: ASbGncsYrILxvETt6uiEaAJjjICkc9HPpG16aTEQtELJGaSpPELXvZI38nL5cVT5oTl
	DZfyGWdh6eU+Six/ToQq4VapRoSR97d1UhJPGOvxK9LforYgn5X/sik5cdSvOvmzSgGDSXs5zzT
	a0LhYbnwbJDTleGuT1zbX08TWK2RIjLMFhbXCiNeD3+YBxS8LxAocQmcb/jE41ybWUUbwmNUgFh
	Z4DKgrHIkSb1FoUiL1pkHbuDAhY+vXBpfxR1mJJTdaDEdI79W2xXDtHWwqLprN7I7FqCaRsFgGh
	Id7RujMHEJSnf2pYRK1S6neWirupNlL/PUs8FgC8HoKiL0yqvZ8XDY02jyQftGqt
X-Google-Smtp-Source: AGHT+IH2rrWs4kDErxqMq6b9kePeGaKA2FEDnIeQ+pVM8RJH0dya3t1BnUfw9uQiCK7wVRnehRIfzQ==
X-Received: by 2002:a05:6512:4508:b0:54f:ca9a:5267 with SMTP id 2adb3069b0e04-550e7222369mr222829e87.37.1747337980859;
        Thu, 15 May 2025 12:39:40 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([95.167.212.10])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f544sm72297e87.235.2025.05.15.12.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 12:39:40 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 15 May 2025 22:38:41 +0300
Subject: [PATCH v2 2/5] ARM: dts: vt8500: Move memory nodes to board dts
 and fix addr/size
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-wmt-dts-updates-v2-2-246937484cc8@gmail.com>
References: <20250515-wmt-dts-updates-v2-0-246937484cc8@gmail.com>
In-Reply-To: <20250515-wmt-dts-updates-v2-0-246937484cc8@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747337978; l=5773;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=MJfAK3c7sgX3bIlslZgAN72r8gP9KS/K7tVV1XvW7Sc=;
 b=COKK9BMnfX9rt3fTup09zuyoC1r9j5H1d2ENM9cZOogie9tr8mFWWnbQ4qdDO+kcN8pu+iqSP
 KaB+nvWlCy1D43mCb7iFZJPvROHSu60xuuRf90yDv9kD+/XhF1Lprkv
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

VIA/WonderMedia SoCs don't have on-chip memory, so their memory
nodes are better placed in per-board dts rather than per-SoC dtsi.

Move them accordingly, and also add correct node addresses and
sizes for each of the boards. Some boards were also available with
more memory than included in this commit - those would need a
separate DT or an appropriate kernel cmdline argument to reflect it,
as the bootloader on these devices doesn't handle DT at all nor does
it any runtime discovery of available memory size.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm/boot/dts/vt8500/vt8500-bv07.dts    | 5 +++++
 arch/arm/boot/dts/vt8500/vt8500.dtsi        | 5 -----
 arch/arm/boot/dts/vt8500/wm8505-ref.dts     | 5 +++++
 arch/arm/boot/dts/vt8500/wm8505.dtsi        | 5 -----
 arch/arm/boot/dts/vt8500/wm8650-mid.dts     | 5 +++++
 arch/arm/boot/dts/vt8500/wm8650.dtsi        | 5 -----
 arch/arm/boot/dts/vt8500/wm8750-apc8750.dts | 5 +++++
 arch/arm/boot/dts/vt8500/wm8750.dtsi        | 5 -----
 arch/arm/boot/dts/vt8500/wm8850-w70v2.dts   | 5 +++++
 arch/arm/boot/dts/vt8500/wm8850.dtsi        | 5 -----
 10 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/arch/arm/boot/dts/vt8500/vt8500-bv07.dts b/arch/arm/boot/dts/vt8500/vt8500-bv07.dts
index 38a2da5e2c5d64477f04e1da9d98cb97be0d95e4..c8c07c2b4acf92e977704437de88550391c8679f 100644
--- a/arch/arm/boot/dts/vt8500/vt8500-bv07.dts
+++ b/arch/arm/boot/dts/vt8500/vt8500-bv07.dts
@@ -10,6 +10,11 @@
 
 / {
 	model = "Benign BV07 Netbook";
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x8000000>;
+	};
 };
 
 &fb {
diff --git a/arch/arm/boot/dts/vt8500/vt8500.dtsi b/arch/arm/boot/dts/vt8500/vt8500.dtsi
index 3cd86941db90c08ae4fbd3e0b1b079623bce28a9..30ebaaa1e5a4b53094b295570ab6e831acfb1c93 100644
--- a/arch/arm/boot/dts/vt8500/vt8500.dtsi
+++ b/arch/arm/boot/dts/vt8500/vt8500.dtsi
@@ -21,11 +21,6 @@ cpu@0 {
 		};
 	};
 
-	memory {
-		device_type = "memory";
-		reg = <0x0 0x0>;
-	};
-
 	aliases {
 		serial0 = &uart0;
 		serial1 = &uart1;
diff --git a/arch/arm/boot/dts/vt8500/wm8505-ref.dts b/arch/arm/boot/dts/vt8500/wm8505-ref.dts
index 8ce9e2ef0a81097e7143a5392ee5b42bf8028ec1..d4ff99c700120fbf3401335168ed88b190335005 100644
--- a/arch/arm/boot/dts/vt8500/wm8505-ref.dts
+++ b/arch/arm/boot/dts/vt8500/wm8505-ref.dts
@@ -10,6 +10,11 @@
 
 / {
 	model = "Wondermedia WM8505 Netbook";
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x8000000>;
+	};
 };
 
 &fb {
diff --git a/arch/arm/boot/dts/vt8500/wm8505.dtsi b/arch/arm/boot/dts/vt8500/wm8505.dtsi
index 34e55b8c2c8b20fe2598ccc9699551dc9c8e69a6..8c99374822f65352102df83a33a1ac072127ebc1 100644
--- a/arch/arm/boot/dts/vt8500/wm8505.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8505.dtsi
@@ -21,11 +21,6 @@ cpu@0 {
 		};
 	};
 
-	memory {
-		device_type = "memory";
-		reg = <0x0 0x0>;
-	};
-
  	aliases {
 		serial0 = &uart0;
 		serial1 = &uart1;
diff --git a/arch/arm/boot/dts/vt8500/wm8650-mid.dts b/arch/arm/boot/dts/vt8500/wm8650-mid.dts
index 7977b6c1e8ebf215df210dee703e470b9159d329..bfc570e80073d5e6907978dfc5d2413e1ceb2983 100644
--- a/arch/arm/boot/dts/vt8500/wm8650-mid.dts
+++ b/arch/arm/boot/dts/vt8500/wm8650-mid.dts
@@ -10,6 +10,11 @@
 
 / {
 	model = "Wondermedia WM8650-MID Tablet";
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x10000000>;
+	};
 };
 
 &fb {
diff --git a/arch/arm/boot/dts/vt8500/wm8650.dtsi b/arch/arm/boot/dts/vt8500/wm8650.dtsi
index b42c77f99c006af31d4be8bbb985f536244edf8c..2daff177979b482eac7e21ec1b17ba000ea69ef3 100644
--- a/arch/arm/boot/dts/vt8500/wm8650.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8650.dtsi
@@ -21,11 +21,6 @@ cpu@0 {
 		};
 	};
 
-	memory {
-		device_type = "memory";
-		reg = <0x0 0x0>;
-	};
-
  	aliases {
 		serial0 = &uart0;
 		serial1 = &uart1;
diff --git a/arch/arm/boot/dts/vt8500/wm8750-apc8750.dts b/arch/arm/boot/dts/vt8500/wm8750-apc8750.dts
index 136e812bc1e498d48c7fc61154bc66a48888b117..72d633bedff04401c40f4d3772fbcfe45e1c0e31 100644
--- a/arch/arm/boot/dts/vt8500/wm8750-apc8750.dts
+++ b/arch/arm/boot/dts/vt8500/wm8750-apc8750.dts
@@ -11,6 +11,11 @@
 
 / {
 	model = "VIA APC8750";
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x20000000>;
+	};
 };
 
 &pinctrl {
diff --git a/arch/arm/boot/dts/vt8500/wm8750.dtsi b/arch/arm/boot/dts/vt8500/wm8750.dtsi
index 68e325163061b11e52027fbf291953a170f39469..60220d299e21101ce8102b376bec5382ef5ac0d1 100644
--- a/arch/arm/boot/dts/vt8500/wm8750.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8750.dtsi
@@ -21,11 +21,6 @@ cpu@0 {
 		};
 	};
 
-	memory {
-		device_type = "memory";
-		reg = <0x0 0x0>;
-	};
-
 	aliases {
 		serial0 = &uart0;
 		serial1 = &uart1;
diff --git a/arch/arm/boot/dts/vt8500/wm8850-w70v2.dts b/arch/arm/boot/dts/vt8500/wm8850-w70v2.dts
index 5d409323b10cb94a5694722de1e31cff5be390ce..eb16991a2cccf35da23c4a0a8ac2ad02665b2109 100644
--- a/arch/arm/boot/dts/vt8500/wm8850-w70v2.dts
+++ b/arch/arm/boot/dts/vt8500/wm8850-w70v2.dts
@@ -22,6 +22,11 @@ backlight {
 		brightness-levels = <0 40 60 80 100 130 190 255>;
 		default-brightness-level = <5>;
 	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x20000000>;
+	};
 };
 
 &fb {
diff --git a/arch/arm/boot/dts/vt8500/wm8850.dtsi b/arch/arm/boot/dts/vt8500/wm8850.dtsi
index 03e72f28d31b1cfdcfa71ede93b8943971bae4e3..1efb8989931d0dab7b946c906b50292b09fc8bb3 100644
--- a/arch/arm/boot/dts/vt8500/wm8850.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8850.dtsi
@@ -21,11 +21,6 @@ cpu@0 {
 		};
 	};
 
-	memory {
-		device_type = "memory";
-		reg = <0x0 0x0>;
-	};
-
 	aliases {
 		serial0 = &uart0;
 		serial1 = &uart1;

-- 
2.49.0

