Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35DE2153E4
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 16:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738687303; cv=none; b=ZXXjaaQu2PwJJ3IgmKQwg9F6Qu8mfkFIoXW+k0KowXLaDBuTBqjUTAC/1KHmIRnTfh9ZyLNmspkSWbUtI8MdVpfchdENzvXXsz1a4HeJvVblpF29hh7uhYYUpGPwf/PyQtWI+5kjWJrfgCzUPxITtb4vB2MJrpNPJkh8GOtUyI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738687303; c=relaxed/simple;
	bh=KmbuQodd8gdeNbqKPNLZW0QJqWSD6SMs5dgCQkjfjSE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=J3UrIntlMoItr7lLg+ypnm/UIxZkBXzR1g4/GxFQBwzUvyBzpbHkSxAEUY/eMZyShGLXFfKvm7eaa87MgYLxtI6TsyVokM7VYAVJhW+kKQ1Zj3R+g96sXs6OHWgfwZe70v2m30Awibk1fQ5iy4+Gstl1RFk2YMaJ5sWOVi7W5Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maine.edu; spf=pass smtp.mailfrom=maine.edu; dkim=pass (1024-bit key) header.d=maine.edu header.i=@maine.edu header.b=ZyOD8byj; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maine.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=maine.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=maine.edu header.i=@maine.edu header.b="ZyOD8byj"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-46e28597955so52160641cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 08:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=maine.edu; s=google; t=1738687300; x=1739292100; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=52Wdx1BmdnQgYoMxdnPqrdFSJsd5zNLPV/6lG8XSTk8=;
        b=ZyOD8byjj6qfFXjGy2yENHxXSbUsfgD12SNVLgMUmmWbvO4nnB39kc1iQR3F+fKaQU
         18gymkxtK4wjob2OwXq7bXQSL3nBR7grMB3iJmjYCtaY1AbPGwvcFlhhOvTMRF/A1IcJ
         czwcsGNMQ2IzLk7IoZ/eHCrZMOpfDV1YLPSVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738687300; x=1739292100;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=52Wdx1BmdnQgYoMxdnPqrdFSJsd5zNLPV/6lG8XSTk8=;
        b=njr8D5Q0QBZfmJOzSmx1BBGEDT7Xyu0PWzshTAXDoqS54QxDZD4ftuApGBLPoZJ7cQ
         ng+2XeLIpEdGMuYYoONly3250Ps1Am1LRHmNTKfdM1q+gyvSBswxF3/bH4u7E3xcUABt
         kw0jyN/L4juqH87o1Dxdg+2vTIVFzfyHr2rVOYvT3DbiTggE0Rw9iH009gj7f0/irv3j
         PGjb5ShkPDQkwfIAmGbiesa2lHnZikft1f0MaC2ve3z/p1y7LjZ0drnvC5ozzGjLDZ5b
         VjuMNtAZSpR1EngBbfNP3xeJG0lFvXv62qfHx/XT7YPVWW98oCa0MgDpUPcJmrsyqoMV
         fTxg==
X-Forwarded-Encrypted: i=1; AJvYcCVPCWUJXqDHcyf8/hFWom1j47MW/rLNhhV3xFuvp4loeYJ8vH4hZdNhChZ20JFdFYDC4bR3Lq38mWw9n4I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnIMeKJXcMSF2Jw9/1NDhjea3sZq4AcgtbDZuoFQBV6NstJLFR
	4VFHo8Y0QLODpb5X2E3+7+fVueU64oSlaS8ZNKbIn3aSBQC2wRPQILdtG3pJ0g==
X-Gm-Gg: ASbGnctPrYD0SeW94r14CJQL7YFNEGve1jkeGN6HHeX6Rcz51s+0+WRu1lZv5FsT/qA
	wwTZoWj7EkyxMks6ALcBbkyouw4QrNiBVs7pi1bVIbLD1aa8l8LRbYSbFFlepAXFpN0jPcFHDkm
	OCH3qqvGOL2+eNsvh+y/b14V7uBLvINY2H9/aEwzQPO6dPlaT4QaXAUv6MunepbfEawBh1xGSnT
	aKwGC6cb1TVcPjOaOhfcb6iXIWIbyVuSOXTSEl8tQaAIVGLJSPeFyBL0XKjv3/v8IgXVNaGH+nU
	BSXJyfwZHVmYJtTyMYLg48plDi228b/VBE8dBw==
X-Google-Smtp-Source: AGHT+IHfp/3fqPtIKWPO/WOMcL7EqM8NzX6aIAw0wddWU+eeThQX93zsyLCt4Vbb/kcMnKFcCRw82w==
X-Received: by 2002:ac8:5d12:0:b0:46c:8380:4392 with SMTP id d75a77b69052e-46fd0a96272mr370145551cf.20.1738687300627;
        Tue, 04 Feb 2025 08:41:40 -0800 (PST)
Received: from macbook-air.local (weaver.eece.maine.edu. [130.111.218.23])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0e3089sm62240381cf.46.2025.02.04.08.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 08:41:39 -0800 (PST)
From: Vince Weaver <vincent.weaver@maine.edu>
X-Google-Original-From: Vince Weaver <vince@maine.edu>
Date: Tue, 4 Feb 2025 11:41:38 -0500 (EST)
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
cc: "Liang, Kan" <kan.liang@linux.intel.com>, 
    Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
    linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
    Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
    Arnaldo Carvalho de Melo <acme@kernel.org>, 
    Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
    Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
    Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: [PATCH] perf/core: move all of the pmu devices into their own
 location
In-Reply-To: <2025020408-apron-fled-d29e@gregkh>
Message-ID: <6edcf7f8-d496-524e-2250-49284dfb55e4@maine.edu>
References: <2025020304-chip-trench-4e56@gregkh> <87pljyyx68.fsf@ubik.fi.intel.com> <2025020426-spool-refreeze-2870@gregkh> <d689243f-9b25-40db-98b6-e032a6b27c62@linux.intel.com> <2025020408-apron-fled-d29e@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 4 Feb 2025, Greg Kroah-Hartman wrote:

> 
> It seems that the majority of the perf code IS looking in the correct
> place, just mem-events.c seemed wrong.

I hate to tell you, but other places in userspace are depending on the 
current setup.  libpfm4, used by PAPI, is looking directly in /sys/devices 
for pmus and will break with the changes you are planning.

Vince Weaver
vincent.weaver@maine.edu

