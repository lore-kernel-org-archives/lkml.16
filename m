Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCF91CA81;
	Sun,  6 Apr 2025 17:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743959859; cv=none; b=XHTW+4zOxgbIk/E2T1400Qa5dbMjR8XNxveGKPtvNMo2v/NfTRTUAWDmRqMWlVhBJR2iPp77LwfQ9osrvXnva3yJ0mloy0esP32SX1eAtwwJPpjmDoYtgh6HmliHOm0BAMdhAXscs4g/GWORQfzlMbJKnjus9xGDyNE+Eo/KqWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743959859; c=relaxed/simple;
	bh=yK1e0myiFTb+uJXfZR0VyuGCt6MMn7FjTJOXv1FdeHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I67CEmYpa7hm/dbDo+qoCngoF/B1QpmYPXJ6m1kkPvpWvSak0fPSv3nTFNBZnogGrnFiOPKWGkVSmk7L1gUEDNmZk4ZDkjIJ+JgGinBpjOsOKMkmp2iFzG6vb3a0qvk8occ3P8NynEfQpKOi/KKrftVTSpG+/8HbVYAWpC4FmSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fWb04Fxa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fWb04Fxa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EBBFC4CEE3;
	Sun,  6 Apr 2025 17:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743959858;
	bh=yK1e0myiFTb+uJXfZR0VyuGCt6MMn7FjTJOXv1FdeHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fWb04FxaJge/33W4VTTInpdz5RXtuzLHMzvAVv4MVe+Gaq5xgogS9FCn2NzUNngxS
	 M5XFyAsWetmOhaY4IIFHAIwsVl1CYWY96aDoxdK0pPo1f6PUQpPxLtYvfBZIJ2XrWV
	 9bwXeFz6pdOo6LGkhrlXyulJq+MhtTTBNHGTq3YHQzIjcYPNCPXutGd3nXqhZZb5V0
	 wUIvc9KFoxQr6NoPNpXFHSshskeby54iO0LvLr8lwGWTktZPtus/lhs7sPyDQ2C3jF
	 0j8WfTMJBePIRSMdsdORzW7KkGbyE5rneLARcYqJXAzmw2a+C5sX6glQNJIbvJM7cj
	 KQefFb4MD1/vg==
Date: Sun, 6 Apr 2025 19:17:34 +0200
From: Ingo Molnar <mingo@kernel.org>
To: David Hildenbrand <david@redhat.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	kernel test robot <lkp@intel.com>, oe-kbuild@lists.linux.dev,
	Dan Carpenter <error27@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, x86@kernel.org
Subject: Re: [PATCH v3] x86/mm/pat: Fix VM_PAT handling when fork() fails in
 copy_page_range()
Message-ID: <Z_K3LkhQH05fP1T9@gmail.com>
References: <g5vxcrmdjjsvrjeo5k6uzwypctv2mvbteoommwwpv6sfjpbcyd@lackqksyahfs>
 <94c35e89-f915-4122-b1a0-436893201373@stanley.mountain>
 <a33df3aa-7f37-4d1b-bde8-642115dd1441@redhat.com>
 <e75ca8d9-0386-4de6-bee9-e6044b001a30@lucifer.local>
 <92c40df4-2e93-40ca-929e-a0b50ab2b631@redhat.com>
 <18abdf06-9d45-42bf-b666-af1a416bf2a6@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18abdf06-9d45-42bf-b666-af1a416bf2a6@redhat.com>


* David Hildenbrand <david@redhat.com> wrote:

> On 04.04.25 14:20, David Hildenbrand wrote:
> > On 04.04.25 13:52, Lorenzo Stoakes wrote:
> > > On Thu, Apr 03, 2025 at 10:59:12PM +0200, David Hildenbrand wrote:
> > > > On 03.04.25 17:14, Dan Carpenter wrote:
> > > > > Sorry, I've been having trouble with my email recently...  I replied
> > > > > earlier but my email got eaten on the way out.
> > > > > 
> > > > > What happened here is that the zero day bot emails go to me first and
> > > > > then I review them or forward them depending on if they're a real
> > > > > issue or not.
> > > > > 
> > > > > Here it's a false postive because it's set and used if the
> > > > > (src_vma->vm_flags & VM_PFNMAP) flag is set.  Smatch doesn't parse
> > > > > this correctly.  I've been meaning to fix this in Smatch for a
> > > > > while.
> > > > 
> > > > There is a slight complication (on top of the VM_PFNMAP checks):
> > > > 
> > > > If "src_vma->vm_flags & VM_PAT" we
> > > > * set pfn
> > > > * set dst_vma->vm_flags |= VM_PFNMAP
> > > > 
> > > > Then, we only consume the pfn if "dst_vma->vm_flags & VM_PFNMAP"
> > > > 
> > > > While we won't be using the uninitialized pfn (good), we'd still pass an
> > > > uninitialized pfn, which IIRC is UB; likely nothing happens on GCC clang,
> > > > but we better handle it.
> > > > 
> > > > So that should better be changed; I'll send a fix.
> > > 
> > > Maybe just worth setting pfn = 0 _as well_ in the caller, belts + braces maybe?
> > 
> > I'm planning on doing the following, just didn't get to testing it:
> > 
> 
> Ah, now I get your comment. Yeah, we could just set pfn=0 in the caller as
> well to make smatch completely happy I guess.

Yeah, that's far cleaner than these rather ugly code constructs in the 
error paths. It's a pretty standard API where output pointers may not 
get touched on errors - if Smatch has a problem with it, fix Smatch or 
the callers.

Thanks,

	Ingo
