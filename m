Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52652BF066
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 19:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749842515; cv=none; b=QuLDuDATu+bSmqIllwuwhskOO2phyeOlAhEZ0YLD8Tfjm80iDW1+3l539eypdLK6rHpmByaIUaRmTynH+jseqwAEKNv6jKZqaKMIwSAnW187qzVadGvPmVYEkHrKfo23KCWaY8yIHdbiMmjc0sdX7ZRHSOnCjW0lcgKFGboVZHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749842515; c=relaxed/simple;
	bh=4SddsYziogAY+ldwWHLjtIPf3SQjAyTK44hwSQ2+iLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mFmVI4EtdDCzlYs+AHUTXgh0eMBPYItO6E7MW8GsDSZ39dNnozh72F6/R53cujB4P6JlpQ8HpJqQLkGVISOp3XEVb04BaT6f/vSUjHtW9LOhOuUV+Dimi32es5m0Yw25KGaCk/0Qe31nJhLVFntHyxOuyMbH9g8qDZGsAiEUwa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sDG/FjyW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sDG/FjyW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F25E5C4CEE3;
	Fri, 13 Jun 2025 19:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749842515;
	bh=4SddsYziogAY+ldwWHLjtIPf3SQjAyTK44hwSQ2+iLU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sDG/FjyW+4OalR8KQ0zcvbj+1Uyxau641L86noPdOB6LJFr4MbcmBzJXAp3PdfasG
	 hQlJavI3zpa0DV6VjiPN9kMIzpn/Xj/j8dyRTcMu6n1k5Py4uNWA3O94F2vlUQv4m5
	 +FT2c44qhYlR3Z2LYwRYNpJFLTcpTPoPPmekiORB19XOa22/2nL63PbR3bIFpn7mjk
	 rRpj0D+Jt39yWFCrKOzzHy4ukEiy+AOZ1FZtQ9tv3kKIJsttyn+DrgYZeBd7jmq5zm
	 0bzKx3OsoDe/BN0b2zFK9DF0H65CzWAWvkc/91FqNB6BVxcbO2fHyWIViZK93tAo7R
	 3vGiQA6cIVw1w==
Date: Fri, 13 Jun 2025 16:21:52 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>,
	Kan Liang <kan.liang@linux.intel.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Yury Norov <yury.norov@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1 fyi] tools headers: Synchronize linux/bits.h with the
 kernel sources
Message-ID: <aEx6UDLwH_0UR6xl@x1>
References: <aEr0ZJ60EbshEy6p@x1>
 <b5030bc8-34b8-4275-86ba-11e11ab2bea5@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5030bc8-34b8-4275-86ba-11e11ab2bea5@wanadoo.fr>

On Fri, Jun 13, 2025 at 09:24:35PM +0900, Vincent Mailhol wrote:
> On 13/06/2025 at 00:38, Arnaldo Carvalho de Melo wrote:
> > To pick up the changes in this cset:

> >   5b572e8a9f3dcd6e ("bits: introduce fixed-type BIT_U*()")
> >   19408200c094858d ("bits: introduce fixed-type GENMASK_U*()")
> >   31299a5e02112411 ("bits: add comments and newlines to #if, #else and #endif directives")

> > This addresses these perf build warnings:

> >   Warning: Kernel ABI header differences:
> >     diff -u tools/include/linux/bits.h include/linux/bits.h

> > Please see tools/include/uapi/README for further details.

> > Cc: Adrian Hunter <adrian.hunter@intel.com>
> > Cc: Ian Rogers <irogers@google.com>
> > Cc: James Clark <james.clark@linaro.org>
> > Cc: Jiri Olsa <jolsa@kernel.org>
> > Cc: Kan Liang <kan.liang@linux.intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Namhyung Kim <namhyung@kernel.org>
> > Cc: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> > Cc: Yury Norov <yury.norov@gmail.com>
> > Link: https://lore.kernel.org/r/
> > Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
 
> For what it is worth:
 
> Acked-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>

Very much appreciated, added to the cset.

- Arnaldo
