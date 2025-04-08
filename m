Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5A710E0;
	Tue,  8 Apr 2025 06:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744092125; cv=none; b=mCsKxmxflpV0ALjZlVw01XUrceJOqo3YvXuEnDU8GiWRWCtPItshSMWw4fLC90T/SOqJOZN86Iw53sCN/yHdXdTUSScKc7jR2jUOTPmkRQ+GrzZ6AKYT3HXRjjSpR4dvlIFK6SVORKNBOtqILeLIxmtSoNr0xsMUK8JgpNsOaVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744092125; c=relaxed/simple;
	bh=e1j0fgkqOXDZec9URWtIbhBA54o0opSuOGLmeemXFQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tkou2CSuCALqOAaaY8IXd/8LIedBIKWLJL9nthP0y/JeSP9uOjcd2pQgMjokOjbS7ed3sXpyLWLluwj15UVhx16CXk/URCDMUkn2od3mDJj7P6+qOr02D8lXN0UiL5Nnu9W0QmwuKoI6r2ueWjhnuYAw28NnHEMgQI+35/rCsEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=eaj1IaAq; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="eaj1IaAq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=EDvhmqcm28EGKlWvqvv6BIg+rBPoOk4uGE1wigR7x3o=; b=eaj1IaAqJLIbwH05lY07iozfAP
	FvaFhZ8ycdvdRmono/f4bzqeelSUDKtVyi6N76cV4Agkxr95sZdYny5LOdja8Aq1oSTcAdLs+axej
	w4MABierkL6xejGfPy+ohktMFwQBE52hcO4vFZwpmq54PJ1vgRJK1CB4GR4ngrBlTFRc+9yNCfbWO
	ZiVBwVsAfXeQjL6bCG3SeO8E27oeD7YW+SbLhpq1+Z7k3C25WQOYytd7rrY4ag8z5//HEFVsC76hV
	K7oezNLUkf5XqD8Gy54XMP2HcELF5NYwuFI6sXJXSpYPEa8oKvTA8LxLOSiXgRMY0rHMvrNAtGh6Q
	6rBy0CQQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u221q-00000002qK6-2cV0;
	Tue, 08 Apr 2025 06:01:46 +0000
Date: Mon, 7 Apr 2025 23:01:46 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Eric Naim <dnaim@cachyos.org>
Cc: Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org,
	peterz@infradead.org, willy@infradead.org, liam.howlett@oracle.com,
	lorenzo.stoakes@oracle.com, mhocko@suse.com, hannes@cmpxchg.org,
	mjguzik@gmail.com, oliver.sang@intel.com,
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com,
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org,
	brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com,
	hughd@google.com, lokeshgidra@google.com, minchan@google.com,
	jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com,
	pasha.tatashin@soleen.com, klarasmodin@gmail.com, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v7 10/17] mm: uninline the main body of vma_start_write()
Message-ID: <Z_S7yjRXWIXnVXsf@infradead.org>
References: <20241226170710.1159679-1-surenb@google.com>
 <20241226170710.1159679-11-surenb@google.com>
 <0d36fd53-b817-4bbd-ae38-af094bd301df@suse.cz>
 <40182b31-95ad-4825-9c0c-0127be1734a6@cachyos.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40182b31-95ad-4825-9c0c-0127be1734a6@cachyos.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Tue, Apr 08, 2025 at 12:39:25PM +0800, Eric Naim wrote:
> The out-of-tree NVIDIA modules seem to rely on this symbol, is it possible to use EXPORT_SYMBOL() here instead of EXPORT_SYMBOL_GPL(), below is the modpost error:

No.  They don't have any business using this.

In fact vma_start_write should not be exported at all, just the
vm_flags_{set,clear,mod} helpers.
