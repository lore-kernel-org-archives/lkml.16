Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EEF235058
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 21:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746049494; cv=none; b=dtMwSRgN9hU09YvQdm2F/m3r8R3Bvd9u2KA1wJEFoM1UARiPp5VJaNNg/+ODOPMb/XuqcS1CJeZcGZSdreXQPcYD4DInsgEAvTR9D8jKRQElnGpxSWiy4dBpKNfan7uaqFt4QDpYEhwZuKsHbdkFr1Co5slpTa9Uw0gu+pAUPxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746049494; c=relaxed/simple;
	bh=q4h9txxyVkNdC6jvewm0aNetCP9eOddzybErf3K9z8I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sdJU8Dnu/DLFY+QBPlzVaL6DDjhqJC29jZrEUIcyHnxCO8z7pk12RHzAOTp0JgFdEXu484yBhEUvYjP+Tp35gGLyv7SHyNjBvjsz3GIOIxUmHBGPMvbUvBbxF0sjzpmUonYOwIyrn3SuswAt2xF3apby5D1Ede0p0iPnnWHzTfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UC3w/M3i; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UC3w/M3i"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5f632bada3bso1050a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 14:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746049491; x=1746654291; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q4h9txxyVkNdC6jvewm0aNetCP9eOddzybErf3K9z8I=;
        b=UC3w/M3itmy+QyrLNFj98ZzxR/WzXrfHaLwmix5e106T0Fx/u/h2J1Y6DwMlk3f63Y
         xdzFZQ76dkNE/9XoJR9kQqrorOe1rtv46K41/aosyizexZhS7cGuzxroRTNtvLrh2Hz+
         TIwDUv1xbatyA6nYhl6Mng9sNtEtYEWV5/Z2rkiS2+Tnxi+i3/THuvdxBGXGXAVj7wDL
         F+obEzSH0dFumwpaYam5zo1Iqe7xECVxtGmW+zYebeyqc8jJP777FEc/gMiqhfyyuBzC
         JCqN/p1Q/KigbCGlH9wUO0vSvdKglxe+ewwxneaMm7pGX7SSV3xP+PCajBlhC3rOpX3r
         L2ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746049491; x=1746654291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q4h9txxyVkNdC6jvewm0aNetCP9eOddzybErf3K9z8I=;
        b=E4F4dbl6VYYvDWOPRT7wobXYgPBanmrcWlhB1Sv8a4yP+UQXmO7KequUMr6W8//k1C
         PVaxvQw/yU6XhuG1Ho+TgAXP+FzxBOobUNckqjeth4fwUyc+qBiN4XQOqgbC98wrOD/O
         V4EZmRRoEYP7l6wu48H3utnTX0JxTMbiUssrRp832WlXQVi2/vq2Yfq733suuXC0K6XM
         veMo+Dcvq8foTClcT1MheTALpoFQDtrWjmWeQxzu+5yRaOIJA0FdjWZE8+JxXh8pbB0z
         rPMIQTx/wCygI47ARL/mPBUPKsTHvO6EGk+6dYRtyT9LG9A617h8slvPcNypTCCOqQ9s
         3OcA==
X-Forwarded-Encrypted: i=1; AJvYcCUKV/5wPNuspvLz+KVflOxOowAKybBZBBj+TDKkdyCNWJJ3mn7wXMUdIzSPz6Z3589AtXUD/XcGFgNA5no=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRbfuVqnicF/GM7rYM7nan4HcisOG78Byv7b1/cy2J4Z5eB4EI
	W3W8z7DTwHuypiUUkvxxPuJT2jYl52UGehbIZaK9eI5yZwNqg15btxZXd2R2+9G8NIsgILh0sll
	ALznBpk0ownZClIXnmZEX6Tml0ON1kUz8q6qu
X-Gm-Gg: ASbGnctqGrhOgOADtTSTK1RGdJPuAkXnWMrs0pbEL40fd5BCRaSUqBxzNsg/3J4NTdN
	Ar6JCGq3cAaVV6h3takAnFVri+yxPzJTjzwnkJ+3/2JAEFNdUQXIhUh6ius/wml+P3YyY3TfFrQ
	wTWTHjhiEvr05f6YLIQ2m3OIvm7OpM0lUBK0kGXxXvR5gorG3O7Es=
X-Google-Smtp-Source: AGHT+IHa+YOIrnKiFDXDrrt4yu+9fdIONVUCemFPAqVKkKRm3U9fwx/l3LrvAFu7aPljtxYzM7ACp9bkPJ/XkR4pYL0=
X-Received: by 2002:a50:d556:0:b0:5e6:15d3:ffe7 with SMTP id
 4fb4d7f45d1cf-5f918c2a177mr8356a12.7.1746049491126; Wed, 30 Apr 2025 14:44:51
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1746040540.git.lorenzo.stoakes@oracle.com> <f1bf4b452cc10281ef831c5e38ce16f09923f8c5.1746040540.git.lorenzo.stoakes@oracle.com>
In-Reply-To: <f1bf4b452cc10281ef831c5e38ce16f09923f8c5.1746040540.git.lorenzo.stoakes@oracle.com>
From: Jann Horn <jannh@google.com>
Date: Wed, 30 Apr 2025 23:44:15 +0200
X-Gm-Features: ATxdqUHF1o6EwfzKPJMttuEXJySFho1Hj_S7BrlihxHfp-SM2NszLl-GiZD1uH0
Message-ID: <CAG48ez04yOEVx1ekzOChARDDBZzAKwet8PEoPM4Ln3_rk91AzQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] mm: introduce new .mmap_proto() f_op callback
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Pedro Falcato <pfalcato@suse.de>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 9:54=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
> Provide a means by which drivers can specify which fields of those
> permitted to be changed should be altered to prior to mmap()'ing a
> range (which may either result from a merge or from mapping an entirely n=
ew
> VMA).
>
> Doing so is substantially safer than the existing .mmap() calback which
> provides unrestricted access to the part-constructed VMA and permits
> drivers and file systems to do 'creative' things which makes it hard to
> reason about the state of the VMA after the function returns.
>
> The existing .mmap() callback's freedom has caused a great deal of issues=
,
> especially in error handling, as unwinding the mmap() state has proven to
> be non-trivial and caused significant issues in the past, for instance
> those addressed in commit 5de195060b2e ("mm: resolve faulty mmap_region()
> error path behaviour").
>
> It also necessitates a second attempt at merge once the .mmap() callback
> has completed, which has caused issues in the past, is awkward, adds
> overhead and is difficult to reason about.
>
> The .mmap_proto() callback eliminates this requirement, as we can update
> fields prior to even attempting the first merge. It is safer, as we heavi=
ly
> restrict what can actually be modified, and being invoked very early in t=
he
> mmap() process, error handling can be performed safely with very little
> unwinding of state required.

I wonder if this requires adjustments to the existing users of
call_mmap() that use call_mmap() for forwarding mmap operations to
some kind of backing file. In particular fuse_passthrough_mmap(),
which I think can operate on fairly arbitrary user-supplied backing
files (for context, I think fuse_backing_open() allows root to just
provide an fd to be used as backing file).

I guess the easiest approach would be to add bailouts to those if an
->mmap_proto handler exists for now, and revisit this if we ever want
to use ->mmap_proto for more normal types of files?
