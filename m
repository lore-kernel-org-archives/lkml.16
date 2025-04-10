Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6462AD21
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 02:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744250975; cv=none; b=kypmT7v8immZuv0Q4URDMZ7jBLtjrkZndrVzt6ZltiXfA4F+khm7I5dN7J5tDeQDMNqMrKMLe71EZ0NGkT4lNbWn0ebguqMp0aIJ3lyoQCEfVuIKtIjjPnzX9Hld5SUrI2uYKp+OoOyDbB3GbPGh9C/lIVKRHOrp8g6gfrqAfmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744250975; c=relaxed/simple;
	bh=vsazE7r5NTBPE2Muje7CVYR3FyILACBTq3Phk5+GYoc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=AbEndJwYzI9An5C6bcrmKltyW7QvLd/CeyoPl1uIZx3JsYMkhBH564mzSfbed+k3BCh/Mzx+V1iCvjCYjH/h6YOsPFL7aTgvD+cC0UeLcHGdCTomME4z4f5It8UcaRSTW1pfbgUquR9JhDuxOJWiAktfWZSvTuKzZqwIMEeUqwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=FThdxGyj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="FThdxGyj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ECC2C4CEE2;
	Thu, 10 Apr 2025 02:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1744250974;
	bh=vsazE7r5NTBPE2Muje7CVYR3FyILACBTq3Phk5+GYoc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FThdxGyjH6qfxb1s2aOzCMgKCE7KRlva3utdeLwr2AiVILt16rrA5/qK/Fy38x169
	 sDhj4fDttsoLJe0vm0vWfRTe1v/sMZAQmgNY6RkYJrv+Hs37Q4/j/4i+h+7tleTkj1
	 E/zth22DFMQLvxNRaGzuOYzmVR/4taGYyShgM0SE=
Date: Wed, 9 Apr 2025 19:09:33 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Zhongkun He <hezhongkun.hzk@bytedance.com>
Cc: hannes@cmpxchg.org, mhocko@suse.com, yosry.ahmed@linux.dev,
 muchun.song@linux.dev, yuzhao@google.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 1/3] mm: add swappiness=max arg to memory.reclaim for
 only anon reclaim
Message-Id: <20250409190933.3f08db6d6c1f13bc14a170f9@linux-foundation.org>
In-Reply-To: <720e8e2c5b84efed5cf9980567794e7c799d179a.1744169302.git.hezhongkun.hzk@bytedance.com>
References: <cover.1744169302.git.hezhongkun.hzk@bytedance.com>
	<720e8e2c5b84efed5cf9980567794e7c799d179a.1744169302.git.hezhongkun.hzk@bytedance.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  9 Apr 2025 15:06:18 +0800 Zhongkun He <hezhongkun.hzk@bytedance.com> wrote:

> With this patch 'commit <68cd9050d871> ("mm: add swappiness= arg to
> memory.reclaim")', we can submit an additional swappiness=<val> argument
> to memory.reclaim. It is very useful because we can dynamically adjust
> the reclamation ratio based on the anonymous folios and file folios of
> each cgroup. For example,when swappiness is set to 0, we only reclaim
> from file folios.
> 
> However,we have also encountered a new issue: when swappiness is set to
> the MAX_SWAPPINESS, it may still only reclaim file folios.
> 
> So, we hope to add a new arg 'swappiness=max' in memory.reclaim where
> proactive memory reclaim only reclaims from anonymous folios when
> swappiness is set to max. The swappiness semantics from a user
> perspective remain unchanged.
> 
> For example, something like this:
> 
> echo "2M swappiness=max" > /sys/fs/cgroup/memory.reclaim
> 
> will perform reclaim on the rootcg with a swappiness setting of 'max' (a
> new mode) regardless of the file folios. Users have a more comprehensive
> view of the application's memory distribution because there are many
> metrics available. For example, if we find that a certain cgroup has a
> large number of inactive anon folios, we can reclaim only those and skip
> file folios, because with the zram/zswap, the IO tradeoff that
> cache_trim_mode or other file first logic is making doesn't hold -
> file refaults will cause IO, whereas anon decompression will not.
> 
> With this patch, the swappiness argument of memory.reclaim has a new
> mode 'max', means reclaiming just from anonymous folios both in traditional
> LRU and MGLRU.
> 
> ...
>
> --- a/Documentation/admin-guide/cgroup-v2.rst
> +++ b/Documentation/admin-guide/cgroup-v2.rst
> @@ -1348,6 +1348,9 @@ The following nested keys are defined.
>  	same semantics as vm.swappiness applied to memcg reclaim with
>  	all the existing limitations and potential future extensions.
>  
> +	The valid range for swappiness is [0-200, max], setting
> +	swappiness=max exclusively reclaims anonymous memory.

Being able to assign either a number or a string feels a bit weird. 
Usually we use something like "-1" for a hack like this.  eg,
NUMA_NO_NODE.

Perhaps we just shouldn't overload swappiness like this.  Add a new
tunable (swappiness_mode?) which can override the swappiness setting.

I guess it doesn't matter much.  We're used to adding messy interfaces ;)


