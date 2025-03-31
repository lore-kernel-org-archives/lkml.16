Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD672905
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 02:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743387625; cv=none; b=bkJPPURajmMZfHDaxr+2jOvpcyBII3gbMITFOuFUfjo9w9mSuWHN66RUWRmR3gdiUkNH1DAg3LI1v6qQH1QwiD6uCiQLJQKoRzbGs9H76usmvNsS35VvC1uO70U8OrdguMgGsUrEso9kGYjbjvv9yAhr+i2FS5xeyUBZqQ7G3t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743387625; c=relaxed/simple;
	bh=Vc3l3CSc7QBNedbq3Zp7ibwc4g4zCpNv2JGQXO0+gD4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=qPqv2Ob8IpL4eUjeWGxh5pce1pQtmQnY6BCnZdZTJ5fQXkFuUVgkdtGoKJ0dytN8TSnvAJyPUxttlqAEZ+/DJpp1YzwT68n5Z1Ci2lwxFqCDmL1+zvsLImNEq510iOSWZnEnIU2hEQhzaO6uQgTc8jY00y20m4FT6EtGBBC96bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dhavale.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1gnZUbl6; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dhavale.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1gnZUbl6"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff5296726fso10909323a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 19:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743387623; x=1743992423; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CE/nyia5DEOnQIZIUnbMXDCnBfii1l2JD0CpWO2H6MY=;
        b=1gnZUbl6YW44gByxPYW5oHheOvmHlKQwBuGRJD1lcnnODqOBVKMADjbbfQ5M2PU2oN
         Kq3zfZbudE/7x4KV5fwsyqXfKIVnQq/Qys7HoWB1gYjh84UkVJX3vekrkwZHADLtyLdD
         3nZZjsnWJglAtshr2aZrVlLm7nS1Z4SFMEwKvJ6Rwe9fbI80yoJ/8fVzmGLXKkKh9Rs6
         c7hLsghYEjr+Eizu6RjpPiNzUm+jGqZBs7veYdL64hD1iGjlqe4xbVQMTd3aARJOW88O
         Zx6+0SUHzRsyvqHJ1lADhDyafT7nxYWElqUpsupvwrvlbeUhSAxmbPWbxvlQToUJPBcv
         nruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743387623; x=1743992423;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CE/nyia5DEOnQIZIUnbMXDCnBfii1l2JD0CpWO2H6MY=;
        b=C/S+WfdVsVWhiPu+IeQu6SUD3OE+Ad8YyAxQWRBNBDb1+9LHitN5iVz3URIdPTNUwl
         OcGqaEW8hNTJGalaZwYpTr+ifxUifMpIxvp6htNwwCrgImxQLqTXXYleA2zeI90zjYSA
         nHzz0mOq46tJZcOdayOWW5mxTdbUFf1dKAzP7JlxRIblknSIjsa2lOi0D9XV2sB5k4np
         R/0G3mgw2i+JLZEBVJLoTFhQ0xkg6zn0nLHpiwUNtYj6UR1AWP5ab6VnDJfZ2V6BQxb9
         b1emuseJ/hkFsJnfB5wDIs8SrB8TaBr7WowVyGMtpoAnZEFzGqF31JfWO5q05EEJE5qk
         ol8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWOZ7mTqXsNR5Vwag85xRqy5ozhhR2wEaytvTR1QAE8ymiKfTteGLi25I0hLYoqyZwn84UeP5LJw97ZB3g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwybKZNyp3l5HaJpgRQj5hR2EjZtJ+303BgzTIYVZECUf2+DTbE
	hJwxbcNSRhEFcoyAvku0jDHFHeMGdNIVQZXcJVGikQ/O5MsB/GoY2Xz+ehUAjBkZ6BfBj7/GySh
	k1fArFA==
X-Google-Smtp-Source: AGHT+IHr5kzCuFJpX8RIEt+C13OGCbfgVGDGu5VAxthGCbZAVACvbaHVl3cvJRmLj2GVMsvQphxnC1sEjgqk
X-Received: from pjc3.prod.google.com ([2002:a17:90b:2f43:b0:2fe:7f7a:74b2])
 (user=dhavale job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1d48:b0:2fe:b774:3ec8
 with SMTP id 98e67ed59e1d1-305321471fcmr9826794a91.23.1743387622875; Sun, 30
 Mar 2025 19:20:22 -0700 (PDT)
Date: Sun, 30 Mar 2025 19:20:07 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250331022011.645533-1-dhavale@google.com>
Subject: [PATCH v1 0/1] erofs: start per-CPU workers on demand
From: Sandeep Dhavale <dhavale@google.com>
To: linux-erofs@lists.ozlabs.org, Gao Xiang <xiang@kernel.org>, 
	Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>, 
	Jeffle Xu <jefflexu@linux.alibaba.com>, Sandeep Dhavale <dhavale@google.com>
Cc: hsiangkao@linux.alibaba.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

erofs currently starts per-CPU workers on module_init() which is not
necessary. This starting of resources on cpu hotplug and unplug
shows up in Android where the erofs in built-in and erofs is
not yet being used.

Following patch moves the creation of per-CPU workers on the first
mount and they are removed when on the last unmount.

I tested this with erofs-utils test as well as running reads on
erofs mountpoint while running aggressive cpu online/offline in a
loop, withoutn any issue.

Thanks,
Sandeep.

Sandeep Dhavale (1):
  erofs: lazily initialize per-CPU workers and CPU hotplug support

 fs/erofs/internal.h |  5 +++++
 fs/erofs/super.c    | 27 +++++++++++++++++++++++++++
 fs/erofs/zdata.c    | 35 +++++++++++++++++++++++------------
 3 files changed, 55 insertions(+), 12 deletions(-)

-- 
2.49.0.472.ge94155a9ec-goog

