Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005221DFF8
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 12:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749039368; cv=none; b=QB2mn/aSr1EDserqgOf32eA2B8NwoxGcd7HAqnmNYOdYPVc5db2JhdizVAt+WbIcAsDKAllxvJdd/5M0rLIsfe9WJoJT7i0FkPsT6VmrB6uRLpBU1CwTCxN8WmaTnIC753Vcr0fFhAT+jLWJXlHu24jJVo6DHcPP899tM7WdodE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749039368; c=relaxed/simple;
	bh=uY7D+jjddolNqhiti7y96EkPRMPxJ7Jd0zS9UX+scuw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pRnuGL+NMpBNqt5cz5DgA8X2HVVcKHB51Tap9yFrgSxjtnyRWfWSb0SJroVMbV7tKDPjIPCQWCC6WjItd6qf4JIGKUpq29pdWOC5x+5IzjKkMOfAKmbtT750I0LJQXOG4FEUCUhpOhV31I82Izpk1wDfVPcailq3beiV7oneTWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=e+rSStwS; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="e+rSStwS"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5532a30ac45so901152e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 05:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749039364; x=1749644164; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8xekR2IKHK6b8xke32HrcPkFvXPWhwmXLd0wFiP/mSA=;
        b=e+rSStwSlpYjZMTFbC+RwFRtnoaWIJLzghpR/3qJeLlnfuleO8F00hOZPV5mNoGmn7
         agEznDImczaYKcQ9knU2uroN8XS1U+PLCor5EZFShjkUV4MOpzECC7Qz9I36yxIvGDxG
         r7joec8oZSWOgfU5Z6xuj+mITSrXHp9+helbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749039364; x=1749644164;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8xekR2IKHK6b8xke32HrcPkFvXPWhwmXLd0wFiP/mSA=;
        b=Pgp/aXXhpsoq2Q8SVOx5onZA99TZN2sj3KbOV6kFCjE3KTuuXcg5HcH2Ty7sgnvoVw
         zHzGMS8x6K1nqOf8MorSMIu14Ms33xOJoi1ZoxnLuS6dlka2oqD8LjFQvWQWBj+dDGdx
         RF+hQF/lAEOSshXRndxdjh2uczIhMxq+wJCg8pSvYxbJm1XyhvBx+KJ8kMy9h0UwiNa3
         Gt5V7z5zBK8F+ElLzZEptAqlda8VQu7NjsSUXFxdeY1q9QU+VU69k+PW1l4neWNYQCOS
         deLCYH9Jo9wKoX9eoljRk590+MxIDvYWyCvu3gFjYAJqyBlZ+HbqmTPjnFTyJeGGrpPD
         giyQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5LlIg1gXLjYEaC6qX4sGdQiI32Rfm+2qKi1p79+ltb/kl6AY3ORejWbkvcBxNpsAwWKVSn86un8NEBPA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgtWT454FDsS2g4hq/Y3CiZTeDu+6PUHF17v1osry8YWx6YNT/
	ZDEJqj2XPGlukPCASO4XVCIKyJ5MhsxWxpJAE5G5dKubHz2+q5/R/xCU81PQhalW9KBOvJYMUBx
	izss=
X-Gm-Gg: ASbGncsR0zfEmWUc2ZOnb6qPZs/AF5oJLdzTLfFz2khVL8Rng5GjGrNlT+qSJP8cBeN
	/8pR07HGzpLBD8AhDKRfWgvJ+paukkvstOSjvq40xJ3/4lHaUY4WhDH3WtwlEFOuw13ToOIc9FU
	UjBH8I3eSksNUZq+8EsU8TPKrIo/OotgRQBX0GjMl+DWpJTe3BgPC8Q1MKt7OMui8OwLpdk5H5l
	OoSjnDN1mUIpoaF0g3A8dM/BJEO2Oz2UFh7TxXOuObBQsm3GMZYGEbLP6rkumORhlp4YaI7qJwn
	FiaDTKVkEi2mzOw8Bgjl3G5F3o4E+k6QV6MYsRPWeKrJjmLKaOnROv8/FzQYicFuCFuk6ebsRr3
	DiIrCCMEr7ESE9PZ52MnzuEUcMA==
X-Google-Smtp-Source: AGHT+IHhatcr0s6vMVBvq/OiXe1Yz6St2NxBtXXPB6neJC31+NPT+75ckWXgzHIGnO1tpnNzLm5vDQ==
X-Received: by 2002:a05:6512:104a:b0:550:d4fc:a0d with SMTP id 2adb3069b0e04-5535719cec5mr813991e87.24.1749039363950;
        Wed, 04 Jun 2025 05:16:03 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553378a12ecsm2289134e87.90.2025.06.04.05.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 05:16:03 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v6 0/4] media: uvcvideo: Introduce
 V4L2_META_FMT_UVC_MSXU_1_5 + other meta fixes
Date: Wed, 04 Jun 2025 12:16:01 +0000
Message-Id: <20250604-uvc-meta-v6-0-7141d48c322c@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAE5QGgC/22MQQ6CMBBFr0JmbU0tHUZceQ/joikDdAE1LTQaw
 t0trIhx+X7+ewtEDo4j3IoFAicXnR8zVKcCbG/GjoVrMoOSCqWWpZiTFQNPRjBiRVQ2F2UY8v0
 VuHXvPfV4Zu5dnHz47OWkt/VPJGkhxZXImEoT1oR32wc/uHk4+9DB1kl4dPXBxey2VNekW6saJ
 X/cdV2/1Izf+98AAAA=
X-Change-ID: 20250403-uvc-meta-e556773d12ae
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 stable@vger.kernel.org, Hans de Goede <hansg@kernel.org>
X-Mailer: b4 0.14.2

This series introduces a new metadata format for UVC cameras and adds a
couple of improvements to the UVC metadata handling.

The new metadata format can be enabled in runtime with quirks.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v6 (Thanks Laurent):
- Fix typo in metafmt-uvc.rst
- Improve metafmt-uvc-msxu-1-5.rst
- uvc_meta_v4l2_try_format() block MSXU format unless the quirk is
  active
- Refactor uvc_enable_msxu
- Document uvc_meta_detect_msxu
- Rebase series
- Add R-b
- Link to v5: https://lore.kernel.org/r/20250404-uvc-meta-v5-0-f79974fc2d20@chromium.org

Changes in v5:
- Fix codestyle and kerneldoc warnings reported by media-ci
- Link to v4: https://lore.kernel.org/r/20250403-uvc-meta-v4-0-877aa6475975@chromium.org

Changes in v4:
- Rename format to V4L2_META_FMT_UVC_MSXU_1_5 (Thanks Mauro)
- Flag the new format with a quirk.
- Autodetect MSXU devices.
- Link to v3: https://lore.kernel.org/linux-media/20250313-uvc-metadata-v3-0-c467af869c60@chromium.org/

Changes in v3:
- Fix doc syntax errors.
- Link to v2: https://lore.kernel.org/r/20250306-uvc-metadata-v2-0-7e939857cad5@chromium.org

Changes in v2:
- Add metadata invalid fix
- Move doc note to a separate patch
- Introduce V4L2_META_FMT_UVC_CUSTOM (thanks HdG!).
- Link to v1: https://lore.kernel.org/r/20250226-uvc-metadata-v1-1-6cd6fe5ec2cb@chromium.org

---
Ricardo Ribalda (4):
      media: uvcvideo: Do not mark valid metadata as invalid
      media: Documentation: Add note about UVCH length field
      media: uvcvideo: Introduce V4L2_META_FMT_UVC_MSXU_1_5
      media: uvcvideo: Auto-set UVC_QUIRK_MSXU_META

 .../userspace-api/media/v4l/meta-formats.rst       |   1 +
 .../media/v4l/metafmt-uvc-msxu-1-5.rst             |  23 ++++
 .../userspace-api/media/v4l/metafmt-uvc.rst        |   4 +-
 MAINTAINERS                                        |   1 +
 drivers/media/usb/uvc/uvc_metadata.c               | 116 +++++++++++++++++++--
 drivers/media/usb/uvc/uvc_video.c                  |  12 +--
 drivers/media/usb/uvc/uvcvideo.h                   |   1 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |   1 +
 include/linux/usb/uvc.h                            |   3 +
 include/uapi/linux/videodev2.h                     |   1 +
 10 files changed, 150 insertions(+), 13 deletions(-)
---
base-commit: 5e1ff2314797bf53636468a97719a8222deca9ae
change-id: 20250403-uvc-meta-e556773d12ae

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

