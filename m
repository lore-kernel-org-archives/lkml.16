Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7008BEA
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 12:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743424323; cv=none; b=J5XOMCpwJEo2GkXkSnIYXKdgG3H5cVsOPnBwR81KPsBoY/H7GO0JTss/3bO5PPXzZhw/yPhbm4fnbOdoDp+9WOa55Gp4CYNwVbOcKACxLZIpd9878jF9I4z5fXTFWj8LsZprXjaouNPHPYft4RSaDCZfqa3r63xXJU/UtmK4kAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743424323; c=relaxed/simple;
	bh=oomfdasBMEhDyObVYlP9kJmmVE6qfL8rLagb37GusyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i0S4wcilCD8IMehuMm/LvPMy4SW4hQD/L05XUWNgmInjixeL8D9IxMoZiN1K6fG8QKATgfZG7wgsGAlE7Asbb3jFOVqICt+itPbRkzOkr0gYDUX0nd9s1hm8IQuONUElIWsZfjJihQTUIq48UaiZxucDp7kN775LgWbF/epaXWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=IxT/+TyW; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="IxT/+TyW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Xi9Fbvl/Ja7hOyTkYMmF0ZWmMSdcH/BdoIvABDlxa3k=; b=IxT/+TyWOcu3WC0bRuJHwtNyAh
	RlO0txjOplEoxLlD0WnGm2pNjppXz5VbAVquTkI8yT0eCCKzxTg80OZBLr2DmZnunSfspiKRfg6Ea
	Doq8VFMgdsT/F1t9hKQr3Hv6TfuF3W4cvVVv2akc0SZLJcdK84b0Pg3+7KzasJZbfs9nNkE4V/w8x
	Y4glEkak1ihySKCc5KWp31bnK2WH9sRDVu8wFz+ZjTgb5a+9mZZcdCC6MImb6sLvUj1mh2RzRHakU
	sYRtY/e7OAbT9UgPxIznSBD+qmE6+Z8Nl3ue+lm5TRRPkyo4DHGHmFtXDBF11rRC0nbYl3urIl4vq
	yXoMuQrA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzEIx-0000000EVgW-28t8;
	Mon, 31 Mar 2025 12:31:51 +0000
Date: Mon, 31 Mar 2025 13:31:51 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2] intel_th: avoid using deprecated page->mapping, index
 fields
Message-ID: <Z-qLN0R2frlq2QcR@casper.infradead.org>
References: <20241203080001.12341-1-lorenzo.stoakes@oracle.com>
 <0fcfc239-19c7-404f-bbc5-70a29ccf6ec0@lucifer.local>
 <87v7tyyrvb.fsf@ubik.fi.intel.com>
 <64514bd2-0271-4b2e-b1f5-a35520fae4ff@lucifer.local>
 <87sep1zw6d.fsf@ubik.fi.intel.com>
 <Z8drzoRVJL3P1jlN@casper.infradead.org>
 <87frityadj.fsf@ubik.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87frityadj.fsf@ubik.fi.intel.com>

On Mon, Mar 31, 2025 at 09:36:40AM +0300, Alexander Shishkin wrote:
> Matthew Wilcox <willy@infradead.org> writes:
> 
> > On Wed, Jan 29, 2025 at 01:39:06PM +0200, Alexander Shishkin wrote:
> >> Lorenzo Stoakes <lorenzo.stoakes@oracle.com> writes:
> >> 
> >> > Thanks very much! Yeah just keen to get this in as we are moving towards
> >> > removing these fields very soon.
> >> 
> >> My understanding is that this is a part of larger effort to reduce
> >> struct page to 8 bytes and an optionally dynamically allocated slightly
> >> larger structure, is that correct? Just curious.
> >> 
> >> > Could you take this in your tree? I think that'd work best.
> >> 
> >> Sure, will do.
> >
> > Hi, this doesn't appear to be in linux-next yet.  Could you confirm it's
> > scheduled to hit the next merge window?
> 
> Yes, I'll send it to Greg once -rc1 is tagged.

What?!  This should be in *BEFORE RC1*!
