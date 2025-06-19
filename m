Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2E929A0;
	Thu, 19 Jun 2025 00:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750292648; cv=none; b=FSHd9aS30KKXntYG6A62wmwshq5KvEoLM02RhhExNCCJHAZ75JfLnRDgXRIKMRJCQaLDIJRNyb3a9e4jQUqBO/r+85P9fII0FBcAxSTg3iimqSyZB2kzdI8QqsytdnxCiADxLtRIgqKbZYcnMGn7ksFKkHEDluL0+b/DcTGPU+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750292648; c=relaxed/simple;
	bh=Il3uVPoxWZ7fFmEgFLixAdYNVwuUpvGFfjLtXR7IwJQ=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=GqoOU3NorJF/kvWmlZrfdDKn+fDrUx9Oyp71NC6RZJzTu6EfzItYBO9L9balmPJDQHTfXMpLfYjnfrzUr2dIUJzO72jbA9unpXcF2zz39zrIyX3NhRoDEj2xYzTjM3VNRBCBq5+k4ahF30soqxvwTd7XK1KkC/PoNo/+FV4oBjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XO+d3PI1; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XO+d3PI1"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-748764d8540so193108b3a.0;
        Wed, 18 Jun 2025 17:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750292646; x=1750897446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ImdFXAK41RyCrMidglRxxChYqfkWaJkumrB7Eazeodw=;
        b=XO+d3PI1hvwtxgdDB/7cnOjOEeL9yTvSRHPz6t31k7WvuUQ8TqICiDV/5iJd+XgqqM
         EEgI1ALQYDObT0RuBuRYmse85Qf0kQYI8jbFTxvbIhLQqM00EUcAMiduwSLjclcTFBwC
         UR3jhT7PNBHZCnveGkea5Qny81Zm5ohSoPL6g5LKprN5UIBEKf9HobEutNbIjVsz/+6w
         CuTHSous5jCGtQIbpk7JOITqz0rT8+5Sizfl2y44nS4aXwG+qRNEf6PSTfprpPQFTcp0
         Hx/kw4nsR4tKzKb/kcGI41jpHabpybpd2UfJ9aVytN8YsonU7DJkNgtS7cMqCKhoyy9C
         e68A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750292646; x=1750897446;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ImdFXAK41RyCrMidglRxxChYqfkWaJkumrB7Eazeodw=;
        b=w9SbbjX+XP/b7MKS4ZTkeXZo4lBmDd3RncL70DmNElvI0yaBCDMFA/pmRCAB/rKoz/
         REEDc1/NcieDom0cWuOi4dcz0T35NyWTwtC20PL3XEcZDfXQftrhqIiu8MjJIRbkMrTj
         on41Xshazc2P6ZTur7DLvhoFaBcfBBl3xUbBpMgERyGoX3SzBqXn1vpxQO0Mky6XqUym
         MA1rIjsYOoyNeSqvdaxtOiyVV4bZWiQuZ/DjYSTNj/FhsW/Rw+suIHEJWDYE+R0wYe/j
         E7aNXIXe0Qa2iV2QHiIP5on+utwd2V8yAkQLsfCGjlDbpMO+pIQiNpY+N6rmjsHYL5J4
         +gNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEQJxlBRL71AqOZpJiO5QynyR5KyVThjnT4StgOxdqbQ+eI9gmTr3RnD91Rgv5MmB6Kxh/l2gjLBoKhIjZ114=@vger.kernel.org, AJvYcCXP2pA3WdcshVXguBPV51flK4tlM6/Xxoo4b0KCJWX0SM8877H+380mduqFSGWxL3cUDwJbSe5TX1OYKGE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwB36oGCkKLr8xVIbie0QQyXvBfMrgmCrcNjPwvN1Aib2WVnkum
	P1WTighBrzP2xL2UY0DEs1Mfos5dW50/WsfXK87+5y+aDvSadHKlc1j8
X-Gm-Gg: ASbGncudBCh25FJEJxIJadFBe6du4B2bTEewDgxlRMVd7Ie81AUj9wOi5DSZ61nt0Yd
	I8jjmRB5Q20HUxuMMqMZhPIUisLVUZlBlBd7SklyKZ6vlPxEVEU+Pmb99EgJp0e4rBDgWY84QRW
	ybT943UWpYtgxhAUDkWDFPXhXj7jvq/hLje/GdmTRBmUW6tBCfS8MLvnOFa0SLjnZdNoM7aIO58
	GtSFv0XQHVGpwrtU9augIvxP/ewt1jzdUeMHcoeIEjRZ6+3KJgr4/7/r4IM8mfQWBjtwp2HLY3e
	kL0FLkbx/5xATgCZU+nNyPRbspMug08rPoFdDLXwJl/Q9bUTvsgf7lw8l41CVBM+mhCPw+klqfr
	F7O/NeTM6P8nAfclRbzP2G8Zwnfwlr8XSZ5YkA8Mw
X-Google-Smtp-Source: AGHT+IEOr/hYMsCS8Xa7iIHUiHG43ETTY4ROYS8vUOfnHJFWBtUYPFdGsO2V7KoV1EtWOM/HdHsgvA==
X-Received: by 2002:a05:6a21:3284:b0:1f5:717b:46dc with SMTP id adf61e73a8af0-21fbd5567cfmr31456053637.27.1750292645645;
        Wed, 18 Jun 2025 17:24:05 -0700 (PDT)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748a0666b1asm9837486b3a.144.2025.06.18.17.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 17:24:05 -0700 (PDT)
Date: Thu, 19 Jun 2025 09:23:59 +0900 (JST)
Message-Id: <20250619.092359.585578352260473138.fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com
Cc: a.hindborg@kernel.org, fujita.tomonori@gmail.com,
 alex.gaynor@gmail.com, ojeda@kernel.org, aliceryhl@google.com,
 anna-maria@linutronix.de, bjorn3_gh@protonmail.com, dakr@kernel.org,
 frederic@kernel.org, gary@garyguo.net, jstultz@google.com,
 linux-kernel@vger.kernel.org, lossin@kernel.org, lyude@redhat.com,
 rust-for-linux@vger.kernel.org, sboyd@kernel.org, tglx@linutronix.de,
 tmgross@umich.edu
Subject: Re: [PATCH] rust: time: Seal the ClockSource trait
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <aFMTsz63qOo5LQOE@tardis.local>
References: <aFJINI8ImfxMnvrx@Mac.home>
	<87tt4c983g.fsf@kernel.org>
	<aFMTsz63qOo5LQOE@tardis.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Wed, 18 Jun 2025 12:29:55 -0700
Boqun Feng <boqun.feng@gmail.com> wrote:

> On Wed, Jun 18, 2025 at 09:13:07PM +0200, Andreas Hindborg wrote:
>> "Boqun Feng" <boqun.feng@gmail.com> writes:
>> 
>> > On Tue, Jun 17, 2025 at 05:10:42PM -0700, Boqun Feng wrote:
>> >> On Wed, Jun 18, 2025 at 08:20:53AM +0900, FUJITA Tomonori wrote:
>> >> > Prevent downstream crates or drivers from implementing `ClockSource`
>> >> > for arbitrary types, which could otherwise leads to unsupported
>> >> > behavior.
>> >> >
>> >>
>> >> Hmm.. I don't think other impl of `ClockSource` is a problem, IIUC, as
>> >> long as the ktime_get() can return a value in [0, i64::MAX). Also this
>> >> means ClockSource should be an `unsafe` trait, because the correct
>> >> implementaion relies on ktime_get() returns the correct value. This is
>> >> needed even if you sealed ClockSource trait.
>> >>
>> >> Could you drop this and fix that the ClockSource trait instead? Thanks!
>> >>
>> >
>> > For example:
>> >
>> >     /// Trait for clock sources.
>> >     ///
>> >     /// ...
>> >     /// # Safety
>> >     ///
>> >     /// Implementers must ensure `ktime_get()` return a value in [0,
>> >     //  KTIME_MAX (i.e. i64::MAX)).
>> >     pub unsafe trait ClockSource {
>> >         ...
>> >     }
>> 
>> Nice catch, it definitely needs to be unsafe. We should also require
>> correlation between ID and the value fetched by `ktime_get`.
>> 
>> But I still think it is fine to seal the trait, why not?
>> 
> 
> There could be potential users of a customized clock source, for
> example, a device which also has a timestamp register itself:
> 
> 	https://lore.kernel.org/rust-for-linux/Z9xb1r1x5tOzAIZT@boqun-archlinux/
> 
> So I think with ClockSource being unsafe and well documented, making it
> not sealed wouldn't be a problem. IMO, sealing is for the cases where we
> must not have downstream impls, ClockSource is not such a case.

Ah, I wasn't aware of that kind of use case. Indeed, a customized
clock source seems like a better approach than reinventing Instant and
Delta in a driver.

On the other hand, I think that sealing HrTimerMode trait is the right
approach:

https://lore.kernel.org/rust-for-linux/20250617232806.3950141-1-fujita.tomonori@gmail.com/

Firstly, HrTimerMode needs to be supported on the C side, so
implementing a custom Rust HrTimerMode won't work.

Secondly, if a developer adds a new HrTimerMode on the C side, we
believe that the corresponding Rust support should be added in the
time abstractions, not in drivers or other places.


Does that make sense?
