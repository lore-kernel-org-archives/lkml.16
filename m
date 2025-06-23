Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E32A223DCE
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 21:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750715129; cv=none; b=I/r6W3JdMIQ1MARSBnaiLL8/b0pONTsaILxgQuC7FxBU4amf6tbyKV/9FUZlcP5rIIXv+JfB+nCYjmeo8oEq3CEvRGWoQ4r7Faev2lOJM/xTtmvd1yrII+a8bBIm6pw4jUB5b8TDc8AsGjToZH8ikPA+p5jB4V7njikn6CxBogg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750715129; c=relaxed/simple;
	bh=18Au9ytDbTibIjuzR4zOqs5nyomtzAl1JtHW6kDieqo=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=XOrwxT1KF4pIh2UCP53DfJ7S92JfD/Ckz1Muz1UIkQW3RxdHf8W2/H7mXvQe8t54uU9CK483SvHKkT3OUDpkwHM8/iOJhxkMRonPJsfla4A5GprZDOdyWl5OByFr/rHmV6UkEOqGzLpU63INhIVYgpjip2aqrU6RpxhYWR4UX8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=u2GywUPD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="u2GywUPD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13F12C4CEED;
	Mon, 23 Jun 2025 21:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1750715129;
	bh=18Au9ytDbTibIjuzR4zOqs5nyomtzAl1JtHW6kDieqo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=u2GywUPDfzXBr8Aait3ggZAvH5UlvPQc0B1F+44f2xxStPUycjvZachm6Yz6/qnMW
	 1ThmhialQFv94I5jxq4OvSWb3UjEfxhxxKO4twMUTSaDbHzznSXRgcQEFiWdKXT3bV
	 v5S9DAtOHY8rA9MMn/HvWEVpqW+0MAQRp1FcwGJo=
Date: Mon, 23 Jun 2025 14:45:28 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Davidlohr Bueso <dave@stgolabs.net>
Cc: mhocko@kernel.org, hannes@cmpxchg.org, roman.gushchin@linux.dev,
 shakeel.butt@linux.dev, yosryahmed@google.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] mm/memcg: make memory.reclaim interface generic
Message-Id: <20250623144528.19721543236d8a0165df4cad@linux-foundation.org>
In-Reply-To: <20250623185851.830632-3-dave@stgolabs.net>
References: <20250623185851.830632-1-dave@stgolabs.net>
	<20250623185851.830632-3-dave@stgolabs.net>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 23 Jun 2025 11:58:49 -0700 Davidlohr Bueso <dave@stgolabs.net> wrote:

> This adds a general call for both parsing as well as the
> common reclaim semantics. memcg is still the only user and
> no change in semantics.
> 
> +int user_proactive_reclaim(char *buf,
> +			   struct mem_cgroup *memcg, pg_data_t *pgdat);

Feeling nitty, is this a good name for it?  It's hard to imagine what a
function called "user_proactive_reclaim" actually does.

That it isn't documented isn't helpful either!
