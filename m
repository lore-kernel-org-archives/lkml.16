Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E67227BA4
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 14:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748876186; cv=none; b=g91poQWg1G+niSsFj+wyfGixFQG8aS23a/j3q+/rvQCTcKbjEhCXTizNY12jVpIC1RThI15AnzAZz3dkgJX4lTOXgruvFzv2cjV4mvx+wmywUrvRSP1Mjq3xuvL05iJIJ7H2TR/zJbNvRqD12lTy4GYptcuXJBXv00GEPOvvjQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748876186; c=relaxed/simple;
	bh=o3GVNCy1IvSNRk1KHzjX2Q14BU/Xa3tgEobLjN7s8/M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fmj7V+vy9PA8dfMVaWVXI4O6VJ1aH6UQSx3AYQHf+MNVldo8sIKtuEtBsMbWqWSFn2RKdDNgTT2wVIH/1gRw61Y5aTyGBGVH64X8oEfbrQ6wXyS6nzGEvxEE6GUYyyvtcGDioQ9TDAmZuvoNvnkcQ1TlYpqBPKkMUZqqB/gkwrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3010zrvg; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3010zrvg"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6024087086dso14544a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 07:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748876183; x=1749480983; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pNF511MgaFtsD48A90MDbHZtD9Ll5lctEsJk06IOH/4=;
        b=3010zrvgAHGBdCmhhR0lFbZF9Ucb8/WbaxHC/MogbNVC4fgjZILg+OMunbTLTnHuTK
         1tSHfUEffSu9QXQ+5YLCvXOKcuxfeMwonyK22RU6qtfb9oluHhU/EB2ClkjGK+0PHsk1
         K2oOcSgRENRoqbYJ53JE7pHeUhUlQ9PGxUOuFUGMa/0TI26qTSoarjgTxy3H0uDNQlXj
         pxLRdc1k8Xq5GLeDCvz399/v7M9kSKpIiumv0x6A5zVrI0FIKuzpK4KWps/P6Fqcq61y
         Lah7Ohx+FiGKEqEhf4NPp6JQZQW89QAw5vvft9VhmarIMHFt0nRjh/S2mpWgebr1Kg7P
         DNDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748876183; x=1749480983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pNF511MgaFtsD48A90MDbHZtD9Ll5lctEsJk06IOH/4=;
        b=iAaiPzyWWpQUmXMZTBZQQzr+ZBk14j7LfjsjgjausYBnZzGn+oosvTuOjlYGfAf+6d
         M1vmDib3B4vGIQPSsbpxrMn3Awvo9pppLlZnaB4iKGGuLo+rX+jJ6NVXPkOn1Q/67bOW
         bn3rqqZbLri047g6bYbMrMMb+eS8++6OACFEU/urvGSgprzz6eF3uMm00JbggwRL5Q5c
         B54O97L6RO+Q/b6YJLGTMzW1+qPy9K48NOyu2TwbPCUVlvX6eUG7Sj1PKEpa+/TWMQht
         ruhLq9JTxnDVR3qCcFaUBcA+SSFVC9qQBjMCYtoB02RjmS0Qs0hzZaNUtY9E/O/YAg2/
         z36A==
X-Forwarded-Encrypted: i=1; AJvYcCV3AvILS2RBya7/0E0VOUhx3174FrW8HlJT6w5BSDc075tql91Tzk9ueJ80JypUwomwSZ15mi0TlpAwB4s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZEE1IgNF4fnwlGGJnpRrMjYg/U1WJRGC0clsDhG4rIrJWJFyy
	6OgQo+oGPL9SRc1zMysq+Jzwqao2hzAHBX8dvqznVge7t42Jje9MbcjfeV3mqZG7I3Fqi87Sltl
	5AvBmrjvvJJYzUIQWzfLPi9dhG3K2i+Wa9jxyubdT
X-Gm-Gg: ASbGncvPpXJz4PtZtBxAlbda89KoWIGmm3W3KuDr18fszQjuuhB96F9CGekqGF5/tXO
	RQ4WsRDudt+BT9FvQFKnm2LU6K4cWKDTwhscoGhVOcCWZlQFlX7tkt2tDpoxYQh6C3/0nAN+c+E
	yem//Zqyc5TaZdpOxP9HJlB27lERCIibfDW8Nj+Lbmc0EOqVun7/cAcYhNQJQD0ru2kDOsHLUWV
	NWrYFAS3EM=
X-Google-Smtp-Source: AGHT+IGQtc3WBIVJZRLnX8hZQzlRbDDYAStKVAzE1RREAckOOqW5UwtvA2umiVPi5uY6NCwFxiD63Zy+fl33mDpdslk=
X-Received: by 2002:a50:baa3:0:b0:602:3bf:ce71 with SMTP id
 4fb4d7f45d1cf-605b3d6f8e3mr115449a12.3.1748876182849; Mon, 02 Jun 2025
 07:56:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530104439.64841-1-21cnbao@gmail.com> <CAG48ez11zi-1jicHUZtLhyoNPGGVB+ROeAJCUw48bsjk4bbEkA@mail.gmail.com>
 <CAGsJ_4zMcptS5iJGOn+17KSMpM4NcS9F_PW0jMicK6UC7cAbKw@mail.gmail.com>
In-Reply-To: <CAGsJ_4zMcptS5iJGOn+17KSMpM4NcS9F_PW0jMicK6UC7cAbKw@mail.gmail.com>
From: Jann Horn <jannh@google.com>
Date: Mon, 2 Jun 2025 16:55:46 +0200
X-Gm-Features: AX0GCFs5qpWJTcbQ9fFL1U98ltPX_aaeb9EoUWAY5hf-6w2pnymfyPDVvrasKGg
Message-ID: <CAG48ez1ZKEkHHx5muofnc=wTsfCpj__3wMROCR4Wy8-GEF_Ogg@mail.gmail.com>
Subject: Re: [PATCH RFC v2] mm: use per_vma lock for MADV_DONTNEED
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Suren Baghdasaryan <surenb@google.com>, Lokesh Gidra <lokeshgidra@google.com>, 
	Tangquan Zheng <zhengtangquan@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 31, 2025 at 12:00=E2=80=AFAM Barry Song <21cnbao@gmail.com> wro=
te:
> On Fri, May 30, 2025 at 10:07=E2=80=AFPM Jann Horn <jannh@google.com> wro=
te:
> > On Fri, May 30, 2025 at 12:44=E2=80=AFPM Barry Song <21cnbao@gmail.com>=
 wrote:
> > > @@ -1714,19 +1770,24 @@ static int madvise_do_behavior(struct mm_stru=
ct *mm,
> > >                 unsigned long start, size_t len_in,
> > >                 struct madvise_behavior *madv_behavior)
> > >  {
> > > +       struct vm_area_struct *vma =3D madv_behavior->vma;
> > >         int behavior =3D madv_behavior->behavior;
> > > +
> > >         struct blk_plug plug;
> > >         unsigned long end;
> > >         int error;
> > >
> > >         if (is_memory_failure(behavior))
> > >                 return madvise_inject_error(behavior, start, start + =
len_in);
> > > -       start =3D untagged_addr_remote(mm, start);
> > > +       start =3D untagged_addr(start);
> >
> > Why is this okay? I see that X86's untagged_addr_remote() asserts that
> > the mmap lock is held, which is no longer the case here with your
> > patch, but untagged_addr() seems wrong here, since we can be operating
> > on another process. I think especially on X86 with 5-level paging and
> > LAM, there can probably be cases where address bits are used for part
> > of the virtual address in one task while they need to be masked off in
> > another task?
> >
> > I wonder if you'll have to refactor X86 and Risc-V first to make this
> > work... ideally by making sure that their address tagging state
> > updates are atomic and untagged_area_remote() works locklessly.
>
> If possible, can we try to avoid this at least for this stage? We all
> agree that
> a per-VMA lock for DONTNEED is long overdue. The main goal of the patch
> is to drop the mmap_lock for high-frequency madvise operations like
> MADV_DONTNEED and potentially MADV_FREE. For these two cases, it's highly
> unlikely that one process would be managing the memory of another. In v2,
> we're modifying common code, which is why we ended up here.
>
> We could consider doing:
>
> if (current->mm =3D=3D mm)
>        untagged_addr(start);
> else
>        untagged_addr_remote(mm, start);

Ah, in other words, basically make it so that for now we don't use VMA
locking on remote processes, and then we can have two different paths
here for "local operation" and "MM-locked operation"? That's not very
pretty but from a correctness perspective I'm fine with that.
