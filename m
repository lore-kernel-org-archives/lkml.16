Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FAE2147E9
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 12:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739278606; cv=none; b=Ex5fbBY4sqR9Qbd/tXcBEbXgXFdTgg66e3PGcnriXe8/CbhuW6T2V5RpK4VfrTMTGnCnncaIdu6cs1Xxp4Rd/sjN6Dx4UOL6UJD8i6vvxSdqu+UCX0GvSllq4rdOySH59ltTZfA9SwB12MuLBZyBiBOQR0oKtdMHG3JBFBmUdck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739278606; c=relaxed/simple;
	bh=l534KaQHeipF5HnCgvu/4eiMXBXhIzMa6xV85UpDLN8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U52l1Mx2/9dJFODJY92SUYgtpIPIK/gK9vUYDREhHOw4a5n7QkW071QGXhpTOZHz8HKXdikYQeNKlsFLzbJxPxbiSLrlaKltBE7stvwQ7Hl7lQTXWdyUgxa0HHQe+eaHqU6FKld7yXeX5NU6EBySeBoOnhKV3+W35DLNDP+S78E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wrqtQpaw; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wrqtQpaw"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38dd93a4e8eso2197634f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 04:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739278603; x=1739883403; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m2QbcPrM7Nmj9mrvDTmLOeka9cuKDtzuzeQZCl6bz48=;
        b=wrqtQpaw9W+5V+yic2UWNcITME9hd7f9FtHXPXNb4h1QmniNsf0dbpGb4FfXDPiiwy
         /6ONFZ3kIr8L1EP7QtUc4YqV5lHTIWNatgwM5Sj6qnrJjdAqZg5tDR784whB3Cffiooa
         zn0x4f7mCrvqMORikWiCBfKL2Mn4g3pGZhHzoFtpzXz0PsnRnPJh1YOIwKmVSPSPNfP3
         2xh0WZa/nF4u4/rEo1rke1CnVPUjFdkpVMxgQWQWC0nO1fA03Tv2V1Amx2+4xwpDUq5h
         vYbH3UmtTmHYne7kgsm/C9M4f8SAhCg7xTyfVx8OfzL4sNGXOu2TZlzM6nnuJ6Uonp/Y
         H/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739278603; x=1739883403;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m2QbcPrM7Nmj9mrvDTmLOeka9cuKDtzuzeQZCl6bz48=;
        b=ih3Wc/tqIV01m8aJiKPSZPv4NHTyfU10efwIbmdsI5Lrdnus1P6+fULD6ZFPQBZOfG
         Pq+gcuul+lVI/e9/aG/4b4zyw1Z0BELeHXaYjiV4l72mK71pyDEbQmQCtEbQNstsXKjB
         xFyrfW5RXrqC0PHmjhT1PYO8mfkZAWjkgJijKIq+ufQ+JXjYERyVUc1qQLHzI0n5WPd9
         Z+BGwHx7Refdkj66QSM5XnGnTJDNrew6RAceHQpdZ60LMcy2ckOWlJuAN9T5U0wgd6OE
         lewkcsw3dVVTJo1RfAPaF6vgKv0tmOx34PpIf+rjPKlXN4cAe6hFHTlj23xUAVG7R/L6
         aGHg==
X-Forwarded-Encrypted: i=1; AJvYcCWdtNgfEi4b3DaANZQ1TZPdVfqAyDAg+0P+oWavMQU4fhEsmvt0EDbepY50JE0ZBiwQmhPAtwyqCB9HvrA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEo0XDmwmDQoc+Fj6TFs0Co0QDJD8HO5YoA6aj+ZhHpDCxLUBF
	RuTm6gDeu/YhbBLTjuLylmYDbjyG92FW+znXx3j4jUbPkYtP+uPhgzgZuEuWwZA=
X-Gm-Gg: ASbGncukxDzYRSj+NQHQDe4hgfsdARAru393YmrdvYSmyx37/5v458dZvqJjS+cfxJx
	/RC+4jmeKVObBgq1+M4Mxz8kwsZwJrV3gQmnFkwn/fLyNhNYq5vWYyW/XOZDOA1T5Eb2NIqXjhL
	bPhrkAZrgUsmcphfjTCv+sgX/oMsZcfwj9rjlrlXVUWCwQDJgPPsXjOJYFZvjTm8PGWcSMvp/wE
	rM4nvDq/pwksn1FxliEJg0Pu52MceRzi/KT1oPVqdIFXY6JMc0izc35lLhLbticp9sKhiCigX6s
	/aF+QdN+qhOa1zXv2e7ECyUsdvMqriUis6Nh
X-Google-Smtp-Source: AGHT+IHD1QJbAHIFOi1zXgE+3bom7jzBt6ncrstR3I02jDJ8eFFbcBVdMba2lvkCnyM01hKAEwJf9A==
X-Received: by 2002:a5d:6d0d:0:b0:38d:c087:98d5 with SMTP id ffacd0b85a97d-38dc8da6713mr16029317f8f.8.1739278603311;
        Tue, 11 Feb 2025 04:56:43 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc73c2e00sm12863078f8f.57.2025.02.11.04.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:56:42 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 11 Feb 2025 13:56:37 +0100
Subject: [PATCH v2 1/3] arm64: dts: qcom: sm8650: add OSM L3 node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-topic-sm8650-ddr-bw-scaling-v2-1-a0c950540e68@linaro.org>
References: <20250211-topic-sm8650-ddr-bw-scaling-v2-0-a0c950540e68@linaro.org>
In-Reply-To: <20250211-topic-sm8650-ddr-bw-scaling-v2-0-a0c950540e68@linaro.org>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=963;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=l534KaQHeipF5HnCgvu/4eiMXBXhIzMa6xV85UpDLN8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnq0kINvkPdj5dtWSiZ70NKDNYYOSYlXOvsSqM0zXd
 l7PHiO2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ6tJCAAKCRB33NvayMhJ0dS3D/
 9gts9JzFlQEOcgzU2aiWupKifV0nV85/hjzqNcgJZSBEPYKZ8SBa9pw8YiquPCflilhrRJOawsvxiw
 ZRzVvrzdeW/fwcDPkL3r081BfLSlgxpfBOznA0gjXvZHMe1vAeuyU/3mxp6PPCKtV3OxoKwRdQ3AWn
 JxvT9AMvh+KUNZY27qvtHEmYQvNnl9rWlEa8RDzrtA2qc3TNf2zTZVjwsVPg+Z0MvmUKeAUzjSFlYW
 rQr9eXx9kubCE1gq9tdOXAVDqRLo2ONiVbz9Ou0u6Mmu4mr9heCsJEo9HaT6huF4O87dKGVkVX+kc0
 Nzqp7gfIfQv/qS/Sjv0RvANP+y/SnV0Bc1TF1AXpDnRZK0FDDehYBD4GDqEIc1cAISYFNeUICc+Vya
 I9swqEimSh5wyyFjsjo+vn++LpE8TPND6VAOME2DKYOkqgMMI42UGMiPKAhqqx0Z5Of4NiTOIUifi8
 Kg7SjlPfz4Hnsp+nTotz2vtgKjUqVPVE7BbZKeM88TG6yPp0Y/yFnVCElAosatq1yQFacwUOukiZyP
 20XqpXWnrCFU3MsaVCwFWGKZeDeyi2beqAn60kL4xww3bdjrQPf64Ux1IzlcXpP5TFvrSvreICxc6c
 /KizIOVheS1oEEYrMW+83iX9nivKlHmsldm43sdt9ljb5d+TNIZdCOblAHbw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the OSC L3 Cache controller node.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 86684cb9a9325618ddb74458621cf4bbdc1cc0d1..bc09e879c1440873a52daf3fc7a38f451f1f972c 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5506,6 +5506,16 @@ rpmhpd_opp_turbo_l1: opp-416 {
 			};
 		};
 
+		epss_l3: interconnect@17d90000 {
+			compatible = "qcom,sm8650-epss-l3", "qcom,epss-l3";
+			reg = <0 0x17d90000 0 0x1000>;
+
+			clocks = <&bi_tcxo_div2>, <&gcc GCC_GPLL0>;
+			clock-names = "xo", "alternate";
+
+			#interconnect-cells = <1>;
+		};
+
 		cpufreq_hw: cpufreq@17d91000 {
 			compatible = "qcom,sm8650-cpufreq-epss", "qcom,cpufreq-epss";
 			reg = <0 0x17d91000 0 0x1000>,

-- 
2.34.1

