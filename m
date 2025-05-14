Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5F21E7C12
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 22:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747262552; cv=none; b=DoNNTWo5L7KZLdI9Jr/KoM+GnHvZGSDDFGmd8LQTWA5kzL9TqDkbKglCxnkr55nBabVj/qFREdZCjLFNHiu2EI+KKa2wdkNwEo0uHQ9z1zoEylZ8FPIDCpMNHm0Man8hLDZHov0nL4ynGdpyv8zrPI2aYqvqnyqGjZdWYildKlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747262552; c=relaxed/simple;
	bh=HqBvV6Mm43C+fTjfNeVnhDD5t+2VPUTPH97oAV+b0AU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=pttjiZJIOHU1i7Ap3E2mY1j9hzy6VKGGCBnyURlUCxc+vtWVkq+x0shTedNcIwaoerqW61dM5IIugiexm3uSVAWCE7bf6TDLUzjJ2ZFPGguhwWHYdYoBoWPeiHz4l04G8oFJ9B8zudK3cf1HySz3eOEpWRUeVdRWwtS6VYWx+r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=EXlg+C3Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="EXlg+C3Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FC0CC4CEE3;
	Wed, 14 May 2025 22:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1747262551;
	bh=HqBvV6Mm43C+fTjfNeVnhDD5t+2VPUTPH97oAV+b0AU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EXlg+C3Y7yoQuMP5MoSRZjXVXr63qNxhNvMrGJOjHkmX6x2Frx1wZFtHRtc+QpVKN
	 PdNP/Tcs7AEFU9X5WZLbL9JZgvjNOzBey4KE/e59GvdPfW9irnB3pkOlZWFsSfOMEX
	 dQPHpRs02+DkLM7MP4j0NLSy7tVw7Jk0KBLC0KnU=
Date: Wed, 14 May 2025 15:42:30 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Suren Baghdasaryan <surenb@google.com>, Tianyang Zhang
 <zhangtianyang@loongson.cn>, Harry Yoo <harry.yoo@oracle.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, Michal Hocko
 <mhocko@suse.com>, Brendan Jackman <jackmanb@google.com>, Johannes Weiner
 <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH] mm/page_alloc.c: Avoid infinite retries caused by
 cpuset race
Message-Id: <20250514154230.7e121cbc89ee6bf35a193bd5@linux-foundation.org>
In-Reply-To: <e783c311-2f3c-42ba-b0ba-734a206cf04c@suse.cz>
References: <20250416082405.20988-1-zhangtianyang@loongson.cn>
	<aAYXP4f417_bx6Is@harry>
	<025e3f51-2ab5-bc58-5475-b57103169a82@loongson.cn>
	<20250422171116.f3928045a13205dc1b9a46ea@linux-foundation.org>
	<CAJuCfpHbXmjAr2Rt0Mo_i32hpGOyXnVtXUd4qFjXriH9eYFDkQ@mail.gmail.com>
	<20250510200740.b7de2408e40be7ad5392fed9@linux-foundation.org>
	<CAJuCfpFdC6hgFSPy3M2sagkFobWeCuxLdcWiyV5pnzB55dgjZg@mail.gmail.com>
	<20250513121609.a9741e49a0e865f25f966de1@linux-foundation.org>
	<e783c311-2f3c-42ba-b0ba-734a206cf04c@suse.cz>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 14 May 2025 09:34:53 +0200 Vlastimil Babka <vbabka@suse.cz> wrote:

> On 5/13/25 21:16, Andrew Morton wrote:
> > On Tue, 13 May 2025 09:26:53 -0700 Suren Baghdasaryan <surenb@google.com> wrote:
> > 
> >> > > > This has been in mm-hotfixes-unstable for six days.  Hopefully we'll
> >> > > > see some review activity soon (please).
> >> > >
> >> > > I reviewed and provided my feedback but saw neither a reply nor a
> >> > > respin with proposed changes.
> >> >
> >> > OK, thanks.  Do you have time to put together a modified version of this?
> >> 
> >> I think the code is fine as is. Would be good to add Fixes: tag but it
> >> will require some investigation to find the appropriate patch to
> >> reference here.
> > 
> > Below is what is in mm-hotfixes.  It doesn't actually have any
> > acked-by's or reviewed-by's.
> > 
> > So... final call for review, please.
> > 
> 
> ...
>
> After the discussion in this thread, Suren retracted this Fixes: suggestion.
> I think it actually goes back to this one which introduced the
> preferred_zoneref caching.
> 
> Fixes: c33d6c06f60f ("mm, page_alloc: avoid looking up the first zone in a
> zonelist twice")

Updated.

> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

Thanks.
