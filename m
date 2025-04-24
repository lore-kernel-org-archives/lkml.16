Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916711F3BB5
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 06:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745476155; cv=none; b=tGKrF9g4OLLTcJXcOJ38glxOPNKqqZ4fxhY+gHmouuglx7xzjCOvaKlP0DwYtjlPv/JMPZpF7Zb5KKWa99mZNMqO6cYKR6nTJk5tz59I6VOzgcbogb/R1YU7C0PzwFIjwGCJVNxCq9D3CxFkSf54vqcbWksHjWPl3B/y3UHRx/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745476155; c=relaxed/simple;
	bh=VzNBfcDTVF6ejyO5VLYxI2spzN4W68Bo1JJlXy3O86o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZFUsqcU+hMxccAtYoBxXVK2N+gpRKhm9wzypsLrgWvScisAfJ5HxUc/AId9zNS+ZBy8L3fUC5hpvrHFHBS7Qq+luBiovFrG/0DPo/ZmOuifDlMAIM8WA/EvBW/YRckDsdCj5VyjTbfVU9WMDdzsAgTn+0Zv+MdB186UhiUzcNQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hxPM+mhx; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hxPM+mhx"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22401f4d35aso7518725ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 23:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745476153; x=1746080953; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=prlT14wP1pGTt4ARZ3fH6f2MCxYwQQ9VDBvp9E5OskU=;
        b=hxPM+mhx3XkalLJEerW2xTB7vY+sMv6DcvKmOyiQV8q1BBdn3WIZ0M7Jp8FVEHF/Mb
         sYGyswUSFMEMLgask5auSKrRRI+DQZlXdvco3jzJv7jomMYcb5XagCPl00MHLugwAlMz
         q3lHIBAbGCo/868bZ+AaAxNcJaq9HcOuOn9UlRV0HFVtWw8PwdcRqCfPVGOv6q4o31jr
         xQmCIASFhNhV0RVnZZ3JKgGZDw9R6jiOm3ItxvHEQfd8URmY2KrQaNceakgbu9X38Q4k
         2tYzRjJluIDpBt26i5Gixx+Xatyd2lIojtM+rJoY/+b/mhUk8llJYvYdiOamnl4TT19E
         VwCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745476153; x=1746080953;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=prlT14wP1pGTt4ARZ3fH6f2MCxYwQQ9VDBvp9E5OskU=;
        b=JH24g13bwNZFK3BmX+5GkB+EfYdsoakivnCMhJfooMCPYrEkkSuo780zUp60fNKIMq
         BRnQ2NQrAZkD6ilniWtk+P/6oWUARST+cHlYvW8t/axo+9toOqTvWsVs30EnVLVMG3t8
         6hHw/gF8XiyndbJtodrowqu6tD/yCT/wkNT3LR8atOkZHiAzf+xE1K9jtTfY90dV5KHl
         Mm/2gQ0BaZKayijPM728sxYA+QA0Q+iBLoD7rJ1o4mdKeKiBIjWduJC3HChIVIZ48QKR
         MwfKmxUkVC0Z5FShph4WLVMTiNvrsEgzCBgdWRHucngso3HlBPnvFoV/NN5rlmvow9i7
         nPYw==
X-Forwarded-Encrypted: i=1; AJvYcCXANpmAPNIz9VTDokawm2Jahc+ZLZbgiHjI8NL23ljyRhAGDy7ZjdlthH5yEZ2FLrxckzRbDT9Gtcx+f18=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4URwY7PPsUphkFH2yyHDFSh79jm1Zy0nO+EkNtu7wDGihXxId
	x1+W4kXNPWkyNgpBaLJZRH8FrXyfvSdbpF7NQ2ZMv4MUrOftovFaBs74Hrz4xCs=
X-Gm-Gg: ASbGncs+P5Zm1YKYTvSY+dmRuBIKUXbfySwgiCPUbEWYDlxnGuKC8wPWSShOyjYkMir
	1+A5G6GGK8TsUl4xDs9xMJ+8xd+wDIEwVSAyWt82yke70qRprjAshDpmc49FmpQ5qUYpKqP5uRd
	qnaQsuiDzpUA/nhtitrJJssa8Clzx1hqjMyeIFhMdTwI4Ve/qPlC1oM3R/zborNuZeYHTiwKIx4
	+qKyqCDwuqA1vQKrBrnviCqZFlWlW7A0MxrE9GurBg1UU20PRxUS+jTSUS354riAqCd+xVuafty
	6/6yiqWGQS/qpfdavBjtYuv6aKRYGQpTjd8AQdvAEA==
X-Google-Smtp-Source: AGHT+IEzqMdZbqFLHMFvtB332RXvrr8S6rMpD3KuOB1cS9hqVDk7lUxe6pCjWGcu6CgYu10Wj15uvg==
X-Received: by 2002:a17:902:e883:b0:226:38ff:1d6a with SMTP id d9443c01a7336-22db3baf373mr16890825ad.7.1745476152853;
        Wed, 23 Apr 2025 23:29:12 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d76c22sm5346605ad.24.2025.04.23.23.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 23:29:12 -0700 (PDT)
Date: Thu, 24 Apr 2025 11:59:10 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-pm@vger.kernel.org,
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
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V11 13/15] rust: cpufreq: Extend abstractions for driver
 registration
Message-ID: <20250424062910.6zk7amxq4gjxtw66@vireshk-i7>
References: <cover.1745218975.git.viresh.kumar@linaro.org>
 <a14f6927488b5c7d15930c37a3069f46a5c888a2.1745218976.git.viresh.kumar@linaro.org>
 <6fc3e178-60f9-4b0f-9c56-6d983e4d1eed@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6fc3e178-60f9-4b0f-9c56-6d983e4d1eed@kernel.org>

On 23-04-25, 14:08, Danilo Krummrich wrote:
> On 4/21/25 9:22 AM, Viresh Kumar wrote:
> >
> > +    /// Same as [`Registration::new`], but does not return a [`Registration`] instance.
> > +    ///
> > +    /// Instead the [`Registration`] is owned by [`Devres`] and will be revoked / dropped, once the
> > +    /// device is detached.
> > +    pub fn new_foreign_owned(dev: &Device) -> Result<()> {
> > +        Devres::new_foreign_owned(dev, Self::new()?, GFP_KERNEL)
> > +    }
> 
> Btw. if you take it for v6.16-rc1, expect a conflict with [1].
> 
> [1] https://web.git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git/commit/?h=driver-core-next&id=f720efda2db5e609b32100c25d9cf383f082d945

Thanks for pointing this out. I believe this branch is immutable and
so I can rebase over f720efda and send my pull request after yours is
merged ?

-- 
viresh
