Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7B44C7C
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 06:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746339392; cv=none; b=O1mU3joGzXqFnoZTau72hdcxcQToTsKuadoWpmXWCLrkkHyhGr8jUb+gY5IkytnSb/YCvfmlbkxrLy/05uMoBqS+CkVuSY8HuApEEKyd/DFMhStUVOjEbG8iVSJIlTy2meFVYZ9Cgsh/Hd0sN7PshQ7ehFb9PGKIVFFSbBP3Ywo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746339392; c=relaxed/simple;
	bh=k1l3lNy8QfCozdRuWnbxpupvL+fhq9WSJ9NvFXGxJq8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=IXGwYh8Bd75vmaSj1aSgxEDwjnVCJ+RPDqyhMSgpu6TJJBAJS4Dxrhi9va1ACSJAmWQqt5Hv28oPiMHxqkfaSuXMVMGtwwXBKnUZnSoR9Zy9Esp4DraYaKuugXBtyDkYz/bFRHrD65/nSVQ30qXfr7+A4+27ZuLfrWLRZtEF33M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=2k9SvRWB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="2k9SvRWB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FFCEC4CEE7;
	Sun,  4 May 2025 06:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1746339391;
	bh=k1l3lNy8QfCozdRuWnbxpupvL+fhq9WSJ9NvFXGxJq8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=2k9SvRWBbM2BRHMN7c8f+QuhIb1OAA0knaO4TxcwABmvf6l42VkPoqxX5v/8NhBwo
	 eBQULqcTmlmvmBITdkzaVfpNhnT/T3V6KfzlEF6iSZ3SxRc5aLg27m9NuVllwQun4O
	 rJom5HkumeSbtOpG+Xqq3r2JxeeOgU5rp+31yHX0=
Date: Sat, 3 May 2025 23:16:31 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Oscar Salvador <osalvador@suse.de>
Cc: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>, Hyeonggon
 Yoo <42.hyeyoo@gmail.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Rakie Kim <rakie.kim@sk.com>
Subject: Re: [PATCH v3 0/3] Implement numa node notifier
Message-Id: <20250503231631.7d8191e51e1d11569b529826@linux-foundation.org>
In-Reply-To: <aBb-yDDJLObXF8P5@localhost.localdomain>
References: <20250502083624.49849-1-osalvador@suse.de>
	<20250503200334.3f912eeb7ca484bca4eec7fd@linux-foundation.org>
	<aBb-yDDJLObXF8P5@localhost.localdomain>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 4 May 2025 07:44:40 +0200 Oscar Salvador <osalvador@suse.de> wrote:

> On Sat, May 03, 2025 at 08:03:34PM -0700, Andrew Morton wrote:
> > Why is this a problem?  Is there some bug?  Are these notifications so
> > frequent that there are significant inefficiencies here?
> 
> hi Andrew,
> 
> There is no bug, it is just suboptimal.
> 
> That the numa node state changes were tied to the memory notifier was
> something hacky and that have us bugged for a while now.
> Were mean to tidy that up but just never got around it.
> 
> Actually, first time I brought that up was when I reviewed the first implementation
> of memory demotion (~ca 3-4 years ago now?).
> 
> With the addition of yet another consumer (auto-weitght mempolicy) that was only
> interested in get notified on numa node changes, it became more clear that we
> really want to split those up.

OK, please add to the [0/N].

> > Further down-thread, Gregory tells us that Dan's patch "seems to fix
> > the underlying problem", but nobody (including Dan) told us about any
> > "problem" at all.
> 
> That is related to auto-weight mempolicy patches, not to this one.
> I _think_ Gregory means that I take it in as part of the series.

Ah, I'm glad to have company in my confusion ;)
