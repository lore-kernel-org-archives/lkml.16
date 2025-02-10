Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA88182
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 01:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739150058; cv=none; b=D2QyfqAk8Xbshl1/eRW7UZHXtKo9yynZ5UYSIWp9z4sbrwMMaVvmqLcvZCttkfzmfg2GO6FP702R3NfZE7NYKG3ZXXNXlT5mv/+8tPfwKZAwW4cAm47aNKsxT5pKvdvXrv6l2wej9G3a3yaULjq5pQ6GrfkbSFNweW32B/+F1qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739150058; c=relaxed/simple;
	bh=NyM8cio96fQnsdXx4Lz8TqGY2DxnEmYS27gscqVC6hw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pCnkyX20epQXVBA+3OYHIS1B+Kiv+5fpZrCP9B7vuFxVT9qtYc3j99n6e09sx6jh7+dL07zl9zrZ2zlSFH1Aojsg6s4qfeb1hN40nyAvaOOOUEQ2xW/4zaWCJA89mNGJElCerteL2TnjWAMvSkPt7bVu2LrFL7bWRIrzN3XRFmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io; spf=pass smtp.mailfrom=layalina.io; dkim=pass (2048-bit key) header.d=layalina-io.20230601.gappssmtp.com header.i=@layalina-io.20230601.gappssmtp.com header.b=wdMg2MOB; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=layalina-io.20230601.gappssmtp.com header.i=@layalina-io.20230601.gappssmtp.com header.b="wdMg2MOB"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38dcc6bfbccso1254035f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 17:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20230601.gappssmtp.com; s=20230601; t=1739150055; x=1739754855; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NyM8cio96fQnsdXx4Lz8TqGY2DxnEmYS27gscqVC6hw=;
        b=wdMg2MOB9EekyrusS8o+dhkOdj92KLLuNaI8cYHtVwEFNxfO7JcX80j7bxKA68gYik
         I7x0AvpT6vPwj/d2YrdOxeIKDXGzQ67mOGzxO7zKffsWw7kdd5Xv4aWGGF1iNaSes8OX
         RKK4RNF3K5k9WrNKf3CcshMKLhHjoSBXCBiMZsBxzoTyVn6SOj8V+obX2BTCk4JwxP1g
         +jlhns7jrocoeYiRv5cYqyZZwx+qHF3ulcMTk3Ct0CcvX0xsMgwgJGySdMhlf1cZWL8k
         YCQxF9MVpXnWvoFpH8rVNNLUh6w7S1FH4q5ZZ2sPE6bwZjEJR304q/R87imlU5XwsBbx
         keOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739150055; x=1739754855;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NyM8cio96fQnsdXx4Lz8TqGY2DxnEmYS27gscqVC6hw=;
        b=T6One5Gg2y/EcW8UvdS192PvYLAt1Jm5oEefRBx4SzetavKrHhHkQeM88UCjsWoDg5
         9jd6IHNHUyfCl9taz2sacNJy0fFlgg5SwWnVaQsDWPnEh0/gj9pK1CVqw5TFw0pqJeKp
         MUaI1IfgAnx/iyvHyeaAcvfb1zVGQw0qtY22TbFWUwPNyZuBkVX5c52quxlPl/naKFD3
         DFS5fxQoxpgEEKFdaFxyAUrO/UaavplCk4ivK17v0gdwlG9Hyhqmm8dZIAN/A1N6HgWY
         QHfx44v+OBs0Nm+s+/HEdnZk7k2UtoqJfx2hHtZUERK6fa1ZxqddqYP4xFbScslJc/tj
         JvQA==
X-Forwarded-Encrypted: i=1; AJvYcCX917ltnxSbseih/lQZYTsK2Mdz1JD17ZF5Ji0aKOa5fa6ldINtbhaMDsccyeoUbWtILbKSvL44OTNy+28=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3JSbO46DcsYIvXnNNvtcA4mpgpG5CfBJXHtFvTe9vkUcsdpgX
	lXY8EpVsu0fpkaiAHBEz7AIBQltiUJTS50KapeeYdJjfc44yscZSx4BOCJ40t7M=
X-Gm-Gg: ASbGncsbCRuUlHy1q4UZRXOUEyDoIvSEdedEC/17Bsmj864smZHpixXY6ucMCDu2z/U
	01rEZRqwhJG0LNQI/dhvuQ9vvbhNT1M3E/5I4iR5Wg6hopEWpI09svHmv4wtfPjsWmj0Ds12HPQ
	FPzwn+PweM/OLoXzH55Cfcp3kc8Lhu+V60z56msRf7ptRISdbduLaM8qgpJYVZNwycLIQOyhi/p
	GYl37DNf9ICfLCG8S4lGnq4krM4ai78TzhuMRQmkYHCDhPa4p0yEp0XzlSBC4RrmbyxrBE2i4al
	Am+uBSNGXqRw32i30JsfM0rPPB7szLAwnKJmN8OE0zVNbSFAVDenb2OdhPlpvBwIxLtl
X-Google-Smtp-Source: AGHT+IFaxoG8PspfNQgs9ZrKhJsJGSassfH5vK7a8F6sxyQJOw7XlMy/r7h1UQkFOMzO2zGssbh4bg==
X-Received: by 2002:a05:6000:1445:b0:38d:d387:166 with SMTP id ffacd0b85a97d-38dd38707a3mr3990985f8f.34.1739150054942;
        Sun, 09 Feb 2025 17:14:14 -0800 (PST)
Received: from airbuntu (host109-154-33-115.range109-154.btcentralplus.com. [109.154.33.115])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391da965b3sm133163775e9.5.2025.02.09.17.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 17:14:14 -0800 (PST)
Date: Mon, 10 Feb 2025 01:14:13 +0000
From: Qais Yousef <qyousef@layalina.io>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, John Stultz <jstultz@google.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Ingo Molnar <mingo@kernel.org>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Stephen Boyd <sboyd@kernel.org>, Yury Norov <yury.norov@gmail.com>,
	Bitao Hu <yaoma@linux.alibaba.com>,
	Andrew Morton <akpm@linux-foundation.org>, kernel-team@android.com
Subject: Re: [RFC][PATCH 0/3] DynamicHZ: Configuring the timer tick rate at
 boot time
Message-ID: <20250210011413.whnkxo4modrx6gbc@airbuntu>
References: <20250128063301.3879317-1-jstultz@google.com>
 <87cyg67up9.ffs@tglx>
 <20250203111433.GF7145@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250203111433.GF7145@noisy.programming.kicks-ass.net>

On 02/03/25 12:14, Peter Zijlstra wrote:

> The whole preemption thing could probably be replaced with HRTICK (which
> might be suffering from bitrot), but the problem has always been with
> hrtimers being too expensive (on x86). But ideally we'd move away from
> tick based preemption.

I do think HRTICK must be on by default. Precise time slices are important.
Especially if your plans to attach changing of base_slice to
sched_attr->runtime are still happening. People will find lots of surprises
when they ask for 500us runtime but end up running (much) longer, especially
with the default 4ms TICK value (which I just posted a patch to change it).

Can we re-evaluate the HRTICK impact?
