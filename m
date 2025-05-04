Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033DB10E9
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 06:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746341698; cv=none; b=SJwv92TXMp65T6WOoPKLil9WJ0RuEPEWgpLwcj1N4faxN9PyXeyxACYfGU6rZJ7hzD0C1vzn3Jw1wVXGxeTJDA27tkvN4RjZqVhA8Ap+3VlIAS12NBSS3cXMdRaOnALkyVyc0J/Pi7QT2DGkj4vRQSnqls3ykTP42kKR3l9gWh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746341698; c=relaxed/simple;
	bh=cla7xa5IZZ7NgrUJLuC3yodpqpbPV05UzSPBqUEIHRc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=WjrW3m3OM6+qULthm1qO5hVHTnme0CCAZo6yYtByZkUBNp1L6P51hD6ZC0oRTBAQqP2E0lvOAgIAD/uFTJL2Rg5yBFByReTtUZVTaMDx608szowJkMEtnmJskngmoO/FSNc0i/Rh1lXCTZZmm0BLPU4NaU5gT1t7PXX4IieM25s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=rLtvYf2Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="rLtvYf2Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B03AC4CEE7;
	Sun,  4 May 2025 06:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1746341697;
	bh=cla7xa5IZZ7NgrUJLuC3yodpqpbPV05UzSPBqUEIHRc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rLtvYf2ZEh6WghhS9OUqnaFRkAMGgDbhB3XQb3D0zCEJgLlDPISv+Q5q9SJFYuXYU
	 fjz0KMpL5S0s/QMO0Zy3anQjmvsaRGMPQXrDkiQ4QtawjFmAJ0I4xKjeQwqRSOwlRz
	 k4zVhA5kcWIqQsI58jDE5AGCUsI5f33G6qRJOLEo=
Date: Sat, 3 May 2025 23:54:56 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Max Kellermann <max.kellermann@ionos.com>
Cc: song@kernel.org, joel.granados@kernel.org, dianders@chromium.org,
 cminyard@mvista.com, linux-kernel@vger.kernel.org, Kees Cook
 <kees@kernel.org>
Subject: Re: [PATCH 1/2] kernel/watchdog: add
 /sys/kernel/{hard,soft}lockup_count
Message-Id: <20250503235456.5d1c79bf716ddb2106a7127b@linux-foundation.org>
In-Reply-To: <CAKPOu+_zurvzehn+Wp=gbQxafHP9jBEPM4NcrDzb6Kd2C0MmaA@mail.gmail.com>
References: <20250502103905.3995477-1-max.kellermann@ionos.com>
	<20250503194706.d9e775fe8b24ad357cc6db89@linux-foundation.org>
	<CAKPOu+_zurvzehn+Wp=gbQxafHP9jBEPM4NcrDzb6Kd2C0MmaA@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, 4 May 2025 08:36:23 +0200 Max Kellermann <max.kellermann@ionos.com> wrote:

> On Sun, May 4, 2025 at 4:47 AM Andrew Morton <akpm@linux-foundation.org> wrote:
> > Documenation/, please?
> 
> Do you mean Documentation/ABI/testing/ ? (like
> Documentation/ABI/testing/sysfs-kernel-oops_count)
> I'll add that; I was confused by the directory name "testing" and
> didn't expect to find actual documentation there.

I find it helpful to grep around for similar things:

hp2:/usr/src/25> egrep -rl "hung_task_detect_count|warn_count|oops_count" Documentation                    
Documentation/ABI/testing/sysfs-kernel-warn_count
Documentation/ABI/testing/sysfs-kernel-oops_count
Documentation/admin-guide/sysctl/kernel.rst

I'm not sure that we've been very complete/consistent in these things. 
If you have time, please check that we've covered these things
appropriately.


> > >  Having this is useful for monitoring tools.
> >
> > Useful how?  Use cases?  Examples?
> 
> To detect whether the machine is healthy. If the kernel has
> experienced a soft lockup, it's probably due to a kernel bug, and I'd
> like to detect that quickly and easily. There is currently no way to
> detect that, other than parsing dmesg. Or observing indirect effects:
> such as certain tasks not responding, but then I need to observe all
> tasks. I'd rather be able to detect the primary cause easily - just
> like some people decided that they want to observe an oops and a
> warning counter.
> 
> We always run the latest stable kernel on our production servers, and
> this has brought great sorrow for the last year (I think the big netfs
> drama began in 6.9 or so when the pgpriv2 refactoring began). There
> have been numerous netfs/NFS/Ceph regressions, we had just as many
> production outages, and the maintainers wouldn't respond to my bug
> reports, so I had to figure it all out myself.
> The latest regression that quickly took down our servers was a
> "stable" backport of a performance optimization for epoll in 6.14.4,
> leading to soft lockups in ep_poll(), see
> https://lore.kernel.org/lkml/20250429185827.3564438-1-max.kellermann@ionos.com/
> - but we observed it only after everything had already fallen apart.
> Since our main process has switched from epoll to io_uring, only
> second-order processes were falling apart. Had we had a soft lockup
> counter, we could have noticed it earlier.

That's all great stuff, thanks.  Please include it in the [0/N]?

> > A proposal to permanently extend Linux's userspace API requires better
> > justification than an unsubstantiated assertion, surely?
> 
> The commits that added warn_count/oops_count literally only said "is a
> fairly interesting signal". See commits 9db89b411170 ("exit: Expose
> "oops_count" to sysfs") and 8b05aa263361 ("panic: Expose "warn_count"
> to sysfs"). That's quite an unsubstantiated assertion, too, isn't it?
> 
> I agree with you, but I thought the point for a soft lockup counter
> was trivial enough to see, and I didn't think you needed more
> justification than the other counters.

um, well, Kees, sorry, that wasn't a world class effort.

