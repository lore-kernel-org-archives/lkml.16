Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0CF1F4612
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842938; cv=none; b=uMaHzzn72hlSZWmE06DD5s6Bot5VyY+gAsyn9ED3mhrUWkq7LkYq46mHhmhqd113MoDaBYhf2k21zcC0fTBgXyWrt/MpC+do/8gDTW0CzJHpftZEaAzMXpib0qddp5SrAJBsehfdFLaEJ0Xs7vI6e1hxdod/gZZbWyGg8p4CD8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842938; c=relaxed/simple;
	bh=aptb8l/VFgrDIa1taJf+qbnb7dxQMxO15lxBXFXp/JQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Fj482gLpmAMFpTEyhHW9zKOCk1Nq+X2yp2dSDV5fQJoGcRqK7787mvNa2GwqEYqqV/zQo2v+89ZYAfwyCdRnsrl1qh5FjHZSfF2eb0gvdI3s809s0cIJcgS42EuhiDqE8AHwhT9m1tyEzHK36WdKeYRHNdZ5/DJ2U++3HOeNISs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=AxIxFfLh; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="AxIxFfLh"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-60497d07279so13542022a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842934; x=1751447734; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kwIs8jHWHcWsZJaUPIAgXJgATIpQ2CP4tFBNJHO+0qA=;
        b=AxIxFfLhqaBVNcEsMovwdSjZyPBvfK4mC2R29uvsNkBiai3RXq2fXr92V3nhljB2d0
         fxHjzSxj3yyUEI5yoE+NiTRMQOeGuvFDfgkHxCvGz7u/XwMh8f/9MQMvw8yaTS+pgIWJ
         bHlggVjfkYe5U9L1y63d4mVImWOTAFU1QRKX3h7UGWEM92DBUG1Wz9eG1SNX7WsH2+zn
         hxJ++EApVvp4ci7jEaHad0cskF3b0SeOHSZ/7TU+de6j1wyJc7h09GN0iJqkk4ZpASKl
         K+he53uxZxrWs0OSb3AGKgik6N/NeqZOXxEOs/fu6t8+DHmXGlY/B7fLtRBgj09zsxl0
         ZjMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842934; x=1751447734;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kwIs8jHWHcWsZJaUPIAgXJgATIpQ2CP4tFBNJHO+0qA=;
        b=puoZagBKR/jHhl1Ddevk0pwJ6I53bBmw8KRcgScKMHAdH6bRCQsTC4kvFv3TGE398v
         Ki7iC/2WuDMfh66kwl/7rSUPho+xDCJ5rLEFOdRF2gS8fdXE8EGpRL2Ioh+NEScjXE0P
         +gTM9RpijW5pWrhOH0a4FO7sQF7Yg/FMwf9p2uZr3FSwkuBHPvhy+Cuzj5MO+A5SPTUo
         CsTU2h7MeilO+P2KERsH7aweGL7NW6mQvtVftci3O7FaYhbZvr94lVKIJGwfjimjnqub
         RDjERC+636Rz8u+yYUT9oTrzderhLyy76KcPu+6hNFYRcJVQTQ8mjpdp7ZGJEEAzfOZm
         24iA==
X-Forwarded-Encrypted: i=1; AJvYcCWGGWVg6maL9E70fGjZ5fMPOECXQsxEt7fTWcU+CFJJY1pwM4bJ3a9eJBT+gbG7W1FNDV73zmYxUZHPFI0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYn6bK5PT6zMjDkOfRHh7emt3S7+ePFPyuqkc2nNkWK45rV8tf
	+puB7+uCOveSBjxrPjEXE1vL1+P8QP7qmQq+9uctKy4k/epxlEQ/oF9TXOyMtKRg3vs=
X-Gm-Gg: ASbGncs8Q3lXe3KIt5f2lkV/OVFJTsxYh/xUbrWQeMinM1cKMaxL+vtqjx07L3TcE73
	to5GpSHYjtPlg085m8UXgLzuMDvGUmDMz6oJ/OkMvX9D6vhUirrGOHii10m0DAnmXvNuira/Gm8
	wpUEjfvkwiJeWkpztKF57XpMPAGc1aIy2nvy4wZF7XB0T0llObMj7yIH/QJw8zzZn4vGlqa/Wya
	R4pcsdWtFP4BIk7ApZitBqSm529y/C4cWb5wKajRT6aPnDjeXZrgTf0HpNVPQD64NJu6tardQNh
	a3P7TI5qixJ45tBmLsWkZp5ZyDjdUT00AxhXK0Ys7ELhL4nAfp7dJrnTLrI5vtoclJThgvFBYPz
	tWPB0qlg4eKZn8tIT/LaEMv98Gxjs7vH4
X-Google-Smtp-Source: AGHT+IGdOTsde/4tV04iLagGS0l3+RiQ3PMit+y3rciCndku3bSKKpPUaXUjkwk7D8PSr50rM3IKfA==
X-Received: by 2002:a17:906:6a26:b0:ade:7bd:e0ec with SMTP id a640c23a62f3a-ae0bea4419fmr221717566b.56.1750842934235;
        Wed, 25 Jun 2025 02:15:34 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0542035ddsm1029713266b.147.2025.06.25.02.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:15:33 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/3] Add support for remoteprocs on SM7635
Date: Wed, 25 Jun 2025 11:15:23 +0200
Message-Id: <20250625-sm7635-remoteprocs-v1-0-730d6b5171ee@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACu+W2gC/x3MSQqAMAxA0auUrC3UWutwFXHhEDULW0lEBPHuF
 pdv8f8Dgkwo0KoHGC8SiiEhzxRM2xBW1DQngzW2NN4aLXvli1Iz7vHEg+MkOnfNPHhnajfWkMK
 DcaH7n3b9+37qBYMiZAAAAA==
X-Change-ID: 20250620-sm7635-remoteprocs-149da64084b8
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842933; l=811;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=aptb8l/VFgrDIa1taJf+qbnb7dxQMxO15lxBXFXp/JQ=;
 b=a9gifMn5WegpIaJv+574eOya7An88NzqdXtU9kaGYzj5mbG3qtUnqUI/wRQkhkdYLwt0qNIFR
 qh7YOyHiIY6CGQXFQOfDeiD5G0/t7SwH2GleWVuywJ6vXhuPdVp5FGY
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the bindings and driver for the ADSP, CDSP, MPSS and WPSS on the
SM7635 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (3):
      dt-bindings: remoteproc: qcom,sm8350-pas: document SM7635 MPSS & WPSS
      dt-bindings: remoteproc: qcom,sm8550-pas: document SM7635 ADSP & CDSP
      remoteproc: qcom: pas: Add SM7635 remoteproc support

 .../bindings/remoteproc/qcom,sm8350-pas.yaml       | 19 +++++++++++
 .../bindings/remoteproc/qcom,sm8550-pas.yaml       | 37 ++++++++++++++++++++++
 drivers/remoteproc/qcom_q6v5_pas.c                 | 24 ++++++++++++++
 3 files changed, 80 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250620-sm7635-remoteprocs-149da64084b8

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

