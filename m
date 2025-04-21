Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D30012B17C;
	Mon, 21 Apr 2025 06:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745218149; cv=none; b=Phk+ixGec4+h1Pgk1gm0FLeUUZB6Bs1+YqOWNyg0l2xHcwBfbVNV5wyAtXN57gEokEjXAP6eI1Hu7Z7b+7Qp/aj83a6lYipfdZxi+h3gGmahV5I+QdyMq7nTWP5wRzyXE9WYn2w04qEhitQy35RF50A0tKJfpQppnyauji66/Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745218149; c=relaxed/simple;
	bh=UG2mt44Cq5UjFNZKjNkTHmal4so1Q5Z9bh2IS+IBsfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oq21n2G2li86cfAC6FgybQUwkuODQr2sCSs2YkSfXEEI98VLGh8HEyVqQINsRQvUtsrnWXF805YmMth8KnX7t9gWdZTe6rycbkPLO4YAPWvt6xsRH9Wmk+g7xmWHRjkiIA2ED8DwRNU1Kxf6irN5ueMHMHGJ73ouIjgnrG1tobY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=df6c95Te; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="df6c95Te"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BF9EC4CEE4;
	Mon, 21 Apr 2025 06:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745218148;
	bh=UG2mt44Cq5UjFNZKjNkTHmal4so1Q5Z9bh2IS+IBsfQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=df6c95Te3OviLdsVj8rDLaPdy8wvBRr+zBFwjiU1Z9ZACZKvSByCOK622Bvp4z7Pk
	 q/PTc0LlzU0mKeSG48KUqasaR/uaajo88+hNoGJOiTZ8sf6nlmg3eymA/rXCyFkkVo
	 kJTALuUEUm5ojTfP1Pf5/G0yvGq1epIOO6aBIDgc=
Date: Mon, 21 Apr 2025 08:49:04 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Wang Zhaolong <wangzhaolong1@huawei.com>
Cc: cve@kernel.org, linux-kernel@vger.kernel.org,
	linux-cve-announce@vger.kernel.org
Subject: Re: CVE-2025-22077: smb: client: Fix netns refcount imbalance
 causing leaks and use-after-free
Message-ID: <2025042111-provable-activism-ec0e@gregkh>
References: <2025041612-CVE-2025-22077-d534@gregkh>
 <fa7af63c-899e-4eb5-89d2-27013f4d2618@huawei.com>
 <bf2e5c68-e20c-437e-9aa8-1b5326f4fd14@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bf2e5c68-e20c-437e-9aa8-1b5326f4fd14@huawei.com>

On Mon, Apr 21, 2025 at 10:59:47AM +0800, Wang Zhaolong wrote:
> 
> Given these findings, I recommend updating CVE-2025-22077 to reflect that the true fix
> is the reversion of e9f2517a3e18 (via commit 95d2b9f693ff).

Please do not top-post, it makes things impossible to quote properly :(

Anyway, I do not understand, sorry.  You are saying that commit
(95d2b9f693ff) is just reverting other attempts at fixing a bug, that
were not fixed properly.  So why would that commit be assigned a CVE if
the bugs were not being fixed properly?  What vulnerability does that
commit itself fix?

> > Dear CVE Community,
> > 
> > As the author of commit 4e7f1644f2ac ("smb: client: Fix netns refcount imbalance
> > causing leaks and use-after-free"), I want to clarify some confusion around the
> > proper fixes for these issues:
> > 
> > 1. Commit 4e7f1644f2ac is currently associated with CVE-2025-22077. However, this
> > patch was merely attempting to fix issues introduced by commit e9f2517a3e18 ("smb:
> > client: fix TCP timers deadlock after rmmod").

Did it not fix those issues?  If not, we can reject that CVE, please let
us know.

> > 2. As I've previously discussed with Greg Kroah-Hartman on the kernel mailing list[1],
> >     commit e9f2517a3e18 (which was intended to address CVE-2024-54680):
> >     - Failed to address the actual null pointer dereference in lockdep
> >     - Introduced multiple serious issues:
> >       - Socket leak vulnerability (bugzilla #219972)
> >       - Network namespace refcount imbalance (bugzilla #219792)

So this commit did not actually do anything?  If so, we can reject this
CVE.

> > 3. Our testing and analysis confirms that the original fix by Kuniyuki Iwashima,
> > commit ef7134c7fc48 ("smb: client: Fix use-after-free of network namespace."), is
> > actually the correct approach. This patch properly handles network namespace
> > reference counting without introducing the problems that e9f2517a3e18 did.

But you say that commit is broken?

> > 4. The proper resolution for these issues was ultimately commit 95d2b9f693ff
> > ("Revert 'smb: client: fix TCP timers deadlock after rmmod'"), which reverted
> > the problematic patch. In the latest Linux mainline code, the problematic patch and
> > my subsequent fix patch have been reverted.[2][3]
> > 
> > Thank you for your attention to this matter. I'm happy to provide additional details if needed.

So, everything is now reverted and we are back at the beginning with the
original problem?

I'm sorry, but I really do not understand here what to do.  What exactly
are you wanting us to do?  Is the issue resolved?  If not, why not?  If
so, what commit fixed it?  Are there CVEs assigned to commits that are
not actually fixes?

totally confused,

greg k-h
