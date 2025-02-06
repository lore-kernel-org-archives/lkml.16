Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F031EA7F1
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 13:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738849876; cv=none; b=NDl3K7C5hI4hnHmP6P3kKJ9jKE5PH/BKWMAiC314SnldduYqyKdFf/qIebCb5U17xkXotVmSGHqXBWmIO9V1sbXRU1nsrMpDurTQg7VXjK69UoBwqDZfb4VCQz+r7EkdJmot21Y/VKKV5TOfcnIXeNnfaueHspZejM3fMnM5Tjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738849876; c=relaxed/simple;
	bh=jEfFPYjhhWYVQQFXyKASWQyErTdoY8Ap+ZCTd9eVCBE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rTwaDBNMoCGllaEhcS68XCgzSfDYQb57vjE2qbI0Ro9pRFgVlASxHUU1nV2N4wl6b1yvYlPD0VBLyhm1jSOHmuO+bgkry1P0FLZISVZhjCIYWtxSZtUBHgMIpK9BZaM8o9tenWBSvSjE4PcDvUYXyaebTQRyutz2Fql7kEo26nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UkAelZD/; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UkAelZD/"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3061f1e534bso9001301fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 05:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738849872; x=1739454672; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hlvRT/m0xJ3xAgqG1g5fsw9qNYmlNi8FJnlxC1TPJrQ=;
        b=UkAelZD/aJN9ZMJUsUPuJhIFVj0TRqecMFf7ESNgUk76Pi2BNTORl2OJvX55Aq/P6A
         Qgp0vi3ADSISzH3rXVT7U7sZNISgFFKp5+piPCPPrYTlcCgTIzlhjGcvvYPxfQBR1TpW
         537uRYPZafkhdSxpU4WD8E9Sy74dkPDVqGet6dyDhSbWbVOsZWsxQlp2tRpokDpyWkf2
         RytasquYnI5Wzus4nJRniQrxjwQ3EvuSPDp54fUC2yj4zmM2ecwnKkSZ3DB0EzTOI5jc
         iEfVHfbOTnAz0rgZ0RBKNGUEZBiklsyl4AnGiAchfWwdDm6mSiGfVBa5Cvai5Jr5LhpZ
         Wurg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738849872; x=1739454672;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hlvRT/m0xJ3xAgqG1g5fsw9qNYmlNi8FJnlxC1TPJrQ=;
        b=ewDil2C/uQ4S+JlNVkHCRdFlGgm0cIAGP2O6qbYcVn4gis2kXp0hDRZDdTwqEpgrKo
         NQdHu0QdGxDLipT5swN04rEkU9Z8DB7umI8vo9i5O6dY/RUG5azJlTWSuQ8EfzJTzCmu
         uBsdLbopTCY35cxEjD3aqjTmfwF8Z7/N1HX84da6uxQZEK8kIGiQVH2qtpad11MA+er2
         RHRnxld0d5nLmdNIHITvAMWHUR5O1zoY1BdAbR6LNesErhMhqX0ap6IbfbBhPh/b+Hs3
         wRCo53tXGqCcDPkDRFowdJPhkGmjNlPdQ2SvqVvG9qdoJ1KMoMv+oD8uj3CU355ikshC
         K0HA==
X-Forwarded-Encrypted: i=1; AJvYcCUhReZLLxWeuT3EL0Qn5zW02chgU6Lrjj7pOnMrYDdUFV3Ovh0pZseYaSXkeLf4+SeGnBUZSFOodHy+2D0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2aNKI0LgddGnFlatn1ZLrwx+d2/4BtKGKAXzO8tRsO64MtmSx
	2wYCZd7yYqwlKf2DcIdsITEHSyrVS1Fq+q2QCIGvDj5F59zSgS4B1N45AtvRoNo=
X-Gm-Gg: ASbGnctV5/D3zc/ChyMTlHU+pHeTyompkRhxM8FJ2ZBsBKxQsQSK4FhiLfwn7tMRpsF
	efTh40T6nuf2JcufAeKOFsvbwAbHO2EHjW0CXoy1vQdehmUStNsq3LO91806IgoWF36ZN1kaLs/
	rMZ5V1uPi0rdEmeNA5WBk51z0UhEDxHl9Nwdmr1vmYN3ZYm6OQ7uplsB4iX6lLqYgUkK5tVX5zQ
	WrpfVejyJwuhRN6UZYi008dGn3Q7hmKD0phlqTX4q/N3hKA7Sqgyqb6aw/ekVwMW6A+41xTtmer
	jqLYaoqClZKJrkvcjHx0OK4=
X-Google-Smtp-Source: AGHT+IFSoxJ0P0T7H5ffUZDnHS6utLPPhqQ0Xj+ZAE/hrtS9g7mDuzJ3rLQXiReVNulKoeE9NZoXiw==
X-Received: by 2002:a2e:a988:0:b0:307:4fda:c544 with SMTP id 38308e7fff4ca-307cf312227mr26755631fa.17.1738849872268;
        Thu, 06 Feb 2025 05:51:12 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de2da11fsm1318521fa.92.2025.02.06.05.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 05:51:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/2] drm/bridge: reuse DRM HDMI Audio helpers for
 DisplayPort bridges
Date: Thu, 06 Feb 2025 15:51:05 +0200
Message-Id: <20250206-dp-hdmi-audio-v1-0-8aa14a8c0d4d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEm+pGcC/x3MQQqAIBBA0avErBtQocCuEi20GXMWWShFEN49a
 fkW/79QOAsXmLoXMt9S5EgNuu9gjS5tjELNYJQZlFEj0omRdkF3kRyoB7KBPHtvA7TmzBzk+X/
 zUusHO3u32V8AAAA=
X-Change-ID: 20250206-dp-hdmi-audio-15d9fdbebb9f
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Hermes Wu <Hermes.wu@ite.com.tw>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1751;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=jEfFPYjhhWYVQQFXyKASWQyErTdoY8Ap+ZCTd9eVCBE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnpL5N8UxuLafoSi1beUZMoklAK0KI+apFqYcXK
 zIpR+AMEJeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6S+TQAKCRCLPIo+Aiko
 1R90CACi7Ti+Y/t8thf8VuDZcV6zf2WGND598IR0eR6rFaQ0KTGdYwEqLjnjAGefiGxMz85EkOC
 IMghfm08/ysXE3DHac6U5HNPlQy0dpcn+fvRmjyVel7Lmt65gInbi0Wxz8vVdzmBYO6LqCZuWqU
 tDJhwMhmsDoCGFLXH7kBEZHRy4aoYFBw77aIAuSNRjuIm/nOBA1fEWNu25c56E+5n+z+HJRVl9F
 rGJaHzmMRSOS7rdOV7XzPAeVjojxZdKuu/MOu6P16S18LcjidgWRO+oHSANTm6C3uSK8iSKsiP6
 uJO2TE3WnRU3AyrTmgBAGLDE3BQZYGBtSSq2/hyvu6trgqcl
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

A lot of DisplayPort bridges use HDMI Codec in order to provide audio
support. Present DRM HDMI Audio support has been written with the HDMI
and in particular DRM HDMI Connector framework support, however those
audio helpers can be easily reused for DisplayPort drivers too.

Patches by Hermes Wu that targeted implementing HDMI Audio support in
the iTE IT6506 driver pointed out the necessity of allowing one to use
generic audio helpers for DisplayPort drivers, as otherwise each driver
has to manually (and correctly) implement the get_eld() and plugged_cb
support.

Implement necessary integration in drm_bridge_connector and provide an
example implementation in the msm/dp driver.

The plan is to land core parts via the drm-misc-next tree and msm patch
via the msm-next tree.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (2):
      drm/display: bridge-connector: add DisplayPort bridges
      drm/msm/dp: reuse generic HDMI codec implementation

 drivers/gpu/drm/display/drm_bridge_connector.c |  66 ++++++++++---
 drivers/gpu/drm/msm/Kconfig                    |   1 +
 drivers/gpu/drm/msm/dp/dp_audio.c              | 131 +++----------------------
 drivers/gpu/drm/msm/dp/dp_audio.h              |  27 ++---
 drivers/gpu/drm/msm/dp/dp_display.c            |  28 +-----
 drivers/gpu/drm/msm/dp/dp_display.h            |   6 --
 drivers/gpu/drm/msm/dp/dp_drm.c                |   8 ++
 include/drm/drm_bridge.h                       |  14 ++-
 8 files changed, 96 insertions(+), 185 deletions(-)
---
base-commit: 93c7dd1b39444ebd5a6a98e56a363d7a4e646775
change-id: 20250206-dp-hdmi-audio-15d9fdbebb9f

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

