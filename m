Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73862BA33
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 06:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744266742; cv=none; b=KEJBDGsROh0ARRQT873I1mbqJHU0cwu6D7Ag+A3CDetsGMnCvrxXi4pJMgCWjqHLsIcz9bjJSeuiSKNt4hMp2tx/FibRlHwQJbayTAvw3Mt5FT6A+h8trJCkvy4O/oyB6XDeSgykoSnxTVqcnUaeN04QOz7OFhsbYgMLMp+ROEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744266742; c=relaxed/simple;
	bh=JmOO9TIGibzxJk8m9j22bs8H9uUSoFlmN1NsEjavhOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d6X54eeJ/JYl1V/r2RvL3IB2AglYq4DzCJMyO0h9Q4tsxtGAJbV/La/CSLktYgDXUHHfwkZrMU482vBqpoBjIOr0Rn3dIbH+IwftzKKO18TRa2ap/kxoRl9wxo6yoFVnrbCg+Gr7sc2phPgW5iIbKcWQF/CYWJxOpk2XbdD4PeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gqLz7Kpp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gqLz7Kpp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DB1AC4CEDD;
	Thu, 10 Apr 2025 06:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744266741;
	bh=JmOO9TIGibzxJk8m9j22bs8H9uUSoFlmN1NsEjavhOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gqLz7KpprzhtUHkRBR7+NAEpvWl14gzDQkinV1bQCOUMDMJuAj0tx/HlHopw9jITE
	 d8AT9+32Zdw2Iniwsff1qUDIdnlC0CVp4UJXERlbrQEYDRQaCOsEj3w6PBgD5z8pj6
	 vSFiAGeoWXlCYbCH06bXSrlWiUBZhgCtms1uaL5IXmVB7Uc9dWPpt6FfkJryc8NOAj
	 AdAHotHOShGrrdB2uiPtzUbR/Wi+E5JguXj8B3KZAIkX9c66x530xyNRi5RjBEbKGC
	 MR0xIKjLvpLAdizByX5fTQh3V5hVo9HzI+Om2JS0HgCSqw49V80YOeZahHlZ8FSz+s
	 /+njcQ4wdxD9g==
Date: Thu, 10 Apr 2025 08:32:15 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, x86@kernel.org,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <error27@gmail.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Rik van Riel <riel@surriel.com>, "H. Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2] x86/mm/pat: (un)track_pfn_copy() fix + doc
 improvements
Message-ID: <Z_dl70kM41xzNf_E@gmail.com>
References: <20250408085950.976103-1-david@redhat.com>
 <Z_ZMqPvQTxsyhCa9@gmail.com>
 <acc128b8-2c29-44e3-ae83-da753e147060@redhat.com>
 <20250409180337.4fbd2daa3880bc0e1a37b073@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409180337.4fbd2daa3880bc0e1a37b073@linux-foundation.org>


* Andrew Morton <akpm@linux-foundation.org> wrote:

> On Wed, 9 Apr 2025 12:34:47 +0200 David Hildenbrand <david@redhat.com> wrote:
> 
> > > Note that the title isn't accurate anymore, it's not an 'x86/mm/pat'
> > > patch, but an 'mm' patch.
> > 
> > Agreed. Who will take this patch? If it's Andrew, can you fixup the 
> > subject please?
> 
> I edited the mm.git copy.

Thanks!

	Ingo
