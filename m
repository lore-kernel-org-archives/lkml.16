Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408491C84DE
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 17:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748971584; cv=none; b=NIGA6Mq/gvQPT7jX1VLuGV7gncqbgSEzPbn8RnZ3PVHbqxA8fvxUGpptb1zLhITN+emGu5TMNULsix25+b/1Ph7ACgAiZ7OA38eACaJ2UJg9z1N7vrs6tCe+j6kWASTDO7hagWScMmgvlkDVNCmP8xATU0vlEFI5n5ZRg7JBfx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748971584; c=relaxed/simple;
	bh=wv76UUzeN8n/AC73KfaP/650EbdFl1NT79AnrQmw7EU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=joSki73Myoipvh7ekng04vovZVQacqUO03UElZrTHuzy+7WvG1NuY1AiE7U0iBWyj+3Bv3t4zBTwez7+5DwiccytZXCZBL8tYTKVzHOa+7DRnK+IR4M2ey2gs7+ZD0oIHhx1ex9/yXR8daX7fkhepbVdphmPU5gzg+fl2d75wYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5343C4CEEE;
	Tue,  3 Jun 2025 17:26:21 +0000 (UTC)
Date: Tue, 3 Jun 2025 13:27:36 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Hugh Dickins <hughd@google.com>, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, Linus
 Torvalds <torvalds@linux-foundation.org>, Christian Koenig
 <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>, Matthew Auld
 <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 dri-devel@lists.freedesktop.org, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH] mm: Fix compile error when CONFIG_SHMEM is not set
Message-ID: <20250603132736.554f611d@gandalf.local.home>
In-Reply-To: <aD8iL4cFoXpIVK_0@casper.infradead.org>
References: <20250602170500.48713a2b@gandalf.local.home>
	<20250602171458.7ceabb1c@gandalf.local.home>
	<aD4boBrdZXtz_5kL@casper.infradead.org>
	<fc2b6a94-bd2d-a5d9-c935-381a1613f47e@google.com>
	<20250603102959.20c85adb@gandalf.local.home>
	<aD8iL4cFoXpIVK_0@casper.infradead.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


[ Adding DRM folks ]

On Tue, 3 Jun 2025 17:26:23 +0100
Matthew Wilcox <willy@infradead.org> wrote:

> On Tue, Jun 03, 2025 at 10:29:59AM -0400, Steven Rostedt wrote:
> > On Tue, 3 Jun 2025 01:02:36 -0700 (PDT)
> > Hugh Dickins <hughd@google.com> wrote:
> >   
> > > Agreed that ramfs does not use swap, so calling swap_writepage() would
> > > be weird.  But, thanks for the build fix Steve, but it cannot be right
> > > because return 0 says shmem_writeout() successfully sent the page to
> > > swap, and that has unlocked the page (or soon will do so).  It should
> > > return an error (-ENXIO?), but I haven't checked what the callers do with  
> > 
> > Yeah, I figured it should return an error, but looking at the code I
> > couldn't figure out what the proper error would be. Then I also noticed
> > that the other stub functions just returned zero so I did the same.
> > 
> > Perhaps add a WARN_ON_ONCE() if it is called without CONFIG_SHMEM configured?  
> 
> Or just make this module depend on SHMEM?  I don't think it makes much
> sense to use it without being able to swap, and shmem can't swap ...

Heh, not exactly sure what to make depend on CONFIG_SHMEM. The function is:

  ttm_backup_backup_page()

Which is defined when CONFIG_DRM_TTM is set, but just doing:

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index f094797f3b2b..ebb948a0142f 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -187,7 +187,7 @@ source "drivers/gpu/drm/display/Kconfig"
 
 config DRM_TTM
 	tristate
-	depends on DRM && MMU
+	depends on DRM && MMU && SHMEM
 	help
 	  GPU memory management subsystem for devices with multiple
 	  GPU memory types. Will be enabled automatically if a device driver

Isn't good enough because "select" can override depends on :-p and DRM_TTM
gets selected by:

 Symbol: DRM_TTM [=y]
 Type  : tristate
 Defined at drivers/gpu/drm/Kconfig:188
   Depends on: HAS_IOMEM [=y] && DRM [=y] && MMU [=y] && SHMEM [=n]
 Selected by [y]:
   - DRM_TTM_HELPER [=y] && HAS_IOMEM [=y] && DRM [=y]
   - DRM_RADEON [=y] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && MMU [=y] && (AGP [=n] || !AGP [=n])
   - DRM_VMWGFX [=y] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && MMU [=y] && (X86 [=y] && HYPERVISOR_GUEST [=y] || ARM64)
 Selected by [n]:
   - DRM_TTM_KUNIT_TEST [=n] && HAS_IOMEM [=y] && DRM [=y] && KUNIT [=n] && MMU [=y] && (UML || COMPILE_TEST [=n])
   - DRM_AMDGPU [=n] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && MMU [=y] && !UML
   - DRM_NOUVEAU [=n] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && MMU [=y]
   - DRM_I915 [=n] && HAS_IOMEM [=y] && DRM [=y] && X86 [=y] && PCI [=y] && !PREEMPT_RT [=n]
   - DRM_XE [=n] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && MMU [=y] && (m [=m] && MODULES [=n] || KUNIT [=n]=y [=y]
   - DRM_QXL [=n] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && MMU [=y] && HAS_IOPORT [=y]
   - DRM_LOONGSON [=n] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && MMU [=y] && (LOONGARCH || MIPS || COMPILE_TEST [=n])
   - DRM_HISI_HIBMC [=n] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && MMU [=y]
   - DRM_VBOXVIDEO [=n] && HAS_IOMEM [=y] && DRM [=y] && X86 [=y] && PCI [=y]

Should DRM itself depend on SHMEM?

-- Steve
