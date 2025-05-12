Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC46E21770B;
	Mon, 12 May 2025 16:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747066139; cv=none; b=gI6vGmu19IoxFqAyNmJnosq5NG9N8SNsDZJxj/bBpilnlpAldLuJDghiHhCqbxbikAYbwzo2cbfm+SmseDS/5Ht4SG2j8xZZFrsHYWSkR5cIlkVNzk7kJoIXWygXD5CqUv5PGeg652x/iYmQeg8NG925xnM3HUUd2/BAO59Dv5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747066139; c=relaxed/simple;
	bh=GtFHCpKmWgumg5kfjLlUPZMRhZodvVQlEjZCqCQOXug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ifWqQQ9KYxgSC0khVETBM877S2HoLnpIJLj8CHz/fG2KbgK1bs55oPYH5qlBtNC1jOEFftY/KK/suAwpzgjg0Dyxu4mf0cKfSKL/caT01ySpIkwRUeKC+teEeXoWqVAqwYptXKcuw5JB+cniQCGAhoKAvI9G7ogzDe1qWJ63wJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SteE+40c; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SteE+40c"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5f5bef591d6so9730630a12.1;
        Mon, 12 May 2025 09:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747066136; x=1747670936; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qEsAI2COF0r2HL5oebsAQkXwVMnRApoak0sIere6jr0=;
        b=SteE+40cv8Jzn7g+JsFpanycsU/3p90GzAL+GyGclA1YLZUkxa0Hn80l5Azvh5VfIH
         BhlxeHiUUwl4uJk6zBtVext8litfJM3R5JZpAKWXdGf3e9QznpSipg1kyOJcrjtiYTm5
         Pyxwo/P+8XMN5Q+ljQFz43JVTTr9blN9cRByYKrHS1mfS1gxC4aJZ+KknE0RbTSemSHj
         RLEUyeHld257MvtproyOOQsSLHR3ljrFQuCSaC093sZZCZ/1qXL78DtNQvTZGB5Hpgpr
         S5PJI1Nc2y3Hr9emKAIaZe75I+khxCC4ozHNirVVytRO1CCBl1x7eIJcwogboOr7tmmI
         c0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747066136; x=1747670936;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qEsAI2COF0r2HL5oebsAQkXwVMnRApoak0sIere6jr0=;
        b=DaJ6jOwiu7/zO8b7ETiJ0t1UXiacg4PyTmrCKqZgLe3PlnBdtQtKK5t+o3znt+Oxub
         KcQVNLpVWZYSDruGjBlOpR48rKOZMcqIJxE6+UbCEUBHl83Eqpyl5mpgrdbYpHcwZyfJ
         XOP+Y4KV0/2A5y6UcYIpWbPIjlJJd5Fv+Q4isGxym+YH/3EJ6qumTRtWTZFvdocbA0Vd
         f79m4ljkM7gB/xzyjUARxfI7MkTbDFr2ApajcTvIAWmSt5cL6mjhx8Vu0GvF55Je2mLg
         pW88VfoWPFfFcoPQGV4lSN4Y77lTNLcZ0uHFAf051ls/rsy8YLlAIEoSnLfE+nZ2BOvB
         RRtA==
X-Forwarded-Encrypted: i=1; AJvYcCXWDspmVQx6Nf12sZD1/ESTuYRl2LFroDBmBZ+ttIZ8/Fg1cNki+SEYrS6t186RwTYkhRYV9hmKEDP5DU4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr8AGXl+WpYmudT+s9GqY0j/5xtU0J5xnChDBbK4cToHlc9DoX
	gTL7jsVqL1DVAbpKJqkL+MMdTRIYvsFwrPhbWbeG2o9NloS10a4=
X-Gm-Gg: ASbGnctePHYs86tfjbg+ONbIpb/smZtjDlLVBXxMAdrGqkfT0I90ux0GmSSCuaj1hmJ
	nVN3oB4Cl/AWG00m7NwqRSjmtANfWUGwIVDipBnPa85Z0Q0dq+cVY/1QslUp5v0uavkjvYMwO3c
	B/HqOV6wHI0PmqZAda/LByvXlXyCdOxme5MsdPQymUFHqR67Esz6rUcVsXeTlKhnCiJG1jpdi1w
	BnO0JsSs2/aY9njImmST85ZWjTn0EQTV234mB/ycZHJJjqlOYLt16XujmS1cRhVmKou0GMxg0H1
	ezpdO4/PwzYiW1iL5t3ujh0HBCySRlfUdUS6
X-Google-Smtp-Source: AGHT+IFgYQSOmtOhWap/5tgAF1XXuzAr+ZzRiPgyJCaorz27QzuB/tXqUB1fLyiM3jt+oZ3oCU0PRw==
X-Received: by 2002:a05:6402:27d3:b0:5fb:cdd2:8040 with SMTP id 4fb4d7f45d1cf-5fca075dd1fmr11288270a12.12.1747066135724;
        Mon, 12 May 2025 09:08:55 -0700 (PDT)
Received: from p183 ([46.53.249.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fd29adb7absm2528711a12.32.2025.05.12.09.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 09:08:55 -0700 (PDT)
Date: Mon, 12 May 2025 19:08:53 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: workflows@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/9] CodingStyle: make Documentation/CodingStyle into
 symlink
Message-ID: <77f03295-df5d-4bc0-9a61-5be829969662@p183>
References: <20250509203430.3448-1-adobriyan@gmail.com>
 <87frhcsrva.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87frhcsrva.fsf@trenco.lwn.net>

On Sat, May 10, 2025 at 04:05:29AM -0600, Jonathan Corbet wrote:
> Alexey Dobriyan <adobriyan@gmail.com> writes:
> 
> > Every time I open Documentation/CodingStyle it says the party moved
> > somewhere else. :-(
> >
> > Of course, I forget where it moved to by the next time.
> >
> > Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
> > ---
> 
> No 0/9 cover letter?

Not really. Cover letter would be very short:

	Tweak coding style to add things I've learned over the years of
	Linux/C programming.

	And stop making kernel devs look like aliens from another Universe
	(see static_assert() rule and especially(!) "declare ALAP" rule)

> Just FYI, I won't apply coding-style patches without a strong sense that
> there is a consensus behind them...I suspect that could prove to be a
> high bar here.

I split them like referendum ballots to see where the consensus at and
not have big single discussion thread.
