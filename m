Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273D41DA21
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 14:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746628063; cv=none; b=mTCa5pNYGgZbfdb0fXizYQUaRKso3gwLtnfNGGJCzGSxyrUFbqTn8Wlx5isk8Jv7/2YiQaOhW/DGoOXCoJUyqjulWx/5J8dTK1+NyjwesMmzYCPfjxtz76q+chRiv8Qo53DAcZpL5fySW7wer/1wGX+tjGQyuXKz8H/ZP6JE5ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746628063; c=relaxed/simple;
	bh=C9fIKaNn0BiGDr8jq7bKKwMZd+UwkkXpZxdlLtzwN+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ERuHSYNqMsPWAfKOVgjzFyEF1U8cTtMEUprNTmM/JuGQWfQa27qctcN7RRAvm8lo/xB4AZXCEDdUsKOBiGLuvbiyBcbwJshgDkQO244vl+FRqAnTF6nwwbVohKDQBLRWGwxQSY0RnSmsaLnPccqMgUw9WXI0e+yfol3UczVxb5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b2PS1S9Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b2PS1S9Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E847C4CEE2;
	Wed,  7 May 2025 14:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746628062;
	bh=C9fIKaNn0BiGDr8jq7bKKwMZd+UwkkXpZxdlLtzwN+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b2PS1S9ZSOX+CsB3CRUoudt+OGenobhSw9wB8itYG6KYmF6DM7HrNw2fEhCxV06nW
	 6Yqc9B99cU9Wp8zOA4JBVFWuZbKgKJKCTokS7rUzNoUoJUeWYza3McozsuWFaNXOh4
	 6y+lx5LudN8FAXc23wALNdbIu3yF0nTAOCOTq7FJJqBXXZYstYxHiRA/2QfgvVnA0c
	 j1gRfSqVeDM8ZmoYc/ozK8/Pg35/gR5s6KO5mqbOcgLJ4NhqLyiHyksPZEbiaFrcoi
	 WcUxSlIud6FHVhTcTJPJpXuPfwh+1jSfbKotr5UKPsXQr6HXxpH+JyPmIZASa+THaO
	 EWcnHlaCDFF+g==
Date: Wed, 7 May 2025 16:27:40 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v4 2/5] timers: Add the available mask in timer migration
Message-ID: <aBtt3C4dFIxNgO0q@localhost.localdomain>
References: <20250506091534.42117-7-gmonaco@redhat.com>
 <20250506091534.42117-9-gmonaco@redhat.com>
 <aBozrJ0C6yzW7oB_@localhost.localdomain>
 <3f54534266f4405fc3c6943599edd9be88becd57.camel@redhat.com>
 <aBtRSSCxyHcypo4b@localhost.localdomain>
 <9b96acdb43b80f067a34b83c5fe9fc3e79f1e3a4.camel@redhat.com>
 <aBtix0VHFCRI_Y-c@localhost.localdomain>
 <dfb2721b2619130a3b3ed45c3e6d18916faf5ccb.camel@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dfb2721b2619130a3b3ed45c3e6d18916faf5ccb.camel@redhat.com>

Le Wed, May 07, 2025 at 03:54:32PM +0200, Gabriele Monaco a écrit :
> 
> 
> On Wed, 2025-05-07 at 15:40 +0200, Frederic Weisbecker wrote:
> > Le Wed, May 07, 2025 at 02:46:39PM +0200, Gabriele Monaco a écrit :
> > > 
> > > I'm not so sure about this one though.
> > > As far as I understand [1], is preventing the user from setting
> > > different CPUs while doing isolcpus=nohz, and nohz_full= (which is
> > > now
> > > equivalent). But I seem to be able to do isolcpus=0-3 and
> > > nohz_full=4-7
> > > without any problem and I believe I'd hit the issue you're
> > > mentioning.
> > 
> > Duh!
> > 
> > > (The same would work if I swap the masks as 0 cannot be nohz_full).
> > 
> > Unfortunately 0 can be nohz_full...
> 
> Well, I haven't found what enforces it, but I wasn't able to set 0 as
> nohz_full, no matter what I tried on x86 and arm64. Not sure if 0 was
> just by chance in this case (I'm guessing it has something to do with
> tick_do_timer_cpu, I'm not quite familiar with this code).

Ah looks like you need CONFIG_PM_SLEEP_SMP_NONZERO_CPU. IIUC it's only
powerpc.

You can try to deactivate CONFIG_SUSPEND and CONFIG_HIBERNATE_CALLBACKS
otherwise.

Thanks.

-- 
Frederic Weisbecker
SUSE Labs
