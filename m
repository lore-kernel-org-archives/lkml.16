Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6036A1CACF6
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 22:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738447219; cv=none; b=I5qwWUAcCirm40OLYf5uV3t7PzSrIR8xe7ZeZFcqgs9k35eedDHGn919xMTLEHt1gB/iUEWLnBKFkhw97XcfpcEPG51aFfQRiwIsHwgAXuzgkqVW/VR4GrgCRRxrrDEogTbhQqkgCyon9OFTWUh9QvxbYz2BwbKELUocAUZ/gXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738447219; c=relaxed/simple;
	bh=AXk/czfIKqloyNvPQeqAIKfR0b14p38hej1yD3pNlwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O43HtIZb2+q0wSZLYM3yh//dRYqmxrD2mahrAhrwBDUJeCHB07M7QvraTbVM8bv76mldEYbL1x1YoclIYZwu/6tp7xWiJ6lX6qEOfCYwkWAG1IaZX/cvTPx2YQXcVNw7uJqhjoD3cxSY1PezDBtRJLxdaM1u0iVOsjGj8SlLGR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=fQLxUqYD; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="fQLxUqYD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yfM4WgoTdl7+Dgp4xiTrkbLt6MjiVjCph2txtENRNWg=; b=fQLxUqYDSCL3dvYeN8Wf33jxI4
	7cYrUIkMespVEzACoHPMUOH4RKVv3n5k2BHR8ohpVsB7aS8yq4QvGrzqr75RQDClHO/PP4M0n2Wtg
	EzdNsO+3eL9MdLSo/OlZlFsRkVIhV2xPl9e8wcPblafSwkPuZhsrAGsb66A5vFcPqA65146z5HtWC
	+QDSVSXboNOmYIl0So80++6vDtMOiEqgQkaHyAErovkV8PwOT5Sc3spZm9GeMmDwYxsn9VQlCe24D
	QGBURFAXFL582eeiz5+wM2j9Klq44SHyP8+KVh5M5OU288DTwrwIGBZYCfvhddtNyGG7UbLUTaAiT
	wH7aRArg==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1teLX4-0000000GRcH-2s2H;
	Sat, 01 Feb 2025 22:00:06 +0000
Date: Sat, 1 Feb 2025 22:00:06 +0000
From: Matthew Wilcox <willy@infradead.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Mateusz Guzik <mjguzik@gmail.com>, ebiederm@xmission.com,
	oleg@redhat.com, brauner@kernel.org, akpm@linux-foundation.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/6] pid: drop irq disablement around pidmap_lock
Message-ID: <Z56ZZpmAbRCIeI7D@casper.infradead.org>
References: <20250201163106.28912-1-mjguzik@gmail.com>
 <20250201163106.28912-7-mjguzik@gmail.com>
 <20250201181933.07a3e7e2@pumpkin>
 <CAGudoHFHzEQhkaJCB3z6qCfDtSRq+zZew3fDkAKG-AEjpMq8Nw@mail.gmail.com>
 <20250201215105.55c0319a@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250201215105.55c0319a@pumpkin>

On Sat, Feb 01, 2025 at 09:51:05PM +0000, David Laight wrote:
> I'm not sure what you mean.
> Disabling interrupts isn't as cheap as it ought to be, but probably isn't
> that bad.

Time it.  You'll see.

> > So while this is indeed a tradeoff, as I understand the sane default
> > is to *not* disable interrupts unless necessary.
> 
> I bet to differ.

You're wrong.  It is utterly standard to take spinlocks without
disabling IRQs.  We do it all over the kernel.  If you think that needs
to change, then make your case, don't throw a driveby review.

And I don't mean by arguing.  Make a change, measure the difference.

