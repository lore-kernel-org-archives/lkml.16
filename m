Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 250ED5227
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 12:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748868709; cv=none; b=YH0+zdsiRIW4dpkXXSFArn7GFkTI5I1w0t88Ua+TCmFnauhHJGOfLgl2HrxzXrBmB7MMDNYoul17pYtD/GUPHnt4zWgsTpUgogLtKuNnXNaDgFshYRrtx2Wkq+M/0s+bkWJSSxuZpP6WBQwTH8tsLfg33fU6jqJTsI9uwWL1T6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748868709; c=relaxed/simple;
	bh=+yfCM/EClgWWkpk9IoipwgfY8bVWf7viLpi0NbVr2P0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nLYvMMOEeYKJttp49uhixjmWCYLVPPU1m2sHhqCOH3VIbLz8zsdn8XFE7VvLlqHjYB2Rbvt3DaR+v98eUWNn3CF226Umxyl+NUI5115nK1Fi7bxWKTKbL4BkFDBaZxD7WR2jDACBf8GAqhIdSOdWIxeDP+VaIxuLOo1z7CZGvVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE4281424;
	Mon,  2 Jun 2025 05:51:29 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 373FE3F59E;
	Mon,  2 Jun 2025 05:51:45 -0700 (PDT)
Date: Mon, 2 Jun 2025 13:51:41 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Giovanni Gherdovich <giovanni.gherdovich@suse.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, cve@kernel.org,
 linux-kernel@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>, "Rafael
 J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: CVE-2025-37832: cpufreq: sun50i: prevent out-of-bounds access
Message-ID: <20250602135141.0b332772@donnerap.manchester.arm.com>
In-Reply-To: <805e1a14-7f07-47f0-ba86-f326e4ecea01@suse.com>
References: <2025050824-CVE-2025-37832-e235@gregkh>
	<1db6d340-bfae-4d81-a1d1-dcbd7bc1294f@suse.com>
	<2025053006-multitask-profanity-3590@gregkh>
	<2025053010-legible-destiny-23d3@gregkh>
	<805e1a14-7f07-47f0-ba86-f326e4ecea01@suse.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 30 May 2025 20:00:37 +0200
Giovanni Gherdovich <giovanni.gherdovich@suse.com> wrote:

Hi,

I don't think this qualifies as a CVE, the issue was more theoretical. But
I don't have much experience with what deserves a CVE and what not, so I
can just present some insights:

> On Fri May 30, 2025 16:15, Greg KH wrote:
> > On Fri, May 30, 2025 at 04:14:51PM +0200, Greg KH wrote:  
> >> On Fri, May 30, 2025 at 03:57:35PM +0200, Giovanni Gherdovich wrote:  
> >>> On Thu May 8, 2025 08:39, Greg Kroah-Hartman wrote:  
> >>>> A KASAN enabled kernel reports an out-of-bounds access when handling the
> >>>> nvmem cell in the sun50i cpufreq driver:
> >>>> [...]  
> >>>
> >>> The invalid data that may be read comes from a ROM in the SoC,
> >>> programmed by the vendor, and is only used to configure CPU frequency
> >>> and voltage in the cpufreq framework.

So "potentially invalid data read from the ROM" is an issue the we have
regardless, this patch doesn't change that. And you cannot put arbitrary
voltages or frequencies in the OTP fuses, the value read is just used to
select one of the OPPs defined in the DT. If you want to attack the
system by heavily overclocking or baking it with a high voltage, you can
just change the limits in the DT. Not sure if that's easier or harder than
accessing the hardware, though.

But more importantly, looking at this particular patch: This effectively
limits the access size of the value we read from the SID OTP driver, from
always 4 bytes to what the DT says, typically 2 bytes. But we actually
mask the value in the code anyway later at the moment, so the upper 16
bits are always discarded.
Which means that as it stands at the moment, there is no real change in
what values are used. I just did the change as it was clearly incorrect,
and I wanted to prevent any issues, in case of code changes later.

Hope that helps!

Cheers,
Andre

> >>>
> >>> Even assuming that improper frequency/voltage settings constitute a
> >>> security risk, writing to the ROM in question is at least a privileged
> >>> operation, and may require physical access to the SoC.  
> >>
> >> Obviously there are systems out there that have this issue, with device
> >> trees that can trigger this issue, this isn't a matter of "malicious ROM
> >> doing bad things" type of issue, it's a "the DT can't express this
> >> properly, so we might have taken data from the hardware and handled it
> >> in the wrong way" type of issue.
> >>  
> >>> I don't think this qualifies as vulnerability.  
> >>
> >> I don't see how this is a ROM configuration issue, but rather just a
> >> kernel bug in how the hardware is accessed on different types of systems
> >> where we previously could not handle such accesses correctly.  
> 
> Thanks for clarifying this aspect. I'll move to a different objection,
> which is that the incorrect power management configuration that may
> result from this bug doesn't constitute a security vulnerability.
> It seems to me the CPU won't run at the intended clock, which is
> definitely a bug but not a CVE.
> 
> I'm CC'ing the change author and the subsystem maintainers to hear their
> opinion.
> 
> > Note, if the maintainer or the developer of the change in question here
> > disagrees with me, great, we'll be glad to revoke this CVE, as we defer
> > to them.  But for some reason you didn't include them in this thread :(  
> 
> Sure, you're right, I forgot to include them, fixed now.
> 
> Yangtao Li, Rafael, Viresh, Andre:
> I'm asking Greg and the kernel CNA to reconsider the assignment of CVE
> status to the bug fixed by 14c8a418159e541d70dbf8fc71225d1623beaf0f
> ("cpufreq: sun50i: prevent out-of-bounds access").
> You can find the CVE announcement email at
> https://lore.kernel.org/linux-cve-announce/2025050824-CVE-2025-37832-e235@gregkh/
> 
> If any of you thinks the status of CVE is well justified in this case,
> I'd appreciated if you could reply here, so I can make a mental note
> for similar future cases.
> 
> Thanks,
> Giovanni

