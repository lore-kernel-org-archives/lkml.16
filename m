Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF262581;
	Sun, 13 Apr 2025 11:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744543453; cv=none; b=DW79yKVJV9aDNYpeIb2XrpxYs4VDY/RRydBSJPMcRtVH9bczDRQbpRp8FeaZGyiVmHDDw5cq2YKNZOFcXZH6RHMgmDnV2o4eXIY2luYvaknsvonuh/VFE9SDJbhDHiGvpLyy49q8hXeFb2lyOEN46tMotxD1GaiAY8KOenlVuvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744543453; c=relaxed/simple;
	bh=+tSMAYW0z/PmwuzJzSLQPajX3zX0QSEXp1dKdO1Rf9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AZxgjYRZSlFoPTK/Fj2zeEdU462dE4N1ML9NxjAPnSL7fvqrkxv03IKeGvkyW5c9Jyuk0C20UQpGkII6A/ZBWfD/i5vtFOoQpgejD2YZL3XOkaKGtJUT48kUeNWiITGWwiCQAUGPX7EEZifLN9FuWElEW73FZcT9ITj+aUxKPRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KMnVsGT+; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KMnVsGT+"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac6e8cf9132so638284466b.2;
        Sun, 13 Apr 2025 04:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744543450; x=1745148250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rUTDjy7xdeVquaQ2yrizRZXgwdn38Vk2chACh8D3pZE=;
        b=KMnVsGT+yAnXkHsrhvxOggFv3h4VOWwKWjnk+lAZmkIFiuUeAgxeoE6Hte8RP2Wu2A
         F5NiICt5nj4FybQgIJUcvU0N+zUVDQ2oThcGUvFae+V5uwrxVJ+SyIdydNrb2XldxoIm
         Kfsx7nXxtYinuWHlGz7WVbwvBz8UuFYy7HgSIzXzDPRZMtpB3nxM4INdsHEZbgTKt1hn
         CZyIPtLGTtP5P3s+dRnzApxUMTwisK2DAvQvJfFvWnn9VMnlCcAMLDhnOC3z7gDqMRxx
         3YCVzQczFKDGVRMbFIZTldtI3qQyECD8tOp+MZA6MtpGSgXPbsTi4aJbWIjl0VpyC1fx
         BjJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744543450; x=1745148250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUTDjy7xdeVquaQ2yrizRZXgwdn38Vk2chACh8D3pZE=;
        b=VIoqKbxdH5/ZzOoSnSqVISm/sq5GLI2CrJgfjr9lhzZF0RtKCWXPobj/pk99uAkAuZ
         d8QOasM2iICaVaruYSAZGSVDuFoEGQ1MMdxJ9Bn7qAwImIbeLcCrnHnzlw9BgTwMwl+2
         ubUGvy+2VEehAMp8ZycZX9ZFm7Pi/f6y9bKaWkEp/mrX/FkRcwZpqBVxIsmHgDlDHyh6
         gHHmf3b2ZCcUej0WZnHL4tXDLacP/EFwwJa5HUkjFCSiI7DvbBnWxObWQllC8je6rxsG
         W4bRvyqf0eky6fwiMtPoZ17A1CbQ2yBwSPLpi++rxXBGZKEc+zIELv9ItWQq8eHEg0yg
         WNxg==
X-Forwarded-Encrypted: i=1; AJvYcCW7RX8LkvzxKc63iu9fhKrWEMX146f3zRt2DSwRnCclgVBmANe7RmfDbAH+MoMZpyxQBanOdUsUO7E8QT8Y@vger.kernel.org, AJvYcCWGne2KylyOltgSKx7XuSSeJ0RwuBtq4PpJGEoawjR4VUksgfPJBIyFIwXW2R+5XgIlup/mQ5KWkpjK@vger.kernel.org
X-Gm-Message-State: AOJu0YyndMoKOaa1t/6J7PFqOFvkv6F3Cy+x6JHmVDTFSXoqmnl8HM2/
	IrOhjuE6W98Y+nzr/OoGTDPTXHAc51R7XxryYpCZBvQgIU02TT9iwWiMKQ==
X-Gm-Gg: ASbGncvZ/m2Ebm9TIqUc/sW0Po5NgT4vyXtupyPlhsNRpaEvADVBXA9dYL99nyzEXkW
	GaYuBtxpolFY4ubj278xp/bY76ayoAeGo7suwnIpw6C1xSdFXWyn/o2ZkgIclL/jW+rlrw8Nku1
	FmPFXZzr2bFpC7T/UChiHQBQj1Luvc1Z9x5IdAH63n+HW6OhdqQwOBUoCilsEKnpiZymtZNIKvT
	4X6N5/RPU5rD6e4fM9NO2j0225xxY3zUIgET1GKMicT57ZtcTlc4bDPvlq8jzpVGmy06cu6BVW8
	ZlqIs5csMxCVrpyVqbsAwOFEvH1spFRjDcAsgxrELB8=
X-Google-Smtp-Source: AGHT+IE93UB1qoyXlQ7Rv6TpcB8vp7o9k6YIA/hmBR3invbLq9NB0l+XJsASKJhsxC36HjPlH/VLXw==
X-Received: by 2002:a17:907:3e87:b0:abf:8f56:fe76 with SMTP id a640c23a62f3a-acad34d8da8mr882386766b.25.1744543449638;
        Sun, 13 Apr 2025 04:24:09 -0700 (PDT)
Received: from xeon.. ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb4110sm733529766b.91.2025.04.13.04.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 04:24:09 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/4] drm: panel: add support for panels used in LG P880/P895
Date: Sun, 13 Apr 2025 14:23:57 +0300
Message-ID: <20250413112401.12543-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for panels used in LG P880/P895 which are based on Renesas IC
(not related to Renesas RISC-V architecture just the same manufacturer).

Maxim Schwalm (1):
  drm: panel: Add support for Renesas R69328 based MIPI DSI panel

Svyatoslav Ryhel (3):
  dt-bindings: display: panel: Document Renesas R61307 based DSI panel
  drm: panel: Add support for Renesas R61307 based MIPI DSI panel
  dt-bindings: display: panel: Document Renesas R69328 based DSI panel

 .../display/panel/renesas,r61307.yaml         |  93 +++++
 .../display/panel/renesas,r69328.yaml         |  72 ++++
 drivers/gpu/drm/panel/Kconfig                 |  26 ++
 drivers/gpu/drm/panel/Makefile                |   2 +
 drivers/gpu/drm/panel/panel-renesas-r61307.c  | 326 ++++++++++++++++++
 drivers/gpu/drm/panel/panel-renesas-r69328.c  | 282 +++++++++++++++
 6 files changed, 801 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-renesas-r61307.c
 create mode 100644 drivers/gpu/drm/panel/panel-renesas-r69328.c

-- 
2.43.0

