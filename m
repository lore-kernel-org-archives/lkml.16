Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2930718FDCE;
	Wed, 29 Jan 2025 23:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738192288; cv=none; b=fcBjAtShphTX/vN+LSIRzi8JN/gy2oGORK9Mj/TsJd5gITCuJTI7s+N+LIXIRqOy/DyRpraSkQXn/c9AJwXe/FOCv/CiaJudwiuLHSz3885g2btNhNX4nWv891KKe93AZoBMvg9pp3jFbgDy3Pcig+pr/X4L4Rc7XdO3Q7sxxSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738192288; c=relaxed/simple;
	bh=TIg1A3P3rPFnErG5V6QrS7lgRXJlFzAxKWtCDTFd0wQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z9mbQZtj6V2TUPf9ZAmVJyrblMIxI3aDFxBJzzlXcPAQBLNojx8CxYjV6zaXdKizAUpILVrNVbNH8u9d4pY6qY2HEJo0rg1hiTPGAVbnjDopZaDMdHWuRrxEdmkWbgMH1XfCJ1ujNQh2i3pYm3G7X0Cf3W7SjZcE+CtrGpkmyCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=XAlzvbpm; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XAlzvbpm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QKrCOl8m/rCgj2HwdpxvnpKCmh7wiUqfd/v4l4GcjUc=; b=XAlzvbpm4PcdqKCBNo8ChFEShx
	lqZp17NxxDoP4sob5u58w7AX+GnxbL96EhyRp5zw+EiRrPm9v/XqNrH4/nrejYuxVIjqsPCqz9YwP
	WMKOB9JSXo8Hm3gkO35cRfNjT4Y2eBvLdqz52evfls3I1nKZpV3NZx6BhuUKxl+NCEw2Jrh7gm6Bj
	8gZFqrfU1pvJtZ54J3RtryoRnnuNleBENVgW56ivU/gcjhbOU3SySG1FLFC3cntYHzmArpoHIkYaR
	detcDBHbIfOt7GkEL/RaJcrVpTK6ZZv1uSHlI9GlsJSld2ZLb2LwbjPlRNQNeyLSNHcSHQayK269J
	wbFRDBMw==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tdHDP-0000000CYqS-0Mah;
	Wed, 29 Jan 2025 23:11:23 +0000
Date: Wed, 29 Jan 2025 23:11:22 +0000
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
Message-ID: <Z5q1mkliUUM5Xlod@casper.infradead.org>
References: <20241205-xarray-kunit-port-v1-1-ee44bc7aa201@gmail.com>
 <07cf896e-adf8-414f-a629-a808fc26014a@oracle.com>
 <qdq4k6323orqifgzo7pbg5vakezr3gptfdehghxsyfrhc4kwvb@d4fxbwcl4gjm>
 <CAJ-ks9=U4PZv4NgyH8B7SbHkecGLy+M=G639hSTv-hnPySqk6w@mail.gmail.com>
 <xf3445vgszstqfwycf5wc5owhnifxb3mny5xjjaihghqgnozmd@3h7hnifir4vu>
 <CAJ-ks9=hNGRFbr3sTQBma3u84Yhog7i33Oc=16FqFjE_JYNERA@mail.gmail.com>
 <Z5qzk_92KU0xoLcP@casper.infradead.org>
 <CAJ-ks9ksSh-r6SmKsm7iJA6nCqvrhXZ8jtjP-YoeMNB6tF5a=g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ-ks9ksSh-r6SmKsm7iJA6nCqvrhXZ8jtjP-YoeMNB6tF5a=g@mail.gmail.com>

On Wed, Jan 29, 2025 at 06:08:22PM -0500, Tamir Duberstein wrote:
> The whole point of tools is to liberate stupid humans' brains like
> mine from mundane tasks like working out who to email. The tool wasn't
> wrong; it did exactly what you told it to do in your MAINTAINERS
> entry.

Tools do get things wrong.  So do humans.  When you take your hands off
the steering wheel and the car crashes, it's still your fault.

> > > For what it's worth the kunit invocation, while obscure, is
> > > self-documenting. There's usage information that's reasonably
> > > understandable embedded in the tool itself. I looked for the userspace
> > > testing initially but failed to find
> > > tools/testing/radix-tree/xarray.c. Even now, I'm not sure how I'm
> > > meant to compile this.
> >
> > kunit is useless.  The test_xarray.c module is useless.  If you break
> > xarray, the kernel won't boot far enough to load any modules.  You
> > haven't thought about this AT ALL.
> 
> I don't understand what you're saying here.

Then I don't want to see any more patches from you until you do.
