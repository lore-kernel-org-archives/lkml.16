Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54711E231F
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 18:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739298516; cv=none; b=K8dEpcqp111tKDUjPeVs8IPMVCRMg88NrGFcSHmX0y9lPRgbSQkN9CjTdVh/dxxlGFz6kAIp5p8EJyTcNmCcToRQRBCZEZ1nJM0SHD8AUuFhqvWJJ30mI7A9XKQkwIlSd2bTaySOLpxc8+WzHAIWJzadt1rX2aLqHO+eTRKmUr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739298516; c=relaxed/simple;
	bh=xtsFazpjIaHcD9JinahzPbL8TpyUe+HBgeXCBVekqkc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jIF1PwMRgXe0ZmX1AsxZO/58Qr956786MWA/fQfrOOtewKz3HN3TcQJQav1vPdpIgEHnbTbsvgfPXTJJt2ycCLD1zgOe9aJzHUoc89poas/Ex5g8l6C2LaIxqIOmn1sa+i4PYCbUftNYCkCtuEzCu3Ay3uOITN2ieBjsKUW6XB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NoHbc5cG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NoHbc5cG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16B14C4CEDD;
	Tue, 11 Feb 2025 18:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739298516;
	bh=xtsFazpjIaHcD9JinahzPbL8TpyUe+HBgeXCBVekqkc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NoHbc5cGFa40Nj8sTlOcRX4xQkIjoYaw3UwZRnJXys/3kzLJTjxqIZ/TQdY7xvyPd
	 RbFzzeSw/W997NER6uyZoH/dfo3y2EvPab2DG8b1AstU7YaK2HtW9TSeGJ+Gf4yPIj
	 hIzJyoFu7no8oCyspChYukzbi/zxqcTmm+g42B5LnUYyUWO7dt+cEEhIRkZ/1KMsMq
	 5d8JIXipQgSSQiveLMkPQEUhDHmcMCykRrnlcbdfaPPHrAKp5GPVSpRQ65Nr/mPbAt
	 ddjyJeamJ2be3nxKVur8/FGi5lTeCAvkPHhkb2E8OGIuE3xo8eAs6wx+oHRZ6y3NXi
	 P9jOMkFa9O5PQ==
From: SeongJae Park <sj@kernel.org>
To: Vern Hao <haoxing990@gmail.com>
Cc: SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	David Hildenbrand <david@redhat.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Vlastimil Babka <vbabka@suse.cz>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 0/4] mm/madvise: remove redundant mmap_lock operations from process_madvise()
Date: Tue, 11 Feb 2025 10:28:33 -0800
Message-Id: <20250211182833.4193-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <f0e748d2-a792-4ccf-a8ec-addbf8d0d80a@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Vern,

On Tue, 11 Feb 2025 16:48:06 +0800 Vern Hao <haoxing990@gmail.com> wrote:

> 
> On 2025/2/6 14:15, SeongJae Park wrote:
> > process_madvise() calls do_madvise() for each address range.  Then, each
> > do_madvise() invocation holds and releases same mmap_lock.  Optimize the
> > redundant lock operations by splitting do_madvise() internal logics
> > including the mmap_lock operations, and calling the small logics
> > directly from process_madvise() in a sequence that removes the redundant
> > locking.  As a result of this change, process_madvise() becomes more
> > efficient and less racy in terms of its results and latency.
[...]
> >
> > Evaluation
> > ==========
> >
[...]
> > The measurement results are as below.  'sz_batches' column shows the
> > batch size of process_madvise() calls.  '0' batch size is for madvise()
> > calls case.
> Hi,  i just wonder why these patches can reduce latency time on call 
> madvise() DONT_NEED.

Thank you for asking this!

> >   'before' and 'after' columns are the measured time to apply
> > MADV_DONTNEED to the 256 MiB memory buffer in nanoseconds, on kernels
> > that built without and with the last patch of this series, respectively.
> > So lower value means better efficiency.  'after/before' column is the
> > ratio of 'after' to 'before'.
> >
> >      sz_batches  before       after        after/before
> >      0           146294215.2  121280536.2  0.829017989769427
> >      1           165851018.8  136305598.2  0.821855658085351
> >      2           129469321.2  103740383.6  0.801273866569094
> >      4           110369232.4  87835896.2   0.795836795182785
> >      8           102906232.4  77420920.2   0.752344327397609
> >      16          97551017.4   74959714.4   0.768415506038587
> >      32          94809848.2   71200848.4   0.750985786305689
> >      64          96087575.6   72593180     0.755489765942227
> >      128         96154163.8   68517055.4   0.712575022154163
> >      256         92901257.6   69054216.6   0.743307662177439
> >      512         93646170.8   67053296.2   0.716028168874151
> >      1024        92663219.2   70168196.8   0.75723892830177
[...]
> > Also note that this patch has somehow decreased latencies of madvise()
> > and single batch size process_madvise().  Seems this code path is small
> > enough to significantly be affected by compiler optimizations including
> > inlining of split-out functions.  Please focus on only the improvement
> > amount that changed by the batch size.

I believe the above paragraph may answer your question.  Please let me know if
not.


Thanks,
SJ

[...]
