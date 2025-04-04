Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B26258CC2;
	Fri,  4 Apr 2025 19:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743795882; cv=none; b=NBBZRiOLrO5CdQkxXvw6YU5IzYfxVIXUxRoDy65JTquy0TcwT+AbF3dMSNI4+JLIJAzg2Jt+ZmGlNumGNcbj62QlqsKwix8wgg+ZQaqGKimUjRuKjknoQqrejXfeGxbYhsRDZiGUrUbPd6gH0fi3U8Kjl5wSBsEsiFzVazyDYPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743795882; c=relaxed/simple;
	bh=uFk4xVJsOFMvSdLT5YQiyK9BCbFlv5ZfVSfjcUtKDH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QJQ63yHqCSmbr0xJx6WSOs7juPJ0kSEkaQzwMMMHf2H9uY3ntsGy43yYzhSXE5r39BfwcoJeaOlyPn7oAhk9fBtmkRxsKwshL/6ir2lTYlYd7Y77Rm0ZwPF0dJYr475mIUox2z/ZFeViladRn8E7y3ARSYRRorr8WFcLf1jEjds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KjtTrgfB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KjtTrgfB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BB77C4CEDD;
	Fri,  4 Apr 2025 19:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743795882;
	bh=uFk4xVJsOFMvSdLT5YQiyK9BCbFlv5ZfVSfjcUtKDH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KjtTrgfBBVjaG36XOjc58PwSurzBar7ba+BW1ikSrfESFXEJFPkhFrS8BDuO3hV0Z
	 XaKXvR00S1B6rWnoXMoD58JIkrGEpjKVcHYwxnf8MOqPwxTglE0cFU7V2cmH8Dogq+
	 BjVSnHTZGmCc+GOin86nkGOg7mj4adoEOxSOeyhlzV+bKCZy9n8bbqgD6zcDprb5tq
	 kriNqX2BfHqBTPdY6lCCNCQh0ZqJBquVadul6PGJG0hXfl34XYrX8aB7TAOvsU5q5k
	 1kJT1qm+wFsdAMp2zu5bhory8Zg1D8gMGQ2bbqe5mSclfTtXl7fxot8b/VD/W3+RRM
	 ymUxc2l17Fu6Q==
Date: Fri, 4 Apr 2025 21:44:39 +0200
From: Daniel Gomez <da.gomez@kernel.org>
To: David Hildenbrand <david@redhat.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, 
	"Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, willy@infradead.org, 
	linux-mm@kvack.org, Bagas Sanjaya <bagasdotme@gmail.com>, gost.dev@samsung.com, 
	linux-doc@vger.kernel.org, Pankaj Raghav <p.raghav@samsung.com>
Subject: Re: [PATCH v3] docs: update THP admin guide about non-tmpfs
 filesystem support
Message-ID: <kjmyope67af54eagiatlgph7bo4lgzy6jyut7z6elzartkoogy@eon2qkiwdbab>
References: <20250404140657.29285-1-kernel@pankajraghav.com>
 <Z-_7fzU02OU1hVOT@bombadil.infradead.org>
 <09c13770-4d62-430a-827d-6ad35411d18c@redhat.com>
 <Z_Ad0MsSAuAGevgm@bombadil.infradead.org>
 <427f683b-ac68-4820-b264-4016b34df592@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <427f683b-ac68-4820-b264-4016b34df592@redhat.com>

On Fri, Apr 04, 2025 at 09:07:23PM +0100, David Hildenbrand wrote:
> On 04.04.25 19:58, Luis Chamberlain wrote:
> > On Fri, Apr 04, 2025 at 06:18:12PM +0200, David Hildenbrand wrote:
> > > On 04.04.25 17:32, Luis Chamberlain wrote:
> > > > On Fri, Apr 04, 2025 at 04:06:57PM +0200, Pankaj Raghav (Samsung) wrote:
> > > > > From: Pankaj Raghav <p.raghav@samsung.com>
> > > > > 
> > > > > THP support for non-tmpfs filesystem has been around for some time now.
> > > > > Update the admin guide to reflect it.
> > > > > 
> > > > > While we are at it, move FilePmdMapped to previous paragraph for clarity,
> > > > > and clarify ShmemPmdMapped & ShmemHugePage.
> > > > > 
> > > > > Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
> > > > > Acked-by: David Hildenbrand <david@redhat.com>
> > > > > ---
> > > > > 
> > > > > Changes since v2:
> > > > > - Address comment from Bagas Sanjaya
> > > > > - Squash commits and Ack from David
> > > > > 
> > > > >    Documentation/admin-guide/mm/transhuge.rst | 22 +++++++++++++++-------
> > > > >    1 file changed, 15 insertions(+), 7 deletions(-)
> > > > > 
> > > > > diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/admin-guide/mm/transhuge.rst
> > > > > index dff8d5985f0f..f8aae64e38d0 100644
> > > > > --- a/Documentation/admin-guide/mm/transhuge.rst
> > > > > +++ b/Documentation/admin-guide/mm/transhuge.rst
> > > > > @@ -12,8 +12,8 @@ using huge pages for the backing of virtual memory with huge pages
> > > > >    that supports the automatic promotion and demotion of page sizes and
> > > > >    without the shortcomings of hugetlbfs.
> > > > > -Currently THP only works for anonymous memory mappings and tmpfs/shmem.
> > > > > -But in the future it can expand to other filesystems.
> > > > > +Currently, THP only works for anonymous memory mappings, tmpfs/shmem and
> > > > > +filesystems that support large folios.
> > > > 
> > > > That seems to allude that THP can be supported on filesystems
> > > > that suppor large folios. I don't think we want to call that THP
> > > > and that can confuse folks. Leaving "currently" also seems to
> > > > indicate that there is more work to be done for THP for filesystems
> > > > but that's not true as well. So how about something like:
> > > > 
> > > > THP only works for anonymous memory mappings, and the tmpfs/shmem is the only
> > > > filesystem to support it. The alternative to THP for other filesystems is to
> > > > support large folios and with it you can end up using huge pages
> > > 
> > > That makes things more complicated without a good reason.
> > > 
> > > See CONFIG_READ_ONLY_THP_FOR_FS as an early usage of the term "THP" for
> > > stuff we have in the pagecache.
> > 
> > OK.
> > 
> > > (with large folios we now properly implement
> > > this concept, and support more than only PMD size)
> > 
> > Do we really want to call large folio support on filesystems THP?
> 
> Good question.
> 
> "folio" is just the metadata we currently use to manage a chunk of memory,
> and a "large folio" is one that spans more than a single page -- huge page,
> large page, super page, ... in the past the metadata for that used to be a
> complicated piece of "compound page". In the future, we might call it
> differently (struct file_mem ?), who knows.
> 
> So "large folio" support in a fs allows for the usage of these larger chunks
> of memory (huge pages).

I'm a bit confused here. I thought the term 'huge pages' referred to specific
page table level like PMD, PUD, or PGD (and not PTE). And "large folio" term can
span up to anything (currently up to PMD). Could you clarify if I'm
misunderstanding something?
