Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83245249E5
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 01:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738718483; cv=none; b=ds+oydy3orF0tkYM16L75tfNmOMxly2r1M2MPP/a4F+99TzASuXZ96WN2kKpdrBRK0EIy/HX0A5Hinqr+EbYzAEOT0EKrOdbM71gXdcg34U3eHT0PPL/sR1TxAXztu890xXBpPJi55sxQG9d2f2LxH0Iq6l3WTuLmMF8NnIU2EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738718483; c=relaxed/simple;
	bh=elxw/Cb3AinIJCEDdm2pNEMVJo2/KaPU9rV5QdCllag=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=XsDhTEigNkseZfpg7psAjTIx2S7mzqPx7ncdWqYWSKfBBd7uCaOIx9a6LIZPx/txSt4eU5yMG17aKganPtr4DvpG1KdaEVc9f/6kWAa0ApyOddbABbei9rf7TVeaiWcUa9aDrAXg58N5FGreLEbh8w3K4gnVDBLebfuqelX/9Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maine.edu; spf=pass smtp.mailfrom=maine.edu; dkim=pass (1024-bit key) header.d=maine.edu header.i=@maine.edu header.b=AWro0b6u; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maine.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=maine.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=maine.edu header.i=@maine.edu header.b="AWro0b6u"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6e42d9c092bso5999646d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 17:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=maine.edu; s=google; t=1738718480; x=1739323280; darn=vger.kernel.org;
        h=content-id:mime-version:references:message-id:in-reply-to:subject
         :cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KGJSA2M5r04qmcaGq4dBhsJp0m/yyyGoLMkkQDwhyIQ=;
        b=AWro0b6u21uc7TKEX+kDl42B4r3YepJ7O3dJdUW4/PRhiQvUlcIq/x/rPhItdzmg4r
         E5cHov1IIyVgl2khW7WduiYigQ8NGj5BwSicrAXKeZZTVIbPTyEPaFoe8uKcpFXsm04K
         WzJiYc2m/UJlR+1+0pzpepozPSn8jV9Pm0uCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738718480; x=1739323280;
        h=content-id:mime-version:references:message-id:in-reply-to:subject
         :cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KGJSA2M5r04qmcaGq4dBhsJp0m/yyyGoLMkkQDwhyIQ=;
        b=K3YCIIUpT2rrDZE8YgnNxRh9tL/WyTAPxdGZohrHRL9hH74wvcu7BItnP94Zn3mx5d
         /iBodeiR7bpAmKqHvb8ivwbs1sUb6WAXMwHPcahggIvYjriOvkwzToWstCvmiEV/LbO4
         KSE0ymsyRCkPepLKSmhxe9mhQ7/oi1PWphadz3U/6DiId2yeUxqe1AYQXCTISWAYVoV8
         z4SPUiYnPzp7H5bzUwsqdnxdYVKqZYU/Ybod1jnxG7eofEDogQMRnpY90FMJlg5TQhKw
         MYKg3rTeoCwVOv+VCUpjmSVAi4z7Hj5qH5dUheAdS3rpvAXjotSpzgvIX05EG29BfLkb
         eo/A==
X-Forwarded-Encrypted: i=1; AJvYcCXfEbkM7kzqfsRrCLXTsFRuJW0ECH2W5bcsqDmvdNvqf+YqivsgaQz2DhgsWrtFnqrdC1gr3tGYnQRJ5gA=@vger.kernel.org
X-Gm-Message-State: AOJu0YztgaF8enyFfTRLmPg24XI9wkYVeyALytzHUanalHEp13Ut/It5
	VkUahWqfA1KtncoFwz2anz7UFOs9BdefHedJ9g81Oo+rjq11FiQvv9Tm0UmGJg==
X-Gm-Gg: ASbGncv7rLd/rRwcY1b3KhAiG8b5ayI1bivQzwi/LaTZrPOC53U81tf2HCjSiXSfI9d
	p2XVxlFOlv40X5RcM4urSwA3BUVGLrrQPRN4WgVBORVR38zPBHiR93SBzWcOKXvSmRzTFJK4kCd
	FQv0OtqAyCv5+OViTcjfKFNRbytJ0pG/zp13yfAYcN5yo2hxbZs7hbh3TGfbfDTD/c9SErXwaP0
	xYj7DQQ5kM+xplHyTg10EHltzzwZWjpLRdwn2D7CQw38SxaUhnJFKXWjrczkK9sMNIRhW/AEVsi
	GqSMaQBzQfhKFtnuXXspNFhUp4DhsQ9WM2R4hQ==
X-Google-Smtp-Source: AGHT+IFoe/TwfVNIRmGcd79B7JiWTpmqXMz7rGfR/u4epwE1xo9o8V9cAvnDP5nb9bLhDFTGF7TdUg==
X-Received: by 2002:a05:6214:252f:b0:6d8:876e:ef41 with SMTP id 6a1803df08f44-6e42fbbe225mr19067016d6.21.1738718480240;
        Tue, 04 Feb 2025 17:21:20 -0800 (PST)
Received: from macbook-air.local (weaver.eece.maine.edu. [130.111.218.23])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e4279e0ae0sm11939866d6.107.2025.02.04.17.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 17:21:19 -0800 (PST)
From: Vince Weaver <vincent.weaver@maine.edu>
X-Google-Original-From: Vince Weaver <vince@maine.edu>
Date: Tue, 4 Feb 2025 20:21:17 -0500 (EST)
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
cc: Ian Rogers <irogers@google.com>, Stephane Eranian <eranian@google.com>, 
    Vince Weaver <vincent.weaver@maine.edu>, 
    "Liang, Kan" <kan.liang@linux.intel.com>, 
    Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
    linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
    Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
    Arnaldo Carvalho de Melo <acme@kernel.org>, 
    Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
    Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: [PATCH] perf/core: move all of the pmu devices into their own
 location
In-Reply-To: <2025020444-savage-latrine-0c31@gregkh>
Message-ID: <97541134-7c32-94a8-7642-a82f3292dc38@maine.edu>
References: <2025020304-chip-trench-4e56@gregkh> <87pljyyx68.fsf@ubik.fi.intel.com> <2025020426-spool-refreeze-2870@gregkh> <d689243f-9b25-40db-98b6-e032a6b27c62@linux.intel.com> <2025020408-apron-fled-d29e@gregkh> <6edcf7f8-d496-524e-2250-49284dfb55e4@maine.edu>
 <2025020447-gyration-wireless-f7da@gregkh> <CAP-5=fWT5J0svFsA-jqvE4P=NnTdrsKPF9x6JHkUEDp-vBd_1w@mail.gmail.com> <2025020444-savage-latrine-0c31@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="-1463802360-824231151-1738718361=:1323835"
Content-ID: <d47ac0b9-659d-2821-602b-44ae00b9f0ea@maine.edu>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463802360-824231151-1738718361=:1323835
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <ad06df10-0d54-9425-4385-e5dfc731d79b@maine.edu>

On Tue, 4 Feb 2025, Greg Kroah-Hartman wrote:

> On Tue, Feb 04, 2025 at 09:49:55AM -0800, Ian Rogers wrote:
> > On Tue, Feb 4, 2025 at 9:12 AM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Tue, Feb 04, 2025 at 11:41:38AM -0500, Vince Weaver wrote:
> > > > On Tue, 4 Feb 2025, Greg Kroah-Hartman wrote:
> > > >
> > > > >
> > > > > It seems that the majority of the perf code IS looking in the correct
> > > > > place, just mem-events.c seemed wrong.
> > > >
> > > > I hate to tell you, but other places in userspace are depending on the
> > > > current setup.  libpfm4, used by PAPI, is looking directly in /sys/devices
> > > > for pmus and will break with the changes you are planning.
> > >
> > > Then that too needs to be fixed, sorry.  Again, devices can, and will,
> > > move around in /sys/devices/ you can never hard-code any paths there.
> > > Any userspace code must ALWAYS be able to handle that, that's a sysfs
> > > requirement.
> > >
> > > And do you have a link to the source for that code?  Good news is that
> > > if the code is fixed in userspace, it will work for any kernel (old or
> > > new).
> > 
> > +Stephane Eranian
> > 
> > I see use of /sys/devices in at least:
> > https://sourceforge.net/p/perfmon2/libpfm4/ci/master/tree/lib/pfmlib_perf_event_pmu.c
> > I imagine it isn't a big job to clean it up.
> 
> Nope, all that has to happen is this line:
> 	snprintf(buf, PATH_MAX, "/sys/devices/%s/events/%s", e->pmu ? e->pmu : "cpu", e->name);
> be changed to:
> 	snprintf(buf, PATH_MAX, "/sys/bus/event_source/devices/%s/events/%s", e->pmu ? e->pmu : "cpu", e->name);

it doesn't matter if it's a one line change, your proposed change breaks 
userspace.

I thought the rule was Linux didn't break userspace.
Has that changed recently?

libpfm4/PAPI are widely used and deployed and in some cases possibly 
statically linked into other projects.  It will take years for the change 
to filter out to all users.

Is there a technical reason for this proposed change of yours, or are you 
just arbitrarily breaking userspace programs because you think /sys looks 
cluttered to your personal taste?

Vince Weaver
vincent.weaver@maine.edu
---1463802360-824231151-1738718361=:1323835--
