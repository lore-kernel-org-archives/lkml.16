Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256C32253E4
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 11:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744199966; cv=none; b=Qu3NBciocCQqe0k3p4bIlZlxQ7tZexHgpL+/eqXZIxIUsKN1i/Uh+irOm3M1XRcNE7OQY1/6H7lSb5ncoL3ZiUAlDB7HTvoC+uE0IahO589yF+/xqtEn58wFCLUlg5iyD9jdvlS+eNk42ksYm4xU1QmPK7coarqtGt2bMtAiyIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744199966; c=relaxed/simple;
	bh=2gwN+a30sBQomtnlkPQhso40CkRjZBCRGbCpnXiMN/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dTmbZ2tGTyn2xPgJTDe24TK2EVg2+svugFC3Cmzsj0IMImF3Qlhwk9aNxBb0j6OdWyYUXOcPPBJO+lvlRmjywikzca0w1QZE4Ns/fmAAfYb2rg68DK9aIrh+QIQiSHNwjGhqWhuOjPMf0IihcPr/DkfsmkQrYXBfTCHtXoM7MEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WQDoHIFF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WQDoHIFF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB4AEC4CEE3;
	Wed,  9 Apr 2025 11:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744199965;
	bh=2gwN+a30sBQomtnlkPQhso40CkRjZBCRGbCpnXiMN/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WQDoHIFFapA8BdAobaU/wpbdXLbaYJOiQ28nAtKJfCORk/V+NQ02t1cjKzTqslcJ0
	 K6uPo3fUXPIlDxxfi+qzaZ3y5/PHZWBg4UY+haNfEYL+m6mKgk3lILf5urxjgHNwg9
	 JqtU3V6iJaylymLbDG8pPt06ZkcIPGm9ESuxnSaKdzE4Wx6GSS/qtV0LPt9+VPF5e2
	 NTD1+LXTBTJLZ9yEYr5rgz87VzsZzczxBan5od/4wDELiTytYaJ40CNSe4bC6LeT4h
	 cXum2eLJbxgAhY+CpVaazJGDO7oynUTwC3Cwxdr7K/l9ozhevMLsw72FwC5iXwsrPo
	 3+FJeCdCR1rZw==
Date: Wed, 9 Apr 2025 13:59:19 +0200
From: Ingo Molnar <mingo@kernel.org>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <error27@gmail.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Rik van Riel <riel@surriel.com>, "H. Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2] x86/mm/pat: (un)track_pfn_copy() fix + doc
 improvements
Message-ID: <Z_ZhFzk6S0WsRPnL@gmail.com>
References: <20250408085950.976103-1-david@redhat.com>
 <Z_ZMqPvQTxsyhCa9@gmail.com>
 <acc128b8-2c29-44e3-ae83-da753e147060@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acc128b8-2c29-44e3-ae83-da753e147060@redhat.com>


* David Hildenbrand <david@redhat.com> wrote:

> On 09.04.25 12:32, Ingo Molnar wrote:
> > 
> > * David Hildenbrand <david@redhat.com> wrote:
> > 
> > > We got a late smatch warning and some additional review feedback.
> > > 
> > > 	smatch warnings:
> > > 	mm/memory.c:1428 copy_page_range() error: uninitialized symbol 'pfn'.
> > > 
> > > We actually use the pfn only when it is properly initialized; however,
> > > we may pass an uninitialized value to a function -- although it will not
> > > use it that likely still is UB in C.
> > > 
> > > So let's just fix it by always initializing pfn in the caller of
> > > track_pfn_copy(), and improving the documentation of track_pfn_copy().
> > > 
> > > While at it, clarify the doc of untrack_pfn_copy(), that internal checks
> > > make sure if we actually have to untrack anything.
> > 
> > Note that the title isn't accurate anymore, it's not an 'x86/mm/pat'
> > patch, but an 'mm' patch.
> 
> Agreed. Who will take this patch? If it's Andrew, can you fixup the subject
> please?

I was assuming Andrew would pick it up:

  Acked-by: Ingo Molnar <mingo@kernel.org>

But can pick it up too via tip:x86/urgent.

Thanks,

	Ingo
