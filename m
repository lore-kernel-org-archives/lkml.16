Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B870C18FDCE;
	Wed, 29 Jan 2025 23:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738191777; cv=none; b=QYPL0dh4GY/XZku9z+RMDTtQkqZ1gr6giqAHwdry8NijkTRAh0GXfgXLjoZfHghIwPHjJ9X8DLt5Nd+UimjzK+4M8KXVkTeRFb829X0Y2wS+7GKVxCK9I2Tiygk8dGGM4LJmBFwbBbG4jEodCN4aSe5sgEhbPeO+HNHvmORdy6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738191777; c=relaxed/simple;
	bh=uUyVDczqk1R0mh5t5rj/thcPy+rTmbPHGUuCVgvW7Jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lsbLLpn6rCqEsBEMPjihTw6J8vJ8hD8pC6cS5uVkPILi6QItE6RykQ2Ne5wW1p7+Ys1eiFyAw0sKGhS5MsUQ1W6IkCMeNIvqcod7On0R7pNjv7dkze1IlWvSporuaix6nEAv6CY00klGVMqxDzqc/vlOanmYSlcpLUVTufSv8hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=itWlX2OR; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="itWlX2OR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KfRVwiVvoIL5yKlVMJTKUtLAc62tnU62cuq5lssPDUQ=; b=itWlX2ORYkxDIMR7KkPfVOS3of
	mA85c29LcGu6a4faK14Mlody6Myv+SWb1GHg19xlyJhbt5kNYKL2B6FpdlCzEbLARSUcwIQ41cQp2
	X3vUGRs2gB+fEnK2awaGyv8k71Lho6DGBejeORiCL09uQN8gi/TjYFeHTA8uo4HmrpRscM4j6aLIz
	P3lIYaOUS7rd0pVqvJZizXk+7R5iOVbXpM+PqOLscrJzqevkL7Q7zxDqivU4iNaKk9v71jIu7WHqj
	TR4S7YHpuau7rMlzD3CKsqBglLYiS4B7CSyb0omVXOzya/c7BmEEinKDhwyRgTc5VhdLT/3KJbYAk
	J771SZTQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tdH51-0000000CYOC-1aDq;
	Wed, 29 Jan 2025 23:02:43 +0000
Date: Wed, 29 Jan 2025 23:02:43 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Sidhartha Kumar <sidhartha.kumar@oracle.com>,
	akpm@linux-foundation.org, christophe.leroy@csgroup.eu,
	geert@linux-m68k.org, justinstitt@google.com,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev,
	maddy@linux.ibm.com, morbo@google.com, mpe@ellerman.id.au,
	nathan@kernel.org, naveen@kernel.org, ndesaulniers@google.com,
	npiggin@gmail.com, linux-mm@kvack.org
Subject: Re: [PATCH] xarray: port tests to kunit
Message-ID: <Z5qzk_92KU0xoLcP@casper.infradead.org>
References: <20241205-xarray-kunit-port-v1-1-ee44bc7aa201@gmail.com>
 <07cf896e-adf8-414f-a629-a808fc26014a@oracle.com>
 <qdq4k6323orqifgzo7pbg5vakezr3gptfdehghxsyfrhc4kwvb@d4fxbwcl4gjm>
 <CAJ-ks9=U4PZv4NgyH8B7SbHkecGLy+M=G639hSTv-hnPySqk6w@mail.gmail.com>
 <xf3445vgszstqfwycf5wc5owhnifxb3mny5xjjaihghqgnozmd@3h7hnifir4vu>
 <CAJ-ks9=hNGRFbr3sTQBma3u84Yhog7i33Oc=16FqFjE_JYNERA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ-ks9=hNGRFbr3sTQBma3u84Yhog7i33Oc=16FqFjE_JYNERA@mail.gmail.com>

On Wed, Jan 29, 2025 at 05:33:06PM -0500, Tamir Duberstein wrote:
> >  $ ./scripts/get_maintainer.pl --git lib/xarray.c
> > Matthew Wilcox <willy@infradead.org> (supporter:XARRAY,commit_signer:1/3=33%,authored:1/3=33%,added_lines:19/52=37%,removed_lines:4/23=17%)
> > Andrew Morton <akpm@linux-foundation.org> (supporter:LIBRARY CODE,commit_signer:3/3=100%)
> 
> I'm not sure what you're asking. I used `b4 prep --auto-to-cc`. It
> doesn't know that test_xarray.c and xarray.c have the same maintainer.

You need to use your brain.  You can't just say "I used the tool".
Tools are just tools.  Sometimes they're wrong.  My email address is
listed as the Author: of test_xarray.c.  You should have noticed that.

> For what it's worth the kunit invocation, while obscure, is
> self-documenting. There's usage information that's reasonably
> understandable embedded in the tool itself. I looked for the userspace
> testing initially but failed to find
> tools/testing/radix-tree/xarray.c. Even now, I'm not sure how I'm
> meant to compile this.

kunit is useless.  The test_xarray.c module is useless.  If you break
xarray, the kernel won't boot far enough to load any modules.  You
haven't thought about this AT ALL.

cd tools/testing/radix-tree
make

Then you can run the tests, whichever ones make sense for you to run.
