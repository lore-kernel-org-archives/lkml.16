Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DC225B699
	for <linux-kernel@vger.kernel.org>; Mon, 24 Feb 2025 17:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.72.0.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740418349; cv=none; b=e7M1Tsk5OnIAle2SApr/ZLhwh/zyq78G+/yz3i7LB3KY9D2OsL5L9Uyan6DLSysmFB0QQLmGd4srcs4P71pmMKYBbLMnmFeigsNvw972kSO5z+MxXS2foK9+ABO3sm4Bg1Rm4RfBZDvfBoyfCUZ14u6tPThXyTw7FLOuQ6jKCdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740418349; c=relaxed/simple;
	bh=KHw98F03G+uOE+ZixGeEVVxvCf7Bi1tCZXnQhCH9thU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Bmao47hXerYW9k68AdzWT1so1aXwJzhuUgXZqZWKOPb/dvd9q4DufeSBSqDJKwWOPR05zJVGCxT0jmrAr3N2psxWXXVBgFiKvDa1W+MgoNlXBnEERQc7CdElMbf62dB6j1ob3ztTj9ihfy+YP/HnKYvv7xLsfVb5N0yajxXK8iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org; spf=pass smtp.mailfrom=gentwo.org; dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b=T+9922Nu; arc=none smtp.client-ip=62.72.0.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b="T+9922Nu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1740417882;
	bh=KHw98F03G+uOE+ZixGeEVVxvCf7Bi1tCZXnQhCH9thU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=T+9922Nu7Dd8451JjFl5EQoel0vDraaBxs1ftSqdujVJnV7alYMtL0X+SRkFsS4kv
	 3jJzZpNeFZCB7WDt0OnaLno06jtIG8RxFICMxVZM55AB7QTuzgAK6AZAVic81jx8KD
	 RytKbXZEzSZ5H8A407SYa2YtR9TXcYA+nZ9mBfoY=
Received: by gentwo.org (Postfix, from userid 1003)
	id 9A1614027F; Mon, 24 Feb 2025 09:24:42 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 9758E40195;
	Mon, 24 Feb 2025 09:24:42 -0800 (PST)
Date: Mon, 24 Feb 2025 09:24:42 -0800 (PST)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Hyesoo Yu <hyesoo.yu@samsung.com>
cc: janghyuck.kim@samsung.com, vbabka@suse.cz, 
    Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>, 
    Joonsoo Kim <iamjoonsoo.kim@lge.com>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    Roman Gushchin <roman.gushchin@linux.dev>, 
    Hyeonggon Yoo <42.hyeyoo@gmail.com>, linux-mm@kvack.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] mm: slub: Print the broken data before restoring
 slub.
In-Reply-To: <20250220033953.1606820-2-hyesoo.yu@samsung.com>
Message-ID: <8befd391-3741-40ca-fd84-47112a75c7ac@gentwo.org>
References: <20250220033953.1606820-1-hyesoo.yu@samsung.com> <CGME20250220034153epcas2p286194dda687b47a3dec8fb89b868f96f@epcas2p2.samsung.com> <20250220033953.1606820-2-hyesoo.yu@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 20 Feb 2025, Hyesoo Yu wrote:

> @@ -1396,11 +1400,6 @@ static int check_object(struct kmem_cache *s, struct slab *slab,
>  		ret = 0;
>  	}
>
> -	if (!ret && !slab_in_kunit_test()) {


> -		print_trailer(s, slab, object);
> -		add_taint(TAINT_BAD_PAGE, LOCKDEP_NOW_UNRELIABLE);

No tainting and printing of the trailer anymore?

