Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A855214809
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 22:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738536375; cv=none; b=c58XPm5teENxQkulFRJgv5U62lAyatHhbYGU2pXkyCt9/XSVQCHTeZGnmqGKl7zNZoR566XM0v+SRmjmZE5Vte9d/RBdRD+C1A/iY3ZZCZGFgN24dM9hLSw3LRBSSVGrF3227me+NH1CK0y31NmKGimNsu+Q5TetEsHeHwC5c90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738536375; c=relaxed/simple;
	bh=YnNSE/LPAfAe/u2HSLYj+o9uJBnXbnpQ9KgSWsMPZXE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dfVMPgMzKTwBdKT8bgDvTb/1Vx7QlXuA5kv3bsE8+Kq//sBpt760+vv+QVhYIGeAGUiPPvReUho4papO7u6eNWCEiw6g/YvLvIP8YKD9xvNQta9i3HHzyRSV05owDQ7DQyG/IP1uy1M2iEqbMyh7Pwx45lLKbg1Hiem1EoR1Zvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=b7cID80U; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="b7cID80U"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so25648735e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 14:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1738536371; x=1739141171; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8RI53vn3X23eEEDFRotITDuCiKS/4aif1tdWU0fr4HU=;
        b=b7cID80UgQ+VIi32X4t5rICT6N4nRqY8owH39oNJKBX4CxW2CFyHStwaj66+T50RtE
         SCIBxAeefY9TLfR8i1rX1SV1b0ru9Tfw9luX5japSKJwMZx1JwmLTmCc7piSrpIVElS/
         +yW1nzLQN+uCDBg1qaqdrcnV9zl5ABc+YmcaeWEUdOGvGvYfoT/Yd5+TwDhHTY8EtT9Y
         oDRqntj+UQiEKpLrxTPl8fYy6L9MMAg/GJs4DjRwkLyoraOfWw102Zj7bdrbZdVdmqn7
         i7GywM7CVBUcsEJpflubFQ+nLPkbIlpCIcnjl4pkmrTZgCjcLaX4qViOFwPMKxGdBzcr
         c+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738536371; x=1739141171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8RI53vn3X23eEEDFRotITDuCiKS/4aif1tdWU0fr4HU=;
        b=pj1ztRG6a0qV/4PG1bRv879MVLRAcXgdh8LUItTMKOUZEZQ+SoTj9iJ8fbHsdSQAJ6
         ytJQ3tmjOIoIaYpHng+DXpO9isCI1CVImQStyv+zrUN6mQJBSk5MsTyauEOyPnQK5ct9
         IBIxk036aaeFCwWq7FQZT2A9kH38X/XyQzNq4Cwhsw7fMTPp0vAPzRt3eQ/tMkTaMQJQ
         +SHarqOFUp1J1CaIQ5i4GyYwFu4Ip36ilhlZJARE68jBNzYc6zyq7HnJsGZfXOdIeFli
         SEUUweRx1xJjVdiJq5HIiNu1/j5Usg3+Xii2r8fpy63+fDzxyYdkFTKf7Lhl7b5mnr/a
         jzmw==
X-Forwarded-Encrypted: i=1; AJvYcCXUyGl+QSA7IHPbqWQB1cG3/4L4srlbLeOQRgCptwOaEQSL19X3wcCtaEmiUbvI589PXNnEm5dGPE0obxk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMWdx4Tw9NFYy5eWDGuM+kGuATsPeBCBnqKGom29UaMoaYXogy
	JqbYe3luTAcILKqoWT7PHKO/vvq/rfR/6ZImoCksIwrgwJewXxRNUsher5OQODxRB3CqmtGTeWR
	g
X-Gm-Gg: ASbGncucGE/hgTJfAPVRqPY+9hppiGoPu0SU6TaSCTanwMUknirQx2l/T6pIUOYHBYs
	ey+0oeglXaOEYDKy/Tn97JJ6UGX6ODdUHpaBTVbERStYDjiSj893T8NMkV6X61CaemYxSgUhwjk
	MLX4UTkPjehQhgH9tW8B81WuFj8a/zGomkKxJ/tA2felyzz7Q3xcUBFwgeXbRuwyQ09+Wg3YstL
	T/IU2mgf6yJuJeHL6uUnmgKZX7Re4hx2Eb6pCWrSOsmtBvqRY0mhyseqQoJeQFXynCc43UsUIWL
	ARB+U3gMKWcN/OmNcg2TPxu479w=
X-Google-Smtp-Source: AGHT+IGBX6lu1OSNvz8aeULWff/wDITldKG3wzn8oH2zHYByjYJKUn9rdrJm/tqoC8tJVosKX2xovA==
X-Received: by 2002:a05:600c:1d26:b0:434:f5c0:32b1 with SMTP id 5b1f17b1804b1-438dc3cb5b9mr167114485e9.15.1738536371121;
        Sun, 02 Feb 2025 14:46:11 -0800 (PST)
Received: from [100.64.0.4] ([2a02:a03f:6bc3:6b01:62c7:350e:556e:d0f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc80e61sm170849605e9.34.2025.02.02.14.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 14:46:10 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Sun, 02 Feb 2025 23:45:52 +0100
Subject: [PATCH 2/2] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable the
 GPU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-fp5-display-v1-2-f52bf546e38f@fairphone.com>
References: <20250202-fp5-display-v1-0-f52bf546e38f@fairphone.com>
In-Reply-To: <20250202-fp5-display-v1-0-f52bf546e38f@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2

From: Konrad Dybcio <konradybcio@kernel.org>

Enable the Adreno GPU and point to the correct ZAP fw path.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 965e32473a58ae4748e4cb748980fad1d2b06ab6..582b19277de414fa9cbb8f9929c6eebd697e8033 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -651,6 +651,14 @@ &gpi_dma1 {
 	status = "okay";
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/qcm6490/fairphone5/a660_zap.mbn";
+};
+
 &i2c1 {
 	status = "okay";
 

-- 
2.48.1

