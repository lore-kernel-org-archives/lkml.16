Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1ECA1AB6D4
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 20:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738960887; cv=none; b=otdcgScjQy7pox3C9r0JH6oOq++IytBR32kBaJw4d1t5kvuiSWry5ODLM7e99CvXC4GeYQYDObBv5mSnp832LrLW2Cg9BJcWwrrcAVGej2yIa7lSQfmPPvjjcO8hrzQKmjrCYulFgwyqbl/U1IGu87+aeB8Q84H39sNHnt79N5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738960887; c=relaxed/simple;
	bh=s14YKYID9PJaE3calGZbF8LnlKIvHymDbj6L+7VVrMI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gpNkAAjM374qNRPBW9lyV03TfIcuPp+66apKkZJ1onNtb5vwKHV4qQwiuUKGPOyD6Z+7JNS4PEUS4JyrFyA42vd8dfTKVOl0azOnn4FzMXR6MZSzBjAzxz0Sk1xQ/9bomjYjDlLkopGkar54vA5YOrITDeK92n8oxaklZXSsSOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WzDKg+oS; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WzDKg+oS"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-308a559bdf7so10018161fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 12:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738960884; x=1739565684; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HSlGgKqz38+k78ygp0mcUEOzYQKAs3hlnKXdF+3RtWk=;
        b=WzDKg+oSTLe1MMSevZxVsh0JQRZ/ZbAhdwMQliFqLf+J6DNgbJ4iwZTGULujH/R2tm
         yZrcgz/mnLQGm1n+2vVGPMC1eMTPcNogO/AQvjL2ZMlQXM1r65JaiylApApsajiu0GZT
         QTZAJM0AwfH/kdI1DYZXl4oDd6uet9eTibIpOIzqnOOYcsdfFrqYAUaVYY2DvOO+9gyi
         Nnb/V6pzzA4XdO4PvIx4vl3dKZPFWbdIZcMGjWG2Iay/jqr1oeVygFP+2yho6Tupjou8
         NTDUWkpPPzfe3BZPwjV/UisuKrAROl+F5LDXIxTm4ANqfXgKnJBtgHMWWAhClXhznLBX
         M/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738960884; x=1739565684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HSlGgKqz38+k78ygp0mcUEOzYQKAs3hlnKXdF+3RtWk=;
        b=ooDEhNpgT6lhCYVsUjWMSdf3h5Ur88OUBDOHv1vcn98rv3W8uKFzSxjuI6ACeMuCoU
         XOnQHAUIasj9nulY0rSPknXmDQcuHJM32RV5gwnY0cmvl+eSOs2X2ywBv1g2jKcFF6Xg
         M0JZVM7u7C8QauyC2oaCfEDvI+wuz/tcHwW6+pAEowDqPZFtXhRFD8z52pFGFntIZcVv
         c40dprgkvYYUVwB0stYusFXlpeDFv0VV0zuy3SrjhVP7T8EmTc2TCBXDKkdAHloTQ7iB
         4oYauHnP/VKuh6LOGiw11SXM00SgQgpQ3PLgjD5VhWOK58I19Y0OwpNYMVS0wxYG3eoV
         v37Q==
X-Forwarded-Encrypted: i=1; AJvYcCWoeu2ZUHG893F3w75JI+3sDffWgJ8tjrCBbItBynP7PieftlvbWh6VXAlWVxiPj3iF2rB8Zx6C5FenxVM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbDNNc7+FwHqR0BY/b6wJ2IzK1iDIs/zTD8pDTp416xMmFWwvw
	7IXrOOfLj2qj/OvXXe/asj0lUKsgxuLnTWfjI2Ko8EYF1ukD9V2yiD49w7PaKLo=
X-Gm-Gg: ASbGnctz06cJRk0qcjgouXfCoCYMdG6j1PwOvTkCiNeFuyaJo51eMfYi56hCQrOTSA3
	JJFQr8f5DNuUXxSlnReUV/+WPvS+V+DMIJXs3XCS/DoZ0mzWdTkvbV/9u4fKNCmMV+FGy/bit1c
	oUtZaA9yjZXpS9z/RY+iD1t8TJxvJL69EIgq5477RSZe3k0WFJPRAuvJDKRKGCDQzuvn854mkAY
	ImQwXpl78ZrcaYfZOAgMuN3ZZIZFmAfDCNIfi8RQA1A6QEPwKoqO/hr137h1WiBsNB2mnfpRsHS
	63ZbiSkV3dMVWwOsU0lUYZw=
X-Google-Smtp-Source: AGHT+IHngABXa0RfWQvCOT+hZ5/tEP4wpFl7H3wFVT0JpPMz/eOAilEh8xFb5Y4ccK82JrxnO8CDlg==
X-Received: by 2002:a2e:bccb:0:b0:306:1524:20e with SMTP id 38308e7fff4ca-307e581946dmr20024521fa.18.1738960883630;
        Fri, 07 Feb 2025 12:41:23 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de178628sm5343811fa.10.2025.02.07.12.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 12:41:22 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 07 Feb 2025 22:41:15 +0200
Subject: [PATCH v4 1/6] dt-bindings: net: bluetooth: qualcomm: document
 WCN3950
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-rb1-bt-v4-1-d810fc8c94a9@linaro.org>
References: <20250207-rb1-bt-v4-0-d810fc8c94a9@linaro.org>
In-Reply-To: <20250207-rb1-bt-v4-0-d810fc8c94a9@linaro.org>
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1268;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=s14YKYID9PJaE3calGZbF8LnlKIvHymDbj6L+7VVrMI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnpm/ti0opbMT8jZ+Ob3h/ZXQZ/AbPR399emf52
 uE20q302/yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6Zv7QAKCRCLPIo+Aiko
 1eGLB/9AaRKZTGVR5ln9tpeVIDGYjwzGp30+jHbKD8kNkknwOhjF/cwIoBbV3MIdBLKkPE8aAD4
 1P2AKiseT9gDvt/7CTosS4h9ZOx8VvvuBDZRXJfKv7FxtXXiLQr1BPvCg9jbeguSGVhqvtRlPKJ
 2y/fS6uc8pg8dxpCCp/eMMx8CDIBov7IdNWkF3GLs10tWH7yVmB1xs4VQTqD7108U6L7Vbt1ys1
 GWQR8bSkdzA/VLv3xJueUDqCGSX6Z6bX2/dqdUIFbebtT55N+qnGUViIymzy3eEzXXHnAlrAtBX
 8R8Puv20Zs2+zIvMcQn0lH3tH6qe2BnZTBZ1tAQrRA+PQoEV
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

WCN3950 is another member of the WiFi/BT WCN39xx family of the chips. It
requires different firmware, so document it as a new compat string.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
index a72152f7e29b490003114dae1e36df85cba384df..6353a336f382e4dd689d1f50a624079aa83b2ffa 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
@@ -19,6 +19,7 @@ properties:
       - qcom,qca2066-bt
       - qcom,qca6174-bt
       - qcom,qca9377-bt
+      - qcom,wcn3950-bt
       - qcom,wcn3988-bt
       - qcom,wcn3990-bt
       - qcom,wcn3991-bt
@@ -138,6 +139,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,wcn3950-bt
               - qcom,wcn3988-bt
               - qcom,wcn3990-bt
               - qcom,wcn3991-bt

-- 
2.39.5

