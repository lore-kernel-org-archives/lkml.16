Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB30F28B4EB
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 15:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.72.0.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751471722; cv=none; b=kWP5/BsDOj3gJWWLDNvxIFkF93U6dFetBx91HPc3o2LpAfDCCwkZfM3LSyK9eskeI1qxCoVhZvO6sQiWJVqhphpUc/XbHR+Q7FtBZSeHR/A65O64yJxTfOIduiEl+0LoQJUzI6NN4inLQ/ST9KjuQycoYzkJaInA30d5yi0kLv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751471722; c=relaxed/simple;
	bh=Hh6+EVPvGDB/BqczKdpYNsTGePsw/UZjFFYweC1TDaI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=VKylq5qDF2hjR1D2TElW+jaddwA7qLhPA6a9CJFtPw9SHocm6Fe1XPdNvMsqsmlmmH4ELvC7PpgNqtbiOyCzJDaOz2Zn5ZY5AktUamjG7sehBODfHjLY2RFQYX1PqReAfdZvbLOMVFUiNIMZgLMv2IvgU6XDfayq34uEYtrt4DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org; spf=pass smtp.mailfrom=gentwo.org; dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b=X7M4blAB; arc=none smtp.client-ip=62.72.0.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b="X7M4blAB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1751471713;
	bh=Hh6+EVPvGDB/BqczKdpYNsTGePsw/UZjFFYweC1TDaI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=X7M4blABSdTmV0BJS8kqkxDmMVYYu2UgIMbVNWx25flsjWePoTXVtMV1LSQQRlN6W
	 J7pWN5l990f5vj7KUDXbaD7DvGdlTx9eBULB2XVMITwk4dcnONF4XAPwinu5M06fDM
	 oNVqBuLJ0TvWN62ClEDdVGLHGV3wrf16NNdjco94=
Received: by gentwo.org (Postfix, from userid 1003)
	id ED90A40284; Wed,  2 Jul 2025 08:55:13 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id EBB4140190;
	Wed,  2 Jul 2025 08:55:13 -0700 (PDT)
Date: Wed, 2 Jul 2025 08:55:13 -0700 (PDT)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Jeongjun Park <aha310510@gmail.com>
cc: dennis@kernel.org, tj@kernel.org, akpm@linux-foundation.org, 
    vbabka@suse.cz, rientjes@google.com, linux-mm@kvack.org, 
    linux-kernel@vger.kernel.org, 
    syzbot+e5bd32b79413e86f389e@syzkaller.appspotmail.com
Subject: Re: [PATCH] mm/percpu: prevent concurrency problem for pcpu_nr_populated
 read with spin lock
In-Reply-To: <20250702082749.141616-1-aha310510@gmail.com>
Message-ID: <7b7d353f-f38b-3205-8fd4-1072dbf69cb6@gentwo.org>
References: <20250702082749.141616-1-aha310510@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 2 Jul 2025, Jeongjun Park wrote:

> diff --git a/mm/percpu.c b/mm/percpu.c
> index b35494c8ede2..0f98b857fb36 100644
> --- a/mm/percpu.c
> +++ b/mm/percpu.c
> @@ -3355,7 +3355,13 @@ void __init setup_per_cpu_areas(void)
>   */
>  unsigned long pcpu_nr_pages(void)
>  {
> -	return pcpu_nr_populated * pcpu_nr_units;
> +	unsigned long flags, ret;
> +
> +	spin_lock_irqsave(&pcpu_lock, flags);
> +	ret = pcpu_nr_populated * pcpu_nr_units;
> +	spin_unlock_irqrestore(&pcpu_lock, flags);


Ummm.. What? You are protecting a single read with a spinlock? There needs
to be some updating of data somewhere for this to make sense.


Unless a different critical section protected by the lock sets the value
intermittendly to something you are not allowed to see before a final
store of a valid value. But that would be unusual.

This is an academic exercise or did you really see a problem?

What is racing?


