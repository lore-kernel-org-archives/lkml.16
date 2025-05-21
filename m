Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5239E7080D
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747835307; cv=none; b=vFk8eSxexM0Dc/1Eb4T7krBHyldnaOlPrtcxwx9mqNtQhMRDQcKjCHzpf+TUlDtF+CdUC57fDlfEAsGU9TCMYp2bPrsKqyWtLxmA8vtrbTnBdAQtCi8wjKtAaO2GnyGcTg1DXAdIvg/5SN4Cw28b0cl98pAgJ3iLfeKwFNuGxRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747835307; c=relaxed/simple;
	bh=tZmrPtKq9NBVoM5sBtvwoKj+O3b1ayp2YkLwz3fWz20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H0/LuNm+me6T3VLTalT7TxeZKIA9jO4KEoor2hxif/dZYZAX4wc+NUPIS2v+8RhnuXAhDXFBl+1mH9srkLGXfXjnQcCPD757NPA2fuvIhDBOKWwGRzI1MEDMl/bNtZ7vPdnW2Jn3FelR/HzakIb+tGX9aOrTqAY3N/iqGY+cjWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kEhabt9I; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kEhabt9I"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3dc8897f64cso63875ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 06:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747835304; x=1748440104; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OxlheM5lEmnt1MM3GdEBAW8Kn3rstbnprh4CdxgItUw=;
        b=kEhabt9ImR2tn5SvWAg4t6OXdLJUgE8Ey8sHRdvth91oNO2UIyPn8ZiUAZODa7JASm
         H4U1t5huxudAmMP8vIkcOr/1nBitsP38rPt2qa9TC2GeTT+xTxxI9qeh1FUtCFiJEBuL
         UiNcXTKWAB1wotghO1eyYa38fhfn8b4p4mPu/axSH9PkbeLnqVWLwDnG2RgPg0eQ+jPg
         JepPxB72yYx/nUyAwcLgMIkRD/y/SPHP9hxPWyoNQoUFjUV2fLQphaWBEtCjZoYMz7gX
         0Wmilvn6zbtUTmQxmg8kUN/yIgvCywMkli4b7GUHEW6iL+fzpvZx3g9joG76vxjy/Aqo
         nNkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747835304; x=1748440104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OxlheM5lEmnt1MM3GdEBAW8Kn3rstbnprh4CdxgItUw=;
        b=j3eUidNZmasjif0t8LPQ9vTfQoOBn2TamoDih6E4NotxicJloA6WiNwqsqmZeNLuEc
         3Avoq9Z6rj82TmKyrZlGKvq/o9Bz3J1jLuzSRck2bMgNDmrcQcG/DqfTbESKDOENpM/q
         08CQz4pZoLR+T0GsBWFnvcqghxMcejrJ0y/RWGCSaMSRXXOZgEq7XJfQ3b+nSE1ERoU0
         qLQfmIGiZxCtFD1yfp/hMyzx8cdTee9d1zVmPPJtZJ8rahTnwVWaymv6bOkDQpErnZQZ
         5wTPS586r8ZBuKS1GMJhLpmBR7/XIP4D3FsHhYSkH6qUXuWiFjYGHiiqVMWNCsScsqZe
         SGsw==
X-Forwarded-Encrypted: i=1; AJvYcCWbCx3iUkD2/yFtez/tD4a8zsNwxjlr/SxS4yn1lV8j8IG9eYGL1Xz4zbG7TBPoruAMKjeNB5JY01JCYWI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDgdek+eOmdV6S8+WfsMcGMiNHfVBAfL6B5CuIfutO2UpXEBKy
	649Kwg7klPuU7HcZWKnzx0xqe8+jubdmEdALtNDFXvNZKbcHG5WHM0Y8Eu5nSAVONq7+vtqsWja
	R6Zw594zBtzWsl+a9h52xMLP4ZWtDkPWvj0WHK914
X-Gm-Gg: ASbGncvU+QmCsR+j99P1R8SUIoWsujWEuk5MNMNe/3miKyEt1xc8z2/yEvV0u9Cap1i
	ZyUCzgxJDDz+PDa4Y/fIJECcrfHXebs2cn3X/fmZx/V9yVWOa+4rdp+ehy+qnv1y0E72PXN+qIR
	U8hyy7KHNsCgQ3wZ1CSkHUwUQAFu3drsYg2AEuMOHP6Og1
X-Google-Smtp-Source: AGHT+IHeC3oqFSgaSqVqnlVsrRLoNPF0gPsQUeBcI7ysFF8RkEVB62BJa8yOpnMhrjZ5pr9UqIZimBxfrtcYIG88gNc=
X-Received: by 2002:a05:6e02:c85:b0:3dc:7faa:e939 with SMTP id
 e9e14a558f8ab-3dc7faaecb8mr5109685ab.23.1747835303953; Wed, 21 May 2025
 06:48:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521052029.658800-1-irogers@google.com> <20250521052029.658800-2-irogers@google.com>
 <8f162665-be8d-4299-9442-a677e935999b@intel.com>
In-Reply-To: <8f162665-be8d-4299-9442-a677e935999b@intel.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 21 May 2025 06:48:11 -0700
X-Gm-Features: AX0GCFugq0Va_fvHZm5B5rFZ2v7ADlvXVfexnQfQqaSFfsH3ZJYnUqpKCOmjaGc
Message-ID: <CAP-5=fXF89BsMy7OTh5z4tc1Sxk-mua2LgaZRCsaFQTpR_SHyA@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] perf sample: Remove arch notion of sample parsing
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Kan Liang <kan.liang@linux.intel.com>, James Clark <james.clark@linaro.org>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Ravi Bangoria <ravi.bangoria@amd.com>, Leo Yan <leo.yan@arm.com>, 
	Yujie Liu <yujie.liu@intel.com>, Graham Woodward <graham.woodward@arm.com>, 
	Howard Chu <howardchu95@gmail.com>, Weilin Wang <weilin.wang@intel.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Andi Kleen <ak@linux.intel.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, Matt Fleming <matt@readmodwrite.com>, 
	Chun-Tse Shao <ctshao@google.com>, Ben Gainey <ben.gainey@arm.com>, Song Liu <song@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 1:14=E2=80=AFAM Adrian Hunter <adrian.hunter@intel.=
com> wrote:
>
> > diff --git a/tools/perf/include/perf/perf_dlfilter.h b/tools/perf/inclu=
de/perf/perf_dlfilter.h
> > index 16fc4568ac53..ec154fd937e7 100644
> > --- a/tools/perf/include/perf/perf_dlfilter.h
> > +++ b/tools/perf/include/perf/perf_dlfilter.h
> > @@ -38,7 +38,7 @@ enum {
> >  struct perf_dlfilter_sample {
> >       __u32 size; /* Size of this structure (for compatibility checking=
) */
> >       __u16 ins_lat;          /* Refer PERF_SAMPLE_WEIGHT_TYPE in <linu=
x/perf_event.h> */
> > -     __u16 p_stage_cyc;      /* Refer PERF_SAMPLE_WEIGHT_TYPE in <linu=
x/perf_event.h> */
> > +     __u16 p_stage_cyc_or_retire_lat; /* Refer PERF_SAMPLE_WEIGHT_TYPE=
 in <linux/perf_event.h> */
>
> Don't rename dlfilter API identifiers.  It will break dlfilter
> compilation for anyone using the old identifier in their dlfilters.

Thanks, I will fix it in v2.

Ian
