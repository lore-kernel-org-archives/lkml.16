Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1688339A1
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 12:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743422585; cv=none; b=pR5fxSXMVcsYNPrjSPfCgG19rliDuTKHI+mc1EHjaLAEMabjYriTOfAgEbJe2muJcGqUdT3SC+jTWowLa2WDvs7hKmZST9+BrRaxKO4BcvX9aYcU77PlsL/K1swtoaP9BaDyBDD6tW5dOG+JZbXjTj0/nywyU88bb339Nx0EozQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743422585; c=relaxed/simple;
	bh=08qSMeiLF2t+bRuNcJWtnTOaAJkaa+E20g9wzTr/HhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=huWE4AQEALo8ZmjnYrBRpuXH6+gxhElGfmbM+DHlw0hyT+ozl35IdDOlYlA2c+cfRMDwhXdjdEaJJIO4M9oJNv/8cmARYYmmP5G8ZVbBlLwkfOh7YgZRuiu8o6ivoXKKLJI+89tjcPqpGQg+VKbG/PAjqlWsWm3Q7KZefG1Ig8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rgZHPZB3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rgZHPZB3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7FE8C4CEE3;
	Mon, 31 Mar 2025 12:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743422585;
	bh=08qSMeiLF2t+bRuNcJWtnTOaAJkaa+E20g9wzTr/HhM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rgZHPZB3Ut0IKbPY3wJ+odcepO8fICbsUNGICGJwufinYH/QTiyZ/QS1rPcppfoxB
	 lGtiUNHr/x0SL4MqtYr98MIw2CKa3vWu0wF33C1qzGlsBL3QKZdcA84rJVmFtgihPd
	 RVzUUa6gZ73nEBtuPuhb8ADeKTqkOIi+aRp+zKcs=
Date: Mon, 31 Mar 2025 14:01:38 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2] intel_th: avoid using deprecated page->mapping, index
 fields
Message-ID: <2025033131-surcharge-depict-9b55@gregkh>
References: <20241203080001.12341-1-lorenzo.stoakes@oracle.com>
 <0fcfc239-19c7-404f-bbc5-70a29ccf6ec0@lucifer.local>
 <87v7tyyrvb.fsf@ubik.fi.intel.com>
 <64514bd2-0271-4b2e-b1f5-a35520fae4ff@lucifer.local>
 <87sep1zw6d.fsf@ubik.fi.intel.com>
 <Z8drzoRVJL3P1jlN@casper.infradead.org>
 <87frityadj.fsf@ubik.fi.intel.com>
 <3a98bce9-7508-4ab5-b2c0-2493d2256c53@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a98bce9-7508-4ab5-b2c0-2493d2256c53@lucifer.local>

On Mon, Mar 31, 2025 at 12:59:36PM +0100, Lorenzo Stoakes wrote:
> +cc Greg
> 
> On Mon, Mar 31, 2025 at 09:36:40AM +0300, Alexander Shishkin wrote:
> > Matthew Wilcox <willy@infradead.org> writes:
> >
> > > On Wed, Jan 29, 2025 at 01:39:06PM +0200, Alexander Shishkin wrote:
> > >> Lorenzo Stoakes <lorenzo.stoakes@oracle.com> writes:
> > >>
> > >> > Thanks very much! Yeah just keen to get this in as we are moving towards
> > >> > removing these fields very soon.
> > >>
> > >> My understanding is that this is a part of larger effort to reduce
> > >> struct page to 8 bytes and an optionally dynamically allocated slightly
> > >> larger structure, is that correct? Just curious.
> > >>
> > >> > Could you take this in your tree? I think that'd work best.
> > >>
> > >> Sure, will do.
> > >
> > > Hi, this doesn't appear to be in linux-next yet.  Could you confirm it's
> > > scheduled to hit the next merge window?
> >
> > Yes, I'll send it to Greg once -rc1 is tagged.
> 
> Right, is this ultimately handled in Greg's PR? Did you not send to him
> ready for the merge window?
> 
> Or did you? I'm confused.

I don't see it in my tree right now, is it in linux-next?  Nope, don't
see it there either :(

> We do really need this merged for 6.15, can we make sure this actually
> lands? You did confirm it'd go in 2 months ago, and the patch was sent 4
> months ago, and we have been chasing this repeatedly.
> 
> For reference, patch is [0].
> 
> [0]: https://lore.kernel.org/all/20241203080001.12341-1-lorenzo.stoakes@oracle.com/

What changes in 6.15 to require this then?  If it's a bugfix for older
kernels too, why isn't it tagged for stable inclusion as well?

thanks,

greg k-h
