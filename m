Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347C81F4C89
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 21:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743631178; cv=none; b=NpeGBMrsV57kTHw3uueqVxbE9M2WlakHC3VMsbDqv5tZ4jgzESV6nog8v6lQD+Q3nQ0SMlmKqdO0/jmqQ7E7BYu1LDZInz8kgT3JP47cCHDMhKGwufKwsAJGMweGeCtcDNNiaKMRpxJ8S9qrnK++dzuCGb4S5rP5GgQl2IlGqXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743631178; c=relaxed/simple;
	bh=Z/xOV2Rb8NgoEvjLqYQw+xu9IJFae4Mb5dAPjpppXrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SHdhWz3vwjJ7joRyxdrsbpjhnGuuDoPuH14T7H+v6p9kS7wuInz/FqB7glnJXzhUJTXIYPkO3SFOMDs4Mwv4MGWRphaMjBHLQM/wvYMu6WBbzGjpfawId2Aec0mEy5uS+eOL0uGeVwl/tYZ080jzORGjK7ggYRTX2aqBbKokxP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xZq14Bl/; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xZq14Bl/"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2264aefc45dso4320455ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 14:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743631176; x=1744235976; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WqllMbVSzlYmSg4e9MsN3Hg5U+KXq66OHOKXxPOPhW8=;
        b=xZq14Bl/GyyNlhPUpwTuaLjWoGIgqv8F1cDdpDwbEEPnjy94s6VIJDUB7F3K0h7fAD
         5jDL17EWS1I8eaxbcoII1dKiCgWRqojvygllrZXFwBs2FXIZQI6L/+DW9j0w3vl3nf7/
         ZQfWi1jQfSv+DnahlIPTKf04gFEIIvU0YdH7y8dYh9oRMOz6AbJvbRlt02LTWSt0MMlb
         QWszKp4Qiz7zh1mhYqXSinmUx925sejMoBPCQ0clziuF+bwmkyQrmxz36O3BExFwWg+c
         jRM0cp7PZwkPPzBWMFjO8a7YLfEd8Wnatl2/Tsp2fSi8uJZMEkJHBoDIzQN4gLcpoxMG
         znEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743631176; x=1744235976;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WqllMbVSzlYmSg4e9MsN3Hg5U+KXq66OHOKXxPOPhW8=;
        b=mnvhPG0ZdIjnmv94u7PH+rqf/L48jtX5njRqpcqprYzCNXEjIDB8re/U+2hLb40wAi
         B9WElMZhIEJFe0paEjS/AdiPk+YOql7RQs70zbnpJ4w424DcOp439MHYBidqfFfENoxq
         P0bLI9g9pBh5o8ZMBLyUy9obr7tWlAJfOGJQIUdwK4kEZ5jRlmpAxKYTgFCirrPsGawU
         9IWEeRlXzvcx5pZKsFrNFD0aleFjg79tVAhRuJJCvqamGCEFmvAztoJmmysDojz7S+dh
         9OfweyoIflshzEfn1T8nLH0dcYM6xvFpizCuIp0MjhpOMMQZi7LWA2qKNPNQ0ekNn1E7
         1y7A==
X-Forwarded-Encrypted: i=1; AJvYcCWH8JiMAM7f46nUxutgBRTHFzE+n6cGeQWofjRYuNK/TpBV5uuEtjiR3PXbfUt55cy5/qlrNObkN8aV5eQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEJjQT7hZbyZMxhuQafMLKqBTrUHdx3r9YAn3+2hnKPdP+tIdQ
	BeZ/04Isyhy1f3RTi7eo5M81AWa9MIb2JIIEyIQ94IVi+kx1ISqiTLqsxftJHg==
X-Gm-Gg: ASbGncvxce+4ToHNwGW0IbQu2+7zbNvtpXKdmwiw26Bp9qJNAi/3oQ74EApd1vHc/Wn
	gJx7J4iGFfbrqRs05vX4dhxZ4NDrmJCMZDOgztgkPs4z6FaB+1H6quCGaA6Uw+zXcR7cu2POmUW
	TGH0kGC/8SDuxN4hz+WiyMMsK96RcLJjaFRqE4sX2dVSfBMdiqlU3cn+K/ViLi+6+HJRrLqThvq
	djjSqRpvxpH/Io/P7F+gnh1HEU2maYdgTJlllJrE6i1/b9HS6qyQGcelmILvpSqjbk50XOAwgPT
	WfR9tmTjiw5C+ya0fpj4EObNmYxHdUX2WD2At6x8KMOBU+J/9LBYY51j6UThipuRvuz8dzx7Eh4
	KFSy9extQTj0eEgo=
X-Google-Smtp-Source: AGHT+IHteXxFO7jbKx3k3Jy9PnUQzjVaQtKgEm+NOfEcxdPjDfCVTFwPG/5wPWOnq7Eh2M3nBNvUdw==
X-Received: by 2002:a17:902:ea03:b0:223:536d:f67b with SMTP id d9443c01a7336-2292f9f607fmr329229995ad.38.1743631176289;
        Wed, 02 Apr 2025 14:59:36 -0700 (PDT)
Received: from google.com (198.103.247.35.bc.googleusercontent.com. [35.247.103.198])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c2791sm636175ad.80.2025.04.02.14.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 14:59:35 -0700 (PDT)
Date: Wed, 2 Apr 2025 14:59:31 -0700
From: William McVicker <willmcvicker@google.com>
To: Youngmin Nam <youngmin.nam@samsung.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Saravana Kannan <saravanak@google.com>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Will Deacon <willdeacon@google.com>
Subject: Re: [PATCH v1 4/6] arm64: dts: exynos: gs101: Add 'local-timer-stop'
 to cpuidle nodes
Message-ID: <Z-2zQ-PcvxFTBc6M@google.com>
References: <20250331230034.806124-1-willmcvicker@google.com>
 <CGME20250331230151epcas2p486a7c6d7153737f4168cfef74249742f@epcas2p4.samsung.com>
 <20250331230034.806124-5-willmcvicker@google.com>
 <Z+y4zxfifkQqLxKF@perf>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z+y4zxfifkQqLxKF@perf>

Hi Youngmin,

On 04/02/2025, Youngmin Nam wrote:
> On Mon, Mar 31, 2025 at 04:00:26PM -0700, Will McVicker wrote:
> > From: Will Deacon <willdeacon@google.com>
> > 
> > In preparation for switching to the architected timer as the primary
> > clockevents device, mark the cpuidle nodes with the 'local-timer-stop'
> > property to indicate that an alternative clockevents device must be
> > used for waking up from the "c2" idle state.
> > 
> > Signed-off-by: Will Deacon <willdeacon@google.com>
> > [Original commit from https://android.googlesource.com/kernel/gs/+/a896fd98638047989513d05556faebd28a62b27c]
> > Signed-off-by: Will McVicker <willmcvicker@google.com>
> > ---
> >  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> > index 3de3a758f113..fd0badf24e6f 100644
> > --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> > +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> > @@ -155,6 +155,7 @@ ananke_cpu_sleep: cpu-ananke-sleep {
> >  				idle-state-name = "c2";
> >  				compatible = "arm,idle-state";
> >  				arm,psci-suspend-param = <0x0010000>;
> > +				local-timer-stop;
> >  				entry-latency-us = <70>;
> >  				exit-latency-us = <160>;
> >  				min-residency-us = <2000>;
> > @@ -164,6 +165,7 @@ enyo_cpu_sleep: cpu-enyo-sleep {
> >  				idle-state-name = "c2";
> >  				compatible = "arm,idle-state";
> >  				arm,psci-suspend-param = <0x0010000>;
> > +				local-timer-stop;
> >  				entry-latency-us = <150>;
> >  				exit-latency-us = <190>;
> >  				min-residency-us = <2500>;
> > @@ -173,6 +175,7 @@ hera_cpu_sleep: cpu-hera-sleep {
> >  				idle-state-name = "c2";
> >  				compatible = "arm,idle-state";
> >  				arm,psci-suspend-param = <0x0010000>;
> > +				local-timer-stop;
> >  				entry-latency-us = <235>;
> >  				exit-latency-us = <220>;
> >  				min-residency-us = <3500>;
> > -- 
> > 2.49.0.472.ge94155a9ec-goog
> > 
> Hi Will.
> 
> Are you using this property in production?
> If so, have you noticed any performance improvements?

On Pixel 6, I have only recently switched to using the arch_timer as the
default clocksource. I haven't noticed any major perf improvements to the main
benchmarks, but also haven't seen any regressions. Based on the ChromeOS perf
analysis in [1,2], there was a significant perf difference found.

[1] https://lore.kernel.org/linux-samsung-soc/CAJFHJrrgWGc4XGQB0ysLufAg3Wouz-aYXu97Sy2Kp=HzK+akVQ@mail.gmail.com/
[2] https://lore.kernel.org/linux-samsung-soc/CAASgrz2Nr69tpfC8ka9gbs2OvjLEGsvgAj4vBCFxhsamuFum7w@mail.gmail.com/

If it helps, I found that Pixel 8 and 9 devices (didn't check Pixel 7)
are already using the arch_timer with this 'local-timer-stop' as the default
clocksource in the production kernel.

Thanks,
Will

[...]
