Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE32C2563
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 16:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746895233; cv=none; b=ugTowQ1aFDrY2lKiAV6Z5AwGU165oy8rOEOTXmYofkucxXv/u1fpT8XOblFHEQMog4uO/UNhyE2Q81LuicbqB9GZ0hECSX1Y/6vnXSyTxG0pOLGgQ3t+VsgqnACzUH+JEmMdMvXwURU3Vy59Gp2nkEDv7icsmzByR33zc33u9ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746895233; c=relaxed/simple;
	bh=V76YZpQxAQU0cNM6QNbybr1eHBBMhELuI/DfvKdgNGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sGhy2GbwyQH+zjmIUaDrNNDmC3voHERyHpMHR9VZIC8VAYbyHdRrhJbB6bnofHubC1y1qtees3omXXGn6RO98dTeKtwBABjuzmaxsDxcHv1rv9qQq2I5Hr/+WOkWCvUpiQ/5QVOPFdnbBzwMVOjGnkkmSPmRtJ7Y3bNb5UfVgmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ut+mJpBU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ut+mJpBU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A17A8C4CEE2;
	Sat, 10 May 2025 16:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746895232;
	bh=V76YZpQxAQU0cNM6QNbybr1eHBBMhELuI/DfvKdgNGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ut+mJpBUuZaVzqwgvUwi679NxVscWNy6hGfEBFMHLkoyIDkBMbKenPvweC8XGE9/6
	 M6GvC6+N0AYeUS6tbYZZ1I/0FdtGKv9DshEVa5H9XMumPr3aKOSl+drKBiUGp6mQpQ
	 uOMz5ToeHLE7w41YTclUyXq3BMkYWKIaCVmedm6g=
Date: Sat, 10 May 2025 18:40:29 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [GIT PULL] Driver core fix for 6.15-rc6
Message-ID: <2025051049-scion-sustained-a2e7@gregkh>
References: <aB9aTNHuSV-5U15D@kroah.com>
 <CAHk-=wgiZ2kk73wU58o8B8_5fuNLReGQkGo_8HXsnsCE_YUsBw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgiZ2kk73wU58o8B8_5fuNLReGQkGo_8HXsnsCE_YUsBw@mail.gmail.com>

On Sat, May 10, 2025 at 09:00:25AM -0700, Linus Torvalds wrote:
> On Sat, 10 May 2025 at 06:53, Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git driver-core-6.15-rc6
> 
> I suspect you forgot to push out, or it's in some other tree.
> 
> Because there's no such tag in that git repo.

Argh, yes, we moved the tree as it's now shared, but I forgot to update
my script.  It's really at git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

I'll resend this with the proper location, sorry about that.

greg k-h
