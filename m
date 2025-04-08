Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0638A224AE0;
	Tue,  8 Apr 2025 18:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744135920; cv=none; b=iv0sHpu6TMmnMjQ+547stdroBn+o0uw1wSGKaXSrsJB9y3TxHAdVFGQ71OoEzypcgEOs1xK7/QZsEFFe7BM5I8FfJwS4Vf0PVbfaa1nsgTPsoLarvWHgr9a7xkDyc57TqcKQVsn8fjqQIRoeVd7CSmH3E9J6RoiOK/ASekRoUV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744135920; c=relaxed/simple;
	bh=dl34dGdoq7Myx/NoUbXPL7riPms40+jjK4xYh/EjE2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CODqN0zk5P/5/e1k86sOlc2slollwdSFId/zhJkDDEhANQPCS1D+YDuMDrfZdzBKAYxNuygS3OMC8ceMlWmH4eyiB+MBleiCgfhmWe2o8sptNH2/mrA76iUrcuHHRSzCEmgqfE6ICTkwz02DvhhvBBjMCl2Ev75vUkt7ZcAssJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=zfkmbn1Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zfkmbn1Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D139BC4CEE5;
	Tue,  8 Apr 2025 18:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744135919;
	bh=dl34dGdoq7Myx/NoUbXPL7riPms40+jjK4xYh/EjE2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zfkmbn1QK6pqp3EFu0c1kYev/XMNa62BnTJdR+klEwcEmkAP+S+4FIKLy7xmf4DgS
	 Kkkx3ojO7hGQKvW4rvNtltGsnP7cXN6PZ561K2C/3dz7h2Zg9cbAU0jZGDpUwvtQlZ
	 uw4pshicp5/hcw7cc34DDSPkBi73tHgmaLSdQ9m0=
Date: Tue, 8 Apr 2025 20:10:23 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Bird, Tim" <Tim.Bird@sony.com>
Cc: Gon Solo <gonsolo@gmail.com>,
	Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ricardo Ribalda <ribalda@chromium.org>,
	"linux-spdx@vger.kernel.org" <linux-spdx@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: spdxcheck: python git module considered harmful (was RE: [PATCH]
 scripts/spdxcheck: Limit the scope of git.Repo)
Message-ID: <2025040816-pork-lisp-7b66@gregkh>
References: <20250225-spx-v1-1-e935b27eb80d@chromium.org>
 <12647854.O9o76ZdvQC@radijator>
 <Z_Tgp8L_8goc63K1@pampelmuse>
 <Z_TtXaRnaU1zXbXv@pampelmuse>
 <Z_T8OiLQzKDGhOJs@pampelmuse>
 <MW5PR13MB5632E13F8F5B0B2B6DE3D16CFDB52@MW5PR13MB5632.namprd13.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MW5PR13MB5632E13F8F5B0B2B6DE3D16CFDB52@MW5PR13MB5632.namprd13.prod.outlook.com>

On Tue, Apr 08, 2025 at 05:34:20PM +0000, Bird, Tim wrote:
> > -----Original Message-----
> > From: Gon Solo <gonsolo@gmail.com>
> > It's a known problem:
> > https://github.com/gitpython-developers/GitPython/issues/2003
> > https://github.com/python/cpython/issues/118761#issuecomment-2661504264
> > 
> 
> For what it's worth, I've always been a bit skeptical of the use of the python git module
> in spdxcheck.py.  Its use makes it impossible to use spdxcheck on a kernel source tree
> from a tarball (ie, on source not inside a git repo).  Also, from what I can see in spdxcheck.py,
> the way it's used is just to get the top directories for either the LICENSES dir,
> the top dir of the kernel source tree, or the directory to scan passed on the
> spdxcheck.py command line, and then to use the repo.traverse() function on said directory.
> 
> This ends up excluding any files in the source directory tree that are not checked
> into git yet, silently skipping them (which I've run into before when using the tool).
> 
> I think the code could be relatively easily refactored to eliminate the use of the git
> module, to overcome these issues.  I'm not sure if removing the module would
> eliminate the yield operation (used inside repo.traverse()), which seems to be causing the
> problem found here.  IMHO, in my experience when using python it is helpful
> to use as few non-core modules as possible, because they tend to break like this
> occasionally.
> 
> Let me know if anyone objects to me working up a refactoring of spdxcheck.py
> eliminating the use of the python 'git' module, and submitting it for review.

No objection from me!
