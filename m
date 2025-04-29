Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E0C29B23E
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 07:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745912598; cv=none; b=M+l76XrerXEB3ajgd48a+LrUdnuyQdXRJXziuu/Y/c0kaX7Xq3UZPA+TpQXjQfwiBauhUz6id0gvAyQbwuWycfJi5+kdJoBBhp8yD22UFoFL28PrRJMiWFj+12QvFEQsNbqAPbQBsQy+prKGmdhX0goBVarXRxkOYWHx+kDHgDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745912598; c=relaxed/simple;
	bh=dqH3cfznnrDYzhdi37Vb/lKGc10xg7GhnO153HEfSlQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q56oHivDVyBxqXxnCtBNyYFdYE2ICOMKAwpjeeYcMfANi7RBUj1fLgLEZP4ZUP7FITw075H/L+Z9vy0f+AmKz7khSEm2VL8MVf5d+ZXhEUz42y1kMLqT5/HxtTIAwzf98I5Mn48X9Pnm0u3W8FIT0gus9uqFkXzj6vGjqa9qVKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PvROXccu; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PvROXccu"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e8be1c6ff8so9463389a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 00:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745912594; x=1746517394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z+CMw0Af3QILoKnW8t74C2z0JZ0hUqGXypshbYnxLzE=;
        b=PvROXccuQYSmwiz4tqnw9wRAEOjA1h4FkIOnNgMpOuPG6w/yRaXZTM/nRoCtUsgVZt
         dj6lQ9lM55LUVFmIKe/sOn46lXFc1N9Rk+tcYxMmqGLYSzrNGTI/q1J/P6XgXaMnWjiC
         sbrEGISCedGrzjXN3D2gmUkIxNbUUXBn5Yxo0fmxOawlH10yyG52OfZp7d20i/FpwUSF
         P/8twpKi0904ykahZ2oDUp8vYbSpAPhuqA+tGB1wzTyxB9kVc0nGf3VeHoWV0RSufaL2
         EIIwhbwHstb9eo7kM5PPCyivDfKs4VbjaWkdObfqT+BQ/RcLL9kLctt4FCb3akYHb7n1
         d50g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745912594; x=1746517394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z+CMw0Af3QILoKnW8t74C2z0JZ0hUqGXypshbYnxLzE=;
        b=j9NPsE08xO+WlPKRIczUeU1a4/kPLfLKLgVS9GK38yucPft5L0zXiEJiTgHyhHhqF+
         GWW8l96W7gREK9ex3ocXj/yNU9e3oAVv/HH0BGsjb4EuTWCQyc5vze/mkESNKp0VoZmZ
         XlApOa3A+5KBAQFNw1r/CkgDsFcZRmcui8KMcI0pey1FBm3uA+xOekWNTT/VM09PPSh5
         Q+s8hjiZ0oP7LxWSYIoy2vwyyizINvqcj+F/sR/IAfUkTpzTo5hP9X9wRbudwbUVJsHj
         Arhe+uj72bd8z0nbKj2ttNrMFN1yX6p4KTGaJJAs1+2oQWUQzA/jqbvGUKxI95N+UAc+
         fHTA==
X-Forwarded-Encrypted: i=1; AJvYcCWX5bejylDPqA1BsYux/PSypKYDa8Ys1EtZ/UxAxjuJ3KV8qp9W4aFTtJw1LYLzQyPZhPeqUzy905qdxpA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq5VRmlJVTrO64/UZ1Wy/Tfxzkz6kaJWW0WabGifIUzzXFjcy1
	uQEDO4R9NHPjkPSyg+W85g+H9ULXqzQY5951NekFAV9lvNo4sQC2vl3i5O0/eqc=
X-Gm-Gg: ASbGncsP1LezXSQjhp2SNHXbbT2CIaRdhvTbcu3iVF7P1nU8P3q5ft1RUBn6kGgTSAh
	QR/hUjltiOaYZtqZLH+DgTHuoUq2/1daHrr/d0YAjBOa/JgoVmSr638OqHevbnh/JPLqIeNRKDt
	Jy31T5tEZJJOmtard0Z111Wa6BwujHlrzXVsywqbHw8JWv72GN8InaMtcHLzDRIGBbOmC79LsLx
	gquvMVntX7u1xaUMDswKSXyC8WesYW3B0++TXZGC0PD4369QdJdvJXLIhRbE1g2gn57fLs/z6cX
	By+wRQ+OnLkaKyPUsd4pO11Nii/MS5+33gREpr0=
X-Google-Smtp-Source: AGHT+IHwWN04fOFlwFa3HO7CYk4tFlSVjja5KcZcGntSeNd6Wvuyju+J/fAEW2cstNM1PRWKHahxNQ==
X-Received: by 2002:a05:6402:3495:b0:5ec:cc90:b126 with SMTP id 4fb4d7f45d1cf-5f838862cd4mr2316336a12.19.1745912593656;
        Tue, 29 Apr 2025 00:43:13 -0700 (PDT)
Received: from [127.0.1.1] ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7013ff4e7sm7048114a12.22.2025.04.29.00.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 00:43:12 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 29 Apr 2025 10:42:35 +0300
Subject: [PATCH 7/7] arm64: dts: qcom: x1e80100-romulus: Drop useless DP3
 compatible override
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-x1e80100-dts-drop-useless-dp-compatible-override-v1-7-058847814d70@linaro.org>
References: <20250429-x1e80100-dts-drop-useless-dp-compatible-override-v1-0-058847814d70@linaro.org>
In-Reply-To: <20250429-x1e80100-dts-drop-useless-dp-compatible-override-v1-0-058847814d70@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, Xilin Wu <wuxilin123@gmail.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Konrad Dybcio <quic_kdybcio@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1313; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=dqH3cfznnrDYzhdi37Vb/lKGc10xg7GhnO153HEfSlQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBoEIMBQ20zy5h3fNHMBg5pUObs4HHjmaFn1Nu2s
 YEgHFq2iHCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaBCDAQAKCRAbX0TJAJUV
 VlDHD/0VwykRtwZOoYTI3i4MNrsMV+Z2LD7X2EhNIuBIhLJLvQfEK6c1124b6MnoGlXIwusoHZr
 Zs2ApYouZXKomo+Twkxz5j4Ae/9PzkUAvdW6+vvOayOhQAT9IuehVoW5VFXm7yRqoAb9ncOUgdy
 tojyI4ahVyCCZc0xY/fE9ZW57zoVG8JpWdmm8hgkZf1GAhsfrLjQX0XBJ0IiKH6TIeUVRSoBwhy
 Nze213oYBpmqDObl72qQx381iLBwMKwy9rIl0i5TEA6PUu4uTRWMTWjH1lcQmzKyUgWa1r01dwz
 KFSA1+VPvCpAw57yU7d5T7tJn7Ug2Wh4GY1MlRnPHHabKx1V43XSLS2LsgIc+gqwZc/ynKaV8k0
 RlJhljLH/9CjUpXvd+49k3xDOWfljg8zQf4+4fTev7rUfvnhNehF6BUkauTxWHXsAt/vrwUGW3h
 vX9UdoMRGHU+Omw0zz14jM9ByaH+swZ8BZJZygk8Tc2FfGC44uV2EPw1yEoK1w8DT6oGNO7Z1ri
 daAXSZ1a7TxiwMvBL5cuwHpdJm+u1HNeSWy6RvOJQVI2lC68ZQz/l130+4t/hyjaoxiPjd3Gvdk
 +YxJIg2tOvorLiLiN6+iMmDEJ9eGhWqOQUdNyYE5H5iOMcDxCnRGOztCLTGa9080C0a/jVxty8j
 URQGRHZrPRiyEhg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Back when display support was added initially to CRD, and we used to have
two separate compatibles for eDP and DP, it was supposed to override the
DP compatible with the eDP one in the board specific devicetree. Since
then, the DP driver has been reworked to figure out the eDP/DP at runtime
while only DP compatible remained in the end.

This override was copied over from CRD which was the first X Elite
platform upstream to have display support.

Even though the override does nothing basically, drop it to avoid
further confusion.

Fixes: 09d77be56093 ("arm64: dts: qcom: Add support for X1-based Surface Laptop 7 devices")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
index da8cef62ae730266b8782ea0a7efedf51c9f547d..26ae19b34b37e0e3c67eb4543de898e94e62c678 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
@@ -945,7 +945,6 @@ &mdss {
 };
 
 &mdss_dp3 {
-	compatible = "qcom,x1e80100-dp";
 	/delete-property/ #sound-dai-cells;
 
 	status = "okay";

-- 
2.34.1

