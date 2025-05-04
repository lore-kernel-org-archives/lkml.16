Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D1129D19
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 09:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746350764; cv=none; b=Qeqmi52UpfECqB+5XVRJhHt/XDN5/uDCta0DY2jOZ92YIEv5xyZ/aR4oYJu7ruHnFBj0RxwGzeRfTs0tk2A4yFEZ8HwD/TdAuijB9z/0PFK3rc8TAKSzDAhlfxxxM6QcxhMOscMsAQx7AnBgOim+OijYyId0enB8E2UFpoDZRCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746350764; c=relaxed/simple;
	bh=pvaiVm1SRiewSrbNvJopGE8et9l16ah5O/Zr2OmCb4E=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=QqZwXBcZrCqj3tdvo2DF0vMbFI0sOTO+nYfQKbhd18RsIQoZJfP9+VLhrXjxWYKvARjDI8cAtW56iq5z88z8vIGHEBUR2fU3ieyx8orGZ8pVpwchtPr75/dnvfCs3ZA8OO9lYHycqYAHKwa3saxOBSTALs0dzwtxUUxDdPfW7Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=N9Tmqr5O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="N9Tmqr5O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5591AC4CEE7;
	Sun,  4 May 2025 09:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1746350763;
	bh=pvaiVm1SRiewSrbNvJopGE8et9l16ah5O/Zr2OmCb4E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=N9Tmqr5OGM31v/4ZVmNz3ZLREHpZ1p4hFuPFF4IosicfxJAIWyTlnrSyfxuK5mVU0
	 zeWZ1zD4HEanmQMiHTHLseozpyzUBKHVjJ28C8tvzuDrdqPfM2+MO6J1k4GfKsAUpJ
	 LTJeb+WgKOdcq5gnFdZEwbqYsoXbJ87uMhZP7cg8=
Date: Sun, 4 May 2025 02:26:02 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, Nhat Pham
 <nphamcs@gmail.com>, Shakeel Butt <shakeel.butt@linux.dev>, Johannes Weiner
 <hannes@cmpxchg.org>, Igor Belousov <igor.b@beldev.am>
Subject: Re: [PATCH v4] mm: add zblock allocator
Message-Id: <20250504022602.13fe05f43ceb273e96e5907b@linux-foundation.org>
In-Reply-To: <20250412154207.2152667-1-vitaly.wool@konsulko.se>
References: <20250412154207.2152667-1-vitaly.wool@konsulko.se>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 12 Apr 2025 17:42:07 +0200 Vitaly Wool <vitaly.wool@konsulko.se> wrote:

> zblock is a special purpose allocator for storing compressed pages.
> It stores integer number of same size objects per its block. These
> blocks consist of several physical pages (2**n, i. e. 1/2/4/8).
> 
> With zblock, it is possible to densely arrange objects of various sizes
> resulting in low internal fragmentation. Also this allocator tries to
> fill incomplete blocks instead of adding new ones, in many cases
> providing a compression ratio comparable to zmalloc's.
> 
> zblock is also in most cases superior to zsmalloc with regard to
> average performance and worst execution times, thus allowing for better
> response time and real-time characteristics of the whole system.
> 
> High memory and page migration are currently not supported by zblock.
> 

My x86_64 allmodconfig build failed.

  MODPOST Module.symvers
ERROR: modpost: "try_alloc_pages_noprof" [mm/zblock.ko] undefined!

I don't understand why this wasn't encountered earlier.


From: Andrew Morton <akpm@linux-foundation.org>
Subject: mm-add-zblock-allocator-fix-2
Date: Sun May  4 02:13:54 AM PDT 2025

export try_alloc_pages_noprof() to modules for CONFIG_ZBLOCK=m

Cc: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: Igor Belousov <igor.b@beldev.am>
Cc: Johannes Weiner <hannes@cmpxchg.org>
Cc: Nhat Pham <nphamcs@gmail.com>
Cc: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: David Hildenbrand <david@redhat.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 mm/page_alloc.c |    1 +
 1 file changed, 1 insertion(+)

--- a/mm/page_alloc.c~a
+++ a/mm/page_alloc.c
@@ -7470,3 +7470,4 @@ struct page *try_alloc_pages_noprof(int
 	kmsan_alloc_page(page, order, alloc_gfp);
 	return page;
 }
+EXPORT_SYMBOL_GPL(try_alloc_pages_noprof);
_

