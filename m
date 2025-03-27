Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8270E21516D
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 13:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743082827; cv=none; b=ciymWjdWqhZ2pdfsAvHin8oCu8zPDupJuFGrNiJdY5jGK64ZtoRV9K9A7nEQEloJsntxmH3muhXyxletTN398AqdvMC39KXfint5mZXjk1q7lVb459awEqbnu0F1kzeU5jiwJ3HM4ho21YKLL+t8fTJ8SeLQjRI4+ame+BlpZek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743082827; c=relaxed/simple;
	bh=d2W6l2kcU8eLf2PMeZMdFTwaOG8w7XFS50Hk735+Du4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o8xY788AeKkEe1wHRw+NhwwR0VZN2DdlAXckvTqh2Y6n1A3mTAzG7us+cALCwdaO9c+bbyQPW53j23OyWNL8/T45F/4oWk7Y64NeSXbW970rq/H1OTXlzv1nKmuG1k1Oi34kmDr0XgHLij7vReiVj+0Gc2tJpKm4HXT1U2OwymY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=AeeuhZzd; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="AeeuhZzd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Umx+HX5wjGNSTr33Jqdvs6Gd7+Nc0iKv5ZmJkf9uPfo=; b=AeeuhZzdRVzBEFFamN5eLVduhp
	eFrEaU5j3iO+xAkRRdrgFDOrRoTfN1RaFgg6SbPxwLnBXYbfz4+cdJ6NGzgYXDfRSOQNCYxCh7G6T
	2fV2YjstbF3fUzhZDDjYwfdbk56zdYdo4MwIuJ/M0mY1fQoxeNoeH7Ufi+SIpfi3sXt86Q1uWzxQw
	vDbOnljRGzxxuNQoRsdqxwiqFj8vRnGc4kPGQKo8llWyMBbkXYTNBMHorvuNX3vT+EpSgT1U2YwsZ
	/HS/qqVFnG/3UrHleAxcvcj8RyKgMO4RhykvnPzRLkRxakPPd07e4w3dkPV1mCW3rRFbwfccsW6nL
	NKcUFIEQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txnSy-0000000BueD-0G8V;
	Thu, 27 Mar 2025 13:40:16 +0000
Date: Thu, 27 Mar 2025 13:40:15 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Huan Yang <link@vivo.com>
Cc: Hillf Danton <hdanton@sina.com>, Christoph Hellwig <hch@lst.de>,
	bingbu.cao@linux.intel.com, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, opensource.kernel@vivo.com, urezki@gmail.com,
	vivek.kasireddy@intel.com
Subject: Re: [PATCH] mm/vmalloc: fix mischeck pfn valid in vmap_pfns
Message-ID: <Z-VVP0kABztfpan7@casper.infradead.org>
References: <20250317055304.GB26662@lst.de>
 <5a12454c-16a1-4400-a764-f49293d8dece@vivo.com>
 <20250318064805.GA16121@lst.de>
 <5229b24f-1984-4225-ae03-8b952de56e3b@vivo.com>
 <20250318083330.GB18902@lst.de>
 <bcbbc2e9-858f-46ed-909e-1d911dd614f0@vivo.com>
 <20250318084453.GB19274@lst.de>
 <20250319050359.3484-1-hdanton@sina.com>
 <20250319112651.3502-1-hdanton@sina.com>
 <752e606b-640d-46d1-a8e0-fa714b29a7b6@vivo.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <752e606b-640d-46d1-a8e0-fa714b29a7b6@vivo.com>

On Mon, Mar 24, 2025 at 10:13:03AM +0800, Huan Yang wrote:
> HI Hillf,

Hillf is banned from the mailing lists.  I suuggest not replying to
any email that he sends to you privately.

https://lore.kernel.org/all/67cf7499597e9_1198729450@dwillia2-xfh.jf.intel.com.notmuch/
