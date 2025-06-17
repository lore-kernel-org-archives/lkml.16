Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A73D2F5310
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 22:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750200658; cv=none; b=hR8ams3ECvFjubyEYKZXodCu0CMn0BhB6OOIehJB5UyA+a1W+BrRkua0/d0CsOJa1F6vKRj1QWubl12xvfS7x55UugUsojpcBt6ZXx2pOHpcZSZT+vMIH6h/pdRjQa78j9mujho5jhEmDJU5klntE8NNVOH3hd0l6q3I5tAilgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750200658; c=relaxed/simple;
	bh=kIJZkon3PpVO1xO+Y1dqXu0EPSWvOnvPVKJ734wyHYI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ZxnqgiAA8N+OnZ+PEaL+YQSXNhlP06ItLcbMoCXaUwV3Kn+zs/apbnggQlr/4s3sfo2WfoP8xoHbC5QMWL1cS9+iyTrZ24oIGzqoleZyd6WEH+0VgtEfMbqsW3KF4lNNbEFCcHZqs0+EmjelaU3480pOyNRliNlLwZNZoD/X/78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=K21XFM9n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="K21XFM9n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55ACAC4CEE3;
	Tue, 17 Jun 2025 22:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1750200657;
	bh=kIJZkon3PpVO1xO+Y1dqXu0EPSWvOnvPVKJ734wyHYI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=K21XFM9nN0omO6l6y3lzXoFZTDDxsuz+KxauHElK4d6V1eVHhSaIIM/uE0hpXrXpB
	 IqDnHv383DOUVN0pJHAhRqSS32hMrMpGdLmfgA+4TTtrPz8AOWJzpBCFYgqv+1oZqI
	 GZ1CPJClQE+KTy7q2cKA1sFam3IU4c9TUdhfBZ24=
Date: Tue, 17 Jun 2025 15:50:56 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, John Stultz <jstultz@google.com>, Thomas
 Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 1/3] bitmap: generalize node_random()
Message-Id: <20250617155056.5c1d292d8831e7c7a27c8e5f@linux-foundation.org>
In-Reply-To: <20250617200854.60753-2-yury.norov@gmail.com>
References: <20250617200854.60753-1-yury.norov@gmail.com>
	<20250617200854.60753-2-yury.norov@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 17 Jun 2025 16:08:51 -0400 Yury Norov <yury.norov@gmail.com> wrote:

> From: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>
> 
> Generalize node_random() and make it available to general bitmaps and
> cpumasks users.
> 
> Notice, find_first_bit() is generally faster than find_nth_bit(), and we
> employ it when there's a single set bit in the bitmap.
> 
> See commit 3e061d924fe9c7b4 ("lib/nodemask: optimize node_random for
> nodemask with single NUMA node").
> 
> ...
>
> --- a/include/linux/nodemask.h
> +++ b/include/linux/nodemask.h
> @@ -492,21 +492,7 @@ static __always_inline int num_node_state(enum node_states state)
>  static __always_inline int node_random(const nodemask_t *maskp)
>  {
>  #if defined(CONFIG_NUMA) && (MAX_NUMNODES > 1)
> -	int w, bit;
> -
> -	w = nodes_weight(*maskp);
> -	switch (w) {
> -	case 0:
> -		bit = NUMA_NO_NODE;

If the mask has no bits set, return -1.

> -		break;
> -	case 1:
> -		bit = first_node(*maskp);
> -		break;
> -	default:
> -		bit = find_nth_bit(maskp->bits, MAX_NUMNODES, get_random_u32_below(w));
> -		break;
> -	}
> -	return bit;
> +	return find_random_bit(maskp->bits, MAX_NUMNODES);
>
> ...
>
> +unsigned long find_random_bit(const unsigned long *addr, unsigned long size)
> +{
> +	int w = bitmap_weight(addr, size);
> +
> +	switch (w) {
> +	case 0:
> +		return size;

If the mask has no bits set, return the mask's size.

> +	case 1:
> +		/* Performance trick for single-bit bitmaps */
> +		return find_first_bit(addr, size);
> +	default:
> +		return find_nth_bit(addr, size, get_random_u32_below(w));
> +	}
> +}

I'm not seeing how this is correct?
