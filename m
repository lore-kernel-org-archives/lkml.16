Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A04F22A80D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 16:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.149.199.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744128449; cv=none; b=YPJOOubAWM9M0NAN7d27qGVJAWKm/xJebLFFqFHlFHE8x4cP1hUQRA+Sn7Tg2xaeZBLZ7g3U9e2ji8esVOaLgiZCJvvXWJ5maCFEhjNZQ+T4H9tXMjDq2P3x+97L6E18lIzIPoj6BBH6f+kCRjEvNbcJ2E1HiW4sE3KlOv3DZ2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744128449; c=relaxed/simple;
	bh=8iv2hTGNym6CSVTE5Z32BJQFc3K9Wn8llkpaNKmNqYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RaOgFRlKsoP6+MIQjLnsONqZH3GKBm8nU6U0boT3T4MoyA9KkprVtYtmv5g88jRe+/Z0RpdNBI2bcQP/s/3uSugfSf5uN1MD+JCOVxLuXDa9CNuGAW0r5zxBw61SvwwY+fT/gsnvr6HoaWKxZ0IFCrozSur+AUh64JCP6+/2PmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru; spf=pass smtp.mailfrom=ispras.ru; dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=EhFBw5+G; arc=none smtp.client-ip=83.149.199.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ispras.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b="EhFBw5+G"
Received: from localhost (unknown [10.10.165.6])
	by mail.ispras.ru (Postfix) with ESMTPSA id 2A1484076729;
	Tue,  8 Apr 2025 16:07:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 2A1484076729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1744128439;
	bh=tmVV9ouHA7nkCSbZA75D06w8/DLaWCXo2XKIz9rcldw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EhFBw5+GZGy4x8ryaNMFrY1c5FUYrPu+hn738QqRKuKvGy2kjRolURUaxlMl3r+z/
	 DOkNiOY3aS/wueewtjdMbNpWLsKrcPsvEn7lD8ikLOOPgJ+PeZw7kqOY5lbuF3r6SY
	 Fc8YnZ7GH2rkk4RZ69xYW7EYnwwYMmGVwL1/Pelc=
Date: Tue, 8 Apr 2025 19:07:19 +0300
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Denis Arefev <arefev@swemel.ru>, 
	Alex Deucher <alexander.deucher@amd.com>, Simona Vetter <simona@ffwll.ch>, lvc-project@linuxtesting.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
	David Airlie <airlied@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [lvc-project] [PATCH] drm/amdgpu: check a user-provided number
 of BOs in list
Message-ID: <pmby7iowvxuomsbuxebttosz245j7ngw5enbl72dq675nrgvve@ugkvzeihbtut>
References: <20250408091755.10074-1-arefev@swemel.ru>
 <e6ccef21-3ca5-4b5a-b18a-3ba45859569c@amd.com>
 <bmdour3gw4tuwqgvvw764p4ot3nnltqm4e7n3edlbtpfazvp5c@cqe5dwgc66uy>
 <f8810b13-01d1-4615-b6e2-2e791c48b466@amd.com>
 <qc72y52kt7vuwox4lhk42zligy5bslttselfoexse42mywtpps@ebqijs2tap2t>
 <edc08eb4-63dd-402c-82df-af6898d499a9@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <edc08eb4-63dd-402c-82df-af6898d499a9@amd.com>

On Tue, 08. Apr 14:22, Christian König wrote:
> Am 08.04.25 um 13:54 schrieb Fedor Pchelkin:
> > If user can request an arbitrary size value then we should use __GFP_NOWARN
> > and back on the allocator to return NULL in case it doesn't even try to
> > satisfy an enormous memory allocation request (in which case it yells in
> > the log without __GFP_NOWARN being passed). Maybe that would be a more
> > appropriate thing here?
> 
> Using __GFP_NOWARN is most likely an incorrect approach as well, this
> might disable all warnings. E.g. also OOM if I'm not completely mistaken
> and we clearly do want those.

Okay, that sounds reasonable.

> 
> > Please see:
> > https://lore.kernel.org/dm-devel/CAHk-=wi8Zer6tnqO-bz+WxFpMv9sPc-LxGRm_3poOtZegjhfrg@mail.gmail.com/
> 
> Linus comment is about kvmalloc(), but the code here is using
> kvmalloc_array() which as far as I know is explicitly made to safely
> allocate arrays with parameters provided by userspace.

[27651.163357] ------------[ cut here ]------------
[27651.163361] WARNING: CPU: 3 PID: 183060 at mm/util.c:657 __kvmalloc_node_noprof+0xc1/0xd0
[27651.163411] CPU: 3 UID: 0 PID: 183060 Comm: a.out Not tainted 6.13.9-200.fc41.x86_64 #1
[27651.163412] Hardware name: ASUS System Product Name/PRIME X670E-PRO WIFI, BIOS 3035 09/05/2024
[27651.163413] RIP: 0010:__kvmalloc_node_noprof+0xc1/0xd0
[27651.163424] Call Trace:
[27651.163426]  <TASK>
[27651.163429]  ? show_trace_log_lvl+0x1b0/0x2f0
[27651.163431]  ? show_trace_log_lvl+0x1b0/0x2f0
[27651.163434]  ? amdgpu_bo_create_list_entry_array+0x3d/0x150 [amdgpu]
[27651.163579]  ? __kvmalloc_node_noprof+0xc1/0xd0
[27651.163581]  ? __warn.cold+0x93/0xfa
[27651.163582]  ? __kvmalloc_node_noprof+0xc1/0xd0
[27651.163584]  ? report_bug+0xff/0x140
[27651.163586]  ? handle_bug+0x58/0x90
[27651.163588]  ? exc_invalid_op+0x17/0x70
[27651.163589]  ? asm_exc_invalid_op+0x1a/0x20
[27651.163591]  ? __kmalloc_node_noprof+0x3f9/0x590
[27651.163592]  ? __kvmalloc_node_noprof+0xc1/0xd0
[27651.163594]  ? __kvmalloc_node_noprof+0x37/0xd0
[27651.163595]  amdgpu_bo_create_list_entry_array+0x3d/0x150 [amdgpu]
[27651.163704]  amdgpu_bo_list_ioctl+0x55/0x350 [amdgpu]
[27651.163805]  ? __pfx_amdgpu_bo_list_ioctl+0x10/0x10 [amdgpu]
[27651.163909]  drm_ioctl_kernel+0xad/0x100
[27651.163911]  drm_ioctl+0x288/0x530
[27651.163912]  ? __pfx_amdgpu_bo_list_ioctl+0x10/0x10 [amdgpu]
[27651.164010]  amdgpu_drm_ioctl+0x4b/0x80 [amdgpu]
[27651.164106]  __x64_sys_ioctl+0x94/0xc0
[27651.164108]  do_syscall_64+0x82/0x160
[27651.164110]  ? handle_mm_fault+0x20d/0x330
[27651.164111]  ? do_user_addr_fault+0x55a/0x7b0
[27651.164113]  ? exc_page_fault+0x7e/0x180
[27651.164114]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[27651.164116] RIP: 0033:0x7f271589d4ad
[27651.164138]  </TASK>
[27651.164138] ---[ end trace 0000000000000000 ]---


That's just

    union drm_amdgpu_bo_list bo_list;
    int fd, ret;

    memset(&bo_list, 0, sizeof(bo_list));

    fd = open(DEVICE_PATH, O_RDWR);

    bo_list.in.bo_number = 1 << 31;
    ret = ioctl(fd, DRM_IOCTL_AMDGPU_BO_LIST, &bo_list);


> 
> So pre-checking those parameters in the caller once more is a bit
> questionable, especially since we need to spread that around to all
> callers of kvmalloc_array() which looks backwards considering the
> purpose of kvmalloc_array().

kvmalloc_array() performs an extra check only for that the `size * n`
thing doesn't overflow the (generally) 64-bit arithmetic. Otherwise, it's
actually like an ordinary kvmalloc() with a request of `size * n`.

Performing that extra size_t-overflow check is not the same as checking
that `size * n` cannot take enormous and possibly unverified values.
That's what the logic of the checks inside the allocator implies IMO.

> 
> Maybe we should reduce the warning to info level for kvmalloc_array()
> since returning NULL when incorrect parameters are given can be
> perfectly handled by the caller.

That would require running through and inspecting all of its callers in
the source tree.

And it would then differentiate from the underlying kvmalloc(), I'd say.

The warning was added deliberately.

commit 7661809d493b426e979f39ab512e3adf41fbcc69
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed Jul 14 09:45:49 2021 -0700

    mm: don't allow oversized kvmalloc() calls
    
    'kvmalloc()' is a convenience function for people who want to do a
    kmalloc() but fall back on vmalloc() if there aren't enough physically
    contiguous pages, or if the allocation is larger than what kmalloc()
    supports.
    
    However, let's make sure it doesn't get _too_ easy to do crazy things
    with it.  In particular, don't allow big allocations that could be due
    to integer overflow or underflow.  So make sure the allocation size fits
    in an 'int', to protect against trivial integer conversion issues.
    
    Acked-by: Willy Tarreau <w@1wt.eu>
    Cc: Kees Cook <keescook@chromium.org>
    Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>

diff --git a/mm/util.c b/mm/util.c
index db3091116b7c..499b6b5767ed 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -593,6 +593,10 @@ void *kvmalloc_node(size_t size, gfp_t flags, int node)
        if (ret || size <= PAGE_SIZE)
                return ret;
 
+       /* Don't even allow crazy sizes */
+       if (WARN_ON_ONCE(size > INT_MAX))
+               return NULL;
+
        return __vmalloc_node(size, 1, flags, node,
                        __builtin_return_address(0));
 }

