Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15B422370F
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 06:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738823285; cv=none; b=kzFOF7wMeeZ9vh00x7d3ByL592G0TZHTgflZaRuQK7M3gtLzivvjbmqhsBq6esdCbK+3+TKnavDsGNMAM3A2ljESaUic37GI/isp/flBXsdpFsr1JCBC1AXTSNA9hQrCAbpHf1YG0PCKq9vDS0H3u9vt1dSVpc6H37GFf12dOd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738823285; c=relaxed/simple;
	bh=0Fn2cLRgxvxvLS5p2V3DfVAHIHe9oV4dus+/QtcCaBc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PYRWS+YJ93veGCOiQXVBwkote/5E0xnrhAO637iilCGgigaEkGYSp8YwWM1utnX+ekaOcIOX8oXfwBDKEzi6AK+t5jkH+snZrgzZYh9nCCKJmvH4NiJNYGUk78NhsxgrUKwf7hd9um6oTvN2mYfvnjF9ia6t2/4ZQaHmXlpzo3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NzL893b1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NzL893b1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC7C3C4CEDD;
	Thu,  6 Feb 2025 06:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738823285;
	bh=0Fn2cLRgxvxvLS5p2V3DfVAHIHe9oV4dus+/QtcCaBc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NzL893b1mj6iPva/1U9W4FLmyz0frrWv8kLwPRSVKO+vhptmf5Zn0XZQdkFTQLZ5i
	 ZQaKoRcZe6o9OI+6XwBT8V5dBq/jftIEFA1sidpV60xFiFCXc53kkwSLxHWpi3FrW8
	 UXu8d7F+bd6xHvdUL2Mq/sCspCgd96pw8eZiP3hXCym92pu6fGjLBeUrjVOXnEpKVj
	 KjKJLqUhfVP8/ah318AUNET+7q7t1EcYkGnkVi56ZQUCEL7lrDFLkeSwl/0cQRpRJL
	 c2FekF9hLX0GS7vcO8ptogh43xIoGPyYRNz7n1Dwt+lKQ+zlRfN2aZ28f66y8BsMjV
	 lLMpX0eh6vQeQ==
From: SeongJae Park <sj@kernel.org>
To: SeongJae Park <sj@kernel.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Vlastimil Babka <vbabka@suse.cz>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [RFC PATCH v2 4/4] mm/madvise: remove redundant mmap_lock operations from process_madvise()
Date: Wed,  5 Feb 2025 22:28:01 -0800
Message-Id: <20250206062801.3060-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250204195343.16500-1-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue,  4 Feb 2025 11:53:43 -0800 SeongJae Park <sj@kernel.org> wrote:

> On Fri, 31 Jan 2025 17:51:45 +0000 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
> 
> > On Fri, Jan 31, 2025 at 12:47:24PM -0500, Liam R. Howlett wrote:
> > > * Davidlohr Bueso <dave@stgolabs.net> [250131 12:31]:
> > > > On Fri, 31 Jan 2025, Lorenzo Stoakes wrote:
> > > >
> > > > > On Thu, Jan 16, 2025 at 05:30:58PM -0800, SeongJae Park wrote:
> > > > > > Optimize redundant mmap lock operations from process_madvise() by
> > > > > > directly doing the mmap locking first, and then the remaining works for
> > > > > > all ranges in the loop.
> > > > > >
> > > > > > Signed-off-by: SeongJae Park <sj@kernel.org>
> > > > >
> > > > > I wonder if this might increase lock contention because now all of the
> > > > > vector operations will hold the relevant mm lock without releasing after
> > > > > each operation?
[...]
> > 
> > Keep in mind process_madvise() is not limited by IOV_MAX, which can be rather
> > high, but rather UIO_FASTIOV, which is limited to 8 entries.
> 
> process_madvise() indeed have iovec array of UIO_FASTIOV size, namely iovstack.
> But, if I understood the code correctly, iostack is used only for a fast path
> that the user requested advicing less than UIO_FASTIOV regions.
> 
> I actually confirmed I can make the loop itrate 1024 times, using my
> microbenchmark[1].  My step for the check was running the program with
> 'eval_pmadv $((4*1024*1024)) $((4*1024)) $((4*1024*1024))' command, and
> counting the number of the itration of the vector_madvise() main loop using
> printk().  Please let me know if I'm missing something.
> 
> > 
> > (Some have been surprised by this limitation...!)
> > 
> > So I think at this point scaling isn't a huge issue, I raise it because in
> > future we may want to increase this limit, at which point we should think about
> > it, which is why I sort of hand-waved it away a bit.
> 
> I personally think this may still not be a huge issue, especially given the
> fact that users can test and tune the limit.  But I'd like to hear more
> opinions if available.

Maybe I should wait more for the more opinions, but I just impatiently sent the
next spin of this patch series[1].  Because Davidlohr and Lorenzo promised
their tags based on the assumption of UIO_FASTIOV limit while I think that may
not be an effective limit, I didn't add their tags on the fourth patch of the
series.  Please let me know if you have any concern about that, either on this
thread or on the new patch series thread[1].

[1] https://lore.kernel.org/20250206061517.2958-1-sj@kernel.org

> 
> [1] https://github.com/sjp38/eval_proc_madvise/blob/master/eval_pmadv.c


Thanks,
SJ

[...]
