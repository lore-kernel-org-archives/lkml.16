Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA0329B8D2
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842817; cv=none; b=CG21O+vkiUNS/HipSBw4+/DXnhBLYk6PiRRGh33Xz/X+UuVK8zn1Vh7T3kU/eu4bghY/T6WKvZoAu8H7YxT3gt1Qa54y/fnpEZJHqwoFMG3CzCAqg96phpUWqapAIDpOmAG79ZJmivskldnEqCxDijAQ+4XTQQoeTagkFcOml0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842817; c=relaxed/simple;
	bh=4sR5fPpma/GrOJli/eLiVTPPr/9TVkwqVfopkbkw2Yg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CW+v+Svt2lpGDXc5GkLHUXXiGEgWujFY+6i6pKO8u+aSibWuNbRGsWsumAeq2cZTCn3XDrxSUuQHJrz3onv5tNDTs5K+bbtsuHpdVZQ150gyW4uEREp9YzQjS48nOFVCEtXrtUoonjEPY/WfW/9U0zdC3cnzS72clFFVmUo2vRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=CandxWgS; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="CandxWgS"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-60c4521ae2cso1563477a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842814; x=1751447614; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ks2KgKPEFickNI0g8cLhP0+7PkHVzo+kxkQrWM9s9Jg=;
        b=CandxWgSEa4zslHSRGyTO6dsjXvFLFADwNBqczzvZvsMIgh29Buk46VcZDX8xeg0Ve
         SNE3FQcpEUor9G3ujm8oSMA/zk0ior8Gxc7scTMWmFh0J2TUp3rKu2vOzkVehQEwuOef
         9k/V43W9L/DbiPEMV4PRyKjJKXspK0OGtAiAWaXJ7PpZWga9vUVSi8mQN/hWAhyOMQuH
         QFBmHRXNiJ6LotIPeHhnp2BNHTbmX3WIAGYxsCTT3AAYIzrY+SPez1BcwDATg13wQN7o
         dnrlZvgpYqzOEyx3Oj3MbdHTkKDdC5+OcGOFSjDnN0bKO7sDqq6zuRJsRgn3nQ3S59xU
         Favw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842814; x=1751447614;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ks2KgKPEFickNI0g8cLhP0+7PkHVzo+kxkQrWM9s9Jg=;
        b=pa0GBGTljyTRuv+SgS7Gfn4kjtUtqzC7Qmg49r7wMNfB9G+dx5K8u+6wVPJ/h6SWY6
         /g5/3OMM4705jkw9fEGwbuMxtJ+FFyrmQjEwxYDf/U7At7oXskNkwNS1lTEOXjmkrDmZ
         YBDH8F0qyy5f5vWp5Qc8+jegl39Y2hjDyxpplqq8hnEZ8aegqVU0PSQYYIAPP0AAO9V3
         yd192u5cuQ/T5B6a2nXmDLykusCuUNWGov9CdGhUTdnzDBC4aKTC+r4P2q8opo33vOgc
         KbvwemY8eRTxMAiZexSCkiD1eL/voqOOLryCfV3eCSLi09BcuilQe84L/ObPbeJv4lcG
         n0Uw==
X-Forwarded-Encrypted: i=1; AJvYcCVXyZugyXnkjpVBv02N0I6YkTz+nl4/b1OCP/2a4+XuNrp3pSy6tELCG24LI6HJC8Ui+QyXvyB7lKgqNPs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSR/K9CM5V57jLrl4R/2njQ5DxgaivRHFn29pO3UymGG18nhz6
	2i/6FpuqDVQZcQnLvV4fkyQhFAUpFXxK3im7Gwm+/lECosTei1u/zQPMfWde+9nyT+E=
X-Gm-Gg: ASbGncunDnNd++XMF/rRvvZh6hx7Fq8WGLre0iyF/dLRSdXI9GBhkXL5kfLnU3fIwc1
	Jhaopx2FyHGWHVKCPe4lre0Hjo5FhcHYOwG7qytAkSPelVWBxWXva+D3oDQwjUqLZNcR4ezUeN+
	1L/URtW5gJoKW+FMXdJ6E8qvVcoeK/nr6CtlxLSlBm6Qv0fH5wg7z+9XQ0e9AoegBRRmKoWOJ+M
	Q12pJecddbXfLmc1eBGlcZ4LpHaLiS1ROxNQ9dPEjIbQUNMaNbdtneI+jiMJqq18VtwlOxpdE6s
	IVn9Xzik+XQXiTH75zwV80ka8/8RCMLGiN1cnn5/ppVzRGqjcVgkMB/nyvowePRitSr+PudEiMm
	hSFuYwlVfiDCa0gG5idBmy5BJvO17Wyhnn9CwZBdkN/o=
X-Google-Smtp-Source: AGHT+IG3W5RmwW0KXa53tzqdC7aGtVxDcyIrcDLyCjEyycANLI9U+Z+hJ/jXQi64INJPHjABBmW7Xw==
X-Received: by 2002:a17:907:7289:b0:ae0:35fb:5c83 with SMTP id a640c23a62f3a-ae0be9dc2c3mr227506966b.28.1750842813609;
        Wed, 25 Jun 2025 02:13:33 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541b719fsm1002786366b.128.2025.06.25.02.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:13:33 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/2] Add SM7635 RPMHPD power domains
Date: Wed, 25 Jun 2025 11:13:22 +0200
Message-Id: <20250625-sm7635-rpmhpd-v1-0-92d3cb32dd7e@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALK9W2gC/x3MQQqAIBBA0avIrBPM0KCrRItyppyFJgoRiHdPW
 r7F/xUKZaYCi6iQ6eHCd+wYBwHO7/EiydgNWmmjrFayhNlORuYUfEKJ7jDolLWONPQmZTr5/X/
 r1toHeTYSf18AAAA=
X-Change-ID: 20250620-sm7635-rpmhpd-dcb5dc066ce2
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842812; l=624;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=4sR5fPpma/GrOJli/eLiVTPPr/9TVkwqVfopkbkw2Yg=;
 b=8C1xOSR+fZgfOr54HLuwAQbc2nKk/SYaba1UqxJmSlY8b+huwWPWF6bTrhmee79uk+3mUFy71
 0mNZhETK1znDIZB43YvACA7IC+galriMioJlCwd9mFhd0P0OjvZYVvO
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add support for the rpmhpd power domains in the SM7635 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (2):
      dt-bindings: power: qcom,rpmpd: document the SM7635 RPMh Power Domains
      pmdomain: qcom: rpmhpd: Add SM7635 power domains

 .../devicetree/bindings/power/qcom,rpmpd.yaml         |  1 +
 drivers/pmdomain/qcom/rpmhpd.c                        | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250620-sm7635-rpmhpd-dcb5dc066ce2

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

