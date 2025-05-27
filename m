Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3DC204F9B
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 20:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748378029; cv=none; b=JMLF5w0aL6GEUC1QVsWvgtQ/CrLKcuevumxn6vl3AB7ML8zt+lp5PDrPoXtQD2PbVHweWIb1s5pz9ysHNB0uWG9JyPYmNMaFjDhTNLiI03E4JAX4kNwKA4SKDYIPy8LBXLmpTtm9YY1465LQQgYbrUYytePTjSYRzLnYn7CpUkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748378029; c=relaxed/simple;
	bh=DjtB8BRpaDcJZqUnxCsmRkSL3YrC18x5DJNTYGMvAhM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t3Zyo3WMHq2gkrFq0/CXUVyqNqWm52sLLz5tigTrgh9kjZzArRBI8IT4zlBYx5NzOKiSeNhm5DuzDY6YKCSmE69iW5Zk1OWSd4+dzEEIiWXZxrrcGen+6CcljsVnDPLmdMv10uIpcx8g1o1kTDuLUIqLbSe8WX/pA7+hkgrHdbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j0RQUW43; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j0RQUW43"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3dc8897f64cso14185ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 13:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748378027; x=1748982827; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8vMM0EfVdDxW43a+3ih4QwmwFQMtKuGgo1WFCc3wMKY=;
        b=j0RQUW43ESZFahMBtCvM59fV6ryepuWVZAwk29kRQkYmp89GKgi7c2x+Rp7pLP2Wu1
         6njdb8pKqD5VY8sj0oHFwmB0qPvfu+kHxv19vw8Cl6xSuLv/AX5EjwbxYJ7DNQJZmhH+
         b4qTF2+YNi5+rMOIpd92qJ/VMLyY19G1wbXx9fN+8QQ2zsuy6aAytG/lBzgai0Dj3ZNa
         Gu9GSJgi6le3ViI0WsS+ouZHQdjhh4oCjGtl8Sgsa5IWwiU/jEhRShwtzZ2mhmgQB/DY
         qanCg7U3Mar6Xd7tYHYtB84kZWfDmiSPY7nSo3/iReuso1k5NOFz/P81pUUo8w6VRDkr
         T5rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748378027; x=1748982827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8vMM0EfVdDxW43a+3ih4QwmwFQMtKuGgo1WFCc3wMKY=;
        b=EGebGOVc91f9Hmtp3+kvNxoRnc55phRKXcSqTVtQ8k3QHfjJtLUjeeobctUXYPXm1f
         OwUGlvk3aCyIk6BdD49Ump6Z7CwuVa5i5dDH9vBmTx+2VpCHvEWPlQ/Y5Kjy6368gtkq
         85SbE0/dSZHJRzSgb9wtYGFd+sPtxZ42uohJA0svK3vqdzYLgdLGQMORXbm8V/E/Vd1A
         SFId/fgrdLuX5zo4Gjz+8Ig6Bv4QJ66A53iG3aY6xD9d2sBZ6MsKHYIPJx8t5ArO2rvv
         WbDDTtOTLXKwbxVn/d0/o/gnOaNaTZpSJFk5wrdDiYsZrwdew3cCNsL+4HHhzl+cJJj9
         OtDg==
X-Forwarded-Encrypted: i=1; AJvYcCUWfMVxyG8ZBl+t1YYSWZI1uzwemq+o0s2lJ0cADRXCLm4G+BGM9dkPflCWGNvDJjH5cJ3WuemNNIhI91M=@vger.kernel.org
X-Gm-Message-State: AOJu0YykkHBPO5dsrGGwFLsA2waeVTly6K0WIK+0FxbScpWfZJNwitlM
	OwEdmdUs76P4N5W8AkfDXPP7YGuU4zf59BGdIf/rZO0CyHcS55YKTJdfdp1EDzFvrZl2zriDKYz
	+UtfVGmoyOExN5aIaecgH6YD6NXIzFXN45UfvRtS8
X-Gm-Gg: ASbGncuU0vcqX4aWnQYGQUo9QdCSLIk59uuxOm89Mw5XAc3+IxuXfNMrQnlbEVt2oHl
	lCFa+YCRMLQSRepPuUiAVQ9W0o3EtKZmwEPJtR9nCWh28XTp21F3CsyEwReVz7xPfz2GQLa7IIQ
	tHN4Qj3pjYAM+rUG+iRFdYA7s95HPRmHhQ62MQPbu/JoW9NZPebMuJNXJUMqblDx5Y3WOP3SB7
X-Google-Smtp-Source: AGHT+IFVysUrX9/RWGVD8jifme4FsJobwQ5MaMQpoCCukjVl5luhg+u6mLupYV+mhQR95neYD0HRetp3woSgDEpO6ag=
X-Received: by 2002:a05:6e02:1c26:b0:3dc:8116:44a8 with SMTP id
 e9e14a558f8ab-3dd88fc27f3mr702425ab.26.1748378027062; Tue, 27 May 2025
 13:33:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402211301.4153441-1-irogers@google.com> <Z_Af-KAKuOlqALH6@google.com>
In-Reply-To: <Z_Af-KAKuOlqALH6@google.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 27 May 2025 13:33:35 -0700
X-Gm-Features: AX0GCFutG5SackukbvsjFVPBuPGu8DTDm9ChuUzENA6lOgs8-Mu_3g5DN2PAm10
Message-ID: <CAP-5=fUiWm9kq2fhT-9+8LOmC2Yen9Mw2P8yPLTJH+nk83nmmA@mail.gmail.com>
Subject: Re: [PATCH v1] perf pmu: Avoid segv for missing name/alias_name in wildcarding
To: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 11:07=E2=80=AFAM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> On Wed, Apr 02, 2025 at 02:13:01PM -0700, Ian Rogers wrote:
> > The pmu name or alias_name fields may be NULL and should be skipped if
> > so. This is done in all loops of perf_pmu___name_match except the
> > final wildcard loop which was an oversight.
> >
> > Fixes: c786468a3585 ("perf pmu: Rename name matching for no suffix or w=
ildcard variants")
> > Signed-off-by: Ian Rogers <irogers@google.com>
>
> Acked-by: Namhyung Kim <namhyung@kernel.org>

Ping.

Thanks,
Ian

> Thanks,
> Namhyung
>
> > ---
> >  tools/perf/util/pmu.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
> > index 31f1e617eb20..d27bdf421c19 100644
> > --- a/tools/perf/util/pmu.c
> > +++ b/tools/perf/util/pmu.c
> > @@ -2060,7 +2060,9 @@ static bool perf_pmu___name_match(const struct pe=
rf_pmu *pmu, const char *to_mat
> >       }
> >       for (size_t i =3D 0; i < ARRAY_SIZE(names); i++) {
> >               const char *name =3D names[i];
> > -
> > +
> > +             if (!name)
> > +                     continue;
> >               if (wildcard && perf_pmu__match_wildcard_uncore(name, to_=
match))
> >                       return true;
> >               if (!wildcard && perf_pmu__match_ignoring_suffix_uncore(n=
ame, to_match))
> > --
> > 2.49.0.504.g3bcea36a83-goog
> >
