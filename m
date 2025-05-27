Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA9610FD
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 22:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748386659; cv=none; b=aAL2oQ4hFRXKhyTWfSXpIXRG74v94vbDcAa5ITEZWNuIBDHu/MW2mAbzfeD8GUXYE9xyte8Bm7AwXgBGkHU3liEV7jn9iUyzPdwCblCJIFC0gKNdpYWaLaFYZHkOfCnDR8TSgTNbX2DWqiYM+FspCQGLpYkrTA38fYIs/P+l6rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748386659; c=relaxed/simple;
	bh=xxZBrAr7xuLxFWpQoPvGCikqZd+FmR7ItSb67tOws3I=;
	h=Date:Message-ID:From:To:Cc:Subject; b=D7DjdEhRNOcUT8h+VqBRUvK+TBhvAHyNaJGG9KCkKNsFTIEpJgW7vLsHTw7QlHNj8DKlFQ2g5q6nEbmp4cRmJjJFgDIr2h9W3ZbH/MQxpJcXYuYsyU5xZpu0QxZ26T29skg8lvk0nek3rdbNHiPnjMwvLCGyVoTja6TMbdc2Ycc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=Y74NfYzn; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="Y74NfYzn"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c53b9d66fdso511144285a.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 15:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1748386657; x=1748991457; darn=vger.kernel.org;
        h=subject:cc:to:from:message-id:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GvY+J8VouKuyfHSeDGrMrPhRulPXXQ9kF4LDLPXFzhQ=;
        b=Y74NfYzn84JiXU47ZqJuV6/n+U8ikoo9NBnig9ooHR8YTM00wuotHIXmPGwHN+uoxB
         /mVtR7Ob8jUQAKWz7fMmeDZY4iFvmPX8/4pX0Vj/4FGssv97fjwbgMWUUwxI1agAgI6V
         iTSKbWSUjq5bKKDYlOKI1THYfLIprh3xdxO5zm4ls3VY0Fe8wseZK4satzgm1bkiOnsU
         eyljXYoNUitgxydAwNViNWfVSZrp3zLkwAouAYt+vVujfHL37V4ipH6UiIwUxrT7WxJs
         JyBiguV+exKGFUHdjCvGAb/El5rz69pr7JaDQEuL7/vfRiP7/QbCSFk+gTB3k9VhcAjy
         4G0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748386657; x=1748991457;
        h=subject:cc:to:from:message-id:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GvY+J8VouKuyfHSeDGrMrPhRulPXXQ9kF4LDLPXFzhQ=;
        b=SianWz4zkAncu5We8KdZPa/OdxQEEGeSl7JQEiBE5I3tgb79Cczgy9IwtjG/TKjF/j
         HsyZ9+GhLs7xyzqSXf5vcK0/3AgNWlovjXu8IOct5otEy4qKWcMt55th5dLPU//qfPav
         2CWiWB5V74Krh/auouFnqljH1aoGl7niCcqcheLB95Ig7eL0GJ4JNW1WyUXi0yE2hi1S
         nnm156bH0m+DLbOp3T0Hhs0XICvLf6f9sBwa4h9DVeRPl2Tnzh+94cuVPlezTJOVF3Yh
         CzKCWuZjE3o7O1JyGzHhhh0PYKs5TwmWFLcXUMuHtD4aGlXnD3MJmVAmSwByLaoq6m6Z
         Apwg==
X-Forwarded-Encrypted: i=1; AJvYcCXuv+5yZmDy1M4uCZOsHxi2Oxuuk54shxjpvmIZOYQCMSyN3kyg1Nd4bLb5v8tBj/Gi8kyY1ygJQVxr2E4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRtqa0qx+oiS+hj6w64ZL9klwhVK7VuHyVCE2UH8VWM5XwKE7O
	ZLJe7PQvcZFQgcQOl/MtzlpC8cIuWrE4ARf0EYTmk23iQQB78mS8wBw42v0f+AT2KQ==
X-Gm-Gg: ASbGncuUlFYaWYy9UY3mEqvdFMJhLE0V5ogYSihN60nXhJs+AHPjIrL8kGCepBWCgaD
	5ry7i/TKkvRHpHI7VZm7feAgYbxblhpiL8sRuffsVkjPcJ5aVj6quxR0HGD2jYfOigPP50U/ohf
	8KQqIZnhOt4zBCAuONM2kbF6+nUvmkZ/+cGboZf92wYQ9ALMeppVXQWXEzTkjn2TfmFJRoVgN9+
	p40sA4JtjTPGSdxJPYHosY8vF2Bw6ImcqHudEi5iHfrkx/eRZHoXjy9tlJqLj3uTXVyb2CqDhxB
	Y5HyJbn9OQSDoZAqFXPmX3piInSwmfrAf0K23FNGbWC/pBSNFxXsJL2HrvUuLbZr/EqFgIDNl7v
	xZx6DPP6lwXQsHeusSIkM
X-Google-Smtp-Source: AGHT+IHef+JzAiRFgd4pUHXsZSWyWRQzXidOWBXH1Bdf+wI/wJpe39G5qNeUjzYpkwEeDloHQNMO8w==
X-Received: by 2002:a05:620a:2544:b0:7ca:f039:7365 with SMTP id af79cd13be357-7ceecbbea5dmr2632357085a.8.1748386657020;
        Tue, 27 May 2025 15:57:37 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cf19d9785esm15817585a.99.2025.05.27.15.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 15:57:36 -0700 (PDT)
Date: Tue, 27 May 2025 18:57:36 -0400
Message-ID: <c033219926c0701369d6477cedda170b@paul-moore.com>
From: Paul Moore <paul@paul-moore.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] lsm/lsm-pr-20250527
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Linus,

One minor LSM framework patch to move the selinux_netlink_send() hook
under the CONFIG_SECURITY_NETWORK Kconfig knob.

Paul

--
The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm.git
    tags/lsm-pr-20250527

for you to fetch changes up to 74e5b13a1b0f10c5a5c6168f6915620a1d369fae:

  lsm: Move security_netlink_send to under CONFIG_SECURITY_NETWORK
    (2025-04-22 15:34:58 -0400)

----------------------------------------------------------------
lsm-pr-20250527
----------------------------------------------------------------

Song Liu (1):
      lsm: Move security_netlink_send to under CONFIG_SECURITY_NETWORK

 include/linux/security.h |   12 ++++++------
 security/security.c      |   36 ++++++++++++++++++------------------
 2 files changed, 24 insertions(+), 24 deletions(-)

--
paul-moore.com
