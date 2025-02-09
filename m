Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DE71494A6
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 13:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739108485; cv=none; b=Y0mSOsg9EEhGy5SHKYuO1LLrsIXzHcDptXyQDltJ0sef8SMNpbM9Xdx7fS/8+9YpGIrUAHCFKw+UOJ5b5EFQ4fBLFov8tN2zNdj9jWDwIM9vvO/ASfnSiiXCPRC8oKneCZdHoZDTSG4gN8SWZsf5CdzEkv8T8v+tGWTlBnQUyNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739108485; c=relaxed/simple;
	bh=rOoxO5KZEBh1SRJVTsZqOwcfE8PhI0LZsuKul2ItRP4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WslFW4BaQptZZAZX1qQqpp5uO8R89FCo6xdvoVJqF/1k7sGtHShxTMudP2hfrf+/vKZsEbTIer6h1e3m1Db5F4htAw2p70ZOHCORBwQq4WN0NV/O44TeY0JaqFK8K6UwMiARmsSGo4ijOupaS6h1b3FTF4E0o9lEAa4nWvdC1Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qu1YRNJ1; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qu1YRNJ1"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5450cf3ebc2so27334e87.2
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 05:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739108481; x=1739713281; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v0XUkknmm1Y+FD1G5vgfo0h0J5VjnUXt6d2f0Pk6IL8=;
        b=qu1YRNJ1xaqESJxjR+cC0P2/7lCKTCBf9Pw+rQCPJvsJY0t8HPEzUnec/k/TfkpPdE
         6yqO0T77agqUez5cK4VTnJhqvkZjCw14tXIddjZYe0xcfatGMgd/M0gfXq4BE6D4j+i9
         tlbpiUlN7tfWvcz4DQ0ZUOAQH1lFK5hhTHjsxAnIsajH+9l7kBnWoOf3n6k92IU7STC1
         7agwcTfKwIraLnHysFacefoEcqfT2AlbLNohFP7zzHxkMA5UrzqcbRt2Pk8XxL+jfAdu
         7WSDvcoH0oYhjAUnjmegt2ndOduB94YDPtMTwSZNCkHD3P+cjNTEBoqpvQaD/wjzjNXf
         KXfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739108481; x=1739713281;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v0XUkknmm1Y+FD1G5vgfo0h0J5VjnUXt6d2f0Pk6IL8=;
        b=cXF5HqMIax4xml7qTR3rt1cMHQqlAAL2LEyh0oAqf3w6gxLZUxvl2TVOTgcjtM+B9M
         ApI8F8sGep+eZkIR5sPgV59sY2PiXKz4kvuI6FdsjJXVig0nqbGouBv3ro2amQ33+zZM
         dDMT1OW4gGqbijLOZYXSyC5ZMt0xhxCYCSxajBLuXl0/iOQOmKMXUjAp5lkEOyxwbHOJ
         R1MIso8Qv5p1XQ6MHPX3+pv26fPRTiOGhF/cWW0PAX8kklJxdjmcSAozzODfbafWgTJs
         HoZsuf9deux6/WfgCb0s4ELheDlMnGhsOMA2uguGH01RtKlFroyzykR5y/13QypaZfuJ
         kSmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZ40gmlm/u4SObr8dDVrjhsXWONU+2fkgwvDAxkVOmrOb5oFMcXWUVWGQTsNZdckyyqha6PEhOgv3bX7s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1GBhAhhUhCiPJBHhDkVpSZZYFVYjC5bO2PbmpZyeJeVZ+KqHG
	7YsjRsedWJw9gUXy0LgfK2iz24MTEJrfkwpAmbc+dSgrZpICq7AV96pIVNHDpG8=
X-Gm-Gg: ASbGnct4yzmN4il7yYhqLKZ/H5Oy9lLhho6zxd+Kzrge1mZVmFRYwrqSrouVp6/BwZL
	CCcmUESrSaqPtcBviYT6inNG636Jc5JszJd5tFNr0byh0hjiwANpa3wy1VskGIwbVxbGBinRsS9
	YxRVyhSs1YQ388ykWtVrvJwM6iyPkG2EO+QwMsRXABs+1Rbl5OCfnREvHWpZU8e3r2lQd9aoEGH
	ZVB+BRWBRugvLle9MlXKCDapjN8EImj4H2Rpw3D56xGu/HQTC12io8xbnkDCa0OedvHifnMcb3s
	RXSDa3NIe1FhgGk753G3RkY=
X-Google-Smtp-Source: AGHT+IEVGIkfomEE/NNz3tc+YjlybN5PbVbSdbBT1FpoSLCs5jMkjRbEzg9IC54Jdc75JDpb8g6Hpw==
X-Received: by 2002:a05:6512:3b23:b0:545:646:7519 with SMTP id 2adb3069b0e04-5450646766emr1266904e87.0.1739108481449;
        Sun, 09 Feb 2025 05:41:21 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-545069b3f77sm362914e87.63.2025.02.09.05.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 05:41:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/3] drm/bridge: reuse DRM HDMI Audio helpers for
 DisplayPort bridges
Date: Sun, 09 Feb 2025 15:41:17 +0200
Message-Id: <20250209-dp-hdmi-audio-v2-0-16db6ebf22ff@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH2wqGcC/3XMQQ7CIBCF4as0s3YMkNa0rrxH0wXtQJlEoQElm
 oa7i927/F/yvh2SiWwSXJsdosmcOPga6tTA4rRfDTLVBiVUJ5S4IG3o6MGoX8QBZUeDpdnM82C
 hfrZoLL8Pb5xqO07PED8Hn+Vv/SdliQJ7rWWr+0VQS7c7ex3DOcQVplLKF78hd2irAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2010;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=rOoxO5KZEBh1SRJVTsZqOwcfE8PhI0LZsuKul2ItRP4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqLB/Kt4zd8O2+QTjDa5bUCPgmEutz9364E0Ly
 WzQxeo6ysCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6iwfwAKCRCLPIo+Aiko
 1dCfCACuprmMTFqony4w+ZrdzpHn6UsWG0/tGoIdKoQ7BaFcluPCYnvcvPE11sGQpbbRiYreyVg
 fDDSoJO/H6YKQFP6+99WnhyF7ogwWTyuqpYLcpLIXEYhLhd2tOcGEKmi0EjvjZlqZkD/0QIBHFA
 wATBq7cuMfgsNGav50RzggUDmzfzyncXy0FGKQv4g/jC7mxDvwC4NrHPD+zjaC48gNZEDeM9YmV
 jcKk8YRbrQtVSDyAtoPUWl7vNlE3mno+fHsKas8/4GZDPgCJ7JIix9/6hzZ0LxkW/TEZwgTVSs0
 FK5VrYd6XB17yBEO5+3IpYFWb2OQmhaVk23YHCFpvcoAl99V
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
Changes in v2:
- Added drm_connector_attach_dp_subconnector_property() patches
- Link to v1: https://lore.kernel.org/r/20250206-dp-hdmi-audio-v1-0-8aa14a8c0d4d@linaro.org

---
Dmitry Baryshkov (3):
      drm/display: bridge-connector: add DisplayPort bridges
      drm/display: bridge_connector: add DisplayPort subconnector property
      drm/msm/dp: reuse generic HDMI codec implementation

 drivers/gpu/drm/display/drm_bridge_connector.c |  68 ++++++++++---
 drivers/gpu/drm/msm/Kconfig                    |   1 +
 drivers/gpu/drm/msm/dp/dp_audio.c              | 131 +++----------------------
 drivers/gpu/drm/msm/dp/dp_audio.h              |  27 ++---
 drivers/gpu/drm/msm/dp/dp_display.c            |  31 ++----
 drivers/gpu/drm/msm/dp/dp_display.h            |   6 --
 drivers/gpu/drm/msm/dp/dp_drm.c                |  11 ++-
 include/drm/drm_bridge.h                       |  14 ++-
 8 files changed, 101 insertions(+), 188 deletions(-)
---
base-commit: ed58d103e6da15a442ff87567898768dc3a66987
change-id: 20250206-dp-hdmi-audio-15d9fdbebb9f

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

