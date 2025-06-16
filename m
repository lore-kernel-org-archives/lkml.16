Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB10D28F4;
	Mon, 16 Jun 2025 22:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750112191; cv=none; b=DxWiHFS/dkN+IPBcf4bniS4zK5mSq/X4JFTKsZwbjZbN5Lq6a9yhA0Z2hF4gxS4aCCUdI3RLWiwXa62njF1o+YAf7p5trwjs16lElWjwyzBPSOUX6q29RTFC+zGu2qxu43JvgR2AYUfFMARd1VEdRO2qtBOmVURSaZDzkyrKChw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750112191; c=relaxed/simple;
	bh=ziUc4Cazu8rPOj/A9CHLv5pVaJlPgsivV34HGY6F5Z8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WK0fbT723XGw9mubr6UmbuM3C4HUCJ2u7Wzi//+5PrGbDAzKsqLySmpNlmvY97Op+xQoxJxgUwTmLItni+HgA6W3LRT0B8vVT7koMTyZrbY63U+tzuyfkBcxfwHFpJGm7+m5QloouPI89x7FMpDmXtKmJjKXYKCr33lzutFAZ+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L8uQjmGf; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L8uQjmGf"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ad883afdf0cso992410866b.0;
        Mon, 16 Jun 2025 15:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750112188; x=1750716988; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4x/p8NEu399tKFp+L82OEsMeF0ul8epvOoGorBxox8=;
        b=L8uQjmGfW36/CAffJiKTertn5/RNjQuhETt6N1AwMxAI135qXifWUXZAnau+eKD59/
         2OZ0JeBbVVqLYoKMJjI2Pi6fcGnoqI7L3GXq3pdnURckfrpZzWBXJ5C2Y4wU5O5EBs8V
         5xsHbVbthz4uVPVs5+R5+aQn8J8xTkFY0V0oy5WYOCGzkcaP55LxZFFlBF8EtHtYZsX5
         Jpf23nDYFUsQYfIXrzWZsWsr5FArsEJuVhySlZQkB1mF51P1kUHe//sdpsja3wvKSf7M
         sb8MXIpOhyQNaLb3ChkCHnjcgU+IBQ4jcbViJJmxa9Eo0i6MOqCvmv3TC+iyQX7DVyML
         BZ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750112188; x=1750716988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L4x/p8NEu399tKFp+L82OEsMeF0ul8epvOoGorBxox8=;
        b=FZgVyELYVIb10JM5a/8DIKN+dllcvOj5sjdYhI8dMvAJnPrxwXaXbC0sVAiRR+9iud
         6rdroVJhqss0XjnE56VAR6XGoRq+WPtXWZfATXzVNSyZsd6ty2ihnKRu5bUB38Xq47rf
         Ty/faxVH2neXaeN0D4fbCcV1NBkHIjJYBRHKnoNAK3L/u89EtmtPqKVJcp6MRR9/6uLG
         hmE4te59l3AEe/sVfInsF5zVrysBLfS+2ZfRi8P7kBFEERdA7F8mJSa9Rn/6fVI6oDEX
         kXrwvzI6IzJFm9ny6bECC+ne78ai231rcvJx58/Yl6bUbxnl7evijWtWru7ZymJ/R7Eq
         IURQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlZemCyeAqfFmmc9V5g+OaPN0xuV0RXYJynbhCp8NPCzXshs0uQ6FiISa1MvXsbXQ8FksIRwFAEp7fmUie@vger.kernel.org, AJvYcCVKxgAWCVzqK1U+zCZyUveSpvdE8T6vXXG2w6MFdK8F0dMvONl1TZWgWOctW9gp/dlm43GrtZ06nJU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOg2xw2WBqwKhuveGQKijO8kTT0uW7mQH98/bTquGqH0aSQlnH
	3/T8xYLF/oTGVoIFestc9wc+Aj98Wxlrz7kGrc3stju/lVb3/SxOkxaPvegAIWFPsnj2FJRCGzc
	sTRnX0ztGoH+9CfNBQD5U0dDO4MsxVsI=
X-Gm-Gg: ASbGncsejH0zjht+PXdaxuifmp5oOVfIG+1DE3f14ixEhbeXupyowb+FItZsX/OcSBM
	zaVuHy7Ix3f7yeCEoeB1WgK3hHXf3lJZItK9uL3L5phsTEwpjoh0AZnY1Qg//7QYs6qDLf9MLlo
	AXHjq+4smFDszwJYFJlLac7KkXE4ab251NIPXPqOR6gEj4csLhWwGo7pPE18DgZN4MHr+BYowkk
	IA2qQ==
X-Google-Smtp-Source: AGHT+IHWhKGzFlw/YafR+gXhZspwtYe6gkGuL7wwEgT/ACXbIUqtoGIZWUoj26D8y8Znb1z69yrl5bOG+d7vxjTvsJ4=
X-Received: by 2002:a17:907:608b:b0:ade:3bec:ea29 with SMTP id
 a640c23a62f3a-adfad397276mr976447066b.25.1750112187830; Mon, 16 Jun 2025
 15:16:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612181330.31236-1-bijan311@gmail.com> <20250612181330.31236-2-bijan311@gmail.com>
 <5a50eeba-b26d-4913-8016-45278608a1ee@redhat.com> <CAMvvPS5U8exSvy0fknfhv8ym_dKgMVa7cfMOqn0fGyd+NSjSuQ@mail.gmail.com>
 <e40aa590-f0a2-4666-84b0-c33c8f4fef87@redhat.com> <CAMvvPS5bTUfAXy4g79tAq+1DWKX79b33Jt=UNBg-xR9BDa7FdA@mail.gmail.com>
 <aFBXuTtwhAV7BHeY@gourry-fedora-PF4VCD3F>
In-Reply-To: <aFBXuTtwhAV7BHeY@gourry-fedora-PF4VCD3F>
From: Bijan Tabatabai <bijan311@gmail.com>
Date: Mon, 16 Jun 2025 17:16:16 -0500
X-Gm-Features: AX0GCFtwj_QtqJXZ5jL7Wr8rfNEzrgEzB0jYXSU_0HLJ7kNaT0LSOgSWCHGca98
Message-ID: <CAMvvPS4aiyA7nXTN=QkMz4ikvf77ZaZ05ys-4N09AFLrgeS_Pw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] mm/mempolicy: Expose policy_nodemask() in include/linux/mempolicy.h
To: Gregory Price <gourry@gourry.net>
Cc: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sj@kernel.org, akpm@linux-foundation.org, 
	corbet@lwn.net, ziy@nvidia.com, matthew.brost@intel.com, 
	joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com, 
	ying.huang@linux.alibaba.com, apopple@nvidia.com, bijantabatab@micron.com, 
	venkataravis@micron.com, emirakhur@micron.com, ajayjoshi@micron.com, 
	vtavarespetr@micron.com, damon@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Gregory,

On Mon, Jun 16, 2025 at 12:43=E2=80=AFPM Gregory Price <gourry@gourry.net> =
wrote:
>
> On Mon, Jun 16, 2025 at 09:16:55AM -0500, Bijan Tabatabai wrote:
> > >
> > > Which, you also have during the rmap walk.
> >
> > There is another subtle dependency in get_vma_policy.
> > It first checks if a VMA policy exists, and if it doesn't, it uses the
> > task policy of the current task, which doesn't make sense when called
> > by a kdamond thread.
> >
> > However, I don't think this will change what seems to be our consensus
> > of adding a new helper function.
> >
>
> Hate to interject here, but this gets worse the further you dig in.  The
> mempolicy interface as a whole has many, many, many hidden references to
> current->mempolicy and current->mems_allowed.  External interface
> references to a task or vma mempolicy is a problem i explored somewhat
> extensively when I prototyped `set_mempolicy2()`. It did not go well.
>
> Generally, mempolicy is not well structured to allow external actors on
> a task's mempolicy.  Accessing a task's mempolicy requires operating in
> a task's context or at least taking a reference on that task's mempolicy
> (which requires taking the task_struct lock).

Good point, I didn't take the lock in the second patch. Also, this
made me realize I need to make sure there isn't a race condition where
a task exits after getting a pointer to its task_struct from
mm->owner.

> I will just say that mempolicy is *extremely* current-task centric - and
> very much allocation-time centric (i.e. the internal workings don't
> really want to consider migration all that much).  You'll probably find
> that this project requires rethinking mempolicy's external interfaces in
> general (which is sorely needed anyway).
>
> I think this path to modifying mempolicy to support DAMON is a bit
> ambitious for where mempolicy is at the moment. You may be better off
> duplicating the interleave-weight logic and making some helper functions
> to get the weight data, and then coming back around to generalize it
> later.

This may be true, but I think I will be able to avoid a lot of this
nastiness with what I need. I am going to try with the mempolicy
approach for the next revision, but if I get too much resistance, I
will probably switch to this approach.

Thanks,
Bijan
