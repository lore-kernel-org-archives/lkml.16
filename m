Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74739184F
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 20:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745181013; cv=none; b=bEN5qVXkD++xW8jUk3rD9Ld1KMDh+dLFCZGGlJZ4KmhcS1EZ0ZQhmWpI2SUm8R5g/6Bbtkmh2tfRoVXZP71ZnW9+2tCrVtbqbK0tXjUotqMxLXalsLs1xwHEik2gG9h1pfNbFniwZpIQBMc1jUpdLsK6K2Edyv7ko4+PNefKJNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745181013; c=relaxed/simple;
	bh=puZ7Fh0N9W+bC/h6RydsYXVTRn6PcEdGQ6SfFfC3GEo=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=t8d3/nf+ps7245I6SImik8FAyuFD1Ltj6e0pKVQ2fArOezKmF3OkEfE0Pw95dftajIS9yb4oT/H/Jso9S5mh53l60TkXz02AMdb2e2TbUYWBoLHzpN6+XoaytZdtMh3umqH4NFyzHqxFzfhs24xSVHi5jx3gGhXiIja7YgPseFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=1WQPAkk4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="1WQPAkk4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92B67C4CEE2;
	Sun, 20 Apr 2025 20:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1745181012;
	bh=puZ7Fh0N9W+bC/h6RydsYXVTRn6PcEdGQ6SfFfC3GEo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=1WQPAkk4JxuRn6OJPNtwDE3nXE9G0bQUl72rvYhmDs/K41ifdcyemRCR/Ao28oKw7
	 9F943gVM6rzuA30PAfdL5/Qv5wqQjJfMB4LPV4V7rZDQsGSYrVoW2a/T9SNQSTtwK1
	 +n0iuXROvkI9zY4ndIH4K5TwGoGWswgYfZ2TCsl8=
Date: Sun, 20 Apr 2025 13:30:12 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
Cc: linux-mm@kvack.org, LKML <linux-kernel@vger.kernel.org>, Baoquan He
 <bhe@redhat.com>, Christoph Hellwig <hch@infradead.org>, Oleksiy
 Avramchenko <oleksiy.avramchenko@sony.com>, kernel test robot
 <lkp@intel.com>
Subject: Re: [PATCH] lib/test_vmalloc.c: Fix compile error with
 CONFIG_TINY_RCU
Message-Id: <20250420133012.9ddb6f2241512eb6828378bd@linux-foundation.org>
In-Reply-To: <20250420142029.103169-1-urezki@gmail.com>
References: <20250420142029.103169-1-urezki@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 20 Apr 2025 16:20:29 +0200 "Uladzislau Rezki (Sony)" <urezki@gmail.com> wrote:

> When the kernel is built with CONFIG_TINY_RCU, compiling the
> test_vmalloc.c fails, due to conflicting definitions like
> "struct srcu_usage", etc. between "srcutiny.h" and "srcutree.h".
> 
> It happens because of direct including the "srcutree.h" bypassing
> the automatic selection mechanism. A correct approach is to include
> a generic <linux/srcu.h> which properly select SRCU implementation
> based on a kernel configuration.
> 
> Fix it by replacing the "srcutree.h" include with "srcu.h".
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202504190717.tJHs381f-lkp@intel.com/
> Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

Thanks.

This is a fix against the mm-unstable patch "lib/test_vmalloc.c:
replace RWSEM to SRCU for setup".
