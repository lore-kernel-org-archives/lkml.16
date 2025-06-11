Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D285713CA97
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 02:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749608889; cv=none; b=l47cTKi/d8ZbE6qD4K73MOA4LwaVYALSCYNKELPjqTRs0ZWrQhS2n1Hv7voKHdBkS25FE8ySvTpTiXZtJgwWqQtRvsjLXEJohXfsOnYiJgbR4Z/6S8JjSWk9F1RR0kkg+3JzY3ZE7oATsdBN467FFxZ7y9ZYSoofS7Pf0WMKdqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749608889; c=relaxed/simple;
	bh=AnULbAtcLIUrq9avMFu81YCrGIdaNXhNJ9b2KpzWZvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ggdw2zQDcB/oXkB/rT5IFyRmYdUXxUf611hBZhm8qd/NAZWIbjNQMR8gdfadvS0TSmZi5511x3iSLjAx10UG3ByP6L0U7tPR+1ChZPbGxGPgAvLb2kKH9uJyE6wVM8DwCB+Q43dgcDPubi8MQfT/w+ytAA/HalELJIrdRenvguk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SZt1GoJr; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SZt1GoJr"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2363497cc4dso17556975ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 19:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749608887; x=1750213687; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XgglyoLohjdEepoRUFmQl+JC9QjRDgCZ11XCQ6gDAFI=;
        b=SZt1GoJry1bQv8AJkCe0Pg7TwoQahwPOOjUFY4sO5pBd3uOuRavKvHZ0HbqLN3yiCP
         OCy2XiBgZnrhmSiu44EOv22JkXEx1dxmRpZXX8pFv5+mGh/IEddGjv71mpD1zBVSBo3W
         jdQN8wM63W/Wxka2S+CNOdHCh210NnTdX6KgHnhqUYEF1ONRi4Bus6EZJU2VlMUlPYK4
         LQ6sHLSQgeYyDVzEvIICuH2uG74WQ1QedYd6rWsSCWMr+32/BgCEkC+ixTIoUov+tapE
         rRRg/Pj1n8vEFvbSYiXMgj6pxH4iPCbwxQEy4jZMpRL7MjbMHrhb0y8qHU4B5+7RqlBB
         Xonw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749608887; x=1750213687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XgglyoLohjdEepoRUFmQl+JC9QjRDgCZ11XCQ6gDAFI=;
        b=lYhe1CKBn42yHtdl4u5IrPHtSLXhQuJnOiC+JqLePdbBRCQmShfQh9jvZC9ze170tU
         IKApNVT0lonG2wBR2BGRpCJTB8MLLWLUDeE5iuqt7e91HZioSu7WuX2IYWJz81Vxv8FL
         BdS87bZ/WnO4hvKRPBUA3Xc1aDgdZiS+AvZm45sgiROox1A7cSRCIsY9VGVHHahi7xhe
         CMoEB68NmubMnrOIYglxganQwm3Sht5bZKRtFsa9HYtJVWGC0vUlaM29+B29NwZ6K3Tz
         EqoSuJAbgYP00PafRsO8J0g9rbhCdNAKdztPjCoK3uJW4Cq44zPNjGiejQmv0pu5rQ2C
         Iwhw==
X-Forwarded-Encrypted: i=1; AJvYcCVkgZ+6dMu4gWRx57pYg5P4WD5TLJrclRcbLpYWMhv93W03CZb9VuwqYVRTfTo4eHbMh4duxN7nPtO4WQk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlOwzaVk8Xn90Rpr9T2LK38PhTXCBH3FiUbNLF6qy4ZgnkIpx3
	dX/yn6NcQWBKpbSzIp1LJJg4X79FMstVTWMUqOk0fX6kShgHDsOlgvZ5u456xKAfS0Y=
X-Gm-Gg: ASbGncuWWkei4jLbA4x8bbXUiqClq49/J8ADRw2JF+BfPlDneui85XxxiFXqQzQV5dA
	gxXlxhol2FkZog0VdV8KQtH5AYu5M+FxPH9Tdg4su7TIlm7IGizsgBWoSEiqePoaNYIL3fmjzed
	vYmSZ0nEr0r+VfWzx6UQ8eVkZzRrWx0OrzO8ZyCTKX9L9Tz+l1kEzEqS2cbAc+oo47OofKQeLjN
	0ASGPPsgiAy3vsMevcYChRJuSsT7ebdh1o2lTYq+B6aue+sosTRUgqBx7815s26sIkJ6qMOi576
	Fxuu1xnH4RoKcIxmUBExtRytAYB5tbYMW7GPkxsjHWwZRCSooENdMjE68uRYK34=
X-Google-Smtp-Source: AGHT+IEQS7K1hjEyHUsdIhFSDd8II2iLFlLrogG3kQuaeeLvImbJEameFDLvv1JLzyOrih7+opX37g==
X-Received: by 2002:a17:903:28e:b0:234:f825:b2c3 with SMTP id d9443c01a7336-23641abe9c8mr19453495ad.17.1749608887195;
        Tue, 10 Jun 2025 19:28:07 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236032fc6ebsm77109545ad.98.2025.06.10.19.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 19:28:06 -0700 (PDT)
Date: Wed, 11 Jun 2025 07:58:04 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Yury Norov <yury.norov@gmail.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 3/3] rust: cpu: Add CpuId::current() to retrieve
 current CPU ID
Message-ID: <20250611022804.vr4sponkwsa3qwo3@vireshk-i7>
References: <cover.1749554685.git.viresh.kumar@linaro.org>
 <a2e12436661fca452de5c417242328ed6f413511.1749554685.git.viresh.kumar@linaro.org>
 <aEiiQSTe-U1q0fOL@tardis.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEiiQSTe-U1q0fOL@tardis.local>

On 10-06-25, 14:23, Boqun Feng wrote:
> I would also add "or the users could use a stale (yet valid) CPU ID",
> because there are such usages in kernel arleady, e.g.
> kvm_pmu_probe_armpmu() in arch/arm64/kvm/pmu-emul.c.

Done.

> With that, feel free to add:
> 
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Thanks Boqun. I have queued this series for linux-next to get some
testing while the reviews are going on. It would be nice if I can get
some reviews on the other patches, especially the one that adds the
`CpuId` abstraction.

-- 
viresh
