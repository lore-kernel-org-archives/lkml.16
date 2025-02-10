Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DCA1ADC8C
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 08:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739174802; cv=none; b=osXsByeGdMZxmwZPkKIpHsb1NjDhI6B8y8G59cBIC5rp/rgFiiHm6CPo6td01kSgzOXle7MD56tScAhSin6gpCBVWjgHgVr0zWLPu8R2v8vQ9owC/yGJGgms/TviaErZSFfZb0XQt79Ndq9ejtobAM/ohLDwRcvkPD/xxaoN21I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739174802; c=relaxed/simple;
	bh=A3OrU86yFSA3UhFhMSz4sxiRiOlmLl05dbOqahKg9xw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QucRjk7X/ggRUkMezVDmjX8gGWY3ELBy7Z2M85KkXMkkwbA5bSTWz5S2CN1QbIQEP8fTZgyIUiIMJxNykq8c9wE9SKa1i0ndNod3TUixr1b4lY9KGxWNAoXo213FCLVehBIOdWh2IjbvPyLpvEI63D3MQfiJ2o+dg5NMhUB+nO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m27lSY7O; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m27lSY7O"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21f78b1fb7dso16941905ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 00:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739174800; x=1739779600; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IVXeQyKN4QJ5pjBqKy+7ctyC/+A7eWtC3q0uB/7UlNk=;
        b=m27lSY7Oo1Mk0TmNYy7yC37wyNWccthhFHF1r5bBI3BKVictqc0OamNVc3I8Hj6zJP
         Jk4J8V2jDafWpDymraz8Jeo33YNbHgKbxkNVAFruJaeIiRTPhnqGAsQVnvnPlw6H/7pO
         G/ZbScaLirb0/zJmNFMOqLA4AID9CigV1cFd/Q8lJLUsvJ/0T0SWo3ulSmNCUKaPuMe+
         Lan6a7EVuH45zIW99KaTD7tS8drPvUu5FpckkC6gzcw7GRV9kplLS8mmzxbS01vdfcxa
         t3XEEtNAbcG7fP8VSPBy2hDcrzr9yuNxvm60lm7BqN76T5II/y3SfCH2MlDolmFiCxE8
         G7wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739174800; x=1739779600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IVXeQyKN4QJ5pjBqKy+7ctyC/+A7eWtC3q0uB/7UlNk=;
        b=evBcJSHXkb/hxue1l3y7fbtJcOgEDL6cbonSszst4HQFS2LXPblmBIjXBiFtzrrFg+
         DHj1x7UKPQSElrXN32AxB9pBsvJjfI92CAP/43ihlbG89hied1ifPc+16HlNJsT63U+B
         feZUJ1TWaQ6Zn5A/xgXVsNi9l3/pf08pfp1zqcKa2ChLnIN2jTDJzc1RBGnebNQJGZ2h
         lH2C9GrChMenPxz6Jx2Jrcr0scoOtbyGipURptypxKqDMRmupo/5K0DRmZ165URwxwpV
         BDawiGAWucSs5K9rMj2Sssuym9fkq3sdATGEZSd/JuM8eFzcUq8+PK60In7kEcaoVfCI
         lGRA==
X-Forwarded-Encrypted: i=1; AJvYcCVVVZp7jqbxaNIXFBN/dWWOQXjM5s0xKyNVd/mfDj3Wec9uSLwu1AYyNUvrX5dtF0F5z4oNrY7W3xF+7pk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwD6rGWDfh6I0u7WW3Xb4pucDQyqmyOvnCVSyMFntsxgGEx/jp
	VcDLzKkJjQpjj3JfUk9kp8R61oAiJHHyAgKSbK7E/7lFnqtzK3rpurvV8/PZ/Ig=
X-Gm-Gg: ASbGnctPjms6CIUYqXJaq1E0DbYkyWqaTSTdLTCZRIxlCG2rfr6eXnm70i2OGMidzhr
	6VhDbvZtMgzORDCfTpBFmBFPw+qPsQIdwoL7b4CEytZ0VF1QpaYHgJUaS7xjspqFGCR6WGmP/tx
	nKPcR0PWSeZo/PeFyCcHzcIZnnbtYD8heDiZrql4GZT9wEyclOJjgG/cgmD+SQQxhCh9OMNNzXx
	O6tAkGNQpIyMLbKy8oCyWNaV9VfTPxfnHKdYHw+xg6hBCB/tq6v0MBG92EWGeiz2xaUa5BQwl/Y
	y+dBq20alLft+4C0dg==
X-Google-Smtp-Source: AGHT+IHM4kYVoFgxrWVd43dBTvU4IzoZ0Z6Z31Y/z3cQy6J4+x70snoVsJeMXCdxFbw0M5vVFErOEQ==
X-Received: by 2002:a05:6a00:2289:b0:72d:65c1:ad01 with SMTP id d2e1a72fcca58-7305d509d46mr23026216b3a.21.1739174800438;
        Mon, 10 Feb 2025 00:06:40 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-730764c4b51sm3623175b3a.55.2025.02.10.00.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 00:06:39 -0800 (PST)
Date: Mon, 10 Feb 2025 13:36:37 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Nishanth Menon <nm@ti.com>, rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH V8 06/14] rust: Add bare minimal bindings for clk
 framework
Message-ID: <20250210080637.ic4fxcn6tmllqgaq@vireshk-i7>
References: <cover.1738832118.git.viresh.kumar@linaro.org>
 <c68081e18d939aefc7f6dac798df6b72e81bba4b.1738832118.git.viresh.kumar@linaro.org>
 <Z6ShsuLykigNscz8@pollux>
 <Z6SiiRubSXGInbgj@pollux>
 <0cd42d2d683ea057e6034978b02c7f84.sboyd@kernel.org>
 <Z6VBo51g54xAmelQ@cassiopeiae>
 <20250207092448.n5mzbt6lg6zqud4a@vireshk-i7>
 <52a3d4fc-b08c-499c-ba47-7a1d782b57db@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52a3d4fc-b08c-499c-ba47-7a1d782b57db@kernel.org>

On 07-02-25, 18:19, Danilo Krummrich wrote:
> On 2/7/25 10:24 AM, Viresh Kumar wrote:
> > On 07-02-25, 00:11, Danilo Krummrich wrote:
> > > On Thu, Feb 06, 2025 at 12:05:59PM -0800, Stephen Boyd wrote:
> > > > Quoting Danilo Krummrich (2025-02-06 03:52:41)
> > > > > On Thu, Feb 06, 2025 at 12:49:14PM +0100, Danilo Krummrich wrote:
> > > > > > On Thu, Feb 06, 2025 at 02:58:27PM +0530, Viresh Kumar wrote:
> > 
> > > > > > > +/// A simple implementation of `struct clk` from the C code.
> > > > > > > +#[repr(transparent)]
> > > > > > > +pub struct Clk(*mut bindings::clk);
> > > > > > 
> > > > > > Guess this should be Opaque<bindings::clk>.
> > > > > 
> > > > > Sorry, I meant NonNull<bindings::clk>.
> > > > 
> > > > NULL is a valid clk. It's like "don't care" in the common clk framework
> > > 
> > > Thanks for clarifying!
> > 
> > > Guess this should be Opaque<bindings::clk>.
> > 
> > So it should be this now ?
> 
> I actually meant NonNull<bindings::clk>, which I corrected in a subsequent mail,
> where Stephen pointed out that NULL is a valid value for a struct clk.

Ahh okay, so no changes required now. Thanks.

-- 
viresh
