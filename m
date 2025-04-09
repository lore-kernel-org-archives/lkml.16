Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB068450FE
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 10:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744195273; cv=none; b=S8ZHAmQyUoXBxV7H0p/BwKfCU97xwcyUTxeHmBno9yJWs8pSZO0mLIj4wr8jebSQege629wbbsIYLRPrKVpt6jFX9SBm4zyNkITwq+qrZBQp8AVvnpkgdgrgykaHp7BCcym2PhWtZfIDSwkaRrLT1zhz6M78lfd1i4fwsO4Rg+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744195273; c=relaxed/simple;
	bh=1ye4N7oPWuACRvlIgoq7elDII/hCZ9Vm7O5YWp3ribU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s982OE2xZ/z0hVQ8W/j6AyW3jtSiJulq67vaXcM8VSWLREy0FNFXBnTB+BX/7nVx5uRCbIcCiI6mOtMWgaoil4q78GmZzxReVE8zrWPXbIm0L9kpfPfZvq1KPyPF2ZEI7ew6oZ+2uEUU+IQykMmADP/3e7/8pTvbKJukdHlq0nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=BxemSW+d; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=qmrfegVI; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="BxemSW+d";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qmrfegVI"
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.stl.internal (Postfix) with ESMTP id D1F0B1140094;
	Wed,  9 Apr 2025 06:41:10 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Wed, 09 Apr 2025 06:41:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1744195270; x=
	1744281670; bh=f0l92MIb0cqa/PUzSb/Jx1hmxmUjD6QSmCjY/b46Z9M=; b=B
	xemSW+dZeUTXIsJxu8mPCNGj+H4E1tyaXN2k4RsyZYovC0gK1OhyuaRjbjMV6rg3
	UHYS1M3xNw3Ay76p1izdC7Jz/czLbVBYiuPrXN9xuvemWGNM6iGJTS8+CY4otGjj
	5KcH2mtz09rAs0ar5LNcRRoGy6+A46m9375z0S+wMk4j512Gj+ZoxoRuwmZv/LIC
	5TvTaIZcfITaDOpdhrNpg9FnDu/xa5rsuKMbTK3aBrEn04LlcpENR3qgllB8vXPF
	XH22H08eGyczinWyEiQW0keQyJtNpdOTTVVHmdsnKq/r3qd0v0ZRHwLqqALlC6r3
	NYeRjd1kOwklgsdN5Sw4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1744195270; x=1744281670; bh=f0l92MIb0cqa/PUzSb/Jx1hmxmUjD6QSmCj
	Y/b46Z9M=; b=qmrfegVIN8iM9nWMYEf/4nSJMJFh4GA99o3VQOMrRne1qM0L5hw
	wBY+DakU/xs6BpaFwVs4NTumkNDBmzQbp/6WL+wQMLLtjQ/7Wc50XG3/vNIgYQ2s
	HgKR211iLKcWyk+rPlOMmKg2whDDyeKQ0ZpFzsEjXjz1Q/kmCYdS7BLSP59OmmCb
	9eR+6+Q8zuFdg0Jl6KmaVhhgYUUsXmaXKf+ulToj4dcuUPsRMoknvyh3dHdjXnSF
	na/qVdASGmod4QtRkf1K9CgTNdRqZB4fK/N8rNwSkKEXb4Uao2l6+FzbbCidMopY
	daCOgD++lRk60kXI6BI1kCb4K8lWyRD+LdQ==
X-ME-Sender: <xms:xk72Z_NxEEoeUSgK1jmMKnuk22YbpvPfRFiuHPQk5nuqFSMT4a4tsQ>
    <xme:xk72Z5_yWl2ItdCivaFuqZO8T6nssdg3jrUTFTAZrWikxEa_CudKDBNQHvIz3khu-
    I2V7aqAVeH85nXvnJo>
X-ME-Received: <xmr:xk72Z-R_qPlMj3WMy-_qUKrxdN-Vbd9tSw5iAwk6IfbURG0N59ui0bud_kUGKSkvW_e7hA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdehjeekucetufdoteggodetrf
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
X-ME-Proxy: <xmx:xk72Zzu4uJJRmfo2CYfrAQGXWyw4N04wm2ekig7DfJB8kzdixFG75A>
    <xmx:xk72Z3c306pc8MTPqsa0X5pYtdUYQlLtDD1LeclFUMSemitQjwP2pQ>
    <xmx:xk72Z_0jXlRQLsfa3mp1isNIzGe8DHg-jYnv6N1uDwgHAmnKSorXFA>
    <xmx:xk72Zz8yRIbhrIPbAfBV3bIWPoN7nqHuEto1LeSS-zOH8k0qHaWgSw>
    <xmx:xk72Z-768oLNXfPc8mx6DF81cyR0ENUcV-L74B_vyzDZ3HzJA-URd-hM>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Apr 2025 06:41:07 -0400 (EDT)
Date: Wed, 9 Apr 2025 13:41:03 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: David Hildenbrand <david@redhat.com>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Daniel Axtens <dja@axtens.net>
Subject: Re: [PATCH] mm: fix apply_to_existing_page_range()
Message-ID: <zfzh7665tzqmludh6ic5oaxidm44ewkel7t2nj5hvg6qppepnl@mj7dp7rkprcy>
References: <20250409094043.1629234-1-kirill.shutemov@linux.intel.com>
 <00a37819-b2ae-4399-b21d-86339059c46a@redhat.com>
 <54aymye7ctvyoaxdoge3h756tnhd57kzy4lnpggvydohtrxy45@ruwh3ni4yttq>
 <297fdd97-d53b-4018-bd15-50235e235561@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <297fdd97-d53b-4018-bd15-50235e235561@redhat.com>

On Wed, Apr 09, 2025 at 12:26:09PM +0200, David Hildenbrand wrote:
> > > It should affect apply_to_existing_page_range() users where create==false.
> > > There are not many, and likely most PTEs in the range they are passing are
> > > all non-none.
> > 
> > Or we just silently leak memory :P
> 
> That's exactly what I am trying to figure out: is there something upstream
> that could actually run into this such that we should CC stable?

From a quick glance, I don't see any of them to have a problem, but the
fix is trivial enough for stable@ even without a known buggy user.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
