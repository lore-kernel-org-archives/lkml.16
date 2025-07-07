Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489C328DEEE
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 10:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751883504; cv=none; b=s93UBlNCPGfOyQ35F9WZCdxz65ADEauuGyoRdqgx4YvWGzs0nPbzBUXLY/i4V98h8bQWwLqh9fJzC5QSzORK/t2AbEPWR3feZqNLHEuUEBn1tAPKiWxbWtCOG6CJAniogbZM9iq8U/TrZLxjwNLDw8oRU67S4z9cnzyqcbtY/sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751883504; c=relaxed/simple;
	bh=WJvLISuNX9SrkFFHrb70kxmDTwn1pDB/xgPN8Mqr0+w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=m+VvV3SFdXi7Nwz09GsK4Wyij7I5urhLiVZeAT15FLf6Yk8K3NsA1uHa+9NPPPxqZJRMsf4nVAiIQ/kHmG5iCQkI7xZp7tMdIo67pVd9tgQ2fibPnN+45Gmtj/qPhWwuNjV0Z9vRB3ZHE8DEAGY0+Nrmy72oygQ0LUeKCUFp26k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=xifFmMFY; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="xifFmMFY"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-608acb0a27fso3865914a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 03:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751883501; x=1752488301; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+bGVqtQ2koVGagAhcdjPHNXO3hocrQjyTn8SnwAtxlo=;
        b=xifFmMFY8FbsteONnjM7YqaTU5HZsz7PgfdkxiYrV7+UExgN/mkTs0M5apKcA8r0Mr
         yobkib3krqyHtaB8VKIFblg2ewwWtjlHAYUXqr83xEkq+iKlcsEtl1vngJ4S1DNpN0q9
         9T0jQYklXms+nlM1PKqYFHrFCtALIC3bn0SHAiuAIMD3Hd7rjOepowur7qUt1c1Jl57p
         alxPLC7bNyar66pfC4dmdhomLp2JCuG2VBKdlik02s4gySe9Edv0XmXk9vwSM3dmnnh9
         qFZM5UBkOdgKpKkliBIR1xSdECEPohE5jlPVoIFDyr/26nWUzu93ApMb7GbyHkJGPvPu
         DX4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751883501; x=1752488301;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+bGVqtQ2koVGagAhcdjPHNXO3hocrQjyTn8SnwAtxlo=;
        b=CUP/VCAptlPRF5WILDc9iiznySiF6rEn09BSAWDuaGFUUq8WFqCd+0ijIFhYVIbJ7G
         i2exlhFm46ebKpOAqmp+hlXpbzVR75wW0BOJypeH6cXkIYLNn8o9OB+3PUDmiOIZnC29
         xJYMlf+oaFU37SIMcrmasYQVpwd1i8MVL9BGqQvgbLK+UGJ/xmCDjkHIYnsSyeD9HhR3
         aG7ZDI8d9PYs9JxhtJSl5tkLPzlDWOogNqZgXLBe09/cCH/LN+qpT2NpJBQEmQDHgegN
         24YLl0sfTo+ZNIpzV7OafWyZa77BkXKNdccxWXMsvjmL+Q5AsOroMJtaq4BEHf1FmsxQ
         X1nw==
X-Forwarded-Encrypted: i=1; AJvYcCWQIXuTOxisddDS95pkuS3oKX2EiJVTb7aTED5AG9WmC1ylW19X5P63+HbGDf89RdgLf8CO8s7c7TmreW8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzco7U5mD2D2i9IPZ0H6CfOZzYyZTTVGDfFf8lljpn26AWn2Isa
	Na3jmDa0e9DGPJwKp3w0NNdGx8IjCpRYPR7JsNpI8fQouN9LMZ2znt48kD1i1L3KLT4=
X-Gm-Gg: ASbGncu+NuX5NTpdpINiXczBqpEhPW2txTmtQfbx9h6L8Nle46Fgwtj4kb87oKeO5QK
	+msDBIBke1j9/d/pG0Iwo9hTLAU2FC4EWi9wbWcYdhnt9d4GucuOPCP3iChKwqM8e2AGRN6e46y
	+FOPjZuJYkqGEWzjf9nb1fEQSRrkngbaUoX54F78Je0Wb5xbRJYvlApDJ6xbY/gmSim8TSqOUYw
	75mWKIsxxynDBk9BrftrQzKFi+xmhGL0yno1kUeSo+VeMpT0Ggbdsd9DLCfHlHCET3snuVUyTkL
	LCU7f02TGoNLMHErW1obZIUn3Y8Q9nzV35BQVpmz6hIJ38uQrJSTCsGk+AWA82qV/O4R1DbhmyK
	MWZp66rm85M4OdwK5ygoueE9CPiwprBmQ
X-Google-Smtp-Source: AGHT+IGmi2+AGzMy4YVxywbj63AxXZsKBp/UdN0n3w3kbYRL52C/ABqpGjaRqzOavMUNcyAAWeilCQ==
X-Received: by 2002:a17:907:86a0:b0:ae0:6a5a:4cd4 with SMTP id a640c23a62f3a-ae3fe457953mr1136586666b.12.1751883500499;
        Mon, 07 Jul 2025 03:18:20 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6bb1edfsm671711766b.180.2025.07.07.03.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 03:18:20 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/2] Add Milos RPMHPD power domains
Date: Mon, 07 Jul 2025 12:18:09 +0200
Message-Id: <20250707-sm7635-rpmhpd-v2-0-b4aa37acb065@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOGea2gC/13MQQrCMBCF4auUWRtJJyRFV95DumgzUzOLNiGRo
 pTe3Vhw4/J/8L4NCmfhAtdmg8yrFIlLDTw14MOwPFgJ1QbUaLVDrcrcOWNVTnNIpMiPlrx2zjN
 C/aTMk7wO797XDlKeMb8Pfm2/60+yf9LaKq0uSMaPBok6vk2D5BTiwmcfZ+j3ff8AkSx5Uq4AA
 AA=
X-Change-ID: 20250620-sm7635-rpmhpd-dcb5dc066ce2
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751883500; l=865;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=WJvLISuNX9SrkFFHrb70kxmDTwn1pDB/xgPN8Mqr0+w=;
 b=6QRyDuZmo/9ShGExVuji4u5RHu2Uq7ibmNyAVct7bykLWvF01kuh3Ce1RW4zAduFIhck7eXoR
 /c6I7AqtoR+ArQyhwHNnhhLq2cTT++xy/oxYe+Hb/Dse4syVlNgzEcG
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add support for the rpmhpd power domains in the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Rebrand SM7635 to Milos as requested: https://lore.kernel.org/linux-arm-msm/aGMI1Zv6D+K+vWZL@hu-bjorande-lv.qualcomm.com/
- Link to v1: https://lore.kernel.org/r/20250625-sm7635-rpmhpd-v1-0-92d3cb32dd7e@fairphone.com

---
Luca Weiss (2):
      dt-bindings: power: qcom,rpmpd: document the Milos RPMh Power Domains
      pmdomain: qcom: rpmhpd: Add Milos power domains

 .../devicetree/bindings/power/qcom,rpmpd.yaml         |  1 +
 drivers/pmdomain/qcom/rpmhpd.c                        | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250620-sm7635-rpmhpd-dcb5dc066ce2

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

