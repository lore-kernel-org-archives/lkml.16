Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148111D6193
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747939403; cv=none; b=FftFQHlH1W6h3V3y4x1S5vF9vE1p8eXmZ27EhH/M/S9K68BW7py+b8Hn0nisOamAPiMFL9Y59CvvksJxgsmOXblMEX2iqan2jIDCSPsuC3sKyNxJy0oQ21NCyVAqA1yugfhGYNymd8hmnPTQFYA4tyUBO6shNaOx1BHLY1O9OjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747939403; c=relaxed/simple;
	bh=lEwq1w3AlBRqTR3Kjy1rxwBxEux2NoIMVA2TiZeoiqE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aPDuSYVDWhSu8JtibxY2OLxs3waOHlK9YXYXdgD9DFVCeREnnF4wKD2LoG9cxNYLR9s9xGc1571TnvlWhcSbSnF9ar+nC2fTnlfD8krrvI3XOTYr0571VN2jJH26sne6HQEzSFvxpr7hdaTufxycUupgg+M8oI+5vy4YDzz8dVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vfh2vd3e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vfh2vd3e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52F94C4CEE4;
	Thu, 22 May 2025 18:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747939402;
	bh=lEwq1w3AlBRqTR3Kjy1rxwBxEux2NoIMVA2TiZeoiqE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vfh2vd3eOHUlJYqsmycvj46bUZ5EJlr6vnbHAR+yAOA7NKbR4LYwmQqjSdc4M2Hpd
	 TaySuHzt7uN++7B8iIOLvk1Kh+h3+LNi94UDGZOfMOGCSWWLL7MZRji5H/4q/JG87P
	 CdJd8zOQwDO+XqbLyzvylVlEhJ+S0Dm8EtJq2qond5SSZfYNXRwZfNdx3M2zAhUekM
	 CS5Z/NS8ugVIhtSQdJmjq4JNlT9HfoIPJ2C543AtdXBmXxAMDpgIYwRS/IScv8IQOU
	 oYWpqfZlhxBFOHKAG/5RIE8bDGuZ6rn754PPGwuhI1Vcizz2mNqs331HdrLutSD18/
	 oZ9H5CVQa4TFA==
From: SeongJae Park <sj@kernel.org>
To: SeongJae Park <sj@kernel.org>
Cc: Bharata B Rao <bharata@amd.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Jonathan.Cameron@huawei.com,
	dave.hansen@intel.com,
	gourry@gourry.net,
	hannes@cmpxchg.org,
	mgorman@techsingularity.net,
	mingo@redhat.com,
	peterz@infradead.org,
	raghavendra.kt@amd.com,
	riel@surriel.com,
	rientjes@google.com,
	weixugc@google.com,
	willy@infradead.org,
	ying.huang@linux.alibaba.com,
	ziy@nvidia.com,
	dave@stgolabs.net,
	nifan.cxl@gmail.com,
	joshua.hahnjy@gmail.com,
	xuezhengchu@huawei.com,
	yiannis@zptcorp.com,
	akpm@linux-foundation.org,
	david@redhat.com
Subject: Apologies and clarifications on DAMON-disruptions (was Re: [RFC PATCH v0 0/2] Batch migration for NUMA balancing)
Date: Thu, 22 May 2025 11:43:14 -0700
Message-Id: <20250522184314.57708-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250521184552.46414-1-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 21 May 2025 11:45:52 -0700 SeongJae Park <sj@kernel.org> wrote:

[...]
> I think (or, hope) it would also be not very worthless or rude to mention other
> existing and ongoing works that have potentials to serve for similar purpose or
> collaborate in future, here.
> 
> DAMON is designed for a sort of multi-source access information handling.  In
> LSFMM, I proposed[1] damon_report_access() interface for making it easier to be
> extended for more types of access information.  Currenlty damon_report_access()
> is under early development.  I think this has a potential to serve something
> similar to your single source goal.
[...]

I heard some people are feeling uncomfortable about patterns on my mails like
this.  I understand the pattern is that I suddenly replying to a thread saying
"hey, by the way DAMON is ...", and I understand it bothers people when they
wanted to discuss about something more than DAMON.

I never intended to make others feel uncomfortable but was doing that with only
good faith to make discussions be made with full information.  But if you felt
so, you felt so.  I sincerely feel sorry if you felt so, and will try my best
to not bother you next time.

But, I'm a human and I cannot do something more than my best effort.  I hence
expect I will unintentionally continue making people upset.  I think I migt be
able to reduce such cases by explaining why and what I'm doing, and how you can
avoid it.

Yes, I might bothering you with exactly the pattern now, but let me do this
hopefully as the last time, to reduce next recurrences.

TL; DR: please briefly mention DAMON and optionally clarify DAMON discussion
and/or clarifications are unwelcome for now, if you don't want to be bothered
by DAMON.

Why and What I'm Doing
======================

I sometimes find threads of works that seem related with DAMON.  From such
mails, I find opportunities to help the work using DAMON, shiny features of
the work that DAMON could adopt, or whatever makes me believe so.  Such mails
sometimes contain explanations of such relations, and sometimes not.

In some cases such relations description has some details that look important
on the context but missed, outdated, or wrong.  I believe I have a
responsibility to add or fix those as a maintainer of DAMON for making Linux
kernel healthier with discussions under full information, and so jump in.

If there is no such relations description at all, I have no ability to know if
they just don't know about DAMON, mistakenly didn't add the part, or want to
ignore DAMON at the moment.  Hence again I believe it is a responsibility of
DAMON maintainer to tell about it, to help the original author and other
reviewers' understanding.

I think sometimes you didn't want to discuss or know such details of DAMON but
I was jumping in and waste your time since I misread your intention.

How You Can Prevent I Bothering You with DAMON
==============================================

Please help me better understand your intentions.  If you knwo DAMON and you
feel I may find your work is related with DAMON, please take a moment to add a
brief paragraph explaining it.  If you don't want me adding more details that I
believe worthy to be added there, or don't want to discuss in that detail of
DAMON, please mention so.  E.g., "this may have potential relations with DAMON,
but that's out of the scope at the moment."

I will also do my best to read implicit intention, but again, the best effort
is the best effort and I cannot promise something I cannot do.


Thanks,
SJ

[...]
