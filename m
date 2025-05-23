Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FB12C859;
	Fri, 23 May 2025 12:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748004700; cv=none; b=uFw7CLzk2Qolj+eaTMSEySL1/DWP0cDdI1+0V1w2mnPZmvZo4UyO7z1yz5gQXBDnfdk1Wplpahm+AAUnIhAuPY+O/FFcb/xEmmq7rux5cWp9iD1XSM65osZT/lApMCpcPfZC3fr/3vxJK/QPU9eVTxyXIK8sZKFmHNsL2TRxIYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748004700; c=relaxed/simple;
	bh=ERCJFPy9xb2x/AryG7RPgoZDCoQB8wDUtk86IGkNxsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ds9dzp6xo0/ZQCMkBayxAZ5DZBcmdC+AwoeCTDN06EYvzMcpWb0UK546fS+16Lwc0iCAb5ps76EyRGZgOLKN7LyrF0cAiG0rUxXmDV363z0a1pJgSoY254XfP6kL/yc/SjfQ/GdfslZgs+4uFQqzV+29I+83g2F33Rf4M6Fthc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vTJ05k+j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vTJ05k+j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49898C4CEE9;
	Fri, 23 May 2025 12:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748004699;
	bh=ERCJFPy9xb2x/AryG7RPgoZDCoQB8wDUtk86IGkNxsI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vTJ05k+jeYSFpa5lxlNyXiM5d8L6QkDiZwxQmIkcE8MjAScLtDGNs+ljl0UxkiZKp
	 l5SRYtkbY74H69CZe7qSEiAPNRwq+whj4yBmDn6HPINVwGZkKU79RcgRiQOQ0KPJll
	 tMvf4EfAvvJJQ9Y2G0C29TypwJ2vszEybuJSfMd4=
Date: Fri, 23 May 2025 14:51:37 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: cve@kernel.org, linux-cve-announce@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: REJECTED: CVE-2025-0927: heap overflow in the hfs and hfsplus
 filesystems with manually crafted filesystem
Message-ID: <2025052308-brittle-unbroken-888b@gregkh>
References: <2025040820-REJECTED-6695@gregkh>
 <20250509072033.1335321-1-dvyukov@google.com>
 <2025050940-marrow-roundish-8b98@gregkh>
 <CACT4Y+aiQcbHfj2rB6pGKevUbUoYwrHMu+aC-xh0BCKE8D-8sQ@mail.gmail.com>
 <2025050924-marmalade-overfill-fc5a@gregkh>
 <CACT4Y+az8zu+n_z=amp1Z_ezni-UVTrd0GgUvSzjji2RsjexQQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACT4Y+az8zu+n_z=amp1Z_ezni-UVTrd0GgUvSzjji2RsjexQQ@mail.gmail.com>

On Wed, May 21, 2025 at 10:20:10AM +0200, Dmitry Vyukov wrote:
> On Fri, 9 May 2025 at 09:55, Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Fri, May 09, 2025 at 09:47:20AM +0200, Dmitry Vyukov wrote:
> > > On Fri, 9 May 2025 at 09:34, Greg KH <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Fri, May 09, 2025 at 09:20:33AM +0200, Dmitry Vyukov wrote:
> > > > > > CVE-2025-0927 has now been rejected and is no longer a valid CVE.
> > > > >
> > > > > > Filesystem bugs due to corrupt images are not considered a CVE for any
> > > > > > filesystem that is only mountable by CAP_SYS_ADMIN in the initial user
> > > > > > namespace. That includes delegated mounting.
> > > > >
> > > > > I wonder if this should be the case only if the image is flagged by fsck
> > > > > as corrupted? Otherwise I am not sure what's "trusted". It's not about
> > > > > somebody's "honest eyes", right. E.g. in the context of insider risks
> > > > > the person providing an image may be considered "trusted", or in the
> > > > > context of Zero Trust Architecture nothing at all is considered trusted,
> > > > > or a trusted image may be tampered with while stored somewhere.
> > > > >
> > > > > Without any formal means to classify an image as corrupted or not,
> > > > > this approach does not look very practical to me. While flagging by fsck
> > > > > gives concrete workflow for any context that requires more security.
> > > >
> > > > And how do we know of fsck can flag anything,
> > >
> > > By running fsck on the image. Or what do you mean?
> >
> > That requires us to attempt to reproduce stuff when assigning CVEs?
> >
> > And what architecture/target?  How do we do this for all of them?
> >
> > Remember, we are averaging 13 CVE assignments a day, this has to be
> > automated in order for us to be able to manage this with the volunteer
> > staff we have.
> >
> > > > AND which version of fsck?
> > >
> > > This needs to be answered as part of establishing the vulnerability
> > > triage process. I would go for a relatively fresh version. That will
> > > remove bugs fixed a long time ago, and if users rely on it for
> > > security purposes they have to update it.
> >
> > Remember older kernels are updated but userspace isn't on many
> > platforms, so the combinations of userspace tools and the kernel
> > versions is not anything we are going to even be aware of.
> >
> > > > We'll defer to the fs developers as to what they want here, but note, we
> > > > do not determine "trusted" or not, that is a use case that is outside of
> > > > our scope entirely.
> > >
> > > I think classification should be tied to users and use cases in the
> > > first place. I, as a developer, wouldn't want any CVEs assigned to my
> > > code, if I could just wish so :)
> >
> > This is open source, we can not, and do not, dictate use.  It is up to
> > the users of our software to determine if their use case matches up with
> > the reported vulnerability or not.  We can not do it the other way
> > around, that is impossible from our side.
> 
> So based on this, and Ted's confirmation that using fsck to validate
> images is valid [1], it looks like we should create CVEs for such
> bugs, right?

If you know of any that we have missed, please let us know.

So yes, we can assign them if people ask for them.

thanks,

greg k-h
