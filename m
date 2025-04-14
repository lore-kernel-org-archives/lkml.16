Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FC1292917
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 17:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744652549; cv=none; b=HuuCjUJLOMKHIIG+YFJF+f8oJPwb9Z7/V9lfk+2g6yIBAQg5rdG6R67y22EZelVcXCfdPe3+ReQnZxBvj4fXlaTr1xFWcAGeoH+QJRKpvMruriE4cwZbIBvwG3/SklCfaI1035DtEomQIYI04Mg/EchW91lwXaTp1lCMX6IjK/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744652549; c=relaxed/simple;
	bh=r/oZLu7g97RF6TF9183rjWt7sdJ2elJ9pfcYGZQAci8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J5tB/rJ+chorez/+XOjOJYSpNQosqo2+poY+ayjiVmB9o+4ax7lPizyACY6yhhmVArtiS9GMSIK0pSwpauHK+JM+mO5HeJXLLbku3hrk98IBAOfzTobhpvwptWCy+tOgCOYivd0K66y0N63SDthzecrBEPQa6ZxevhJBacs9QB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BiSHoYa3; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BiSHoYa3"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aaecf50578eso840021566b.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744652546; x=1745257346; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S6dXpssTyEnXZw8Werw0Cfea5OuCpmeGi7WA4m5w0Kg=;
        b=BiSHoYa3fgJSiqVoP3e0H+/FxsvaWZzno78abprQ7Dm0KE5tnvU1RN5Bv7EOMusnhZ
         qlqJfPG8iitoFObxWWFMGys/INnO8lfSbVdTu3vxGXVO/BBbq7rwhxkeItMJ+RWTfo7X
         ukGtkO898mKlTACCgY9X6Y0S7E2Z779/KSbzt5EeTW7bDaGADKo5qOAiXZumrWLIOkYj
         UJgc2LKySaUQwezESr2fSxwXDUX73RBR4ZKBNvG4CkUNn1m1Y+UKOUfia3etcJGPHQ7v
         JDm8wE60JaNl3Agqp0oWBH1uSM2WuExpguzaSeN8QXCRBOTb2uGSPTh8OYOucw8HXbwj
         KN9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744652546; x=1745257346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S6dXpssTyEnXZw8Werw0Cfea5OuCpmeGi7WA4m5w0Kg=;
        b=axD7X9X08N8BWDhMygLoz0muGPVpi1jqLxkXVB3RE+iQ67Yx5a3OGsYepgVbRb4HOQ
         I6luDt3mJID0fgk3cmmeTXfy4nCvF56Menl1V62khmfkzBPTPexvV1dvR5tAHq5Cn6nn
         AvNaxIS5xEo74AqZ8r6meIxtHeFLNrjDA+puxTpCfjvMKv38aYN4Q7iRDLnuJ/zwBVtT
         R8BoE1eDZKg5rblb2FQRDs5fjChv6tVCKTRH3l8efWszMaiWd3uTGojqu0/8LEzWl3CH
         SyScm7Fm+pnxkelpiF11LRKXpBDgxjSdhLJdmYce4NeKYj6dpXFgTD0diFSgto4olAuG
         HjIg==
X-Gm-Message-State: AOJu0Yx5/VN3Iow2FnD6l3b8gEqZEYoaU8IfXEq0Z5ZIf/Wt60hyswjW
	/ct3Xu1wRchVob7YMlZDlaFhKEDGy+R8m1VIwqyJf3BvevvTeyA7ofpKH4JqFItT9sCHseIt3Bd
	rKlOkNqNzCAZfeA4M//POilP4Y6fvofdZxKpM
X-Gm-Gg: ASbGnctEuifovmNfufkKuJxmOtMhi7Y/Ffli0/OWz61NJ5xZrIGOo/emJz8KbfduG41
	2Sg0+yKG3sDkgvg52vOuqN6hkkrBRPaXG2X9cHvPbRxiDTTmTFM6WvbcasZ3C6V9HH+5MlYJ1G8
	S+FaUR3iW5OCFJ9m2pF8vAiY4w8qVMplmQ7maTY6DAKVSMbpIe
X-Google-Smtp-Source: AGHT+IF0lVacdLNmQXyNIUxEHd+nTqR58C8tfUD29Jy3htQ250p/42LkgbUJpDeJ9P4uGPCW5RLhDiIuWo8Z2TF5ZBs=
X-Received: by 2002:a17:907:7f23:b0:ac8:14ad:f3cf with SMTP id
 a640c23a62f3a-acad349c379mr1122853466b.23.1744652545646; Mon, 14 Apr 2025
 10:42:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250411174547.2208959-1-ctshao@google.com> <Z_mAxgbgVBqHDRfD@z2>
In-Reply-To: <Z_mAxgbgVBqHDRfD@z2>
From: Chun-Tse Shao <ctshao@google.com>
Date: Mon, 14 Apr 2025 10:42:14 -0700
X-Gm-Features: ATxdqUGmO6XE11TB5jTq_YVjbnQWRZYMA-7dZ_XSG_Wlq2Fx3_o8Rp8eMDvgThU
Message-ID: <CAJpZYjXduAo1vHzfGzCXk+ZuGwo+Sy5CpZ-cohrooz9k0qwM4w@mail.gmail.com>
Subject: Re: [PATCH v3] perf report: Skip unsupported new event types
To: Namhyung Kim <namhyung@kernel.org>
Cc: linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, peterz@infradead.org, 
	mingo@redhat.com, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com, 
	kan.liang@linux.intel.com, dvyukov@google.com, ben.gainey@arm.com, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for my oversight, just sent out v4.

Thanks,
CT

On Fri, Apr 11, 2025 at 1:51=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> On Fri, Apr 11, 2025 at 10:45:21AM -0700, Chun-Tse Shao wrote:
> > `perf report` currently halts with an error when encountering
> > unsupported new event types (`event.type >=3D PERF_RECORD_HEADER_MAX`).
> > This patch modifies the behavior to skip these samples and continue
> > processing the remaining events. Additionally, stops reporting if the
> > new event size is not 8-byte aligned.
> >
> > Signed-off-by: Chun-Tse Shao <ctshao@google.com>
> > Suggested-by: Arnaldo Carvalho de Melo <acme@kernel.org>
> > Suggested-by: Namhyung Kim <namhyung@kernel.org>
> > ---
> >  tools/perf/util/session.c | 13 +++++++++++--
> >  1 file changed, 11 insertions(+), 2 deletions(-)
> >
> > diff --git a/tools/perf/util/session.c b/tools/perf/util/session.c
> > index 60fb9997ea0d..f55b2ac4e103 100644
> > --- a/tools/perf/util/session.c
> > +++ b/tools/perf/util/session.c
> > @@ -1639,8 +1639,17 @@ static s64 perf_session__process_event(struct pe=
rf_session *session,
> >       if (session->header.needs_swap)
> >               event_swap(event, evlist__sample_id_all(evlist));
> >
> > -     if (event->header.type >=3D PERF_RECORD_HEADER_MAX)
> > -             return -EINVAL;
> > +     if (event->header.type >=3D PERF_RECORD_HEADER_MAX) {
> > +             /* perf should not support unaligned event, stop here. */
> > +             if (event->header.size % sizeof(u64))
> > +                     return -EINVAL;
> > +
> > +             /* This perf is outdated and does not support the latest =
event type. */
> > +             ui__warning("Unsupported type %u, please considering upda=
te perf.\n",
> > +                         event->header.type);
> > +             /* Skip unsupported/unaligned event by returning its size=
. */
>
> This comment also needs update.  Other than that looks good to me.
>
> Thanks,
> Namhyung
>
> > +             return event->header.size;
> > +     }
> >
> >       events_stats__inc(&evlist->stats, event->header.type);
> >
> > --
> > 2.49.0.604.gff1f9ca942-goog
> >
