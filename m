Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BFE29117E
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 07:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745912594; cv=none; b=MzGgwPImU68wUnqQPex5MLbraknBvjwBFxYMsShz0Wcd0ATIshB6az7b0BO8K/+NXzqGndyMSqC2UiSCxrAkXMl+Kq/Q8FOnsgdIvLkyIgxjTga8+ko8l8leRr8BQfUtKYntUNkSNFY0/GcJwtTPxCjEwnkPvW/l6asvqs/VcI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745912594; c=relaxed/simple;
	bh=tj3xZeZATeVmYvUTFwcmSAky2uxb2oS5CdYv+BBD7vk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b36RI9qLXDTOiDflHWzO6MJkyrT7jMSSrYDLryEkamlseWMO0jaZJKnfHl4ORz2Muv211uo8cGAj/P0Lw/DOUI5o6E7ig7QrWOPWrn46PUDEq0vQ6oZqvbUFxuWhJPmVUNtiBGF5X82UFG9HXc4BWFN7H8+3WIfPHagyl+bjOfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ydvwkmPw; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ydvwkmPw"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9eb1eso5868606a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 00:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745912590; x=1746517390; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q/np6qWxJtu/oIRM2gWP+BJxzHRCwLXGvp3Gb6G56Ss=;
        b=ydvwkmPw1nYyndO0KkrK2ohPh78jI5xfr6csteaqUfYqncWKnWLLWo97iPNp05SPUb
         EJXMpI52RHsOLkg3TqY2JReB4bITPdVoSlwJkrKNGYdAV2cr0dwvjbZ5jF/etraBe42R
         pOI6jkz5GbpQ+8hKGKuGUvBUwUykEKbxCElOQlh11g4a15JQN/EE+EbwOEb42k7DST2n
         QKzgPFd9bsHd+nczKv6l6EjxWZiaijiJmveG0/U4M4ULd2nKC9Gv+yVYRMTqcCHaymMq
         k3VwB7ypBl2E4m+5qw6/fqipUIQV3a2eLNmqGy/EFfR8dl7KPIa2FgS4MWUhQrkCCXYs
         A/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745912590; x=1746517390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q/np6qWxJtu/oIRM2gWP+BJxzHRCwLXGvp3Gb6G56Ss=;
        b=h9BhQG+FffBGS78Id6rlfv57A6H/XkHK3E+yVFVg8OrGdib4JJO4YZBP/VoaFXZ1dG
         URk9ODN0BW731IosFwdUMgNc3RNojxTFIpfoPqcUx647W+VmCPrrp6zXfCJr8MQb24WO
         +1JoqU3/pnhbqdwFO6eLjygo4o42pjP5LxJ1K/17LpDroNs1Yn3MzZUEEzAW90pHuBkw
         aR0iz/uTfUxvOeHxT4Wn5HgWdL4WDeWpAYC0br5FOpgxBllM/F4iDZRBQrRp5HTM+Mg8
         RcHfJ5Y0+sjppsv9pKtpY7wfcsykABdjonrcCchhzmzSYMgHbpt8IuBmgwTGDLu54/l1
         eugQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrK0amDzdFAVw+PJYcihhWgn4GtbB3/pZ9J/tTm9bzV4gQTLFr90ZBiwYWLGosf49fDQt4zJ7GpjUmPsE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDZ+bDBu8swfioQ/szRSJgeDfS6/ocGh3s/6KMHkctmi5EtqcF
	KTpXuzMBHZITnVJUs46CyNnws9cZY42Cd+wrsRxl/ViVfURnIrkkViW/of4cs3k=
X-Gm-Gg: ASbGnct/nNueVgJ9NPSSY946ehYlkjA7eSjC3JsI0jozZFTLszRTU9RCj/PLS9TXcoU
	GB5VXyR3lNRccr1nm3lwDbAChP5/uZWoQswbEOjUgVaCPkptAlEShGU/nvuKE19oriLC48asNza
	DHcKd1bWRIZmktDD6Mn3npUSLV88qMM4ig3lscWTi6nPDMlUf3//gphk6ujGTS7JLfqsQuEyChQ
	dNy5aXVdbwj/dTi9yfyaeg5h5UKMOoLw5wR1AIDjKw9250NV6g1QItRcuUsMrR7m8o0RLj8zRoI
	qACDt8YlPyIu7h2l3BERF3QXA/M107MyqVAJbxU=
X-Google-Smtp-Source: AGHT+IGvwml704d/iiHTqR9CcorCR7n9v9zxfSJ14wpNbxXW7JlKH5ofm7J7L7B7L1OM0TuzjALLYg==
X-Received: by 2002:a05:6402:27c6:b0:5f6:22ca:8aae with SMTP id 4fb4d7f45d1cf-5f8391fe12amr1858598a12.2.1745912590070;
        Tue, 29 Apr 2025 00:43:10 -0700 (PDT)
Received: from [127.0.1.1] ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7013ff4e7sm7048114a12.22.2025.04.29.00.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 00:43:09 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 29 Apr 2025 10:42:33 +0300
Subject: [PATCH 5/7] arm64: dts: qcom: x1e80100-hp-x14: Drop useless DP3
 compatible override
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-x1e80100-dts-drop-useless-dp-compatible-override-v1-5-058847814d70@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1306; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=tj3xZeZATeVmYvUTFwcmSAky2uxb2oS5CdYv+BBD7vk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBoEIL9i4X4yaDcISZ3rOi33CtleZkgkHjiUWJDC
 puuxgmuISmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaBCC/QAKCRAbX0TJAJUV
 VsgjD/94ubPCDyI10UTCOwxy1oWcrLoKcpLqjxF92fyQpfOnC5pJc3Xo5YSC0+tX79xfUgyhYxM
 Yddaz5xArq0O3o1ehjhYJz4ksrKNQeP8R5hKAsvNChQ8hXmtNPcuFN6V3haNJlSkIBrrAD/+f2c
 oP8use2jDjYcor2fWK2sVUIj1wPehSVjBmyrdXcU4DpZy4dAGT1PsctY1ry4iYydtxfj4Z0pzZY
 3Z5FuNxoYMH7pe20mR9N6wu4LGLp9R8f3hp2MSdPMrPrZaFMikfnGyBR2LgxCCD3BspAErBIUmC
 c+g213dNXcBmQH38tCYA+zVyxz5Vt2pqul/34ywBFvnrXcyVpgyPN30lGvhqtifQMWXq3UXr50A
 06WD+xN+5gYkL8EFpojaJk6Cyashr5ZarD6QDs9t86hECTYagkKuLQ8FiIFLVSPqtBNmqzrlbL2
 zg9V9qrgfDfCEQ3NNcCo5s+hm3yEYZNlBQGyHmTUST7120PEJGzNw5qAfNm42bVLwyc8no+xeow
 zrl7/IoFmMuBSoyr5WnXY/WW/aZdIcZJjELVZEwyuH7bxAUDG0AN2d4xajjM/I4wUKjGraHxPIv
 n1+Uo/9MhK8xJy/zk9rneIDky3cvzLEXHQCNJ0jyVdCYX/D+CoDFXzRPkxFbtZYFcBcGTK1RiN+
 O66MY6X7XNSDqeg==
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

Fixes: 6f18b8d4142c ("arm64: dts: qcom: x1e80100-hp-x14: dt for HP Omnibook X Laptop 14")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
index 1a187dc3684a967b42817e44ff0df10202fe3362..f81e5a479f8d14e7b9c94ab08b5a4f0d9487bfca 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
@@ -1154,7 +1154,6 @@ &mdss_dp1_out {
 };
 
 &mdss_dp3 {
-	compatible = "qcom,x1e80100-dp";
 	/delete-property/ #sound-dai-cells;
 
 	status = "okay";

-- 
2.34.1

