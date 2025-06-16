Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5191F0995
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 15:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750087492; cv=none; b=Ldk77h/nqstPKP8t0XObrTahnx/PAUrDnIMxBRbklGwprm4xz9H9lIKV+jZC+HOoz+R9MC/p6kPcEx6M2eJtvAetsBypAq3ix4ygH8bHisUrUbfUeRA3A4PZr7UJAsNGhPg0RQc4Z6vTD64BQhpQL/sxVHjt+uzWoDCDNJsaWbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750087492; c=relaxed/simple;
	bh=/ctcI5zq3gIzZXnfGFYc8xkKJPq2Ec4HSPKJ2/pD5Qc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JXwzLhE/sBH5KZp1NxM/2vK9x3APCdBTUISsYBojumO69N3uTU3S9yqJ8NKFkodQzQgGrvPTkOmHfKLzzZAAs6rdE+EjLPJ8UVwMUa9ko0qxIrurWiLMsIz417DMDytXdV2spk2oTmTyL/e6K78ZfrmmU8tmuQDgwrjxf1qYZpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nujVl81k; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nujVl81k"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54d98aa5981so5856164e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 08:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750087489; x=1750692289; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E4xFHhWgDcpghRYZo7vm6fqhadBi5lxuMRQKlHZhCCk=;
        b=nujVl81k8VBlCXtcLCjmY9xBmKOqRVPZ4U2Dk00DKnfa2axL1kuvt89VZEsztN3DDU
         sWDsRIypvF8Q+ub9okeTjEmf7hlKTpOQNa3wDTvIYsFm4ZegFmvtFuKRImKvnsnv70BI
         zA9we69nM4390Edj6BxzKT2haGsKOiBzkKBZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750087489; x=1750692289;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E4xFHhWgDcpghRYZo7vm6fqhadBi5lxuMRQKlHZhCCk=;
        b=jCol3WcZdhuGaRsr2AglbmUGYfweX4IPbB9E3VQuWwBOXtxrbEqYOrTclskTQx5EjA
         qZy9Bwr4LgWMmUDcOYrPuiRxg90DlkhGB+OGVuo17S0w3rPjZMHNfg+0jwLzUJivU8nW
         u7f7mTO/F2xm4GPWHHwWjPZ+UeFBVEUWuJewEvHg63dDbDsN/jxy3nokamTbnjB1xpg/
         QP4zThEZKgxOLpJYRKdR2hhCeEhENUaNG6gosuZLnZX9p9j7ShJDMsIoq+veE9PkbdXi
         KgSBwsqikOcXSl6G/kktKur0J+j7XdXzPGHw4Q6Kani7UXq5KKAkQI8qKrWqYk0Cv8Kb
         4BOg==
X-Forwarded-Encrypted: i=1; AJvYcCXH+48MZ6vncDEeE3Tsx+O79SsWhE6EgPq0LI345pmR+djWenDWbLYoafP8v8ydl0qEUNPF395DeEwUxXo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwWijfQHNRhgI84qhS04ObpJbDrB5hT2JIPQt+7S+odnNnWKKb
	QdO8HSIu0bUPaotnJs6zIVwFwrcyGLubj1Xwloqkb2mBlFQ6AzzuyIgnRI+HtNJlLw==
X-Gm-Gg: ASbGnctvucj3t3ILo9+E36N5LGZ4B4D6YjGhZhNEFsnV45iYCp3CGpehXzqLT3buN+C
	6VBqIl3Tet8emh1ooDdt9DmrYUlinZ16BO38qzk28l77suziXzsXpUXX7Qp2Wczm3IEor8gazmy
	n+fhQ2fsXPUXzUaTOOX3gSJkPILiXEPyH1rBuOnXxLMp3WS8WTvwM/++IDijNJDBxAZZtUfy2Tc
	y5tyyZ1RsQqmcnIxyPfLhu5anRMJ0f8ewa1n8dFFu38nhLGf8K9WLp1y1GwvCpC952PRYgX63vE
	crmCYXi8CEHbMn0/bCNJMf6nEL0XOtfF0tNYnRgyzhabiiFe1pcHF02wT11wmttrcTTp8ptsF/7
	rx/GM8OwXB/4hDlsBDhVcJT8HdihW3KgAh7vaEvrByQ==
X-Google-Smtp-Source: AGHT+IFG2j1B5vIdNM+dOt6CECPa65tQ6vxHGK/kdmI/5t9vH+V5tW9j0VMhLNJ6m6uuevak0D2wTw==
X-Received: by 2002:a05:6512:128a:b0:549:887b:253f with SMTP id 2adb3069b0e04-553b6f50bdfmr2629332e87.51.1750087488959;
        Mon, 16 Jun 2025 08:24:48 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1dbcf5sm1564271e87.190.2025.06.16.08.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 08:24:48 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v4 0/5] media: uvcvideo: use vb2 ioctl and fop helpers
Date: Mon, 16 Jun 2025 15:24:37 +0000
Message-Id: <20250616-uvc-fop-v4-0-250286570ee7@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADU3UGgC/3XMyw7CIBCF4VdpWIsZoPTiyvcwLmgZWhaVBizRN
 H13aRMvMbo8k/n+mQT0FgM5ZDPxGG2w7pJGvstI26tLh9TqtAkHLkFyRqfYUuNG2pQ51gCl1pK
 R9D16NPa2lU7ntHsbrs7ft3Bk6/XZ4K9GZBSoaAyWCsAIpo9t791gp2HvfEfWTORvWsAH5YlKq
 BSvBSqs2A8q/lCRqKprZJUpZJHDF12W5QFl+q30FwEAAA==
X-Change-ID: 20250521-uvc-fop-b74e9007dd51
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, Hans Verkuil <hans@jjverkuil.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, Hans de Goede <hansg@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
X-Mailer: b4 0.14.2

This is a rebump of a 4 years old patch from Hans.
https://lore.kernel.org/linux-media/20210618122923.385938-21-ribalda@chromium.org/

It brings "new" helpers to the uvcdriver and removes tons of code.

The patch:
media: uvcvideo: Refactor uvc_queue_streamon
Is already in the uvc tree. It is here just for CI purposes, do not
review.

I have uploaded my working tree at:
https://gitlab.freedesktop.org/linux-media/users/ribalda/-/commits/b4/uvc-fop
which shows the differences from the original patch, this is mainly for
helping the review to people familiar with the previous patch.

The patch:
"media: uvcvideo: Use prio state from v4l2_device"
is just for RFC, the set can land without it.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v4:
- Improve commit messages
- Move prio changes to a different patch
- Add missing lock
- Remove redundant file->private_data = NULL;
- Link to v3: https://lore.kernel.org/r/20250602-uvc-fop-v3-0-a99e18f65640@chromium.org

Changes in v3:
- Refactor start/stop_streaming(): make meta and video versions
- Link to v2: https://lore.kernel.org/r/20250602-uvc-fop-v2-0-508a293eae81@chromium.org

Changes in v2, Thanks HansV:
- Fix typos
- Use start_streaming and stop_streaming for managing pm
- Link to v1: https://lore.kernel.org/r/20250522-uvc-fop-v1-0-3bfe7a00f31d@chromium.org

---
Hans Verkuil (1):
      media: uvcvideo: Use vb2 ioctl and fop helpers

Ricardo Ribalda (4):
      media: uvcvideo: Handle locks in uvc_queue_return_buffers
      media: uvcvideo: Split uvc_stop_streaming()
      media: uvcvideo: Remove stream->is_streaming field
      media: uvcvideo: Use prio state from v4l2_device

 drivers/media/usb/uvc/uvc_driver.c   |  39 ++---
 drivers/media/usb/uvc/uvc_metadata.c |   8 +-
 drivers/media/usb/uvc/uvc_queue.c    | 194 +++++------------------
 drivers/media/usb/uvc/uvc_v4l2.c     | 293 ++---------------------------------
 drivers/media/usb/uvc/uvcvideo.h     |  38 +----
 5 files changed, 68 insertions(+), 504 deletions(-)
---
base-commit: def55d9b22d294e47a2b4c9eb09a0e9faade7ae7
change-id: 20250521-uvc-fop-b74e9007dd51

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

