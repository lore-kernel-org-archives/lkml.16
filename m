Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798211FCCFF
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 22:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738536373; cv=none; b=Fony+rUokbjArSAwUto12u9oMqB/a26ga/AcOpmeXOUf8OmXMw7HQc4bfdfQWml1Sd181ILcFsfUbB5CommzKinmMln/DJIEFGg14zdYxD8MqYNen+jYZPT4BjrlWdBhKLboVbBlZeEJJV9E1fwdgEFNohxx8qoIIYIx3GzDUA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738536373; c=relaxed/simple;
	bh=AgL8Vh4o01HqqDUJ+cWv0Odl6D4wHVO6sMsIgzd0wkE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=M93yiENf3NJKKMq5cBcoPjaGM9RFqtgIZxoihr69A+RrYtcE4yhTyOz32KQoMtwhAEkmgX+TSys5TAmSMOaXz4sZQMypC4jYkti/8JGg4mgXpimh6ea/J9jyJLJsqHW2GPHXQGkKLJts9rf5jGgyJnvJl5K2PoOD3qnnyOS4uys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=fuN52ii/; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="fuN52ii/"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso25596435e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 14:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1738536369; x=1739141169; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YMxp+N8AKPgVkLLt+tNd5Z5gGgVjKJ6HI6C9QfMvPDY=;
        b=fuN52ii/hTOy3qleFmXOZlsz7f5wuimSH6LILVnaC6e1QCacxvOPpY++PV6hls7bLk
         Q32pjDUBgMdoW/Pr8hqLHyHVFhBO7co62VBmpxuvLULCK8XRV6Y/ijrB5NnI5eTLX1hu
         5MWFVXJE0meVofQLwE4e3o2D3rGrWqKOIWB0+h+DV0jFMGvaVeAs1pCf9YcNJj4xB5pp
         W4kpnBgEns5tslGl6WLlwZwKh/kDNoJ3CLszjCKVjgz+LDyXmvA/v3ayCVWNs33KukfA
         0PTovCGWx2H1v8//xLB70WqV7pqNzq2386ORQRIX9mkSB/iaNDWmxis6hBehMRrDw0FF
         pUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738536369; x=1739141169;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YMxp+N8AKPgVkLLt+tNd5Z5gGgVjKJ6HI6C9QfMvPDY=;
        b=BxEymQs0fXkp9cLS1cKL8FLWJVaDg9Z2tu4ncvFpBiKIjgc7rNMCvOot1Vlo9wTT5x
         UXjOsSHNf8j9eOEprPhxpi4IpA5XezlNmgSHZZW/EBIvDC3YA9UWePXfH9ATeqbQNQZV
         Tz1Nv63DCxq2bBVCl7dGt4YDlVXRvijb0nmBSRXSo9G3JhnJQDesl/q8XmP3++W27TA3
         L2R9skGHKMYblwwX6PAkMsVmiXKQq4zPMH/4bWxG5/i8hNSRfX5j8kocgGfcNJn92iFx
         9Li3/gVJsWdreI2L8R0zpHLwoA1tLcYMf1FtEVz32v3dKrm4RedPBcdqP1EadJJyCHMg
         p0XQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+RuAEpjq9lnqv1l2Xygtl7/2eqwcn8Vrkbela+sD8HivzsC9g/H0dlja4uNeoNYgFasQAlhhWC25pZbo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn4dYF7ZbFU4Aw8fglYGHHA7P5ib1BlmArSeQwnN//jaEkSk/6
	1+tn7cHD2BDtbklP/KAzxYcR6kNC5GhNqOBVx3FBZWeqRkhhnuz08pKJtbtBoqpDx3S1WHEU45B
	H
X-Gm-Gg: ASbGncvv6D4uUwM1LmVISm4DQRC6pevx7K2qZLe8qArwAp3FtFB9HFk78+dnyMT5Aj+
	1vysCfQ1TD/RQHvlOKIABvUfQ7X+Lsa/Jzina5wrKdzSHlLTVwRUf/iyJrncjyneqxuwKgmxltB
	68Wd1cNjfSAdmvmPWKklb+Uoa9qn1r567e7QKfriWM1eAvkP5Tr+43qc8Te+Qr2rK7avwI561VK
	K8zpakP6FAmZ54gxHWsQeCSohDLlVnjyqp8Yo1NBnXGEVl9M4Jh/fPRbYDAGnLrK8hqbndgVCJV
	L11pC09sjp07q01+foHfG3ML7Jw=
X-Google-Smtp-Source: AGHT+IGcFZzU17tuXtMYl8AEybTSN0illAVTYf2xaoCzTK9YBwUnEwlsFBobc6i+n1sl9bjYkSI4Bw==
X-Received: by 2002:a05:600c:3d9b:b0:434:ff08:202b with SMTP id 5b1f17b1804b1-438dc3c360dmr159424395e9.12.1738536368984;
        Sun, 02 Feb 2025 14:46:08 -0800 (PST)
Received: from [100.64.0.4] ([2a02:a03f:6bc3:6b01:62c7:350e:556e:d0f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc80e61sm170849605e9.34.2025.02.02.14.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 14:46:08 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/2] Enable panel and GPU on Fairphone 5
Date: Sun, 02 Feb 2025 23:45:50 +0100
Message-Id: <20250202-fp5-display-v1-0-f52bf546e38f@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ71n2cC/x3MTQqAIBBA4avIrBvwBwm6SrQQHWsgTBSiEO+et
 PwW7zWoVJgqLKJBoZsrX2lATQL84dJOyGEYtNRWKm0wZouBaz7di7P15EnLYCjCKHKhyM9/W7f
 eP08/RqZdAAAA
X-Change-ID: 20250123-fp5-display-75cece20d3ef
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

Now since upstream DPU driver can use 1:1:1 DSC topology, we can finally
enable the panel and GPU on Fairphone 5.

Depends on https://lore.kernel.org/linux-arm-msm/20250122-dpu-111-topology-v2-1-505e95964af9@somainline.org/

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Konrad Dybcio (1):
      arm64: dts: qcom: qcm6490-fairphone-fp5: Enable the GPU

Luca Weiss (1):
      arm64: dts: qcom: qcm6490-fairphone-fp5: Enable display

 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 102 ++++++++++++++++++++-
 1 file changed, 97 insertions(+), 5 deletions(-)
---
base-commit: adff68376f7a6872be00d87720764b30f3ad1059
change-id: 20250123-fp5-display-75cece20d3ef

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

