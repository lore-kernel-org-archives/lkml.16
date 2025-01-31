Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446CC653;
	Fri, 31 Jan 2025 00:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738282952; cv=none; b=WID2nshFUEFe09Pc02nhqMkEvW2KkfUP0B6Pb6sSNNdjOMJl8CUGyA4JR6GKxUWHxGtmcNHEU9H+ztZ005Qfg9FCz+WcirVPETw+1jGcFwTQRFiZY8UMk7HqQcQcMUryKVe3okKvrbxdnm8Bs+cqxtJxhY1y75H4gcuhOBFrutk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738282952; c=relaxed/simple;
	bh=+0gqCmX3XNKCKW4rck9Ou6ozz0RJo/+ewAmbL7uc80A=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=u8Rn1uPWI8JiDJBVt1fpfazZrCTY/ybc2Wip4U+aSXFR3jFsRrgywb8gWdg3DmxD7/2XvnZsInStDTmZ3cmxqS1nLzFtAz7hkNyXHjuOqDTWRq4vE60zhS168gXqjAOxtDt97Ikfwe3cym/M0b9tLVaujmMUDwN9Z8LLFrwZS3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=f7QIIv3I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="f7QIIv3I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 625B7C4CED2;
	Fri, 31 Jan 2025 00:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1738282951;
	bh=+0gqCmX3XNKCKW4rck9Ou6ozz0RJo/+ewAmbL7uc80A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=f7QIIv3I+QHM9mGjQv6SP2ZPQdLBF2lqmZmTN5kKs/nxgKDJs4xmYxB1j41iQZdba
	 zHCjewXX8KWilpdW4QIm9x1P/vWpPbsodazYEXfjpk2gzen1OEK6LP4/70PIRDVhJ7
	 wLZr6P3WvvMBc+jWGfK6LSKfJxmVXrwhx7VezwRc=
Date: Thu, 30 Jan 2025 16:22:30 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Sidhartha Kumar
 <sidhartha.kumar@oracle.com>, christophe.leroy@csgroup.eu,
 geert@linux-m68k.org, justinstitt@google.com, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org,
 llvm@lists.linux.dev, maddy@linux.ibm.com, morbo@google.com,
 mpe@ellerman.id.au, nathan@kernel.org, naveen@kernel.org,
 ndesaulniers@google.com, npiggin@gmail.com, Matthew Wilcox
 <willy@infradead.org>, linux-mm@kvack.org
Subject: Re: [PATCH] xarray: port tests to kunit
Message-Id: <20250130162230.168530a472df1e56ba987f75@linux-foundation.org>
In-Reply-To: <CAJ-ks9=U4PZv4NgyH8B7SbHkecGLy+M=G639hSTv-hnPySqk6w@mail.gmail.com>
References: <20241205-xarray-kunit-port-v1-1-ee44bc7aa201@gmail.com>
	<07cf896e-adf8-414f-a629-a808fc26014a@oracle.com>
	<qdq4k6323orqifgzo7pbg5vakezr3gptfdehghxsyfrhc4kwvb@d4fxbwcl4gjm>
	<CAJ-ks9=U4PZv4NgyH8B7SbHkecGLy+M=G639hSTv-hnPySqk6w@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 29 Jan 2025 16:28:32 -0500 Tamir Duberstein <tamird@gmail.com> wrote:

> > How are grammar corrections going to the right person (but not the
> > mailing list) while an entire conversion to kunit is not [1]?
> 
> Very simple: the tests are not properly included in MAINTAINERS. I
> sent https://lore.kernel.org/all/20250129-xarray-test-maintainer-v1-1-482e31f30f47@gmail.com/
> a few minutes ago for this reason.

I failed to notice that this patch didn't cc linux-mm.

MAINTAINERS doesn't ask people to cc linux-mm on xarray changes.

linux-mm averages 130 messages/day - I think it's reasonable to believe
that MM developers spend a few minutes a day scanning the Subject:s.

This:

From: Andrew Morton <akpm@linux-foundation.org>
Subject: MAINTAINERS: include linux-mm for xarray maintenance
Date: Thu Jan 30 04:16:20 PM PST 2025

MM developers have an interest in the xarray code.

Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 MAINTAINERS |    1 +
 1 file changed, 1 insertion(+)

--- a/MAINTAINERS~maintainers-include-linux-mm-for-xarray-maintenance
+++ a/MAINTAINERS
@@ -25676,6 +25676,7 @@ F:	arch/x86/entry/vdso/
 XARRAY
 M:	Matthew Wilcox <willy@infradead.org>
 L:	linux-fsdevel@vger.kernel.org
+L:	linux-mm@kvack.org
 S:	Supported
 F:	Documentation/core-api/xarray.rst
 F:	include/linux/idr.h
_

