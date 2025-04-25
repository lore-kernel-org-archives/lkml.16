Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6BA2522AD
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 11:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745582041; cv=none; b=ewYvzxzU9GbWY4FNXh7FtIt5fUhOIhg70tt1nVynK+xNtU0CbeXNvcgyk4pOPulVPNNjDLb1Wj7XRZ50jVA7syMAW601YWZo7Yj4LlYhhvQ2F+zRfHn/pByfRD71rQqhaIDMBTIFei/xcgj3dRT6GiOkreTexDw0m2b0E3p+QvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745582041; c=relaxed/simple;
	bh=mdt+FfQLOXW5H8VB916VcVsQAh5jD9AsKl8jhZ67g9g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JAiOvSGaMKufkJlCeh9FqYGg4dZnuZa2yVgg5cE/tzPj4CsoAWDTvoORNGh1+8kR30xHtwgwbacL29EFbB/qm1yRUEfz53e/CUw/Sq2uxLcnl4/bAGt8lAThCy/z72i4vN/x440ZOdiUMJx2KKSagjt/diyrUIp+8BeBEo493pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=SLpjf20K; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="SLpjf20K"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac2af2f15d1so267478966b.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 04:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745582038; x=1746186838; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IUVOyxfmwmjXh6E7hIxSYPGnlbPlmO8pnH9O68ZQFjk=;
        b=SLpjf20KVRAeuz2m/cmuNCX17cNJcXGYYzGRDSIy3OkCx1uZ1RdJjCNHcnSl+1USjT
         82KlBEfyIk+9o9lEbRKt3jJZESRhNVcSlol20+/SiGuuMPJjJY+yL+SecRU0xeGmE1wB
         xQuaf5SNPi82+DchFOBT5xbyFIsSgjrbwn835t/d8LAX5I1c5FTRHm2clDjPe0TAaTHP
         sMeVG+DRMmsOaFgQXsPw1N4NXP0PjtOnSZGASn7r30BHNQeEAguy9+0xyR2+HDfylmgn
         zQmVLGd6t7+l6GfrjUdPPmvxj5KYoDTuGmg2X7jj6AY7HWFmGQZNSUTd5nWrhAX3foz8
         vZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745582038; x=1746186838;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IUVOyxfmwmjXh6E7hIxSYPGnlbPlmO8pnH9O68ZQFjk=;
        b=XhBtzzuYrUayWkxSZzoGvGdhE6bOmYuxE1+nc8Y4kcrXo/PO4F1c+4aaJfxT0vu0ls
         DdqZMcNvus2w9SrPZG4DLiy3LFxyEao8KDKxud0fPRuqmeLyNJr5+Dlr+hy1+0PLCZEq
         lDn9tsF/JlkGeO3gTLIhfh8j/nfGUK+flUXYOy0ywi/DtHt3vHoOfd3lDpnZuifCE2ga
         maQOUm0gkJDHd+HTT0hZ3i0ZJ4s2PQO+VSvmN2R4j/mZDGsAeJdeZcCnjZGy4qDkPoZ4
         p8JrtrpY3v40Ja3m5ynxFDa7oEF8FZvSwQ2kPMJUkGnDJuG6XbnWq3nUgznboRpFZEXu
         AADQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5mDkHsmVgaS19W5vVbaI2Ne2PDkgaC895LMclKX4Kut2XKX/x8zfBX7eAwtv0AQeGtj+aklu5LvALQLc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqVDphLavhhPBk8BK8G8Eo954lSh6qMQF4RY5pEL3WUB+GrlIL
	CR/C7wnkFXSd/MurF5ZHlvWcr3eCcXffam4yUd+y5c9ElfGUBux+rwZmXEGbtE0=
X-Gm-Gg: ASbGncs6crpK0Dfs+5VUHyTF/pUS/ECglZ8FodWm2Z3reTdiK8tsriOBQQBJQQ/IOUH
	FPgXd8F4apM4at6exHgXc3AcA8UnnqMopCDTyI8OL7uhE5aebL8O60eIf3qeh9S+LeewonL9yCk
	UWFFAV3aSZgltoVLi3PM7dU/Mm5c54r0HrwBlfaguEDV4XFnZrjvvp7zauOB9DN6so+nagr9WzT
	qCGZyIH2yQsX280fEYYu4vvv5NGHXHPoohjj24+eD9LxcUiz3aU+6PQLEMYrvW4zMaos84rAbgf
	4m/JWLKuEVyt32jIlanGoHuqCntfucBOqVNc81WBAKd3xAWY6Q4FingGDgHuWlXtbwmAE/aL32h
	g0QtwHxgcWaKLB+c+4jQE+WBgblwUIoE5mHqsXu8H6bikP9OZW3yK6fFD
X-Google-Smtp-Source: AGHT+IEIFzywz/urPBQhdVyC9b0OBvVea74eItKR2Wff2NqW4gNd3rRUW/MHApmdlOSrb3j2cNq4hQ==
X-Received: by 2002:a17:907:74c:b0:ac8:196d:2262 with SMTP id a640c23a62f3a-ace71133fb9mr169852466b.35.1745582038208;
        Fri, 25 Apr 2025 04:53:58 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41bc36sm126081566b.33.2025.04.25.04.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 04:53:57 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 13:53:45 +0200
Subject: [PATCH 06/11] arm64: dts: qcom: sc7180-acer-aspire1: Use q6asm
 defines for reg
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-q6asmdai-defines-v1-6-28308e2ce7d4@fairphone.com>
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
 arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts b/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
index 3f0d3e33894a0730bd0b14738ac95847bd92ee65..672ac4c3afa34011eba6a309148978a777e2fbfa 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
@@ -530,19 +530,19 @@ dai@104 {
 
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
-		reg = <3>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA4>;
 	};
 };
 

-- 
2.49.0

