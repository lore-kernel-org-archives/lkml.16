Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F131B1362
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 03:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750218563; cv=none; b=kRmf406SE3pQiXOMWeT0jho1yUMe6LAV4orNL+BzfZcnPKJClu/Hr978MgjAX21QRJ8/jq406bz/GQkU7U4T7cKnVDYusPJpfZ1MSEfGVcIdkYXCb1HKPoPNDHReN+8uLbCjpLOXdeVH54N/agivGNIuBSm1HJQeyKEh7VdB0/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750218563; c=relaxed/simple;
	bh=6QvAOcMCRBBI7LWPY+Hl/n4adlLtJlaCD6nOUF4kXhM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=KAoHqpwZZMSUdOtxfI7do6KETyCZOkrukW/cfpsiTjtdGeBVtS5mwxcRoPuOrO+FSZQwfAM7SQpyTnO5r5n9fY9X0Jm+4/gSUR13nXidiVBtsaRdDZ4czAJ+6/OqqX+IlE3w2f4Fru42LZLKbzu+ckWac2s+cImZv3CUkc62tLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maine.edu; spf=pass smtp.mailfrom=maine.edu; dkim=pass (1024-bit key) header.d=maine.edu header.i=@maine.edu header.b=UiinTcVE; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maine.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=maine.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=maine.edu header.i=@maine.edu header.b="UiinTcVE"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6fad4e6d949so33503676d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 20:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=maine.edu; s=google; t=1750218561; x=1750823361; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ef70Joe5j45SYlyg8314bmCwyOurjXSY3YWnIl6LCFY=;
        b=UiinTcVEYntYDIqfytCTuuEgeqD6iPAmpQkGfx61V787MZ8ZTCAEaIG05dkra80aEO
         oLELEmzuhxLYVd+2/wD9JSL1r7y/2vJIKeSnG2ugSdO+dh+CYf8xjmaFkpITCV2S4mnp
         jtTdQ6xK6LF+f8/7m0wGgdcdjR0wNFkAx+noQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750218561; x=1750823361;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ef70Joe5j45SYlyg8314bmCwyOurjXSY3YWnIl6LCFY=;
        b=p1QwVnh3pRBrNiPOkyqZ88Ma2qsS7r0gnwEZ2SDbX1Y1ti4Gpl6K20R2SULrnOGti3
         2NIfsYGi/hK69kg2/OIRrQ1Af5LhKFkMfRbqFK4QLPkQYnP3pFr6koDyG8CmNncOgQqP
         5L03XfDEJDrDrL8A9Ph7urY66sNtMTspycgQ4keMRazvgyiZCM0NOeQAy/utSOLDzWQ0
         1rkFfAKZBfQWmpDFv+F73l5MC7Xulm2r9vzTqNDYBNJKKrA1TamQaFDd5PsHjsTbUtxk
         0XYMTpI/xAjPOc6WogdSP42uj8/Nm/m4CUtFs+mdeDWvFYY/PNSPCOQfyJAVZhrQ/dAp
         C2qg==
X-Gm-Message-State: AOJu0YxAMk01VcEl58tOdgqi6SH8xpbLa2KBLA1dpapuxDourppzvOSR
	e80HAYwRWvkjSkuG32W/R1lIzMWwe2in43fPmYwO40ns54Vi/tz6rC12ttfHW5UUpQ==
X-Gm-Gg: ASbGncsMkXfp3h+dhZUnhPJyXk4mw+9E8LeeF7MujYyRXof45xQmkzi4IVgnHSD1Ye7
	+7U1ICRzscKVG+AyMw64YkNf5SFcdmECZ3sf9NEpbkYcev7txfthWwMQ0d1GiSvnLBnekHhuPIO
	qor27jTn3XDeTRyFmjUI0UxCKAOr6RVIaMTCyNshWPnYRsQhsSmwXJ26hZzolVuaRtf3t10xKJX
	mC8CR9z/CiugOH0SzIG9GDzvMnOtFnzpKZhcV7Rhy6t/EZWHF/6L8z2XvFhkphCCCk6ZWVSFIbx
	cbpz46RcDYVLBttr7V4b6XjVyUwkMAQdV0daNxkPlvrufov0LGFMmpp6LVbc9BRvaZBpQ6SIMW0
	FhEBsSg==
X-Google-Smtp-Source: AGHT+IEY/vDw8X+9rNcjO23dhLmtLnxL+I96K0Os1qP1BsJ1YOT+8ViRoRosC+UlntlMpWyEfSlSWA==
X-Received: by 2002:a05:6214:2427:b0:6fa:cd35:3d98 with SMTP id 6a1803df08f44-6fb47797c6cmr239671506d6.38.1750218560769;
        Tue, 17 Jun 2025 20:49:20 -0700 (PDT)
Received: from [192.168.8.146] (weaver.eece.maine.edu. [130.111.218.23])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb5a9dbf8csm18549736d6.106.2025.06.17.20.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 20:49:19 -0700 (PDT)
From: Vince Weaver <vincent.weaver@maine.edu>
X-Google-Original-From: Vince Weaver <vince@maine.edu>
Date: Tue, 17 Jun 2025 23:49:18 -0400 (EDT)
To: "Liang, Kan" <kan.liang@linux.intel.com>
cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
    Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
    Arnaldo Carvalho de Melo <acme@kernel.org>, 
    Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
    Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
    Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
    Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: [perf] unchecked MSR access error: WRMSR to 0x3f1
In-Reply-To: <574b8701-9676-4aba-a85b-724c979b2efa@linux.intel.com>
Message-ID: <7e8bb736-3955-c479-99de-e08efb494bdd@maine.edu>
References: <14d3167e-4dad-f68e-822f-21cd86eab873@maine.edu> <574b8701-9676-4aba-a85b-724c979b2efa@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 17 Jun 2025, Liang, Kan wrote:

> The commit 2dc0572f2cef was triggered by the fake event VLBR_EVENT.
> But this error should be triggered by the Topdown perf metrics event,
> INTEL_TD_METRIC_RETIRING, which uses the idx 48 internally.
> 
> We never support perf metrics events in sampling mode. The PEBS cannot
> be enabled in counting mode. So it's weird the cpuc->pebs_enabled has
> the idx 48 set.
> 
> The recent change I did for the PEBS is commit e02e9b0374c3
> "perf/x86/intel: Support PEBS counters snapshotting". But it should not
> impact the above.
> 
> Could you please help on the below questions?
> - It only happens on the p-core, right?

how would I tell?  I don't think the error message says what CPU it 
happens on?

> - Which kernel base do you use? Is it 6.16-rc2?

I was running just before -rc1.  I've updated to current git but didn't 
realize the throttle fix hadn't made it upstream yet so managed to lock up 
the machine and not sure when I'll be able to get over to reboot it.

> - Can this be easily reproduced?

probably.  It's another thing that's a pain to check because it's a 
WARN_ONCE I think so I have to reboot in order to see.  Even if it's not 
reproducible the fuzzer usually hits it within a few hours.

>   Is it possible to bisect the error commit? (Maybe start from the
> commit e02e9b0374c3?)

Maybe but I'd only like to do that as a last resort as it's a pain to 
build and reboot kernels on this machine (for secureboot and other 
reasons).  Also I suppose I'd have to manually apply the throttle patch 
while bisecting.

Vince Weaver
vincent.weaver@maine.edu
