Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C2A1EB3D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 20:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744143818; cv=none; b=OiC1SZptEfO+v5NyuBKAT4o6P+aN0jNxW/0rYYXtnCwY/fyr+vnM4fXM2zecFBnAjQU3cUcNlEM8Vh1VwZkPt8ltEwLDWYUUDP3aGqsPOOLVE8viVxzQBVOJtUXyRnsSPPLdqiYc+KVmByUbA6fVOOZtPrscB/mOdKg2YGGkU/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744143818; c=relaxed/simple;
	bh=t4dpsxhoSJicILQ+ZU+F72OUh+2j3XDJDE9iB0faTV0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T1nQkQB3tDYI7SyDtpJmasdcV9NPVWVyBS9uPInIXUNVjQPljWblC9fvgpW03v1EpQi7OLDxVmdO0Ff+t8pm2pNeMVnkHlqNLRXZuhvZ+9yRQRvhDsgKBm6BdCJkQeBtDyo4FEX5RfmjrjWizYzChe/OaYi1NRhgXk7LojgT3qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u00QKcuc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u00QKcuc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48AB7C4CEE5;
	Tue,  8 Apr 2025 20:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744143817;
	bh=t4dpsxhoSJicILQ+ZU+F72OUh+2j3XDJDE9iB0faTV0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u00QKcucJGpBXB3S05SDZ5ju4wOe8gmgglIm6qzGf+1mieBEz9ZCNrdb5nchtdWkV
	 MWk+P+3KB7HDCtvi96OWsm2rLP/MuItrwpysYu5UByPPee3zyOcVPDdnJuBot5qv/s
	 1ogUpy3rRhcMPpJ7lrQtcU65yGk/HV/JHRCsx4ZiAoxguBoLbGjFWxxJlkDFuaQ08G
	 SWfsKi3tRsRha7RpudPzb1kJY8E3QcbBAzDf2BWGVGBze8XKINxdyOfrE2N8Wnb/wA
	 n3Wmk+xkydv4WZOo7vtq0f1bW7+TPZ2VKacjQLvDJW1YU+B3yQRMZh71wi90RUk84A
	 rZ9SR2c2Trf5g==
From: SeongJae Park <sj@kernel.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R.Howlett" <howlett@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Rik van Riel <riel@surriel.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Vlastimil Babka <vbabka@suse.cz>,
	kernel-team@meta.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v2 0/4] mm/madvise: batch tlb flushes for MADV_DONTNEED and MADV_FREE
Date: Tue,  8 Apr 2025 13:23:35 -0700
Message-Id: <20250408202335.63434-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <f06859c3-c7bf-470e-b0bb-2dd352f3afe9@lucifer.local>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 8 Apr 2025 14:44:40 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:

> On Fri, Apr 04, 2025 at 02:06:56PM -0700, SeongJae Park wrote:
> > When process_madvise() is called to do MADV_DONTNEED[_LOCKED] or
> > MADV_FREE with multiple address ranges, tlb flushes happen for each of
> > the given address ranges.  Because such tlb flushes are for same
> 
> Nit: for _the_ same.

Thank you for kindly finding and suggesting fixes for these mistakes.  I will
update following your suggestions here and below.

[...]
> > Similar optimizations might be applicable to other madvise behaviros
> 
> Typo: behaviros -> behavior (or 'behaviors', but since behavior is already plural
> probably unnecessary).
> 
> > such as MADV_COLD and MADV_PAGEOUT.  Those are simply out of the scope
> > of this patch series, though.
> 
> Well well, for now :)

Yes.  Hopefully we will have another chance to further improve the cases.

[...]
> > Test Results
> > ============
> >
> > I measured the latency to apply MADV_DONTNEED advice to 256 MiB memory
> > using multiple process_madvise() calls.  I apply the advice in 4 KiB
> > sized regions granularity, but with varying batch size per
> > process_madvise() call (vlen) from 1 to 1024.  The source code for the
> > measurement is available at GitHub[1].  To reduce measurement errors, I
> > did the measurement five times.
> 
> Be interesting to see how this behaves with mTHP sizing too! But probably a bit
> out of scope perhaps.

Obviously we have many more rooms to explore and get fun :)

> 
> >
> > The measurement results are as below.  'sz_batch' column shows the batch
> > size of process_madvise() calls.  'Before' and 'After' columns show the
> > average of latencies in nanoseconds that measured five times on kernels
> > that built without and with the tlb flushes batching of this series
> > (patches 3 and 4), respectively.  For the baseline, mm-new tree of
> > 2025-04-04[2] has been used.  'B-stdev' and 'A-stdev' columns show
> > ratios of latency measurements standard deviation to average in percent
> > for 'Before' and 'After', respectively.  'Latency_reduction' shows the
> > reduction of the latency that the 'After' has achieved compared to
> > 'Before', in percent.  Higher 'Latency_reduction' values mean more
> > efficiency improvements.
> >
> >     sz_batch   Before        B-stdev   After         A-stdev   Latency_reduction
> >     1          110948138.2   5.55      109476402.8   4.28      1.33
> >     2          75678535.6    1.67      70470722.2    3.55      6.88
> >     4          59530647.6    4.77      51735606.6    3.44      13.09
> >     8          50013051.6    4.39      44377029.8    5.20      11.27
> >     16         48657878.2    9.32      37291600.4    3.39      23.36
> >     32         43614180.2    6.06      34127428      3.75      21.75
> >     64         42466694.2    5.70      26737935.2    2.54      37.04
> >     128        42977970      6.99      25050444.2    4.06      41.71
> >     256        41549546      1.88      24644375.8    3.77      40.69
> >     512        42162698.6    6.17      24068224.8    2.87      42.92
> >     1024       40978574      5.44      23872024.2    3.65      41.75
> 
> Very nice! Great work.
> 
> >
> > As expected, tlb flushes batching provides latency reduction that
> > proportional to the batch size.  The efficiency gain ranges from about
> > 6.88 percent with batch size 2, to about 40 percent with batch size 128.
> >
> > Please note that this is a very simple microbenchmark, so real
> > efficiency gain on real workload could be very different.
> 
> Indeed, accepted, but it makes a great deal of sense to batch these operations,
> especially when we get to the point of actually increasing the process_madvise()
> iov size.

Cannot agree more.

Thank you for your kind review with great suggestions for this patchset.  I
will post the next spin with the suggested changes, soon.


Thanks,
SJ

[...]
