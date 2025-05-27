Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F7124A07B
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 08:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748335516; cv=none; b=I58XOTvFUIAO1A7q95M4GJrDQpc7TGym13DAOiElx47Xbf/Czm8KTspxOk5BmG/fk51QEIuxW7fJrgUBaXHDCDF68MqHzwCwoZei9vN33YFv2M7rXVGGolaMjySnHnD/OwG8wdb/bBE0JBjC2kbI60lLoa9odIcywW6R0t6/zk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748335516; c=relaxed/simple;
	bh=g/OHQjDpbJeO7aSJx6LO1dgocetnFYYYHquamLC5R3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k25/Jdb8QylKy/LA/OPUbEOAiXs1gRhjt+7cQpBaq/tmCk7/gRJoDFRWb2flx/bdEM+tgei9Ca9A6oEFACp2VEahFbFSdiJ+C0Y2FOFwonC+pqXmlNC2GLQy1QlIF8d7htLlP1AZHij+uCEQwbpDvy5+KqXv2ji4llaozP+9CzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZXiOZDjn; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZXiOZDjn"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-231e8553248so22174775ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 01:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748335514; x=1748940314; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5plvP5KcTSQCNhrzz/CfYJsTCK3IA9hQqyTdjVPsPvo=;
        b=ZXiOZDjnAlgkV+dy6c98+T5fk5+GvekzhTUhaYblx/SyvseT5NbUCEGeOdj+6FuAKA
         eeen1X9buQbIZh4H+JHPzKz8vQOs4yW3gYmJEnm+C4sZjhXswmVZ6bxC5GcSYBgiBcQe
         mC3SORRhqI/cdaaSnMIEZT/3Wvvr/GQR2s/uo/aoEmJRfJ3v32k0iaSReRSSOd7YzjUA
         BX0P4VCJcZE8F1ai9ZUjSSgHSrgrUI+ynfzDDgEekF+V386R0lzrQnjvR1wA/ug7Fyn9
         J4ulV71P7cG+vnL2yxSBCiMrpX2bexP53clEBs5vmguD8+4qa+n95gtrRBDmAdpyC1d7
         r/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748335514; x=1748940314;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5plvP5KcTSQCNhrzz/CfYJsTCK3IA9hQqyTdjVPsPvo=;
        b=waqycicK6mp5Cjlu0VWP+iaHWBm1P3XBLFkN7CMNrQOVFVOMkhVnjiG62WP0irUG4m
         ok4TtFil4hK+wnYGZfdPDllmz2ZWb9tumE+j+N+Eqd/bq4NMm+dTKgOBUq3/Cup7Cf1D
         rpnRVFiNeEGsBosQuFqU8aD2zYXo7QutK/yzkuRSllrmuDPlJaw7CKY1FbNhWm0u38wO
         apeuYd8UokuvXvqivTf2EewoMe8dRn9YcPBwq/6bdxIoNHHoGAM1Eq+1iuFE8u6fGoEx
         m1ACY+WAX/dEWWnLgpUrCAA+75sO2Fc2Y90ddHh/gj7oEn3zivuu3jnt0tEEw6x+UB9g
         Gkgw==
X-Forwarded-Encrypted: i=1; AJvYcCWGMSOKGyN5RKStvPk0KqptWJDOO0CQstPZZIu2QX14IW4EhboT7VuwTBPsLJmvA1OdfDfGXSUymHJ9n2w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEW1SmKXM8U2c2vEehDdyNV3uiaC+pyCu6T/h805OWYYb46xu5
	b2tUtGEKvYfKyQMlW/w/WKDvZ5z5xnNrl+h3lCpiuAVDqpQePMWfst4fg+6sFn711v4=
X-Gm-Gg: ASbGncu/wbrJsr/bzzegeiyCBl55WUDs99jZdlt37yY19RAqxgeMskYJsMlHRTnCFW3
	8tNfkHWF1IN1Run/XZbFS3SAi4usemgQ8zkUQ9ySE1TzRbOerz7wlb/Teh3cFe3c3gObg6VS8MB
	0t0s68XK9ey8IcdWd3RX9iXACKyVxUA7zaLe3cluBeIKV0sR0W7QLWY64S1JYhJ/0hRZt9yyH0u
	DwN7uNV4yuKmG3IvVAdPN4TURKDyFAumdnG0tl7MkIBq5uOGpKnRVIG0UiXb8Bgc/sDQErjK7D/
	AUEOyqZ29efmtfr4yX6e+c0hNlVkCmPSjmHEW8hO5N0KZnbjDqEU
X-Google-Smtp-Source: AGHT+IH0PwmJJSWcUj1FVrKXJZ5zyjJgcJctx2JJXHccuUo6vWybu14HrnIvMyHRtH39ycBL6f9Gnw==
X-Received: by 2002:a17:903:2b0c:b0:22e:5e82:6701 with SMTP id d9443c01a7336-23414f535bdmr170018555ad.18.1748335514299;
        Tue, 27 May 2025 01:45:14 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2340c2df1fbsm59336735ad.139.2025.05.27.01.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 01:45:13 -0700 (PDT)
Date: Tue, 27 May 2025 14:15:11 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: opp: Move `cfg(CONFIG_OF)` attribute to the top of
 doc test
Message-ID: <20250527084511.gfwzuqhsaheifpe2@vireshk-i7>
References: <9d93c783cc4419f16dd8942a4359d74bc0149203.1748323971.git.viresh.kumar@linaro.org>
 <CANiq72m2jztPbqiH19560RTBW0PUghi8ajjyi6Pw6jmrHFdtSA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72m2jztPbqiH19560RTBW0PUghi8ajjyi6Pw6jmrHFdtSA@mail.gmail.com>

On 27-05-25, 10:39, Miguel Ojeda wrote:
> Sorry, to be clear, I meant it as a discussion, i.e. no need to send a
> patch for this in a hurry!

Yeah, I know you started it as a discussion, but I did like it. And
honestly I didn't realize earlier that I can add this at the top of
the whole block (and hide it too), otherwise that would have been part
of my initial patch itself.

> It is just something we did for another example, but it is not a
> guideline or anything yet (it may not be a good idea, in fact -- I was
> hoping for others to chime in). Even if it were, there is no rush to
> "fix" it :)

That's why I didn't mark it as a fix, but just an improvement that I
agree with :)

Specially for this particular case, there is only function in this doc
test, and so marking the whole block with cfg looks better.

-- 
viresh
