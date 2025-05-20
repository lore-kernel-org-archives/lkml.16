Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E9325C835
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 06:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747722141; cv=none; b=T5fhZgwDP8hEKbXnfeLFidWSXPMTa9WkzzPCpZk8MQecLFa0SVeYGrZMbLWJuse0wT7DSnCLm9w3Mox4aXnPca5OC/DPQGzXV8q7E5cy8ZTcd3YGuSlvGvb+PjWFdjGt95FrEBCWvhp/UupgfN34F7Ct64udF+ZiLvGOOKnHKRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747722141; c=relaxed/simple;
	bh=B/X6KNDiCJa6ANQuk/d5rOGAHgPZdwkWQandSI2PQck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e+KXQ28tqwlIwIxf+F/l1nTbmYSli/K/FE/woRAsOst2fOcdHmfL7dUuTCuRrR3/Hv0oknX0wTS/V6NJh3IG6Ou6F+ynW6B4QRNCvFBSHlSILx8SNUleVw4Og2iGXGOhhBkiLiszAL85eJgGdnuwZRPunfwk2LMq4+2nJYx6UPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SU4QjGgK; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SU4QjGgK"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-231e011edfaso41345265ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 23:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747722139; x=1748326939; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HrOBdBL/ajwXK2WrufVyFeTUDJmhOQ5UWLvVqOesTt0=;
        b=SU4QjGgKN3wg9epxAawEM9OWJgzIxLhjEF7cH8MYUxPjfNSQczKVMzaJYTg5Zw2s+i
         PRx8sCUwKmJz2rRK6KGvgs79JAeuttnjh4HjyQytURxmkvxiBXIR0VbfzuBEEWkaAWIR
         JjId95bnOLTIU4g92JBE5R+l96SRKkpxBLkgYX3HVACBQtg/uIVYi7bh4bthP4yYis/+
         vki2IRJ73Xqn366iJYf4++9XdG1vLAb3h0dzUOi5H7x29Lg54PlvJwLx6XsjtagitPTv
         FM6Q/QMKQuz8ABN0KfyfwEPK2Sr+3Jt12wlnY2gCWzFWu7BWj4WsOHcXmkW3kla7UHIO
         tqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747722139; x=1748326939;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HrOBdBL/ajwXK2WrufVyFeTUDJmhOQ5UWLvVqOesTt0=;
        b=vgRau5T+c427BDBrJ+CFKbYuFrFtCaLRjkWaEeDPibKjepYEK0MPjNd6EAnREXdKAy
         1wTs12npNZGzwIjAsNJFOLVr2UBE6BqpzrhR1TCIBrl+eUawh+iqp9GZ0oWAEfoElJI6
         sm8wD+iIg5KENhna0yjVRdZ0jx4Jc32+NiNkxpM4W7XczxS5+gnFqOQNwAE+jniuyoFr
         4ezHHAQuH/VAF9pchsUUmyyydV1ScbZpjcegMdiuqCa2ubm5bYu79qhYTcfGzwJoke6O
         H3sukTjisb3udhYZtzXTY9zP5t8nfInTjdnMPSQ1Vjq8QKDzABHFTEWm0cZHngzen0Ng
         XiLg==
X-Forwarded-Encrypted: i=1; AJvYcCXzID0VMxwsZ65iGrYjIgxiSocj3YqFAnSntNKGg2m2Pw+zL+qAMwm1YmV2wlFc30PyHEkg+1AM1tiqzOY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1v8DwC3DwPXee8FDFVp6UzFQRP9uYcibkUZP+5PUZByfgwRVL
	eXm/WirX18jApdKCYoQimoScVkB3/WfCimMe6tfxl3BXVUru0yPNyoMvTExIXp4Sw7c=
X-Gm-Gg: ASbGncuuIRpOZJkT8NzUUiVdoG7FRvGTmWhk6IRd+a5H9yHWAcK2q4UMdfpQhDlHvH/
	+xPMMYblPBFvJQ9qd4CcFZPLvOg9Ug5DPvrWEXaIx3BLTpEJNSdkV7jsllaz1X6gEZjxXY2+Gfx
	So41QKWbSMcoWcoqbgnCCONzTShE3Nju4IoWp7tUXGfN0wfjqPJDORt9h6LO++oobQu91TPsnDX
	yuKmsosl+FB03tkEGiJ5yQmZ31VpLayjraaFMKPkKnRmNWExMpNZYg+1hySbBQqNSvdZ2R6V7Hw
	L4VscUksUsW18DozrumaKKuSpUQZUQp0FgGPiOC84uO2L2eombzA
X-Google-Smtp-Source: AGHT+IHqX4UIh9iZKFgN3Ay/GR1l8mxNVHiGVA+Xwyg70cgbG5KGI7VYQskHB7LBusRKk6dj1H1mWQ==
X-Received: by 2002:a17:902:e801:b0:22e:4cae:5958 with SMTP id d9443c01a7336-231d44f6bffmr191916275ad.18.1747722138909;
        Mon, 19 May 2025 23:22:18 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-232044a59casm51435295ad.244.2025.05.19.23.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 23:22:18 -0700 (PDT)
Date: Tue, 20 May 2025 11:52:16 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Anisse Astier <anisse@astier.eu>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	Yury Norov <yury.norov@gmail.com>, Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Andrew Ballance <andrewjballance@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V12 06/15] rust: macros: enable use of hyphens in module
 names
Message-ID: <20250520062216.7lyqzvhv4mgzoudl@vireshk-i7>
References: <cover.1747634382.git.viresh.kumar@linaro.org>
 <21b4c30db60f22d56cc6386a18564705ad3a6f4a.1747634382.git.viresh.kumar@linaro.org>
 <CANiq72mNHYKXcDm6DiB=69W0w8pZ1KhqeARqqKBK_s01PPRsmQ@mail.gmail.com>
 <20250520043355.wjkrslnripaqj6mm@vireshk-i7>
 <e8a404b2-4ec6-4e1d-a973-15684676e870@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8a404b2-4ec6-4e1d-a973-15684676e870@app.fastmail.com>

On 20-05-25, 08:13, Anisse Astier wrote:
> Thank you Viresh for iterating on this and picking up review
> comments. Do not hesitate to add your Co-developed-by.

I haven't added Co-developed-by, but I did mention the changes I have
made in the cover-letter. This is all your work and thanks a lot for
this patch. I was struggling with this for quite some time and was
desperately looking for help :)

-- 
viresh
