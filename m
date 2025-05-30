Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD036273FE;
	Fri, 30 May 2025 14:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748614553; cv=none; b=XcV96tWIdqSXJIQX1wYoFg+IEnoJdm3X+NayKQqu1HypKnDxPYGX+Z8BQoVXxlVIVhxD40PIlPKUovVmedEIzM7NiBdUDPPVaZr4R4CdS1JjyiH0Ki1Kiu5Vd1pbpIfz++/DSCRTO7hIsHHbgpmvOTH19+YKmY5EaOyI69mut4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748614553; c=relaxed/simple;
	bh=A4LnFuYc2L5vHO1Q/YLKYIygxkVBYLeUccYIYNErrG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GZDBRcGLELXU2B2JtykVbtG8HPA4ZyKvawfSwk25kGQpV7xC2yMW7cg2a+TZ9yDZa+vzTEh4saITh26uiSNaCaQKGxqDLOfq7C+P6RRZxked2AvR9eayIWaE2VYrwk0wHsGtQaIUZWagU3nGknStJA98SPCf83XHo4CClZ++GtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=M6EUwY86; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="M6EUwY86"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1CC7C4CEE9;
	Fri, 30 May 2025 14:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748614553;
	bh=A4LnFuYc2L5vHO1Q/YLKYIygxkVBYLeUccYIYNErrG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M6EUwY86J9xNI4G4K9HgKrh+O2rMO1PavRywfeSCap6BTscdattegQko/qtRHwFKe
	 WRt/ImYDeAB1BIiBUe1frWs3a9/HiC/R1ouUAdgRFEP+xtCEb6lmP8A/k5g0/kqwFE
	 dfPEGqABpjWrZ4a5m/ujL//0aIwCS6SLeNaTw7go=
Date: Fri, 30 May 2025 16:15:50 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Giovanni Gherdovich <giovanni.gherdovich@suse.com>
Cc: cve@kernel.org, linux-kernel@vger.kernel.org,
	linux-cve-announce@vger.kernel.org
Subject: Re: CVE-2025-37832: cpufreq: sun50i: prevent out-of-bounds access
Message-ID: <2025053010-legible-destiny-23d3@gregkh>
References: <2025050824-CVE-2025-37832-e235@gregkh>
 <1db6d340-bfae-4d81-a1d1-dcbd7bc1294f@suse.com>
 <2025053006-multitask-profanity-3590@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025053006-multitask-profanity-3590@gregkh>

On Fri, May 30, 2025 at 04:14:51PM +0200, Greg KH wrote:
> On Fri, May 30, 2025 at 03:57:35PM +0200, Giovanni Gherdovich wrote:
> > On Thu May 8, 2025 08:39, Greg Kroah-Hartman wrote:
> > > A KASAN enabled kernel reports an out-of-bounds access when handling the
> > > nvmem cell in the sun50i cpufreq driver:
> > > [...]
> > 
> > The invalid data that may be read comes from a ROM in the SoC,
> > programmed by the vendor, and is only used to configure CPU frequency
> > and voltage in the cpufreq framework.
> > 
> > Even assuming that improper frequency/voltage settings constitute a
> > security risk, writing to the ROM in question is at least a privileged
> > operation, and may require physical access to the SoC.
> 
> Obviously there are systems out there that have this issue, with device
> trees that can trigger this issue, this isn't a matter of "malicious ROM
> doing bad things" type of issue, it's a "the DT can't express this
> properly, so we might have taken data from the hardware and handled it
> in the wrong way" type of issue.
> 
> > I don't think this qualifies as vulnerability.
> 
> I don't see how this is a ROM configuration issue, but rather just a
> kernel bug in how the hardware is accessed on different types of systems
> where we previously could not handle such accesses correctly.

Note, if the maintainer or the developer of the change in question here
disagrees with me, great, we'll be glad to revoke this CVE, as we defer
to them.  But for some reason you didn't include them in this thread :(

thanks,

greg k-h
