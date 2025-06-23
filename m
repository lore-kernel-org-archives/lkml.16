Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9951719C558
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750688851; cv=none; b=XJvqK2mGSdQe7pt47lGL8rEu81KNxcr1IsAs22+KKKQwr8wcfJKfcE+L4j0khx4I52R5NllXuG3zAhGmA+5yDPIwG5brBqZusejnt7ZEEe6euZg6UekB5CdVPC4sDCIjKbipkYCPc5QuXutZ3aYIt90Wg/pkxg5qxbFn0cAicYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750688851; c=relaxed/simple;
	bh=mnIK+W5KngtwZhVktOKMz0FyAthSv5HiBjAvWwmaW9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=feUyPb55yg/B5TDEvGnjfiM2yjEzVzqo0/EMLdKo4rmwicy8oVBGInf30umusc5HFAJWgex6yUrb6AGjmCB/uCgxlL+TofS8reKdCKU+r5AY/RjBSeF80pguE0x6YgXxY8s05T31jRx39H2Y0DjAPp0dpjHs6e3e6lo1f4GSRLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lpw5sjBq; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lpw5sjBq"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ad574992fcaso729788766b.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750688848; x=1751293648; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0mxmuO90Mgrv1homANIMZ/x/S7lf2iuPtj/uEFpEqR0=;
        b=lpw5sjBqUj8UhcTyMkmp8NwmAdHxOIjhUFCpaM0of5S3QaYrzM/Ab7BRMYmC7RWj7e
         Nz/eh/2EPSBuWbZ3ncMwkZEhvo9wCUJpfq5DLpWUcuZdKiLjx1EOBcZ57Ub6dFUJW6Kw
         a4lk3MXnkLcKDpJpXNETDkb5ZAAuJKaurs5tMGkXuk6KiCkkx+9coVXJwgTO5IEOJ46j
         C1Ez4dW254a0CQljbv7Dif6wNBqFFH+XnpdFUmF/Q3bwP739y1EdjiGeNc6jiW0wQXe7
         KzCICW3fKFnncAlEzG9DIgkgieo0EFBv2WJMO+cjRukhmo0pqhzcOnhKJl5Ozo6jgign
         rbzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750688848; x=1751293648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0mxmuO90Mgrv1homANIMZ/x/S7lf2iuPtj/uEFpEqR0=;
        b=n1tvo54ykB6Rj07SPIf+sZtEyfqMI+SQgrR+KyawSBw1SSLTTHjPE6W8YMhWcDi7/6
         ZhXEdXcnmcwmDKbLiMM6NGYKSBQ+d1DZ56MUSfLOmuyoSM5qosa/Q9fa23evPNf7S3/a
         AUH63/TvwShx4zacyPDGN2wJUDQzgWUEUQCdA4a5MP2rV1coiKR+BhebC4S+dMeXic4+
         q62vVci9IsxLKtpZpEtGA0B3j3XmN++90bI/+BaqPE473xhvisG8JIkS3baSoYjJNYzC
         Me78e7RTzKODW5jvPnmQtnz3gv8s8wOqOrqWVmrPYKqQ8gQ56y6G+JSYRgACRUQGVN/U
         cTbg==
X-Forwarded-Encrypted: i=1; AJvYcCUG1gt6nnJdrKxyH3U82kznePmOWIrfbLZRw7nDWaYGnnfQLguJErlHU9Ih0pP20CpeVl3AH6/fEKSO4iI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+JlG5cdEFktvfwFRX/eQoSEZi0xrhByTt8OpORffZDppisfGG
	/Fsm4FApp8FpuTQLXg+irOwymxnECRp7EQ3ryzrDTtW7TDhxPE/85u2wEm3LuXM2KcAsdVzMaGg
	htOA7+4cT9d/3l5ineNdJQnrV7gT7Q5k=
X-Gm-Gg: ASbGnctb7rlG3GUrFhbueXzWofsR0EDplvDW/EIFppLJMX9Qo2GbQoAt9hKrtinD0FV
	InTRNemGXSUyDXJhQBcIkEOYLJnDnF3NJ8SlqM17QWmX9n7MQLvUFEFor0ZRj3t1uaRb0s8KEE7
	NlIDcaPzBlF/7LELtnWywnEVW6KuMdFcuzq6fhOvsn8RRFkqxSx58H0UF+F/BnHlsHWEYcqYxDP
	kOwSQ==
X-Google-Smtp-Source: AGHT+IFg5WdPq/qtv4lksfp6KScFWAG840JHC2XOEBUW7uElx1+hH2peDn+CU3J7X0rKpYK4v7bpx2FOMkfNnjWA/wI=
X-Received: by 2002:a17:907:60c8:b0:add:ed0d:a56c with SMTP id
 a640c23a62f3a-ae0578d9c7amr1099129266b.0.1750688847762; Mon, 23 Jun 2025
 07:27:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250621180215.36243-1-sj@kernel.org> <20250621181127.36394-1-sj@kernel.org>
In-Reply-To: <20250621181127.36394-1-sj@kernel.org>
From: Bijan Tabatabai <bijan311@gmail.com>
Date: Mon, 23 Jun 2025 09:27:16 -0500
X-Gm-Features: AX0GCFu6T2Sb_KHAJnfSsDjk8-dMwbeEOaowGMMnJk16KremJtvAzwu_az7M350
Message-ID: <CAMvvPS7ozBjY-YWHrkkGVQA8ug=0=xT=BeyZxi0YrHp6PNQmHg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/2] mm/damon/paddr: Allow multiple migrate targets
To: SeongJae Park <sj@kernel.org>
Cc: damon@lists.linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, david@redhat.com, ziy@nvidia.com, 
	matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com, 
	byungchul@sk.com, gourry@gourry.net, ying.huang@linux.alibaba.com, 
	apopple@nvidia.com, bijantabatab@micron.com, venkataravis@micron.com, 
	emirakhur@micron.com, ajayjoshi@micron.com, vtavarespetr@micron.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 21, 2025 at 1:11=E2=80=AFPM SeongJae Park <sj@kernel.org> wrote=
:
>
> On Sat, 21 Jun 2025 11:02:15 -0700 SeongJae Park <sj@kernel.org> wrote:
>
> [...]
> > I'd hence suggest to implement and use a simple weights handling mechan=
ism
> > here.  It could be roud-robin way, like weighted interleaving, or proba=
bilistic
> > way, using damon_rand().
> >
> > The round-robin way may be simpler in my opinion.  For example,
> >
> > unsigned int damos_pa_nid_to_migrate(struct damos_migrate_dest *dest)
> > {
> >       static unsigned int nr_migrated =3D 0;
> >       unsigned int total_weight =3D 0;
> >       unsigned int weights_to_ignore;
> >       size_t i;
> >
> >       for (i =3D 0; i < dest->nr_dests; i++)
> >               total_weight +=3D dest->weight_arr[i];
> >       weights_to_ignore =3D nr_migrate++ % total_weight;
>
> Actually, probabilistic way may be not that complicated.  Maybe we could =
to
> below here.
>
>         return damon_rand(0, total_weight) >=3D weight_to_ignore;
>
> >       total_weight =3D 0;
> >       for (i =3D 0; i < dest->nr_dests; i++) {
> >               total_weight +=3D dest->weight_arr[i];
> >               if (total_weight >=3D weights_to_ignore)
> >                       return dest->node_id_arr[i];
> >       }
> >       WARN_ON_ONCE(1, "I don't know what I did wrong");
> >       return 0;
> > }
>
> But damon_rand() might be more expensive than the roud-robin way, and arg=
uably
> roud-robin way is what usrs who familiar with weighted interleaving may e=
asily
> expect and even prefer?  I have no preferrence here.

I think my comments about the round-robin approach also apply here,
but all things equal, I generally prefer being deterministic over
being probabilistic when possible.

Bijan

[...]
