Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B6220C030
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 16:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743525387; cv=none; b=igFQ62P2GdXDoW1YuW6EKc3u1XsI+z1v5yWp4pdI5/otqq1QmJssS5rskNu/13UJiEbaInMcszzbNmiw2Y45Q90rn7QiplzNpnzQwocuH6uclVVuVx4j2EeNR+jy5KKqfy9/0yk3TrpW2AnQgJqQvlHCNFCKMWs6gFXi7wZLIgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743525387; c=relaxed/simple;
	bh=D6sNF7Z1CFTYLjjafoK97rcaY9AK8pnnYevtkw0IPVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XhnZchMcUWNN/fhOcSBtKfeXBoXQGu+YdeUFdoKZqJjmesBkcHQ+zxEL2a9FuvJd0jVkijF3ZOhmBCApFMEg5dsqB46zMYv3oLsOwZLqOadufLhNl3Eedr6orieu2lP8GP6+wUzhL3EF0JZ81oO7OQh8bneS5XOUAktOXt7awkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BvLPH6V8; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BvLPH6V8"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ff6e91cff5so10054374a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 09:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743525385; x=1744130185; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6PD/PgO3ncsJ3cZCJrRv/Qt4Ciw0gv+K6O/dnt5CkV8=;
        b=BvLPH6V86TRAMmx8/X/G25/jz4pMqw1fGvkQcaeY7gsZDgtDLF44TKYtvUX8v6igYA
         ZqoqC5BQ6MWXOa4CbPhve4oNARQKSxnEkiUGJd4USt3BSvwLyW/mUdUa01ol4QPqIV6Z
         1Anq5s5CDB0RkQlTY04D2nUFQftuaE/dxBK3tyzqvliWB1fvgPKbV9Tc4mLN4o0VoOtb
         OB4EIJt4Yn5J+rnVD0wyAqXbhS08esJRX5gXKJBvZ5+vxLC7+SlFRsDoz9LlQpTuvTYY
         3K2k7eRb0RbXGKKXjfekUT4qzerZ+i3NzgWScvsOhcSdcS/hbJiPF3Ua6hrGGsqpo1Mj
         pcWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743525385; x=1744130185;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6PD/PgO3ncsJ3cZCJrRv/Qt4Ciw0gv+K6O/dnt5CkV8=;
        b=CT7Y/Ib8VVWuwe0YMv6EZ8b1JMpCSs4oeMG1eGbSo6gXiG9zq8+/9MQtXfUFKSQdwr
         QUsio6oxaL3r49zag7ZjlFlIVIW1aOnluPWML+KFO0RueCtUxzLQT3tz+n/y186iJQQc
         vJPf40HH2XT50jBsNqBsyx8itB4h9DdPMr3lB/xFqY+xT6pZsJhjt1ftRZuouyUCVWQk
         LyySkc+pN+AL1VVLNch4L916+zvN3kMD4ycRIDV5W1xEtrbSj/7QhpY6JltH9XZAT19l
         XkLja/VQfVAzT1+piQVV5o79zP/PU4JCYG8AkoVa+WLUqg90I5u3zqsirjM2hT93IfRC
         lyFw==
X-Forwarded-Encrypted: i=1; AJvYcCUYJb1OpZ+hgkqtuMxxqFkXG5fXqEj9CNe8rjsfqCsnbCPNRrllqlx+zCQ2Rcsutiv6S/6WWgS2Aj3caD8=@vger.kernel.org
X-Gm-Message-State: AOJu0YygI2Arf0Z271Yt2ZkOcG+4BdLF9eTGKGbwytVYfZx/rJCDpZLp
	8ljgSH/z3qZ7KIUpxflRfDELmJU5iIn0OX4OtCl33Dakv6Y11x1ovFWG3gGAGg==
X-Gm-Gg: ASbGncuKfwohRsXGBE6xMgyf2ez8GIN9/MPwbdlJ1PbhFLjW/SGbG3D+NotXbumyyZY
	BpM2BGN97Sr8riYzjO94Dbc5JZKP7FKNd4g/LtGpprKzgztEH9mddTDNilWPRDIV1ij+9XITSGm
	UIRLyOcGaweVj9yaXX4t1LDxe2hxXExRImtjHX0r+ra4BSOBulsXp3rcUvYou3cxKDR8C/ha19D
	uAaVbRVWpBN8MZw6IQk2uKMUpTG16InVtVqUYCY6FshXktn4z3YOcpy3DRdvBUUQmi8st/YDh+S
	H3aY5hFVJGKielYNbUt016iAcqSbbeZUJt3X/SO+LnACeSZH9q7xnbnj6o2U1PjKjXRNwwhBeRx
	om8qz8V+jq0GHNHs=
X-Google-Smtp-Source: AGHT+IEzU+hLZLEqxJTjXsu2ERUIGdFfgSk9TWMvKqglUiejKKsOC4BUUb3g94o4jueNGuOJWVn+bg==
X-Received: by 2002:a17:90a:f950:b0:2fe:b8ba:62e1 with SMTP id 98e67ed59e1d1-30532147209mr20787773a91.28.1743525384529;
        Tue, 01 Apr 2025 09:36:24 -0700 (PDT)
Received: from google.com (198.103.247.35.bc.googleusercontent.com. [35.247.103.198])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30516fed6f4sm9502139a91.32.2025.04.01.09.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 09:36:23 -0700 (PDT)
Date: Tue, 1 Apr 2025 09:36:19 -0700
From: William McVicker <willmcvicker@google.com>
To: John Stultz <jstultz@google.com>
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
	Saravana Kannan <saravanak@google.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Hosung Kim <hosung0.kim@samsung.com>
Subject: Re: [PATCH v1 3/6] clocksource/drivers/exynos_mct: Set local timer
 interrupts as percpu
Message-ID: <Z-wWA-46L08V89qK@google.com>
References: <20250331230034.806124-1-willmcvicker@google.com>
 <20250331230034.806124-4-willmcvicker@google.com>
 <CANDhNCqNqXfGgvo8vNof1qi3E3jejk5KBD=oedZp2_p8RKZdjw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANDhNCqNqXfGgvo8vNof1qi3E3jejk5KBD=oedZp2_p8RKZdjw@mail.gmail.com>

On 03/31/2025, John Stultz wrote:
> On Mon, Mar 31, 2025 at 4:00 PM 'Will McVicker' via kernel-team
> <kernel-team@android.com> wrote:
> >
> > From: Hosung Kim <hosung0.kim@samsung.com>
> >
> > The MCT local timers can be used as a per-cpu event timer. To prevent
> 
> Can be used, or are used?  If it's an option, is this change important
> in both cases?
> 
> > the timer interrupts from migrating to other CPUs, set the flag
> > IRQF_PERCPU.
> 
> Might be work expanding this a bit to clarify why the interrupts
> migrating to other cpus is undesired.

Let me dig into this further to figure out if the IP has a limitation where the
interrupts need to be handled by the CPU the timer was triggered on or if this
is just an optimization.

Any chance you know this @Youngmin?

Thanks,
Will

> 
> > Signed-off-by: Hosung Kim <hosung0.kim@samsung.com>
> > [Original commit from https://android.googlesource.com/kernel/gs/+/03267fad19f093bac979ca78309483e9eb3a8d16]
> > Signed-off-by: Will McVicker <willmcvicker@google.com>
> 
> thanks!
> -john
