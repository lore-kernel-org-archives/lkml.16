Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A2614A0B5
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 17:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738691409; cv=none; b=ALDZVdfCM2DYg05ic50s0jPLdx7UnDxRCtlvEPZa37Ws91YHNqqND5yPDSfOZmGJ0gni6IKgGR0j7FeqEnNfByPB3emDBl9v5jZtslPqKrFuMwuDXIN7VDwpdyk3bUzBxggNnR2aa2Cjpih8TrMaom6vysbhbR+h00vKeJ3jhyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738691409; c=relaxed/simple;
	bh=e9lXk2KILvMrWAeBCb5anAWINuB4KplwAt5cSr6oTpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KYwtJdd6JAUtyNI1dm/xgcDtXrQlV9rOfHTC2muTcqomz4NmqedhYYhsHriWQLAzo9o92pEWzO6j78YyJaHbcwxfbPeKiQvJ7QRQgqFGPjJof3952d4I/rcfrSfxGWlWFHi4PvIUFetLbBPTSa8vt/WpHAJSn/6twxmf1NO1xFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i/ALBM7K; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i/ALBM7K"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3a814c54742so170625ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 09:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738691407; x=1739296207; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dXY9WAEJPwalZKXt5PSHz3ksNwPYvzUFx1AjklywXew=;
        b=i/ALBM7K6FhY5d7da18+TZszr6w1j9tEETgzo6fe3gJaR9JdUU2OG+FCHpafCegYaG
         OeAZDIVyn8lkB3VJ63X7atHdodE/xgYHX+ObTZ7PeRdApyMy0sw+lQOuc4FGklMt7yIN
         8SvdEN4B0y7JeQ/fvWGGHqa/kksDcmuZYVIUhGHp3eVML9V4ZAbu/vb5Cq7S2hTQyQSq
         6xWQypeckvs5DYlbo09fFy7D5XZBFy2whgmbXofeKyX+KwTt2VyuA4pFS1V7jaw+TWUc
         O+gkWZVW6ThbNJ21kz2bUUu46NCeZAnI+iGptVHb3HQQWPZxGuLl2LcjfSANcj68aHjz
         bARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738691407; x=1739296207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dXY9WAEJPwalZKXt5PSHz3ksNwPYvzUFx1AjklywXew=;
        b=C89y6TRwsooJWyjJHSAmx2pfB38kcKDrrOOfN+I9fFL1eObz8tSrVP2Db7cLlYj3o3
         D92cxX2mUej5NfqvolFUezKhOPn5+hGGA7pee4idkWoYi49SA0cYCFC0PhHyeM7QVfCz
         nleoyUFZk31T1mDXRx4ZZO2K9nuCet/6a9cPJ6Urxqg1pk68EirH6p0U93Anssep6wXh
         sjTJug+lTZbPDMhOOLLoWGhYl/rI6WaOQMp1qyzqueuu3NAIQkIbAxQXbZrjsNaPgBfH
         ZL68AEwZE36qbbKAuUr7MC5TZ6VxUqtjAZ9Htg+MzaCfUunl2KC7n6HfH/OGuRrkkB6N
         zggg==
X-Forwarded-Encrypted: i=1; AJvYcCVwDtEqpc3qqwpNGhPX7QZsaO9XR/naiCaoiPs3BJDAn54t9R+/l2A3/p432bRGWaFsY/8PAT2MiaNvOCQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOtFnijRRePeAoc1P1b00Z2dvmP1nxxc1Z/I/ZulzIZyGbtau7
	wJWeJdj0iWtC0c1TVHds3AE3kyYZknLf+YCty1brdGcjH4n0TN/8b5IPu5Xjr9+XsfSkfuWF8+I
	IOwKOpj1ca4vwrZBN/jIn/sADS0ACQuw1jjjv
X-Gm-Gg: ASbGnct3fcEGx15o1PTadnn7r+HaNyp3oR3eIpnCEbsgXzGXenarmp/z9AA1TZWitVM
	bHhMAfzyTgiUHd1xIMEzXtGxZMz1/BNgL7UV1VayCfH4wiNVbsGQOSB/CT/UlOQ1R4FoS+FG5Xq
	qdXj60uDoLRELkbFzKBnwMiSM=
X-Google-Smtp-Source: AGHT+IFTRfRedM8Hrqvn//iHW8JZF0D7oHcsYTwMHHSYCjttPyU6Am1/z8FDdTDsPZAay61ZfVic2tlmrAYU86w24no=
X-Received: by 2002:a05:6e02:1985:b0:3a7:c721:57e2 with SMTP id
 e9e14a558f8ab-3d040f65d20mr3285835ab.21.1738691406906; Tue, 04 Feb 2025
 09:50:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2025020304-chip-trench-4e56@gregkh> <87pljyyx68.fsf@ubik.fi.intel.com>
 <2025020426-spool-refreeze-2870@gregkh> <d689243f-9b25-40db-98b6-e032a6b27c62@linux.intel.com>
 <2025020408-apron-fled-d29e@gregkh> <6edcf7f8-d496-524e-2250-49284dfb55e4@maine.edu>
 <2025020447-gyration-wireless-f7da@gregkh>
In-Reply-To: <2025020447-gyration-wireless-f7da@gregkh>
From: Ian Rogers <irogers@google.com>
Date: Tue, 4 Feb 2025 09:49:55 -0800
X-Gm-Features: AWEUYZk3nRfzq951X9O4C_tXcKqwof2dziDIaNme5_Y_gVu_IZvGD-ODLAPYLVs
Message-ID: <CAP-5=fWT5J0svFsA-jqvE4P=NnTdrsKPF9x6JHkUEDp-vBd_1w@mail.gmail.com>
Subject: Re: [PATCH] perf/core: move all of the pmu devices into their own location
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stephane Eranian <eranian@google.com>, 
	Vince Weaver <vincent.weaver@maine.edu>
Cc: "Liang, Kan" <kan.liang@linux.intel.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 9:12=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Feb 04, 2025 at 11:41:38AM -0500, Vince Weaver wrote:
> > On Tue, 4 Feb 2025, Greg Kroah-Hartman wrote:
> >
> > >
> > > It seems that the majority of the perf code IS looking in the correct
> > > place, just mem-events.c seemed wrong.
> >
> > I hate to tell you, but other places in userspace are depending on the
> > current setup.  libpfm4, used by PAPI, is looking directly in /sys/devi=
ces
> > for pmus and will break with the changes you are planning.
>
> Then that too needs to be fixed, sorry.  Again, devices can, and will,
> move around in /sys/devices/ you can never hard-code any paths there.
> Any userspace code must ALWAYS be able to handle that, that's a sysfs
> requirement.
>
> And do you have a link to the source for that code?  Good news is that
> if the code is fixed in userspace, it will work for any kernel (old or
> new).

+Stephane Eranian

I see use of /sys/devices in at least:
https://sourceforge.net/p/perfmon2/libpfm4/ci/master/tree/lib/pfmlib_perf_e=
vent_pmu.c
I imagine it isn't a big job to clean it up.

Thanks,
Ian
