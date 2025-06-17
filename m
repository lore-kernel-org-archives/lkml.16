Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E563E29344F;
	Tue, 17 Jun 2025 19:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750190094; cv=none; b=jDdbMono2xDaq83iOmojXPpltdZ/qy2iqPlydJswLDVJVjBYN7N+t7kxAfKEXlg0bugRZgi9+WUJKKLt48XhUAkip2wo1voPVJh3AszZPRVcO0/7DfPhfYbZfohdZelFrF0+vqKczUbVHsqywAS7CGP4Tp6ARR67CPg3r6sg6Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750190094; c=relaxed/simple;
	bh=Q6LN0h5d3N6f3RZyDg9qhMGAr0lG/K582gkDWgFgagM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SmIMJzpygXepKtl4yjhdfSbq3cWwZk0xJBgirfIO8fKWirKhtDy1Atd/byqxfUIbVr6DiuSw4Qyu9JsSnf4LIlX+5tS9jn+R6uq/m8INkJgkRNmGcqZw8daYJJbkOlSbMCSdpAVMIc/myqj4YY4zH9HD3nVlLpjaUwKNdGFEH6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nwha58p2; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nwha58p2"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6084dfb4cd5so75708a12.0;
        Tue, 17 Jun 2025 12:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750190091; x=1750794891; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z8X5Ja/e/pqiuPJdST6phpTFMTSJg44mlfySHdQTIHE=;
        b=Nwha58p245jD+N6kaS5tXI3Y7Am1D/pxdt7rYh1U3Gs7ZVvL/8JUAadXAcRFcD+2Ku
         jhSnWfQtbELwXV3MdtXTdiTMqWvO1732jOgopQCqwdW+V6y90mra5WvYGFm8gZHgjrlC
         0Et16f46ow5gRmzASMVHm/jQ/tH0wdi/VnIbheaJL791cSASMNZAPG2ycyKAe6EDAhr/
         ociFJmuN70/+s6pEo3w6aoku9nTP2muVclhyQofcqZSzIsNrPj2qkf060qFBbqSMfXai
         gALpU/EsHnN9c1jo+otFF2ovdQHyD4OYrAGffqTYMlqlcN+aTUaajiHLTcMyqWsPorFW
         4Mww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750190091; x=1750794891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z8X5Ja/e/pqiuPJdST6phpTFMTSJg44mlfySHdQTIHE=;
        b=EcYFSPjTkVQPL2SVCD64VewMe1BIKbcKQFYRDuM63tX4JhBPKN1YAqgLjqIyf1G4fy
         dsQ2A+pu+qeO7qWvgUXVDUuFlHM3t8Noy4Nz59P/xhQuk6jARDzGP0IIW9pnDcGXRjOp
         Zh3F07cI8VGWV/IIRoWLfh7wcXlB7WNjC0GD8a3KlGePuBbhW1Xu39dDAmQq6zb4Cl2M
         ++N7XoGhEnQjLY01D3flS0Qa7iOa1gT6mYhJeGIPA7/Xw7njai6j5eureQRaOp7Q1Slk
         8aJAKZk/5cEvKRX0Pa/ORHorSu2W4HQVPIw/42eECxbSA6fXOyQ/hkKKoepYFySBPzwW
         0WAA==
X-Forwarded-Encrypted: i=1; AJvYcCVLd4Gn9O5fpXxDC4WlDHnsba64U0u4Au3XvI1+OosPTd0XNUHdKuSlCKkNK5S9ecXzYdOsVf4sQOTNKFte@vger.kernel.org, AJvYcCWuT5Un0wz+RRhFPkwjf4xHkA6OxJ5c8i/FC9n9MbtqVl8mRcxuI1vkVIFxVhncVE2/L9Rl9FzsA9M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsDy02KV9IX8UZVAFYkdYCPoykv8BK6kMwrcl7VTVITdVGExsu
	MqvfEpTwmSzvY0oS3TvKFOyR3tjtvJ+cFyaopSdZe5rN4h35yqpQGg7GW4gIRioPAApzPJZiwiM
	UPEPhm6LCjQ2YJ65RD6vM/yzD50WYQN0=
X-Gm-Gg: ASbGncvaf+r4fc2Ftz+jrlhozfYI2FUxBdoxYOLPf/k7NSIh7jSVAyps8uaxcPQnmXd
	Hnz2FYcJhVpRncwgX8BMGnF7fkMvM8lyeVKkn294P5cnUEqk21ifzPbraZcyEvh1ERJBfEtVFhg
	mD9okKTiKjG0YwJR7NynnTlu39LDmMYl10p8P3CCjgKITqYVC3w6m1D63igVgFZSjyYeNy1fsQ+
	zPTeQ==
X-Google-Smtp-Source: AGHT+IE8e79lXnYS2MEWhgyzWvzB+JeRzaYD17D8Gyd7qKRDrq3kqUlcKtRYC/AYY3nnyTbqfzHmUGafLodcxJ+tGmA=
X-Received: by 2002:a17:907:97ca:b0:add:f68c:5200 with SMTP id
 a640c23a62f3a-adf9bfdc8fcmr1493396266b.6.1750190090999; Tue, 17 Jun 2025
 12:54:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMvvPS4aiyA7nXTN=QkMz4ikvf77ZaZ05ys-4N09AFLrgeS_Pw@mail.gmail.com>
 <20250617185834.58000-1-sj@kernel.org>
In-Reply-To: <20250617185834.58000-1-sj@kernel.org>
From: Bijan Tabatabai <bijan311@gmail.com>
Date: Tue, 17 Jun 2025 14:54:39 -0500
X-Gm-Features: AX0GCFsNgriV0sYFpbxGGJwvblVxYmQtu1tLr-OLt3N9F1vqCPvhgnz7IQ30TGI
Message-ID: <CAMvvPS7yQPoXxAecSi6B74a1Bgm1H06i+MqNDgdsZODEZSYFuw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] mm/mempolicy: Expose policy_nodemask() in include/linux/mempolicy.h
To: SeongJae Park <sj@kernel.org>
Cc: Gregory Price <gourry@gourry.net>, David Hildenbrand <david@redhat.com>, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, corbet@lwn.net, ziy@nvidia.com, 
	matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com, 
	byungchul@sk.com, ying.huang@linux.alibaba.com, apopple@nvidia.com, 
	bijantabatab@micron.com, venkataravis@micron.com, emirakhur@micron.com, 
	ajayjoshi@micron.com, vtavarespetr@micron.com, damon@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 1:58=E2=80=AFPM SeongJae Park <sj@kernel.org> wrote=
:
>
> On Mon, 16 Jun 2025 17:16:16 -0500 Bijan Tabatabai <bijan311@gmail.com> w=
rote:
>
> > Hi Gregory,
> >
> > On Mon, Jun 16, 2025 at 12:43=E2=80=AFPM Gregory Price <gourry@gourry.n=
et> wrote:
> > >
> > > On Mon, Jun 16, 2025 at 09:16:55AM -0500, Bijan Tabatabai wrote:
> [...]
> > > I will just say that mempolicy is *extremely* current-task centric - =
and
> > > very much allocation-time centric (i.e. the internal workings don't
> > > really want to consider migration all that much).  You'll probably fi=
nd
> > > that this project requires rethinking mempolicy's external interfaces=
 in
> > > general (which is sorely needed anyway).
> > >
> > > I think this path to modifying mempolicy to support DAMON is a bit
> > > ambitious for where mempolicy is at the moment. You may be better off
> > > duplicating the interleave-weight logic and making some helper functi=
ons
> > > to get the weight data, and then coming back around to generalize it
> > > later.
>
> Thank you for the nice clarification and opinion, Gregory.
>
> >
> > This may be true, but I think I will be able to avoid a lot of this
> > nastiness with what I need. I am going to try with the mempolicy
> > approach for the next revision, but if I get too much resistance, I
> > will probably switch to this approach.
>
> I have no strong opinion about use of mempolicy for now, as long as mempo=
licy
> folks are fine.
>
> Nonetheless, I just wanted to mention Gregory's suggestion also sounds fa=
irly
> good to me.  It would avoid unnecessary coupling of the concepts of
> allocation-time interleaving and after-allocation migration.  Also it fee=
ls
> even more aligned with a potential future extension of this project that =
we
> discussed[1]: letting users set multiple target nodes for
> DAMOS_MIGRATE_{HOT,COLD} with arbitrary weights.
>
> [1] https://lore.kernel.org/20250613171237.44776-1-sj@kernel.org

Given this discussion, as well as Joshua's comments earlier [1], it
sounds like while people aren't exactly opposed to using mempolicy for
this, the building consensus is that it would be best not to. I will
move the interleave logic to DAMON for the next revision. However, I
still think it makes sense to use the global weights (probably via
get_il_weight) for now to avoid allocating pages a certain way and
then migrating them soon after.

I'll try to send the next version of the patch set by the end of the week.

Thanks everyone for their feedback,
Bijan

[1] https://lore.kernel.org/linux-mm/20250613152517.225529-1-joshua.hahnjy@=
gmail.com/
[...]
