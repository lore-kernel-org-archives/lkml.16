Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E777E18DF65
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 15:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738770782; cv=none; b=Asa3bydXHJTYjSbO3HAjBLARo0zXrc/UjDi9R0CjP4dkxLKjeGf9wiKWUhKodDHR0zrOL3GKsRXQl8xTdN2RVjoF4PA2hK0Roli7jfKEWjlCNyxffQVoKPVW/1LnhTTq6vKJ31qeg2G67WhOcHUTLmHrLn7L/bjx1RotJ7jDYOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738770782; c=relaxed/simple;
	bh=WwkDQlSS3PqEcDOpHv9ZXQ4V1ptus1Zs9esB1JNKEfk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=pEOj5cyzqXnMJNpwozVO6kg0Ukv52vOQqhTYGv4yZmukBtKlzGeRloZVHjboEzwtnna5FiKLwa9o28ssxHBis4A9jNeYLObPuxJ/ssmLiYeqa1ow2jlHcSEU3U2Y8cgDIfA9gtYXybtVKewNujmgSnwAJS9w7pIgGYdkFmbhBP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JC4mLmuJ; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JC4mLmuJ"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5dcd33d9d9dso14920a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 07:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738770779; x=1739375579; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ni37c9VCydBbsTue8mMCRqONQFErlkn5c5FwbYtM/w=;
        b=JC4mLmuJZDDxYNT2bxl0ItS5T80EF1fsvc06x3FGtxACOi65a9Da48r+XbxBGs0haj
         Iox6zd3P0ecdS06Pqdr8uGa0SSlfF9cCWdqD/zSOnUdnuAGJlB0b8xlPU/ybXfpzNCYv
         tWt8Yy2HyHwzsHY/xdR+tH6caIVIqWRRZcl6YY0z2+1p2Ng4lX/j5widyw5FiJiiBY88
         sxZVI7EuEBybVaSPP9wMcKqau5MC5IJ1IXDafB+f//i9fL0gk7Jggz3PvtnZN3Tf8c9Z
         KTU3rjP0lKlCVOyDysHBGRnJb68KP1XLuFRP06HE6IwwVAr/lcFmNwDTmhYbhtfxN3j/
         7lFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738770779; x=1739375579;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ni37c9VCydBbsTue8mMCRqONQFErlkn5c5FwbYtM/w=;
        b=aRBjDjWg1zqHtNE4OgqajA5e7i0dRjtHplSE0zKzKzWbIDreZOLq8SSh+Z1aBfjtQ6
         kPLtFZcZ/bbKhd4AcZZ8Du6Y/jwluS23fiYJ/niwYMA1h+3oujiqYs76hThjFmYUOIDv
         V4YMsqIsLXVnMrPKijX9VdXGfDuWCDNOxejw6c3oWcya8yexGpulvcNdiHW4LQk/4nTO
         WKKLVl4qCfYikN3c/Abr6xZ/8nfZ8zk/RezXb2P+cR+wNjUsUkNQiVZ62DtvNnenw4B2
         lPstfjdDm7CtaYjqrjMFTzrmu6LLvSX07xg5Pq6SRAU6qFP57OJgolZ8XC2EmO4Zi5f+
         ogaw==
X-Forwarded-Encrypted: i=1; AJvYcCWnIcjjQPXGH746ZvNGdmdUL9t3kqADaxMNqvpqSaExK5E4gJ2J8IH3vgZeQ/k1hVOZJ2+MJsn7g8mrRJc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQEAsCtR0qQ57ULOjQRXI3vMXGgm6fAU9irkvQRBD5Tlo3cQVW
	aIyU8OubuRbf6W+hvLIPoK+k7aSnHliBaHn19+TiU5kgP2ZJbIyCaIYPT3y9mgITvz+2A9S5+eR
	TKxagLQFDTrBVyoAopKDfaWfeAH901E8WB1be
X-Gm-Gg: ASbGncu1JUhGlDwRH19UgMJeVys5gD15G1mQ9MPwHP8lBxvGjv4CcILgHY6LwwMHP2T
	sBBvLaTbzPKf4AL4AuiuXbp6PIoV45pK1iVbQAFtNwsGD3mZj7EhbJk8EkN1O+i1VbLNMR5nWsP
	3/zi4v7VNFEBYJfALWYzHh04BjFA==
X-Google-Smtp-Source: AGHT+IEVgAszXrJgSxs63CF50aVj+v7j5eqevOroqtjRssM/r5fJ/hHv7UX9sW+SGFs/o4p76YssjQ0RSjGlXuOMK5o=
X-Received: by 2002:aa7:ccd9:0:b0:5dc:d9b1:ebdf with SMTP id
 4fb4d7f45d1cf-5dcd9b1ed7amr142837a12.2.1738770778850; Wed, 05 Feb 2025
 07:52:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <67a34e60.050a0220.50516.0040.GAE@google.com> <CAG48ez3KKEYRU+-Mkk+tq1Onv3QWg0jP6fEKYjNjRS+ziP5dAQ@mail.gmail.com>
 <tuqu4yuub5mj627dobasbiy4hbtkuvrk5gyqqf5zynli2t7xod@jxxjoworr7tp>
In-Reply-To: <tuqu4yuub5mj627dobasbiy4hbtkuvrk5gyqqf5zynli2t7xod@jxxjoworr7tp>
From: Jann Horn <jannh@google.com>
Date: Wed, 5 Feb 2025 16:52:22 +0100
X-Gm-Features: AWEUYZkf6Fw2ZkJcQNQk5DoH6vHa4QrRPSFrSdeb8aY2JcB1AG1nqNni6EoJxII
Message-ID: <CAG48ez0raDom84xznCGkmtJ+afz74zzgdhUSMZD41QJPCBkP4g@mail.gmail.com>
Subject: Re: [syzbot] [mm?] KCSAN: data-race in mprotect_fixup / try_to_migrate_one
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Jann Horn <jannh@google.com>, 
	syzbot <syzbot+c2e5712cbb14c95d4847@syzkaller.appspotmail.com>, 
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	lorenzo.stoakes@oracle.com, syzkaller-bugs@googlegroups.com, vbabka@suse.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2025 at 4:47=E2=80=AFPM Liam R. Howlett <Liam.Howlett@oracle=
.com> wrote:
> * Jann Horn <jannh@google.com> [250205 10:00]:
> > The comments in the VMA flags code incorrectly assume that no
> > concurrency is possible here; and I think the comment in
> > mprotect_fixup() about protection by the mmap_lock has also been kinda
> > wrong since the beginning of git history.
> >
> > The VM_LOCKED check in the migration code was added by Hugh in commit
> > b74355078b655, but that's just one example syzbot stumbled over; we
> > have similar racy vm_flags reads through the rmap on other paths like:
> >
> > unmap_mapping_range_tree -> unmap_mapping_range_vma ->
> > zap_page_range_single -> unmap_single_vma -> unmap_page_range -> ...
> > -> zap_pte_range -> zap_present_ptes -> vm_normal_page
>
> I think we need a list of vm_area_struct parts that are OK to access
> without the read/write/vma lock.  It seems flags is not one of those as
> it could be racy.

We do have this big table in these nice docs that Lorenzo spent quite
some effort on:
https://kernel.org/doc/html/latest/mm/process_addrs.html#vma-fields

Though that does not currently call out this possible concurrency of vm_fla=
gs.
