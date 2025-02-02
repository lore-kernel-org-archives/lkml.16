Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA1717C91
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 12:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738498039; cv=none; b=CgFrns2UET7ISUJVeynP7s7gGb4aAZbXFJsazBfO1MLohfwbrEtjjyHPDx/OBBZz42HBkkQtGzK8At4cGkFFX/oDnS1zYgf/bHZ/fbPLzG7m9v0d2/sD4nCGrJEF+FwNNPx1PNzGiYt76LkJlubqvTI/b4gbBUXntLHvOtwIBZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738498039; c=relaxed/simple;
	bh=+ddOHAChZI09nxOE28d6g8J7A1xlEBUGNnuTAJPfFjg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ILCrLtInRMjoy5UHHZoblBoHTPFd2AiN+pcCCV6H2dUBt5iR8Oxi3W4052u+5qa5V0iqAJQR6Hw56lF9sgUwD7XOElc3W4FQdvf1Ma4SKt7gvvFekK6KD1NoCMKH8lU/vyepFT4xwIgcvsIlP2+pyemEVGkunC2cTA5mJFs9Z54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HrOp7LkN; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HrOp7LkN"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-543e49a10f5so3623537e87.1
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 04:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738498036; x=1739102836; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bpa6DswmTEpKbgEQQSdAsXNGWXb6aM2f9Q6VU1SY1iA=;
        b=HrOp7LkNI934+Kbdc7TuO6dffjyjVNuGQPGxSj1lqedIpWiuIItDHlRQYD0yJ2kARt
         y/y8mhmACS4wxRJx12ifYljuyL6Wsbz/FHTrqNjOwLR0/t641SZNkN/I+fPktsVLzIrJ
         9BOXyw+P83cNoweHl4+hhyh/6ihh4Mt3QlmdtEMf/L/f9utXGJcuVYY7SdVXW6Z6Ffkv
         /sRI/7m0SyCBYa9EsWiS2QTx3PAEV0fI69rCWPbLCKGuywe50lXxF0O8dMP2Nz/tMYE/
         ZKaUtO1tMTBN5YW6wxmQXzTMTJq0EshjNwUV7mB61RbaO28OXI/LW8TgQV1FX5jrZaMF
         Js2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738498036; x=1739102836;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bpa6DswmTEpKbgEQQSdAsXNGWXb6aM2f9Q6VU1SY1iA=;
        b=pOMrkjfuRHXuWYPp5aEeb1uYR6go9H/SS7cQbLJ1cFpufzu3gz/BNcvYCZspPzbgp6
         6xfxcGGfdsw30t3sXzcCswMzJsyVMomfkd5sXOCsL8trdWCsiRoTd4D7dJmaCzMit+Ag
         oN7jql6ultBlETajy7FKm1eTBtT1fIflbJiqJAJw1nbvqSMg5kvXyDdW4aty1EvVUVJQ
         iCiBgn5840fYpdoXrjWqAZe7zEEGLwugBpOgaOr2PIlJb4x2oEeQNqmb2uGVbkxD41zn
         PFpzTeEWtcxQo8tOBRNYDW+kxUtvqwsSnIUJRgmGRQotPVn+QA2wf608YZOxbw4cToCY
         M/1g==
X-Forwarded-Encrypted: i=1; AJvYcCXVwD6sobOgW0eqMTUkGyKuVpVvnDaqfOJJQX+HJLO6Wqt8VlJoJYCtZ/kMe+vDQhFhW2kkazGTsFZEpwY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/QDJvBy8jX/ALacV96p5K/d9k0LbFnfCBspy4xV3FS0v/GXhj
	1fwpY8oETblo5ZA94S06aak7QTauMjtv8MGdHuAZ42aOwgLKTIR8BYXvyCojcmJC9ZTQgqbGqHf
	8f0FpfLDy
X-Gm-Gg: ASbGncvFwvL2qLEEDXeBblX/ZP952OxuY8NvmPES4vt/iDIVyT9CDinKdWFlhL3Sjqx
	Ecu72NEjM5ovTwLuDJuz+iVkj9lPc2sIp6tVOEqpLc197vqSAlbWS551Tc5v2mujiw4RDUqEB2B
	T865jEK3KTwVautjKmDpAGRjzoZPwoTrjWi58jaWjjnSXPtBVOlBf+VcKX4CwwlqhPaSeDJatlK
	kSaUsTqPwLpDldnwV9eNKcbf11+26Qd4Y6lRJoVwo+qg41+FFBJwT0ayevD8INpR5Bwhi4KtkWj
	IA+IKaBFqpg7rYIGBXwcs7A=
X-Google-Smtp-Source: AGHT+IHXtU3IejP8YwnVJn9MYyIczDnB+CnKzsS3+Woi3ywvC0dnZKgoijsqo2DU1DRq6NjAJmdRgw==
X-Received: by 2002:a05:6512:1254:b0:542:63a8:393f with SMTP id 2adb3069b0e04-543e4be9ba4mr4994463e87.14.1738498035561;
        Sun, 02 Feb 2025 04:07:15 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebe10678sm960695e87.101.2025.02.02.04.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 04:07:14 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 00/12] drm/display: generic HDMI CEC helpers
Date: Sun, 02 Feb 2025 14:07:07 +0200
Message-Id: <20250202-drm-hdmi-connector-cec-v4-0-a71620a54d50@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOtfn2cC/3XPy07DMBAF0F+JvGaKPXZeXfU/EAs/po2lOgY7R
 EVV/x0npQKEsvNYmjP3Xlmm5CmzfXVliWaffRzLoJ4qZgc9ngi8KzNDjkogSnApwOCCBxvHkew
 UE1iyIFXP0VKnWtOysvyW6OgvK/zyep8TvX8Uf7p/skA569XfV0WvuRDyRwZy3kEi7aA4MCMIc
 Ki5kp1WSpuDjeezNjHpnY1huWh0prIagp/21ZIy+GyfHw8Y6TKxJcngcwn9uTaexRrlu1y9VW4
 WwMF0XHbcNi2iOJz9qFPcxXRazRkfzlKDbzpYnJ43re2OUjWN/OfIXw42m44sTm1qg071deP0H
 +d2u30BoCtuQdcBAAA=
X-Change-ID: 20241223-drm-hdmi-connector-cec-34902ce847b7
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5632;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=+ddOHAChZI09nxOE28d6g8J7A1xlEBUGNnuTAJPfFjg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnn1/u5xbKjKTTQo+qDVQzXWDIOv2bTTvYcemOv
 Ek3NYpmmt2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ59f7gAKCRCLPIo+Aiko
 1fFRB/9n6b3hUN7ES8r9z2mHMYUW7j1Y2fjRe0DNi52YDlGZNCFEB/mmlbW4p4WCJKVOud11PgY
 enIwbzj7DiiL0AgPLFbmRlfsHqKEZNg2y44UUJi2Ljo1ped0ekb+zVDBbhM9u3OrMh5kxvXI+gl
 Fw1WXS1t15ZyLUR/cmEnrVBIMsZsI1pi1eHk2/ujOZDZTT765kQlJo38iG6ovZWhSK0f+W8h5cw
 ieJuaEUpC2jFvJTwcQFzGWsrGSr+JxEBD0sfzwpa2dDgHAhuOIK+c6jcU6j3gf23IAzvJbfxIUm
 n5pPbPmhmYr00naZLnfsp5Ch2G2TxcZgUKQVyTkBl1XgZj/W
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Currently it is next to impossible to implement CEC handling for the
setup using drm_bridges and drm_bridge_connector: bridges don't have a
hold of the connector at the proper time to be able to route CEC events.

At the same time it not very easy and obvious to get the CEC physical
address handling correctly. Drivers handle it at various places, ending
up with the slight differences in behaviour.

Follow up the HDMI Connector and HDMI Audio series and implement generic
HDMI CEC set of helpers that link into the HDMI Connector and
drm_bridge_connector frameworks and provide a way to implement CEC
handling for HDMI bridges in an easy yet standard way.

Notes:
- the patchset was only compile-tested
- being an RFC some of the API functions and structures are left
  undocumented
- although the patchset provides drm_bridge / drm_bridge_connector API
  for working with CEC, there is no actual bridge that uses the API
  (yet)

- I'm pretty unhappy with the drm_bridge integration code, we end up
  duplicating wrappers for CEC functions instead of reusing the
  drm_connector wrapping functions. An easy way would be to map
  drm_bridge to the corresponding drm_connector, but that would
  either require a state or storing drm_connector inside a drm_bridge.
  Current code stores cec_adapter instead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v4:
- Rebased on top of drm-misc-next + commit 78a5acf5433d ("drm/display:
  hdmi: Do not read EDID on disconnected connectors")
- Moved 'select DRM_DISPLAY_HDMI_CEC_HELPER' under the
  DRM_I2C_ADV7511_CEC symbol
- Fixed documentation for @hdmi_audio_i2s_formats to describe default
  behaviour.
- Split drm_connector_cleanup() patch from the patch adding CEC-related
  data structures (Maxime).
- Documented that CEC mutex protects all data fields in struct
  drm_connector_cec (Maxime).
- Improved drm_connector_cec_funcs.unregister() documentation.
- Documented struct drm_connector_hdmi_cec_adapter_ops fields. Added a
  note to the commit message on the difference between it and struct
  drm_connector_cec_funcs (Maxime).
- Fixed Kconfig dependencies.
- Link to v3: https://lore.kernel.org/r/20250126-drm-hdmi-connector-cec-v3-0-5b5b2d4956da@linaro.org

Changes in v3:
- Moved default available_las setting to
  drm_connector_hdmi_cec_register(), allowing drivers to pass 0 instead
  of CEC_MAX_LOG_ADDRS.
- Reworked drm_bridge interface to store opaque pointer and interpret it
  as drm_connector in CEC helpers code.
- Fixed EINVAL checks in drm_connector_hdmi_cec_register().
- Added the adv7511 patch, demonstrating CEC helpers for the DRM
  bridges.
- Link to v2: https://lore.kernel.org/r/20250110-drm-hdmi-connector-cec-v2-0-9067c8f34663@linaro.org

Changes in v2:
- Refactored CEC funcs, adding more wrappers to provide more consistent
  interface (Maxime)
- Removed export of drm_connector_cec_unregister() (Maxime)
- Restored and rephrased comment in vc4_hdmi (Maxime)
- Squashed vc4 patches
- Link to v1: https://lore.kernel.org/r/20241225-drm-hdmi-connector-cec-v1-0-b80380c67221@linaro.org

---
Dmitry Baryshkov (12):
      drm/connector: add CEC-related fields
      drm/connector: unregister CEC data
      drm/display: move CEC_CORE selection to DRM_DISPLAY_HELPER
      drm/display: add CEC helpers code
      drm/display: hdmi-state-helper: handle CEC physical address
      drm/vc4: hdmi: switch to generic CEC helpers
      drm/display: bridge-connector: hook in CEC notifier support
      drm/bridge: move private data to the end of the struct
      drm/display: hdmi-cec-helper: add bridge-related functions
      drm/display: bridge-connector: handle CEC adapters
      drm/bridge: allow limiting I2S formats
      drm/bridge: adv7511: switch to the HDMI connector helpers

 drivers/gpu/drm/bridge/adv7511/Kconfig          |   5 +-
 drivers/gpu/drm/bridge/adv7511/adv7511.h        |  51 ++--
 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c  |  77 +-----
 drivers/gpu/drm/bridge/adv7511/adv7511_cec.c    |  56 ++--
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c    | 342 ++++++++++--------------
 drivers/gpu/drm/bridge/adv7511/adv7533.c        |   4 -
 drivers/gpu/drm/bridge/lontium-lt9611.c         |   2 +-
 drivers/gpu/drm/display/Kconfig                 |   9 +-
 drivers/gpu/drm/display/Makefile                |   2 +
 drivers/gpu/drm/display/drm_bridge_connector.c  | 105 +++++++-
 drivers/gpu/drm/display/drm_hdmi_audio_helper.c |   2 +
 drivers/gpu/drm/display/drm_hdmi_cec_helper.c   | 247 +++++++++++++++++
 drivers/gpu/drm/display/drm_hdmi_state_helper.c |   7 +-
 drivers/gpu/drm/drm_bridge.c                    |  15 ++
 drivers/gpu/drm/drm_connector.c                 |  13 +
 drivers/gpu/drm/vc4/Kconfig                     |   1 +
 drivers/gpu/drm/vc4/vc4_hdmi.c                  | 140 ++++------
 drivers/gpu/drm/vc4/vc4_hdmi.h                  |   1 -
 include/drm/display/drm_hdmi_audio_helper.h     |   1 +
 include/drm/display/drm_hdmi_cec_helper.h       |  94 +++++++
 include/drm/drm_bridge.h                        |  79 ++++--
 include/drm/drm_connector.h                     |  46 ++++
 22 files changed, 863 insertions(+), 436 deletions(-)
---
base-commit: 7271a88629857dc285d4291055b8e7811f9d3603
change-id: 20241223-drm-hdmi-connector-cec-34902ce847b7
prerequisite-message-id: 20250113-hdmi-conn-edid-read-fix-v2-1-d2a0438a44ab@collabora.com
prerequisite-patch-id: 87a719632f0ca1a6f3c0a495eef515a463c3fa7d

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

