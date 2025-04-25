Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E21B24BBEF
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 11:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745582038; cv=none; b=LxMu6yoXJ/KeBVKZaAVuvJnmp5aGdUK3bE2flPcoE8MK+Z7bU7Fye/2NmMXHRDiSyEMbhF46IrCMyj/lA3cuqu8kVpWAcoSPJWanuHlcStt4nXgDyaR0cXmgmCfbKWUaU9xVFmGCORo6yrP8bTR0R/OCClluoHkYjknVIkes0Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745582038; c=relaxed/simple;
	bh=gyFYvyLOAHq8IYJIi43QPF8e6AqlsdV5izSiDomzIgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bFGX1g/ALD1qD319F3eKiGAY+oUhUjfU889xepuCu3+sIpHDauTKRzZTdPnSoITDr8AB9LdptV79seOdgE2etwzfz+/rLdDpObzXOgsBIiApeIhxjGzGYZLBUj8Zg1l+thUn6c20/Uj+zaLfOVOhsZD5A7nrqw9IJkVGyWwMAsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=pd+0BoSl; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="pd+0BoSl"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso376400066b.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 04:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745582033; x=1746186833; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JPVI8KDcHJIY37Gh8WYwOAoMPWdQlCF9Un3uk5nmyN0=;
        b=pd+0BoSlvXR9l85DJRn1TPUxhSsgBk0JZfp1hTiO5j8Fl0vkwzmX6qKqkEK4u08a9p
         JQpRfRBbyzsSxs9ZsoTSRd3DIqRYpB7PlqIbAit+4IQBQNClJOnr5QpJnaxau8q3hET6
         OMe7djcTCrZosblqcv/wHI4sFOkCTW7HCBtrec4nkh7DyRDyOD+Jsd0xUnsqT8odGLax
         j029JFxa9hwkh+cZJRbszXjta8GnvLHcIC5zJGO1uh15NA/QMucPB50m7ES4TsJ6VSi8
         yyBL6Gsxbp3xfxuFnchErWrCnZntX04MODISPZm4scXo6dr6/bDMamlLH6JNxYMsS5Iz
         jScg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745582033; x=1746186833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JPVI8KDcHJIY37Gh8WYwOAoMPWdQlCF9Un3uk5nmyN0=;
        b=uGnMNidutfXr5+d/Oo/vLvvbCSjBHxDHHFgA9/cJfjBjBFd1B8Y55hLxHic/iI/pBy
         1UFq/fT0I/GaNdFgjd+qLaMR3Y6w8HM0XMaPFdQt45xEMxRlMytG+vXeq0UzIKECSfw8
         KdFT9oA61zzifp6Z/WLy2xNr37JvMxzahEOmeUhXgCIeyAXKXXHBJIhE/a9oBNZCPzuC
         DaMJNeqmtqjthXHRYaX9G2eHYVP3foWjNXSKR8qhf3QweR5ym/YxhvHk5/Fmw05lGQZ5
         gkphbT9BPmYNVe5jWMHybs7d1uLtxsfGwHP11LYsuLGZ1goDsyVtDsUnBaLfFAbUid9K
         ktWg==
X-Forwarded-Encrypted: i=1; AJvYcCV41mGzorjCh/Lprq6TcMscjyzk2XwCe0CQ38UIUqGlX4T24DQIZ0g3/+MxFniBg+n7YXxNIP7SS3JAOqA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKKw0gC6r1tcOuqha6qQgqxHFCLtYRoJIgy5H7C82YvdtrR3lL
	FeKsQ9lv9QFpWXPTU1Jn9f2DjXHrrIWGTA06uaC9t+mBlU264L8uVQCKmk3ENSV1b891MPfJMsH
	v
X-Gm-Gg: ASbGncuiNVgVXJzIJpJiv8K6lrTtTCGVrCtUITAgq2xfovTq+fBZItODV2oMD95Bh31
	prvjSGrb8aBusn1QXG0gwHHas3jEoklR2OWVKNSI91a0r1SamZMzWEDH3mjNynrx/3+//C9Er8j
	MZcyhhiWeTfKIqANyQKIhWgxDbYkKA7QgkmTrgZAi1wcv9LvrcwGpIQJI/W+V/n5vVaJr8IUleb
	5q81tFFt3pvvWqz23vHAao9PROzrgT97XwwOE6Hp+WHjjtfNz9VaJiMTUXrvTbrUs8jPuk4lFPG
	/8pMc8AA3o1KLrD0kLlXZQ0cQVEwGYiZabBTfq5XDvAHRoXIfMTat58/C6TeeVb45IJC2MYKU+W
	1RquzAPG6v4GkEtqEM/a2eBLyx/U6pN9U9hwRiDZfKELbte9slmbqrQW1
X-Google-Smtp-Source: AGHT+IFgepbIUAFC/V0EgENhCUYHFuQKU2OLBduHNUTZF6ly9RhAxZl7IPrUTyzvO4S9nM/lVXSNqA==
X-Received: by 2002:a17:907:1c08:b0:ac2:9ac:a062 with SMTP id a640c23a62f3a-ace73a45d0dmr167162566b.23.1745582033567;
        Fri, 25 Apr 2025 04:53:53 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41bc36sm126081566b.33.2025.04.25.04.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 04:53:53 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 13:53:41 +0200
Subject: [PATCH 02/11] arm64: dts: qcom: msm8916-modem-qdsp6: Use q6asm
 defines for reg
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-q6asmdai-defines-v1-2-28308e2ce7d4@fairphone.com>
References: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
In-Reply-To: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Use the MSM_FRONTEND_DAI_MULTIMEDIA* defines to make the code more
readable. No functional change intended.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/msm8916-modem-qdsp6.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-modem-qdsp6.dtsi b/arch/arm64/boot/dts/qcom/msm8916-modem-qdsp6.dtsi
index 0399616226330b17d0076460c116f4ae27b4b00f..75103168c1fcdcf9ae968acee9a639d04aa61b62 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-modem-qdsp6.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-modem-qdsp6.dtsi
@@ -58,19 +58,19 @@ dai@20 {
 
 &q6asmdai {
 	dai@0 {
-		reg = <0>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
 		direction = <Q6ASM_DAI_RX>;
 	};
 	dai@1 {
-		reg = <1>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
 		direction = <Q6ASM_DAI_TX>;
 	};
 	dai@2 {
-		reg = <2>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
 		direction = <Q6ASM_DAI_RX>;
 	};
 	dai@3 {
-		reg = <3>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA4>;
 		direction = <Q6ASM_DAI_RX>;
 		is-compress-dai;
 	};

-- 
2.49.0

