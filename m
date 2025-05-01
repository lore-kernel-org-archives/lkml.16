Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF3DB67F
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 08:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746089739; cv=none; b=WRc7M5/d9s0X+pG8QmzT8krC+RmfcKIvct6UMgWaPYIpw/Ev5/M+K4KKebRFG7ThGo/G89oaNPLoPEZXopyQKfVkb0FEz3uwml8QkLhFCB7/5JY5GunUkDR1KFqJawN9b5BuizYt7QwU0UUdu0cQbsoLE0PkJXuyuNMI36c6ppg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746089739; c=relaxed/simple;
	bh=SlVi0/BSmX2vb8tyXVizfje9O7OcfWRFgtd7prtLpnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WJYMY8Vf6f0XRXL9wIjvAVUJGMSoh6bfipvhGWoHs17UTZzrxJkYvfDShEY5FuNJ8vBJo82pT9NwYGzwusMeR/4fBtG2Al18KXmTDeaM9AYmkQ92cGxw80iU3rovGpeXrECe7L7W96haD4LUFdkuGkmCWh7JKHr2gU92PBjA6Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=MhLjr99p; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="MhLjr99p"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4lpbbYsla8wtuknvysAOPd2xpva+DiE0XltFPnJO3Y4=; b=MhLjr99pthdBhYbJBrF4PFtk7Z
	UE66QGEYckhx4SecO7icIV31QkDSDD6SgujBmVq6OCXjgCVzhuKrQaqUBLJ/FVAyeNhHBlNcZleUZ
	w+hNkZGB/PFSkI7jXK6bgSGSgT8mwtZOhzP12QWCmtmNEGSIvdMl948rFxNwcvyTviy7TPwfDyHSr
	1khEJ/JSJ+K5SJ0igS5VDcDd+PjjMJO4CXiagUXSkDCiClJsfxcqlFgJ4unfErFD34EgbI9MiCy3i
	Wo/Enr3OfbJi8OsMSll2G8pbIGndTkwEi2hctfxoWJfrzpvGwK64/QSQqSIfmsFxcqh7yqubDDjCF
	4QSYcvOQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uAPhZ-0000000DwYA-3TmI;
	Thu, 01 May 2025 08:55:30 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 152F730057C; Thu,  1 May 2025 10:55:29 +0200 (CEST)
Date: Thu, 1 May 2025 10:55:28 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Carlos Bilbao <bilbao@vt.edu>
Cc: Andrew Morton <akpm@linux-foundation.org>, seanjc@google.com,
	carlos.bilbao@kernel.org, tglx@linutronix.de, jan.glauber@gmail.com,
	pmladek@suse.com, jani.nikula@intel.com,
	linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
	takakura@valinux.co.jp, john.ogness@linutronix.de, x86@kernel.org
Subject: Re: [PATCH v3 0/2] Reduce CPU consumption after panic
Message-ID: <20250501085528.GR4439@noisy.programming.kicks-ass.net>
References: <20250429150638.1446781-1-carlos.bilbao@kernel.org>
 <20250429133941.063544bb4731df0ef802440c@linux-foundation.org>
 <20250429210650.GD4439@noisy.programming.kicks-ass.net>
 <433c6561-353e-4752-b9cf-155e49e62e63@vt.edu>
 <20250429221049.GG4439@noisy.programming.kicks-ass.net>
 <94faa778-38d5-4ea5-aa0d-9259b56999a4@vt.edu>
 <20250430084852.GN4198@noisy.programming.kicks-ass.net>
 <2e075491-538c-40e1-8086-5405aecb2779@vt.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2e075491-538c-40e1-8086-5405aecb2779@vt.edu>

On Wed, Apr 30, 2025 at 01:54:11PM -0500, Carlos Bilbao wrote:

> > All that said... the default more or less does for(;;) { mdelay(100) },
> > if you have a modern chip that should not end up using much power at
> > all. That should end up in delay_halt_tpause() or delay_halt_mwaitx()
> > (depending on you being on Intel or AMD). And spend most its time in
> > deep idle states.
> > 
> > Is something not working?
> 
> Well, in my experiments, that’s not what happened -- halting the CPU in VMs
> reduced CPU usage by around 70%.

Because you're doing VMs, and VMs create problems where there weren't
any before. IOW you get to keep the pieces.

Specifically, VMs do VMEXIT on HLT and this is what's working for you.

On real hardware though, HLT gets you C1, while both TPAUSE and MWAITX
can probably get you deeper C states. As such, HLT is probably a
regression on power.

> How would folks feel about adding something like
> /proc/sys/kernel/halt_after_panic, disabled by default? It would help in
> the Linux use cases I care about (e.g., virtualized environments), without
> affecting others.

What's wrong with any of the existing options? Fact remains you need to
configure your VMs properly.
