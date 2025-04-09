Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE3E25B691
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 10:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744194217; cv=none; b=oHjjYh42LrkIcxj/56WdrrReaHb6SXHKc1O6i+2r9/1ZhG5UqpNNU6JYNel+bYjJkMVVUUPuJVEObGVCvbVk2CNUTQHGaq+Nj05JPybwJ2+73+6G7goKvwtFJsCC2HUExm51pXY13djJqXyWFeqW31pdBKtOIfpSwSZYUVbSea4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744194217; c=relaxed/simple;
	bh=RXVWGFksmYP/SV2ftYEJqo0hU3k+J+P+e3cBlgi5Lp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JDVyrvDnhk25KMHCydSv2WcAXgSDc7/b9uP7w6SY9pcQ/NJQT5wPxJR6OtjzJJqD+PBPuibXB/aRotnsN5dK3CYIxsbpwnfcd9kHWq9Rw9qml85gMJqO5k0Z0h11rgdNT481fk7xReJxJ6Yo/gJcvKyOeIRUgc3tehYd+o1Z2YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=JFz0emPt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=wEzYM2Pn; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="JFz0emPt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="wEzYM2Pn"
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.stl.internal (Postfix) with ESMTP id 606351140165;
	Wed,  9 Apr 2025 06:23:33 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Wed, 09 Apr 2025 06:23:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1744194213; x=
	1744280613; bh=WW5S0beDMkjLQjYoIeV6+54mnEU4UlN+IJCaQTuUFk8=; b=J
	Fz0emPtwRkAu+Pc5+o+XGsLQNT7GiHWtC4EF9QXDg2xDGrQSv0eQt0Zcuy9uNmaC
	Q5v424B6HjQWccLy9sA7JUXECynGnuXuSECEsyG2S5krRBwmMBVEjoJh1wOKrWvd
	VfSXcF6Vx77xx3sKPvd7hwibKz5L2PZoOj2BF+9A63XGjZzvZg6hsf3LlOftO5de
	kFC8An+qWRzMmHNDSKy2X1argi3G19DXb1dPuVTxTIrSxazbQGUykHiKlZ3BdunO
	jjzqw7Y9xOBddGveyNqH680cbfh5O4ZvvQabPL5fUf9OvK4+3L3/NiGW1hG8dbvs
	gS9u/7ua8NtHREA68cVPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1744194213; x=1744280613; bh=WW5S0beDMkjLQjYoIeV6+54mnEU4UlN+IJC
	aQTuUFk8=; b=wEzYM2PnIdiiXBor2hcMB6AIpTw3qe5kyloKu1SNWRmYbncQOPz
	ovg3Zz5/un1hFSYiLK8BZfBmT6Au93ga/6eS5GsJuRWwMkMbMOg8bGtZ02gk2k/b
	7MR3wjAfDT2ahtCdX4bzdnlpiFAOlIbT/3oteajPDEGn2bzWc6fyfibzJosTnZgP
	7x8420pjN5EW3hZnEq3hbBiS36xy7X8Ar0nSkh7wYdqXnU1M8swn3newpTvgIuOM
	POc0gHN5zjxdITnKNZA8R6+pftvrJvGhONmUIpilF1+HIq/xmXR/nzE96GkFfW0e
	Zt/6eP6+FFgiPaADmA/vSwA7S9ithw64zfA==
X-ME-Sender: <xms:pEr2Z9lErL9iU1KdtwMMjKqydOCPr8DBHlefDywOlhzj5Cl0XJa01Q>
    <xme:pEr2Z41iNlBKgAkq3R25tb49PBuS7-UNXzXOk3nk8mozlWGOZYyxze6JiUhlE7mVq
    K6oib0vXRCpOuJRRhM>
X-ME-Received: <xmr:pEr2Zzr8DhuzhfHwZ8KlXJJQnIpmyBvVJ5ezNhFKHp1IbYPnmkbSlFC8R8uhNkEBJG2eog>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdehjeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtsfdttddt
    vdenucfhrhhomhepfdfmihhrihhllhcutedrucfuhhhuthgvmhhovhdfuceokhhirhhilh
    hlsehshhhuthgvmhhovhdrnhgrmhgvqeenucggtffrrghtthgvrhhnpeffvdevueetudfh
    hfffveelhfetfeevveekleevjeduudevvdduvdelteduvefhkeenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehkihhrihhllhesshhhuhhtvghm
    ohhvrdhnrghmvgdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepuggrvhhiugesrhgvughhrghtrdgtohhmpdhrtghpthhtohepkhhirhhilhhl
    rdhshhhuthgvmhhovheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopegrkh
    hpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepvhgsrggs
    khgrsehsuhhsvgdrtgiipdhrtghpthhtoheplhhinhhugidqmhhmsehkvhgrtghkrdhorh
    hgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepughjrgesrgigthgvnhhsrdhnvght
X-ME-Proxy: <xmx:pEr2Z9nsWBJK5CcWoy_M-8CDHm3C00LFPi017sarhietT7wri1I4XA>
    <xmx:pEr2Z72S93bGKnJ5fpPxAzTbA26GRmhuLT7e2-ce-XjmGhSPnPSN9Q>
    <xmx:pEr2Z8vkYcJoY3AA_DRsnMAxZiYgeY7orLwHoxy83ALaCZS-oAJ3AQ>
    <xmx:pEr2Z_Vd_h5lenLSJu3PT7C9NcG63-OBfZzLoTn4p4YO6tcJ_gVX1g>
    <xmx:pUr2Z6wdJIB2r3MtFHOIut35IdAL6QHePgpbKgMJFVttQGEsACApkOt6>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Apr 2025 06:23:29 -0400 (EDT)
Date: Wed, 9 Apr 2025 13:23:26 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: David Hildenbrand <david@redhat.com>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Daniel Axtens <dja@axtens.net>
Subject: Re: [PATCH] mm: fix apply_to_existing_page_range()
Message-ID: <54aymye7ctvyoaxdoge3h756tnhd57kzy4lnpggvydohtrxy45@ruwh3ni4yttq>
References: <20250409094043.1629234-1-kirill.shutemov@linux.intel.com>
 <00a37819-b2ae-4399-b21d-86339059c46a@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00a37819-b2ae-4399-b21d-86339059c46a@redhat.com>

On Wed, Apr 09, 2025 at 11:52:43AM +0200, David Hildenbrand wrote:
> On 09.04.25 11:40, Kirill A. Shutemov wrote:
> > In the case of apply_to_existing_page_range(), apply_to_pte_range() is
> > reached with 'create' set to false. When !create, the loop over the PTE
> > page table is broken.
> > 
> > apply_to_pte_range() will only move to the next PTE entry if 'create' is
> > true or if the current entry is not pte_none().
> > 
> > This means that the user of apply_to_existing_page_range() will not have
> > 'fn' called for any entries after the first pte_none() in the PTE page
> > table.
> > 
> > Fix the loop logic in apply_to_pte_range().
> > 
> > Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> > Fixes: be1db4753ee6 ("mm/memory.c: add apply_to_existing_page_range() helper")
> > Cc: Daniel Axtens <dja@axtens.net>
> > ---
> >   mm/memory.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/mm/memory.c b/mm/memory.c
> > index fb7b8dc75167..2094564f4dfb 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -2907,11 +2907,11 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
> >   	if (fn) {
> >   		do {
> >   			if (create || !pte_none(ptep_get(pte))) {
> > -				err = fn(pte++, addr, data);
> > +				err = fn(pte, addr, data);
> >   				if (err)
> >   					break;
> >   			}
> > -		} while (addr += PAGE_SIZE, addr != end);
> > +		} while (pte++, addr += PAGE_SIZE, addr != end);
> >   	}
> >   	*mask |= PGTBL_PTE_MODIFIED;
> 
> LGTM. just curious, did you run into any actual issues that are worth
> describing?

I stepped on it in my non-upstream code debugging. I am not sure how it
affects existing users.

> It should affect apply_to_existing_page_range() users where create==false.
> There are not many, and likely most PTEs in the range they are passing are
> all non-none.

Or we just silently leak memory :P

> Acked-by: David Hildenbrand <david@redhat.com>

Thanks!

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
