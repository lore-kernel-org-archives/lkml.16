Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC704252286
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 11:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745582041; cv=none; b=KxPtsIjKV22w+zSAhAo/KgSUmt5knyAQrMt6O08SOtNYi+75y/6/0EdZVjOvRZ+gnB6wAbMiYY7tmM1JvadxMEgxli6UHTt6RvDy8HlFfnnMIuRgyDD/oWN6e42DemcTWyz1F2c0ZCVcnLtOgJ+d2s+sdcHbQ1WWEjSAif4Fbrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745582041; c=relaxed/simple;
	bh=xA8NKzSZeMZy2ZgXNKPIKIYpW4Hf/Vjvs+lFkOc9rEI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JzZ3CQseOroKAhBf1brYUAfdxI5tnVkMprCnmekV/tTiWYeIeN/e1dmS5SyGNV71fCQJHu6ZAQibeU7s25ALzOv7RPNgSC7VzvDrWOquQDMg9ooHWHP+XLEZTb8PXBSSm6+xBsZWDJxLtOoSH77v5mBmyu04z+AYuaJphF+bG+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=pEAT4CBK; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="pEAT4CBK"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac2963dc379so317139866b.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 04:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745582037; x=1746186837; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E+EeMa3F8H7ojQ/yzojb+zajWCzvkVtlo4S7C+lzWDU=;
        b=pEAT4CBKk8kZq9hHx27kz1/rPMRLh/6FOBQ+EEUKxpkuzjDe0pYoKWe+0P1f5bskdm
         28+FY7mCYGXSNeJ2gQARRnEtvKPBsXuqWexneVb8ezU6sOT7OuxLq8/7eJnexZDF784c
         /3M4kxFGstu/hwBIzi8Pa96Sc3RdJDtl0X4EWj/aYcnxzYiV3/19XRot9Ace6tcjPdpz
         LoiF6TDM8A+Wbb2+MXXxb/7JYS4/HpgJBt9ZlzTvL3HhYnlTfgRwQ7k+5nIN2PvuKlV8
         RcjTnGPoacFublesm+WdyQJkUiCJXGibkK+lgibz88IAfMtzLL1MB4AvVwU93n5ZedRk
         HQIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745582037; x=1746186837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E+EeMa3F8H7ojQ/yzojb+zajWCzvkVtlo4S7C+lzWDU=;
        b=GMK7UL1t2uau1QG9FyTQVhrCoxdTc4bntRGBPPsC57i4BWHedwuQ2dTP0LnZiGkMBQ
         v+wDWt5JaOr0l6q8Sz4beg0HZR2VV2CVM2Ce9+VxaQD/Q3QOgGuQRhxs05YbMy53TSVZ
         Qc6P2A6Er5oayu+6oF8Bu9yDVeROgArt6KAerJcson6CvlnKb23dDVmcYfBt/yqVLSXz
         2XSinlxN/zkV9O6pomIOMvgEbjTzybu5YigIphfoP7+hPel3TTzelmfbfhpN1l42wY8i
         6/owFLH3kJrZVkSyjNcj+i3SD29Yxf2OomUs1oLV+Hf1DuSVKA5m0kCV6cVV5b+wSXvU
         oTRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVs6U+HYrDyIZW/7lPvC/hXvuC5J4/wVhmdfqis0SX3VKhZrV6dxTO6muT4ALNxhT1XJgTdPKJFL700Kc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXIcUdHwzhz7sHxlmPl5jlVphqhd//Ab3IAdM9nF7k6zTgEl8k
	a2pA7QTsj/Iy+EHznofFG+JQj6XbudDfpqNcuWYrnIoGcAoYy23DduwgJNbS4nc=
X-Gm-Gg: ASbGnctxGTMWWRU5Bp7MzEvBYaBpP3AxKSQs3Ofo1IssI4L5iEmiEDdNG3MmvcJ+sjk
	8kccVNI45QZDhSBT9Wb2whknnzoEXSPS4Xp3yJk5GsPhtArbajGFrRtOl07aOLcYyIrSHoTsALi
	/RErfhWM8x6spvCnOe8TYzz6enaVZ59GkFtrOeDPhpQ1fGLfB89PxeY8Wy7/TQCXdwZQ6F2KdVV
	z3Gmh0lMQp/eaM0N58XKOQ66vO4KLeY1vFSKjSM0C7FmKgAOwSnze1nlW01tuhln7iImtej2kWS
	VeVOsGhom+zveL9l3LicstI/IbBSIQgRp11WTgGcTWneN0o/8csLBeU9n9J+SJOY3K3ttkDJhuz
	cR5PJ8hS6isDeM835aSD2/sG9glMPMCxdOdeI0oSa3lgEEYFHbscU4Rgr5fpTWS7pv+k=
X-Google-Smtp-Source: AGHT+IGUVJI2dlEtwHRWklbLnsmR4txxtIplCnP7D/soWMK88Xud1U4+gAr5CXe5ahL9vOPO9+mX6A==
X-Received: by 2002:a17:907:9405:b0:aca:a1cf:d5f8 with SMTP id a640c23a62f3a-ace71047e97mr181754066b.11.1745582037043;
        Fri, 25 Apr 2025 04:53:57 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41bc36sm126081566b.33.2025.04.25.04.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 04:53:56 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 13:53:44 +0200
Subject: [PATCH 05/11] arm64: dts: qcom: qrb5165-rb5: Use q6asm defines for
 reg
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-q6asmdai-defines-v1-5-28308e2ce7d4@fairphone.com>
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
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index dcb998b8b05498d8f9a82ff9a984c1e237a61308..33ecbc81997c5ecb5606c7555adefd1a53634b80 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -1008,21 +1008,21 @@ dai@20 {
 
 &q6asmdai {
 	dai@0 {
-		reg = <0>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
 	};
 
 	dai@1 {
-		reg = <1>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
 	};
 
 	dai@2 {
-		reg = <2>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
 	};
 
 	dai@3 {
 		direction = <Q6ASM_DAI_RX>;
 		is-compress-dai;
-		reg = <3>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA4>;
 	};
 };
 

-- 
2.49.0

