Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A4A28E60B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744705757; cv=none; b=f4NfCACWpeymPKuRPOfAHKmG95zcJUpxeKPAOxuCgSZYDGZG4JumHL/T7aFc80c+A7EoBcFetczr7c1Y4CCa7hQUXZOWqUOXXcQjeelLtz9GmRZkAu9rs6xyhMqEGpBGALP4zqOk4iYblSnnGMMD3VHnT5GBx/dMLdinqQ+frVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744705757; c=relaxed/simple;
	bh=edH9fxg6ueKDvDGn3FYIjnLtn+JSdXEOmm1WoF0bxyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UHzOT48kX8VNu3S7INm3fx29vR7mZvZsF5oU4FeO5giarg391WpvEpYayHc52B00ffwfX0at+jHfRt/3mO8PqfR4hxxJDqT2IoomTLMwqJYCORmMtLaHF4BtxgXJ1OF5Iy8rah/UKL1uvm57SeitJ3ExuKKROXL0nkNvTi9gPJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CYPDs5P1; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CYPDs5P1"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac289147833so1047624466b.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 01:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744705753; x=1745310553; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=edH9fxg6ueKDvDGn3FYIjnLtn+JSdXEOmm1WoF0bxyY=;
        b=CYPDs5P15iIR45yq3EtFsMQSYLKE0JAKgfdgcrCqsWEmkYeHV9EbdHrDAVDRUaNeOe
         TrF/KCM4I/S5wRTJy9/TzUkIlRX/GUJrF648hvlOTYblbk+s+i1WC8uvWjZiMXnONfmF
         8qgqh98htmmsCpSIfA4R68IYsA6dQQD7vQQ6wktFUTmF3qFPHAgbL3ze1PYz59FpGrNp
         lmjYlMHaHOuVyBrIqYeuF5dV0Z7enk/DxnAG9Dlu3csYUHGY0Y/Qxz3aswT0PRHGJuBJ
         m60w0+NemY+hPN3SR30tYplkppaEvjhJBIsWE06MFsKUpYLlSNOvbXtdLYaBGpxYQgAr
         22Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744705753; x=1745310553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=edH9fxg6ueKDvDGn3FYIjnLtn+JSdXEOmm1WoF0bxyY=;
        b=H3PFVy7vek1xMbTFt4dvZEosUPTawz6ULiCzq3QiK/zzfjpx6/vk2c2PRj6UHEiPDk
         MY1Ig2XafLUX2B0xUEkAtcDco1p243fhK7wYDFC3jCv9UxmdjtYe49oauFhDC5SIF1CM
         9PzZ2cuoNjlWyGllUDwhx6WQ0tLWYbT1ENSmiKzRjFbSZOXA90oF9a4HdoSPdSLZu924
         dkZLS8s0Xf3v2517AKBxmdKQ5yIwKx9teqn/5fI7oI5gxXdhO+P3hNmtGpD1Y5SIQJcS
         AGhy57iyc3OtqNkkXMx//1brlfY9BNU9wF77Z6as9yexSraBJtBEfY4icg9vCAndvKC8
         g8UA==
X-Forwarded-Encrypted: i=1; AJvYcCXfMBfS4rtEm+3/GUVDaAoR0JIfYCOMwz2eYQQilHvF+LcFVqERMd7MDXf+O+5E85mMgkXDHLpGpMxKU0I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVfkX1coJY6g9eyq9RdiPbviGfDMnpeaEaziJByXVkrqxJXhBk
	g7EczyV7HdUNd6FcYoLFHGz1a/HJtIdMjTYsXMz0NJnNUHKYWY2gmLgWQ/K//RbOrkN+EMLJVL1
	5qydoG/0H/g9k4zFzC9ojjwC795s=
X-Gm-Gg: ASbGncv7iFAl83Ydfn2TwxNjMOIRR1yKqVFCD4x3m0c3u92MFab86fXhuy5/z+IdbUz
	qitHX76kJiME5GP+KqFN54lNk1snhQI3RWihTBCGO0Mva57rHqp2h+FHyS3zTys8OXcRBBEOv7U
	0T4jqveqVI0MOsNVDHikCY
X-Google-Smtp-Source: AGHT+IFjreWu8KEqvP1RyLPoMVzPS5ye8BPrDludPk8PAxmA/58gWZiWB7NLYQaGtUGDlKZtjolt3HoeffXAerZi9Xc=
X-Received: by 2002:a17:907:968e:b0:ac3:45b5:d325 with SMTP id
 a640c23a62f3a-acad36c21cdmr1246510366b.52.1744705753347; Tue, 15 Apr 2025
 01:29:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250411121857.GA10550@redhat.com> <20250414-lappalie-abhilfe-eb7810af39bb@brauner>
 <20250414-tintenfleck-planbar-656144f25a3b@brauner> <CAGudoHGyN5qno0TVfY-vCJBHjkDd-CL82-W_o7u6b+qXraAJVA@mail.gmail.com>
 <20250414204535.GI28345@redhat.com> <CAGudoHGi6yZNDVzA1coEu5t4NB_PB51wo1tJmKV0f=mxzWs=0w@mail.gmail.com>
 <20250415-haare-kroch-2c11f03bd81d@brauner>
In-Reply-To: <20250415-haare-kroch-2c11f03bd81d@brauner>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Tue, 15 Apr 2025 10:29:00 +0200
X-Gm-Features: ATxdqUEuiXC_Ws9Ne1zlydVJTPEbduOKsGa1d_UW9IutQkj61gJjkFQxLg0RWek
Message-ID: <CAGudoHGy1-Rm_THrrhLRPLNUNjGb9SC9Ju-Qb_p+NAezn6EWVQ@mail.gmail.com>
Subject: Re: [PATCH] release_task: kill the no longer needed get/put_pid(thread_pid)
To: Christian Brauner <brauner@kernel.org>
Cc: Oleg Nesterov <oleg@redhat.com>, "Eric W. Biederman" <ebiederm@xmission.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 9:35=E2=80=AFAM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> On Mon, Apr 14, 2025 at 11:26:35PM +0200, Mateusz Guzik wrote:
> > On Mon, Apr 14, 2025 at 10:46=E2=80=AFPM Oleg Nesterov <oleg@redhat.com=
> wrote:
> > > I'd prefer to move add_device_randomness() after release_thread(),
> > > but perhaps this needs another minor cleanup?
> > >
> >
> > I have no opinion on that front. As far as cosmetics go I would not
> > touch it past the nit I mentioned in my previous e-mail, but I'm not
> > going to protest any other changes.
> >
> > imo the real thing to do concerning the routine is to figure out if
> > the call is even of any benefit -- it very well may be this is call is
> > only there because nobody with random-fu bothered to remove it.
> > Personally I have epsilon knowledge of that area, so I'm not even
> > going to try to evaluate it. But it would be nice if someone(tm)
> > reached out to random folk concerning it. Worst case, even if it still
> > has to be there, maybe the sucker can trylock and bail. It does
> > contribute to contention, likely for no good reason.
>
> Afaict, add_device_randomness() cannot block. So why can't we just move
> this into put_task_struct_rcu_user() (or some variant that's local to
> kernel/exit.c)? I see no reason why this would need to be done
> synchronously?

It can move anywhere as long as ->se.sum_exec_runtime is not scrambled.

I'm not going to argue where it should land. I do note chances are the
call can be straight up removed and if I was looking to shuffle it
around some more, I would first try to find out if it can in fact just
go. I don't believe it warrants any effort at this stage though.

That said, apart from this remark I'm not going to argue about any placemen=
t.
--=20
Mateusz Guzik <mjguzik gmail.com>
