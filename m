Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6446F19049B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 01:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751420641; cv=none; b=W57thHWeG58OYC6LNZxKmTCh6fcepcEdd5+wueRsB0KEFYt79yQfuHJWokLwp+jh2FJAEM4GJ5Uz69gSV+dA06PZnb4lH5meGOuEdV0jY80pjne+wKxFgs18aIu9KM12OAn3gPmkLzuBHB43ZsXER07utDa2CigkeWOChvyP+3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751420641; c=relaxed/simple;
	bh=Wp3QvUmtjaYbsboLk6wHkkZX7o8yd6hDGDrdeUnpK9Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F/OAxCa1UzPocOo2XmD1FKde4dDVbVmDHWWfG+PyybSr4d49XsPG6C2lBlMIyHUxdNNc64h1XQIy4Ul5N7RrE75vi9EvnEJibXJnyJDZV0qBnPBhX4u2LKjmLR2W1DXlItRmNiYMs1owiak30Oyb9pnTaRjgPtcQa3pf0ys7F+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dLv34tQo; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dLv34tQo"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-60c9d8a169bso6828898a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 18:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751420638; x=1752025438; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/1n8DQ3QrTUlCt/gae0hvfHO3lvru66RPSduUSFUq30=;
        b=dLv34tQotozYxrIMENxUi+HEswCZF93wKprtLFXfkKb5m8PdxnEfH94wC/B/5tC9+f
         pSAcVgQSfXr5y8uucXnim1xywEljAEMJFlGIdB3/aTXdAUUKvmY+t95jhzekt/hpdeWv
         b8yaoDtIcwhglO57pwZSgXFYOTL0O9kLAjb+DTKyfiXXwAPu/1pXKqcIGSETqZ90fv6S
         ZhRSiCjoK1UYv4w6AZy+PG4d2JIbfSpsBCD8cidEKVgpg0N2CGTJabQRBZYhy8tVom8K
         LHuBcXC3Aj7XWeS4HNKLuvnT+v4WbFMDGcJzjIVB+YnQHgR7dyAnkRpWvBt7e78d2IUZ
         oyuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751420638; x=1752025438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/1n8DQ3QrTUlCt/gae0hvfHO3lvru66RPSduUSFUq30=;
        b=FfxDnQvFjO/ygAbleEshvbU6SuCRRULIxIpHDE1EQZ1phtmqDAT7bwVLGWii58czUW
         NyTf1YHDpYBzVVlxquC9i/yK/+cRWnFq7tCCKHz8xMmnT+IS8TCD2UKIiS+IIMQ7hpNr
         OsHf0JM0JLwp9UwKBG6tB0r7MTCB+5SiWdVgur0EcD+jAuOYJW1w7zYcg6vzZVd4bfjG
         HXXyuWB9K6tDjMCNdlxsf+0s1f8V58zZm+Udcl3kiFk9MzPrOjn8KW5f4jJVhM9UD4wI
         y7U3OmhYjz3MelKpG2zcVgLvqDLbK4hpL3Bl5eAjDEs3WknMYdcty9IowixZve0CCBDO
         f/ww==
X-Forwarded-Encrypted: i=1; AJvYcCUOBylI3yO8IKcyd0DUc+Vy2U4AVQrCrcJcZ4gHBziuN3WcyCWvagyBDs7TEJaDkoZ89qhoI4OOjrqnc7A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx24ebRicGwB3RIQxdUnGJS/JX7rOI78NqSIg7xq59KaHiAtF05
	VuMEPoel+YJTslYQxKTmoXBxuPatsvGiQeq1bOpTK9SCWZFKToD9fM60UGFc37nEDgZ/tttZ/98
	eLyBGMfxjj/i5QrcUhlzmlqeBvQRtVps=
X-Gm-Gg: ASbGncv09wv31vEcfqbfRgZo9fipdvzoGkrQTkOPEwWwuQZuMhXQpBndQKd2iC4OxNE
	oXaiIvypyYJUUd1aL6bXeaADtNiLeoIbpUPBJ1NkfxdXNUFVliJxBtsCd31D7U6quyVEUcHT+rM
	DgC60RsZwwDhLlwXETBu4zMmICwgaCCwrq0ioEavP4IAM6hUyWdok1IYe5K6s+oVKn9OaBC9Mq4
	NY=
X-Google-Smtp-Source: AGHT+IFFTFwxg9s96AHZYDv0fsyMNx/xRNvBJ980ERQ6xN+1W6v2zN2Ey8sVOwsKieogYMjNrfk0YEpZRgqUf+eTgAE=
X-Received: by 2002:a17:906:f592:b0:ade:484d:1518 with SMTP id
 a640c23a62f3a-ae3c2c04018mr85819566b.26.1751420637499; Tue, 01 Jul 2025
 18:43:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701224353.9062-1-bijan311@gmail.com> <20250702002551.1246-1-sj@kernel.org>
In-Reply-To: <20250702002551.1246-1-sj@kernel.org>
From: Bijan Tabatabai <bijan311@gmail.com>
Date: Tue, 1 Jul 2025 20:43:46 -0500
X-Gm-Features: Ac12FXzA0rgJUVRIyV0Ugx-F7zOyXIR5treFqwmb7GBsQKdrPT3I4LC2ikATSL4
Message-ID: <CAMvvPS7U9iV9K70-4J-n8pKLVBhY3Hfky4Hc3dxAbzVE1o3oeA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] mm/damon: add struct damos_migrate_dest
To: SeongJae Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Bijan Tabatabai <bijantabatab@micron.com>, 
	damon@lists.linux.dev, kernel-team@meta.com, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 7:25=E2=80=AFPM SeongJae Park <sj@kernel.org> wrote:
>
> On Tue,  1 Jul 2025 17:43:30 -0500 Bijan Tabatabai <bijan311@gmail.com> w=
rote:
>
> > On Sat, 21 Jun 2025 10:31:28 -0700 SeongJae Park <sj@kernel.org> wrote:
> >
> > > Introduce a new struct, namely damos_migrate_dest, for specifying
> > > multiple DAMOS' migration destination nodes and their weights.
> > >
> > > Signed-off-by: SeongJae Park <sj@kernel.org>
> > > ---
> > >  include/linux/damon.h | 16 ++++++++++++++++
> > >  1 file changed, 16 insertions(+)
> > >
> > > diff --git a/include/linux/damon.h b/include/linux/damon.h
> > > index bb58e36f019e..d60addd0b7c8 100644
> > > --- a/include/linux/damon.h
> > > +++ b/include/linux/damon.h
> > > @@ -447,6 +447,22 @@ struct damos_access_pattern {
> > >     unsigned int max_age_region;
> > >  };
> > >
> > > +/**
> > > + * struct damos_migrate_dest - Migration destination nodes and their=
 weights.
> >
> > Nit: Can this be renamed to damos_migrate_dests?
> > I think plural fits better because it stores a list of destinations.
>
> Makes sense, agreed.  I guess you will do that on your own when you add t=
his on
> your patch series?  Please let me know if you prefer different ways.  I c=
ould
> also do that and send it again as RFC v2 of this series.

I can do this in my patch series.
Would the best way for me to do that be to send modified versions of
this patch series with my patches, or should I send one additional
patch that just renames the struct with my patches?

Bijan

[...]
