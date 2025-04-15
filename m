Received: from smtp117.iad3b.emailsrvr.com (smtp117.iad3b.emailsrvr.com [146.20.161.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B858B1FC7E7
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 11:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=146.20.161.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744717634; cv=none; b=L2y9sf7agzMl6XG/GqdiS8+HukPTb5PJo3nyxuaNOiSrt8V21NeuQNxuAJ+n4WmrxZcnD9ZGlv4LuKt/LNJ/ApGhCUjKNg6+9JbClgwKyqv+giD0/WA/RLlwGVdg5zx/JD2PKTk3HrimqC8Qu0FGGhN7i8QwBuXV9G9+NrwCG3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744717634; c=relaxed/simple;
	bh=sNzCTTISaQe9wLvcNLQZC11fZP369QH8cXNYy/4+Pew=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t/cla0N1gk51/59kccZdmlZj1fD6RehmX/wTuSYtof1Kr/P/WEKrZpMHB7N5kSsDD2Szhjh2qwsoEOcfqUznBzuLwUggl5YDt7J5xLO0fDlqLlUTuMzQqlAjM/5fokOSqYM0kVa/ANkjdNEZ5Yxdffz3xzYCl5s7oldtx3c7sAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk; spf=pass smtp.mailfrom=mev.co.uk; dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b=t3iUAozm; arc=none smtp.client-ip=146.20.161.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b="t3iUAozm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20221208-6x11dpa4; t=1744717224;
	bh=sNzCTTISaQe9wLvcNLQZC11fZP369QH8cXNYy/4+Pew=;
	h=From:To:Subject:Date:From;
	b=t3iUAozmPUemsPjxNneyq2ANYJden324JHv47DVk5nAn+r8JfiQDZrjH/JHW44kdn
	 vHf7Teu46hZaFDOh1MpWbvOmtclnkC6G3kIkIi7vb9ENzpxMLCYGRxF3xpq6/nkA3v
	 Lptusp8LTSmT5XxOdX/Uxi5y/PIpYhkBq7x/4D3A=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp15.relay.iad3b.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id D64CBC0354;
	Tue, 15 Apr 2025 07:40:23 -0400 (EDT)
From: Ian Abbott <abbotti@mev.co.uk>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Christoph Hellwig <hch@lst.de>
Subject: [PATCH 0/4] comedi: non-contiguous buffer pages changes
Date: Tue, 15 Apr 2025 12:35:55 +0100
Message-ID: <20250415114008.5977-1-abbotti@mev.co.uk>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Classification-ID: 8a53f2c5-5989-413b-be2c-df2839710a9a-1-1

This patch series changes the way the Comedi core code accesses the
acquisition buffer contents, so that rather than use an overall, linear
mapping of the whole buffer, it uses existing per-buffer-page pointers.

(@Christoph, I'm mostly interested in your take on calling
`dma_mmap_coherent()` in a loop, as described in the final(-ish)
paragraph, and in patch 4.)

Currently, the buffer is either allocated a page at a time from normal
kernel memory, which is then vmap'ed to a linear address range for
convenience, or it is allocated as a single block from DMA coherent
memory.  (The low-level Comedi driver indicates the type of memory to be
used.)  In either case, an array of `struct comedi_buf_page` is filled
in with the underlying (non-vmap'ed) addresses of each page (and the
corresponding DMA addresses, and the `prealloc_buf` member of `struct
comedi_async` is set to the overall linear address (from `vmap` or
`dma_alloc_coherent` as appropriate).

For buffers in normal kernel memory, this patch series removes the
vmap'ing of the buffer pages.

For buffers in DMA coherent memory, patch 4 splits the allocation into
page-sized allocations.  We used to do that before commit e36472145aa7
("staging: comedi: use dma_mmap_coherent for DMA-able buffer mmap"), but
there was the problem of how to mmap a buffer consisting of
non-contiguous pages of DMA coherent memory.  At the time, I considered
calling `dma_mmap_coherent()` in a loop with manipulated `vm_start` and
`vm_end` values (see <https://lkml.org/lkml/2019/6/17/534>), and that is
what patch 4 does.  It seems to work (although I've only tested in on
x86_64 so far), and I'm not the only person in the wild to discover this
trick (see <https://stackoverflow.com/a/67220955/5264491>), although I
am not aware of any other use of this trick in the kernel source.  The
closest equivalent is the manipulation of the VMA's `vm_pgoff` value
before calling `dma_mmap_coherent()`, for example in the UIO driver.

Patch list:

1) comedi: ni_pcidio: Do not bother filling buffer with 0xaa byte values
2) comedi: access buffer data page-by-page
3) comedi: remove the mapping of the Comedi buffer in vmalloc address space
4) comedi: allocate DMA coherent buffer as individual pages

 drivers/comedi/comedi_buf.c        | 155 ++++++++++++++-----------------------
 drivers/comedi/comedi_fops.c       | 120 ++++++++++++++++++++--------
 drivers/comedi/drivers/ni_pcidio.c |   2 -
 include/linux/comedi/comedidev.h   |  10 +--
 4 files changed, 144 insertions(+), 143 deletions(-)
