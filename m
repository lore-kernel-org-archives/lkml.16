Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D0F24DD17
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 23:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751499308; cv=none; b=EiHPIOBLRIQdNUtuJDRs6zHeDigQxq54KPjBaDTnO40PTIpAMWDkuOicSJdzYvswth2x7jL5rf2qr5hU8tgufDC/gMet7xzQRCxBPv+iGreA6fwUh8scKcXHL5Te7rkp0ZPkPRb0y0t0CS+3s/EeZZGnZ/xz0ziYF6QHTjmxtK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751499308; c=relaxed/simple;
	bh=SzcU1BefXolwPtl6hk3y94qGFk6Pjp56UmaXQfdZrus=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h83BVVy8OYFfZ+2ycmt4GgiFONMoOPbHSBRcXDp+EJ8QlvQMJK+Jzd2LTEKSO1OE4sckXqX1+0D+Mo79HBwqaIl4llN78/rjokvQ+MuBLRM2c2VaR4ITQlmAFzJDjfVZrd3mPWIwrTqATJeSWZn9RaPFRubuxYONPiFFZ7/lusA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OUuS0hnq; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OUuS0hnq"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4a7f5abac0aso125161cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 16:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751499306; x=1752104106; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SzcU1BefXolwPtl6hk3y94qGFk6Pjp56UmaXQfdZrus=;
        b=OUuS0hnqOqSAnrTeHPrrMgMyJ+hEC6VSC3/xYBA8SC1jE8Cr6aW4x5HyMjslYp2aMM
         Pr89AP2Kv4RgeBO4BYfgoEi29ULUTcL3f9Y1wktkfICyOb4F1e1qBKm/GlmM7yYaRu5Z
         ZntYDJOVMUE78aJEuLmJS1zIY4gKnoe4UfKE/11qh8d+/NK+Aqt+praJomVMegoK4FTX
         hV96ScxiN2T8tyuZ0kJY+6tQZqCPg85yU63S+VEn2hOX4epFwxJQs9aCwiYvceQE7Suk
         gkuvr1o1qJavBJhr+U+EJRQz1BsbHoWmtn+SMMm6pkhV5A3guXvMnNWgIQFtQ2E1yQow
         54bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751499306; x=1752104106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzcU1BefXolwPtl6hk3y94qGFk6Pjp56UmaXQfdZrus=;
        b=KGIh+F6TrrSDOiqUB7f3j8Iz24vVdzwZOaSBBZirzMAMq/whvOEQ7N6YFt6B8xVCbR
         NJ3z6mDphxxyszp12YiJqJ6Wk5oeF7yf6S8Jfy2tvs5UcnPQ2If12R+WrwuAFTxOAgIB
         EX8Sq6rIPlNRBLSPSc1YHvoygSa7BKHdd1Gs6bfXwpmekCQDKBSsqKIy5dpXboVY1v0N
         zv0UgI+6bevZYqwRIHAmVGJ1NSYG+KAIjIJMc9H8O/8zNCJFm7hUYQ+6EHbK7kSiSFgg
         9m4XNCw/kvVUzRj4vZnvFhlQ2S/eqJl82g3LtC2cVlazyYXDJUoZHeX55PqkynqS7FDH
         Emvw==
X-Forwarded-Encrypted: i=1; AJvYcCWKC9/KHgJiV1kRrfiUwpW7hhVDdlxzD1YI+3E1HKJKelElaJaO96Z5o245/637czAyAnG507yMyAY7HSY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJgRHUkQN5QIYYsZu4YTIP9a7SAIgjEGCnUPsssck9/FmUD4R1
	p7hFEjTDokern0xwWPmrkxcDC2qZ4ZOJl1nOTnro/OagEVrLOMv8l5SRie2hk4bzOR4iVPzM+BM
	yAWw9hi/p04d+86Ght5hxI3UV10s0Ky4YBDJlY30D
X-Gm-Gg: ASbGncs0K/DLngupbOdM2VP7XaOMh1q54VkEClOIVU31VjoWJf+S+i69wTSNFl87hHP
	dBWeeBsPQm3u4/557WOz4F83hgcTZj4/pw9NLXa6pK634PvDBim+WZem7TUmWtkurlqjjwjsJAO
	/jpScWV6W54L0MDVN6iTijsT0V/mAtKMReohZGxNVrhA==
X-Google-Smtp-Source: AGHT+IE+pvmmQXeFqFnjV36LTJQzyb6MlNASF5M+F0CNAZwfrwHDLnHbPVy8ZBpLeaQqfaN4yBrAZ4+xBRjvksUHB4U=
X-Received: by 2002:a05:622a:8c08:b0:494:763e:d971 with SMTP id
 d75a77b69052e-4a9892f94a1mr592961cf.23.1751499305558; Wed, 02 Jul 2025
 16:35:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702135332.291866-1-aha310510@gmail.com> <693725d9-a293-414f-a706-f77446e335b1@redhat.com>
In-Reply-To: <693725d9-a293-414f-a706-f77446e335b1@redhat.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 2 Jul 2025 16:34:54 -0700
X-Gm-Features: Ac12FXyCX48sJLZ6HGfeqR7g-W-FoMcwsa7qijn8e7Qr_FJWzSr1cDAxkz98prw
Message-ID: <CAJuCfpHrJGrYcfchz93t53gQjhu4nCrcBYK44LTG1DxWywu5Vw@mail.gmail.com>
Subject: Re: [PATCH next] mm/maps: move kmalloc() call location in
 do_procmap_query() out of RCU critical section
To: David Hildenbrand <david@redhat.com>
Cc: Jeongjun Park <aha310510@gmail.com>, akpm@linux-foundation.org, andrii@kernel.org, 
	osalvador@suse.de, Liam.Howlett@oracle.com, christophe.leroy@csgroup.eu, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	syzbot+6246a83e7bd9f8a3e239@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 7:44=E2=80=AFAM David Hildenbrand <david@redhat.com>=
 wrote:
>
> On 02.07.25 15:53, Jeongjun Park wrote:
> > In do_procmap_query(), we are allocating name_buf as much as name_buf_s=
z
> > with kmalloc().
> >
> > However, due to the previous commit eff061546ca5
> > ("mm/maps: execute PROCMAP_QUERY ioctl under per-vma locks"),
> > the location of kmalloc() is located inside the RCU critical section.
> >
> > This causes might_sleep_if() to be called inside the RCU critical secti=
on,
> > so we need to move the call location of kmalloc() outside the RCU criti=
cal
> > section to prevent this.
> >
> > Reported-by: syzbot+6246a83e7bd9f8a3e239@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=3D6246a83e7bd9f8a3e239
> > Fixes: eff061546ca5 ("mm/maps: execute PROCMAP_QUERY ioctl under per-vm=
a locks")
>
> That commit is not upstream yet (and the commit id is not stable), so it
> should be squashed into the problematic commit.
>
> As a side note: the patch subject of this and the original patch should
> start with "fs/proc/task_mmu", not "mm/maps".

Thanks for the fix Jeongjun and thanks for the note David.
I'm preparing the next version of my patchset and there is a much
simpler fix for this issue which I'll implement there. Planning to
post it tomorrow.
Thanks,
Suren.

>
> --
> Cheers,
>
> David / dhildenb
>
