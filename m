Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB7F253B41;
	Tue,  8 Apr 2025 23:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744155673; cv=none; b=U9lMsYVsYrdD8rm0vsYwBPvlOBESamq56UQtZXgNZstrjpuPG/mKCCihquTcZ4/UG30bAal0h6hR37cpnsiQIk+0WnGldSIbsH/Pb9R4fCLCq5t5vZ5cHD6qft9uLNU3O6nCeznDNPQpVMQL8Xg+FXgXjaH/weG/IzWQ+EJI2CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744155673; c=relaxed/simple;
	bh=f4zh6SebMglGo7cnFt7c4X5SegPglTXcSCpAZFwIsL0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CU/gChVv5EXabf3ap98zJeVuZxoaioc/TwCqD6xaxZ5uekZ5Xl9v37qmgIy4J8ashH7dM4Yo8xMyAMBhdouPqz8orCn6fxAZJ3+P/azYneQKDf0Ar+qJUnbaz+hq/Uhm/HNswTRLmrSe4uRyFVU0Qug2hBOmp/y4m0SGXR1/u6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JZw1qqhz; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KfHJRTPv; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JZw1qqhz";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KfHJRTPv"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744155664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rd7njLRi4jWOGB5cKNYFMjVUtZgHkiNFDfhrPsw0E8E=;
	b=JZw1qqhz+Q1C/UazQ/8whZXAa92eyRU27o05+RKh07yYMAqiXvN+4iWqxbp8fFSxkfI4LL
	0ukrdiv3zLWLEl2MGiCK/7GMMpyMSLDbFRCAdyuJpfqDoxPQx/pkZX01jvnkjN75T6b/nb
	/VBMbP/V6WnUOLq/uUf9CDqWDHVVc/bT+/cBv2QhWz3REVyDLOaQxAhflhVAda8yu6qxEf
	EBIWs3ZvrZZY+kMlViVXOR/McWf6TrLeD4+0A0q3aA2RCcFvHpn9+5j5w84woTCa6c2Jpt
	iAp4nuhhIzr4VjtxnUpreo0az7IATRgteqU56N3mr1+l0oDafcp/FFTuPL1OdQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744155664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rd7njLRi4jWOGB5cKNYFMjVUtZgHkiNFDfhrPsw0E8E=;
	b=KfHJRTPvYrrKA5KHwL5Ftk6juISlQlVg70wGhcGXXISlBuYPXTluiGcSIZyZv7H59JMueb
	y2t8U+o2nbAdGBAw==
To: "Bird, Tim" <Tim.Bird@sony.com>, Gon Solo <gonsolo@gmail.com>, Duje
 =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ricardo Ribalda
 <ribalda@chromium.org>, "linux-spdx@vger.kernel.org"
 <linux-spdx@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: spdxcheck: python git module considered harmful (was RE:
 [PATCH] scripts/spdxcheck: Limit the scope of git.Repo)
In-Reply-To: <MW5PR13MB5632E13F8F5B0B2B6DE3D16CFDB52@MW5PR13MB5632.namprd13.prod.outlook.com>
References: <20250225-spx-v1-1-e935b27eb80d@chromium.org>
 <12647854.O9o76ZdvQC@radijator> <Z_Tgp8L_8goc63K1@pampelmuse>
 <Z_TtXaRnaU1zXbXv@pampelmuse> <Z_T8OiLQzKDGhOJs@pampelmuse>
 <MW5PR13MB5632E13F8F5B0B2B6DE3D16CFDB52@MW5PR13MB5632.namprd13.prod.outlook.com>
Date: Wed, 09 Apr 2025 01:41:04 +0200
Message-ID: <871pu2usq7.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Apr 08 2025 at 17:34, Tim Bird wrote:
>> -----Original Message-----
> For what it's worth, I've always been a bit skeptical of the use of the python git module
> in spdxcheck.py.  Its use makes it impossible to use spdxcheck on a kernel source tree
> from a tarball (ie, on source not inside a git repo).  Also, from what I can see in spdxcheck.py,
> the way it's used is just to get the top directories for either the LICENSES dir,
> the top dir of the kernel source tree, or the directory to scan passed on the
> spdxcheck.py command line, and then to use the repo.traverse() function on said directory.
>
> This ends up excluding any files in the source directory tree that are not checked
> into git yet, silently skipping them (which I've run into before when
> using the tool).

The exactly same problem exists the other way round. Run an
unconstrained version of spdxcheck on a dirty source tree with lots of
leftovers, then it scans nonsense all the way instead of skipping some
not yet git tracked files.

The easiest way for me to achieve that was using git to exclude all of
the irrelevant noise, which I still consider to be a reasonable design
decision.

And yes, it ignores not yet tracked files, but if you want to check
them, then it's easy enough to commit them temporarily or provide a
dedicated file target to the tools, which ignores git.

> I think the code could be relatively easily refactored to eliminate the use of the git
> module, to overcome these issues.  I'm not sure if removing the module would
> eliminate the yield operation (used inside repo.traverse()), which seems to be causing the
> problem found here.  IMHO, in my experience when using python it is helpful
> to use as few non-core modules as possible, because they tend to break like this
> occasionally.
>
> Let me know if anyone objects to me working up a refactoring of spdxcheck.py
> eliminating the use of the python 'git' module, and submitting it for review.

I have no objections at all as long as it gives the same result of not
trying to scan random artifacts which might sit around in a source tree.

But not for the price that I have to create a tarball or a pristine
checked out tree first to run it. That'd be a usability regression to
begin with.

Good luck for coming up with a clever and clean solution for that!

Just for the record: I rather wish that people would contribute to
eliminate the remaining 17% (15397 files) which do not have SPDX
identifiers than complaining about the trivial to solve short-comings of
the tool, which was written to help this effort and to make sure that it
does not degrade.

Thanks,

        tglx
