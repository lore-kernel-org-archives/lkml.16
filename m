Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFB6F9EC
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 12:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749214566; cv=none; b=lsoj/t4BREAARJv7s431+r7UCLw0mQ3EuSWsXZDA44o7jlNQ/ny2QXntx7ZOwqX1B4sCPaqP+SUUZjAlqGm7wtVdUBiyyzAWRT1bmgUUNeUPaBI88FTCNRk2cfMk37+yaS+w6vdtjhUKW7sitX3twe2t1vvQt3ajgQcfeVjKhM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749214566; c=relaxed/simple;
	bh=pyP4voBTnGow5cseeEAeEmJxNYO/WBjrdKku1W4VhIE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F6H+Z7w25b23IgTq+Xtr2tKj9zUtfSg7SdlWX6DwyMw9Ts41BVv7/plnk+KEIeAmmxKqivk82xi7SbxtN0FybtBrkyVOGUfDuYLi4aKWSbJtSaJLGtGzt25NaflcEi63X209PxJy0plrgvzUvzvaQZ2POT/mNWfwL2b7Vfa6jg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uBFbsyo4; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uBFbsyo4"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5f438523d6fso8595a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 05:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749214561; x=1749819361; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lej/JzmO0Dw1V/XOb+M60AVoOmPPuLiZ67cVi04ciIo=;
        b=uBFbsyo4SkLBrAKLUmvzR34JtdqTWUnPPAzOILSYG9PupdcRaLlRR1c20f/GeS3vtu
         C9tQgaeTLgKSWtL/v/yTjo2P4Ll4p9cc2A8YCSkW4ZL67RntHfZlMp3P72vy0vo9DZad
         JlNETEPiBUdgZ61Ip/DDT9cGMlNBraDcgHbb4mBhK/MGdCifR2Ow4PebsehI9l87XapG
         JzWza0J/yxV33ob9S2cun7Ux407OSytqlFY1Tn80JhXTcEWPzdmXo63LA/yMgBwZu3+X
         8v8t7gYstMSJpWb3VvHhmRMbjUJ33dMF1lICdlDADiADxMOGMcNqfWXTaPo+GVk73J7w
         Z+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749214561; x=1749819361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lej/JzmO0Dw1V/XOb+M60AVoOmPPuLiZ67cVi04ciIo=;
        b=DYUR+/65YnMRfNpN9gN2Ro5dl+A0EizruhkfgMnp04czY459biYS+r9fHTx38mpqrv
         ZN6bdS8QApJGSqa7VjODnQ+fGV/BQLlOBCiPX8thWt/KRQGedGCPFar1exji+oNz3rL2
         w0QzWIEn53CughZSw3bGbIkavXyciJioTdtHFTbog5szmYmAoK2LeiGYhqN4mvX/PBOm
         SIQeLcCTOhYpgSCF2b86spzAIB0AAUPfTAJ37KpaYEqKDixn0Ac1HKjhGI5ooCC7/qDj
         H2MSUkAfqwHlPsAEY0qQTmHpF7bZe+xTTbExd+MF63S5Fnvux7WJssKsvH7UQkr29DAa
         bBNg==
X-Forwarded-Encrypted: i=1; AJvYcCV9Lx7AbfJs4gnkwXnhZXPBp3E33Vaja3JQGB0kADJ02FVGRFh926q/HGa/iLXlOtnd3XxqYYhhfpOicSY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBaCSkMhqWUcnekAs01zskfncH/l5UkhCIncreBlOkHxcMutvD
	TLTaFRlxIBlP0oB6wLWLCVZ3r5RGhJpxtw/LVwrM+2XyMaxK+YDCSD/eEZRvmVGsqG0HckhGnoU
	ugujZiWu2J10FoqLIpN0HzyEusGs6d5KoesEIYkYG
X-Gm-Gg: ASbGncvkStP77FYL9nNLjRARkoX7EdRTeJPa/rWV06btLUOLCfWqqQHBsry5YSbccNJ
	zUurm2d8q/m5QqFyNbK9VVOrKAgxLr57LUEd4+6T1YPrWjPdPCxcHhcDC8WEoBmZaq8NoPCmNrO
	AGT8ho8dnTrTwoI+PdtF0cjR2rGbzQDB4bcQQJNoNjeslI9V6zhgRdSHqzpt2eUarJMV/Zlw==
X-Google-Smtp-Source: AGHT+IHXwcAquv0lb5IUM1aVYSbEaPQ46aM0vazICMyj+IzmQp//DMyCXsrGOLh2XTNX6ibsNYUExUiUldgyqMaL0gE=
X-Received: by 2002:aa7:c346:0:b0:607:1323:9c2c with SMTP id
 4fb4d7f45d1cf-607793de3b1mr62222a12.7.1749214561141; Fri, 06 Jun 2025
 05:56:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603-fork-tearing-v1-0-a7f64b7cfc96@google.com>
 <20250603-fork-tearing-v1-1-a7f64b7cfc96@google.com> <ba208d76-7992-4c70-be8f-49082001f194@suse.cz>
In-Reply-To: <ba208d76-7992-4c70-be8f-49082001f194@suse.cz>
From: Jann Horn <jannh@google.com>
Date: Fri, 6 Jun 2025 14:55:25 +0200
X-Gm-Features: AX0GCFtRkqF2Lt6u6n6mq4FlDl2aj4mZ-IS4O5MGhg5wVl65bWzoxagLke2Bp80
Message-ID: <CAG48ez1R7v-L-L33nJUXtj_Y=SKyyFcU8amLs0dQ6ecuC3xMWA@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm/memory: ensure fork child sees coherent memory snapshot
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	linux-mm@kvack.org, Pedro Falcato <pfalcato@suse.de>, Peter Xu <peterx@redhat.com>, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 9:33=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> wro=
te:
> On 6/3/25 20:21, Jann Horn wrote:
> > When fork() encounters possibly-pinned pages, those pages are immediate=
ly
> > copied instead of just marking PTEs to make CoW happen later. If the pa=
rent
> > is multithreaded, this can cause the child to see memory contents that =
are
> > inconsistent in multiple ways:
> >
> > 1. We are copying the contents of a page with a memcpy() while userspac=
e
> >    may be writing to it. This can cause the resulting data in the child=
 to
> >    be inconsistent.
> > 2. After we've copied this page, future writes to other pages may
> >    continue to be visible to the child while future writes to this page=
 are
> >    no longer visible to the child.
> >
> > This means the child could theoretically see incoherent states where
> > allocator freelists point to objects that are actually in use or stuff =
like
> > that. A mitigating factor is that, unless userspace already has a deadl=
ock
> > bug, userspace can pretty much only observe such issues when fancy lock=
less
> > data structures are used (because if another thread was in the middle o=
f
> > mutating data during fork() and the post-fork child tried to take the m=
utex
> > protecting that data, it might wait forever).
> >
> > On top of that, this issue is only observable when pages are either
> > DMA-pinned or appear false-positive-DMA-pinned due to a page having >=
=3D1024
> > references and the parent process having used DMA-pinning at least once
> > before.
>
> Seems the changelog seems to be missing the part describing what it's doi=
ng
> to fix the issue? Some details are not immediately obvious (the writing
> threads become blocked in page fault) as the conversation has shown.

I tried to document this in patch 2/2, where I wrote this (though I
guess I should maybe make it more verbose and not just say "subsequent
writes are delayed until mmap_write_unlock()"):

+ *  - Before mmap_write_unlock(), a TLB flush ensures that parent threads =
can't
+ *    write to copy-on-write pages anymore.
+ *  - Before dup_mmap() copies page contents (which happens rarely), the
+ *    parent's PTE for the page is made read-only and a TLB flush is issue=
d, so
+ *    subsequent writes are delayed until mmap_write_unlock().

But I guess this way makes it hard to review patch 1/2 individually.
Should I just squash the two patches together, and then write in the
commit message "see the comment blocks I'm adding for the fix
approach"? Or is there value in repeating the explanation in the
commit message?

> > Fixes: 70e806e4e645 ("mm: Do early cow for pinned pages during fork() f=
or ptes")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Jann Horn <jannh@google.com>
>
> Given how the fix seems to be localized to the already rare slowpath and
> doesn't require us to pessimize every trivial fork(), it seems reasonable=
 to
> me even if don't have a concrete example of a sane code in the wild that'=
s
> broken by the current behavior, so:
>
> Acked-by: Vlastimil Babka <vbabka@suse.cz>

Thanks!
