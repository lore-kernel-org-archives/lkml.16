Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AB42882DD
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749653846; cv=none; b=t86LZ1SgD7Og82nwI/elr5oBSOG+QwtUgHZ4aTfUrjvyMbLbgcJXEBcRSK6qe51p1B7KkMGdmRbaNZCTuJ3b/0OdqzVHPZCwtMDVS9HRGdtG9RZv1dHK3fhk+rTQhbnwvV+A3UKoLvV4TUKvKA9g5G9lIGR1DX8H/DyNiM10hsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749653846; c=relaxed/simple;
	bh=ELj3Eejh8zZB55e7jcM1QY1zMfyaK6qINNEc1hne0DY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=B+3kTxkoB6oUeeGV/tLcMcTXVJWM19l2AOUapYSXwC2BY+Lr8+I7kCc+FSKvdNk1qFDXbkzePcY4R/cTqAF/WJIUcEgsaRLESOyiesPAJ+Nhc8g5ejHR99oT9SzXHhz2Lnzw47DhUou+cgwKmG+eA40WknayCg/MXy9Y1N/ZAxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maine.edu; spf=pass smtp.mailfrom=maine.edu; dkim=pass (1024-bit key) header.d=maine.edu header.i=@maine.edu header.b=ej6Gkzlf; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maine.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=maine.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=maine.edu header.i=@maine.edu header.b="ej6Gkzlf"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6faf66905baso101033096d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 07:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=maine.edu; s=google; t=1749653844; x=1750258644; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=E6Qz0T1i5QiFEXMgdpN0GXNYPbCCjSkcApaqYIRUnfk=;
        b=ej6GkzlfIdRRSDfsQfLzR4KXe18v0X/ORZ5BvP4vzItPvpdFGt5PAAnYyRlIVMGhC5
         OaWDVEvuFh94f+qsJ5kafar2qbDvPRvzsHDFTeCaEdvolzPg+uhJ04Qp938kBY8NBvSa
         fBl+5l/p9FcojlgI+r7xdZ9SJ487ZHEJrrah0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749653844; x=1750258644;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E6Qz0T1i5QiFEXMgdpN0GXNYPbCCjSkcApaqYIRUnfk=;
        b=tkfNZfSgCT0CrlkQb4SCadGHFKh60q3wBv+PlufKKVwPb6lXPoGpEFlGhBL27KWCmx
         xGPGkSqk3vois0QD+V48joW4//mSUO+zEXCCJOJbHx6c24XWnTT7OuO0Dak0nI5xnMzq
         v0SZ/5ula9Cr439C+qf1rZ8pH+aPyxN0H+1qTATXlCyZtTI5LEUnNVfO0DUC55m02uvc
         pLhZ759U7JqePo17BScEz6x7We/TDrdpCjVEy2H5KTnpgriQ4uevYGxnMB6WGejg+DHN
         d6gxll0wr3vr5UqyN/DhXeqSsVE27xkR+NZgc6c10nqaXZUFqAQ8PYYqbqg0YwusgIXd
         S1Jg==
X-Gm-Message-State: AOJu0YxCb7E1S+WuplfTxG8S9UjZLpZaqBzHhpT+AgjKn1L61bJND/+e
	8UAXEgvYdUlEXDRTyTTlb4wTpoOVugcgr6Lh0/+95Po4SgNz299vNG5gokRGUaFezA==
X-Gm-Gg: ASbGnctSLJc6rzyl9DJ8P0N99dJ/6lteBlgPrfKtgQtwUdHRttCPURwgbI1cMepuWcx
	ufCzbXoUbVt+OMFLqW1c6RqylOQbRE9rHAl+Y4wpSAlEKa0SP2lFxbGUgKjgxJ/t+58Sb+yDf2R
	guvqrTAMYvCnGsAv7+2zu6vRJ77DtgNZsDurd1RiMjo72UjVGTepzSL9g4FGvPckpqS/r4VORuP
	IWesJyxBTyA2j/weD6//Yq6FNtCc4AfpHEEo6dDpOUorHLiVLLAJdH0xNUW9B5n9+hAC6vNoe7S
	WzNN46i6ptB3i/H9WOzPWi4O5Lkedm4YLwugM8wPaLswcVVERGBAsiBXV371RVV7o8imyVDTpy/
	4aCODtA==
X-Google-Smtp-Source: AGHT+IEw7wk+RzMxqv25pZXw2YGIKgdnXxzz3CvYscPGSpMRH5hHiPD652+vsvjKuc+tm1+2B7BIiw==
X-Received: by 2002:a05:6214:2626:b0:6fb:25f:ac78 with SMTP id 6a1803df08f44-6fb2c386dd3mr44270966d6.40.1749653844011;
        Wed, 11 Jun 2025 07:57:24 -0700 (PDT)
Received: from [192.168.8.146] (weaver.eece.maine.edu. [130.111.218.23])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb09b36647sm82322106d6.113.2025.06.11.07.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 07:57:23 -0700 (PDT)
From: Vince Weaver <vincent.weaver@maine.edu>
X-Google-Original-From: Vince Weaver <vince@maine.edu>
Date: Wed, 11 Jun 2025 10:57:22 -0400 (EDT)
To: Vince Weaver <vincent.weaver@maine.edu>
cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
    "Liang, Kan" <kan.liang@linux.intel.com>, 
    Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
    Arnaldo Carvalho de Melo <acme@kernel.org>, 
    Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
    Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
    Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
    Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: [perf] crashing bug in icl_update_topdown_event
In-Reply-To: <352f0709-f026-cd45-e60c-60dfd97f73f3@maine.edu>
Message-ID: <080706b6-ed21-540d-dfae-ae27d130d796@maine.edu>
References: <352f0709-f026-cd45-e60c-60dfd97f73f3@maine.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 11 Jun 2025, Vince Weaver wrote:

> Oops: general protection fault, maybe for address 0xffff89aeceab400: 0000
> CPU: 23 UID: 0 PID: 0 Comm: swapper/23
> Tainted: [W]=WARN
> Hardware name: Dell Inc. Precision 9660/0VJ762
> RIP: 0010:native_read_pmc+0x7/0x40
> Code: cc e8 8d a9 01 00 48 89 03 5b cd cc cc cc cc 0f 1f ...
> RSP: 000:fffb03100273de8 EFLAGS: 00010046

one additional note that's probably relevant, this is on a hybrid CPU 
machine, so CPUs 16-23 are atom cores that don't support topdown.

So the crash is probably because for whatever reason the kernel is trying 
to read topdown events on an unsupported core and triggering a GPF.

Vince
