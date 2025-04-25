Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA251A0B0E
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 16:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745597904; cv=none; b=jUwSBOfjf15X64Vrdi3M9oqnXhlNjEoFt4D8k04fbmyUDwjwe8lnG0yI39giacaLZSLn6+w0zij69st1ZtYD3bVLT/cPoIu6n/NghmzqB9A+5cTPq0NX0Rq2lGOv605VxUK39NsrxNkLlCAdz9F8r2NEmQPUvDhYljo0JfzC4Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745597904; c=relaxed/simple;
	bh=Nm2akZaIe8xG3/z8g6ddWt75x8LZZwq+llujZPN+xlU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uja1E6Cwvunz8v0sEuDSd3mr6FBTLnkLXQS9ZY1ibTyCBoOAHGEChqlbXfEXy/Apo6U1dJ8dPPhbtNT2u12TQPvVPdHo6EBbOy/b/WtVHpPQsbiiVdsKWSE95y4a959KMxVIN1X6VqhCKqJgM1okZnTI5cRhiR+r61ywLjVpOlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QDk439lc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QDk439lc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745597901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cu53oqTc+C8gda1ySOFmpg10bk110VGp4bnnOvH2U+U=;
	b=QDk439lcfadCdDY2Mp28wkNtf3KII3IkUYpNargEaLljRfF0HGx1xkoDraKcpUxc3liZ0U
	lBbRriToH/qTvfV9zPEsND4OXXQOeaTcju1gERK9MJN0MZtIREVpxM5y7THspCl4sn0fK/
	HfgiqtdWHguesiOTVcFbcmJcN+sH5E8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-mqfI0yXbMVGrnDEKLSotwg-1; Fri, 25 Apr 2025 12:18:19 -0400
X-MC-Unique: mqfI0yXbMVGrnDEKLSotwg-1
X-Mimecast-MFC-AGG-ID: mqfI0yXbMVGrnDEKLSotwg_1745597899
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c54a6b0c70so241471885a.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:18:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745597899; x=1746202699;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cu53oqTc+C8gda1ySOFmpg10bk110VGp4bnnOvH2U+U=;
        b=uKTp8HLG1XVnBKGAeulWcfsIOZ19x4I1dx3N2Zv3TAGTbWgI019gACfi9gAbH24SYZ
         NrO6zfjWlMYxXgmsKH3X7Kvod7js57WO2Re4YCXw027GMTf3TP3e/sUJPdL7jnmOJ70O
         RRuVxs6dDvixhSTFxqWY9ABbbuzBOE9DhbVxEdHrLl9dyUl5+kcaof6FbLHIAkU9fJgv
         7zMG/s9eiJsvcGBquOQcNb3y5KrU/90xP3MLIsoR9CekOjifnCEuBELD3Gk3xpbAnCn2
         ef0W4fP8swQfd51J0GRiClx1U+qOz5L7s5Pjx10efAKgId704IrP0RHr9dgTozHjIUPP
         STJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdGSOLAPLBVM4EYf6DKXGYkPiKgzcWZrPjS4IMDaLV7nDIQonoBU0dNS7MUoX0wD6MMbPI9g0GQC5q9CI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9H9+2RHaMHDW4mzh9RP5oEvpE4pkWYCROHFOCJzVyU/+b6Bo0
	OyTLrj8OJH3DgW3r3Qjb9nLIXkaWELeeMDmh4XnDlT7zytpSH7XHIaJBCg0x3/pDVqNcOjFSXy9
	FNGTscT7E5FhgLENzPdO6iRH1GRWaiFxeYeKrzlyxAVO0cVOipVk+u2DgMgjHdA==
X-Gm-Gg: ASbGncuT2IyUa3wbF33oCTD5jWY5vsGKxsU85h+D5VHNnMA+q6aGftz3mmIUZeAE7vl
	iB+dcGS3zt222zkdaBi6mXsT7ZarFNCEZnQAxI5kAJAIF+ztm5onDbbVdERbFn+WtxcyI64MtpG
	OCyiJw2YLmAzaZ7gSDFEDx9wQwXxoOItyf6Jydw1nIn8rDII2D9XmV+L1Ah+MJ0kpGayy7HfiQN
	nDsmAsuwfrH5gcVWOLKElWciLJR4yoaIHl2ERiSMrNkGv34cTfiRSfxSGXJNxPGqRtDIOXoV39A
	T1o=
X-Received: by 2002:a05:620a:4391:b0:7c5:49ee:86aa with SMTP id af79cd13be357-7c9606a46cbmr537421185a.4.1745597899428;
        Fri, 25 Apr 2025 09:18:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrLdFny2R1FgEH3lIqliuXD907AsPxqmNeiniGwqA0CvEOnR4ynP+sN+5f9GAHtx4ns0D9Cg==
X-Received: by 2002:a05:620a:4391:b0:7c5:49ee:86aa with SMTP id af79cd13be357-7c9606a46cbmr537417285a.4.1745597899096;
        Fri, 25 Apr 2025 09:18:19 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958cbe596sm235356885a.45.2025.04.25.09.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 09:18:18 -0700 (PDT)
Date: Fri, 25 Apr 2025 12:18:14 -0400
From: Peter Xu <peterx@redhat.com>
To: James Houghton <jthoughton@google.com>
Cc: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 0/2] mm/userfaultfd: Fix uninitialized output field for
 -EAGAIN race
Message-ID: <aAu1xnKPVCTqX0G7@x1.local>
References: <20250424215729.194656-1-peterx@redhat.com>
 <CADrL8HXuZkX0CP6apHLw0A0Ax4b4a+-=XEt0dH5mAKiN7hBv3w@mail.gmail.com>
 <dfc6db2d-0af2-44c2-8582-7e783b0292ab@redhat.com>
 <CADrL8HW--e8GVe+6aW7ZvDEBBDHp3cBC9Tcs_6duOJ5H+ZWNpQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADrL8HW--e8GVe+6aW7ZvDEBBDHp3cBC9Tcs_6duOJ5H+ZWNpQ@mail.gmail.com>

On Fri, Apr 25, 2025 at 12:07:31PM -0400, James Houghton wrote:
> On Fri, Apr 25, 2025 at 11:58 AM David Hildenbrand <david@redhat.com> wrote:
> >
> > On 25.04.25 17:45, James Houghton wrote:
> > > On Thu, Apr 24, 2025 at 5:57 PM Peter Xu <peterx@redhat.com> wrote:
> > >>
> > >> When discussing some userfaultfd issues with Andrea, Andrea pointed out an
> > >> ABI issue with userfaultfd that existed for years.  Luckily the issue
> > >> should only be a very corner case one, and the fix (even if changing the
> > >> kernel ABI) should only be in the good way, IOW there should have no risk
> > >> breaking any userapp but only fixing.
> > >
> > > FWIW, my userspace basically looks like this:
> > >
> > > struct uffdio_continue uffdio_continue;
> > > int64_t target_len = /* whatever */;
> > > int64_t bytes_mapped = 0;
> > > int ioctl_ret;
> > > do {
> > >    uffdio_continue.range = /* whatever */;
> > >    uffdio_continue.mapped = 0;
> > >    ioctl_ret = ioctl(uffd, UFFDIO_CONTINUE, &uffdio_continue);
> > >    if (uffdio_continue.mapped < 0) { break; }
> > >    bytes_mapped += uffdio_continue.mapped;
> > > } while (bytes_mapped < target_len && errno == EAGAIN);
> > >
> > > I think your patch would indeed break this. (Perhaps I shouldn't be
> > > reading from `mapped` without first checking that errno == EAGAIN.)
> > >
> > > Well, that's what I would say, except in practice I never actually hit
> > > the mmap_changing case while invoking UFFDIO_CONTINUE. :)
> >
> > Hm, but what if mfill_atomic_continue() would already return -EAGAIN
> > when checking mmap_changing etc?
> >
> > Wouldn't code already run into an issue there?
> 
> Ah, thanks David. You're right, my code is already broken! :(
> 
> So given that we already have a case where -EAGAIN is put in the
> output field, I change my mind, let's keep putting -EAGAIN in the
> output field, and I'll go fix my code.

Thanks both for the comments.

AFAIU it shouldn't affect any app that doesn't use UFFD_FEATURE_EVENT_* as
mentioned in cover letter.  But I tend to agree a fix is good, that any app
should better check ioctl retval and errno, before anything else..

-- 
Peter Xu

