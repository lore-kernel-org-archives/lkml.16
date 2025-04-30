Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47012270EB8
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 21:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746048626; cv=none; b=J1ci9SUG9ho9dxY91Hen8FJqwFgRnDKjTh2E+0A+WI6104V+u2GF1dut7HLCThjj7orVzaY8gFzPYdVDEHCr+F63LAjAoJkch+TOzbad0avK/+EHnkDSkMzBBxK+tZD1ZFo37NQRpNXA07UBKWSWw0nGZyf92TsgY7YSClwaSIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746048626; c=relaxed/simple;
	bh=5CjcEDdUNisdYTC682ZR/akMXUXBiC2pK72vAthCoDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aV+6mydkjt2wQGB3trMDt+0q6Ab9vzALVlzuB6QI1fp62YiKw1F6aiP/siawlrX5zXOOJX1ql7P2pW0bpKvDEojxQqn6Ro7NIpLH/oxdUPq8dG0QmMOdovcINjRXA2v/gpa0HGEYlzJ0cIoWwvozwLGMe19eoH7HDoKQN+FWLr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MHfV39OS; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MHfV39OS"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5f632bada3bso911a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 14:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746048623; x=1746653423; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5CjcEDdUNisdYTC682ZR/akMXUXBiC2pK72vAthCoDc=;
        b=MHfV39OSU69giSeBLqB2iB9KQQMfphzttb5gGwv/ENW+m4RnMUoRL+a0xwmwna2DGr
         4ukW2lxYflh92ubpDOI/7Cq/nWLlqBEJxnXAurQJr6Dz5UFy97FvcTml5t/U/qfry3tQ
         9UdalvjtMVT1/g+QC68sMfdY9yorzLAngMTZnzVEa0YmDu+MWq+LAZaXfYMCXQi1JHnj
         7MQAMO/S22gSo8JP86K0JKiBbc7CbuN37k9OxXYXXTYNp7rRFaFIzFDIAbmjf22tRBju
         cRmQKdaPmqU5xr9xwxEFH8KJRs5ZrJrqAIKRPGkgr1dC7tnMzs1hAUZ2otX1NrhfLqsS
         uFSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746048623; x=1746653423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5CjcEDdUNisdYTC682ZR/akMXUXBiC2pK72vAthCoDc=;
        b=VTDtIeXNc2xBK37bcRfrvHayLaHgILJozKubyl2ytTCmfi928uNUpZEBzN2kb8w7Wl
         aOEhXas5rSnXWndZG2wkMB9nb61LOqihnqLpTgJSjJKWeae/WVlESNJ3guWZF3bV7osc
         GODAPGfnghnzC09qhpR0F4avX6VzhDHo+IvULfGJjuN8eoS3eOJDF2E54+Wem0jKnRia
         6k4fhGkx7vx72nSs8jx1AyMjCqe+8gJ4ohYseYaloetmTDpB08aLmCKkDkxeFOg2H6v1
         EMM8Bp4loTkv4OZ8NJnYVOj0Q6O2K/Pe3cbJ26l7Xoejp+RUIRgW4EY81/cahR2Zw3Tz
         J2nQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/FJWmVGc2jQvw7/svmjDYR7imJK8Sk9nnd+62UsARuSBqdrwwGD+JsvuLgfE6bj90xf8BnBiv8CCWQ8o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNg2dF3JWbwzLtEcfUkbqP+B/ivvqA4GN/6w+LOhty+VmyL2A7
	RK15aWHBUZJKHuSGknX8BzBRDVu6SpmD11mQPvDv4kii/sHU7goaiuzfvr4Fpv62fKeKozLw4y4
	SScPaL0KCQAGCP1ngjxZLdMqzbrEYm8ihx38k
X-Gm-Gg: ASbGnctOEJUuYM/TJDPL5CJnqj4U468PhxOm0YigVaaFdGcg7UzW9zBhN/wve43zCoU
	T0GL0ZyEwmXyvEVykhSDeLJkvP0/HBuI6up0Of3I6Dcld4dyM8ZD4tW9bVqK2QvOXzFOFQCt+ft
	aeEBwMjdeMyTeCQHs/npT8qaxfo4W261I3+Yc7a6enI0MjdliUd1U=
X-Google-Smtp-Source: AGHT+IGDMMmX4eA2v6ulzCpeHnUuea9wQ5svOGFjkGvBWCiP8rCQm1GlFwWDt1zkKtNVQSBWCW/5nQN3fWwXJdYqdrY=
X-Received: by 2002:aa7:dd04:0:b0:5e5:7c1:43bd with SMTP id
 4fb4d7f45d1cf-5f918c081b3mr6342a12.1.1746048623266; Wed, 30 Apr 2025 14:30:23
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1746040540.git.lorenzo.stoakes@oracle.com>
In-Reply-To: <cover.1746040540.git.lorenzo.stoakes@oracle.com>
From: Jann Horn <jannh@google.com>
Date: Wed, 30 Apr 2025 23:29:46 +0200
X-Gm-Features: ATxdqUHQ2RqenZm9cv6clle4zPp-U0u0sqdqaHqJJXCLMmXCWvll4M0PNqaIFOM
Message-ID: <CAG48ez25mXEgWSLZipUO2d7iX-ZjF630pMCgD95D9OuKGX1MfQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] eliminate mmap() retry merge, add .mmap_proto hook
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Pedro Falcato <pfalcato@suse.de>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 9:59=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
> A driver can specify either .mmap_proto(), .mmap() or both. This provides
> maximum flexibility.

Just to check I understand the intent correctly: The idea here is that
.mmap_proto() is, at least for now, only for drivers who want to
trigger merging, right? If a driver doesn't need merging, the normal
.mmap() handler can still do all the things it was able to do before
(like changing the ->vm_file pointer through vma_set_file(), or
changing VMA flags in allowed ways)?
