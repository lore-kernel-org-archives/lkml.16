Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689CD18FC92;
	Fri,  4 Apr 2025 17:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743789522; cv=none; b=ei7dSvXBrft2JjCQ6eVisVZ5Yc42FhRho/F5AHMAc4wrYtWeYHQAd3ighUN2Y4N4xJfzRUk7tAg18SXiNO4Mdj/uQ3p22g3/ALn5QXRVVnGkH4Uu22+/CzvzSCLBLdP3aJv4hJUO5smiWoeJS2keicTNVZeXQo7UpTWJ+rOj9Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743789522; c=relaxed/simple;
	bh=kXWX8iGOo5w4zb1Q/Je7jBtB4FirWWX7B0zJrCIyQBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GmWYbyFx61YqC6ymoELzzs67p3SvA4g5t/H0M6lBAATHtNIKI1yv36agdIx5QVDxEgiDxjWEvCXN485TlJ+KKowI5hCG3oW+cGrHn7rLS0935PlRlAauF7QeE4tjsI0SvSAfNqCQQWZKbCb3dqS/bNfS8l5X/Svum4EKeK3YNII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JiX1ifeV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JiX1ifeV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C85BC4CEDD;
	Fri,  4 Apr 2025 17:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743789521;
	bh=kXWX8iGOo5w4zb1Q/Je7jBtB4FirWWX7B0zJrCIyQBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JiX1ifeVQbKug/tHRjikELcVbedy3Ku+s4ib7INNE4bXave6l39vLMZJf3/ML/opW
	 MEInsd1PIGDw94WoJY3/WEJb2oyV138yEp3LoB1N3zCAqqDDFKqL0kuUcrfTNmZkSL
	 5Wt/B/QRNmDZU4iQ8Qm1yiASVtL96waQL7ZIMW7ADvoOz19ClmGmml809M5sD6m3D2
	 uhma+HKF7Qe1MXK7XbnkRG3cHEQ6cxKyt9dzuhe3sGMhSo4pa7fJeO9Khgiix1jyV1
	 1ruqQnSsstmDy7lNMoqrxDluUNNK9JkJRtSAQ76KQH+LXN4HPjEZ3+cosA1h1S4Wae
	 ga5x9Eo6cTdZg==
Date: Fri, 4 Apr 2025 10:58:40 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: David Hildenbrand <david@redhat.com>
Cc: "Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
	willy@infradead.org, linux-mm@kvack.org,
	Bagas Sanjaya <bagasdotme@gmail.com>, da.gomez@kernel.org,
	gost.dev@samsung.com, linux-doc@vger.kernel.org,
	Pankaj Raghav <p.raghav@samsung.com>
Subject: Re: [PATCH v3] docs: update THP admin guide about non-tmpfs
 filesystem support
Message-ID: <Z_Ad0MsSAuAGevgm@bombadil.infradead.org>
References: <20250404140657.29285-1-kernel@pankajraghav.com>
 <Z-_7fzU02OU1hVOT@bombadil.infradead.org>
 <09c13770-4d62-430a-827d-6ad35411d18c@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09c13770-4d62-430a-827d-6ad35411d18c@redhat.com>

On Fri, Apr 04, 2025 at 06:18:12PM +0200, David Hildenbrand wrote:
> On 04.04.25 17:32, Luis Chamberlain wrote:
> > On Fri, Apr 04, 2025 at 04:06:57PM +0200, Pankaj Raghav (Samsung) wrote:
> > > From: Pankaj Raghav <p.raghav@samsung.com>
> > > 
> > > THP support for non-tmpfs filesystem has been around for some time now.
> > > Update the admin guide to reflect it.
> > > 
> > > While we are at it, move FilePmdMapped to previous paragraph for clarity,
> > > and clarify ShmemPmdMapped & ShmemHugePage.
> > > 
> > > Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
> > > Acked-by: David Hildenbrand <david@redhat.com>
> > > ---
> > > 
> > > Changes since v2:
> > > - Address comment from Bagas Sanjaya
> > > - Squash commits and Ack from David
> > > 
> > >   Documentation/admin-guide/mm/transhuge.rst | 22 +++++++++++++++-------
> > >   1 file changed, 15 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/admin-guide/mm/transhuge.rst
> > > index dff8d5985f0f..f8aae64e38d0 100644
> > > --- a/Documentation/admin-guide/mm/transhuge.rst
> > > +++ b/Documentation/admin-guide/mm/transhuge.rst
> > > @@ -12,8 +12,8 @@ using huge pages for the backing of virtual memory with huge pages
> > >   that supports the automatic promotion and demotion of page sizes and
> > >   without the shortcomings of hugetlbfs.
> > > -Currently THP only works for anonymous memory mappings and tmpfs/shmem.
> > > -But in the future it can expand to other filesystems.
> > > +Currently, THP only works for anonymous memory mappings, tmpfs/shmem and
> > > +filesystems that support large folios.
> > 
> > That seems to allude that THP can be supported on filesystems
> > that suppor large folios. I don't think we want to call that THP
> > and that can confuse folks. Leaving "currently" also seems to
> > indicate that there is more work to be done for THP for filesystems
> > but that's not true as well. So how about something like:
> > 
> > THP only works for anonymous memory mappings, and the tmpfs/shmem is the only
> > filesystem to support it. The alternative to THP for other filesystems is to
> > support large folios and with it you can end up using huge pages
> 
> That makes things more complicated without a good reason.
> 
> See CONFIG_READ_ONLY_THP_FOR_FS as an early usage of the term "THP" for
> stuff we have in the pagecache. 

OK.

> (with large folios we now properly implement
> this concept, and support more than only PMD size)

Do we really want to call large folio support on filesystems THP?

  Luis
