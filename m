Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9DF1E5B67
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 15:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743436431; cv=none; b=V8FNcx8I/BRO7gmdIrVp2wMdQZkgMS9cBOvvN3TpDWMWuuGPBz0n//ffVmoAGGUALIJ4bX6zuSd6uVR/sKUyMixAwMllvSawTKNgROFRe5rUN/iJ7oZLzgLa/DB86DuN16RJzJBLA0KChdwtxTr0bStjiF6jLf6JNx7n7i9zgoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743436431; c=relaxed/simple;
	bh=vqMVBtulCYOi1rIUrbQ+9i13oXzLIr4vXPo+N3GirC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mO/Y2jyotecQ6S7UTdLTl5SuHxVDTt1LUyD94K2aLpoHoznFZCLaWZ19TZ3bvX7t5MX0DDuoRrHFI1cEWKRdkYrB36N+hX2qqksQjJMpnubJPx8LqgSXqLyGRr0KXe7B4eE6AGvg2TbTOCho4PzDrwf+y2zkjDVVvvZ/gCXYrfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=itpJZ1DE; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="itpJZ1DE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=uvGqqaqDd3JPpTtdpMxQ/U2V9BXb6xMABgOJ71WwSTc=; b=itpJZ1DENkd2BXC4V3vqOrMAKE
	GXLFALnCW4r3HMBnXUU7+vDQtgzA6p/Eeg2qADfBjPVlhxETLkVetA6klQ/gGxWjk1DzzhUiAxGzr
	zp5OJmPvxTzBEgDbtMVHOOkKaa1e9giyIf3VY1syaL+nT8+EpvewcyHM7TTtq+7zaa5TQv57/TJ5U
	U3xpjRTB1cA+GW47HTV/ErZtqUF2o7wIS1/VKDiJ/Jzwpa3r1daaWCQvvDsSzFXntoOP2x4v8GhWg
	Vo+lvwJwSGcxqO2jPrjL+kNSqZXWfvKnJ3wx+sY0AG6JbaVa/lAttdq7isFIEil+iCWw1glwIA9VJ
	hlKg1h8Q==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzHSK-0000000Ezqq-1KjT;
	Mon, 31 Mar 2025 15:53:44 +0000
Date: Mon, 31 Mar 2025 16:53:44 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Ye Liu <ye.liu@linux.dev>
Cc: Markus Elfring <Markus.Elfring@web.de>, Ye Liu <liuye@kylinos.cn>,
	linux-mm@kvack.org, LKML <linux-kernel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Sidhartha Kumar <sidhartha.kumar@oracle.com>
Subject: Re: [v4] mm/page_alloc: Consolidate unlikely handling in
 page_expected_state
Message-ID: <Z-q6iOSTzb5wibEW@casper.infradead.org>
References: <20250328014757.1212737-1-ye.liu@linux.dev>
 <Z-ayTt8o656AkGfz@casper.infradead.org>
 <8720c775-c0fb-4fbf-a1a8-409fef2b67ad@linux.dev>
 <05ebb2eb-5f66-4613-a39e-40194c96341f@web.de>
 <9ee54186-b56c-4876-a36f-1e4fb1835d09@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ee54186-b56c-4876-a36f-1e4fb1835d09@linux.dev>

On Mon, Mar 31, 2025 at 08:51:28PM +0800, Ye Liu wrote:
> 
> 在 2025/3/31 20:21, Markus Elfring 写道:
> >> Regarding the reviewer shortage, I’d be happy to help by reviewing
> >> other patches as well. Could you please share the process for becoming
> >> a reviewer?
> > Under which circumstances would you dare to comment information from
> > other contributors?
> >
> > How will your development interests evolve further?
> >
> >
> >>             What are the requirements or steps to get involved?
> > You can try to improve communication skills as needed.
> 
> I don’t see how I’ve offended anyone.

Just to be clear, you should ignore Markus.  Don't reply to any of his
emails, and ignore the suggestions he makes.  That's what the rest of
us do.  He's been told many times that the way he interacts with people
is inappropriate, but he persists, and there's little we can do about it.

