Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878E476410
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 13:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744636778; cv=none; b=NDoYH2zGMYZDpCh6ZFdUFEii4NIIDvwVPEZmjrsEHwyj9A3Q+J46EPN3If91KCbqYF7+DZGIgAyWzkrVADByimVGcSVAnZsHQriNtXrxp0mS5fz4YPtPmKkAi5CLL+lx+xQHbWJdBjoMEeiqlGaQXH62m6W8dPNejAScOK88PHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744636778; c=relaxed/simple;
	bh=WEKfPQh4/nLUv6xkt0SWK20KEx+J0sdjsHi74ls1sMc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=knAwwnL05rmtZq64n0M4XpKw5+mb8V5VLZblSMM//AUXV0tfzvKtSzozqEm6UQIncOHdjnZc/ladJ+cGZuionVcw/eA7aQoRc9LMW0WD7t5h/p/u6GcC0vJiq5pFtdPR2EdMz4x1k4qofGxFtLk5stY77yRJEU47cScyY5XzYgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eVqIrIpO; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eVqIrIpO"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-549b11c7fddso440165e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 06:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744636774; x=1745241574; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WEKfPQh4/nLUv6xkt0SWK20KEx+J0sdjsHi74ls1sMc=;
        b=eVqIrIpOfFKRnuxjsO3VtmTmlqv0n76519jImsie731lFGWVIhMW5Vzg1yfuH+XdBB
         w3gclhRy7Bv0UleExTK2kg65XZwf9DyXwOP/PZvhTnJs+9DYl1lIguKNIvLDboWpfCw6
         8i1Epoy0SxrahzYeJPiUQnzUvBsmZTC3IkLGTmcP0V0EghhN6txeZWWzTXkoPg/GsdhZ
         6qMLgATxezscRSJqHZl3bjUXmG90WoduNymriGUyVP/t/Zp8KXCWRQMChYyfjR1XC/Eo
         YcupnuH/EazEZKFnv7bkdG2LJNT+6dIGascYjLbyJbIsnHx4VZ0+vcaEMHegkIRzK+1y
         MDGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744636774; x=1745241574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WEKfPQh4/nLUv6xkt0SWK20KEx+J0sdjsHi74ls1sMc=;
        b=anSioaKeyxx9dR6rZUuho7eYipjZ1+DQzHjGGfMnUL3o4i6B9ojDcIlPD7LlzJHOhm
         bDH2J1k7XgC59gCgkGihrcBM380I+ADXiGo49Iv/ec6xj8b08AO3XDCIfLTDKAKXAE3T
         CgLRBNxy3pNT/AoLO/oVGvDbZ59jGcvKC9XLYV63ptBx2ydvd8KbvPrDAFFUdzvGeBHb
         vLLcnHLCwJ+RTANO/ZGe8hyb3gfPU9z4XhJa8NNkAukuLH2adN3ETprCoZNv4l6XjWbm
         geobg3TZLrW8KRoh0ji3HrjvPe2KbOMyf+XuuCadboHegtG2yPXo+lZXGqFeC5Ymg+w0
         oqnA==
X-Forwarded-Encrypted: i=1; AJvYcCVTHhesEadelursYJcmVBV1ZIZcEMPq1xy0m734MR1wqZrs/BFa6XIWa74bPH+frvYdMwpw+pEhlBGWjTk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDbPUsXu+1fzjvGit5D1o1pNz89UtThyiBHTqSJEjHxZHfCiLS
	EwOtBVlV7fm+3012iEM/opOOBHKI2tw2TuhVlqr6WhBeifpB9oSt6m62iT3YB1kbgiqoUPeNXG/
	d1IgOWeyaapbz+wT4WMkNo/zfMbM=
X-Gm-Gg: ASbGncsDwNKZJPywih8Ap36niDhrI+F8BZpBFI6uf1ZmJuWarT96gHpvITubujaRuos
	iJvnaj3XF5pGWwrfhl/EPnVQs64mQ2HSRuqdUu4b+FpeEtIRD81oOP0UqcGr/SmT60egBQpQcoz
	e7bPQKgqnzIsrmXkrAhk1k
X-Google-Smtp-Source: AGHT+IGsswGyvuM6kUpmfmAY4TOczzo7G7ErXVYIN7TicY7hRyM6ISLnzJf1dkqB0v4kscGctaeJgQ5FEFPv7ILu8u8=
X-Received: by 2002:a05:6512:304e:b0:545:ece:82d5 with SMTP id
 2adb3069b0e04-54d46e762ecmr1015826e87.13.1744636774097; Mon, 14 Apr 2025
 06:19:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408154637.1637082-1-nunes.erico@gmail.com>
 <20250408154637.1637082-2-nunes.erico@gmail.com> <CAKGbVbt-Cfp_D3WH3o1Y=UUQzf-sM0uikZXO1MFRxt2P72gjJg@mail.gmail.com>
 <e24e5e05-5ffd-440f-b9d9-8a0f792cc7c8@amd.com> <CAKGbVbthUxOxtZ+baT=vrNE1u6fzN48K1G5dtZBqfTBc7jEuYA@mail.gmail.com>
 <0f43ad99-27f6-4c1c-915f-2b7163195f07@amd.com>
In-Reply-To: <0f43ad99-27f6-4c1c-915f-2b7163195f07@amd.com>
From: Erico Nunes <nunes.erico@gmail.com>
Date: Mon, 14 Apr 2025 15:19:21 +0200
X-Gm-Features: ATxdqUE2mBj0DNZ7ekenEG7KKtQjGr9Ng1tozhxHD_hUhoZrHDMYMEN9VsJM85s
Message-ID: <CAK4VdL38fkraY2sujHCVnuhLJ8pQ4f-MejUcfsFTbdxusys3Kg@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/lima: implement the file flush callback
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Qiang Yu <yuq825@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	lima@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 4:04=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 10.04.25 um 15:56 schrieb Qiang Yu:
> >>>> This prevents applications with multiple contexts from running into =
a
> >>>> race condition between running tasks and context destroy when
> >>>> terminating.
> >>>>
> > If implementing flush callback fix the problem, it must not be when SIG=
KILL.
>
> SIGKILL also calls flush (again eventually), but we can detect that in th=
e scheduler code.
>
> See the code and comment in drm_sched_entity_flush(). We could potentiall=
y improve the comment cause it's not 100% correct, but it should work under=
 all cases.
>
> > Could you describe the problem and how this fix solves it? As I don't u=
nderstand
> > how the above difference could fix a race bug.
>
> That was the point I wasn't sure about either. It should *not* fix any ra=
ce, it's just gives a nicer SIGKILL experience.

Thanks for this feedback. So as mentioned in the initial letter, I'm
also trying to understand if this is the correct fix.

This problem is unfortunately not trivial to reproduce, there is only
one application which can reproduce this so far and it is a
complicated one with multiple contexts and relatively lenghty jobs.
What I observed so far is that as it is right now, a context might be
destroyed while a job is running (e.g. by killing the application at
the right time), and a context destroy appears to release buffers that
are still being used by the running job which is what causes the read
faults.
This added flush made it so that the jobs always finish before the
context destroy gets called, which prevents the issue for this
application in my attempts. But I suppose it might also just be that
it had some more time to finish now. If this is not the correct fix
then there might be some more missing synchronization between running
job and context destroy in lima?

Thanks

Erico
