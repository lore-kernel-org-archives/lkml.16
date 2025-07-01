Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4D927F18C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 17:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751390938; cv=none; b=Az5+be07+akp8gXhJMu+cPHvJsxUbV4vEjdqLXpsUO74c6sqwlBRjZK+rS7gSd4ZwCinKxwFE0S0T1HZg2k5ZOF3D2hfAIp8WijhC3ufcyQUdeD4qn9eXGzAKSczes/hhaRNIK7z+tVJjXYSdeZdu04W73QhOX1QBogg0iMs0Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751390938; c=relaxed/simple;
	bh=Zujt7XXF2JCBnDponojkL+Lg3jkgrBtStEB3brioxIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Akn3RbdAo08Z09W2Z2nDI8hAoK59RLhxXm/cm5GaZwjx52YeDyQv0RXME0whN697N9tSnMepQ3Ti2Qiz0k7+sy1PdE2FdcJU4HhRFz8SP9x7nFbfDyfLbS7lqFb+UwLBTGRvX5sE/gHR7/dNKSFJNwhnILLpJqD2n7/2m9JwrFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qm5NCs6v; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qm5NCs6v"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-453426170b6so37140415e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 10:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751390935; x=1751995735; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wi7fY/KxdNeetANCh6SKDsJR8TexnSGBGPpGc2ysHjU=;
        b=Qm5NCs6vJsoBX3RpAkc7Y8vAGU3R03dXgAJ4ky5vCF9g/BM+QHufXOXsTtVzC7CVb+
         o0sjtcUIzUPN0hlVkclHY2O/0I54ENzKWvsG7pSiYaljBkm2QwQJYO9Llg8fpPbQdcNp
         hdXCo266ap8Zg3+FP5TMmQOU8ZjhpgIOLLV29zQTOR+sOFd/wD0zWuofswadjd5OIS8M
         bqgYmzAsTqZnZNXg9gzmUbNZHyUtG+d7SKGb5Ywrq8deh+Nc/Bfj8SJnYESaL5qenUX8
         GtT+mLirzQotO20KoQ82KR7+ovrw2uo+mrbI5FMJERJk9l3GyRbJqKIoYfaJgNGHZv1O
         E+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751390935; x=1751995735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wi7fY/KxdNeetANCh6SKDsJR8TexnSGBGPpGc2ysHjU=;
        b=Y4onkoJ0bHuC0+VeAzftvkBpRDfgTFR/3PD+vVllp4L7PuBlYsXyMnoczsQXleCLvK
         aXriFZOHJ7hFrnGCw7DNQqwCsz7LfzkgAXbY9dU1KCEJRdvdjiu7B7rFB3ahhDJDsRhw
         6zuQq2wOjnn0D0kn7x5DvKag6/fc7r/vre7T2IuPfn3ttEPpuhzTKB5LbRfW98MdxD2B
         TH8XLILQO4xC2xRmnLcep80uOkqByb0UynHp16VRE81HGzTGhAZZy1zOGLxGoubrPqTp
         trVnKtAOTIlG6uKfaPmpz051s0Y39sbUTNs785MQcD7hR59iS5EwnHioxyaDkgoRpkBq
         0TGA==
X-Forwarded-Encrypted: i=1; AJvYcCVHE1CRQ9zCH2ZHjQYkD3/gS7h4tEiW3KmNHGuf3MPJfn8aWEJQ/dtG9N3CSnnrqDKyflpH2GlFMnVGU4A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaQeXsWnzAKlNCzY/x9nVc1pZItLEChg5mKowZF6gMfhInjRS4
	UsiK/sqnVVQsaIYrFFEQ3ZBHhWpMCJXpguKbsj20YSpL2itgjQijECm9EFlhU4sjlvo=
X-Gm-Gg: ASbGnctYrIGqXxQouR6DU5jespfoBxY4DDxFiSqN7/UMAdyJ1HgLuKRJFldMPOFs0y1
	U+YHqXZr9hDMiMerMu0VdF6ij62R66u33AH/aKZJ2cz1QS/LEjn6gVCto7e7nAnq6sWIGMGgCWW
	xi7uj4pClw8pjq1mWsg3kTasImduEJFrdj9+YykKxn7yFtNysvkwfmTfazcOM1lO8077k+bF/9c
	Qa3an3bJOZ7F1bl0RVss5fzJvwK0DVFCVj1VlG2GS0lRjylZsPzW84VgIR9vdZ7WWqOgORT+CBc
	NDoRjLHdj5LMPGWA3gKMFEe4iyUlirW+ll8Tn8ANKAAcCWJLhaUvxJe0gU1s3VR+R5dAm4wpSyG
	w1w==
X-Google-Smtp-Source: AGHT+IETZJBfTD9XuFDlt03qYFLOlybO8L1BIgA2+brpgkJyTjecZyDbBkqpSABvlGgIIszRDeEhrQ==
X-Received: by 2002:a05:600c:46d1:b0:453:84a:e8d6 with SMTP id 5b1f17b1804b1-453a78b99f6mr49058275e9.1.1751390934981;
        Tue, 01 Jul 2025 10:28:54 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:1425:eda1:87ab:f850])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538234b1b9sm198716175e9.11.2025.07.01.10.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 10:28:54 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 01 Jul 2025 19:28:33 +0200
Subject: [PATCH 1/6] dt-bindings: clock: qcom,sm8450-videocc: Document
 X1E80100 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-x1e-videocc-v1-1-785d393be502@linaro.org>
References: <20250701-x1e-videocc-v1-0-785d393be502@linaro.org>
In-Reply-To: <20250701-x1e-videocc-v1-0-785d393be502@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Stefan Schmidt <stefan.schmidt@linaro.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

X1E80100 videocc is largely identical to SM8550, but needs slightly
different PLL frequencies. Add a separate qcom,x1e80100-videocc compatible
to the existing schema used for SM8550.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index 0d99178332cb99d3f02f50605e19b9b26e3ec807..fcd2727dae46711650fc8fe71221a06630040026 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -25,6 +25,7 @@ properties:
       - qcom,sm8475-videocc
       - qcom,sm8550-videocc
       - qcom,sm8650-videocc
+      - qcom,x1e80100-videocc
 
   clocks:
     items:

-- 
2.49.0

