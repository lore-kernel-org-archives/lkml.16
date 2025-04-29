Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC5B27932D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 07:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745912588; cv=none; b=oKIV/jEqFbykG2bWVpalSacPiSxAFVvEZgC8W2jPoyrvoJQaxFgbtUY/JdEWOlbJCGMk6krpplskG9doxp8w6a2JVHSK5EKMcy/Gfd5sqb/pQNtXciYYrW1ErCdfWbK6ZoNxP1Z7TOszC6peiUQJGjpLgz2cwfb6fZY+0N1rhRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745912588; c=relaxed/simple;
	bh=+kFtdh5zNKXGvnVuUeb4hD3s9G0IyLF5h/Rh3o0CXxM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tr6RWqwaCUfxXZCn6WlSjp3GP0PoiBCYtcoYtUp3Z/ithgHSGo+i1znnr23IfzMybI1hzlZ3Bj/erp8bwi6PmA9T7g+abdErvMqdaJNUnwTSMPWys4FaUiNVmQoG1J8YtDMtFV8qwusw1U6w+fXO4JnrwBqnT1owRb+IZWq8oZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pTJPjuMC; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pTJPjuMC"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e5c7d6b96fso10930228a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 00:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745912584; x=1746517384; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HKdri9oqQzlxJX/GoZ6d34Elo8Z6NtUhmYU5bCs5Gvw=;
        b=pTJPjuMCGlV4Uwx6CfKBHsDpginhX1Q6K5WN/EiPRTHkhOCCRM4Mf1/1iY3fMa14rB
         ApcaS5BhrnxAKmaCP73LCnn/pUYZP3S7zrj3MQx60tDxNg1qvJAQ2ewpx1cV50YusVBC
         CSG74iIJA0lFeyO4g2aw0KHr4SqJy5S6gCDXMpxtZkkOt65R5b4O1xM8BgysaGc1sy3j
         qLdYIWspuejfNCmvnCYRmz6R1BbBXp5O5A7nzey87TbBMJLJwwejJyO7RZsOK/4N5JJf
         hc+Swh4ggrwJ0t/ijSkg7x+4ByV6bAQHEwEvqWHa2igZJ7dMUPc9+WZmzv0ckuV5/8tQ
         uIJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745912584; x=1746517384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HKdri9oqQzlxJX/GoZ6d34Elo8Z6NtUhmYU5bCs5Gvw=;
        b=tyxN4oUwT++YnBEZGEASzIJ6xHMUvns0OQFPpqT7uSBDg6GRP7lXqkuLye+JdWw/zv
         kRaRrLbl2r6+IA5XVJ6s5H/Q2d4e7YdXqy0Fx0WU+YQtz0fd1lYoryv7a9YXn72x3xN6
         VLMBnPek5ScDcrqPrL4CKrCg4guHMYQwTAC+sSTyAMIcg/TN7jtIrltIUhoR8z5iAMqZ
         Ol6q2lO5YkJ7ACemudL39LEZwzyNAQsBmqumsnA7HOCYmiM7jcGqSvtN28aha9XtFpDq
         RTIZ5TKUmlS6VcK3Hz+AvFX76HWYftmvfLHTi81LlzVhrrOSOG1bmrVcIru4vt9zXlnJ
         aPjg==
X-Forwarded-Encrypted: i=1; AJvYcCUQB8hUnBGhFk1vzdFBhEAE9UeknOA4awz5EgKe0JpJVNNm2hvA11gQf/v7FCFT3Out0S+ua8f9Owfy0Z8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrJHzKjIu5Dsp6znG71r5zKQ3fTor73pzHc03Z5AzoAos82qSS
	fmejV2bUTSpCAUjPWnUOZY7KyIdgEm6IydCAyw0AtaD8ereqywwLbjgcRJaVFu5fUxkcL7YhOGa
	P
X-Gm-Gg: ASbGncugndTtM7gm1xFWOGurzntFerjciTryE6fJNGBeLtCzJwlqYSfi3wnDyYRJKZJ
	5NLxcywYDoKQB2qUmxoTzWFAafBbSm6MPsuHJyrYzt481sj2YkwSPs+kJ5cfQpOwXcA7+ugj+Ex
	P/s0Lc9zSVDrSYQMsbs+ULbxqWxyNt7XvFy9HkPX7AR6eIxzc0CYIpKiglCLQxlzCeysw7tFtsa
	nhxf7uSmZ72zwkauCnmGSwCHfwfIRdHyKvmsBgA/p7kACPw1/PmT6Mf6FR28Yqx48C2/YXFWT5I
	pTSAz6Yjl6bWwn+Q0Dw8/XcVGKDgS8E27pXhA7EIF6aDgP0uUA==
X-Google-Smtp-Source: AGHT+IHxcc8j/WDT3R+Ed9mqVDNNphrQGL2Z4Djg4/1VtTVLnJ2DccZzwdTkAMSr1cBwYyCqZJG32A==
X-Received: by 2002:a05:6402:350a:b0:5f6:31f3:d744 with SMTP id 4fb4d7f45d1cf-5f83884fa26mr2355871a12.11.1745912584531;
        Tue, 29 Apr 2025 00:43:04 -0700 (PDT)
Received: from [127.0.1.1] ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7013ff4e7sm7048114a12.22.2025.04.29.00.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 00:43:03 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 29 Apr 2025 10:42:30 +0300
Subject: [PATCH 2/7] arm64: dts: acom: x1e80100-qcp: Drop useless DP3
 compatible override
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-x1e80100-dts-drop-useless-dp-compatible-override-v1-2-058847814d70@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1230; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=+kFtdh5zNKXGvnVuUeb4hD3s9G0IyLF5h/Rh3o0CXxM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBoEIL17Ga5JLUCneazXrtHjFW+wuU7Ojth75Av2
 4WlxEe4vN+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaBCC9QAKCRAbX0TJAJUV
 Vp7hEACXpCm4EkeMaIE180F8dmj81H0AaiNpPwgRRA2TRLQsSTMTVY6Ts4h2Ucxnr/48JSwKEtx
 13gslrFppN11DzYPdKa/mN1ocanIFIGj/hauBuHc4hg2rbRDm2i/ojtewH727tCPjUNaE/NDwh0
 6mJCk/ZuReHlAHNwFUshpZkeWKaVrQC4//8MbXhzVjgjlseijJ4yqqXnv6OcSiZd0v8MIC3adIm
 +cwYB2fQS0kKe8H330KJTnKHhQGhycW8ulqd5g/LE0gzH7WTGK/WtbV7xjXkSHkIMBuaK9y+5dP
 vdkZlPITKXus00b0s5ZDdcglx8kMYzXzeBAPfFA9+21dlxFLJPQh0aSUpnVBJXzy4RYyt4ljr2e
 TmgWo7PfqJhjCS2vt1l+JkHqNyq8lgbxbYLXLwDYdMihqhb1VH5EZykQihQdVdGdqr5Uol4d9pU
 JeEofP4RQrMl/HMGz2NePDlI0kO1Fw+DQFwgFCshnYUp2pBLpiRqk/ShZhxdkKmeJsBKFUOCgp6
 85gfbX8nZkkmL+kpgbfasYBIG2UpddLRBoV/QIw0+JOzOMDMnsAaKiXTLxKzx4DC40d4DW754ku
 P4ypKF0zmMoJe4xGbL906zlCGRvR6E3JhRcBhXOBQHT3sTZ6mm1lRnoFmYYVsIf5qbF7Pb76vb5
 aq/UGQ71POw4dJw==
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

Fixes: f9a9c11471da ("arm64: dts: qcom: x1e80100-qcp: Enable more support")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index 470c4f826d49866a2af87f5e109672d51c9bc9cd..f5a911f23d8ce89b9c3a6470c14f6a68aebfcaa6 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -871,7 +871,6 @@ &mdss_dp2_out {
 };
 
 &mdss_dp3 {
-	compatible = "qcom,x1e80100-dp";
 	/delete-property/ #sound-dai-cells;
 
 	status = "okay";

-- 
2.34.1

