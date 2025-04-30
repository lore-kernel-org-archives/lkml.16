Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD16EC2
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 05:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745989548; cv=none; b=B8jDreyfZYkzMPNi2R0vmsx3KOepxswMbRAuppudrHtPzlbgPpY9H2Tlqw+EBD5VLB4shEBVZXI45ozlqK2uEg1e9ManpeBbuYgiGkniO/upCK0hko6XYWzo1sx52hgG8NyOthsnonK4Cvwc+eVU8FJXSTvj8TGe1/KKUMHhDR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745989548; c=relaxed/simple;
	bh=3tjOMP58x/3zeUA+LOTuf4YeU3N/ptmgKMvbxChLftg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DZ8oHfkKELgN4T0BE2qe/D0JxZkiHGKr2vTSIVokSODIm+Mzr9Hyy1nUEswuT6Q8tCgdcBxWuTJS2lvmabRVc6Tz8GPRnAV09/imn7A7q9uGn23tWGV7l86AWf+dMjmnvTbNDwZWqYJT9Qhrc+Ra/jAOqp4Xu9KSO3wcd2HAKyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=efNQicKf; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="efNQicKf"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so6437094b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 22:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745989546; x=1746594346; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3PThE2f95SSK8bQLEE07L6mVweN8p+sIUF+7bgBgnDU=;
        b=efNQicKfqgvRXuYYEe5uO7Piv7TZoo9UWowlo/edoM+I4AvN9r8LK5KRlDOXMlzNWG
         1g0JzmENYxZJzuO7LH2r1YKGgkOkKKA9R44lyihwEM+i/WNfRofHhLQkZg+brVzsMmhz
         /+MD0D9xLUwpPMnlGymz4jYfW1JfBVUcWaAhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745989546; x=1746594346;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3PThE2f95SSK8bQLEE07L6mVweN8p+sIUF+7bgBgnDU=;
        b=nAObHoeZ/cWM23GKTI5qmdhBhkqWBlTO1JeqMm9QYtEsyp80O0B9X2451D5d0t16UM
         wJIfruvU80TZR2c0kZ+MBqSB4Ky90zEINp5qwf3Bqaz+bPizBkdLsgPaesyju1ClxtTE
         fUj6hYyXg/nNBr8gWFlhu13jVAme6EXAkaj1lGuY6yzoDBAEjwzCS+MNhfpUrbFgtfpg
         K4fvOpNNA30lYhi+70Zr9FDhIToisx/8TejqROpdLjXOuNX3+PgvYDsadoo4yJGQhDPF
         MdUBD9XWX8ohIrPZNFDItdI/ilo1+dyTG18XxDKu0kloFn4RGaoLJVcgpG8iA8mHqjdA
         mO9A==
X-Forwarded-Encrypted: i=1; AJvYcCVwodhJfGDp8IDfpQa8dJ+NjJYvmM8yFCJsXpH/QNI9FxLruSwIFWBWRArg00K1NTN6AvgaZ9Uqyr8Ieds=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3HeMApMf9/IpxzwjBxNLLVLWbm7iNzn3IyzT75FxwV0JFjFoA
	QA3RkeB7GsSCFiNqqbfGi1NM29XCpw7DUkqB5hLEekU8MXYYhs2HWmxregdK3A==
X-Gm-Gg: ASbGncuuk2WAClEsI/ZW5Tdn5lRVPMe4SygTopgVH/cW+W9EPLyI46eX81qxHn1XJD9
	vQYmBE4YWFNc5dVNyatCXP18m+CVO1SOWZ9/R87tshcx9s6v8xG73EnGXV+RIWkIyDQ82sXAz00
	CFm2eUtOpZKnLUbHAT//qvgPb+hRvrYah5SO7Qayy+Fx2UgJOhIBrjX8YpcHN3itYcITzcBkH9f
	vM9sKC6/mQQV+fe7sOmzjZ3U/KkWdzlyOcriql9Bcz2x2JWNFLdef1Ds2XFBfEoSAkhk4hjQn85
	juiQ7F9LK670cTmNXYqkk5tztuhO8TTkcA11mrkuR6Oh
X-Google-Smtp-Source: AGHT+IE3WMVm32stgEhhqU7s+NqwqbwPB3f+pg9R/eEJO+gMemroS0kgWoC7BF3Sx9Lsd9BVDcb29w==
X-Received: by 2002:a05:6a00:3990:b0:736:5dae:6b0d with SMTP id d2e1a72fcca58-740389a9512mr2545055b3a.10.1745989545895;
        Tue, 29 Apr 2025 22:05:45 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:6b70:3d67:24d5:d900])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740398f9ee5sm694393b3a.3.2025.04.29.22.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 22:05:45 -0700 (PDT)
Date: Wed, 30 Apr 2025 14:05:39 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: John Ogness <john.ogness@linutronix.de>
Cc: Petr Mladek <pmladek@suse.com>, Tomasz Figa <tfiga@chromium.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Steven Rostedt <rostedt@goodmis.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hung_task: configurable hung-task stacktrace loglevel
Message-ID: <ex23fyhfgsdapar3vg2nohkkqgxzbvawh47mvzxkxlhgyaksjv@n2a5omy7wjn7>
References: <20250424070436.2380215-1-senozhatsky@chromium.org>
 <aAoZbwEtkQ3gVl5d@pathway.suse.cz>
 <CAAFQd5A6J-UCy46bp1MYP0imJf3oUL29mxFVLZZZ4JmP2YTvhQ@mail.gmail.com>
 <aAuq-3yjYM97rvj1@pathway.suse.cz>
 <84selszp5x.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84selszp5x.fsf@jogness.linutronix.de>

On (25/04/28 10:11), John Ogness wrote:
> On 2025-04-25, Petr Mladek <pmladek@suse.com> wrote:
> > I am afraid that manipulating log levels is a lost fight because
> > different people might have different opinion about how various
> > messages are important.
> 
> Wasn't that the whole point of Sergey's patch? To make it configurable?
> 
> I must admit that I am not happy with the patch.

Same here ;)

[..]
> In other words, I would prefer to recycle the emergenceny enter/exit
> markers rather than introduce new ones. (Unless we are also talking
> about reports that are totally normal and acceptable during runtime.)

Adding "--- report begin ---"/"--- report end ---" markers everywhere
probably will suffice.  Paired with printk-owner these should make
log parsing error level independent, I guess.
