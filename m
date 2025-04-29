Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD673C30
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 22:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745967212; cv=none; b=W9vwQgRN4V3P6Qd5yBB0CNmoh4OjBSeH10g1KKHavSDCtImBChhAwpNjWKUKKiu72AIUuJim4FrzsywUFEplV6YUju2I5LlQpJoglm+fUUc5rPsGix10WWpz/aGMTxTgi4zRK2rn5CnLe1b+tS6HhAt8WmOLbOhu0Ke9jDA6SpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745967212; c=relaxed/simple;
	bh=xZFHk+WaVC7to2xxISx0Q9yhatntxEqd3v9nUB92JWI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=mP1uwk+wFQreg0kiqOQeahfi2hK5zUSXxsg9WEkaMThze/vRN1z9cCgdHF8jblBm/g0lZqXdMhuZHpuxDnJFd/9pbGJVc2ghJ3cvPmVkmCaG5LFGO5zhUiTRIP3jCVnrN91Duwp0txBLCd25OFwk4tasjjf1oKAHUcqzJJB3Z6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=2YnkWT7k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="2YnkWT7k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D900BC4CEE3;
	Tue, 29 Apr 2025 22:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1745967210;
	bh=xZFHk+WaVC7to2xxISx0Q9yhatntxEqd3v9nUB92JWI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=2YnkWT7k85PFW7TJjBaN9M4mVpr/IK6zgOmOV/OCAIsk3n4lqIi0bv6UZPnfD1Nif
	 pyEts6ZZyvsVV+rcHbquX1wg4SVUQUXNdiZLTWp+qU/ffJ7aqyv5nGOBIZcQDm/7hf
	 6WWqpZhG3kb8F4zv8RKDpaLaB02Kq17aTLUw2dwM=
Date: Tue, 29 Apr 2025 15:53:29 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Carlos Bilbao <bilbao@vt.edu>
Cc: carlos.bilbao@kernel.org, tglx@linutronix.de, seanjc@google.com,
 jan.glauber@gmail.com, pmladek@suse.com, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 takakura@valinux.co.jp, john.ogness@linutronix.de, x86@kernel.org
Subject: Re: [PATCH v3 0/2] Reduce CPU consumption after panic
Message-Id: <20250429155329.73bd3f5835e8d6a2864873f9@linux-foundation.org>
In-Reply-To: <96516ac6-777a-469a-b5d3-9897a0e40de5@vt.edu>
References: <20250429150638.1446781-1-carlos.bilbao@kernel.org>
	<20250429133941.063544bb4731df0ef802440c@linux-foundation.org>
	<96516ac6-777a-469a-b5d3-9897a0e40de5@vt.edu>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 29 Apr 2025 15:17:33 -0500 Carlos Bilbao <bilbao@vt.edu> wrote:

> Hey Andrew,
> 
> On 4/29/25 15:39, Andrew Morton wrote:
> > (cc more x86 people)
> > 
> > On Tue, 29 Apr 2025 10:06:36 -0500 carlos.bilbao@kernel.org wrote:
> > 
> >> From: Carlos Bilbao <carlos.bilbao@kernel.org>
> >>
> >> Provide a priority-based mechanism to set the behavior of the kernel at
> >> the post-panic stage -- the current default is a waste of CPU except for
> >> cases with console that generate insightful output.
> >>
> >> In v1 cover letter [1], I illustrated the potential to reduce unnecessary
> >> CPU resources with an experiment with VMs, reducing more than 70% of CPU
> >> usage. The main delta of v2 [2] was that, instead of a weak function that
> >> archs can overwrite, we provided a flexible priority-based mechanism
> >> (following suggestions by Sean Christopherson), panic_set_handling().
> >>
> > 
> > An effect of this is that the blinky light will never again occur on
> > any x86, I think?  I don't know what might the effects of changing such
> > longstanding behavior.
> 
> Yep, someone pointed this out before. I don't think it's super relevant? 

Why not?  It's an alteration in very longstanding behavior - nobody
knows who will be affected by this and how they will be affected.

> Also, in the second patch, I added a check to see that there's no console
> output left to be flushed.

It's unclear how this affects such considerations.  Please fully
changelog all these things.

> 
> > 
> > Also, why was the `priority' feature added?  It has no effect in this
> > patchset.
> > 
> 
> This was done to allow for flexibility, for example, if panic devices
> wish to override the default panic behavior.

There are no such callers.  We can add this feature later, if a need is
demonstrated.

> Other benefits of such
> flexibility (as opposed to, for example, a weak function that archs can
> override) were outlined by Sean here:
> 
> https://lore.kernel.org/lkml/20250326151204.67898-1-carlos.bilbao@kernel.org/T/#m93704ff5cb32ade8b8187764aab56403bbd2b331

Again, please fully describe these matters in changelogging and code
comments.
