Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3703F27FD56
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 15:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745596525; cv=none; b=LnsCCHs8NtMk7HkhR0sKG8wRsAVmSGqHijwMSDXWGPhrOW022Xfo2sabbkikU8nDLGP7kMtJP0lOBn8U/qtJrzt9GZQGBppUcmNzqNla+i+M/tjOy3M/F+6EhMyhjQl9K6NE132bMhkSAU8Jkw2CAAg02t9gI3MGE1KRLucar+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745596525; c=relaxed/simple;
	bh=REBewESRhO5brBc73z95Fwvmxb9PPMtwXKGCNOrnbSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SkM7m/as3ApcNwWzpzVit2C0DSsqBl3eVtJSjJDj4B2CZXz0EjqOY+ixL9kiqO0fv0jic/koL07xadszgKVvgYAHa4GrVR5YZyO++BbPnhl179qq73QFsb+nFPijb0jI8LvYvb01MQqIl7H2cfgFPL0GWXoww9Nqw5vl4VQYFEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F6o+Ikp/; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F6o+Ikp/"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e461015fbd4so2235858276.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 08:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745596523; x=1746201323; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=equNRy2Ut79NJN2sDP6xqBGeq0YSptRz7fSGMn5os4g=;
        b=F6o+Ikp/10bRij3TEFV5shVqmwbUDGA3cHgNmDbzScsFEc+aVrFuOZMOTjEvg5a48K
         jkgkzFSlkNFLZPXjF4B3j5YqfmJjzE6c23Uo5WgBW7Q6mRWf256CYtDVITmec0R0hNGS
         wv4WYV5tT0iioT8XBycoGh6hxCbrlIbrmWhq6jwPtxBlwygjzOLA+tHRSGQScQnCY14m
         ouLmud/vAiFIydGc7ixYtWTTj8b3JXStewpAg5ZG+QwaDJR80CgjG6Ffi9onchTyo5nV
         BnkAUrUzQPNqwHFFNUm3GWQ8ntWS3NaA+NbymBjapPuOTBxlnCxe7dBKbGe+yQ2MgiiS
         7zRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745596523; x=1746201323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=equNRy2Ut79NJN2sDP6xqBGeq0YSptRz7fSGMn5os4g=;
        b=S4BFYUbSJqiBHVZ+o6pCAq5LmmVu74Mw2lBoGACdtk+xuWqo/+hq0jtTVICD51jZq5
         RkyUKh6PxlfOX7j9LpTzJa5X2WTiVLhJBMFyRbDnWSR2YV9b6LtWcqxWFRomWq9b/xMn
         9/gMF+7nzSSCvII51LcB3+vGN62XAjWQHQbcyMoS5uXECyBMyGH9NnYvIfj1yTZjf299
         UtVaw3yyM4l3qgWMaFEXIrc+pIrJrSeQt6NfwO8RnhdzyzBksS6CJXPOA5IxfgjTubu1
         g5MdnmWf6latIvLD/5Waj6iipedOfZ/W4af5VmmYnqFcoLb1owBzKok4oUKZhpburASe
         R2TA==
X-Forwarded-Encrypted: i=1; AJvYcCWmHdULiVYLFVg7TJjiuWIeOYynpuBlSsdeQmi7v7vdVMkdpqQGVuPDPCKvP29irLBA2cUoV/Fv1cX5ZV8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4gWF7W2BICt+Yy8o/BfNMAmYFUXF1SYQIuww2q2nz2Cl4FavH
	mU0Qx2nTdIyWtdxVwwgpXS5IpVIi2PuMRWjbTYluKGCfd9EgnwdbJlD+nB5Q8ob9JL5iMXxrfAA
	qIue3Got1VJoL3cmP5ybi6tE67f2/h5LUZfrqYMjS0E91TtiCYQ==
X-Gm-Gg: ASbGncsZe47tFYdXpCdRQkS7/2ENhyruVC4HXaDid9NYz+SLbT770VOWq1xh1c3hnWe
	CYx4TiohP+9IlzCWIc+9Qtx8bUxAMjtDvgJ/Xu8aQuEk5z3TutG0ECE61xQKnYtEBVRnAu8UA02
	uxsyVw+Ea1nsT3Co3S6QmkoNIDpC3wp8fD3pyDml+ehbEZmM9owDpPtA7XzBhSPojjjRw=
X-Google-Smtp-Source: AGHT+IFbSWFLOzO0de+Qmq+o8sPNVbjGnv8OZRwULddVfXenpCOwJ+oWDAqKSNBbQKWyy3jfg7lS46FR84wKLdfsvy8=
X-Received: by 2002:a05:6902:1ac3:b0:e70:a69b:8c64 with SMTP id
 3f1490d57ef6-e73168d2ee6mr3698647276.37.1745596522988; Fri, 25 Apr 2025
 08:55:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424215729.194656-1-peterx@redhat.com> <20250424215729.194656-2-peterx@redhat.com>
 <23e2d207-58ac-49d3-b93e-4105a0624f9d@redhat.com>
In-Reply-To: <23e2d207-58ac-49d3-b93e-4105a0624f9d@redhat.com>
From: James Houghton <jthoughton@google.com>
Date: Fri, 25 Apr 2025 11:54:47 -0400
X-Gm-Features: ATxdqUGMo1N6HL1wdN1Fca0HJC6TdmBNw41BQzP939UVRxX0ow9CTuSFoGXA_uo
Message-ID: <CADrL8HVhMhG6_nSwLfVr4g8XpjA9xh+maLPrC1=jv+L6LNxxkA@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm/userfaultfd: Fix uninitialized output field for
 -EAGAIN race
To: David Hildenbrand <david@redhat.com>
Cc: Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Axel Rasmussen <axelrasmussen@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-stable <stable@vger.kernel.org>, Andrea Arcangeli <aarcange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 11:12=E2=80=AFAM David Hildenbrand <david@redhat.co=
m> wrote:
>
> On 24.04.25 23:57, Peter Xu wrote:
> > While discussing some userfaultfd relevant issues recently, Andrea noti=
ced
> > a potential ABI breakage with -EAGAIN on almost all userfaultfd ioctl()=
s.
>
> I guess we talk about e.g., "man UFFDIO_COPY" documentation:
>
> "The copy field is used by the kernel to return the number of bytes that
> was actually copied,  or an  error  (a  negated errno-style value).  The
> copy field is output-only; it is not read by the UFFDIO_COPY operation."
>
> I assume -EINVAL/-ESRCH/-EFAULT are excluded from that rule, because
> there is no sense in user-space trying again on these errors either way.
> Well, there are cases where we would store -EFAULT, when we receive it
> from mfill_atomic_copy().
>
> So if we store -EAGAIN to copy.copy it says "we didn't copy anything".
> (probably just storing 0 would have been better, but I am sure there was
> a reason to indicate negative errors in addition to returning an error)

IMHO, it makes more sense to store 0 than -EAGAIN (at least it will
mean that my userspace[1] won't break).

Userspace will need to know from where to restart the ioctl, and if we
put -EAGAIN in `mapped`/`copy`/etc., userspace will need to know that
-EAGAIN actually means 0 anyway.

[1]: https://lore.kernel.org/linux-mm/CADrL8HXuZkX0CP6apHLw0A0Ax4b4a+-=3DXE=
t0dH5mAKiN7hBv3w@mail.gmail.com/
