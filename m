Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0ED933DF
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 12:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749041407; cv=none; b=PdB1eBhIP58Rh9a07hqzR6nQzPaGZWNh6iHizryogG5N0RYSt/kyKuO7f05C7wu8hopw+gjyXO28BjGVaw8k8A0AtYkSrUPk9lk9Tc2D6HQRDZoe+sNyBR0aHJE70MazFIXAy/s/UT3ZE4LBhMRSvRfFPijl99nYM4/tRZt3GY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749041407; c=relaxed/simple;
	bh=fO/l2Y5rPdaqTWh8tBMxPdAKRiamZOULj2hqaRpi8JY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nxL8tUhAwGmHGh7JBdvNhcGoVn1Au5FTb3bR9y+kz0fYl4IFxyczNmHXIvDDhenx2uV1uTKNeWM0gMJoW9732gYx4eaql43YjHj1ovQUr+psFf4raLjUlRB0LSDElC+p7fqyW3mQGLp+1slX0Ho8cvasC3Uc6M075QZDzE08kB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D820C4CEE7;
	Wed,  4 Jun 2025 12:50:05 +0000 (UTC)
Date: Wed, 4 Jun 2025 08:51:21 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, Matthew Wilcox  
 <willy@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, Christian 
 Koenig <christian.koenig@amd.com>, Huang Rui  <ray.huang@amd.com>, Matthew
  Auld <matthew.auld@intel.com>, Matthew Brost  <matthew.brost@intel.com>,
 dri-devel@lists.freedesktop.org, Maarten Lankhorst  
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v2] drm/ttm: Fix compile error when CONFIG_SHMEM is not set
Message-ID: <20250604085121.324be8c1@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

From: Steven Rostedt <rostedt@goodmis.org>

When CONFIG_SHMEM is not set, the following compiler error occurs:

ld: vmlinux.o: in function `ttm_backup_backup_page':
(.text+0x10363bc): undefined reference to `shmem_writeout'
make[3]: *** [/work/build/trace/nobackup/linux.git/scripts/Makefile.vmlinux:91: vmlinux.unstripped] Error 1
make[2]: *** [/work/build/trace/nobackup/linux.git/Makefile:1241: vmlinux] Error 2
make[1]: *** [/work/build/trace/nobackup/linux.git/Makefile:248: __sub-make] Error 2
make[1]: Leaving directory '/work/build/nobackup/tracetest'
make: *** [Makefile:248: __sub-make] Error 2

This is due to the replacement of writepage and calling swap_writeout()
and shmem_writeout() directly. The issue is that when CONFIG_SHMEM is not
defined, shmem_writeout() is also not defined.

The function ttm_backup_backup_page() called mapping->a_ops->writepage()
which was then changed to call shmem_writeout() directly.

Even before commit 84798514db50 ("mm: Remove swap_writepage() and
shmem_writepage()"), it didn't make sense to call anything other than
shmem_writeout() as the ttm_backup deals only with shmem folios.

Have DRM_TTM config option select SHMEM to guarantee that shmem_writeout()
is available.

Link: https://lore.kernel.org/all/20250602170500.48713a2b@gandalf.local.home/

Suggested-by: Hugh Dickins <hughd@google.com>
Fixes: 84798514db50 ("mm: Remove swap_writepage() and shmem_writepage()")
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
Changes since v1: https://lore.kernel.org/all/20250602170500.48713a2b@gandalf.local.home/

- Instead of adding a shmem_writeout() stub, just make CONFIG_DRM_TTM
  select CONFIG_SHMEM (Hugh Dickins)

 drivers/gpu/drm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index f094797f3b2b..ded28c71d89c 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -188,6 +188,7 @@ source "drivers/gpu/drm/display/Kconfig"
 config DRM_TTM
 	tristate
 	depends on DRM && MMU
+	select SHMEM
 	help
 	  GPU memory management subsystem for devices with multiple
 	  GPU memory types. Will be enabled automatically if a device driver
-- 
2.47.2

