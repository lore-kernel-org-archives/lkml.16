Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781FA1993B9
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 19:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749844042; cv=none; b=G+KOshy5SetZ5KjAHi6raX3qxTwj0JUUGKkkqKur1JN5MnkfGgOTO8svARf4sDU/FF1GcswDpNMUBfeQXkfyWzMzkZOWrB4WhOWzdSwHcArtfpraIm1VxiPOyq1coTe+PjjglIk8EI+R85B8dkdhD0kO7XAQ/zOojkQ3SBfgaLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749844042; c=relaxed/simple;
	bh=Vx30gAoN16zPuPm+HYKXZC/dv4fSer6XV/umio+rsmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l3KsI3hb83OGYKPI4o19HedHkajLK6ESp+vAqvswMgO0NXat3GRjmo7+znou3bwycI154UW7LIZIaYSvBoq2G5cRhkgGnO2aBqcaYkh6GYUb5PldXuBoK4KV+oT8Wyj+mWMSgjDNOwEHWI6QUu9cKAaNRSqf+CjNynz4X7Jz0Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wefhe5BK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wefhe5BK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90993C4CEE3;
	Fri, 13 Jun 2025 19:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749844042;
	bh=Vx30gAoN16zPuPm+HYKXZC/dv4fSer6XV/umio+rsmc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wefhe5BKEno8TnRN31vUfyIMzCslQCzEvwwRaKwUp9Bm25jrdJnNXIiUiqa3zudmu
	 W1scRjDbt9mir7XOP0BHfWfVA8mz6qze2SdPgMPWregruYVOW/IkaHQxQIL3Kufoic
	 1tK3SPnddtPWnbRCpfh0C8kBPAKazQprEITnheXPYDCH0t/pKp+n6iI4e1wVRW1ROJ
	 tnfEEeYGyVk6QPR0SkzZjS2wRdYZXxSHyhG4DjQ40+4ZzUcPRsQu7ADCXrRzlOOFPa
	 c8L042AvIiNMnmd+6R3kM6plh+HqvS4KxT48woThvwzgXBzMjkdW9g8ORkAYs75tUN
	 yLoS2xOtIGCxw==
Date: Fri, 13 Jun 2025 16:47:19 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>,
	Kan Liang <kan.liang@linux.intel.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Yury Norov <yury.norov@gmail.com>, linux-kernel@vger.kernel.org,
	I Hsin Cheng <richard120310@gmail.com>
Subject: Re: [PATCH 1/1 fyi] tools headers: Synchronize linux/bits.h with the
 kernel sources
Message-ID: <aEyARypdPKliMogn@x1>
References: <aEr0ZJ60EbshEy6p@x1>
 <b5030bc8-34b8-4275-86ba-11e11ab2bea5@wanadoo.fr>
 <aEx6UDLwH_0UR6xl@x1>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEx6UDLwH_0UR6xl@x1>

On Fri, Jun 13, 2025 at 04:21:52PM -0300, Arnaldo Carvalho de Melo wrote:
> On Fri, Jun 13, 2025 at 09:24:35PM +0900, Vincent Mailhol wrote:
> > On 13/06/2025 at 00:38, Arnaldo Carvalho de Melo wrote:
> > > To pick up the changes in this cset:
> 
> > >   5b572e8a9f3dcd6e ("bits: introduce fixed-type BIT_U*()")
> > >   19408200c094858d ("bits: introduce fixed-type GENMASK_U*()")
> > >   31299a5e02112411 ("bits: add comments and newlines to #if, #else and #endif directives")
> 
> > > This addresses these perf build warnings:
> 
> > >   Warning: Kernel ABI header differences:
> > >     diff -u tools/include/linux/bits.h include/linux/bits.h
> 
> > > Please see tools/include/uapi/README for further details.
> 
> > > Cc: Adrian Hunter <adrian.hunter@intel.com>
> > > Cc: Ian Rogers <irogers@google.com>
> > > Cc: James Clark <james.clark@linaro.org>
> > > Cc: Jiri Olsa <jolsa@kernel.org>
> > > Cc: Kan Liang <kan.liang@linux.intel.com>
> > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > Cc: Namhyung Kim <namhyung@kernel.org>
> > > Cc: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> > > Cc: Yury Norov <yury.norov@gmail.com>
> > > Link: https://lore.kernel.org/r/
> > > Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
>  
> > For what it is worth:
>  
> > Acked-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> 
> Very much appreciated, added to the cset.

But then there is one more:

      1e7933a575ed8af4 ("uapi: Revert "bitops: avoid integer overflow in GENMASK(_ULL)"")

I updated the sync with this extra one.

- Arnaldo
