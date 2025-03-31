Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258F31E32A3
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 12:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743424841; cv=none; b=QVAkLIJ4tHhy+MFViEy/bjRg/u8570BCktFuty/fJrIdcDcgl/aFphIqYchlvzPbbutiEH6OJ4SmBSo3dgg/47CFyHAlwMiZCr4Hz1N/kx+QFISXX6OmBcKqnU2hPkBccaGL7flYqQ1g6VtwM+nzaTYVBKHrZ9pxgcEpnEJC20I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743424841; c=relaxed/simple;
	bh=rMqv3XtaD9GsJACDekMXt94osXlCk7POWr/qzdfqFBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FP+BfaL22flg8LHhC46wvr5PWhpK8bAu499xdOHMKpXzOH+JDQj+zFcd2ZAvS8gNjjU5THJvP0H3nacOVPEhWTyv2kwQKKdc2ACEg0mIKJ3uYQ0Jh6Jl8/awlYs0RSnk6xNPvNVu4H4EpPPl0PDr829oFLyWU9fg3BMaaGl99jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=oasXAnom; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="oasXAnom"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36B9AC4CEE3;
	Mon, 31 Mar 2025 12:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743424840;
	bh=rMqv3XtaD9GsJACDekMXt94osXlCk7POWr/qzdfqFBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oasXAnomEDNj9xxXBg3ylSJi/2SoCpiv1EHR/OIjPzsUV7lzIuwlyChd7ESeddJ/Q
	 JVJMz0SM9hEhUWhmiwbsaNN4anfMBZqS1Mk9vQsVjD5xsTYXFrzRyeXZhxwtDKnymu
	 IoWGI5YZHNK6J1ei15GWQuX0t8tUWn0luk++WliU=
Date: Mon, 31 Mar 2025 14:39:14 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2] intel_th: avoid using deprecated page->mapping, index
 fields
Message-ID: <2025033141-unwed-pleading-0f0c@gregkh>
References: <20241203080001.12341-1-lorenzo.stoakes@oracle.com>
 <0fcfc239-19c7-404f-bbc5-70a29ccf6ec0@lucifer.local>
 <87v7tyyrvb.fsf@ubik.fi.intel.com>
 <64514bd2-0271-4b2e-b1f5-a35520fae4ff@lucifer.local>
 <87sep1zw6d.fsf@ubik.fi.intel.com>
 <Z8drzoRVJL3P1jlN@casper.infradead.org>
 <87frityadj.fsf@ubik.fi.intel.com>
 <3a98bce9-7508-4ab5-b2c0-2493d2256c53@lucifer.local>
 <2025033131-surcharge-depict-9b55@gregkh>
 <77e9246c-5976-4661-a397-21776db3584e@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77e9246c-5976-4661-a397-21776db3584e@lucifer.local>

On Mon, Mar 31, 2025 at 01:08:43PM +0100, Lorenzo Stoakes wrote:
> On Mon, Mar 31, 2025 at 02:01:38PM +0200, Greg Kroah-Hartman wrote:
> > On Mon, Mar 31, 2025 at 12:59:36PM +0100, Lorenzo Stoakes wrote:
> > > +cc Greg
> > >
> > > On Mon, Mar 31, 2025 at 09:36:40AM +0300, Alexander Shishkin wrote:
> > > > Matthew Wilcox <willy@infradead.org> writes:
> > > >
> > > > > On Wed, Jan 29, 2025 at 01:39:06PM +0200, Alexander Shishkin wrote:
> > > > >> Lorenzo Stoakes <lorenzo.stoakes@oracle.com> writes:
> > > > >>
> > > > >> > Thanks very much! Yeah just keen to get this in as we are moving towards
> > > > >> > removing these fields very soon.
> > > > >>
> > > > >> My understanding is that this is a part of larger effort to reduce
> > > > >> struct page to 8 bytes and an optionally dynamically allocated slightly
> > > > >> larger structure, is that correct? Just curious.
> > > > >>
> > > > >> > Could you take this in your tree? I think that'd work best.
> > > > >>
> > > > >> Sure, will do.
> > > > >
> > > > > Hi, this doesn't appear to be in linux-next yet.  Could you confirm it's
> > > > > scheduled to hit the next merge window?
> > > >
> > > > Yes, I'll send it to Greg once -rc1 is tagged.
> > >
> > > Right, is this ultimately handled in Greg's PR? Did you not send to him
> > > ready for the merge window?
> > >
> > > Or did you? I'm confused.
> >
> > I don't see it in my tree right now, is it in linux-next?  Nope, don't
> > see it there either :(
> 
> Yup... we did ask about this, quite a few times :)
> 
> Can you take direct, if you typically handle these from Alex?

I do normally take pull requests from him, yes.

Please resend it, with his signed-off-by or ack or whatever he wants to
give, and I'll queue it up after -rc1 is out.

thanks,

greg k-h
