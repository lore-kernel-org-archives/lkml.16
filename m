Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7217C28CF76
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 16:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748448907; cv=none; b=SSi/oS1hIDHAjcquvhoEipnuLja3mSZzk1ug47SZKLIrubMcmCth80CZ2JWk9qjc7eBiecl96yHrBe9f87peUMPO8KdEVinhEpPJkA2bRj6CtqHn1Da2kPFiVk01SWKUXarE3gdQppHqCkUlQ/AkOF/cOVZylluNz0pqc309isM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748448907; c=relaxed/simple;
	bh=oftCGjGpACLgWjDfLsAyXAfYxlJ+xGu9uinKdgFYgsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vf8r9dhYTrCeu4F8jtHsohq+7C1wPYjAxkMKJi//7Cnb61TF+0583fiPEgBotePwCdpm0/mXdhW6zqOUFOFt6MeTTJ1faJNGgLz6HUH0QTienRtptms1X2nc9N7hB+fGzO6nbO+KQir3CxHuoOXmSWhlRHlc3O74+rkeHyczYqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SaW5KfKM; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SaW5KfKM"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e75668006b9so4011639276.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 09:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748448904; x=1749053704; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oftCGjGpACLgWjDfLsAyXAfYxlJ+xGu9uinKdgFYgsQ=;
        b=SaW5KfKMU5iqNDyf1Ck5tVJ6aA4C2qc8B6kDtVSqWhRfO0yrI30RlNaU7XxBH6ImVH
         ocqLYMS3DEHv0Uv8ewSNkaN8X5zCRtxe8yxHIrtwPNIlrRHWJsvHutujKcjXdYTHur6b
         HeZhdwqF71RlsixpiKycpzY/7vaQpZ2rwW0Fp4KPSLAT96sJ8Au/IaQoTALo3SFbbDmh
         tWvyCKXVCPBfWU6r+SPVpYdf7udeglG5hK4y8bhMTp5/ecyFDmJ+JtSDM8S6dplBuYSZ
         B//JB5TJLZxRIIY7a6BjTfoj2xc0/BW/KpRoYyLfsQBiZsYhY/wemUY14wdhrGGTd/cj
         R+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748448904; x=1749053704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oftCGjGpACLgWjDfLsAyXAfYxlJ+xGu9uinKdgFYgsQ=;
        b=lw+b1FXtFw+tM3rYcqSzxRUcM+mHVL5z6dPkdhQkfcY1U7RO8FahW1lnPKGQ5rgOwm
         zGItms3Xr29Jtg3lRwsrqcFL4u725rb8zRcl+Uv0S0g6JJM/6UovsdYdz7qLj/qtpMqJ
         aSB4/s+8FpFy/3eDYuyBkcewKGPiBmqMRe6O9g6eyzube2I07i+uZy4Kum+avhFu9g4g
         k8IhKItRzwuFf0m3jyE9TQpXTW1wCY/UvE8ScQ3kwoTdsVRlYv7X3GtOaGQz3ZnGZU6k
         m+2tQFZ9eOc4NYdYHAHEgjiVWJIwCxPfsTxVz0n1G2LHTovfggMhUfF19JnZinfGSdN+
         jyEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPFCI0uzEsVYql83HQXAS3+S9CqBDqFFTD/jh435jfxpqEvrncoXsGN7BeSzLIx78a5E5rbH+2KebHq5Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzywzfPs0AbU/FAGSzpULxCdGcD1nwvdzj5Tuz1QkMfdQuG8fHS
	fbzh9vMKnB2GL0PEzKiD7ec/R2GN735GCmW8awohKm2OK+e58FllBGse6KuS2/Pv3AWUnyI8yUQ
	XfiTCFiIyLLYmMM25fNSLnURQ3F1pe+ROGLWvV1Sm
X-Gm-Gg: ASbGncu87sfshJq0AvD7uPyavrAMYPX+1cz1ndjG9i/CroMKbx0gbWN+IgsQfDrC9+G
	7oi7TR95v0PSqaNEET9set850wxhQZXDs5HQzEM2D5m3aD/9WnqcSusb1EqfclF7lbEqKNPLc/i
	945ab5ow9J0evfU1rmFV1N1hLK5glVZII7iEW4dJ8sTwyxB98bhr5JCFcmiaHbyov5naEgZPKUT
	Mz2hw==
X-Google-Smtp-Source: AGHT+IFwW0/MrySaPT+ucgIg1dChgPDCXdJtXWgrMY95UPokdViJg0CdZ9UXjyC8CVjk5twtVkLrVgdpew1P2vJKaig=
X-Received: by 2002:a05:6902:1b8a:b0:e7d:c87a:6249 with SMTP id
 3f1490d57ef6-e7dc87a6957mr7030815276.36.1748448903884; Wed, 28 May 2025
 09:15:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528023326.3499204-1-gavinguo@igalia.com> <aDbXEnqnpDnAx4Mw@localhost.localdomain>
 <aDcl2YM5wX-MwzbM@x1.local> <629bb87e-c493-4069-866c-20e02c14ddcc@redhat.com> <aDcvplLNH0nGsLD1@localhost.localdomain>
In-Reply-To: <aDcvplLNH0nGsLD1@localhost.localdomain>
From: James Houghton <jthoughton@google.com>
Date: Wed, 28 May 2025 12:14:28 -0400
X-Gm-Features: AX0GCFtQ3Y_TJAz9gxU-mydw8Rp4n4FQFwD-d7vMDgv4nmmNrG0P_Nb3Fcuv7Sk
Message-ID: <CADrL8HXD0hX+5WvtZWKXAr0NvfvOJZhqL9PVBawYQuAyzhGgYg@mail.gmail.com>
Subject: Re: [PATCH v3] mm/hugetlb: fix a deadlock with pagecache_folio and hugetlb_fault_mutex_table
To: Oscar Salvador <osalvador@suse.de>
Cc: David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>, Gavin Guo <gavinguo@igalia.com>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, muchun.song@linux.dev, 
	akpm@linux-foundation.org, mike.kravetz@oracle.com, kernel-dev@igalia.com, 
	stable@vger.kernel.org, Hugh Dickins <hughd@google.com>, 
	Florent Revest <revest@google.com>, Gavin Shan <gshan@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 11:45=E2=80=AFAM Oscar Salvador <osalvador@suse.de>=
 wrote:
>
> On Wed, May 28, 2025 at 05:09:26PM +0200, David Hildenbrand wrote:
> > On 28.05.25 17:03, Peter Xu wrote:
> > > So I'm not 100% sure we need the folio lock even for copy; IIUC a ref=
count
> > > would be enough?
> >
> > The introducing patches seem to talk about blocking concurrent migratio=
n /
> > rmap walks.
>
> I thought the main reason was because PageLock protects us against writes=
,
> so when copying (in case of copying the underlying file), we want the
> file to be stable throughout the copy?
>
> > Maybe also concurrent fallocate(PUNCH_HOLE) is a problem regarding
> > reservations? Not sure ...
>
> fallocate()->hugetlb_vmdelete_list() tries to grab the vma in write-mode,
> and hugetlb_wp() grabs the lock in read-mode, so we should be covered?
>
> Also, hugetlbfs_punch_hole()->remove_inode_hugepages() will try to grab t=
he mutex.
>
> The only fishy thing I see is hugetlbfs_zero_partial_page().
>
> But that is for old_page, and as I said, I thought main reason was to
> protect us against writes during the copy.
>
> > For 2) I am also not sure if we need need the pagecache folio locked; I
> > doubt it ... but this code is not the easiest to follow.
>
> I have been staring at that code and thinking about potential scenarios
> for a few days now, and I cannot convice myself that we need
> pagecache_folio's lock when pagecache_folio !=3D old_folio because as a
> matter of fact I cannot think of anything it protects us against.

Hi Oscar,

Have you thought about the UFFDIO_CONTINUE case (hugetlb_mfill_atomic_pte()=
)?

I'm slightly concerned that, if you aren't holding pagecache_folio's
lock, there might be issues where hugetlb_mfill_atomic_pte() proceeds
to map a hugetlb page that it is not supposed to. (For example, if the
fault handler does not generally hold pagecache_folio's lock,
hugetlb_mfill_atomic_pte() will see a page in the pagecache and map
it, even though it may not have been zeroed yet.)

I haven't had enough time to fully think through this case, but just
want to make sure it has been considered.

Thanks!

> I plan to rework this in a more sane way, or at least less offusctaed, an=
d then
> Galvin can fire his syzkaller to check whether we are good.
>
> --
> Oscar Salvador
> SUSE Labs
>
