Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC961D89FD
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 19:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749670126; cv=none; b=S8WR/jcWtph4QPp8CRTZHlWU9Q54HWhxEht5f6dmEUC1+97QYGHNG+ZU7VMtUIuDw7kUSv3SKZvq7gZ5xIXy4NIfC0fsVZJrm36wD6wTyg/e9BI+WyKliQqqkafhexbCRBz9OoaSjeywst7Vu33Kd1/2G5C9i/p3AvQe01EDjc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749670126; c=relaxed/simple;
	bh=FHSJKbaVsXnpai4AZoxw4CdJRiJHGiUPSXPDotRSaxQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=KsyoX8yWfj3g71ZKOdgSt39jLmhOxHNLnN1jNRAtkDXVGlOHiKXBYffrBA0GELDQvfNVkKGguMA+JvMQxElOdZS3nWve37CzLeMrjWVbMLY5lzxJGN03JaJO9SkM82D5cgjJyXQ9Z4H4AkQ59PyB0o43l5LeDRWtfKhApszrqZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maine.edu; spf=pass smtp.mailfrom=maine.edu; dkim=pass (1024-bit key) header.d=maine.edu header.i=@maine.edu header.b=c4e69sE0; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maine.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=maine.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=maine.edu header.i=@maine.edu header.b="c4e69sE0"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7d38b84984dso32147885a.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 12:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=maine.edu; s=google; t=1749670123; x=1750274923; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=InneJdZRcVVlaPFNnewjOZhPI90vEkv+Lpgu7MYMxe8=;
        b=c4e69sE0tvBZOoQG57WwWclkuLyMwSKKw/mmKSqRD1ih56VgmqGmtxgdTDFOhL1qZB
         f6VhE2JEkSY8fMVUgUFfolngH7qOHrrHYfmozG0TdZPJA1J2KrYCPiVM04lJPVreJuTu
         vNdUpcwBbXsmcioHEETZhcs3lcxMl6ZwbB5ZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749670123; x=1750274923;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=InneJdZRcVVlaPFNnewjOZhPI90vEkv+Lpgu7MYMxe8=;
        b=NB9OoKjMljbE01spPLKNQWwTleJJLmF3mxc2eSp0NzcVBSu8jEBUNSZTH2aSIILqw2
         ss6D/QlyFQJYL4E+Ar0QtM1edo/CweYHQrD0w0bGOPnleaE6DfitV0fc6ddGwvdFuLuU
         v/tWKXxwFrWULB7Rvv1KUC/QRrcdOuXYbKBc4r1WhKTu3WX+/ZT6n5Tv5sDHgBif/eK5
         0JmeFkbeAuDjOG2fA6f3w1pMqdV/P27IzAjynZU8SPwHpYyGCRF9Ds6ICSBTbpWjLhEs
         D6ASDXrpxBXSDvrSxmhY4wF+fAoMAshSPpyS3CAxGbnBlPhyaBZ22/hEFbJ5OWJJ7U8E
         dlXw==
X-Forwarded-Encrypted: i=1; AJvYcCVutSOpthXUxEWajE+A9Rma+le0EX3f6IqLt/Cmt66MpT4lGNFzAOvUduSmWMnSSHMRBDz3wmJs0RG2QzA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzCn9S9YxKIQNhc+Vy7WQrCW0Twjh5znyoarYR1Mm30Oh0lK59
	TVZGvWTDP69jmOYlXv6KRJ4FMdMQI6hgcy54ZSYl6VK2HocwfwzBLYMb+KCcA6up8mhpCqZ44GZ
	uBQc=
X-Gm-Gg: ASbGncsVmHd2q3ELs5skfItQPdEllZc1V5yjOPYFx1bnu7LjNY8fR6WpawYHGBPG5zl
	5fNGL2joMIVvFyC5WrB19LLBuXR5LRPFz4eDYkT2yoOhU2p/JGqK7804pHBY/w4bVpfl1Qo5Rwc
	pWNRKFq7YDXPG1/R4W+nZ2DJtPMh2T4YJv6YKzGrs1UA/p1PbmTXiEj8nD16pKTnMRCX8UmszIR
	rEiAJ8MJsmtAw6Efvc5JR+0nYB1MgqXX+T17DOteyQwheL8pg+fvxaRsVV816K75ciDv627+gzp
	IpJNF1YM5OxDKtQcr2YBK8luY5tzYtmo23wTYu7bbnpjInsuI2LL+jq0jPNY4nMG9VUW+CMGWYV
	HDF1RZQ==
X-Google-Smtp-Source: AGHT+IE6SoauonDa6W5DSM24sCvdDwQpN7IJnm81GX21ZWGOaPczOVEPXw9rzsmF/TsIAaiVA3vGjA==
X-Received: by 2002:a05:622a:1f91:b0:476:964a:e335 with SMTP id d75a77b69052e-4a7229ef9ffmr12316091cf.24.1749670112144;
        Wed, 11 Jun 2025 12:28:32 -0700 (PDT)
Received: from [192.168.8.146] (weaver.eece.maine.edu. [130.111.218.23])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a6f5c7a22esm64211531cf.54.2025.06.11.12.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 12:28:31 -0700 (PDT)
From: Vince Weaver <vincent.weaver@maine.edu>
X-Google-Original-From: Vince Weaver <vince@maine.edu>
Date: Wed, 11 Jun 2025 15:28:30 -0400 (EDT)
To: "Liang, Kan" <kan.liang@linux.intel.com>
cc: Vince Weaver <vincent.weaver@maine.edu>, linux-kernel@vger.kernel.org, 
    linux-perf-users@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
    Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
    Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
    Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
    Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
    Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: [perf] crashing bug in icl_update_topdown_event
In-Reply-To: <d8c64a21-ed4e-4d37-8d4b-9d3a9857b7fd@linux.intel.com>
Message-ID: <704f6604-547b-f7ca-ad45-2afd2dd70456@maine.edu>
References: <352f0709-f026-cd45-e60c-60dfd97f73f3@maine.edu> <080706b6-ed21-540d-dfae-ae27d130d796@maine.edu> <d8c64a21-ed4e-4d37-8d4b-9d3a9857b7fd@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 11 Jun 2025, Liang, Kan wrote:

> 
> 
> It seems an regression from the f9bdf1f95339 ("perf/x86/intel: Avoid
> disable PMU if !cpuc->enabled in sample read").
> The commit merged the intel_pmu_auto_reload_read() and
> intel_pmu_read_topdown_event(). It's possible that a PEBS event 0x0400
> runs on a ATOM CPU. So the PERF_X86_EVENT_AUTO_RELOAD is set for the
> event. The is_topdown_event() also returns true.
> 
> Does the below patch help?
> It checks the PERF_X86_EVENT_TOPDOWN flag as well before invoking the
> topdown functions.

With this patch applied my test case no longer crashes.

Thanks,

Vince Weaver
vincent.weaver@maine.edu
