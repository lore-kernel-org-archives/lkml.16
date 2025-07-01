Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C2013AA53
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 10:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751365021; cv=none; b=bEzyuWvldez+GuS1UDkIG1cVJ4ub/zGa7ODVNDoaoNdN9q6xEUOjkw6xsipt7Kz4fz3aeNGsnnDcpfX5peNooPm0xhRD+LY+UXRonCSFeOBIGIRRHl7q9ax5v8wdn8H9Bn+NTkOi9FbZDIwRQzA9ejXYkEVu0q0k7p/SMVU8kiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751365021; c=relaxed/simple;
	bh=TQC9+oQxqblFVDB80MxY1iCatqzGsHJIWGTarUSRBKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uRb1/lCsX5Ijbgf5pqJj8hrbWXuhsZNIR3lROyr4KgUkNfZ9z/gHY13X2ntptv4pReaOdvwIUhO2Sb8ksTFrf0JhEOcAWPfk31Mw5HdVMEo2eAzUaUmFCmncYNHDQ1Y066y77N5FkehdjzPVFMdyt0V/lPn4ro8QNXU4PPqRm34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V+fIekRr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V+fIekRr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751365016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kHo/cFymct4LXXFJUfJvxL32X6eCwnlTq+zBpWThbJs=;
	b=V+fIekRrgpHu5T4LcFoNr57ogdIhG7jfeXDmAQz8Rtv8Vk5aqAq9peyjcLzTI5HTl+HxTV
	2uJBud4ZW+GK7+N54jpHAeXwcFM71UwWnJ816qKgFkkAg6JZUg6GQwQVl09pUV+t3RakX/
	OaAkesN87UnAFvXivPAhdVLQMMQ7jLw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-179-MYM1Wb9oO2O-A8WvRAMPcA-1; Tue, 01 Jul 2025 06:16:54 -0400
X-MC-Unique: MYM1Wb9oO2O-A8WvRAMPcA-1
X-Mimecast-MFC-AGG-ID: MYM1Wb9oO2O-A8WvRAMPcA_1751365014
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450df53d461so25278735e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 03:16:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751365013; x=1751969813;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kHo/cFymct4LXXFJUfJvxL32X6eCwnlTq+zBpWThbJs=;
        b=gO75wqgIYzJ1HdZgOTycsWBZbverBn2zLIkNRoMGWKp0GdCKBKH6dLvyvQ8+wSkr9F
         YAnzDGgjrEKSoP+2UOnRBCqPvr+0CuyxkBLIzh4GDNtvTr6wUtrdjN6UwkZMsna2TZkB
         xS9c2tgkmNBFlre3N6Au1G6CqGEv/J02ryriN8MTBIr6/SclfrSDR2YDWetGCUKjFo29
         111ha9nDMNL6JjWvgbcxsVu15YZ7QSfTs+dGETKrk4id4ls3VD9mmGuC4VJClat0tZit
         7xpSOaqgKQsQ+AB1jD5+ykCspi0ZlTsIowjv5lxSCgUd6WdhHxj2eBHuBPWpdlyj2P2U
         RhSg==
X-Forwarded-Encrypted: i=1; AJvYcCUxW36lBelEz91iMqhxNWKeYiMPJX6IbjpbDO+PF85TwzuAIIxSMfbIiIkg6aOTBIrGIA8/m1vLx7UtMpw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFPJVl9+jaWe6KnBZBqCqWEaMJjLLOi0JUsTyH24WKLETSjN1a
	/jjEpe4t990cuNrntq4J5/U8BnVWUql4DZB7ub66IR2H8NEGtnikC963eBHuN6+0y0AqGKPS2tc
	1qIJBzm3vnXXtdqqpNKWy9RG42l6LDlSWPrml2FqmhgylQoFHbEZRDnmV+ojRT0AvFw==
X-Gm-Gg: ASbGncso1O6i8RcXo8nOiHfFIISsUCfXyvGIaaL1KdezcOupGFqsKlLn2ZDqnk3xJ2X
	nCytdCfhamcH2NxpUjxvLDRt3QoXU48t7Wk7A8D1CYrqGfBKkRryo6ckk2479U3ICgg1o9o1/KO
	qbTDvWjnPhOKfhHGiKc8AdglsYVovI1tcH9K7C/B6uk64hWTXb/Juru4wQt9tarcjMNfzxIlPwk
	2ul/DMsdG8UmJ26sZ9+sR3w8pw5IROBCf7F5SS+UDaiVc+nnZDBU0SBXaflA68CkQ6PNG15KdKA
	Q2mC3IFoG5vPwEu8L2UZzqx3Czdb0ZnUmDd4H2jk3XaVdCI1Zyt5UcpME4VEBm471s9gjw==
X-Received: by 2002:a05:600c:4ed3:b0:43d:45a:8fc1 with SMTP id 5b1f17b1804b1-4538f244121mr174638525e9.4.1751365013240;
        Tue, 01 Jul 2025 03:16:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEJq4NPlQOANeFkcDdpPTn2V1nB2CZt1s+DQ2EMmFxhbNZ3FodkuTpK5r3gou56aXsP2YbRQ==
X-Received: by 2002:a05:600c:4ed3:b0:43d:45a:8fc1 with SMTP id 5b1f17b1804b1-4538f244121mr174638105e9.4.1751365012686;
        Tue, 01 Jul 2025 03:16:52 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:247b:5810:4909:7796:7ec9:5af2? ([2a0d:3344:247b:5810:4909:7796:7ec9:5af2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453962dd8besm100899005e9.31.2025.07.01.03.16.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 03:16:52 -0700 (PDT)
Message-ID: <852d45b4-d53d-42b6-bcd9-62d95aa1f39d@redhat.com>
Date: Tue, 1 Jul 2025 12:16:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 0/3] ptp: Provide support for auxiliary clocks for
 PTP_SYS_OFFSET_EXTENDED
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 Christopher Hall <christopher.s.hall@intel.com>,
 John Stultz <jstultz@google.com>, Frederic Weisbecker <frederic@kernel.org>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Miroslav Lichvar <mlichvar@redhat.com>,
 Werner Abt <werner.abt@meinberg-usa.com>,
 David Woodhouse <dwmw2@infradead.org>, Stephen Boyd <sboyd@kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Kurt Kanzenbach <kurt@linutronix.de>, Nam Cao <namcao@linutronix.de>,
 Antoine Tenart <atenart@kernel.org>
References: <20250626124327.667087805@linutronix.de>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250626124327.667087805@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/26/25 3:27 PM, Thomas Gleixner wrote:
> This small series enables support for auxiliary clocks on top of the
> timekeeping core infrastructure, which has been paritially merged. The
> remaining outstanding patches can be found here:
> 
>      https://lore.kernel.org/all/20250625182951.587377878@linutronix.de
> 
> Auxiliary clocks are required to support TSN use cases in automation,
> automotive, audio and other areas. They utilize PTP for synchronizing nodes
> in a network accurately, but the underlying master clock is not necessarily
> related to clock TAI. They are completely independent and just represent a
> common notion of time in a network for an application specific
> purpose. This comes with problems obvioulsy:
> 
>    1) Applications have no fast access to the time of such independent PTP
>       clocks. The only way is to utilize the file descriptor of the PTP
>       device with clock_gettime(). That's slow as it has to go all the way
>       out to the hardware.
> 
>    2) The network stack cannot access PTP time at all because accessing the
>       PTP hardware requires preemptible task context in quite some cases.
> 
> The timekeeper core changes provide support for this including the ability
> to steer these clocks independently from the core timekeeper via
> clock_adjtimex(2).
> 
> This is obviously incomplete as the user space steering daemon needs to be
> able to correlate timestamps from these auxiliary clocks with the
> associated PTP device timestamp. The PTP_SYS_OFFSET_EXTENDED IOCTL command
> already supports to select clock IDs for pre and post hardware timestamps,
> so the first step for correlation is to extend that IOCTL to allow
> selecting auxiliary clocks.
> 
> Auxiliary clocks do not provide a seperate CLOCK_MONOTONIC_RAW variant as
> they are internally utilizing the same clocksource and therefore the
> existing CLOCK_MONOTONIC_RAW correlation is valid for them too, if user
> space wants to determine the correlation to the underlying clocksource raw
> initial conversion factor:
> 
> CLOCK_MONOTONIC_RAW:
> 
>   The clocksource readout is converted to nanoseconds by a conversion
>   factor, which has been determined at setup time. This factor does not
>   change over the lifetime of the system.
> 
> CLOCK_REALTIME, CLOCK_MONOTONIC, CLOCK_BOOTTIME, CLOCK_TAI:
> 
>   The clocksource readout is converted to nanoseconds by a conversion
>   factor, which starts with the CLOCK_MONOTONIC_RAW conversion factor at
>   setup time. This factor can be steered via clock_adjtimex(CLOCK_REALTIME).
> 
>   All related clocks use the same conversion factor and internally these
>   clocks are built on top of CLOCK_MONOTONIC by adding a clock specific
>   offset after the conversion. The CLOCK_REALTIME and CLOCK_TAI offsets can
>   be set via clock_settime(2) or clock_adjtimex(2). The CLOCK_BOOTTIME
>   offset is modified after a suspend/resume cycle to take the suspend time
>   into account.
> 
> CLOCK_AUX:
> 
>   The clocksource readout is converted to nanoseconds by a conversion
>   factor, which starts with the CLOCK_MONOTONIC_RAW conversion factor at
>   setup time. This factor can be steered via clock_adjtimex(CLOCK_AUX[n]).
> 
>   Each auxiliary clock uses its own conversion factor and offset. The
>   offset can be set via clock_settime(2) or clock_adjtimex(2) for each
>   clock ID.
> 
> The series applies on top of the above mentioned timekeeper core changes
> and the PTP character device spring cleaning series, which can be found
> here:
> 
>   https://lore.kernel.org/all/20250625114404.102196103@linutronix.de
> 
> It is also available via git with all prerequisite patches:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/ptp/driver-auxclock
> 
> Miroslav: This branch should enable you to test the actual steering via a
> 	  PTP device which has PTP_SYS_OFFSET_EXTENDED support in the driver.

I have some dumb issues merging this on net-next.

It looks like we should pull from the above URL, but it looks like the
prereq series there has different hashes WRT the tip tree. Pulling from
there will cause good bunch of duplicate commits - the pre-req series vs
the tip tree and the ptp cleanup series vs already merge commits on
net-next.

I guess we want to avoid such duplicates, but I don't see how to avoid
all of them. A stable branch on top of current net-next will avoid the
ptp cleanup series duplicates, but will not avoid duplicates for
prereqs. Am I missing something obvious?

Thanks,

Paolo

