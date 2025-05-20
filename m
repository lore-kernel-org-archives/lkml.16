Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F8617CA17
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 16:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747757128; cv=none; b=L+kK1uT5BQlPgiKOxp/1H1x5GrX8EmGUwUZhnLPJM/mlbD/ZPsRfoHH/tMy3+j1vGPzgX0jbdYltaq/L194IqSgTFecGR84kS5hOm+7H1aJL9cIdpafJPdw3jiL9A/zz9ID3IxW9c/Ybw3IyqC3xbi+2fwtMDcR93As43gG+MYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747757128; c=relaxed/simple;
	bh=0rfntWFazho4mK9F9eshENfRLYtOEx0ULfCoFJCPcTU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bC7qC8Wwbjy2NCFyHWvWBQDsTahS6ZTzz9W4LJ/9CjcGF6EfgELCJtLHTmzMVFFOL69tD/xnfsin0i7BbyUxOImcBmK8ADYAWR7TSScX9i8ZPe0GjSv3sBDn4Z6r0qIH5RRuyIOTGGtLEzReCaIjFxMVmshSoiDXzmoNeYUzaIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kqW2yWV3; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kqW2yWV3"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5fab85c582fso26384a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 09:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747757125; x=1748361925; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0rfntWFazho4mK9F9eshENfRLYtOEx0ULfCoFJCPcTU=;
        b=kqW2yWV3/des5oSs+TsccmywePxPMs85qL4X11mUSfxkOCeOUGQxSGaGZwAYPVLAEk
         enZCuOxKX9gHsBNqnxbho+ZK32XuDKYwk+hrqRlR7Ry0etACraWmY9bvR1P7Vb7TKO8B
         VvJHj7M+4K53hMreXlO8K7BHHcdeUzY2W2dejDnN2slM3CA6UQTKv9aa+KR5sI7xIKyE
         OjUE1yzf/j00KGeZaxdoqJ/Y93p5mdV+qzFzlPdV6HRTHn+HDD6F6tWxFGKigx9RCk0m
         zqJEXP2c0P4N+qlqGJJyjpIRQNQDQQEnyDlBCCjSfLH9ceibFMOFJPyBiT5Z+zcYMYUr
         PVbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747757125; x=1748361925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0rfntWFazho4mK9F9eshENfRLYtOEx0ULfCoFJCPcTU=;
        b=P13+uPgJMFwSb4xYBoX7tB8OhQvYxd2byOoRIjxTJgVbePPKS6OWhd9uzPnGgnZ4fF
         uIOmVCDNXT5RORGicMCT5JeRjR9Y8bI8BWqxIEgsXViaxzK2LZ2MeZqe4mtpRh74S6e7
         WGIvkCnAinrh2FCyamkG6y7hE8Q6+s+KevjN6OGUxlW07Eyd5oLYG4Ld1giszPc2b/6L
         lyEDIvYQhPl2FSagmti7d0wzqB90NH+wqA6Q6G1lTIEi4bpdsT9I44sJncucRcggz8ui
         wUa8+U1VBRAJd/D9LvVH6wDPOfmXP1CN6qMYquNuATXj6XYATdHxhUkPe+igDxETb+gS
         +05A==
X-Forwarded-Encrypted: i=1; AJvYcCV6av34pQz1JZa+L9JRurUAvD1bPGHF8e+Hw6f5iJ8IX5LoMdpPAw+hn2gsZMDfqv5lUxN8024gPT9F6gk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxrV3SDohqqUnm4xcR+Ob1xFuwDQP3gW92T7J8RJP6YobAsUYa
	c3M0/9fynbrrTwOt+kd57xjEDEGF1nVWoU2ubHxcDH3wty58p9JYnk6XWIYI3kQawKCgYTox+ez
	ep7AqwiK8yzLoc86Naa1d0E9848ZIQ9/LY/X4aAVn
X-Gm-Gg: ASbGnct8bNigAwcrU3mvvOEB4alR23PP8Sv/AF1xUHCuqMSCYdTq9SiZciSqONX48Ey
	AAkwHH/Vf0O0tQRmOq3rIsbluUCYbaqQJpN9yvfqfWqN4Kr/JRAJF6TtNQN3owIduhqky5NzI2h
	PV7yXIaW+SHC6rhvCAU6ZouDot40fcbXDcz+HbSDhM4+IzD6XfBBxyTJvotU4+8cFlOuC5pg==
X-Google-Smtp-Source: AGHT+IEOQ2vFE3jecYWUn3oKnGtTWjIT++RWO5aGS6gOAXZFLqR0bXLZnvv/yrhnUofHKsIUGByrvi7YUdoaE5rGLCU=
X-Received: by 2002:aa7:dd08:0:b0:600:9008:4a40 with SMTP id
 4fb4d7f45d1cf-6019c88648dmr301495a12.4.1747757124254; Tue, 20 May 2025
 09:05:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1747686021.git.lorenzo.stoakes@oracle.com>
 <CAG48ez3-7EnBVEjpdoW7z5K0hX41nLQN5Wb65Vg-1p8DdXRnjg@mail.gmail.com> <368b0ca0-605e-4d2b-b12e-c24b1734d1c2@lucifer.local>
In-Reply-To: <368b0ca0-605e-4d2b-b12e-c24b1734d1c2@lucifer.local>
From: Jann Horn <jannh@google.com>
Date: Tue, 20 May 2025 18:04:47 +0200
X-Gm-Features: AX0GCFsPdY0pLyAGHK-EG0PUc1QDFfH1ipfBEhtjta5dZf6rJFGtFMXyimrWtdo
Message-ID: <CAG48ez0RKgQwpE07tZ8WcfH5XCeZ26wVOZa26HdYjADzVbHbgw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] add process_madvise() flags to modify behaviour
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, linux-mm@kvack.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, SeongJae Park <sj@kernel.org>, 
	Usama Arif <usamaarif642@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 7:36=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
> On Mon, May 19, 2025 at 11:53:43PM +0200, Jann Horn wrote:
> > For comparison, personality flags are explicitly supposed to persist
> > across execve, but they can be dangerous (stuff like READ_IMPLIES_EXEC
> > and ADDR_NO_RANDOMIZE), so we have PER_CLEAR_ON_SETID which gets
> > cleared only if the execution is privileged. (Annoyingly, the
> > PER_CLEAR_ON_SETID handling is currently implemented separately for
> > each type of privileged execution we can have
> > [setuid/setgid/fscaps/selinux transition/apparmor transition/smack
> > transition], but I guess you could probably gate it on
> > bprm->secureexec instead...).
> >
> > It would be nice if you could either make this a property of the
> > mm_struct that does not persist across exec, or if that would break
> > your intended usecase, alternatively wipe it on privileged execution.
>
> The use case specifically requires persistence, unfortunately (we are sti=
ll
> determining whether this makes sense however - it is by no means a 'done
> deal' that we're accepting this as a thing).
>
> I suppose wiping on privileged execution could be achieved by storing a
> mask of these permitted flags and clearing that mask in mm->def_flags at
> this point?

Oh, I see, we're already inheriting VM_NOHUGEPAGE on execve through
mm->def_flags, with the bitmask VM_INIT_DEF_MASK controlling what is
inheritable? Hmmmm... I guess turning hugepages _off_ should be
fine...

Yeah I guess I'd do this by adding another bitmask
VM_INIT_DEF_MASK_SECUREEXEC or something like that, and then applying
that bitmask on setuid execution.
