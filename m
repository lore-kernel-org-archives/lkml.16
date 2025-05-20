Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821BC21B8E0
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 06:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747722245; cv=none; b=t3uqsgJsRhtz0qDZP+6URoqXfb+RlIxsAinvflF/LBe1ERGr0DaMJ4Wnd3JYWUh9z1kOL8gu/I33s5GhLDj0mP+sG+qtYR9AjnwB8eHjTWB38IFovPeSljxUcpFCJzlE6HH7s6DOiYkzq0f98CsYrvGuyHOwNcochryNJof4Vbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747722245; c=relaxed/simple;
	bh=OErLSkE/m1BgaO00NjK5OW2PuAYt7QDHMHCcdsySpeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nDGzcuJfLlMWJ3OI/ohcn9Wu6XiGGKVRCJgmZ5oFoUOqV5QWNnQLu+ZET3XpFNKczDqLv1gDgCvD/E7sDo/V+qPa5U7rruFq1CkUDDZqF0vuVEZ5V3JLrf+veBf8o7oEC3uVf2fCNSttHzbr9KnCoKrt6sZhYfz02mfHPlurEV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xxvDIST9; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xxvDIST9"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-30ea7770bd2so3862520a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 23:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747722243; x=1748327043; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gOOxKXVW+mfOfzJmAX4sL2q7PTCJ7BSmtyABQv/dOSg=;
        b=xxvDIST98ZmUGClwtCZ1V8zaW6UkaSftWh70vM+tKUL5mKWJNVXfO+hWqXglXNR2pZ
         uy5c8IyRLbUyJdN7vuDdOOisyG6NCChfVX/38mQ4jje8kDpbx3zNB3eEa+26GF6uaoqO
         nkpcmhJ6I6HZePUwE1m1vpHRgyC5iu+G5hn440eWjwa4URvNlt0CkpqthPxQVA53oMEw
         liLGTmFMdGqi9ESszqHbFfdVZ4fWU89FF/ZSC25c3BflElXOw6BTJYR/F5hDEp2hnZqv
         nshJ5t6BwkN4DXHf49j788sSJbZDjKQAW5xyjU5Izh3ZpRI/1WjGvwxhAfw6Tdpwiyan
         hpjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747722243; x=1748327043;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gOOxKXVW+mfOfzJmAX4sL2q7PTCJ7BSmtyABQv/dOSg=;
        b=bnPUdcYayLYD9aHKZsRGqsHBQdTPwBuwsBZwvXDIX8MHVoPvGdx7qL5cqTpjHrxnUi
         leeNj5EoF4xRI2rI3cNMIWKgyKht+NLrFGjuUYkWSopQDBJ+H3YuS6IjuwK3nqdTqQsM
         ySJwmtLvYeTchR/uyoav5jFpjr1Jo7KBT1s9LbqVNCSpumAzKdb2eXTgNo+kKY4kt89b
         vQbyxSD5bh0Y2tHuuvYo0/H6CsDEeXf5C5VyZdKYrn399/lDvq8RpU5EDhosCh6SVaRG
         55LzuWZyVn1Ir6ZoO9/OCCGCZH9W6/K9iF7psYRsx9jeJ4StlxIhv+2hmNCSwPuu9Mp9
         FvLg==
X-Forwarded-Encrypted: i=1; AJvYcCUFDDOGV0RwJ6DmqUxCZijHMCRoE0B9KbqEbZn5qLAjm0ChgO6fSNIJVX421NmoE+I8fXnLy8wNJkvvdv0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHnFTBczGtq+/JiKqK6BlqyHoSz9aAntDBDE8b7zQOTixoRvRy
	QzkSA2ddSjIp6yoS6cE+Q7xd8RPkN0/z4BQoBVa0YCIPbPalNKWRFXW6j+m9SuGFYt8=
X-Gm-Gg: ASbGncuSHVL6Hyn3VHwawnMZKx+0MiDvzE7+hCXDSMxdBPfbt8TpZiC3h0POU11Pd6s
	uxMCXA87BBN0YI7jK3/OTt/pisoiTtzlrNNL/i4SIxLgxc/Le8dJbmWlVymxx14pH/xXGiKJCL7
	xN0MkabKWxxZRx77wHuUhyP90IKSnJNHNbEtNTOEBfOftZj59Je6apqKqM6YHPE8gwnFmKGKYmH
	zyLbArnONNa4sJJOXX2uf4uNROEPRkoROJ0o35/qDDxJNGhfZHyiQ3zXNJqgWRpl7f78SDIjzPE
	BvK0mCockENOaI3ayPBspq3AApwmkkmuH7kzrPDSm0LxpeKfa02Z
X-Google-Smtp-Source: AGHT+IHX+LQFIfZztGFcwBpfpATN8GuvitXJDkA2u+hyNtGRg1r5lgWVjoOyMg8lPkAa6aTJv5nQeA==
X-Received: by 2002:a17:90b:394d:b0:2ee:d024:e4fc with SMTP id 98e67ed59e1d1-30e7d5bb433mr28527339a91.33.1747722242148;
        Mon, 19 May 2025 23:24:02 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36515776sm934684a91.48.2025.05.19.23.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 23:24:01 -0700 (PDT)
Date: Tue, 20 May 2025 11:53:59 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <benno.lossin@proton.me>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>,
	Michael Turquette <mturquette@baylibre.com>,
	Miguel Ojeda <ojeda@kernel.org>, Nishanth Menon <nm@ti.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Trevor Gross <tmgross@umich.edu>, Viresh Kumar <vireshk@kernel.org>,
	Yury Norov <yury.norov@gmail.com>
Cc: linux-pm@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	Andrew Ballance <andrewjballance@gmail.com>,
	Anisse Astier <anisse@astier.eu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V12 00/15] Rust abstractions for clk, cpumask, cpufreq,
 OPP
Message-ID: <20250520062359.paojvjytle4yznpz@vireshk-i7>
References: <cover.1747634382.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1747634382.git.viresh.kumar@linaro.org>

On 19-05-25, 12:37, Viresh Kumar wrote:
> I have queued this up for v6.16-rc1, will merge it via the PM tree soon.
> Thanks.

Sent for inclusion in the PM tree for 6.16. Thanks everyone for
reviewing the work.

https://lore.kernel.org/all/20250520061944.pl3mqw2clo2roe3s@vireshk-i7/

-- 
viresh
