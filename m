Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A165429AB1B
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842882; cv=none; b=kASnIP0RK9IeB8soAhy/ZkU6edsXUEDw90vNyQb4puD22PCrlFEN0WPBTfAf+xFne4YZPsz41zAjwLBdHvdYw1ru/ID0csJQ63GO1xPqvckybWOs2EnmE5siCt0aJlLANI0EUZBT2Bz3lWLtc8UmLglheFCzkv0RIvIQ7McX9RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842882; c=relaxed/simple;
	bh=PAGDNepLOywQBabUDSRzPENpMzvIh8vhIPwgCFVMPTE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XZoXL2muRrwLNdun7qt41qCrG2zMX9f/T4x/MhgcE3396bkGYfr0A+UM1ZK1CawO1HW3e8q1hreEAkfdETsfsBMkTCJsTB/gOw8wO/Q0Gj9IC4Zc3M4dJ0pKoYNYC6XLxOpcnLG24/yDZbbg2vAWk/20u+3E6cKiw3DOhGDkKZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=viGbI74M; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="viGbI74M"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-adeaa4f3d07so1194847066b.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842879; x=1751447679; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tNPdorLxClaT/uQLIG+PJ7OfFR9MMk+m2oDiINzPpBY=;
        b=viGbI74MkQ4mBIlVJVUITiIYtPdofzw6+SzUrQurZ1/Ds/YVNC82s8VXaalXILQOl3
         LbkGtBcMOcqKlLL0Xj25tCa8AomWs7GqGTG4t/ffUVJ2sbEI+Pmwfeo8s74ykq1mxTQn
         IAgietsITqYemsdRkokbmq2N0jXjDuS6Clu5qDnCqOKhM5oqeFU+E/jfSytxQBwxYfEm
         4nTb9xPf+8Y5zcrUaiOkrLfwyGuv/F3Q6LcoZoDKL3vEwLKLLz5sirQkS7nBZytYRR9y
         VJeFcSU2uLwswC6HFyqDO0jKXTpicJIjKrafRojewK0z6TzoJQaM8oGYSzoTTZ0d9Xa+
         /RdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842879; x=1751447679;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tNPdorLxClaT/uQLIG+PJ7OfFR9MMk+m2oDiINzPpBY=;
        b=VvCdi4SQw0Nha+nTPR+uxjbM4TtFf7M1aNRqdGx0GZ4LhPlvc9yRRWPI4pCvJNLfHi
         ECOeoaMwQ0KC/Qlw6e1PPKfWES2Q7OpZKnVhtkm2wLLU2XRvX/ZsNZHzvwYdelr4Enfb
         DGshc1sWLSD4rBbnhzLlSWd6SYyIqrFKnNCMDxqbq2keuo6QgRbT0PtGC5f8FOx5Q0Rg
         xEu0yboVdqAY3lVfsmg3J/Sud0oFfYGfRlzgaUpdW5BuMwkPQgkjy+3NRcm7Sq+ka1KE
         KoVuMqx7CyKnac6UqcKF1lIdaQZHT5Ca6jnMdJTOhkFKWjELwodMsyycGcHwEqYNiWqC
         IuAg==
X-Forwarded-Encrypted: i=1; AJvYcCUyQMGVZ0oeDEAm6ng95ORw24oaMSx4uigf87iOrNDNMa1P6sl/En0FXYsRq4WiEZAMvBcoo7Oi5Y3coo4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuHxfigufo6i8BQPqrLriEhgYL0dNz1wDTZ5IymNs2e5JBZBZe
	8hQ1uJaaw5u+ftPtLXn3g9dvAPPLVDe58nN8xH/0mq9D73A4sUXhFridpZO1kcupifI=
X-Gm-Gg: ASbGncsciigT+GmTqnrJzmtIG2kQ0pPKcKJoFxqU9PtAKJHr50hO37SZGpJpykeUcQy
	Ek0rW1L/apnhcj7x+8ZEjY5Sps81FqzGXi19YDSxAf0Z/uOZyTz/oN+vJzut+p3XHes4N8vfBtT
	mHt+kW2tQEtCvuQz5dhixFzsqffIc/ppZl4ZRHnsInvLhIzW93jqYNcncJNEfBHIjIQWEAZK1tS
	MbKgOgRToUfHI5i+GHZMDxyBFiHE360DRC74U7CWmqR+k88x97GwIxgzfOHIiZn/REj6LX54IB3
	K3sp44YHo2ylgOqXreUnG0nvqXdaI60WS66oTI+ZF4jwMl3Amb0riXkABDj3Vd+Bn5HKnR8qdmd
	5TQMUgtUA4NyoXuomtawzp9fzNu4N8mn7
X-Google-Smtp-Source: AGHT+IHpq9unqR2oaBvwa38Bk0ZRvwuj5rdTKcuQ+rG7jUe/JThlIksCFQb3sLZOckPwpcJlB25wYg==
X-Received: by 2002:a17:907:d2dc:b0:ad8:959c:c565 with SMTP id a640c23a62f3a-ae0be7fdea7mr236805266b.6.1750842878906;
        Wed, 25 Jun 2025 02:14:38 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054083c95sm1021480166b.91.2025.06.25.02.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:14:38 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/4] Changes for the eUSB2 PHY on SM7635
Date: Wed, 25 Jun 2025 11:14:28 +0200
Message-Id: <20250625-sm7635-eusb-phy-v1-0-94d76e0667c1@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPS9W2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyMD3eJcczNjU93U0uIk3YKMSt0U46TEJDMTi+SUNEMloK6CotS0zAq
 widGxtbUAVRupiGEAAAA=
X-Change-ID: 20250620-sm7635-eusb-phy-d3bab648cdf1
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842877; l=875;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=PAGDNepLOywQBabUDSRzPENpMzvIh8vhIPwgCFVMPTE=;
 b=RIhv8EznDuMD7oLSF0eD0DTG+LFSs9onAwJO9X6ATkc4ve/pGpLEQM3tBajj27EkSJyGXiNRG
 gika5+0wZNRDRMnR7hBSfSIOi5tnmca0nZU59SyhOSKu6R+orpFTrxv
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the eUSB2 PHY on SM7635 and add some driver changes for it.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (4):
      dt-bindings: usb: qcom,snps-dwc3: Add SM7635 compatible
      dt-bindings: phy: qcom,snps-eusb2: document the SM7635 Synopsys eUSB2 PHY
      phy: qcom: phy-qcom-snps-eusb2: Add missing write from init sequence
      phy: qcom: phy-qcom-snps-eusb2: Add extra register write for SM7635

 Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml | 1 +
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml      | 3 +++
 drivers/phy/phy-snps-eusb2.c                                   | 9 +++++++++
 3 files changed, 13 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250620-sm7635-eusb-phy-d3bab648cdf1

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

