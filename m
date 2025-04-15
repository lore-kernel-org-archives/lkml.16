Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87742AEF1;
	Tue, 15 Apr 2025 05:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744696766; cv=none; b=O/F5sWiuj5knI88FtWYKBFuHyW8ZaQkSl6zTZJVGXIVGLb5btIeApVYXstectQLQevkc3MTtDilQ8NcPYRXjZAdDvubCnBx0aNu0p0YVj5r+BtciUPZaGpoo59f8/3A3lHbcXOTbDZlAwhaIll1rtEIxrlVsP5Cr+X3D6E7chro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744696766; c=relaxed/simple;
	bh=0/iKWo+r1gsd20hjlsFUjIvxOQIo6ura3X6TyTbKPlI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VLdLSe8yixEErm0geEvmdGL41WirjWekvljuhrKvSg41QsFUIKm3UbE20ukFQNZojAwiDDr8Qkcyt9xmu8wa7vwzPkYmrQUnu8S3XRq8vn1Lz9c13rlmXwuovcogupJJJw3J6Tjgp05eOjDW5Ia84EaIVE8W02bNbGjMFEoDWVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vf0g2K/8; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vf0g2K/8"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5499614d3d2so5891027e87.3;
        Mon, 14 Apr 2025 22:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744696763; x=1745301563; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HKAsQQ31HaeqnieY3QpbMjvyrHHsHhhxynf4LJdeVRE=;
        b=Vf0g2K/8LW4Us+Jtgzm/o81QvioFmEBnhyIz90Y3GDgss4ZCWmpxbu92kg1LkVYKIg
         o2ey3F7ChHSZSxynIFfh0NAvf0jx92rZLbw/VjA6JNO/AuQQP4s7JZ/um/ZhzKQnrnSm
         lcRnmQTB/iuYALS8KBNK9agiqguLji1TNRdnWfrlJ6045//kXazTa8tC1CO9wLsQjCVc
         31gerdRBbZK4tYkWY27vCIxyxtG7qhX5m+2KhEIIS0eemCLjdSmoLZpjZUMFq9IJj2++
         HImUDhoyHJ5pd+YnMxWZG/DZ9juojJGI0gOuZTcaHF223AXp4uoG+bk7XzNOfl8w/fTC
         rqoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744696763; x=1745301563;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HKAsQQ31HaeqnieY3QpbMjvyrHHsHhhxynf4LJdeVRE=;
        b=QYsDt2S3a2FhBz7ihxVT0zr1luqsHcOPPkBtSfPJqTy9BQUp6KMkxXjIUALEjz/0k4
         r5ZsdZ83eY/pHx+jJqBPM8iZXqocGLNMxHxjYV0TJNevmzpuVD7CgiwaVtFHYKWvRen8
         hyn1LZ/2GzfRuKfbMLKTx/zYGnEDY2o3TGCRg09TrHT+8S/azXP00yakmOkcjYyeKnxq
         aFIZDF31R5KQjbTOHzwHjyam5JEbPfWIVrRPUC1bP2ns4wwiG8MvmgCm78Yw1Xxd7C/3
         6kPlS1AzdNtrQOdeNKGo+rIGz3IF1PMgF0ypxpNCnia92T2LmhNKhlb3ehZLlqKe4ykV
         YNiA==
X-Forwarded-Encrypted: i=1; AJvYcCXJM1nTvtkFsYDS6fx/YbORPqu648Eebc5a6koBcemq/zGuUs9R/+E4DStC1+lf0gf6lZZ0hKCehNRn@vger.kernel.org, AJvYcCXVf0FGtGRu0BF0ML+4x3N6iFbhKGSioYz4Kqqqk7v0QIMZYWi1mNTSWG3nvnLkHGQpUwf9s9NHBUYGFprk@vger.kernel.org
X-Gm-Message-State: AOJu0YyvYZQ6OZsmlkE+pw+4eeSdutSGWUKXqOvyI9DXhdtkseN5C31t
	OEBr10IdnQ96Lugmlw6WuNpnT9DMMdAdS88B7cU/db+IsQSkqYKq
X-Gm-Gg: ASbGncsOhxGONign2vZd1LSYPfo8Via7DcTdBnUc/EXr4yHg9zbraC8rdhfhKAFPNrQ
	Rv2+yOQWQbhoOcc91d3GfmfyAwhooXXdEnSLYEyO1TEdSE4eUlFs5i8f+71GadDeGs7UirpcfEd
	n3NNjdvl+VP/KqeJ/epRdYvxPTsfSllMM79kLsuLFp+3AWHoNBKJ3sl4K17aUH92k5QcqQIpQMj
	qZrnbeiOfZBxQhoQDZZwbhsxUP4WfOfCge/HUUzrgpLg4o5pf9WV+s0pbUKn5q42gdVis7JH0z2
	vnAArtNh1EXKGxU0SAeRqe+ucIGreRfKavd7WppoZjYko1d6cCl4FPKX4H6iAxeQbTdReMX68fr
	FX/c6dlT+v69632sAvyY=
X-Google-Smtp-Source: AGHT+IF8+Ejb264AH5+djL4JLAXmUaTSHRl3I4zB5uwYZJaPJIfsyNBhhD1/+SfSFbJXq/PKfBiHww==
X-Received: by 2002:a05:6512:3b0b:b0:549:893a:1eff with SMTP id 2adb3069b0e04-54d452947a0mr4474164e87.24.1744696762648;
        Mon, 14 Apr 2025 22:59:22 -0700 (PDT)
Received: from [192.168.2.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d238820sm1325471e87.80.2025.04.14.22.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 22:59:21 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v4 0/3] Add support for Sitronix ST7571 LCD controller
Date: Tue, 15 Apr 2025 07:58:57 +0200
Message-Id: <20250415-st7571-v4-0-8b5c9be8bae7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKH1/WcC/2XO3wqDIBiH4VsJj+fwb+aOdh9jB2afJawaGrIR3
 fssKIId/j58XpxRhOAholsxowDJRz8OeYhLgWxnhhawb/JGjDBJBKE4TkoqijWvWK2ts4Q7lB+
 /Azj/2UKPZ96dj9MYvls30fW6J9ieSBQTzCVtyloD1MLc297419WOPVoTiZ2ZOBjLTFhVGZM/0
 Mg/xs+sOhjPjBFSag4OrFRntizLD+Fx/psKAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2538;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=0/iKWo+r1gsd20hjlsFUjIvxOQIo6ura3X6TyTbKPlI=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBn/fWj4DdATMn7xfQ9ZrzuSjQFfm8ODmsQLUY8o
 Ddq39rD0F+JAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ/31owAKCRCIgE5vWV1S
 MsoiD/9nbU3ua17vEwFCYnM9/o3k0N1CdNygwBSP4HAskQfpqYdhJa9z/OX4cdNQAIeAN6NkCAn
 4hDc6NrNwB0/Z/RMPSfyrruV7LGXt7Jb1hHgzTBZbb7yNYPXw6XdeiHzyWzvSPJzRUxI3WhjLIt
 KI11y7uAi4138NVB/BvtgDVsOiw9LlJe0WrnkxY6g1NGk4fPGrC17Vb0GlaNFr6djHOB48pYA3T
 WzsD5rWhsVbb5qyP0nwBm42LdSKiPVoDfXHonpKhTetFtJF45ONOhj2WsnHNCpSheujgUU5fZMQ
 dQ+dTkfBpNyAnFyuHLGcCsVL6LpKmnZac8ibVpA3XkGRWcgnrxgXV0+nZX2qMntWK+hq+ybpl92
 lHcd4cYXTsWW0+8fqGloPYGZ236SRT6ZuFYBpvyEKjPATxZ57p21EUJBQcssv8X3fu9CqvoZjI9
 KUehoeBdfwJJtMO03uxyGCc0ifW/s/Jh/eL42MT6k78xdJRXEaLqFKZO6F6u7FXRzLIsMFSXZjE
 VIQRLscNdGEI2jINp4qfazuqaG//L4Y0cy0MmMrRLt3UzqNWb5SeIjivTAw6qhE/lSzSHTKwiIr
 QByG2vqtjwA7nmR4yJFSBVTllBJMp9IkAEL6EoIF76MLPLiUznfsY3praUmJaex1BZmZ1zL4hy9
 zjrq7F8VtGsw3gA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

This series add support for the ST7571 LCD Controller.
It is a 4 gray scale dot matrix LCD controller that supports several
interfaces such as SPI, I2C and a 8bit parallell port.
The controlelr supports both monochrome and grayscale displays.

This driver only supports the I2C interface, but all common parts could
easily be put into a common file to be used with other interfaces.
I only have I2C to test with.

The device is a little defiant, it tends to NAK some commands, but all
commands takes effect, hence the I2C_M_IGNORE_NAK flag.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
Changes in v4:
- (dt-binding) Add sitronix,grayscale property
- Describe why ignore_nack may be needed
- Make drm_to_st7571 an inline function
- Add support to clear screen
- Change from C2 to R2
- Add support for XRGB8888
- Use dev_err_probe() where appropriate
- Make Kconfig config depend on MMU
- Introduce device data to prepare for support for other chips
- Add support for drm_encoder_helper_funcs.atomic_en(dis)able
- Link to v3: https://lore.kernel.org/r/20250408-st7571-v3-0-200693efec57@gmail.com

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

 .../bindings/display/sitronix,st7571.yaml          |  73 ++
 MAINTAINERS                                        |   6 +
 drivers/gpu/drm/tiny/Kconfig                       |  11 +
 drivers/gpu/drm/tiny/Makefile                      |   1 +
 drivers/gpu/drm/tiny/st7571-i2c.c                  | 994 +++++++++++++++++++++
 5 files changed, 1085 insertions(+)
---
base-commit: 1e26c5e28ca5821a824e90dd359556f5e9e7b89f
change-id: 20250401-st7571-9382b9cfc03f

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>

