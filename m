Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A5F274645
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 08:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746781188; cv=none; b=QHFwgYJ1395nPcIKNezYDxvPyCzEYu1FNBlL/k6ZsoNkz1dOF4VxmwgO8JP2Pudzgejm5YwNnwE0y4g1MEKLTiL1DkN3Ma3JnG8Wxq++ouzilEK1zjz7/je6hPoFq0aIPyaVS/DvFUTgp/y9HTmOhRArJYUmTviHgSWAgQJozXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746781188; c=relaxed/simple;
	bh=begbQC3Twc7/He76AAI8eeSeG2eczVhiBKL1kb6Uf2k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qEzl6iO/dUOgvM/nfrRqecrJIrHMI6kIecRfUojsU8z48TNGX+44JOKYab1SBMHRsQfI/TQ173ljjoVUGnp65MfUgXuR4W0kTh1laf1wF6+c3pBUUtF/IYpszl4wyRKrDqDG8XCjs7jtzbZdSPEqnKcjeey/HFT0+TL1auwDDFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gqxd1eP3; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gqxd1eP3"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so11775965e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 01:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746781184; x=1747385984; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gh/ALdVpxuaXhZUL5QFtMT28H7kuOgOyXFrKwM0kSAQ=;
        b=Gqxd1eP3FucpHR5D1Fm5jmjwGwtF1LwOxgY8na0qx2e1QMxKTEN3f4Nug/RbtCYEr9
         Or6dnV+ts86OK1Vu1t74lpVedzZZhUkSEWTIeR5/dW/S/bqrdTJ16LDiPOMKnfPPBTLQ
         ZbTf4wNj1dDqRjAKMOfuR3LHTmZ0+QoYrdWXMtkMu+xQCxzDR6uKTSQWVb8ModUmMp8j
         6KYlLj3eFcg+6QHbd1HDo75Guxz6JJMnVyDuP9xpSU0yO8zLDW2Q4LC34PtxJzMMP9BE
         7dQfxcsXxe0dVP3ybaMVCnuYsYkGNvsLVACAzFs7g8jXIvgjyE64pGpxofsl02ih7jS7
         oRsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746781184; x=1747385984;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gh/ALdVpxuaXhZUL5QFtMT28H7kuOgOyXFrKwM0kSAQ=;
        b=GFatfqBBu5uK5j5mAPGkw8Mll73zYyr9TIrmXThfQHjCoNzThttODkUTW0NqSOJ4cp
         LQNAt1qDpSBEVrweb/gie2DwyPmGXmv3urJj2TSURMX9I15O5RQRQTdWPAvz9HgO4Ndp
         zQJ2m6/Wr1Oa7HCXjGpeZWDE6e1+k4aXAacqKEx7F1tWOYqsklwSpZ0gcNpezng5hgNc
         WKz4h2AosvuE8QIi77OTnF+xkvRB2aqX957ahf3+MgeviNsBgQuQiFA0CVOfaj+6JJ3O
         HtlF8uVQ1y5CgUyHFmuH5xNIccxY+0W3U7QmfJjrOAM1b5QcpKi0I80RWAm80ECisdcZ
         YJfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQGWD4lvn6trhmatDAXD8igCy3I3jvcxvkE5kA3pMQzyVz7DRdqo0dzA4uiJAzkJt0X7Z/eJjxwl6kE0c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyM9ZnEf0P2KJrYwmpTTCZwnIZifTcSG76dSa2JMQb3IvhZvj0O
	btMpthC2p8/U+xzEd4uWeU/FJN4W7qq4wi+u8yDGb0RkyR+CI8AVZPCcyuSRq6g=
X-Gm-Gg: ASbGncsWJGojfANHz1RHo3M7VLZEWEAC64HLkVKIDvOc3bFwYYgaz4pNSdhmGuLY/3o
	RsjZfsoKujtf1Q6NbmnvhzCfUwLoKvyfLiEWtC/Qxguf9uqKVoPenYx9b/5cNy/rm5UT7EGN1zf
	sbaQlM5ji+e7lNYBXdJ/uR66q+GCAElZbCxSVJwI8iBSkKFyt0bviLlyyWQUt8vuRn6e1wOdjnh
	dAo8aUbzLOFRSjihG9k5KneBl4jtR75etVuvKORXvz44zUTF2VEJgi2015zechlyq5pNMrPlgTZ
	CRbvCTG76+qHEsBcI4cT5nPo7B7S3dAuXL6k6WxpxO5lu3Zm9MORJVEAw7qT3g==
X-Google-Smtp-Source: AGHT+IFFgVDU4MTbGBoj+CE2O5CNv1Tuh+orHpIHTEsK15CNC20+hPfSaqIvpAo8yJceBmfZVzw5/A==
X-Received: by 2002:a05:600c:1e02:b0:439:9737:675b with SMTP id 5b1f17b1804b1-442d6db8213mr21706195e9.7.1746781184525;
        Fri, 09 May 2025 01:59:44 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67df639sm22369115e9.13.2025.05.09.01.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 01:59:44 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/6] panel: visionox-rm69299: modernize & support the
 variant found in the SHIFT6mq
Date: Fri, 09 May 2025 10:59:38 +0200
Message-Id: <20250509-topic-misc-shift6-panel-v2-0-c2c2d52abd51@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPrDHWgC/4WNQQ7CIBBFr9LM2jFASouuvIfpAnEok1RooGk0T
 e8u9gIu30v++xsUykwFrs0GmVYunGIFdWrABRtHQn5WBiWUFlr0uKSZHb64OCyB/dLhbCNNKB/
 CKO1M23cS6nrO5Pl9lO9D5cBlSflzHK3yZ/83V4kCu5YMXYz3yujbxNHmdE55hGHf9y/bqJ6Kv
 wAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1553;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=begbQC3Twc7/He76AAI8eeSeG2eczVhiBKL1kb6Uf2k=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoHcP86ecbUVbY8XGHkeOFwBPL0TeGmWc+Z5Tjdhbs
 6uYaUG+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaB3D/AAKCRB33NvayMhJ0bmBD/
 0RaW9R/7cvEWGoMd84BC18u1Z7WkHKT5aTnR++KlVIG2iFejVA8J6T+HhTV/u9wW1DseMnEBUOfHUP
 fPdUhPyv/3hFJyhH9gJ0P9R1lpTc0oS/xhJm15NvQXMDpN7jZCQKq1xg+rsXTMZd73g5lNyERftpOH
 fBDTme8/rVPIZWpj8fYMQ8r0PbmxEzBBVhP1p0MiZYLVpe0EVxjsxYtzGzZJ5lQcWyrKyJ9pCgOCwO
 SBos9KMIZy2tIBSONNTF+3csyebot7cuMlPBiHeob774/p85o63kswYI8kRVkFXjDLtNbzyME+EW/I
 ixMjrZaO6muGUSlyP1JhQIViA8O2QNEAZubTQZV3Ltk4RXU8UVCIChBbGetz8mquPx9994CUaMh9i5
 rUXzeKuYwYwCptctvKpDKEO8/GsXeefxQMD6KO5wpeV+tsDBj3zV9Lictpj1kDF9Wf9tGWq4vtCzKr
 /BvUGITtdOnjK/lmlgS/3ixkseugjD3ityU/7/LKQUDuOjb3tBwS+RLQAZeKQ6rxHoBX602Z3BQZ9S
 K67+rhYc8aFDGGxB4nPcW2EH5Ymfs9Hc3lV7AJJrNC34Xs3YkE5uKy+360KBODAn2P4sHlE6EGQZsD
 AC8+xmG0ViqfEmX5jCcBxbNAH+P+egAssc0Pn/yv09My3yVUvUIeaKiIt8+g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Modernize the driver with panel_desc, _multi, const supplies and new panel
init with refcounting.

Re-spin of [1] and [2] to finally document and support this panel
variant.

[1] https://lore.kernel.org/all/20220123173650.290349-4-caleb@connolly.tech/
[2] https://lore.kernel.org/all/20220123173650.290349-5-caleb@connolly.tech/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Add panel_desc to support the variant
- Switch to _multi calls
- Switch to const supplies
- Switch to new panel alloc
- Fix shift panel init seq name
- Link to v1: https://lore.kernel.org/r/20250507-topic-misc-shift6-panel-v1-0-64e8e98ff285@linaro.org

---
Caleb Connolly (2):
      dt-bindings: display: visionox-rm69299: document new compatible string
      drm/panel: visionox-rm69299: support the variant found in the SHIFT6mq

Neil Armstrong (4):
      drm/panel: visionox-rm69299: add plumbing to support panel variants
      drm/panel: visionox-rm69299: switch to _multi variants
      drm/panel: visionox-rm69299: switch to devm_regulator_bulk_get_const()
      drm/panel: visionox-rm69299: switch to devm_drm_panel_alloc()

 .../bindings/display/panel/visionox,rm69299.yaml   |   4 +-
 drivers/gpu/drm/panel/panel-visionox-rm69299.c     | 253 +++++++++++++++------
 2 files changed, 189 insertions(+), 68 deletions(-)
---
base-commit: 08710e696081d58163c8078e0e096be6d35c5fad
change-id: 20250507-topic-misc-shift6-panel-1b0825c84761

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

