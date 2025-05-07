Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2878BF8
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 22:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746657207; cv=none; b=jgI7dfC/FKMI089YGKTrtpMVwM0NPGBXADeDfAffRFtf0TwqfloOQWMr8QoUJOrA45IqH8IhnWUjbia8FPCgwUP+MM3aUmHh1M9LbK23J0l4kuIfF8GmOzTptgDbOhqFUqNO/I+fExml3pzSSTATB1j8GocikLP1pt7qNYsRhFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746657207; c=relaxed/simple;
	bh=foBA69z7x2G+LB328V5ZSCTftbMulx9veE75hQ2O9o4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=D3iVMEFFhDj2MjJpCmKXDxwVz7z7eWVfjN0FJ+633bDhdaEI5CuGI3CEkGYYqFhBUTgMsBEKdFrSf8tqmVd+WQhhwIlDkf01H7JOxh1wp3boDLRUKNVTS3HQ7IoFMzXRQCRkAXNQ1zOOdx6PCtZijIvA1j43+ZxWIXTi6wB9fUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=n1SaE/UX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="n1SaE/UX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1854BC4CEE2;
	Wed,  7 May 2025 22:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1746657206;
	bh=foBA69z7x2G+LB328V5ZSCTftbMulx9veE75hQ2O9o4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=n1SaE/UXjiCHBf1j7Ibstsr+IIFW0TAzyTpHFI5N3CeDYI3tgiRahva+tQ+zVQ/Pw
	 x/fgsWMlh5odItFO3eG8EEghC/O1j8YnY8mu2yW55/D50ygWJt20BUkqTxFVVYO1v0
	 6HB6n/ojktO0vJvXiYX2WlEXw7m3g5EkKxea6H7w=
Date: Wed, 7 May 2025 15:33:25 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Jeongjun Park <aha310510@gmail.com>
Cc: urezki@gmail.com, edumazet@google.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mm/vmalloc: fix data race in show_numa_info()
Message-Id: <20250507153325.48726051dbbff4f3936a83ff@linux-foundation.org>
In-Reply-To: <20250507142552.9446-1-aha310510@gmail.com>
References: <20250507142552.9446-1-aha310510@gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  7 May 2025 23:25:52 +0900 Jeongjun Park <aha310510@gmail.com> wrote:

> The following data-race was found in show_numa_info():
> 
> ...
>
> 
> According to this report, there is a read/write data-race because m->private
> is accessible to multiple CPUs. To fix this, instead of allocating the heap
> in proc_vmalloc_init() and passing the heap address to m->private,
> show_numa_info() should allocate the heap.
> 
> One thing to note is that show_numa_info() is called in a critical section
> of a spinlock, so it must be allocated on the heap with GFP_ATOMIC flag.

GFP_ATOMIC is unfortunate.  Can vmalloc_info_show() allocate the
storage outside the lock and pass that pointer into show_numa_info()? 
That way will be more efficient also, less allocating and freeing.


