Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A0B1F09AF
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 15:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744731425; cv=none; b=hZlFE1KZj847JGzwwcgSTK29c+SN+QyQcSengmQnZoZTzgiZrFj/uGG5izgEimCWKI8teO6E6uNSTRSglxlzr7X9B8EdATvjnGiXxQICV40V72a64BeFAadhmgU7X9j/Z1JqDZq1t5plpFbjDYtD9e3E0SbcGL6lG6EEJTVVfA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744731425; c=relaxed/simple;
	bh=9AN5YYkQWU9Cf/SG9P4lQZtbFH8ZH2xxEyueJWZ+KO0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d+G+tJ/epM/uRNXaAaOKVYyYrjAXB8XqzXlfnXw61FVQJmpKnrjYOGLf1VExzovdcGLXnZ9cAWFjnO9RI7jXSLau2Gv10wv1n+xIP0q+ePChN/apALEjgIlLruhRlChQtXcPlkwRUZIwxgXkWGW8FXD734mix77AoZKUI65f6iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iiv0QQfA; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iiv0QQfA"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2260c91576aso48766315ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744731423; x=1745336223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TWa/nloxSXR1s8/zMJw77Cy2Iro74J9jfm/KJ/Ag0ok=;
        b=Iiv0QQfANRwDDHKKdMa+7gd10JhgVUz67klTnTvfSnM0Y4jollbu6ovaVpN25Yivaq
         0I2TjuOU3M0HheFCKSyf+ySUiKzN0jQam0DqtAyp0vZvrMunhsJapNv4Qu/+xJpP19Hv
         0Wb0NbZO7zCx7+Gf1bBoKGUfdPDplVTzIy3P5nk2OE8TwWb1e9x22WS0Bxtb7zf7s0iA
         wvgZr9HvLdhSNgelG1bFNdE5cgFJ4Cy4y2u7Z5C0njxbQ3wN7l49rP9ksCsgv/YjulB4
         L+j0bBRySvMukmqPFH/MgkFunmFkARlLHoZD+VKY/W2bbGfCPobAjBx0Mzo8HENMiy4t
         bjOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744731423; x=1745336223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TWa/nloxSXR1s8/zMJw77Cy2Iro74J9jfm/KJ/Ag0ok=;
        b=maYEdXpGGKu5R6E4OzISq/yQ1j5+WIQbbKpHU3If402qO3cgBjDVwGUm3/UJKi0SIM
         uAjs9e4EY0bAwjEeMDH1fSudaybo54QWMPlZrQltfXSzZcFnTY2cyj5T1PIAAjYZQ284
         ClcyWQtBVgoNFWJOIyrrOaZhArBmHPEVreCDNitawIG7B41Bz+k5bx7goEXPKjWYflv6
         NW65UESBT4QkO8iMufJ81sRMp3NVHDnJPOqBdbvAN3SoyJU/0cUfCWrMpfsaaF/L1p6t
         YYi8oWqgdj/2sgne0ixLahiMIe1WaoRukWaialAArA8nMYRqGUH5+q1bQa9ADV7zliIx
         w6Sg==
X-Gm-Message-State: AOJu0YyHsHk4uawxqk122ht4dOWBQzzQ84G0CoWuvz7NHJn4bqef6smg
	TH7d20+MBPHDwRTZZEDYMOy8LlF6wOj80x4vbwbDBP7ltrVYa0A/u9S6PRrf
X-Gm-Gg: ASbGncsWkqxqrvpvoXlfUC5BVeFqzO/2h2QqJixCbDzrAXk5sF1O3KvpDeuvz+LkIrB
	+lbGktOLuAXBiKyldez/o7TYX+5mXtoBG4hfgOwhilrjsLwS5lKqrGnjZVfxUsQEwRGVijW2hdh
	rbUuWUvYIEz2xCgPudtyy3KC4dQiqZgSdgl8RiV8rebFzPrJpWM6Zrca/G0ImSkWWjo7TyKVKQJ
	52GYQDgPoETxVDfNXJcXXwbiIS5rdpwfFZbGk5H+7D+rMIYYtyC+d2F39srKJzMXaPSa9XtbNfn
	bpT0mRVIbs8Sc0l2XQuPYZ9yulDKOEudFH5yBptolNld5jap1bY=
X-Google-Smtp-Source: AGHT+IFRlH2337Ek0bz/H7/KsKnA80RxDLNNrRMc4W6Bdbz+aOgbrh6ecRG7aBVQbppWMKTeuGA7FQ==
X-Received: by 2002:a17:903:2b07:b0:227:e7c7:d451 with SMTP id d9443c01a7336-22bea4bf842mr267131125ad.29.1744731422834;
        Tue, 15 Apr 2025 08:37:02 -0700 (PDT)
Received: from VM-16-38-fedora.. ([43.135.149.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccca66sm119207245ad.252.2025.04.15.08.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 08:37:02 -0700 (PDT)
From: alexjlzheng@gmail.com
X-Google-Original-From: alexjlzheng@tencent.com
To: gregkh@linuxfoundation.org,
	tj@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jinliang Zheng <alexjlzheng@tencent.com>
Subject: [PATCH v2 0/2] kernfs: switch global locks to per-fs lock
Date: Tue, 15 Apr 2025 23:36:57 +0800
Message-ID: <20250415153659.14950-1-alexjlzheng@tencent.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jinliang Zheng <alexjlzheng@tencent.com>

The kernfs implementation has big lock granularity so every kernfs-based
(e.g., sysfs, cgroup) fs are able to compete the locks. This patchset
switches the global locks to per-fs locks.

In fact, the implementation of global locks has not yet introduced
performance issues. But in the long run, more and more file systems will
be implemented based on the kernfs framework, so this optimization is
meaningful.

There are three global locks now, kernfs_idr_lock, kernfs_rename_lock
and kernfs_pr_cont_lock. We only switch kernfs_idr_lock and
kernfs_rename_lock here, because kernfs_pr_cont_lock is on a cold path.

Changelog:
v2: Only switch kernfs_idr_lock and kernfs_rename_lock to per-fs
v1: https://lore.kernel.org/all/20250411183109.6334-1-alexjlzheng@tencent.com/

Jinliang Zheng (2):
  kernfs: switch global kernfs_idr_lock to per-fs lock
  kernfs: switch global kernfs_rename_lock to per-fs lock

 fs/kernfs/dir.c             | 28 +++++++++++++++-------------
 fs/kernfs/kernfs-internal.h | 16 ++++++++++++----
 2 files changed, 27 insertions(+), 17 deletions(-)

-- 
2.49.0

