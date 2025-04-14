Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162C428BAAF
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 17:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744652633; cv=none; b=TESm4S7jiinS0OsgFDyiDUgqBmsb433FGrHFpWwHT2H356PHTMlIukHZckrMi0byYUQMqbFKznkzwgV2YBsimpcONhNj6DqiwJVkoX5XNEy1H4MAjwkRqwAnU3k0SAauhJutgC87HFXqNr9efq5/qaTbRpFv/BxZiSjPBCARq9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744652633; c=relaxed/simple;
	bh=3PQwBhf6eQCtWoWWBJ/OEwKSKiZFxu/iYS4p/icb/kg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mt6PZjzFXK3Dul5FereZNEhsAGc6FtzLJObmmpDZd2Pmnv58CJN1rBUfUwO5PsKrhdxk993oqJyRl4W3fiBu9mZRiBZSWerqhPP4jpp7J1Y6fF/ihCoUsKNcHkwX86HS6ml0eGadgCY2fKTUh3c4EZxmoB+25FlRKErIUujDN4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D9wjv1SI; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D9wjv1SI"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2240aad70f2so24965ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744652631; x=1745257431; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x4dVleBDpO6/u22qkJIU8Ny3g2vn/v3l/Py+/JTBXAE=;
        b=D9wjv1SIvUlfkCl/rJ18ADEUCzjhlPWCCQapoTGUBaT84s+Yj71f/lf4Eneblye2ww
         uP5askoa6j2QF43R5KP+Gqrx+hP+Mx2liYxJFM9BtyFMiIO3Bir7FOK+DNR2MOl3SqLj
         vJopbUKGKTPzSZqNkxR1FouULQVtMSVn0A2cc8XZKxWwDiWhYbPt5TfXb1SvI4ktoKWy
         Agjy2PzEMzJ9m5NyfEgYcMGg1gHb7WePS7kqdn/bUHqkOjSBIj0qHFTI4DytQDrtXLoK
         wjQgUVmmuSFmkfsYo9OvmjJl0xKDPUo/leQ4UxHLp7QTvR2uTEqPMYqJF9XPIaG8HK80
         mApA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744652631; x=1745257431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x4dVleBDpO6/u22qkJIU8Ny3g2vn/v3l/Py+/JTBXAE=;
        b=BQPDOVZLqoOhPwVUGonsm2PJdsnYJZ887NCVARaSEiYqqsAvl9jEX+8HJQYCz6Mjzp
         9ZyRhwuf2Ag/vnXCLpZWM3uuPr1ogy+tQYY9xvi9TQMmYlWJ9CwaNQK5TRGO+Tn12C5Z
         WdOGr/nEy7IXjcK47633PL+oQBUSRhYDJelmNqdqfgccWf6lhDCnFQwYGflRnwWEFaHR
         Jp/XwHZDA9Uc62wFgOHcS9Q1Xz542eQMcCRRjYVtUaiMU+4kPmUvdrIgm9cUDYKq1Lvs
         3Ga2O9FhV1E3Zic8FcHsrk5vQ8x7JKezHs2nee1pqN7kgf8zfLglbYOXcwolBriJPQan
         LE+w==
X-Gm-Message-State: AOJu0Yx95GlcVln7LVepcfQf9jALHOJopIWo218Gzud843BiuTP7uAOl
	nxze5Uwj0RPwJepzIFuHD7rZwas/wZPZvCE62Tu6gJ0Xsb7AUjL52AaAGEuopo+fdGEDoxZBUgT
	Js7J56JEUOSkWfNIACJaCvOY1hzgHB7/t57NU
X-Gm-Gg: ASbGncvhPSh2pUkR0Dq+V0Kb7TQmdQndvoBQG4HTxPc793g2TrS38NoIswJ7nBz9QbF
	Iep3owUrvuuWCrDk/WfHqTPy5ATvyKk6hVeyVPy6qVjOqfBYzxor6MglKOd2dTIAEmyQYpibMQ0
	tyY99uRollVn9mVp92MVhzSyBOL36wNU7aB1cTJhxRi97TrQXFGoU=
X-Google-Smtp-Source: AGHT+IH22Knd2f+MyZKirEYjAUmZsb5BYxkMdbW4areGnzYPG4fkeoyjyV5rMjKASN9vS0KH3caGf6mxt7JSrJnDOhw=
X-Received: by 2002:a17:903:f87:b0:20c:f40e:6ec3 with SMTP id
 d9443c01a7336-22c2521699emr36655ad.22.1744652630896; Mon, 14 Apr 2025
 10:43:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414173921.2905822-1-ctshao@google.com>
In-Reply-To: <20250414173921.2905822-1-ctshao@google.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 14 Apr 2025 10:43:39 -0700
X-Gm-Features: ATxdqUEeogjw7qi6Xrd5OpKotHl4BOojFvI9RaQY-9Jp5El-MAuZdx_gvBumaWg
Message-ID: <CAP-5=fUJip8odShuUVCnwQg9MrMLVdCWjGdSFfUxWubfQYBy1g@mail.gmail.com>
Subject: Re: [PATCH v4] perf report: Skip unsupported new event types
To: Chun-Tse Shao <ctshao@google.com>
Cc: linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, peterz@infradead.org, mingo@redhat.com, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	adrian.hunter@intel.com, kan.liang@linux.intel.com, dvyukov@google.com, 
	ben.gainey@arm.com, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 10:39=E2=80=AFAM Chun-Tse Shao <ctshao@google.com> =
wrote:
>
> `perf report` currently halts with an error when encountering
> unsupported new event types (`event.type >=3D PERF_RECORD_HEADER_MAX`).
> This patch modifies the behavior to skip these samples and continue
> processing the remaining events. Additionally, stops reporting if the
> new event size is not 8-byte aligned.
>
> Signed-off-by: Chun-Tse Shao <ctshao@google.com>
> Suggested-by: Arnaldo Carvalho de Melo <acme@kernel.org>
> Suggested-by: Namhyung Kim <namhyung@kernel.org>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/util/session.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/tools/perf/util/session.c b/tools/perf/util/session.c
> index 60fb9997ea0d..ba32f8461a4b 100644
> --- a/tools/perf/util/session.c
> +++ b/tools/perf/util/session.c
> @@ -1639,8 +1639,17 @@ static s64 perf_session__process_event(struct perf=
_session *session,
>         if (session->header.needs_swap)
>                 event_swap(event, evlist__sample_id_all(evlist));
>
> -       if (event->header.type >=3D PERF_RECORD_HEADER_MAX)
> -               return -EINVAL;
> +       if (event->header.type >=3D PERF_RECORD_HEADER_MAX) {
> +               /* perf should not support unaligned event, stop here. */
> +               if (event->header.size % sizeof(u64))
> +                       return -EINVAL;
> +
> +               /* This perf is outdated and does not support the latest =
event type. */
> +               ui__warning("Unsupported type %u, please considering upda=
te perf.\n",
> +                           event->header.type);
> +               /* Skip unsupported event by returning its size. */
> +               return event->header.size;
> +       }
>
>         events_stats__inc(&evlist->stats, event->header.type);
>
> --
> 2.49.0.604.gff1f9ca942-goog
>
