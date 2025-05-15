Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B000929B761;
	Thu, 15 May 2025 19:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747337987; cv=none; b=X3xTpZMVtV1eiUMzdrLVHc0PpLb9jFAqROWI1JzE4o19TJwky2mPR6hiiLvy6WehV/hnkIZ3hzy7wuL8CAfVTGpL3GbrYyDWSeJ8hAWVvymkuyX+xTfMghLrIDcAzPlBq9JoXMYmYqV+uB2SogxSiFN043FFf3bjByk36+/5x1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747337987; c=relaxed/simple;
	bh=DSJDp1z7Pob8W8/VBKGX9pG7ZPkhnhBiDbakz3e1J+w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ariTawi0Z5D8VTMlGFQ3eKw89Bc6Ya++0sCZhcbopyyXPgecQs4M6AbXnCyu4n0DneTw4AFR+JtL7we3nhgqOri6tq/PTi1u8TDpq/6R3Al5pLsYQn7utmVioB44f2RTEBwue4ZPzYBt8PhXleXf1s+FcQDYz2sqcUu85nOqckU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l4YPuvab; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l4YPuvab"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so1611592e87.1;
        Thu, 15 May 2025 12:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747337984; x=1747942784; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7kPip897cJRA1ZyK07OQSKvEd5nXI23QmwVusagPdyo=;
        b=l4YPuvabGF7nF+imjnCMYbv7HKfrFUYjvAJegsPOXdtQ5TLYpqXzQ+bW97RO4WI7Ah
         DMkaTLwBAiotkZ0lGt0gSRlyR2lpN6eIqfJ4gpimjn1gJAIDuci9GU+gUqEM9nJhualh
         KXLMqIPT5MxChBcXqiqXgU8OMkeg+5WFYo04akW8mo9cxotNLv3Zlpxom9chlsIpOEgT
         HbxTmZ7dE5TEKZ6Cdt7pnjstIqO6XZWqSHsJhR5L+v+7oTaZEeZGXhOBKAy6h9BQNN6C
         gUpDlMbx4qNqLiux93YqxJr6Ehyf/2DSBBlzI/lKzVRuzhFpzro3vuhoJv71UXZbFdxU
         e0lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747337984; x=1747942784;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7kPip897cJRA1ZyK07OQSKvEd5nXI23QmwVusagPdyo=;
        b=JGuddTVtC2S1iOC47zi8VPKIh8a7+FWOnZVa8LIleLFOuYoseJ/y2PtzXoni15CYto
         1QvUUJS64mS+GC7CibfD6oBRgcVKKQpx3POL3YcYhAlcJVYgfoe+OkxAxM521RBghvMT
         EPbTasfQRzclDf/1MLDGZc0u6icr5xnh4VlMcqLxqvkBlelVr9dcBqvh2KHFIVXX1uEk
         +wWa6ejFnOn/UWfU9HmmXfvL5KrZIm01PWONYL7xj5qUt1FO0UocS1OGftyKPAC5CVlC
         Vld86dIapNEbG3lpE7OllOrWaeRUaWFd2wIduKXZ/CQTo0b/1ONajEJ22leRC8eznIce
         R7Cw==
X-Forwarded-Encrypted: i=1; AJvYcCVDkak+r02aN531cN3F8LZKGqqssvku+cx5PxDzgU8XfKLYc+O7adH7UVJJvFFuiW5odcHiUi/V7Fqj@vger.kernel.org, AJvYcCXwYEVuO70fkN9QUoepc6HJWAcX0G2YaPJDyr3Jmy0HjGcZD8xeLJ4ZS4E0jtNOmMGdVJaDtI9TwNssqXaa@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3mNM31NYbae3zxPpf2jOIAyOynj1Da/edgCUBJwaOvlnh0BGo
	LM4i4l+2HTeFcEqb1eh3CdCx8D/BOPPlJ3CCZfQWqeCEYe3G6wrlqXGp
X-Gm-Gg: ASbGncsLvPR89h+iccDWDwdHyd3aIdcVdEmi5ABxrmvXZBhRbnr5K8M96PrnQDHJhx1
	tVKa/viY+7jM10gOG48YarTvrtkmRWYwcClU2T6SxqMMaZqMNzKkAF7DpydSL81bMBsvx9wMosy
	1MTqs6WBDw75uAEtBe6eNcEOkdxUduo2WxBkfAhFUaiCGy5Va/gnQ1qYCXigC1oHrNvb/mNCC55
	kSv6t+IB6cJYbgXQzhpYLpYQi3LtUMBL3+SOerVP+5Bac3FZM6CmaNK9Wn0LkKrrrhBhohqUsL9
	f80Rar7JRMVP+PkDN03NZSnljG2/fbkmBRzUwbr/jlm9uIzlfE574Iex8L9pnkyY
X-Google-Smtp-Source: AGHT+IGN9dWtAS1fQY6SOJ3fdKPGUo+dS3MzUROaHS6AFlbQQs/x4ruOrI7j3gsIpxrEv1h3EVxcnA==
X-Received: by 2002:a05:6512:6301:b0:545:2a7f:8f79 with SMTP id 2adb3069b0e04-550e71b4a93mr230229e87.16.1747337983574;
        Thu, 15 May 2025 12:39:43 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([95.167.212.10])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f544sm72297e87.235.2025.05.15.12.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 12:39:43 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 15 May 2025 22:38:44 +0300
Subject: [PATCH v2 5/5] ARM: dts: vt8500: Add L2 cache controller on
 WM8850/WM8950
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-wmt-dts-updates-v2-5-246937484cc8@gmail.com>
References: <20250515-wmt-dts-updates-v2-0-246937484cc8@gmail.com>
In-Reply-To: <20250515-wmt-dts-updates-v2-0-246937484cc8@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747337978; l=1530;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=DSJDp1z7Pob8W8/VBKGX9pG7ZPkhnhBiDbakz3e1J+w=;
 b=hwJTzNQJOYQCe6IRsbCMKSqAddv28lmp6tN7TrwXhYQbbq4z3f6Q9twes4NDmNZJw2jId1sHU
 p2D3+CloCBlBq/z1wjmefdnxS2S56XFF7QDJQ2TmC5JX5bqi5hoVDi/
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

WonderMedia WM8850/WM8950 uses an ARM PL310 cache controller for its
L2 cache, add it.

The parameters have been deduced from vendor's U-boot environment
variables, which the downstream code uses to initialize the
controller. They set the following register values:

aux = 0x3e440000
prefetch_ctrl = 0x70000007

Their initialization code also unconditionally sets the flags
L2X0_DYNAMIC_CLK_GATING_EN | L2X0_STNDBY_MODE_EN, so encode those too

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm/boot/dts/vt8500/wm8850.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/vt8500/wm8850.dtsi b/arch/arm/boot/dts/vt8500/wm8850.dtsi
index f741a3e88d74ab4740f200b9b96201b3dc799bad..58109aa05f74b67cda82b5ebd0127662e475ded6 100644
--- a/arch/arm/boot/dts/vt8500/wm8850.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8850.dtsi
@@ -18,6 +18,7 @@ cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
 			reg = <0x0>;
+			next-level-cache = <&l2_cache>;
 		};
 	};
 
@@ -308,5 +309,18 @@ ethernet@d8004000 {
 			reg = <0xd8004000 0x100>;
 			interrupts = <10>;
                 };
+
+		l2_cache: cache-controller@d9000000 {
+			compatible = "arm,pl310-cache";
+			reg = <0xd9000000 0x1000>;
+			arm,double-linefill = <1>;
+			arm,dynamic-clock-gating = <1>;
+			arm,shared-override;
+			arm,standby-mode = <1>;
+			cache-level = <2>;
+			cache-unified;
+			prefetch-data = <1>;
+			prefetch-instr = <1>;
+		};
 	};
 };

-- 
2.49.0

