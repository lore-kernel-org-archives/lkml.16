Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC7D2868BF
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842734; cv=none; b=W8JCnce7UYSK/2xYDJbnx4gdzWeqDbcGw8YN7tCM8jRfnHowm5O50CElaBLUFDtRF8TjABY8nF/0KhJ9fX1JQ/tBQS7q6i87DhokL2kexFXM8EtHOIauLkCcH21pperuCgoiZ51GyPDCxHr9QIbpyJ6Xusd+Z89D2QiDstFxnkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842734; c=relaxed/simple;
	bh=3rLRX3HD+/2dBnPJ5VcY6hbzIV3hWOdMQ6LQve48/v0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nPOTUAP+Yh99Jbo7CnsonW+4we3wjxkV9BdDq0gkrhnF91WuPntsRQ3TrLA37wTjjzqeq1kaI4eYiiElgyQn1GmOdMOLloGSebr3VqLjrWmWUS56xvIdEVFWZ6i4R2RSpUELjQSuIDSiXAxi6XfXBiOAGhOzJuHn+7XEQTp0MqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=jRV6u6PH; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="jRV6u6PH"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-acbb85ce788so248683266b.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842731; x=1751447531; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OU6dPNRfW5ncO3ZE9HOdNSZ+keWWv+mGS1rjrgmjGXI=;
        b=jRV6u6PHugZ3CpY/ErUm7pXEI5u44R3MxNoWSRiKsEdwVles5tnoSPaqUG7U9i3tvW
         1fBSxuBpVLknNHnOTK0PbQYD6udBbHpHGXdr5mTJ2bXhQ8RIXB85z+9dz6BhoO35OfFy
         RyndGUETJZkeqLIW5aFXvOwE98E7ADar2BVOkM4js/UrjgLVyApDKzLl8JwTCcvulzz3
         6pONGOgOypkFA2fIv+iLJTMcqxzkpBF7zhtLic0OdQbmXfWDI9Ee/sbKmDC28VIAuR4l
         UbtQvsIz8vylYXGwrxzDESs05nOw1G4P+Ap+KeZzcS3iO8R0zJY9OO6+rbCV3vziliKR
         4+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842731; x=1751447531;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OU6dPNRfW5ncO3ZE9HOdNSZ+keWWv+mGS1rjrgmjGXI=;
        b=ThipS52FgcKHWeU7XtRnIuwLO7tWwjA28Q+uPSzTbCaBMJp6JmPai5XcYE3dNlj3Zu
         FJBBZuYgpdEfKNDcFEIpgQ2C1RBHe46Kthuhk39AoLjC19TxB89fuWhe8U1E4pAAjjY4
         OLdc18pWQv8LDmYQcEif5ujQq3BqjkgVnhUb+dquwhSC3A86dqpsdlfamjYTh8ycNKC9
         zwAC6ADK7lS8oP4BRjGssVggdVBb5tKCrkC5Hyb80XSmWicdOweIPtUI9PwOa+gehNCK
         QIlJgBW0XqgHQN3uztHC2/qbm/OGCq1uvDi8lIFSuFDdHdt4JGj0P6NRH0AIeowPD/AW
         MHAw==
X-Forwarded-Encrypted: i=1; AJvYcCV+Jpu6naZnyRUZb+U1zi1XlOtVoGmmFgkr7VVuV4dB+fu00ANUaEdLwFKnIgmWDbiCU+M35+pEQL237zk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpGGbHACwJtBDLAk5P8VxAz8R4nppMShDCYGcPne1rkgkGJ+ge
	WoriXNdH52iVD1vawTN7uWBTLKzfAqzKT4BLQfikm+O/1Yx7E/E7J4e33HVRgX9BJxb8cBDgMki
	9/DQm
X-Gm-Gg: ASbGncvpSC+VFEhKBBL4i6sDfdNm96/Z7GSq6CeHm3gTBxO4AdF7A5YQO5TkUkY2w1F
	kYVZriKRamdDBm1TEB0xFNSvqrojfKZ2RSUw4dp4235B3Tmv4zkLk587JRRCkZgaAiwZWQBWrL8
	2+Dcce6jHKssxF6li/D+9K3ef/sWi0bi3pEMsTfhxOAhQDtEgJW8z/cD792uu3oFg6k2KMcq+/U
	D2rUo2tcmr/vmQFf6op99DkKG707SmwKLJ63ch6Cd9DzbRvZVz4zUnL/qiZSg5sSO4+l6ktz5j2
	rctpGY6046B78SWFtR8+j9BJAxNkq/euC9YQbg8soFOX49hB5dqwtMzx5IofOiIT99swUZJmHw/
	44F96vJTuEZT48WUn+wdJGs4HYErQlodh
X-Google-Smtp-Source: AGHT+IFEzb5lbk3K1+lIUPljZOLxKwp2Mr0rANsWiHgyk6VUfW/suAoRrgQe45mR9hXiAYd1pDszpg==
X-Received: by 2002:a17:906:7950:b0:ad5:2d77:7ca7 with SMTP id a640c23a62f3a-ae0be9fbf22mr232942066b.43.1750842730958;
        Wed, 25 Jun 2025 02:12:10 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0cab0ed04sm11076666b.135.2025.06.25.02.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:12:10 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/2] Add pinctrl driver for SM7635
Date: Wed, 25 Jun 2025 11:12:00 +0200
Message-Id: <20250625-sm7635-pinctrl-v1-0-ebfa9e886594@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGC9W2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyMD3eJcczNjU92CzLzkkqIcXcu0VOMUCzNLYxOzJCWgpoKi1LTMCrC
 B0bG1tQA6kYpdYAAAAA==
X-Change-ID: 20250620-sm7635-pinctrl-9fe3d869346b
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842730; l=737;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=3rLRX3HD+/2dBnPJ5VcY6hbzIV3hWOdMQ6LQve48/v0=;
 b=KzTL/Z/wD17NRYxyIrHXpQRPy8zNXoOYDCUaeDvp5VN57JpWxhNksgX6aQZmwOrPoKPeY2t3l
 LqJm7ikR6sRAWuBNm0KJLJUi0Bz0UxmeH6pF6k24fbzK17kWZufq8Pe
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document and add the pinctrl driver for the SM7635 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (2):
      dt-bindings: pinctrl: document the SM7635 Top Level Mode Multiplexer
      pinctrl: qcom: Add SM7635 pinctrl driver

 .../bindings/pinctrl/qcom,sm7635-tlmm.yaml         |  133 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |    8 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-sm7635.c              | 1340 ++++++++++++++++++++
 4 files changed, 1482 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250620-sm7635-pinctrl-9fe3d869346b

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

