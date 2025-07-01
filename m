Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800D9270EA4
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 12:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751373413; cv=none; b=FPiR3l7iWdE24O0FK1o53CTua9xonUUoVeL3Awc+IjhS+bb2h6Gmn+jLidfM4bZVZ811ypgsgUG+dOXsWmHLI2I3xtgzW2YC2aj//08eJJU2EZAsKwO+gBkAmhe7iHhO3L7Ri/OKEZtAb+3BAwc8QsPosbeixmg+fQo9fvGQeVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751373413; c=relaxed/simple;
	bh=Yumc9AHeSxWJ3coM6Cuqca/8lTYWSOzPlXbAdw+pVFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eOJA3/xI7W9b1ZekfM9hqVcggziiQ6iewp0TeECQWGfntGgO3ilsghJ1T1v+Tdu4VRNJSEfKStW9nKmYUSkfhKmIHd5UjzyET1Vj59Rfj1ERl3eebwKDcpDsu5qMTjetTD0rn9+zxvi9u5Hcd40JyOwVeYp6R61YlEEOAhEzDVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RrPWcxei; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RrPWcxei"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBA0FC4CEEB;
	Tue,  1 Jul 2025 12:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751373412;
	bh=Yumc9AHeSxWJ3coM6Cuqca/8lTYWSOzPlXbAdw+pVFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RrPWcxeixCM3W7sim7nZSuobUqXJHrON0fkntXopA5Io0TA/CMJSG13FGTOH2PMX3
	 aAVgwErG0tcoub1fBtUV+J+5SrdFOVRua3w2gs165x3aHnl06aPizxoZNABwRJH3QN
	 39oxikGCdAVhqHKaikTqlaP+lAMCIveu4dwlA2J9DpXiEPeqsDyI2/fS/vVfr4Wh/S
	 x/WISXyRKhrSJibJiXp7MucQhqP7KXak4829yd1SgkZWfL/2j2ytIXwEPlDe3YIlcm
	 zj3agkGp4sbWpgeZqgsP+1LfAKrmFSj1N1ySaivUlH5bIv/r8JUehXJ9HQrGs9LxJC
	 DobUS98w2Cl+w==
Date: Tue, 1 Jul 2025 14:36:49 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Hillf Danton <hdanton@sina.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Oleg Nesterov <oleg@redhat.com>,
	Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 0/6 v3] sched/mm: LRU drain flush on nohz_full
Message-ID: <aGPWYWKKWhr2rxMG@localhost.localdomain>
References: <20250410152327.24504-1-frederic@kernel.org>
 <20250412025831.4010-1-hdanton@sina.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250412025831.4010-1-hdanton@sina.com>

Le Sat, Apr 12, 2025 at 10:58:22AM +0800, Hillf Danton a écrit :
> On Thu, 10 Apr 2025 17:23:21 +0200 Frederic Weisbecker wrote
> > Hi,
> > 
> > When LRUs are pending, the drain can be triggered remotely, whether the
> > remote CPU is running in userspace in nohz_full mode or not. This kind
> > of noise is expected to be caused by preparatory work before a task
> > runs isolated in userspace. This patchset is a proposal to flush that
> > before the task starts its critical work in userspace.
> > 
> Alternatively add a syscall for workloads on isolated CPUs to flush
> this xxx and prepare that yyy before entering the critical work, instead
> of adding random (nice) patches today and next month. Even prctl can
> do lru_add_and_bh_lrus_drain(), and prctl looks more preferable over
> adding a syscall.

In an ideal world, this is indeed what we should do now. And I still wish we
can do this in the future.

The problem is that this has been tried by the past and the work was never
finished because that syscall eventually didn't meet the need for the people
working on it.

I would volunteer to start a simple prctl to do such a flush, something that
can be extended in the future, should the need arise, but such a new ABI must
be thought through along with the CPU isolation community.

Unfortunately there is no such stable CPU isolation community. Many developers
in this area contribute changes and then switch to other things. As for the CPU
isolation users, they are usually very quiet.

I can't assume all the possible usecases myself and therefore I would easily do
it wrong.

In the meantime, the patchset here is a proposal that hopefully should work for
many usecases.

Thanks.

-- 
Frederic Weisbecker
SUSE Labs
