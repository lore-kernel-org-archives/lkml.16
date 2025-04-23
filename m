Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F8D26B953
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 07:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745393443; cv=none; b=C2YV1udNRcbcmcNq9w0Ki/y+6UEp2MuN2Ymwd3DxbwAxA6l1lUUXAJvYMF7EUdv/7VVnW4s2BkU3nsDQCawol75y381spRU237h02jlRrZyBtaqDpaq2x5h0AwzvA0FfgWXSpwB2d7V8qYk1V9PkYM+L7vSfRisjVucGFsJOTDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745393443; c=relaxed/simple;
	bh=7HQlkprq76fUgPo7KHD3p5MDWCGUHBE5rv7Apl3+wLs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vww53PRxrs+uguXe2b/onSmSQ+dKlluQtxUJpFEi4+N8WU8gmtFemxxqXTmOUgWFjQ9wpdCx18HuF6RPpQys0hPQVI79FrPZy9Q0IEKhsBDqbe0rJPoy3DkfcXRe/JwqY8fXxVWmxAcKPifJF1FJ8uvP6cvb78I0OIBRQjRF/2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZK2NpPu/; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZK2NpPu/"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-391342fc0b5so4957918f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 00:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745393440; x=1745998240; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fs9MzmNL81A60l3iuA54wmg1x6vTbax/gqInUkeJ7D0=;
        b=ZK2NpPu/gpKmVR02zco2Ob46PsKcl83erFD+QyN7rAlbYtz81p9224SOLVNW1WSrYQ
         sRpMG3cTfgL/e3lZZh+MrbltS9dJgiqH5Z0aLMN4L96Qj0vThQeCQjQp5Qagn/fkH/kQ
         iqwZZjm9tbgCkGmCRwzoPAYLnLrQFgQ7hauVFWnszAK1aqZ5dUX/c6wicuroAoSRvAVQ
         44jUH06KhgcwcEDoPZrIpYN09PcsmUlbA+RF6YPWjLF0CubU3JNc/q5CpxygKMQ1jFVV
         ETtKtKokPkdBLnNPPkftSTb7mrSa54vpmYVhBOGqnP+hEUD0/IIqJOPQd8cVYZHu6H+9
         yQKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745393440; x=1745998240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fs9MzmNL81A60l3iuA54wmg1x6vTbax/gqInUkeJ7D0=;
        b=Qmij7lK7NPq4Te58Is8FSirzCtdvA6SqeFu7O/Z3XvMbZYI+Nr2eGfXPcPcK2+GdpR
         2mCI0o82BmphU9ctGOAxQFI0z07X6zZXDj1TewG88unrBIOhLL6ZTu45iaEm6c1Qbopb
         zc3E4PpPn38pahre02GjJTHIC/nzI96roBf/A1LhX4CtzijS12DzzwrZkul3hOsVt+xH
         TUdxeHMGKdXpjQfxC5ZBXwsCRzuXDP3ANIbJ16I6pMrONwPT2b6YwpT8Jgr+otUdXpgD
         WM25WX5WoZcJjC9IP/L+wkcsZloeEWVp6fgiR+b9AbyEaEdkF+oWmZCM5PkCI21B8Jw1
         5CUA==
X-Forwarded-Encrypted: i=1; AJvYcCVGU1FLqEtGTYwD9eMDSt5W6N2kYyPxbCNGW70GBDwSQqUoJUwVAVGiHaoUbvJhk5vlWehjSE52qgKUrZc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwXDHbcXih4CHrhRdWnfw6pRylTiorF+c+O6aDVjqWAETqHisR
	wxt3pq9WQeiEu35CM+LRaiJmLa5npJAs7P3r1LqiRj1U2PMP0PhqW1AhlNUjX7Y=
X-Gm-Gg: ASbGncusijVlyrAQ3KFP17FrCVYsSVW7QzTeNXvPPIsuk9iz4zwkAA6rP7kei+xIOjf
	CAtc8dT8efgVt5DHDpznNJXNS8t/O/fY0BOpE3iCGGe/GJgcrzZcR96akVz7TR5d+RRiZ/6dSrY
	YDevYg7hhFBvJlQnHO2tywzpTpeTECa4X+W3usHxVjeAUZDh9QLJHkTk/OHZyZ+lVsp2HfERB28
	sCv5FFODh77Iy1eH+l+oH3P76QxX6hVmGp8bbiHMdDX0l6ekGt4OAh/cjWVDP4FtEyF8s0INvGE
	jAtTxaV+n2kPhGlk95XTC0qpGBr2ux30M3UnYUcxFYciUfF9o5KasUo=
X-Google-Smtp-Source: AGHT+IF085Bi1ya3FOXNa+3yFhq+7vRJ6CjTrUbrgCZxpZbWxZoaUVpqRhez1nOFOdgLjh4jCBDn8g==
X-Received: by 2002:a5d:47cc:0:b0:39e:e588:6735 with SMTP id ffacd0b85a97d-39efbb1f7f8mr14078560f8f.59.1745393440014;
        Wed, 23 Apr 2025 00:30:40 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:67a8:3ed8:e19f:5eaa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493115sm17761699f8f.78.2025.04.23.00.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:30:39 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 23 Apr 2025 09:30:10 +0200
Subject: [PATCH 4/6] arm64: dts: qcom: x1e80100-hp-omnibook-x14: Fix
 vreg_l2j_1p2 voltage
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-x1e-vreg-l2j-voltage-v1-4-24b6a2043025@linaro.org>
References: <20250423-x1e-vreg-l2j-voltage-v1-0-24b6a2043025@linaro.org>
In-Reply-To: <20250423-x1e-vreg-l2j-voltage-v1-0-24b6a2043025@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Sibi Sankar <quic_sibis@quicinc.com>, Marc Zyngier <maz@kernel.org>, 
 Xilin Wu <wuxilin123@gmail.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.14.2

In the ACPI DSDT table, PPP_RESOURCE_ID_LDO2_J is configured with 1256000
uV instead of the 1200000 uV we have currently in the device tree. Use the
same for consistency and correctness.

Cc: stable@vger.kernel.org
Fixes: 6f18b8d4142c ("arm64: dts: qcom: x1e80100-hp-x14: dt for HP Omnibook X Laptop 14")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
index 1a187dc3684a967b42817e44ff0df10202fe3362..199e256743521de82d98b38699f96697c5570e66 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
@@ -873,8 +873,8 @@ vreg_l1j_0p8: ldo1 {
 
 		vreg_l2j_1p2: ldo2 {
 			regulator-name = "vreg_l2j_1p2";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
+			regulator-min-microvolt = <1256000>;
+			regulator-max-microvolt = <1256000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 

-- 
2.47.2

