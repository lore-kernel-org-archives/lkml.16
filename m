Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAB01B040D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 15:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749223676; cv=none; b=fBhvPFCPLs6cocHoktrHvJJdjEtfdKgTz0lw5XBUpah1wB50m/Iznds4/oDZLrmlffz8Yg+9ll2VhXRpRQF8GK6zlzJHgvWn/r+/DFxHq74nAyEwdkGY8LuUcYpHw4ucLx6HCdn8U9VKU3Ng6FTETEscSdsb/CufyuizYWIaPY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749223676; c=relaxed/simple;
	bh=ugfrFncA70C9ZK4V8ZompiSzm3hFeJrKmH6Iw6tKOSI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jZYMUIa+j65v+D9QQgFbtybMKscphs6xPiXkcY9vpeGAvn4W9oSqjuBkE1QTAK0guq2RtsOQ6b8U2fNmv/6K1MjhNUSfgU+Cq3rBSY+ZXuHq4CzG1AqiqHndzUbiBtxaI2MhVS2Aeqg85CqVFZH0SoQ3kRXtBLQgzCUoKIBX8jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=K4ANQA08; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="K4ANQA08"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a50fc819f2so1756621f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 08:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1749223672; x=1749828472; darn=vger.kernel.org;
        h=content-disposition:mime-version:mail-followup-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HV+zyLjQ0HNvp2YJ2dyJWt9/49NJYivF2xYtOj/CuJk=;
        b=K4ANQA08WI1DrOwC9y0brXN6J2PnRCU8H+GHarAEZ/vzs85l1JsGe87z8FsqYyR6VC
         ohsE5Bkl1N3n4zgCgu7WZL0jQupsKFPCp3uPNyRwfU7yIxGoV1hL3f/AOvMP8YsVCO5v
         f1UkTEnNofkjfD55yYr4latgnV6BeW2BG0EsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749223672; x=1749828472;
        h=content-disposition:mime-version:mail-followup-to:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HV+zyLjQ0HNvp2YJ2dyJWt9/49NJYivF2xYtOj/CuJk=;
        b=st2iw6WUXds4BDwSKxMZYAXCCgcH5ApzZvAaIAtMQ0zZnzHYZ4VP7qAMEeckpwWoiy
         3Yvu/xHgZwi/xTynQZ1AfgtcUm+n42Uouyh+NH4MHqSh1ri3SgWhcwv4MGqxVH24GkeB
         thFVltG91LwaikNusXtSbHZEsmplK3NptQDwhUs//jBEMRgEqLoRgLnpn+KnvfSw/3in
         y7V2Zt+zGnLybfxPZn9IDz83vdBOndyFfOXysb0ftOnYbXlyy4GweR+4fkCVsH+QRLt1
         gbOG2P10o5ocy5NwOYz5C8bX6WerBhdLc1PNIzk2J6LlyEuetRELU4zVEzKRDF+GxYJy
         QJUw==
X-Forwarded-Encrypted: i=1; AJvYcCWmo7/sQjq9JDAR7hbgQ3KYHlwwF9y5HotpJIY5J7C4fJoArIHwJc6xmxhi6DQnK/tHjf1C6ZB1SJLt3VM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXcUr5QrEPhv6e1pFNltRzRmnCcu2oVaLZsmdNA16L5MeRpQYz
	ZOR0FyIl7pUVl0obJwcSZtABI0wvQHTZqvVbFxzMTZAHs8H0o0md//1Iz2bdUs606hKYfoQYMhy
	CKuTU
X-Gm-Gg: ASbGncssx5CBJVwj6MJrSziwIt343FQz9oTntG6bHT4NdmRR2uJhAr8c34IBPyux2fZ
	0uZ8yqYBMKPPSbbQ+s1VbkWuvE5pbqiEK8nBsEfDpZgd1OxYPC6PDbE3nG696zBRWm5igR2AIPK
	uufrW60RXa9m9kp/7nwZMcC/r8Bmnpmn8QH9j6WRq/+LwhQOiUfE4ipToYu55x9Fe35MMagc5eH
	+55ssmbCB02xvEIxrl8GYGUOo1iotYas1V9YDDXmK1ojYK1itQSoaE2r2qHDWWtFWDdOFbQOfv0
	hoos3RYvgVAoiFU+LmHPWhWZpc+r0GzlUOtKfr7beVU2RmIi64fZCzjr47LzgsmHk7yRq8HGag=
	=
X-Google-Smtp-Source: AGHT+IEcaPeLT7DBJWnAMobQr9n3IUdJGVV6M4ddpXjS8Lw4C+oT20Nu8NffeHJtFVcrfNR8SyTNMw==
X-Received: by 2002:adf:ce8e:0:b0:3a4:f513:7f03 with SMTP id ffacd0b85a97d-3a531cafabdmr2549452f8f.44.1749223671948;
        Fri, 06 Jun 2025 08:27:51 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532463905sm2202708f8f.92.2025.06.06.08.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 08:27:51 -0700 (PDT)
Date: Fri, 6 Jun 2025 17:27:48 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Dave Airlie <airlied@gmail.com>,
	DRI Development <dri-devel@lists.freedesktop.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [PULL] drm-fixes, yet another one
Message-ID: <aEMI9P_NF-K-_sLv@phenom.ffwll.local>
Mail-Followup-To: Linus Torvalds <torvalds@linux-foundation.org>,
	Dave Airlie <airlied@gmail.com>,
	DRI Development <dri-devel@lists.freedesktop.org>,
	LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Operating-System: Linux phenom 6.12.25-amd64 

Hi Linus,

Another small batch of drm fixes, this time with a different baseline and
hence separate. Also due to this context conflict in ivpu with what you
have already, linux-next resolution matches what I have:

https://lore.kernel.org/dri-devel/20250606094711.4b9909af@canb.auug.org.au/

Cheers, Sima

drm-fixes-2025-06-06:
drm-fixes for v6.16-rc1

Drivers:
- ivpu: dma_resv locking, warnings, reset failure handling, improve
  logging, update fw file names, fix cmdqueue unregister
- panel-simple: add Evervision VGG644804

Core Changes:
- sysfb: screen_info type check
- video: screen_info for relocated pci fb
- drm/sched: signal fence of killed job
- dummycon: deferred takeover fix

Cheers, Sima

The following changes since commit 0ff41df1cb268fc69e703a08a57ee14ae967d0ca:

  Linux 6.15 (2025-05-25 16:09:23 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-06-06

for you to fetch changes up to 6f7e234f74caf5f8863bbca51b1b135d0736b0b3:

  Merge tag 'drm-misc-fixes-2025-06-06' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes (2025-06-06 14:38:51 +0200)

----------------------------------------------------------------
drm-fixes for v6.16-rc1

Drivers:
- ivpu: dma_resv locking, warnings, reset failure handling, improve
  logging, update fw file names, fix cmdqueue unregister
- panel-simple: add Evervision VGG644804

Core Changes:
- sysfb: screen_info type check
- video: screen_info for relocated pci fb
- drm/sched: signal fence of killed job
- dummycon: deferred takeover fix

----------------------------------------------------------------
Jacek Lawrynowicz (4):
      accel/ivpu: Improve buffer object logging
      accel/ivpu: Use firmware names from upstream repo
      accel/ivpu: Use dma_resv_lock() instead of a custom mutex
      accel/ivpu: Fix warning in ivpu_gem_bo_free()

Karol Wachowski (2):
      accel/ivpu: Reorder Doorbell Unregister and Command Queue Destruction
      accel/ivpu: Trigger device recovery on engine reset/resume failure

Lin.Cao (1):
      drm/scheduler: signal scheduled fence when kill job

Michael Walle (1):
      drm/panel-simple: fix the warnings for the Evervision VGG644804

Simona Vetter (2):
      Merge tag 'drm-misc-fixes-2025-05-28' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-misc-fixes-2025-06-06' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes

Thomas Zimmermann (3):
      dummycon: Trigger redraw when switching consoles with deferred takeover
      video: screen_info: Relocate framebuffers behind PCI bridges
      sysfb: Fix screen_info type check for VGA

 drivers/accel/ivpu/ivpu_fw.c             | 12 ++---
 drivers/accel/ivpu/ivpu_gem.c            | 91 +++++++++++++++++++-------------
 drivers/accel/ivpu/ivpu_gem.h            |  2 +-
 drivers/accel/ivpu/ivpu_job.c            | 14 ++---
 drivers/accel/ivpu/ivpu_jsm_msg.c        |  9 +++-
 drivers/firmware/sysfb.c                 | 26 ++++++---
 drivers/gpu/drm/panel/panel-simple.c     |  5 +-
 drivers/gpu/drm/scheduler/sched_entity.c |  1 +
 drivers/video/console/dummycon.c         | 18 +++++--
 drivers/video/screen_info_pci.c          | 75 ++++++++++++++++----------
 10 files changed, 158 insertions(+), 95 deletions(-)

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
