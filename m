Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D38212B3D
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 19:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748547591; cv=none; b=OMLQ0oRIGSck0hxEIW95V/mDJiIEgItEK0GSTAHoGZucfhHMorMPvEbSYIMNbHtTXCHlm0GtgOkjJXZ8pNrfY/SRVKcS8fSRcu2Enly0uB9YTAUiyHiIgXC7lVxWqJYRX8T86UUZgqS2XIqWP3t9DnZ9Dtf1z2LL/PyRU7NGsOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748547591; c=relaxed/simple;
	bh=CJsJdjuuPxWK6z9NhGx3MDZdBsvjf6lAlu3yYyFCa3U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a8nne4/0axyR9KLQtZOCiIyV+zsmZ2WInD9v/BLiZFEIPlSwlA15H74v8UwzXM/sS/oxOiTmkgryLYpgqH09cuGUJ0jJ/GkuWiz3Dsy+LmBTR95B/tJvBt7TP21YMrajYibLMLuqUricZMIUV885WRtdIqgALF5BplsL0ektn90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=1N+Nz9kG; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="1N+Nz9kG"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4e45bfb885cso779171137.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 12:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1748547588; x=1749152388; darn=vger.kernel.org;
        h=content-disposition:mime-version:reply-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2MyQUKE89py6Mp8f+N7LZkPxPE8Udm70Tofr4wuLXJ4=;
        b=1N+Nz9kGl8Y8pP1ebYRzGQT4GeEZ8DBs0LGAWrweeMI6OVRyJzOxr/cAs4vofFhYj6
         K9ZA06aP0w2NJ2s9jqX8fBhm0W8UXJ6dcMUOo+aVwVaTphzgygP+Gu1faQQACoa+cfmz
         ZqoxFti03EZShOcabimA+Y+PKMtU3Zy2lUYsGlRRpqS/EKqhI1pOtqNMfpEuTPVBQtJ0
         bMSBH/hvUgNNc1LkxfK/NuAYfORpYt1r7PIJeqIouRyZvCSkBIbelggp2E4Bd0KBoNf4
         sZpf32eKHKKTdUbP7SXj962vMZ1frsrZt6+IukG+JCxhQeKCL5gGG5ISMzsuYKSEoE0Z
         qKCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748547588; x=1749152388;
        h=content-disposition:mime-version:reply-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2MyQUKE89py6Mp8f+N7LZkPxPE8Udm70Tofr4wuLXJ4=;
        b=gEVBIifkVj1oBVqzuVQgemIHhc+RW6Ih1d/kCA/vdDX1p9hKNtVQXqCfR77A79DSOA
         /99yZjz7HIUgHt2d2vUYH3vek2FYd3wAXYSsfx8K5Q8+ScGrWN8+SK67aot0njNN84y2
         0gTSdo/sBEHnY9qMORhjmqkC2XvXB0U0mpWsb9GaW0djD8agBmBH1hu40hi9TOvQFljj
         d7UcptAQKpaZm17TaH9c5/nEd44dJBDvQvJR5pyzprnhbx7/ejBbwvfUixI8GFPmlsMH
         kq4Z24rT/yKY2/hChhue4ZyszyCwZbCxfbcKOhiOS42bq3BZB9jjinBudgcl8qeGHsbw
         jI2g==
X-Gm-Message-State: AOJu0YzoUkjUrvjpolOf3/2pE0h/01omzqmgCSfpT7fGZXJi5atQVgY2
	dfPSxPLH5LjirPUDi7S2i2jVtgRb6R8zeHVQjY/WEHDMmjg1ZitiqHI3AuAIczHZDymsps9dPVd
	c9LVPmXk=
X-Gm-Gg: ASbGnctW0L/E2/Ydn2BTs52YU7kn1aEhiH135LLsMgnzUY1QMJJnSf17DGezXE9nIKx
	IkQn6c8lw4aHc93a04udzN4jVIW+669BXtugWCRjfeHMlYhf+RU8xb+yGYEoA6+KVXbiAvTFY4+
	WTfHfe6HQDF3mhwmMJIRZY17PCz2QvC15+wHUVYYYAmQsUI/Kc06I+l+jTDQm573f6oRATiEPga
	EwdbwUQdLF8Vw4UG8m2mk0igsA4q+QbtGTVpR2i58yhpl91jzX6WbyOBt3nn4EEm3RYwxZJJAEI
	NQsRNGBvA/4fcYk0AJklYoXbD4GTG4kLvGYdFdaRbGoEGNCSGC6BfSvd2XmGhy8tKA==
X-Google-Smtp-Source: AGHT+IGdrHQgYFU6u8YFI+tCMcMY9JvTL9ZtCL7yPAo5DU9bpNWdWksVMTzfwdYT482ibWhJ69ZuKg==
X-Received: by 2002:a05:6820:997:b0:606:26bd:7208 with SMTP id 006d021491bc7-60c4d79f8b8mr669492eaf.7.1748547577840;
        Thu, 29 May 2025 12:39:37 -0700 (PDT)
Received: from mail.minyard.net ([2001:470:b8f6:1b:f647:17e9:f6c0:dc98])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-60c1ebb00f9sm109144eaf.40.2025.05.29.12.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 12:39:37 -0700 (PDT)
Date: Thu, 29 May 2025 14:39:33 -0500
From: Corey Minyard <corey@minyard.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
	openipmi-developer@lists.sourceforge.net
Subject: [GIT PULL] IPMI bug fixes for 6.16
Message-ID: <aDi39ViU_FMFsgsb@mail.minyard.net>
Reply-To: corey@minyard.net
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 4f79eaa2ceac86a0e0f304b0bab556cca5bf4f30:

  kbuild: Properly disable -Wunterminated-string-initialization for clang (2025-04-30 18:57:56 -0700)

are available in the Git repository at:

  https://github.com/cminyard/linux-ipmi.git tags/for-linus-6.16-1

for you to fetch changes up to 08effa6b77f7dbb4727f811daef0f6085c0d63c8:

  docs: ipmi: fix spelling and grammar mistakes (2025-05-15 20:43:14 -0500)

----------------------------------------------------------------
Restructure the IPMI driver for 6.16

This is a restructure of the IPMI driver, mostly to remove SRCU.  The
locking had issues, and they were not going to be straightforward to
fix.  Plus it used tons of memory and was generally a pain.

Most of this moves handling of messages out of bh and interrupt context
and runs it in thread context.  Then getting rid of SRCU is easy.

This also has a minor cleanup to remove a warning on newer GCCs and to
fix some documentation.

----------------------------------------------------------------
Corey Minyard (24):
      ipmi:si: Move SI type information into an info structure
      ipmi:msghandler: Use READ_ONCE on run_to_completion
      ipmi:msghandler: Rename recv_work to smi_work
      ipmi:msghandler: Move timer handling into a work queue
      ipmi:msghandler: Deliver user messages in a work queue
      ipmi_msghandler: Change the events lock to a mutex
      ipmi:msghandler: Use the system_wq, not system_bh_wq
      ipmi:msghandler: Remove srcu from the ipmi user structure
      ipmi:msghandler: Remove srcu for the ipmi_interfaces list
      ipmi:watchdog: Change lock to mutex
      ipmi: Add a note about the pretimeout callback
      ipmi:msghandler: Remove some user level processing in panic mode
      ipmi:msghandler: Fix locking around users and interfaces
      ipmi:msghandler: Don't acquire a user refcount for queued messages
      ipmi:msghandler: Don't check for shutdown when returning responses
      ipmi:msghandler: Remove proc_fs.h
      ipmi:msghandler: Shut down lower layer first at unregister
      ipmi:msghandler: Add a error return from unhandle LAN cmds
      ipmi:si: Rework startup of IPMI devices
      ipmi:msghandler: Don't deliver messages to deleted users
      ipmi:ssif: Fix a shutdown race
      Documentation:ipmi: Remove comments about interrupt level
      ipmi:msghandler: Export and fix panic messaging capability
      ipmi:watchdog: Use the new interface for panic messages

Dan Carpenter (1):
      ipmi:msghandler: Fix potential memory corruption in ipmi_create_user()

Praveen Balakrishnan (1):
      docs: ipmi: fix spelling and grammar mistakes

 Documentation/driver-api/ipmi.rst    |  29 +-
 drivers/char/ipmi/ipmi_msghandler.c  | 761 ++++++++++++++++++-----------------
 drivers/char/ipmi/ipmi_si.h          |  10 +-
 drivers/char/ipmi/ipmi_si_intf.c     | 116 ++++--
 drivers/char/ipmi/ipmi_si_parisc.c   |   2 +-
 drivers/char/ipmi/ipmi_si_pci.c      |  52 +--
 drivers/char/ipmi/ipmi_si_platform.c |  27 +-
 drivers/char/ipmi/ipmi_ssif.c        |   6 +-
 drivers/char/ipmi/ipmi_watchdog.c    |  92 ++---
 include/linux/ipmi.h                 |  13 +-
 10 files changed, 584 insertions(+), 524 deletions(-)

