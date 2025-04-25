Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910AD28F510
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 15:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745595957; cv=none; b=rELZ583OVtHqJvgMSkskmJa9ILRJr7rVClzNMZekd8s0QyOBJrn5WIkWrz3MLnYtJtQhDqK4KkmX8TKQZ/wMhmORwoXM6T1tNgtF81mX/6ZpxM21kJ8x2iqIHn9No5adTx+C4xEXQqsniW/H6vjvNI8TtNyP74Bkndt+l661bMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745595957; c=relaxed/simple;
	bh=B5QShZ5g94mLZaD+u4ii3VST5+W/j+1H/ig8Qpc0vbM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a//Oevv/Pgyh+xw4cZXRfMotzIBJUSOCe/huSnTObw4h33bCE5Qz7tPNrmPHLH6YS//qbC6tBJwWUxZATwrzB1EJCNWeD8/0CmkOEaUeZqrtmiSwGG6NarEDM4L+FWfKVH0GvwwnGgPUOpVDGEEZSA5RiT5BRqOaEdMYXcBg4BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yWcaYjNO; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yWcaYjNO"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e7040987879so2372784276.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 08:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745595954; x=1746200754; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UcVXa79p/StEb9QjjiKNIb9MucE2Oi4X5Dp4SmHc44s=;
        b=yWcaYjNO6iF1d87oOjFAnASVfXeG8meW3B5YTVi/gj98DPGCyeaP5NSkRaBA0nFElG
         APluLb20T750WAugTE7ye6xlZP6lyuHqnocpMhFbCmY7lzLyyZpKLoRdPnoo5dvam/Xc
         8BOewMisUNkQy4ORK/w8i7LLMxSwYPlVYSXUvA/pYc35xrb5eZ2h9GiasYpeAiamhEBj
         9j+l3TI7aJJzejvKYnefo5r2ULNqCiEGrNvtV22O70d42km2A4d36CDZSIEdqfbqZIcc
         /8Jptkp8+e9uedF/YQkfk8JRvFUtJi7TvgFLY2P0qcJ/a55GlF9H2kq+/OxH1Z7B1yZX
         8F3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745595954; x=1746200754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UcVXa79p/StEb9QjjiKNIb9MucE2Oi4X5Dp4SmHc44s=;
        b=XE6zYr6eD86f90VplY0Usesn4de9FZxlKHoqcnK9fs2yZsGwj2JdFXg2ypD4SNj/hF
         rOVvvc+ZaogNw5wOa1BXHmJLbQHPWVSEOJ89+zcdpgB8mCBNXFCwlU125iEGBl/Whsmk
         3HJWotaXrNdKTiGJIF2zffboPJrWxnGTSnWySUZbvsguX1s3bGuXGGRspofwssRrZQ8/
         aCwHpvKyLGQpZp64lfOjtVBBIjfTZaOTU5qdlXWzOuYICKAgiEBNVe36yObOy9teY8cg
         Hx3myTDtnhYoa4q0+eNng7JZFvygMENdcFuL1jn5asMv8+9AMqh6h7dpVNMF1Y+BzkEu
         KIcA==
X-Gm-Message-State: AOJu0YwnzkMlqTzqYX5DTDKCLrRtQ/qJpycS4Gtv9dqDsb9blVilOWj0
	xHKZlhJ/8P//xngIbEUpm9VC3WkYuyQwchyblgZ6iK/jXOxCt/wtzHq0b3i22tu5UO/hxORb1R3
	ZYdxCnLS3k5pfLR34lAVq1pI48MmyYGpsRlML
X-Gm-Gg: ASbGncu+huDBp5npbEeMp6tAOUtoIcRXk7ao9PPB7OLOBsvOXDbQxztOf6vVOQxCX02
	eaNkAa8VzdTzFzr2LxeXrVv+541nMClzsi7ICbrOo1aeePTK/dTsVazZ0vHptoinU0UNNjjdsVB
	v5WOtGQxdOh4apHoEfVS5OSsYod7yNJuG6Ps3fedbhgLmBFr4SoWWaDqg3
X-Google-Smtp-Source: AGHT+IGiFCE5HRHaIs4HQySIeYeaYqYZIhLZDeaQNAZvWV/mDvPqNvHZgZEOyOL6Xzk9926d8I7P4aHPW7KbhD0oyxQ=
X-Received: by 2002:a05:6902:158f:b0:e65:91f3:fbdd with SMTP id
 3f1490d57ef6-e73165dfe37mr3907829276.22.1745595952069; Fri, 25 Apr 2025
 08:45:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424215729.194656-1-peterx@redhat.com>
In-Reply-To: <20250424215729.194656-1-peterx@redhat.com>
From: James Houghton <jthoughton@google.com>
Date: Fri, 25 Apr 2025 11:45:15 -0400
X-Gm-Features: ATxdqUHU5hoqlwTzQ_qmlUIKG4ZDnT7wrpJniV6HzDlaRGxn2KpZxvWOB3QSl6A
Message-ID: <CADrL8HXuZkX0CP6apHLw0A0Ax4b4a+-=XEt0dH5mAKiN7hBv3w@mail.gmail.com>
Subject: Re: [PATCH 0/2] mm/userfaultfd: Fix uninitialized output field for
 -EAGAIN race
To: Peter Xu <peterx@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@redhat.com>, 
	Suren Baghdasaryan <surenb@google.com>, Axel Rasmussen <axelrasmussen@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 5:57=E2=80=AFPM Peter Xu <peterx@redhat.com> wrote:
>
> When discussing some userfaultfd issues with Andrea, Andrea pointed out a=
n
> ABI issue with userfaultfd that existed for years.  Luckily the issue
> should only be a very corner case one, and the fix (even if changing the
> kernel ABI) should only be in the good way, IOW there should have no risk
> breaking any userapp but only fixing.

FWIW, my userspace basically looks like this:

struct uffdio_continue uffdio_continue;
int64_t target_len =3D /* whatever */;
int64_t bytes_mapped =3D 0;
int ioctl_ret;
do {
  uffdio_continue.range =3D /* whatever */;
  uffdio_continue.mapped =3D 0;
  ioctl_ret =3D ioctl(uffd, UFFDIO_CONTINUE, &uffdio_continue);
  if (uffdio_continue.mapped < 0) { break; }
  bytes_mapped +=3D uffdio_continue.mapped;
} while (bytes_mapped < target_len && errno =3D=3D EAGAIN);

I think your patch would indeed break this. (Perhaps I shouldn't be
reading from `mapped` without first checking that errno =3D=3D EAGAIN.)

Well, that's what I would say, except in practice I never actually hit
the mmap_changing case while invoking UFFDIO_CONTINUE. :)
