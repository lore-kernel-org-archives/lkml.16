Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25512820A1
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 16:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744648135; cv=none; b=acHwnmGRg9dHaBUt3gZ40IlMMryBkASnznhPVd40xvzmK7SeG4WEINxNTGozaUP8zsEW1urZkUCy6qur2Aur+R3+20PajqWHhhSssvVPS2OUU5/N/mrjSwFOK+Z205SmfkXHNs74r8r6qWgy0dN4idsmenDfylvGSloBH+vFQHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744648135; c=relaxed/simple;
	bh=bOVQ3FP5ypXMPfKDM06/0e3rBvJrdaxgXSa39Q6f0Dk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=rVlMu7osggXunvFLssikVKN4r5jfeNQp2rC05k4M2qMubK8Fcm8d4IhfwCh6gDz8Mj3IM4oCNnkUzk06EpETU6J0yngwKDbJX/RzGvFG7mageBS87Rs5/+2dWgzis21FnJg+7sH7tCI77e9tyy6Nh51IgsBXe1b0muDn3mggU0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bP1lqaoc; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bP1lqaoc"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3055f2e1486so6834727a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 09:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744648133; x=1745252933; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iXLUJ61f1yTddrehctN7EiKQ8FoTlBs0L4ffrGV+118=;
        b=bP1lqaocE/v6nohPUHzv8CnQGU97Vye2Lgr/BSVw5IKsV9mBHCKH8l1CljxnHX0xAu
         jPAC2Rx2RlW4esqoxfJLTJwKrQ1hEAl/5B3CSlkKiTYC20dokNyGRuH37SpZ1b2k3DLF
         PwjYrlRBiVnAp/vCvw63R+R+hNZ68jaYkHrGckq1g018Q7QsyyXXqCBNFBcXcn0mfU0O
         R57eHcGmXAAYDJCIwTnOrlJA7tmBLqNFESTG2yOolU9KIYUhZYJGilQn7Mbw7555Hj9p
         6qguGgy/EvC6xVqKb+W5uc1sggNrDbp+LVE+hv1O3ae68wJnN7lZ5pn05unQndLjsR6w
         fyzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744648133; x=1745252933;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iXLUJ61f1yTddrehctN7EiKQ8FoTlBs0L4ffrGV+118=;
        b=FTyVSjz8wEpnswSXyAWL/gkhJ/uTIJx0zjWBvO3Lcdh/DmxAQI8NT/uYOVLNV0GMWb
         8cpxtlQFVkmPXdRzn/joM9MZbA94nmgDN6Ubsns7LJO1fwOZ7tIU9S5qnEOU+bX6etwA
         4dc1ksSHlYblkQz/JUaq+Ou/BKNGFHQXDtebWjqhVij5TQfb39A4F9qb0O4q5ANsrnRw
         En+LDUjnHRc5xkCbG0Xf2P0PeJMlNjx6qvvugCjHFGBwImjNiZiF1L26qvSBGMKL5eL5
         +UxJejQ4S1dOCeECXWoJt+UDqNG3UYHntUs3xUV+O/kguEmX+vD1nsC+yKBrvXBQy3Sn
         lebQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzvjBtaQPdp+Lx/B9lZrCG85UX5KZdXyj/u7/zjCEgNWBml5iwiHqdz5YlquX9WmcBsM4iTlyhKnDDd30=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnra++MrS9fphX0Uz0H7Ov4Xv7ak1fFH+puRn51/gLQn8yjvgM
	QVilOdUH/Y/LZkYKi0HFiR1GJ+jNH6dzGKeNPkZHDHx40vdp6TWO+pmOnhjk7uh6bIozPNyjxx7
	KzEbJOl4LqQ0X9Q==
X-Google-Smtp-Source: AGHT+IFKAHwaGD+uH8j/e6PvAJIsPBttChl+k7IeBf3yzmFDQvIZDYfCqllIFg5WytmY833AwgULIReL/PLMlE0=
X-Received: from pjbsi10.prod.google.com ([2002:a17:90b:528a:b0:2ef:7af4:5e8e])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:524c:b0:2ee:ad18:b309 with SMTP id 98e67ed59e1d1-30823633edemr18416835a91.3.1744648133130;
 Mon, 14 Apr 2025 09:28:53 -0700 (PDT)
Date: Mon, 14 Apr 2025 16:28:41 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250414162842.3407796-1-tjmercier@google.com>
Subject: [PATCH] cgroup/cpuset-v1: Add missing support for cpuset_v2_mode
From: "T.J. Mercier" <tjmercier@google.com>
To: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	"=?UTF-8?q?Michal=20Koutn=C3=BD?=" <mkoutny@suse.com>, Waiman Long <longman@redhat.com>
Cc: "T.J. Mercier" <tjmercier@google.com>, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Android has mounted the v1 cpuset controller using filesystem type
"cpuset" (not "cgroup") since 2015 [1], and depends on the resulting
behavior where the controller name is not added as a prefix for cgroupfs
files. [2]

Later, a problem was discovered where cpu hotplug onlining did not
affect the cpuset/cpus files, which Android carried an out-of-tree patch
to address for a while. An attempt was made to upstream this patch, but
the recommendation was to use the "cpuset_v2_mode" mount option
instead. [3]

An effort was made to do so, but this fails with "cgroup: Unknown
parameter 'cpuset_v2_mode'" because commit e1cba4b85daa ("cgroup: Add
mount flag to enable cpuset to use v2 behavior in v1 cgroup") did not
update the special cased cpuset_mount(), and only the cgroup (v1)
filesystem type was updated.

Add cgroup v1 parameter parsing to the cpuset filesystem type so that it
works like the cgroup filesystem type:

$ mkdir /dev/cpuset
$ mount -t cpuset -ocpuset_v2_mode none /dev/cpuset
$ mount|grep cpuset
none on /dev/cpuset type cgroup (rw,relatime,cpuset,noprefix,cpuset_v2_mode,release_agent=/sbin/cpuset_release_agent)

[1] https://cs.android.com/android/_/android/platform/system/core/+/b769c8d24fd7be96f8968aa4c80b669525b930d3
[2] https://cs.android.com/android/platform/superproject/main/+/main:system/core/libprocessgroup/setup/cgroup_map_write.cpp;drc=2dac5d89a0f024a2d0cc46a80ba4ee13472f1681;l=192
[3] https://lore.kernel.org/lkml/f795f8be-a184-408a-0b5a-553d26061385@redhat.com/T/

Fixes: e1cba4b85daa ("cgroup: Add mount flag to enable cpuset to use v2 behavior in v1 cgroup")
Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 kernel/cgroup/cgroup.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index 3caf2cd86e65..ceedaf47d494 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -2356,6 +2356,7 @@ static struct file_system_type cgroup2_fs_type = {
 static const struct fs_context_operations cpuset_fs_context_ops = {
 	.get_tree	= cgroup1_get_tree,
 	.free		= cgroup_fs_context_free,
+	.parse_param	= cgroup1_parse_param,
 };
 
 /*
@@ -2392,6 +2393,7 @@ static int cpuset_init_fs_context(struct fs_context *fc)
 static struct file_system_type cpuset_fs_type = {
 	.name			= "cpuset",
 	.init_fs_context	= cpuset_init_fs_context,
+	.parameters		= cgroup1_fs_parameters,
 	.fs_flags		= FS_USERNS_MOUNT,
 };
 #endif
-- 
2.49.0.604.gff1f9ca942-goog

