Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012672101B3;
	Mon, 16 Jun 2025 22:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750111651; cv=none; b=ludy17a3MBC+f5NFHgt8MvFclaPcxEK5poEoTSD8oojif8TVtWOl49qLsXvdWSyjU6zehg8vMHOVO/56kVxtjU2ZwKIWpwI9SFG4vx7ca31tDeCl2SrIpDcPyhmca74iuO9QKElqqvhfXyj1ld//KC5PFC/SnuR1xGm0aVmlSko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750111651; c=relaxed/simple;
	bh=wN3fJ3bslNOW3YouETZ3bRRiDOdmMsDF1u435WJYNkw=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=H+AOul3/C0YilIlj4gebSu2rMzIoRMKm+w6SiILjBEhl0TeS4YLvb/efxSFlb/nHsONEC+Arokiyemr7bhiEiMexUAFsld2MGaWEX+p6WFgUcRjBHgloq7UvboWrDzpLP5qR2at0PRjYd/Hodcrx+1jB6BgIbhSywcdKAQZm53w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZPo0tJUS; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZPo0tJUS"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-311bd8ce7e4so4161013a91.3;
        Mon, 16 Jun 2025 15:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750111649; x=1750716449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OMNKrTCU3N44LQI4tDmEyYcaZ5N4AMgvqT5+x59K2lw=;
        b=ZPo0tJUSKR6n1s5d8XUBXndJo3qtgFk9KWh7+q7YVb/dhnyW8BlbY9wtrPB3xCqaTq
         RuN7n6dMGGR+r2PNfhftqgwgm3Rfxh0xEOlD+O8JbgjA7cTzVUQ+aGjUprlsRv5FVzN/
         ZevGMGw8zIK2jX7iB96MZvW+mbtutlsDmnltudkhH6eIiopQIKQ8vBkYQbF09oPBmC3t
         IUOMeCmHIkiqBoDdhXCJ+8hebw41hgTsEgeR7DuuLJfxQAiAr27b79uGJRl6xwblCvH6
         MdzLKSzRHDGRL+jZR6umJ/AQ9JaK/AYcvrYGT0e4MItiE80nVtydrRJs6TejEE920dvb
         zz3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750111649; x=1750716449;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OMNKrTCU3N44LQI4tDmEyYcaZ5N4AMgvqT5+x59K2lw=;
        b=We3NhYK9BPQJXHVo2fkmGLUr8HEKSsudDN3oIo0LetnYVFzEgIL7Ia5SQhmk6Ei3V6
         xicSgw2ROqoj1/I5d6rt7vj5c12gcT8H3cI+lwJ713Rz1/jq0HiFhSHyHT9Q7tfK+LDM
         o9kfbXoUod9sIO0XdokSq1au+qucjuQlYhu/yACWGFrJyvokXGJ7yCF5XjhpSy935B3D
         Nn02eHq/ANS6AYjiUhpS3BRGZNWU3anos6iBIrlNrZqVbk+8ds7klJDIEp3NrkjI7RCG
         T3qPDsIl3jKeWZa+XtkH1fxgCBherz2FdJlLNIIWDM21/Lx8eyLoCHvDk5KsUFVtjPMz
         MR2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWYiHLqeUVJ2pBQQx+7uJ/qkZenX1A1p+Zu8/fr9jBZwWzE1HPv8Gic46oy69pf9BLbU7mPmlfrJr3qwYY=@vger.kernel.org, AJvYcCWmGFsj4RA4EknWU4DM6Xesltmz6IqqcPfmHpXjXrZIG6R51+KQh53yiln+Qw7UM0N9zVHUkhnnWTPl2sB+Icc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yygg9Aa9LSvlnAgXd0gwN62nn+avOk1Ql7HJiAYXSz1c90AgJim
	ZUC5N3vA6BBuI8sdDvjzUyCEKNFxp6Jx36vXXJfk/OJltccxuNtAn34G
X-Gm-Gg: ASbGnct1c6GP1nghCGwLLMNnDUib5Q+710zMuA0QpWt7VIdMootBiB9cSpXnmTQQ8Yq
	wuvjoaLL4pmgf6XtwHVxOu0nso2OjQ9lekuR4RcMFKcTpumJEEq7e43GyFsorqxa5Uj5pxilRaY
	JYqteVNNGKbwoxdKBG8bTwEDP0YSKdgR9m82nwjvF7tdLp0VEfGKZCqXzxlhXc5V0X5YciI+Uo9
	wfqyOEX62IGHhfwhk1m3rsJ2GUkZAtOvFcvMaxjdU1EXZCGHf6Q4GQR49cWNd4Nkj7CegeR7vEg
	0My4ZZ41sA2TxOA8NpgHZudyj2TxNKi1J+SFwI4CInV4uo+GO7VJMabkLUlX379Ib2QOW/Jynr0
	ISdWUZGzY7cf/4cEbW7JlBbY2sWmJYEqg4HJbVMOx
X-Google-Smtp-Source: AGHT+IEpQiNrHn/T5dRpABVwX2QtylkZ9Zpgirhva1ZQQQIhFYIt2YFPzX1hgvm069tnkuYijbOTaQ==
X-Received: by 2002:a17:90b:5847:b0:312:1dc9:9f67 with SMTP id 98e67ed59e1d1-313f1c7c54amr17254783a91.2.1750111649162;
        Mon, 16 Jun 2025 15:07:29 -0700 (PDT)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2366e4d6653sm47110685ad.71.2025.06.16.15.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 15:07:28 -0700 (PDT)
Date: Tue, 17 Jun 2025 07:07:08 +0900 (JST)
Message-Id: <20250617.070708.74052163124048514.fujita.tomonori@gmail.com>
To: a.hindborg@kernel.org
Cc: alex.gaynor@gmail.com, ojeda@kernel.org, aliceryhl@google.com,
 anna-maria@linutronix.de, bjorn3_gh@protonmail.com, boqun.feng@gmail.com,
 dakr@kernel.org, frederic@kernel.org, gary@garyguo.net,
 jstultz@google.com, linux-kernel@vger.kernel.org, lossin@kernel.org,
 lyude@redhat.com, rust-for-linux@vger.kernel.org, sboyd@kernel.org,
 tglx@linutronix.de, tmgross@umich.edu
Subject: Re: [PATCH v3 0/5] rust: time: Convert hrtimer to use Instant and
 Delta
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <20250610132823.3457263-1-fujita.tomonori@gmail.com>
References: <20250610132823.3457263-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Tue, 10 Jun 2025 22:28:18 +0900
FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:

> Convert hrtimer to use `Instant` and `Delta`; remove the use of
> `Ktime` from the hrtimer code, which was originally introduced as a
> temporary workaround.
> 
> hrtimer uses either an `Instant` or a `Delta` as its expiration value,
> depending on the mode specified at creation time. This patchset
> replaces `HrTimerMode` enum with a trait-based abstraction and
> associates each mode with either an `Instant` or a `Delta`. By
> leveraging Rust's type system, this change enables `HrTimer` to be
> statically associated with a specific `HrTimerMode`, the corresponding
> `Instant` or `Delta`, and a `ClockSource`.
> 
> The `impl_has_hr_timer` macro is extended to allow specifying the
> `HrTimerMode`. In the following example, it guarantees that the
> `start()` method for `Foo` only accepts `Instant<Monotonic>`. Using a
> `Delta` or an `Instant` with a different clock source will result in a
> compile-time error:
> 
> struct Foo {
>     #[pin]
>     timer: HrTimer<Self>,
> }
> 
> impl_has_hr_timer! {
>     impl HasHrTimer<Self> for Foo {
>         mode : AbsoluteMode<Monotonic>,
>         field : self.timer
>     }
> }
> 
> This design eliminates runtime mismatches between expires types and
> clock sources, and enables stronger type-level guarantees throughout
> hrtimer.
> 
> This patchset can be applied on top of the typed clock sources patchset (v4):
> 
> https://lore.kernel.org/lkml/20250610093258.3435874-1-fujita.tomonori@gmail.com/

Andreas, whenever you get a chance, could you create a
timekeeping-next branch and merge the typed clock sources patchset and
this?

That would make it easier for me to work on top of them.

Thanks a lot for the review!
