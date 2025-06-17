Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786952DBF63;
	Tue, 17 Jun 2025 14:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750171977; cv=none; b=rGc/hFzi4vg/trkxYedKkenVTENm1Nl444/evN53J0HTfKLl0X7/4AtIAgQQA18wHMd0AN4bB15tuIDHbEe9IxI2ym0YoAb1DmfN+AjEJ1yAMv0/I7plci3fxzyqySArLMYAeSm540XbnvI8xGRvTD3Cmu+0pvgwdl+zcH7yk9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750171977; c=relaxed/simple;
	bh=RsSnc8fq55PDetMqXaYJHXP75tx6bTmlZEkJDoQ45sw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OIgHJmxgv4+sFbtoiQtBHJzIydGMgxxyXETBCpz1sULpDXO5IzTKK20CGSwN/l87t9HNVl5fCeO2oZsNNUptb9C7Zb9yulPCZZy14D4TSNN1+JSJW3Z3fU8z3LpHXd2MqFckt9CQRgizS7AH+SmzAFK9BSBckEMwPYBOCJ/wCDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KkbxwjPl; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KkbxwjPl"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ade326e366dso1079293166b.3;
        Tue, 17 Jun 2025 07:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750171974; x=1750776774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5puOQiTV+dMcJIN5xrLM/KYjgCTI9s0l+XPT4hDsmLc=;
        b=KkbxwjPlycws0SPwjl7BGoL0uiJEO1w6CWbtk9HqemiqXqK5wysjLY5PTNPdpJHcQ0
         oqce4yRkO/31vk5lIXnSrEbzf86vq+zYdIMpSQX7OLrWKsdHzwQW+HkPUAQltss2n87V
         IWl2ntCKgb9JSWU29EpK90cVLU2VggpvnB7xlWB4tmBVt7/9WD4sXVgsS4k/kyJnxnwV
         ySM+YOUJfsc/DZmFAKGy1w3URGJwgyqZIrW5FjyAVeK0VpQokrVf7OVE7rXVI+VZRpGW
         i7qvYGkhGeqBRmlUF5xrVIRMpWVc5RsaDpDtu4P0B6/26Lb3opSat5k6sneoqXjORWWH
         YbuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750171974; x=1750776774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5puOQiTV+dMcJIN5xrLM/KYjgCTI9s0l+XPT4hDsmLc=;
        b=AaoI8tngYfs6n+NwU/0fuNTXbJ1WSdZY8ElPgyGR1BSI80kSzi6pqwseK4PX/RvwRH
         nK7cx017YhopkW2ISksIkP5rbgGTUzBrVettiDGxaIBQPOkt4EZqKg8YJyJQnequndFr
         fd+jHBXOSxNR9BIdjyduNwO0xpcJhD7gPDf1VI6Q+/DQgB8qhi0vglLAERUJWziDGETW
         AepF3WIBTvHV7onSD2D2QoDJydLA/8KaEQjDJ7navUU84nfONcnkLFoNZc5k89vDOH+R
         GK8ksoep0HeQTG7iwClMzExK1S+3qHrg3t2nd1r2QJHVktrCxtH/VA1Afk/U8DPtfKJR
         nWiA==
X-Forwarded-Encrypted: i=1; AJvYcCWOzt/TXZqj5wcm/SEeh2nxaq/8tzur/MNaArnih3vEtO5PCM5CEFO3sr+W3r9vq+hVFYXe+cwLp8/RISfe@vger.kernel.org, AJvYcCX1CtXFAWPuXNlxDV0fpEC5YE3ALuup8EXt5caRgJdPLP61S8608a6mhllT4i3dvCX971vEihnRicsw@vger.kernel.org
X-Gm-Message-State: AOJu0YxIHJSIOl25IHQ7AY/uAQ/jBM30/nEtUuJ6+Y3Ycm2Sg8QT51kS
	VK5DhPH47PJT9+jWn0n852EnwTK1JRepF59HGqFwD2gnZnC2KTrcGMly
X-Gm-Gg: ASbGncsSS7CJFcYRprcLZBUrct9JeNfL17qnNKKUlUMIo47+5yxAByvedTiUiig9lje
	SllOQgpQDJQEAbJxuiIoMWnl45XCNO2mBAdZWwYc+dHhLJgJJsF2bLOAUugjIH2TV2TXoSYrzBR
	OU0vesEo1pbr7gHPXoYe++2/f5iBq2SDrYsOqcqtGxSL3ceDpRLiydpsNzpBnRlfz+hd09wLLCo
	ARtAlCIJZJZLIqHZbZ04Eghsq7r/bjdxVGFPpFm0eheLYGN7P6vTs6k3QauohOp2R/lhFzlK62d
	vie7bGchfnQ3e5zFYZOjg13Fk3qD8Jkirkk421X9Ria5V6xhhspC0V0UpYIQL1u82R43iL4/JC1
	spyXKULbkwVUyBdAKSSC+WRQ=
X-Google-Smtp-Source: AGHT+IH772Vr7ziQrhMcxd6rpBnuGlcNRLhAme87+SagE+LcRuwRz2XSrdK5bdCJnsIm5faeH4Mv+Q==
X-Received: by 2002:a17:907:72c4:b0:ad2:5499:7599 with SMTP id a640c23a62f3a-adfad320f66mr1474816166b.18.1750171973381;
        Tue, 17 Jun 2025 07:52:53 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec8153573sm869775666b.21.2025.06.17.07.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:52:53 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: imx8qm(qxp)-mek: support the wm8962 codec
Date: Tue, 17 Jun 2025 10:52:18 -0400
Message-Id: <20250617145220.1131165-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

This series adds DT support for the WM8962 codec found on the i.MX8QM MEK
RevD and i.MX8QXP WCPU MEK boards. The WM8962 codec comes as a replacement
for the WM8960 codec found on the i.MX8QM MEK and i.MX8QXP MEK boards.

Laurentiu Mihalcea (2):
  arm64: dts: imx8qxp-mek: support wcpu board's wm8962 codec
  arm64: dts: imx8qm-mek: support revd board's wm8962 codec

 arch/arm64/boot/dts/freescale/imx8qm-mek.dts  | 101 +++++++++++++----
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 103 ++++++++++++++----
 2 files changed, 161 insertions(+), 43 deletions(-)

-- 
2.34.1

