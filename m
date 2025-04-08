Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D62219A76;
	Tue,  8 Apr 2025 07:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744095901; cv=none; b=RVzJNh2ckgQYgcEsAyZdcg/7AgNp4Qg1OZtM6h9Nh3Li1xGrja/INDGIOnQoA6AcaP8ZnRPUpuzcAua9cj2YGALzZt51aNgRCAbwfL0BEALmZehjCFfGi19UkxLJ0VEK/sHp58H22HRjHsOKKDAmYuiWzRe6TWzrefvSAC6s5pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744095901; c=relaxed/simple;
	bh=eEpZz8tbfoFeBVxKAYzPIl0JRGnarfa94dGMMm/aZIE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tN6NA/RwkmgrXvIogPLJQSPEfxgRabQg66bMsywwv4zd4C6SK7kBToUtwcUWrSjptJZDyniedBKy/QN8r9YHlP0gqyvNPqNXQsAivE5qYK5c7zL5VxJSxi6DMyzfusLxuUcyw0JpFeeC+/BqoLQWOfUskd2IQ9U8gcecxZVBra8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kOZbtrFc; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kOZbtrFc"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30c091b54aaso47312261fa.3;
        Tue, 08 Apr 2025 00:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744095898; x=1744700698; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9RvH6nJLCGwOS3IUf0/jo5Vvg4n1Cl/DgCkb9I5L20=;
        b=kOZbtrFcPHj+kGLKsqDAPHFsWDhdozP1/Ze7mip1LzAnbjjhncrv+qvYvQYGa5qk/j
         nudlGbletrjfNdnfpc4wLh1qt2RxC1sGtgyXZ7hKV8xiKrWvRKFXxaEB+ydikZsYjC2q
         l27oUFzLNNNYB/unOCsS/IGV3JPFF/WrQjAiXw44TBYHa44isoYzoRu6yW7UGnENGC32
         Z6Sn7wjigRj9t/9oGUmFOsWJU5kgJ4A/T3U2fewC1DnZG+fpO/IbHr8hATH0ksULrFts
         jvoKznWWy5HQePP+KnMBu4n6mOpfgxbvMsZ/id+asTs9m3voq1l7kcC25ZHce3SmIuQF
         wxhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744095898; x=1744700698;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z9RvH6nJLCGwOS3IUf0/jo5Vvg4n1Cl/DgCkb9I5L20=;
        b=eERWF2F++NEneED4qmLyeigV6Q8h0j3Z56VU50cD2oOaAZWX38M8nLSO9LXrStEa/o
         xNKDWCMK0+Gc+powVU9uc9KQqr68pwOe5iuUxdZeO8bKlYJ9eQx2/2kxDoZekd9yHFSg
         93IkuKuCB92N03bxD/qpKcHFow8jLfYZ1+fn7d+7lAip8Wcmlk+wYhFQPauWPhVT+WOS
         5Nb1D5syDxMRaMtBpVMX1ynb2wv3IBuYXqIY1+sGWww9mBWxqBBpEb2u3mP2HUG9ogoG
         rLBDDuiT/cSVJculh40e8O7cBqulnOYyzHFiYjLGDyWWYmy0okgziP18tj1TVYa5eTeW
         eQ2A==
X-Forwarded-Encrypted: i=1; AJvYcCXcx+ci957tPN85O6ZmYRkoah+p/nBGG6/eGj6EiFegD0qqR0S3jp628POcmySo8qsTDEqi5TqPN2FG@vger.kernel.org, AJvYcCXn2BbwTTjASLFdfjYr4qy/biIkRBQiHHxCXASUQEkF7TztK4fb2d0GrhxBs/3H0USKuLL19QbYRmKCroHq@vger.kernel.org
X-Gm-Message-State: AOJu0YxA7obK16g4gRHBIz2gUesm3JwYr6o8DODo7P7XlV8h7BvsRvcu
	jtdraROmzIZplqdtKICWv17NzhakCR8rDenAwjCtVsc3hfNOhF4twX3dqjHC854=
X-Gm-Gg: ASbGncspCaM1bJ20Qr0+1EH/wHewSnANjkGWD2bGggIkhSZwLuebU0+FUgHGzbuKarw
	hQeyNAYiWZnG7NKmZZELeqA53D9RaeFvDDaM5BGXGpzqARfjdMd+bnNeV0qbVF/M426cTFPz8nI
	dyZu1D/nSAX2oaBc2xDepJKNGA0nYTO25BbX0D4fL1af5t6AOeolxfkfujAU+ym60/qIrUSztZp
	qG1cP+WwJcdlb7rnSa5tunP1kW8tcZFp2tb3RCscnHSSNjC2DMv0vc5ozQsoUcylOJxgEGgegeB
	Og32zJqfrvhLnSlPVTLkyAAaQh1arRToic+TC2SWA4Nwwqtc803QUmVltWbWUBOYx5N4Le0OqB/
	g9O9B4ei+K1t1snjxpF3gJgI=
X-Google-Smtp-Source: AGHT+IGHZ5XDw5CVJD6Mj7fkx1Ax4avmRtdNAL/FMZrSclddvl9CK4M3rbRK8XAjnFF8Yiqd4LfUnA==
X-Received: by 2002:a2e:a0c5:0:b0:30c:11ef:98ea with SMTP id 38308e7fff4ca-30f1650ebb9mr22936511fa.15.1744095897589;
        Tue, 08 Apr 2025 00:04:57 -0700 (PDT)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f031bcd37sm19252841fa.76.2025.04.08.00.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:04:56 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v3 0/3] Add support for Sitronix ST7571 LCD controller
Date: Tue, 08 Apr 2025 09:04:27 +0200
Message-Id: <20250408-st7571-v3-0-200693efec57@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHzK9GcC/1WOywqDMBBFf0Vm3ZQ8q3bV/yhdxDjqQH2QSGgR/
 71RsLTLc5lzmAUCesIA12wBj5ECjUMCdcrAdXZokVGdGCSXhmsuWJhzkwtWqkJWpWscVw2k48l
 jQ689dH8k7ijMo3/v3Si29UjIIxEF40wZUV+qErHS9tb2lp5nN/awJaL81fRXk0nTLi+sTQ/U5
 k9b1/UDbhadJtMAAAA=
X-Change-ID: 20250401-st7571-9382b9cfc03f
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Thomas Zimmermann <tzimmrmann@suse.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1950;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=eEpZz8tbfoFeBVxKAYzPIl0JRGnarfa94dGMMm/aZIE=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBn9MqDYL4Rhfhi8V+kf9Zem2olB5P2Qq/M3efES
 knX7dZ79KmJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ/TKgwAKCRCIgE5vWV1S
 MvNaD/sGDNFrhZRmkpqyysOxA57JnfIB2WFb37egut7976M91VnMr0YN/Rs3Cn0MtEkHjVDNHVU
 MbypurmU/NsWEgM9BP5ghIenoCn2xtAcU6dmpQz0MSDZep9xIQCm/sK6z723NysZ7QIDHA9XnaN
 Iysrkr99XbVU7EGymnoR9arbKya5PfTTnFf9KWsHwKKjolw0p5fTM79UmEMC/1N2FmHsaYFX2PC
 XimwRJIm2qqxlEI0xBBeWI5Pb97pu0DoejnFzCDoyjMVJwZjUxBRNiP9Im/OhM2TsktyX5DNLII
 LDOU4hKIa/UEXWHTbchvX/ZpZI/DBwh8nbYHzuU0eDReZBdCf3zcFiZNxW4VakjC/TwicqvkiVv
 fcD6iIC6G5zeIUwn397ZZqRzidgX+1DPI+DBtX0+md8Oh7VPSOHJRrAuaVNV/lNSH5lieH7vdXI
 FxSYQIQSg/Unm8PGgaF0e8owc/617Es0USBBJL7mRRQ+uaLKpP6JuvkxfktxYQVQzD4YBCmZKsA
 yZqIL5eV0opXtAa2j/qTqKGl9UxLyzvBxvAtCm9Vzphojzs1QL3ST3/ZnpPVX9VTB3yoEBJflvK
 sCmf6hkiuDvY5lcd66ABAmfjNmQ4DxA2mzEX00NLU9lDM/wgRLmuwCikZj5XwNzBRCoYSQAsGHY
 d5qXODS/H3OxT3Q==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

This series add support for the ST7571 LCD Controller.
It is a 4 gray scale dot matrix LCD controller that supports several
interfaces such as SPI, I2C and a 8bit parallell port.

This driver only supports the I2C interface, but all common parts could
easily be put into a common file to be used with other interfaces.
I only have I2C to test with.

The device is a little defiant, it tends to NAK some commands, but all
commands takes effect, hence the I2C_M_IGNORE_NAK flag.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
Changes in v3:
- (dt-binding) Use 'Controller' rather than 'Panel' in texts
- (dt-binding) Constrain the reg property
- (dt-binding) Remove panel-timing description
- (dt-binding) Change description
- Mostly cosmetic changes in the driver code
- Don't call drm_atomic_helper_shutdown() in remove()
- Link to v2: https://lore.kernel.org/r/20250404-st7571-v2-0-4c78aab9cd5a@gmail.com

Changes in v2:
- Reworked pretty much the whole driver to not use obsolete code.
- Use panel and timing bindings to specify resolution and panel size
- Link to v1: https://lore.kernel.org/r/20250402-st7571-v1-0-351d6b9eeb4a@gmail.com

---
Marcus Folkesson (3):
      dt-bindings: display: Add Sitronix ST7571 LCD Controller
      drm/st7571-i2c: add support for Sitronix ST7571 LCD controller
      MAINTAINERS: add entry for Sitronix ST7571 LCD Controller

 .../bindings/display/sitronix,st7571.yaml          |  70 ++
 MAINTAINERS                                        |   6 +
 drivers/gpu/drm/tiny/Kconfig                       |  11 +
 drivers/gpu/drm/tiny/Makefile                      |   1 +
 drivers/gpu/drm/tiny/st7571-i2c.c                  | 721 +++++++++++++++++++++
 5 files changed, 809 insertions(+)
---
base-commit: 1e26c5e28ca5821a824e90dd359556f5e9e7b89f
change-id: 20250401-st7571-9382b9cfc03f

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>

