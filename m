Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7142B1FAC29
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 09:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746611025; cv=none; b=s/GZyL4CUWDjc4+8Aph+4MtS3ZQBs1z7uzrXPfEnOKkvkjgk4C7t54Nn9j06L9MZA5dTfwX5SbiYYqaLilpxEPIROU0E74mbkFR4+1jIT7fGnwVGEPDSh6d0AzI0dDVI/kkJuJSd2bCBcYjSRgiCIWH8qcMc3wD2WwXJ7EKA4ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746611025; c=relaxed/simple;
	bh=VAw4LvKHXvijiJBA747ZYCqb44eYKH6QLm7/zgf83Wc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RWPQxxeH2lih1Qm3iWDosPAOpS/K0BipZYC7vXbuZryZuRQ9bolBvepUREGVCrXKunIFZsab/GL/XzVvxyDAuGLmbMoY49zwnHOnQzhCmQxL1QxwJDQCt6vQXe7AdtM15TfjSPQVabejmoekxyHYXgFZWOVvy/v7HfzvffTfke0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UFc2Z2+5; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UFc2Z2+5"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso4769745e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 02:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746611022; x=1747215822; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L9NPb1ubbCYKF9SGt/95PQ+zvu0nmCRl9cb2P0c699U=;
        b=UFc2Z2+5JVKuWxD+G4MGsgwWkG8dxJK4S7wfxryTI5aYO97iURYaL1orC37pMFdLmK
         0tGs+iZkB25asQb25PIeSCXFEBdHMEMAj0Qx3nQ1I20hU1WoUbggrB/kBTmNZt4MyR0m
         00NJmw2fHeCFrjcgcyU3I4nB+oCbn9mH/bMEcuSQ7Qz/7UEO9q+VDPGFCRP4lXg+dYkU
         SvFcoDClaiuttgbGDEwvXt6HhfsLnrXp1yJzbkdq/7diYawIbOC9Kk1BQrb655yTWHa+
         2PppV6KCBScXI7ocdnRqS5QlcAMu43IsV+iUOLaOPFeEMRmEMKW3+b7JiZ7FuF8QVe7M
         jM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746611022; x=1747215822;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L9NPb1ubbCYKF9SGt/95PQ+zvu0nmCRl9cb2P0c699U=;
        b=ebD6n2P5Jn1dCxG2yCI1SPjae6ot1oJQtKz7XFFBMsvY5lRH27xUGBewbhN3ozvubs
         Q+TUWUlU2Us1mjgsqtuZPL2dJKhUI9z9GX4A/FI33zRVzlZzDqxPoTDLxCDRred4SO32
         +kXnW0pwgtedvaiBZ1fAs9WQRFvDTdyGJVr+p/Z+RoIQHTjHqLOr25cPsK4DCuVcZ/yC
         s89inOC+kHwoBbAYlUqOrotfGH95i5jOvQEM6ocZrhM3zENlxF+xjoq8kqZg90LeU8jE
         kTUtg9f+UzUbXXp8E6NrBKqhzXw94JSAOC/lSYWzQpYmVEQgkLGM8uUCLyxhjqaVvjs7
         oNVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZ6cnxcFaxw+G0o+Sy/YS9OFCKQCgdNLOJsodGa4SZEpZAWxdko55BytNTj2M1WmSbyIdx7UQjUNWLj48=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKI6j3fA02e+7p/qmgXEx+JXf7PpjxQV907F8dJHxl7KyOmeqq
	dJDdT2DwXCQOZ3W+vZ7lUVPXXAHYFu5vTdGA7QEkqQ+wO2w/e2lHwhYJsu4XCIk=
X-Gm-Gg: ASbGnctURcx17KQu3HlB84EdnxrGXqmLrH/hNGKT7g2sSxGfSYhK4fuctK9tW/t/7wW
	zqqTrXHAkxcNKr8WNsilx20oAIwFaWIBqdvXEwykcvD5Oysu3pdGMHShxAho6L64TnaP8xVnnri
	c3mZ9y7vtZpeZQWYHPxw79qkrKh86wHRT1FrMv9g8UdUA9UdizNgmd2FPHX9a93I0Etw+LVYwOJ
	Gxv36sL2uWK+IVvONfD3DKJHaMxpdaRcCJE0mcyErwYBzBVZ3WeFnvkqv4/PnyvHRyBUJRvN191
	nXHUZD+poRKetgLTtbmRCpvzYXWqqtaQvOb7syJCV1UMOfkx045Gm7sGQi1Fdg==
X-Google-Smtp-Source: AGHT+IEV2rqMcvfZh9wTygpv0mKHsKvPqg585NNDNe9+GO4gszC9YjKibaKM67xkRPHBeTzlESoR2g==
X-Received: by 2002:a05:600c:4313:b0:441:bbe5:f562 with SMTP id 5b1f17b1804b1-441d3a813b6mr18131525e9.16.1746611021700;
        Wed, 07 May 2025 02:43:41 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441d434670csm25360095e9.15.2025.05.07.02.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 02:43:41 -0700 (PDT)
From: neil.armstrong@linaro.org
Subject: [PATCH 0/2] panel: visionox-rm69299: support the variant found in
 the SHIFT6mq
Date: Wed, 07 May 2025 11:43:37 +0200
Message-Id: <20250507-topic-misc-shift6-panel-v1-0-64e8e98ff285@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEkrG2gC/x3MQQqAIBBA0avErBtQyYquEi3MphooEyciiO6et
 HyL/x8QSkwCXfFAoouFj5ChywL86sJCyFM2GGWssqrB84jscWfxKCvPZ43RBdpQj6o11rdVU2v
 IdUw08/2f++F9P1hcgzZpAAAA
X-Change-ID: 20250507-topic-misc-shift6-panel-1b0825c84761
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Casey Connolly <casey.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Caleb Connolly <caleb@connolly.tech>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=861;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=VAw4LvKHXvijiJBA747ZYCqb44eYKH6QLm7/zgf83Wc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoGytLP7ZsXCLnAU7ck672LmJ0r8Vso2SiYY7gYl81
 L5SQzzqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaBsrSwAKCRB33NvayMhJ0bhkEA
 Cz3e6I7dqaLfzDwySsO8D1JhWqLrItxqTXugkjYmruyJWde2JDWIxkcuhOULI1PNdhpveWJgeqkYTB
 aWrOQFx+5VD5BiYJLRNDk0SKYSgXPjYfLv07x2nKVk0jDGmVXEn/4/oGtx24xUG0/3ILiFmfyd2dvE
 3wzwL/xt93syZlkCM+pDOxvyjq1CqKaNMZsHSwfLu9V0+Vvufb0QorApkmmcW7r2BYknEqeu3qT4il
 fvL6AYz3MmlOPxcGb07jHOJFWk/KWur7cBaEUdIVWVqzMbf9dx0oe/z2ONyu4NbxMDXiLCMI/aFZZI
 eFraIn2MdgCHUJy/0bKlZw2wdeegZYD+qFAjuu2oczIcLCD4UVjEyrCfJtL7Hw8elNUbcdTAYkK8IN
 jCHhSlFmzXhMuYMVl69q1PPU9eHLSeAhohFHJBIk21/BBD6H9ZAk22arACBt9eiuxL/tfbFqGIxpsV
 fGHExGBG0WngvhO/OFRmBEw1fZ0jq4f/JPezje0/vI4ZYZGRC9NPQeJ7rw4QKlJByuc1hkgcp1GrQu
 H4x/JseJTzU7pSnnvKpoUsbQViBWw7mlZPov+SX7UV6MsT4cp+0GYkaIV5N9wwBj60aHhJrF73A790
 z5wnpH7wOlMNs5bMWPBOUDeno5Y+qI+QIThQh24e2aZ/8BpvgUllCOlHGmPQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Re-spin of [1] and [2] to finally document and support this panel
variant.

[1] https://lore.kernel.org/all/20220123173650.290349-4-caleb@connolly.tech/
[2] https://lore.kernel.org/all/20220123173650.290349-5-caleb@connolly.tech/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Caleb Connolly (2):
      dt-bindings: display: visionox-rm69299: document new compatible string
      drm/panel: visionox-rm69299: support the variant found in the SHIFT6mq

 .../bindings/display/panel/visionox,rm69299.yaml   |   4 +-
 drivers/gpu/drm/panel/panel-visionox-rm69299.c     | 221 ++++++++++++++++++---
 2 files changed, 198 insertions(+), 27 deletions(-)
---
base-commit: 08710e696081d58163c8078e0e096be6d35c5fad
change-id: 20250507-topic-misc-shift6-panel-1b0825c84761

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

