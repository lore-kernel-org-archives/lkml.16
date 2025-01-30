Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7001F1513
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 21:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738274312; cv=none; b=klFE/WMwN+RigQ5j9KRXSU+N8M+zX00kCkLcCcF9vhCUNNsvwJpkNRRN+gMXPu3mi+VEwBMry3GfiexKCDroed3Y4x2BSEW3q5uSLXy5i1aMILpigSJWwbkeiOJapiaPi9MhKl3j+iTdvHJIaI4lSq633gzOxlcidin3x1aj4DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738274312; c=relaxed/simple;
	bh=i84G3SmkD1FSn/qiCtc5Rh03DuaSUwH0up34eflh8ro=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=TM2eNrZEBSxWIs9V9FHIODhls1dJVBOTYPh09/oRdQM3Zn1E+Oc5nla2diyQeUlm8AWqroW3qrqV7sfhSkbbRAyAYreDCcl+ZCkJZaNDPTsHDV+NVn600+wql/uEUH2V5zFQmBlahbF0qXjQaXCqswvv+/kSsKVx5vo74WYgF/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SCDfb3fG; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SCDfb3fG"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ef79d9c692so3370259a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 13:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738274310; x=1738879110; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sP+PSXxGrOmF+G6y4EyqF6nMuKUGJmNHFz94ds/u0fQ=;
        b=SCDfb3fGuUvhHA0RUWsiQ/SWbiFIhRgaHK/cFuLMSBo8cSskAmpNx5VLqjmSt76hy8
         TIOWx3UrKeUDIaYUX5VlMWPgfN+idLmWZdk9x2FzTkOE+6CJ1OzAZNqZJCUYEdYQGJke
         cdgjkxpZfoXqqsJR9OSffCDfOSxwZY9i/ZYdxjx5f4VekmmFbCbzj73sIMwSwEy1U+Am
         uAJ/9JW2CewtED6Y3j0DVOQsRaBiLMtFh8pPsF2dwrNsWY5pVTQvbT4KPxm1m84fRhJa
         5bwXRA17ZrkYnSBEFG94SZJ7cwqftTgKFvcIuyYBdP2JlQIEPdPwc7SvOxhTsj/NM2eu
         gjsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738274310; x=1738879110;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sP+PSXxGrOmF+G6y4EyqF6nMuKUGJmNHFz94ds/u0fQ=;
        b=oiwmY3nxwcq8r7RW522Ak8YtJ4z9nJg16tx//UZWRMxDdTX+EZabmsKNt06NAUM1RE
         v+kq685bNzz++QGDsENA3fVk+KmhgSieQI685PHnQgLEHidja7sYGMUbS/khpBXo7XEz
         eNNMldTkYgL6bW/vfIAuD45BQpL7P2lDQXXmOWNTfh0IcgY4ej10VByWjgJG2KQuNPnw
         qH3EUAboKZdwfdM4NIfwVrp9RxSDhHiCh9AKJN6IA1y/tT0XnSwrchGs3YbshjL2+Hzd
         nz6r0Ub2pJgn0ga4+cEHfniWQ6l214WHYT0GHoN5q9agyNfE+rytkOJ9LFHrCwzqOlFP
         aI7Q==
X-Gm-Message-State: AOJu0YxO3BTToGDV1Wml75aBGijoq7nbs3DwZEpq/UpDlmwNDcEo00xI
	rFDqA3W6T7W3x3rLuaYAR4MvYnUXj33g4KVMfFg59WNyWpiOBZSh1X8V9YKtYeuwrZvWPG6zXXH
	xd+xwkwafxw==
X-Google-Smtp-Source: AGHT+IGl1w1MKzWkKbM7ScftD/Z+sWuD+nXViJBNKnkiSS+kF4yMpnUpSO6IRT4QJWmuw8vNVTEla8I2jPf3nw==
X-Received: from pfbbd35.prod.google.com ([2002:a05:6a00:27a3:b0:728:e508:8a3e])
 (user=cmllamas job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:218a:b0:725:eb85:f7ef with SMTP id d2e1a72fcca58-72fd0bffcf0mr11984683b3a.14.1738274310017;
 Thu, 30 Jan 2025 13:58:30 -0800 (PST)
Date: Thu, 30 Jan 2025 21:58:22 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250130215823.1518990-1-cmllamas@google.com>
Subject: [PATCH] binderfs: fix use-after-free in binder_devices
From: Carlos Llamas <cmllamas@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, Li Li <dualli@google.com>
Cc: linux-kernel@vger.kernel.org, kernel-team@android.com, 
	syzbot+7015dcf45953112c8b45@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

Devices created through binderfs are added to the global binder_devices
list but are not removed before being destroyed. This leads to dangling
pointers in the list and subsequent use-after-free errors:

  ==================================================================
  BUG: KASAN: slab-use-after-free in binder_add_device+0x5c/0x9c
  Write of size 8 at addr ffff0000c258d708 by task mount/653

  CPU: 7 UID: 0 PID: 653 Comm: mount Not tainted 6.13.0-09030-g6d61a53dd6f5 #1
  Hardware name: linux,dummy-virt (DT)
  Call trace:
   binder_add_device+0x5c/0x9c
   binderfs_binder_device_create+0x690/0x84c
   [...]
   __arm64_sys_mount+0x324/0x3bc

  Allocated by task 632:
   binderfs_binder_device_create+0x168/0x84c
   binder_ctl_ioctl+0xfc/0x184
   [...]
   __arm64_sys_ioctl+0x110/0x150

  Freed by task 649:
   kfree+0xe0/0x338
   binderfs_evict_inode+0x138/0x1dc
   [...]
  ==================================================================

Remove devices from binder_devices before destroying them.

Cc: Li Li <dualli@google.com>
Reported-by: syzbot+7015dcf45953112c8b45@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=7015dcf45953112c8b45
Fixes: 12d909cac1e1 ("binderfs: add new binder devices to binder_devices")
Signed-off-by: Carlos Llamas <cmllamas@google.com>
---
 drivers/android/binderfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/android/binderfs.c b/drivers/android/binderfs.c
index bc6bae76ccaf..94c6446604fc 100644
--- a/drivers/android/binderfs.c
+++ b/drivers/android/binderfs.c
@@ -274,6 +274,7 @@ static void binderfs_evict_inode(struct inode *inode)
 	mutex_unlock(&binderfs_minors_mutex);
 
 	if (refcount_dec_and_test(&device->ref)) {
+		hlist_del_init(&device->hlist);
 		kfree(device->context.name);
 		kfree(device);
 	}
-- 
2.48.1.362.g079036d154-goog

