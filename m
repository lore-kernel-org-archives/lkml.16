Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083251D7989
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 12:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738498570; cv=none; b=FD48QVsDWT1b1iLqu453VLEwAOhau3Pti+GIHwTpoHADJPzQK9TvpoMsBpxk9BxZOh5U32kN3Kb7NS+/g3lu924q5GpJSn4w0QhUOOF/etlqfhRS2QzNE+v6SOe/FbKw3qub0j+2ta2din05KjK0yl57eVJcRWIAhxN+V4ugjb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738498570; c=relaxed/simple;
	bh=/d/geU3OxC4Nkibrq9A3Ew2gwBiXmZo2CHTH+6Gy0Vc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jX9XuLuSrHkSGqUuNHEuJrq2OWXqqmJBSnFAAnNOX1uCSdAXr7xi4PmKSWrl+zjGnKt8vHpIcv5cipIcBDc7hdb4d5BQ7ic2IGpIUmWItNSqBMiavTu2Ljfd5emZxrCB/RM+Uo/+5VWWKonjAAkLbQoqIVvmq0YUxodIsy8JSvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JL4GkBxB; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JL4GkBxB"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5401e6efffcso3649071e87.3
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 04:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738498566; x=1739103366; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Dk7ljpeNS9WkTUfxOFg/JBajDxdcbPw39k3Tq9ImKI=;
        b=JL4GkBxBbSlI0/wHjLKBhSuaSJ7t9Q5DiBXxkc2u7JVhuPzfIJmz+/8PyI8M9iPwmw
         mONIP0VSf14x83Fa0R+DdYEtJjFgaXA79df7H4YznQbYSNhFy6QUBzVNQ/GWuIdMBJjy
         Lbly12zucWNvw46adQ8K1j8i/GgK+It/NmHP53rNrno1VwHFbynshx5hmUq8ejmzTj9v
         F1qVnuLWZCEcU2LyXAJWgIb3DEHNPwNNHt/nWF3NCNyEyeWwKV1whoMLY8Do+16UBgIA
         GYrj/9yRNeX52FeeXe3/Pu9f6c4BLj2cJvmoD/VD1wXTHToADggvtH4uMBOMkDlrqeUf
         EukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738498566; x=1739103366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Dk7ljpeNS9WkTUfxOFg/JBajDxdcbPw39k3Tq9ImKI=;
        b=p6veRZSVH0R9GQh4C8tLqUZp6nBmdcEu09CYs/9BQ6pLhTDBtzOIkBqPEuieaYrjRH
         WwieJIsQpEN+CacwjTApDgerQX+mkW5Tm0R8WgBXIM676w/paRJ7H6itJL6qb5IVKVRv
         6rrsDxRNCLhrnft4+NJh57uUG6IUhaMWIuZMiEbIMppyZIPd565RWMTeRauMwQZdB9BI
         K/abLffYRvFXzBmaJbzuom69mz4QKM+pqXUaf0CyPaexSfJua8zEWHbdEB+ebnUrqPn4
         54E6CkfqDxBIa5AqVtjD8cMpr/lzr+f7I3Fwh4eDcXy7rBounaa046g+2WNHLAawwzK8
         kyQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuLcpGpA1NS6dnceq5CcuYAuM+9DCI3sH0Y9rACMDDYL1MGPH8rYiaIflooQpmOi7kLyWOPbD21oYsHv8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwV4IZliaC5OUs/rJehXomJQ9BdGkds+oNoHbioriN3R385yCdY
	un1zFxYGEogPRN+fLsbU2WMPRCFgSMy7sWN1xN2wVoQaDBzzGPJ+lihBj+HGXVw=
X-Gm-Gg: ASbGncu2fVcTa7ehnPmvqPw8Sk2H9QZ8MVu0h8NiILNED6yCc7TOxpi/hN5Vro3diLZ
	h+2ugL/Y1Kt0v5jCSq6M6TPKPTtsG5aYmRjpdGEeS5/JqVEWLbbihKcIiiOWvIbMm/M9n0gGGtr
	qL3QKdPel19tisS4tm7geyW2rUNrkpZgNqpPBtIPkIRqlJ1r34Dn7LfyDFll5D4jzN3Iiym+Fiv
	l7wwZGylduch7/mXk7sJTzpSJ3QkaONqL/U4TxAHeiig5oMtMaYK1LC6qOWCWTYj6LJj5/T0Xw/
	8EcvLWrOcRsKpTlVe36Qolk=
X-Google-Smtp-Source: AGHT+IGP98WumGAvva+L5oENy7ZtjMAo+pqO/eBrk6bMfEKIlWE1R/0IRGd/QpefZzWafsWgZy/y2w==
X-Received: by 2002:a05:6512:32c3:b0:541:1c49:26a with SMTP id 2adb3069b0e04-543e4c41038mr6109076e87.43.1738498566072;
        Sun, 02 Feb 2025 04:16:06 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebeb0a4esm950663e87.114.2025.02.02.04.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 04:16:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 02 Feb 2025 14:15:57 +0200
Subject: [PATCH v3 1/6] dt-bindings: net: bluetooth: qualcomm: document
 WCN3950
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-rb1-bt-v3-1-6797a4467ced@linaro.org>
References: <20250202-rb1-bt-v3-0-6797a4467ced@linaro.org>
In-Reply-To: <20250202-rb1-bt-v3-0-6797a4467ced@linaro.org>
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1201;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=/d/geU3OxC4Nkibrq9A3Ew2gwBiXmZo2CHTH+6Gy0Vc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnn2IBFNJQoyc6Q4TD+Kypa+h8oMgJ1mr88BTN7
 iUCRw7nItiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ59iAQAKCRCLPIo+Aiko
 1dQvCACSiRQJBXKmOxljdACfeKHT2m75Y5VpbZRWKMkcI4H0buAMvopgfIgG9wPFTf/dek+VG6p
 lqKqBfxIV+KU99Dcb7wxL0JW5UBsMx23ADuVZLjUmdCSJq+tSakpNlbdkmaeXyV/PNUD/ULwhyZ
 MGX56kw39F9vBS3TgKHbv7ncPOqS1mNm006aKml/MWzxKqFLXt6mlofqI7V/K82io+gfHeSK9am
 Rnln3hHL6poko2ReUQcMCvpYBAcF7RmwaYk9th1OWVNRCsz9QpGgjdzztVW0T5JFUbjNWxd5VvI
 hen+Oa3myvAKVNmTcGGAZt6U1MMoI4lAB/6hVDsISJPP0Mgz
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

WCN3950 is another member of the WiFi/BT WCN39xx family of the chips. It
requires different firmware, so document it as a new compat string.

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

