Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA657143888
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 22:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739140427; cv=none; b=nvHwgMH3NDhx6WGUXx8UQByeNLmQhAF0R1WcrvX3BnPRJYaY3m8FKTm9Bsyr2/3596YXFnDWrYDEodKFeZv17JMo1iFeU7x/lBJQkJ8SUOBAlYdkLudiyMlyID1FpvoTz8/DopLpBUpLqaXjWVbihTpsEXVLlLpX6DN/T4o0DX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739140427; c=relaxed/simple;
	bh=+P3tdg9iMDc66bQa985ioY/Fj7mfeqTDr8xxkMSy2tE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fii5aPOP4Jv6mT/4II73yn9KOhkFAfa/n3LNF0oO0jPp4YGDYlxXSXsaRvlK/TBLsH7ExwA5fSis1cW3ZBhk851s8Bj3bKS+aDW+89KeRZsn+d/T+7bAI/U03xrBa8GL82EWGbZAHCjatsAATYhdv1XrC5VDGmS2FWQ5adFfhEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io; spf=pass smtp.mailfrom=layalina.io; dkim=pass (2048-bit key) header.d=layalina-io.20230601.gappssmtp.com header.i=@layalina-io.20230601.gappssmtp.com header.b=nJ6g30Lj; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=layalina-io.20230601.gappssmtp.com header.i=@layalina-io.20230601.gappssmtp.com header.b="nJ6g30Lj"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38dc660b56cso2679912f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 14:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20230601.gappssmtp.com; s=20230601; t=1739140424; x=1739745224; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=duXjXnbM62DysI4qooaPXahdOWhIB0d6HrRdQoSPGQY=;
        b=nJ6g30LjCirc4njoV0VjYnViso6iXTJQLg5KLJJYuXT6QIu9n2lq6GJMY5m81luabc
         3V0fIH5v9H111M9Az3P4iq+jlhBsyTaGRMKtzjwfUvZDo9jbR1vTOpku+6c6RwrO/JDs
         8B17vI9pEulMdiZ5nHkz2EIu3K7NrhLot9nYo0FzPTCajVrZDQ9CNsyO+Vxwe2g9Z15d
         3d0loEVDl/CAMs1Y+In8cYiiODNEG01/zLHTJcy6G1EGwRQHiUUZtvv3J9QaiWvnH0Dq
         TjVGaBLLDY3z4tuZTs6+So8UxgSYHmStbId76ichYSvKEIkXdZQ/ZteTs+g28HvmKBCe
         GV6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739140424; x=1739745224;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=duXjXnbM62DysI4qooaPXahdOWhIB0d6HrRdQoSPGQY=;
        b=cPzoyINDcgYloJDUrJXUbYytROF2Yy0NwUPCnGAAV/F4cJSs+Eq5FyeFgDdRgoOT9W
         lJ0Lpc+mw5J9eOa6BZLkS2saaKrtKwzD7I6tikYLQJDdhAb1uy71d9ePZDrPD9b7mNHn
         1wdFW0vrq2f2gbkpD54z5GJCdJefzfejKu7livIDHhISVt6FdnaJZuIaWwewZ/z5d/bZ
         6MfoPT6s4QaYyAkRtN0+C3q5qSMriWeMAouzEbnWI6kn7N0ZbxpfCnWaUl3BBdQqfBRO
         Dh7UAhJYMkR/lWbFfJ0HyyGX/eoqgInR/dazCz5qst/NJh9PcKNoK+cMeWnsvCaJDiAk
         AVsA==
X-Forwarded-Encrypted: i=1; AJvYcCXhzuKUQduUuTQdwD7is/uRnvHZqXer+jwNBMGr97A2SqpLEH1IejWvACH5MXx9f4ONqZS9fvM6yiEfyQs=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywja8fda5DiBzkR7vFZLMoSV1JUwIt9jxKVu/kruHD+4UP6/FKp
	rIS4le9+zsvhNxlK7QV0eGd/LG2u3OqmJQahdhGsYkuIrQ3BjZx+9Y6lIEXWD7c=
X-Gm-Gg: ASbGncs4ys8Wjil4s6qd3onht4FbqDwc6ia+K+IcVGXheGEqUlxCMe0IMwGiSHfpTFa
	2QYob66vlAZ/F02IcUBc3K0Ntv5CT98XSsuosFnKLVzVo/AOU4Y89m3RNbMwX5ZyHr+N1foXpYB
	Eb6xAF3cOv8L+oDpv7J8BVw/NylfWVrCB3LQR7yEp4C9fFzGC2Qrcq4PCm8LgF7DdJNrKfzhGey
	PyFCq9eKxpIIXEtbJZsf6H1YD2MwSDXqJbO3MPi0ZPOsW+OcOyBgifkXAfuA2eD87HEdcaaQYNd
	mZviv8dz4ljVPnV89F/9ytl/yrLJP5fB1CmNW6ZlgmHS+MVJr+TO8p1QgTqfXD23YRE2
X-Google-Smtp-Source: AGHT+IEB9J7x5rWSAxdzxoM5bZVttLHbnLt+Pou177UacCJ0/autU4OuH6vfhczYJeafLOxd4akORw==
X-Received: by 2002:a05:6000:400f:b0:38c:5bc1:1f03 with SMTP id ffacd0b85a97d-38dc8da6dd9mr8384874f8f.7.1739140424018;
        Sun, 09 Feb 2025 14:33:44 -0800 (PST)
Received: from airbuntu (host109-154-33-115.range109-154.btcentralplus.com. [109.154.33.115])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d933523sm163902735e9.1.2025.02.09.14.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 14:33:43 -0800 (PST)
Date: Sun, 9 Feb 2025 22:33:42 +0000
From: Qais Yousef <qyousef@layalina.io>
To: Anjali K <anjalik@linux.ibm.com>
Cc: Christian Loehle <christian.loehle@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Hongyan Xia <hongyan.xia2@arm.com>,
	John Stultz <jstultz@google.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7] sched: Consolidate cpufreq updates
Message-ID: <20250209223342.4f2akan6ctxhzsdg@airbuntu>
References: <20240728184551.42133-1-qyousef@layalina.io>
 <ae65e4aa-3407-4fb0-b1f1-eb7c2626f768@linux.ibm.com>
 <fa2f15b1-1602-4fd0-80ff-9d33303b7b5a@arm.com>
 <a1cac0d3-c17d-478e-8a6b-40399a9428b6@linux.ibm.com>
 <886aa016-a439-4981-892d-3e92df526f41@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <886aa016-a439-4981-892d-3e92df526f41@linux.ibm.com>

On 11/25/24 12:02, Anjali K wrote:
> On 19/10/24 00:02, Anjali K wrote:
> >> Do you mind trying schedutil with a reasonable rate_limit_us, too?
> > I think the schedutil governor is not working on my system because the cpu
> > frequency shoots to the maximum (3.9GHz) even when the system is only 10%
> > loaded.
> > I ran stress-ng --cpu `nproc` --cpu-load 10.
> > The mpstat command shows that the system is 10% loaded:
> > 10:55:25 AM  CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest  %gnice   %idle
> > 10:56:50 AM  all   10.03    0.00    0.02    0.00    0.18    0.00    0.00    0.00    0.00   89.76
> > But cpupower frequency-info showed that the system is at max frequency
> > root@ltczz10:~# cpupower frequency-info
> > <snipped>
> >   available cpufreq governors: conservative ondemand performance schedutil
> >   current policy: frequency should be within 2.30 GHz and 3.90 GHz.
> >                   The governor "schedutil" may decide which speed to use
> >                   within this range.
> >   current CPU frequency: 3.90 GHz (asserted by call to hardware)
> > <snipped>
> > This is not expected, right?
> > I will work on finding out why the schedutil governor is not working on
> > this system and get back.
> Hi, I found that the schedutil governor is working on this system. I 
> concluded this because when I printed the util parameter passed in
> get_next_freq() when running stress-ng --cpu `nproc` --cpu-load 10, the
> util parameter was always 1024 ( equal to the cpu capacity) and so the
> frequency gets set to the maximum as expected. Adding `--cpu-load-slice 10`
> to the stress-ng commandline, I got lower util values and found that the
> frequency is being set as per the system load as shown below:
> 
> +-------------+------------+------------+
> |  stress-ng  |    avg     | run-to-run |
> |   load %    |  cpu freq  |  std dev%  |
> |             |    (Hz)    |            |   
> +-------------+------------+------------+   
> |     10%     |    2.80    |    1.51    |   
> |     30%     |    3.53    |    2.47    |   
> |     50%     |    3.70    |    0.01    |   
> |     70%     |    3.61    |    0.08    |   
> |     90%     |    3.54    |    0.04    |   
> +-------------+------------+------------+  
> Note that the frequency range for this system is 2.3GHz - 3.9Ghz.
> 
> The results with the schedutil governor for the same set of benchmarks is
> as follows. Each benchmark is run 3 times:
> +------------------------------------------------------+--------------------+----------+--------+---------+------------+
> |                     Benchmark                        |      Baseline      | Baseline |Baseline|Baseline |Regression% |                                                                                          
> |                                                      |  (6.10.0-rc1 tip   | + patch  |        |+ patch  |            |
> |                                                      |  sched/core)       |          |stdev % | stdev % |            |
> +------------------------------------------------------+--------------------+----------+--------+---------+------------+
> |Hackbench run duration (sec)                          |         1          |   1.01   |  1.60  |  1.80   |    0.69    |
> |Lmbench simple fstat (usec)                           |         1          |   0.99   |  0.40  |  0.07   |   -0.66    |
> |Lmbench simple open/close (usec)                      |         1          |   0.99   |  0.01  |  0.04   |   -0.51    |
> |Lmbench simple read (usec)                            |         1          |   1      |  0.23  |  0.41   |   -0.05    |
> |Lmbench simple stat (usec)                            |         1          |   0.98   |  0.13  |  0.03   |   -1.54    |
> |Lmbench simple syscall (usec)                         |         1          |   0.99   |  0.89  |  0.69   |   -0.59    |
> |Lmbench simple write (usec)                           |         1          |   1      |  0.27  |  0.80   |    0       |
> |Unixbench execl throughput (lps)                      |         1          |   1      |  0.44  |  0.13   |    0.17    |
> |Unixbench Process Creation (lps)                      |         1          |   0.99   |  0.11  |  0.13   |   -0.68    |
> |Unixbench Shell Scripts (1 concurrent) (lpm)          |         1          |   1      |  0.07  |  0.05   |    0.03    |
> |Unixbench Shell Scripts (8 concurrent) (lpm)          |         1          |   1      |  0.05  |  0.11   |   -0.13    |
> +------------------------------------------------------+--------------------+----------+--------+---------+------------+
> I did not see any significant improvements/regressions on applying the patch.
> I ignored the Stress-ng and Unixbench Pipebased Context Switching
> benchmarks as they showed high run-to-run variation with the schedutil
> governor (without applying the patch) of 10.68% and 12.5% respectively.

Thanks a lot for running these tests and sorry for the delayed response. Life
got in the way and could only now manage to look at this again.

Cheers

--
Qais Yousef
