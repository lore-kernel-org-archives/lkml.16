Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDD11F585B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 22:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743634651; cv=none; b=RnIq4Y6IYyXIDfj8rAnutrxXyscRYSShX1y7liZlYsmapBkp+J7iDp+yrTXHyVvZiqHjZTokiCWjvabdxHmgED5wmupLeUE946GKG9SQQRvwGqQ2GoOoQ8Wkp1ZwXotsWVYuakx4ilSN2b9Xk7kVJyFzwWAta5KIgLdUm9B5vuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743634651; c=relaxed/simple;
	bh=yfLNRpORu85U5HqIsekOGNPdeR+i8F1qWXTiZ4cZcY8=;
	h=Message-ID:Date:From:To:Cc:Subject; b=r4ymSN3EH6eI+mFAJRDuvf6RC55KwJiNgOjsZnNxxnaBhrJ/IRtjNdPBOivydi9n3rKq2lUO5huXTo6V3xYjRTUl726uprCfwSPbL71OO07GWTQRI8GF2jRq7duvnityycMiriQEN5Yt7AQkLGFDfLb/2t5MKK8sAat3pWgYZ/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B15E9C4CEDD;
	Wed,  2 Apr 2025 22:57:30 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98)
	(envelope-from <rostedt@goodmis.org>)
	id 1u072Y-00000006Z0V-3snD;
	Wed, 02 Apr 2025 18:58:34 -0400
Message-ID: <20250402225735.849814084@goodmis.org>
User-Agent: quilt/0.68
Date: Wed, 02 Apr 2025 18:57:35 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-linus][PATCH 0/4] tracing: Cleanup and simplify the persistent ring buffer for 6.15
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>


Persistent buffer cleanups and simplifications for v6.15:

It was mistaken that the physical memory returned from "reserve_mem" had to
be vmap()'d to get to it from a virtual address. But reserve_mem already
maps the memory to the virtual address of the kernel so a simple
phys_to_virt() can be used to get to the virtual address from the physical
memory returned by "reserve_mem". With this new found knowledge, the
code can be cleaned up and simplified.

- Enforce that the persistent memory is page aligned

  As the buffers using the persistent memory are all going to be
  mapped via pages, make sure that the memory given to the tracing
  infrastructure is page aligned. If it is not, it will print a warning
  and fail to map the buffer.

- Use phys_to_virt() to get the virtual address from reserve_mem

  Instead of calling vmap() on the physical memory returned from
  "reserve_mem", use phys_to_virt() instead.

  As the memory returned by "memmap" or any other means where a physical
  address is given to the tracing infrastructure, it still needs to
  be vmap(). Since this memory can never be returned back to the buddy
  allocator nor should it ever be memmory mapped to user space, flag
  this buffer and up the ref count. The ref count will keep it from
  ever being freed, and the flag will prevent it from ever being memory
  mapped to user space.

- Use vmap_page_range() for memmap virtual address mapping

  For the memmap buffer, instead of allocating an array of struct pages,
  assigning them to the contiguous phsycial memory and then passing that to
  vmap(), use vmap_page_range() instead

- Replace flush_dcache_folio() with flush_kernel_vmap_range()

  Instead of calling virt_to_folio() and passing that to
  flush_dcache_folio(), just call flush_kernel_vmap_range() directly.
  This also fixes a bug where if a subbuffer was bigger than PAGE_SIZE
  only the PAGE_SIZE portion would be flushed.


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
ring-buffer/fixes

Head SHA1: e4d4b8670c44cdd22212cab3c576e2d317efa67c


Steven Rostedt (4):
      tracing: Enforce the persistent ring buffer to be page aligned
      tracing: Have reserve_mem use phys_to_virt() and separate from memmap buffer
      tracing: Use vmap_page_range() to map memmap ring buffer
      ring-buffer: Use flush_kernel_vmap_range() over flush_dcache_folio()

----
 Documentation/admin-guide/kernel-parameters.txt |  2 +
 Documentation/trace/debugging.rst               |  2 +
 kernel/trace/ring_buffer.c                      |  5 +-
 kernel/trace/trace.c                            | 66 ++++++++++++++++---------
 kernel/trace/trace.h                            |  1 +
 5 files changed, 50 insertions(+), 26 deletions(-)
