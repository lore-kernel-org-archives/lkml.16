Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9F6277010
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 07:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745912585; cv=none; b=nZonkMYInFjXxbflX0N4Dkqnx+VJy/R4IteRcs49xEt4DOsMbuK1FRFCZgE8Y1KVauVg1JI/fjieHzCdOT+b2R8bqQjWK/anUaL/l5iB/TzlfEdwx+BWaNcpe/37Khtqgr5NiQg1s7umx7Ez7fMA0jZkhvy1YjPJSAX48M+ifg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745912585; c=relaxed/simple;
	bh=dYvB61tFWaA6yh8/duxHkHb9Z9xmEpElUy7jETtqYYQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ovEkaxzLDKOdn+VzT6tYSi4W/EA0j1t5TEOZNtM/iqlZHNIQ2+JI7c04v68nxNmJpzqyJMHIwFDYe3sf6dpX8q7GKur8LWFh5tQxZoDBqrGse/MOSnz6nIoqAbw8QjLXu/lElC+KHUOHO001hGhnLwUIrlLNKkh2jAwJrbEANYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sEFom6vH; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sEFom6vH"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-acec5b99052so111469966b.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 00:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745912581; x=1746517381; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F+uTNBkxVqUzOlu1JM6vCecH5db95DiIuI060h8Clm0=;
        b=sEFom6vHqF6TpBxqXZ2vDfjMZG3Dt93eaHkldtOe0kwFJOTo73UUwWH8tpPVCHKzlL
         MI5KRUoyGiRdaa7R+PvjbVpY56WNFBDyL6zRd6vjxh+wJMFgRpi5RiHg5BCHENQiCevw
         tFByb0IvG7M4o74NpLKdZlR5gR2ecylE7i5HMbTENxAud8Uor8hbjVNIeNwnSTJQ5arw
         IJe9MHKXV1mpKkxFTFIa9OZ1F0KJBP8g6dxIaIYKeAzdJeuqC19umK4gM2/Ts1foQFy8
         2V56wNPpODUXk7A/FJLKdzQD7YFYaxBxibPO7HaLz13rvSp6wvcWeSA/MbxfXWph4RUJ
         E34w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745912581; x=1746517381;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F+uTNBkxVqUzOlu1JM6vCecH5db95DiIuI060h8Clm0=;
        b=mo+2ZTg9b1DaNpRdGgykxtYzm2mFHg0FLw1M8mRPF6H4j9BHm3KQZDru+z1aD1ILPE
         od5gc9691/kNB/MqA4eX78jKtkPdrNyQ9AiDl8UmEIK6efrsw61t9gVzCOunU7Hlv13u
         Yh7+bSNYQfZQrxJgHWg/6ZZVE/Cv7yHwEnQAxkNlfqXEKZpUYFqeueflNm+2M5BGtvcq
         CU++CkzU7O8W9LsebUG/EfJK0If7LMOcMGkgtrOdoFeeja+qa5gFOcL/8WajNcXZqVA5
         92TJz0pVjUJjCuC0V7vfMpxTmk+oCkPD9Da0/+Mln67IHZJ2XcvIioRn/SavekMNNnwF
         sMzg==
X-Forwarded-Encrypted: i=1; AJvYcCXiH+XyfdT0JB50wrkF+jhOd5O54+Jp13OON9ToXrCRthHQBzMNQc0ruyhDy3RPZxJZQLKo8nJ356m3gFw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz67hSMql86DpeLqAQEgCy/ABJOB4H6mpM11Q0xpcBam40FR/Xa
	4OOgor7aBAStIwambaD52yKtHo8Qv4LE5sjv5mS3h6VQnCW5YWOsKzVhCGuDtlU=
X-Gm-Gg: ASbGncv3OMd1Wz2mewhdGlFKxShJzRAz4uUVYqS9Ok4Fw4uFz9/OhKniIvhh7jzqCx1
	1N2glxicbQcy9gCk8gAyn+FulKTHjG5Uua5v8r4gwPyQoGWOeSo+02gpIgyu5toPIOyyJN8zf95
	3EtIJF7Xp+17oz0Jiw10z84BCMlDMyCXo3BYEawZXrQgJWcbF9RJLr864vh084xhMOT1k1jvN7y
	xY3VKpoEEZD97vPmlPTKZide7AB+ivlCpuoi02p9bSeQUmLNlE5bQ/HMTL3fE4Ba4MhS8lMGEd4
	17vaDh8yeGDSDXxJEvE2pdgG3eM8wXrH0IIv+oA=
X-Google-Smtp-Source: AGHT+IGFbkcLdkOebqlvhktc4XxOR+kPFeyvv1NmZrdv/VsALlmOV+cvbZCLiOzMiV42WIgb7kMs1g==
X-Received: by 2002:a17:907:7208:b0:ace:3c0b:1965 with SMTP id a640c23a62f3a-acec4eadb28mr219125866b.39.1745912580861;
        Tue, 29 Apr 2025 00:43:00 -0700 (PDT)
Received: from [127.0.1.1] ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7013ff4e7sm7048114a12.22.2025.04.29.00.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 00:43:00 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH 0/7] arm64: dts: qcom: x1e80100-*: Drop useless DP3
 compatible override
Date: Tue, 29 Apr 2025 10:42:28 +0300
Message-Id: <20250429-x1e80100-dts-drop-useless-dp-compatible-override-v1-0-058847814d70@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOSCEGgC/x3NwQqDMAyA4VeRnBdoizq3Vxk72CbbAs6WxIkgv
 rtlx+/y/zsYq7DBvdlBeRWTPFf4SwPpM85vRqFqCC50rg033DwPzjuHtBiS5oI/44mtomDK3zI
 uEifGvLKqECPFoetD6uM1EdRsUX7J9l8+nsdxAiAXmvmCAAAA
X-Change-ID: 20250429-x1e80100-dts-drop-useless-dp-compatible-override-db8562c6b7cd
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1759; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=dYvB61tFWaA6yh8/duxHkHb9Z9xmEpElUy7jETtqYYQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBoEILuUvIun7C9opgeq7YaOnb/BTs/CChz/FbDv
 5NoEh5Nn/WJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaBCC7gAKCRAbX0TJAJUV
 VqkcEACwAL7XbUoToWC2EYt1kXamDT3RaIr6kpc57YKTrNux1sQZhZCohb49PD5xlzXAZxPoqNH
 vyBjG+hPkFq1qeJoTyZAZwu0+iDMzE5M+HInhHU/0ZzvlmcES1zZrGEMHRu+M+SUbS1wnHFgpUw
 CfBmMbAycDh9gbCLqcmUhF8iy4Io78PTsJTqNq6sAXjf4leJz+HhqQDvTgFopeZIQaU+IUXKxTN
 qV/zOjB5dWucAAQdaixnBZk1jV/gU9WkqD7s0CiApU4owqAwwow2h9AvnPUhD1wRJga5SzVM7K0
 fe1DwDTGU8biiFo2163uIt25c5VktpG+L7isNPplazwZOkAscAuEckCCfudtHGncz9o09Pps792
 3rB2dqgBvbQFnLpKqDuI+PrW3//t6FeP1Rqk6JNFNx2gvckix2aWzn9Kd4uUCpZ2zivkIxftQP+
 GyNrXWlGgrNhY1W/lUyWbGP6l4T3te3e/1mXKj2VGyZnsWeVOFQyImeNo2HXB3qMiyVxqtre1BG
 lgP4sZkkLPn+QvBImpDYlLODAioYW0r0bwz2SQZH+iywl0pE3DQir9CEiwKmleWD3S+niX4wm7c
 0/zFaZ9ozD2OiQqUiktnnbV2Bd2bUcEqRDoNxbqXo6kaS0zJzB/gomu7ApHe8s5/J2BznkV9OxC
 unDP2g1+IcZEFrQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

It all started with the support for CRD back when we had different
compatibles for eDP and DP. Meanwhile, that has been sorted out and it
is now figured out at runtime while using only the DP compatible.

It's almost funny how this got copied over from CRD and spread to all
X Elite platforms.

TBH, the best reason to drop it ASAP is to make sure this doesn't spread
beyond X Elite to newer platforms.

Functionally nothing changes.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Abel Vesa (7):
      arm64: dts: qcom: x1e-crd: Drop useless DP3 compatible override
      arm64: dts: acom: x1e80100-qcp: Drop useless DP3 compatible override
      arm64: dts: qcom: x1e80100-t14s: Drop useless DP3 compatible override
      arm64: dts: qcom: x1e80100-s15: Drop useless DP3 compatible override
      arm64: dts: qcom: x1e80100-hp-x14: Drop useless DP3 compatible override
      arm64: dts: qcom: x1e80100: Drop useless DP3 compatible override
      arm64: dts: qcom: x1e80100-romulus: Drop useless DP3 compatible override

 arch/arm64/boot/dts/qcom/x1-crd.dtsi                        | 1 -
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 1 -
 arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts     | 1 -
 arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts       | 1 -
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts    | 1 -
 arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi    | 1 -
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts                   | 1 -
 7 files changed, 7 deletions(-)
---
base-commit: 7e69ad9a1f7ba8554c4d3d1ccbffcccafcd45c2e
change-id: 20250429-x1e80100-dts-drop-useless-dp-compatible-override-db8562c6b7cd

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

