Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615B926BD92
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 04:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739248153; cv=none; b=NF/SNj0Qg08W8E6WQhi3oCkmMAc7UUbeAMB1K+iYXYymuUKaRkkWbZHPr0spg1t5hffHfMnOjH7L/hUmMZK1GMs6nuGsS4sQxGFj+00CvDQGmeb6EKZeA0cy2uyTzIx5Sy9QvIckpAGvGnOGxfjVBZWasmD2VMnv+wraQaRc5kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739248153; c=relaxed/simple;
	bh=Eh4D03RgjRhUFUGbjnsrtoBwi4K6jy62lBsis7HXjqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qfb7Km3zO6i6KSHSFDAcICsXFUvVcPO0+bDljOwePTnOZhPaE+6qQtzjaqcgo1PnMiG7FFxHxlYotFHXJTlF+H7hRv4ZN1h/jcNrViKzWockuPZ1V1CdD3RtkniJVNB7vUEmxpSd0NLk0qRJiAGEY0ioeYct28XTpU3MM5P7WQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mp5crol3; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mp5crol3"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21f55fbb72bso61549685ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 20:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739248151; x=1739852951; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R17/qsybBuUiE11sy3rr55GZQNSwgogOHqxcTs41IzQ=;
        b=mp5crol3mvRMFzdn7o2vZKzsUToSZYWKSP8DyMnmPdwg1Lo7pE9DemQtA8iAYxcqyn
         XiY7okiTDAe9pSNJyGD44ioLnD4+UGLTfchrP++AuXYNE68kCg0NvzSrPd9IgWWzL/3n
         dMDyxMNthlbrhrEQU1mtIKLsurxPPtvOIVVegIbP1OPtRWCg7nGCFavOyw82CgKNWPPc
         Gp3rMG5wmkEpJ7+aGayeOY5ENba+agEA9SujVbdZ9S+SAoesn6YdVAlWjxszOH8zG7tK
         qH1tW5V3xbN99F+QvAvfd3POU3cbHAiFpciz9VJkZMWmBtSrxRh0kdhbF/0DTbkXbWae
         O3yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739248151; x=1739852951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R17/qsybBuUiE11sy3rr55GZQNSwgogOHqxcTs41IzQ=;
        b=cxp8/R6tC1xsfM1m+lqqHM1zv21IJgCMalE0ZEvgYLHCh+JYflk9JF9pWiwUECup04
         EIc93LKu+3Pf0QwOGdVdtrqJNHfqaSV0ErQM9aLYOyEHerkJOEBVsC6XBdoIc78XYd51
         dC6xXTW1R12wzAy/yK87S11HhNIlfvHPxkE5rMKCI1UbOGOlGlezVQPYwQ4YDXa7iRkd
         Xuc6Z38LllywwgcWmi8Di8Yw3Nu02jzqOxyeuFLDf49/xog0KjTuhmsFOiHY7Sd5SBLF
         4hRIdOTtmp+ebZgyR/V1tSISE/lxhw4hcfiAY8YmiNnNLDC2Q55RaIjUJMbtoEz1hLxG
         q2LA==
X-Forwarded-Encrypted: i=1; AJvYcCW9YGTTXDlfVW7ezs/ZAkoDWK/bWwzUK6ygKsc2h+gpCd82nBZRd2vzy3o148Th0klBxbO82NP7WNm74rE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7A7F71rwU8wCSzY/4WXhcazRiSyMJSvgjWc1y1aLBNFPbNTZz
	0kqRMdiIArEoI8bSYTckhLIl3DwCcsLosLGO0lTsivD69glor8xBzHRfFksQRhw=
X-Gm-Gg: ASbGncv3SXZgAvlkb8JEjOVKF8XR3VNXw4dbZ/9Lq3HTXtTTwJkNXDfcicSdHuknOiq
	R/wi4ajgzBgsjbnMJZHfcRnwNRLT4I6b35j2IEOieFNN9DHbQGNfzjWQlR4nHCw9FfgjxhRzbgB
	zC8GCMYRdHCXdSzXNaXATUva+gDi3jkr1odxP1/lJKFcbBcr3C2O8uAbNNXacNCksM5HQkzVd4x
	iOrdfIx2IVWeW8yWOaBrEFtAGIlVERVvH2AFUyojIExZHNXq//OoPO5Uy85RG3uCW/+sMO2wFXs
	wwlCANp7ANtw+PYo8w==
X-Google-Smtp-Source: AGHT+IEZcBKkgQvgu0Gja7oPmp7ETDL4kRRxy2BoBNXWnfh9afk9yQuRY7Pd92NDnJpb7opE0F3HeA==
X-Received: by 2002:a17:903:2309:b0:215:a04a:89d5 with SMTP id d9443c01a7336-21f4e1cf038mr280431035ad.2.1739248151630;
        Mon, 10 Feb 2025 20:29:11 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad51aecfa58sm8630725a12.25.2025.02.10.20.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 20:29:10 -0800 (PST)
Date: Tue, 11 Feb 2025 09:59:08 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Yury Norov <yury.norov@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V8 04/14] rust: Add cpumask helpers
Message-ID: <20250211042908.nyftiw7gtxosfjwc@vireshk-i7>
References: <cover.1738832118.git.viresh.kumar@linaro.org>
 <db0166341ce824c157d0c58c240b3efc6aec6f6e.1738832118.git.viresh.kumar@linaro.org>
 <Z6qTelPSqpFk439l@thinkpad>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6qTelPSqpFk439l@thinkpad>

On 10-02-25, 19:02, Yury Norov wrote:
> On Thu, Feb 06, 2025 at 02:58:25PM +0530, Viresh Kumar wrote:
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index ee6709599df5..bfc1bf2ebd77 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -4021,6 +4021,7 @@ F:	lib/cpumask_kunit.c
> >  F:	lib/find_bit.c
> >  F:	lib/find_bit_benchmark.c
> >  F:	lib/test_bitmap.c
> > +F:	rust/helpers/cpumask.c
> 
> Sorry what? I never committed to maintain this thing, and will
> definitely not do it for free.
> 
> NAK.

Okay. I will add a separate entry for Rust cpumask stuff.

> > +#ifndef CONFIG_CPUMASK_OFFSTACK
> > +void rust_helper_free_cpumask_var(cpumask_var_t mask)
> > +{
> > +	free_cpumask_var(mask);
> > +}
> > +#endif
> 
> This is most likely wrong because free_cpumask_var() is declared
> unconditionally, and I suspect the rust helper should be as well.

Non-trivial C macros and inlined C functions cannot be used directly
in the Rust code and are used via functions ("helpers") that wrap
those so that they can be called from Rust.

The free_cpumask_var() function is defined as inline only for the
CONFIG_CPUMASK_OFFSTACK=n case and that's where we need this wrapper.
For the other case (CONFIG_CPUMASK_OFFSTACK=y), Rust code can directly
call free_cpumask_var() from the C code and we don't need this helper.

> Please for the next iteration keep me CCed for the whole series. I
> want to make sure you'll not make me a rust maintainer accidentally.

Sure.

-- 
viresh
