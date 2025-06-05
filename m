Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F112718C06;
	Thu,  5 Jun 2025 19:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749150474; cv=none; b=dcDMWN68dwVWNcrud7GY11uIYIDJhu+ovW1rrKSWjbBBEyVB2dPmCKfOD0SxSGvJ9T2U5my4/ajWSchpqjtpibLOtHbVGIDm40PJFAxqQGqvUaQqckkAO+aG98i6frTKKlQU6TUJfY5d8bkoYJtVyb9eQb6IH/JvVf/PuHx/8pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749150474; c=relaxed/simple;
	bh=JNoaVs4iRnRiP/T19vzcD+MZ6/eoe/6/sJbe9J72MFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZOhutNmu/WBZIKPjTVK7KJd3l+EtSr3FOd604wKDZc7dJUtv5V8MA8WDnASwytwXkO1PqZxUJ59hPkLFM8QS+aJ/R5hScUNgyfFCSY/o+roMAfvJLcF7d1ADPnrpLsvYw+SNG6kUrU+D3MPl0EoHXPAoJa+/q8XcUsDaD9uBEEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=GtCE+HGy; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="GtCE+HGy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vRx1XSWACZs83q/QDpFT/kcZBhTDDJdxU63mDG//IM0=; b=GtCE+HGyJteyZbFX2Px+ZBvDj+
	/0SMWIYUlJoQIca6nXlRB2rPsuMZxqiJ77LVzSRdSHVrfQ5SoWnYwOoroH8b43NGZqqDZ2RNfpb0T
	Yz5SW0uBqeD5sZnZhPEPXgSDwxY6w6ggjd6qO/ObnElQkd+SJuxvFnYjRmUY67YK0zvnHKWb/tw0F
	kCkqH4XOi7Za997WqROQeDzXGM6k7TunDB4xS2Sw98u4q8yjvUF5vWURamcUxnFX0NfagcYEHE1kW
	Ob9fYS78I2tHSiHryim51tkSoSl6oDSOMPiX7FUoh3G6o9WvFTPh4Uxhki2idySLiSm0NhvB+68Fk
	WDcRfopQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNFwC-00000004YCO-38JR;
	Thu, 05 Jun 2025 19:07:40 +0000
Date: Thu, 5 Jun 2025 20:07:40 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] scripts/kernel-doc: drop "_noprof" on function prototypes
Message-ID: <aEHq_Jy3hPQIzaO-@casper.infradead.org>
References: <20240326054149.2121-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240326054149.2121-1-rdunlap@infradead.org>

On Mon, Mar 25, 2024 at 10:41:49PM -0700, Randy Dunlap wrote:
> Memory profiling introduces macros as hooks for function-level
> allocation profiling[1]. Memory allocation functions that are profiled
> are named like xyz_alloc() for API access to the function. xyz_alloc()
> then calls xyz_alloc_noprof() to do the allocation work.
> 
> The kernel-doc comments for the memory allocation functions are
> introduced with the xyz_alloc() function names but the function
> implementations are the xyz_alloc_noprof() names.
> This causes kernel-doc warnings for mismatched documentation and
> function prototype names.
> By dropping the "_noprof" part of the function name, the kernel-doc
> function name matches the function prototype name, so the warnings
> are resolved.

This turns out not to be enough.  For example, krealloc() is
currently undocumented.  This is because we match the function name
in EXPORT_SYMBOL() against the function name in the comment, and they
don't match.  This patch restores the documentation, although only
for the python version of kernel-doc, and I'm pretty sure there's a
better way to do it (eg building it into the export_symbol* regexes).
I can turn this into a proper patch if this is the way to go, but for
now it's just to illustrate the problem.

diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index 062453eefc7a..bdfa698d5570 100644
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -1176,11 +1176,15 @@ class KernelDoc:

         if export_symbol.search(line):
             symbol = export_symbol.group(2)
+            # See alloc_tags.h
+            symbol = symbol.removesuffix('_noprof')
             function_set.add(symbol)
             return

         if export_symbol_ns.search(line):
             symbol = export_symbol_ns.group(2)
+            # See alloc_tags.h
+            symbol = symbol.removesuffix('_noprof')
             function_set.add(symbol)

     def process_normal(self, ln, line):

