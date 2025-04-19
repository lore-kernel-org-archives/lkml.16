Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056521ADC8D
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 11:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745062549; cv=none; b=Klje27nmZID07NrMG83erVzU0n5I1LJoL/wBabLbOJR9EzpT8WEPPymZg+VmCuI0OP38gOwKZw5Mts6jVFrXqewXuFqRTiKrErtApxYaohLGyU2hoW58n6gpa3roViMDDxgjQRtOiuuBbTGk0xLg+iOiYlG9aBKrg01u90q5V28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745062549; c=relaxed/simple;
	bh=P9tqwhHMVnrLVHGyw0rO+0pqyRE8vhdeoUEsDHyWUwI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OSmhmE9fZfjbCL3E35tOtW0Vkeb9Tq1+mf27gLiVunMAHH1qT/Na5sJOwJDAlkiAVUp3DxmLpr2RwLE2YG3VI0XKJiavA1ZYTwMQpAGlzwNNoGAErgD9VH0pQBiGeHSK6V4X+U5D4DQbMBJWG+TuFuR5vuOhI5a1W9vEaEuvfzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=epcTpPMC; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="epcTpPMC"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-736b98acaadso2507047b3a.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 04:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745062547; x=1745667347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MOQB0CfnACTH9btXGksImz/Bb/gsN8Vilrarvj+IkF8=;
        b=epcTpPMCecLiYLN/vvQJTDyqUw/fvGdOhoxQpnO9e259ZtiHlFzWE6+/kTwyhB8xbI
         mHYHYUjoZx4gDkxGA7cshDhto8MVCaDH7GK/Fb1mYEYVzt43EbwwgVtLHSNLQPgN//aK
         uHSnSQwgyGn0lmteiHMe0kCa9Xwm3DUAPaIAu7aL5NB3b5M3Oyt3TMT42KLchNAn6q0D
         WYXKXMQ8OWDJ2spvJ6BNuUU0wpWal6eyHLUJvB7cvbHOsv2+Ker9MupBXeT0n5PrLwA2
         lu8x2vsgD1jlDU2m+CesyCtdkT1xT22DSFE/8Nb0jxDdggAdSQ6sCNBf3phDY0WUN2Mg
         iZ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745062547; x=1745667347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MOQB0CfnACTH9btXGksImz/Bb/gsN8Vilrarvj+IkF8=;
        b=SHDr1Y0FcVtpUt3a035C2Z5np8QgJ5TG4fJCRu8MWMqhBPPHI7wcUs3jts54JIXfqQ
         UujvU8LjK1Qoc96czWUzFDy8mgUKt5KMD4AN6bnahdsDiIqLUW5LDY28HLSb+sFaeadj
         Wr/7tub1FGnZ51hLGJgAqMQf4XmFvRjfGqNPcpE8xqhdPl0h9l+tP2VpeNy1sA2VM/yg
         YAWEpVVsKxQ2c6hmTFbeNi5p7VcGtrXbzl5DZzqvnMbNO6mr0rRKd14doerHv8qFPEIv
         Upab+P6147W9NpsYSCUkUNoVj136Xuptvilbr8224S5OfUu0XHgilCK9O30yfbcYKCrk
         2sug==
X-Forwarded-Encrypted: i=1; AJvYcCWCZK/x5vtdv5UqbuPnXkra8DUsQ29KOQRdjEIyBrU3crXtgljpafJuf1/4YrLiOD00Y2MCJfjGmHh8Paw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVfP48BrVvl4iGbj9AoW1Y+3Hyl3Tdw0JQFSDk9srq6/d2MjFf
	g3j21oLfFH/7OGlANOECPteN8MoE3OM3fBVMb20BEumMFD0In3/9n3JcPeX3yw==
X-Gm-Gg: ASbGncsX9LBS1Hxr7pEPsceVdGNv+r6eb0hv5c3bmUUby5hO2RKU+ihgvMnkpXHU9qt
	FEMrfG8ZXSttHzWtOWkfEV3mxNPEGQ8K5mYzrphA/Xzq7yfzu7l95X3pY/KtLStj2weNIGRjsPl
	rLGMEbzzCL5jqvWlGeVbYi5fKjC9OgrIyyCPL2VIAfZl/jIGoftjQsHLzdPU1X9jBs7P3o1AWtj
	vmhYBDXGvK7oxbR1evWZRrI0KkNlT6c/nG1/SE5/MKRPB+m/D2HKcMQiUGOmEAaTbybxdIc279o
	xDwp4LMmLo7l2quxEiIsOKsxA8fhCb/7IkQvfWcoWkTZjmctn87YDVAjvhKG0OWO
X-Google-Smtp-Source: AGHT+IGCM+3I80JA+fktzJ6AOpYl4TuGcM59V0sIzl9Rp8Wbr/2ZN2X0j6onHQC7TRSSw8S7bfKA/w==
X-Received: by 2002:a05:6a00:44c7:b0:736:a8db:93bb with SMTP id d2e1a72fcca58-73dc147bbe4mr6963805b3a.5.1745062547148;
        Sat, 19 Apr 2025 04:35:47 -0700 (PDT)
Received: from thinkpad.. ([36.255.17.167])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaa8104sm3094614b3a.123.2025.04.19.04.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 04:35:46 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nitheesh Sekar <quic_nsekar@quicinc.com>,
	Varadarajan Narayanan <quic_varada@quicinc.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Praveenkumar I <quic_ipkumar@quicinc.com>,
	George Moussalem <george.moussalem@outlook.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	20250317100029.881286-1-quic_varada@quicinc.com,
	20250317100029.881286-2-quic_varada@quicinc.com,
	Sricharan R <quic_srichara@quicinc.com>
Subject: Re: [PATCH v7 4/6] PCI: qcom: Add support for IPQ5018
Date: Sat, 19 Apr 2025 17:05:34 +0530
Message-ID: <174506248858.36993.16776911962965372493.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326-ipq5018-pcie-v7-4-e1828fef06c9@outlook.com>
References: <20250326-ipq5018-pcie-v7-0-e1828fef06c9@outlook.com> <20250326-ipq5018-pcie-v7-4-e1828fef06c9@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 26 Mar 2025 12:10:58 +0400, George Moussalem wrote:
> Add IPQ5018 platform with is based on Qcom IP rev. 2.9.0
> and Synopsys IP rev. 5.00a.
> 
> The platform itself has two PCIe Gen2 controllers: one single-lane and
> one dual-lane. So let's add the IPQ5018 compatible and re-use 2_9_0 ops.
> 
> 
> [...]

Applied, thanks!

[4/6] PCI: qcom: Add support for IPQ5018
      commit: d17ce83fec4abf4e2b11c6c2268f095e35a220d4

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
