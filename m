Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2117A262811
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 14:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744209405; cv=none; b=OZ6riOknYJvb8zeCg8d2V+KB4LALpSb6XKKgTPkq5M4N+lXYNbMsy9AKbs2wUyDJFgd1OpOqKUdx4RUjIFTQIuH57hQ+3GGTuf/83fP691XE65G3tViPEgvf1XFGK08tl7gxM5Pt1l4YDougP2VBzNAys1BcPONZsnI3raD6hnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744209405; c=relaxed/simple;
	bh=p72AwNBSZMnrmO6FTmJqH/yL5IxqIrTxcB5sW8OzJ5M=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=QylDVSM5vPP4LT3jTl4GtmOfrSuzWV6wHf7bwvQEmkqm9S1N4VGvYbe8nZq5uCLrsR0myv21MbyzXqqk+srKrJAEP5oXujPLpV0p1Tz520ACJ3sNihST+5rz2sbooRgul3SfjFMqlFI5vgleykw64wtW7qTT/buQiOyZUai4TrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=telus.net; spf=pass smtp.mailfrom=telus.net; dkim=pass (2048-bit key) header.d=telus.net header.i=@telus.net header.b=gubZZ9X6; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=telus.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=telus.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=telus.net header.i=@telus.net header.b="gubZZ9X6"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ff85fec403so869318a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 07:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=telus.net; s=google; t=1744209402; x=1744814202; darn=vger.kernel.org;
        h=thread-index:content-language:content-transfer-encoding
         :mime-version:message-id:date:subject:in-reply-to:references:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=v2o5jlCeBg1HPoD5yGBcEHxzsNv9Am09qdqlW/Zm/bo=;
        b=gubZZ9X6ieIUSUrcEqWozS3ouYWJ8ZIoQOYqsam+GW+L87jgDhfTtNv2J6oEKFl+1v
         B5r+ADvEOA15D3ceGR7BfW4FVzagzJagzl0C3d/3Put1nl0hmaI3vL9XqsMgzRM0o4ud
         D7uKEPzx1tifMRlYcJgVNLJR9zrS4cr06QCl1yLyrut2Ze2LF73WWJ7v8BNomETYL23r
         NzQumIBef2TzML5Y705FiHXauybfkVmeDE5Lak3/67eXr93M33i2MIzmDi+vEG1wnPeZ
         a/PWc9jWegsDvLqoBP+NWvC8qHIy9wAhqF5R1io38j82e7Ji8nHAArLj2Ly98FCZgV3W
         jUBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744209402; x=1744814202;
        h=thread-index:content-language:content-transfer-encoding
         :mime-version:message-id:date:subject:in-reply-to:references:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v2o5jlCeBg1HPoD5yGBcEHxzsNv9Am09qdqlW/Zm/bo=;
        b=KPQkBSwY8l1MbwHyX3c6CWisaTP4Q2J65JljKZfhRI3f9BwXdC1WEp5vWlXCdqNXOk
         WnhpaOvSJC+sQH7Um4VQvRVSLkRXPZlWy+/B/U8b+mJc87je1iwTl7n1BWrr3r3HtLaL
         DTR5+vzBzI6+hNAWyRRZ8bSJHavgpTcWwz2PogaDl8LDVpFFHqW8US+gUoAo9l95wtGa
         hdSTi2vkNsBbVJkEgWX+OQbhoKy3Msb/IerelUXg5y9bfmfJUwBaeRl1MlQY8RoLHODu
         SBEMOW0qUGBj3qdOYzkVpalwdgXYUzOi6LSfLixPPBeq21XzWqXgpyoyRTo/BWfqGPm1
         w24Q==
X-Gm-Message-State: AOJu0Yx+UOCpBOLQFUCFMi1naC6KIVq+I+/mnXIaOvPFWkAiublHdfwB
	AQm/kG/u6a8A9PxAhEs1Asmv+EzSissn32XusaF/07ZMJH+X88GgmBpp+J3f0P4=
X-Gm-Gg: ASbGncuNNaAK2s41HO9cOTYLQrZj+Udk95BqWBDvY6fzLvSBnCJOP0gUCeWSZDo9pbU
	EQm4gZkAoBxid5YzfcbOUFzvuxcP2rKfMjGO0Mkp7SaZXz4Pf7m2LXacyMPh56hqdyFte0kxcai
	qBsyx74S78aJYpsCgH8HUrnB9UDwcsxYoH0RHQUjsaX8riiOa8PfeK1/MvDS61iNWoG2F/dthMf
	/lTylXhZZMVbxDF1OOrX9lCnCfpNXWF0FzseFloXTE5QmXHzinhK4AqWUtz4O4YfgWaKAW3eJgU
	YU40NoCrO3GIUtGwPLMa0RjvzgfzWzEQa0q8Nuttio+3q5GI2vPpau/nKxUJefDJ00qXHh4wM/V
	UIr1ScA==
X-Google-Smtp-Source: AGHT+IFmMczAe+eysU0mnPkmcG7378iURe5t5+vn8+7auVk+eCv2ZRCObVGU/DsIL51RZBz7Jh8nxg==
X-Received: by 2002:a17:90b:5388:b0:2ee:8cbb:de28 with SMTP id 98e67ed59e1d1-306dc046bdamr5001983a91.8.1744209402371;
        Wed, 09 Apr 2025 07:36:42 -0700 (PDT)
Received: from DougS18 (s66-183-142-209.bc.hsia.telus.net. [66.183.142.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd12b599sm1684414a91.23.2025.04.09.07.36.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Apr 2025 07:36:41 -0700 (PDT)
From: "Doug Smythies" <dsmythies@telus.net>
To: "'Rafael J. Wysocki'" <rjw@rjwysocki.net>
Cc: "'LKML'" <linux-kernel@vger.kernel.org>,
	"'Daniel Lezcano'" <daniel.lezcano@linaro.org>,
	"'Christian Loehle'" <christian.loehle@arm.com>,
	"'Artem Bityutskiy'" <artem.bityutskiy@linux.intel.com>,
	"'Aboorva Devarajan'" <aboorvad@linux.ibm.com>,
	"'Linux PM'" <linux-pm@vger.kernel.org>,
	"Doug Smythies" <dsmythies@telus.net>
References: <4661520.LvFx2qVVIh@rjwysocki.net>
In-Reply-To: <4661520.LvFx2qVVIh@rjwysocki.net>
Subject: RE: [PATCH v1 0/2] cpuidle: teo: Refine handling of short idle intervals
Date: Wed, 9 Apr 2025 07:36:42 -0700
Message-ID: <000f01dba95c$d0504b10$70f0e130$@telus.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-ca
Thread-Index: AQH70ytUHgkW+C/EsxWbGWbn/cpOQ7NbDDaA

On 2025.04.03 12:16 Rafael J. Wysocki wrote:

> Hi Everyone,

Hi Rafael,

> This series is intended to address an issue with overly aggressive =
selection
> of idle state 0 (the polling state) in teo on x86 in some cases when =
timer
> wakeups dominate the CPU wakeup pattern.
>
> In those cases, timer wakeups are not taken into account when they are
> within the LATENCY_THRESHOLD_NS range and the idle state selection may
> be based entirely on non-timer wakeups which may be rare.  This causes
> the prediction accuracy to be low and too much energy may be used as
> a result.
>
> The first patch is preparatory and it is not expected to make any
> functional difference.
>
> The second patch causes teo to take timer wakeups into account if it
> is about to skip the tick_nohz_get_sleep_length() invocation, so they
> get a chance to influence the idle state selection.
>
> I have been using this series on my systems for several weeks and =
observed
> a significant reduction of the polling state selection rate in =
multiple
> workloads.

I ran many tests on this patch set.
In general, there is nothing significant to report.

There seemed to be a little less power use for the adrestia test and it =
took a little longer to execute, but the average wakeup latency was the =
same.

I am still having noise and repeatability issues with my main periodic =
tests, where CPU is swept from low to high at serveral work sleep =
frequencies.
But I didn't observe anything significant.

In order to use more shallow idle states with a periodic workflow, I =
launched 2000 threads with each at 113 Hertz work/sleep frequency and =
almost no work to do for each work packet.
The patched version used between 1 and 1.5 less processor package power, =
at around 85 watts.
The patched version spent about 3.5% in idle state 0 verses about 5% for =
the unpatched version.
The patched version spent about 31.8% in idle state 1 verses about 30.2% =
for the unpatched version.

Test computer:
Processor: Intel(R) Core(TM) i5-10600K CPU @ 4.10GHz
Distro: Ubuntu 24.04.1, server, no desktop GUI.
CPU frequency scaling driver: intel_pstate
HWP: disabled.
CPU frequency scaling governor: performance
Ilde driver: intel_idle
Idle governor: teo
Idle states: 4: name : description:
  state0/name:POLL                desc:CPUIDLE CORE POLL IDLE
  state1/name:C1_ACPI          desc:ACPI FFH MWAIT 0x0
  state2/name:C2_ACPI          desc:ACPI FFH MWAIT 0x30
  state3/name:C3_ACPI          desc:ACPI FFH MWAIT 0x60

... Doug


