Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05B3299A83
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 16:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749744516; cv=none; b=HFmWNSSWTOqgQLiDkdHIguG4jrL4BZi1dSuzZ4KqygDGG3V/cbHp8F1PAmzKWDCi4rIEaOAAF7dKwtoC1ZrYTPKpeaGMkwvJnxtw9K4f9vY2inRcSNoa6PxO8cpE+5k5nGzyIGQzTiogfVRVXvFX6oAitfBfo5Ps+jKGr/aZdxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749744516; c=relaxed/simple;
	bh=3YHe0k+PHvEsag+VHa9+YZ2Q28Kjv6z7VRpUu0X/shE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Jngp7LsmE9z548ot4SfDGssOvdERaZ8aUAz/2xSg+TqDjnFwYwyVPVeShF2SSuhrir8DfbjUGkU4FarHOla4Jz465qSiUk9kXh9c6oVCu3ZrrgXy5kMlL5br861zzlBGJVpXdZAKAmNd6kkgShy1+zw6CBHXKZECeAuvYgeVYVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maine.edu; spf=pass smtp.mailfrom=maine.edu; dkim=pass (1024-bit key) header.d=maine.edu header.i=@maine.edu header.b=M4bFyDfH; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maine.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=maine.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=maine.edu header.i=@maine.edu header.b="M4bFyDfH"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7d0a47f6692so117801285a.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 09:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=maine.edu; s=google; t=1749744513; x=1750349313; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dx0ZwLJ3SW0Kae1Wt1XXglLI6wwCOsqp87Ybf6szzLc=;
        b=M4bFyDfHOqJwPpeqpWCF/I0k4egrkQcdtKlGytp19E+D7SO3nvnrOzBtVtj9L4dJw+
         Flr0melE01T0xju2qND+PWyiMSRBmC2pvInu/HvdBwX9yzzHt1ngavdQV/EC0p1PvNFm
         /5UH5Ri79WDQg1IM+TftiGuHJQx/5oYwZ+aG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749744513; x=1750349313;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dx0ZwLJ3SW0Kae1Wt1XXglLI6wwCOsqp87Ybf6szzLc=;
        b=R6+BT2LCr3qSbFOWPHQdv91Qp2nYzrhP2uhRfDELiw+bcEQT7Yd1FwejZ0p+oNbI11
         87GYh1xqhLNJAjv2qW+da3mvukVup5H7Bm8bvS1b5IW5qQdUpjsaWNRyVoRy6jx4mQtC
         8H0MjovWAVsjWAdpb8t6n7y9pdAmRU5PK3X9Fh4q5na+bPKTKgcmdM0jpZ2VJc+1ZqTf
         FkRF5s9CsZ/lQxyfvrAjvMaTRPR9mmC0UApJ9NvX7mnXJfklbbxKg0c+S5OUndAPZ5PV
         ssRbDwlEdEXYeL+Rl1+CmnXXAxRbKDjZCY80K0VTY6QGhR7cR5Ao0fM8PZlrOQ32LVIs
         M6fA==
X-Forwarded-Encrypted: i=1; AJvYcCUSOiLlnU85ayEXqznvBaC+58GV/DXuRCqKJweGD1ZuJdnqvpfgGh+/s3A2yocD7TOrnbfXr3dY5hyOcTw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwW0RmwGqA9PPjVl7E0iZsCWhe2YGkRSfgPQs4C0VzQXrLANy6r
	jecfssZLLD7WXMGGCOlLCmKToL0aZ58vtKti2fqlGDMS+fEZGgEiaTzpSO01nXXMfg==
X-Gm-Gg: ASbGncvgbQ8J3+STAAKZUCDFF1Sxg2EdzaVnRmaJH0PVp6JdHzvJynugvHgyEcg/18x
	HvccRyUq7hZoLJVHpBjNgwUBpBTktultCQurnj1eQdGMzlXbFySFr8Y6QoP2dAy09UldLKua+KW
	NyOmZT2ggDqYjFZdJ0HqtGjn8bh70WwyDL1ERa9tWsyN2tip7BEKNPWyUbQm5AunnX75ePEhwkW
	Nj662DSLvl6lfm56mAMIj9hs0Xx98nJPjnGwCJr+8H/n3sbLX0tqK1dVtlw48Zl/2lnshDspwhL
	zlcavGXpnPcHtDDEJzswuG/Is9O8bxcbPXn6o4qQ2suXfGXk7UPWDejG/39y90jEaQ7FgDswPsf
	Wgpd9Cw==
X-Google-Smtp-Source: AGHT+IEHqON53lM97qPneT55hkPQsjRWeaUbxv+fl45+n0nHgfZowZNRP5w89fJGFEh4vv6YXv/+Vw==
X-Received: by 2002:a05:620a:c50:b0:7ce:e010:88bb with SMTP id af79cd13be357-7d3a883450amr1156220985a.22.1749744512722;
        Thu, 12 Jun 2025 09:08:32 -0700 (PDT)
Received: from [192.168.8.146] (weaver.eece.maine.edu. [130.111.218.23])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8eacbc7sm55688585a.62.2025.06.12.09.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 09:08:32 -0700 (PDT)
From: Vince Weaver <vincent.weaver@maine.edu>
X-Google-Original-From: Vince Weaver <vince@maine.edu>
Date: Thu, 12 Jun 2025 12:08:30 -0400 (EDT)
To: "Liang, Kan" <kan.liang@linux.intel.com>
cc: Vince Weaver <vincent.weaver@maine.edu>, linux-kernel@vger.kernel.org, 
    linux-perf-users@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
    Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
    Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
    Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
    Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
    Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: [perf] crashing bug in icl_update_topdown_event
In-Reply-To: <36b65ee5-4bce-4b15-91bc-52604bc8a046@linux.intel.com>
Message-ID: <da4d8a9a-66a4-32b4-0283-ef4687357349@maine.edu>
References: <352f0709-f026-cd45-e60c-60dfd97f73f3@maine.edu> <080706b6-ed21-540d-dfae-ae27d130d796@maine.edu> <d8c64a21-ed4e-4d37-8d4b-9d3a9857b7fd@linux.intel.com> <704f6604-547b-f7ca-ad45-2afd2dd70456@maine.edu>
 <36b65ee5-4bce-4b15-91bc-52604bc8a046@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 12 Jun 2025, Liang, Kan wrote:

> Thanks for the test. I've posted a fix to LKML.
> https://lore.kernel.org/linux-perf-users/20250612143818.2889040-1-kan.liang@linux.intel.com/
> 
> It's a little bit different from the one tested. Please check and
> provide a 'tested-by' on the new patch if it works.Thanks,Kan

I've tested the new patch and it also runs my testcase without crashing.

Tested-by: Vince Weaver <vincent.weaver@maine.edu>
