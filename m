Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF55219E0;
	Tue, 24 Jun 2025 23:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750807855; cv=none; b=thtMkcIeKSlbtjDysD6tjzsd7H4omM3ElbxOZA4UThX9Exase8X0W1s07iMZEFIPgancWFIF0VRAY6c0QMTJel4kKpO8lkeNSGBsN/oeGFzm+qSMLcQS1H8yI0wHsjycZxfNBEyL/dAKrCUTD3goZVQ/evGHfG0/otnXDNyJkxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750807855; c=relaxed/simple;
	bh=Jjj9Sw5/Yg/WSIm4Bw8DdgxuDLsEKillPb+D3EaALyI=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=iDxEvI9nK4/7J9n05E2HO2ZuVvJLCZbtDvTPCtwQkow6NE8xd/KxrzO5qz6CKkBdpebQ2lNW9a+t1l+dj1xt/0XlrNZPxYfSCicN9bs9m2amBT8fN9qsMzeGeHNPShq7avKr2MyHJzaH5dUERp12Sq7CA11hyXvRftDOQGRtiTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nSKpEk6s; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nSKpEk6s"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-747fc7506d4so4520933b3a.0;
        Tue, 24 Jun 2025 16:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750807853; x=1751412653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SXg7K6a+LlCzoRmiWZXv5KV4rBgXR72g3KNBalWNjPs=;
        b=nSKpEk6sCLxgAKCnQd9qUBffuTdhmbIu9/yT2Y6tK8T6eGqnNJuVAzW/B1m2WaNQT2
         zYMMc834OENQFG+Kah8udK4t4PXx/4etIieP8KxNJMkDrAZPiVT7XkKDkjT/kZXnmjwL
         +lkDHXe/30YUhnkT/SNPoL33I1+y/iLizY6GcxXcg3LiEqsy0PYv3WX806hLJSN4/wip
         +y0JHBqg4bYCoL1Hsm8kiX1GflkZNzgq5H1+R45MgdTLUrpn94Lgv4O9ylyIY6ATQt32
         OczkuDOOLRVEWZYTeIBcEbe0RuUMDmrxZBzAkF9PLErGvO3kXm/dGNVrTRJOS4on7wqq
         wQVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750807853; x=1751412653;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SXg7K6a+LlCzoRmiWZXv5KV4rBgXR72g3KNBalWNjPs=;
        b=KbJVSEHMzDC1zkguftN/7EBEcs9+C2P9/iKzlSdLvkASI5QjO/G6OJ6QWLzkPhvMAO
         hdW3luTjddQsKq04mMzQ2k9fdwZEDlDNrVZi2eeEOHOrL/1XWNQhxvCLClSZDhrl7vBy
         Y5qm2z8k19L5H6ANsE20U4/wdNCPRMdmlV9AJgSNQ2UMEB1zET6ScjbrPGWS4WM/CoVK
         MYt21tdqB0XyWA19L/eGALqv2rcu8s2/NVo5PC6PhtRpIf2ssvFWruFgf6YBm9fYqxwP
         0VnVx3t11HwvdYW/KaT5vpj4mAKx5W82anqkzXOk68kMjOy0F/C+7q/+upZNJ3Fgol+R
         nd4g==
X-Forwarded-Encrypted: i=1; AJvYcCVg+ae2qSIWwzmZNBewsFe9PyYU+ttjuP52P/S6MFJgO7B/bSNeWt/M758Zgi+EEzIN/1LOsLjlFBRUtwA=@vger.kernel.org, AJvYcCXunLm/mlCTkNDhlzPUNrZbRPJ6S1QYd0GGXowW1EMcI8xyNZjk8QXx2pRy8xYgA1mq4MgfpGEtMw087qrIgvw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsAC9ESmHBvTFAo8rl6Ani0DOC7IE7j1p5pslb532SJMFh8M9N
	G1U5NcshdcI8URPUhbunP2vIo7IHXw8jTcvl9X3cBFKBvm1P8UIHEvd5
X-Gm-Gg: ASbGncsIjutTMTp8XGAXvAViJn9tcrQ+DTfR7edlB/8eklEIPOjhiaR3hA2Oz1QY3gA
	02urmp8BiD3Sk4vchIk2qolWHxExCSLgrrDYtBw6Q1Lh+n/NAVMun3oaRbppAL4R8ZM0OiqapBf
	tTP9tn6NPdOyGk071YYfWbvIb+bw/FtQfd1wwzTE50lSNSA7GttJKhbjaOUFPWPuPTR2GP5Z04w
	3sgV90wgGesS8ynjhBpMDtczaLu4x9MpTS8og1OZV7b8z6Hk4SOxvrRCluHyRWYESvjUslLZt9q
	NQ5Hsn9vxdBIngFKY9yud7c8Iscc2nlTNn/Y5iO/FfG7p7cmHrELmrevYUqtkZJnM2Km30fiFD+
	Jleqhvw0sg7UsvEuzHReQ4cOiuTriCLM119ouF755
X-Google-Smtp-Source: AGHT+IFVOHLnfz9Syhj6oOfkcR1iMjeOxNJ71fXfmk/eQVkIAMWAd/lELwmaP3i3v3Jyv1qWvBsHJw==
X-Received: by 2002:a05:6a00:3a1b:b0:736:34a2:8a23 with SMTP id d2e1a72fcca58-74ad456522emr1357989b3a.15.1750807852873;
        Tue, 24 Jun 2025 16:30:52 -0700 (PDT)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749b5e1f61dsm2871246b3a.37.2025.06.24.16.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 16:30:52 -0700 (PDT)
Date: Wed, 25 Jun 2025 08:30:37 +0900 (JST)
Message-Id: <20250625.083037.1910124819838055415.fujita.tomonori@gmail.com>
To: miguel.ojeda.sandonis@gmail.com
Cc: a.hindborg@kernel.org, alex.gaynor@gmail.com, ojeda@kernel.org,
 fujita.tomonori@gmail.com, aliceryhl@google.com, anna-maria@linutronix.de,
 bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org,
 frederic@kernel.org, gary@garyguo.net, jstultz@google.com,
 linux-kernel@vger.kernel.org, lossin@kernel.org, lyude@redhat.com,
 rust-for-linux@vger.kernel.org, sboyd@kernel.org, tglx@linutronix.de,
 tmgross@umich.edu
Subject: Re: [PATCH v3 0/5] rust: time: Convert hrtimer to use Instant and
 Delta
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CANiq72kHocyULzwqxS51XeSEhsJpccfNFc+QYE67yvfvS8BApw@mail.gmail.com>
References: <CANiq72nwaxszEbn6O3xZi6H9P+U=5N0ugK1n9qBRteQwKXQSaw@mail.gmail.com>
	<87wm912sjg.fsf@kernel.org>
	<CANiq72kHocyULzwqxS51XeSEhsJpccfNFc+QYE67yvfvS8BApw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Tue, 24 Jun 2025 23:13:49 +0200
Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:

> On Tue, 24 Jun 2025 at 15:11, Andreas Hindborg <a.hindborg@kernel.org> wrote:
>>
>> None of the options are the right choice.
> 
> That is fine (it is also what I have been arguing in the other thread
> and in previous times), but that does not imply `into_*` is not a bad
> choice if we really want to follow upstream.
> 
>> Cost and ownership _do_ line
>> up for `into_*` in this case.
> 
> No, ownership definitely doesn't line up: `Delta` is not `Copy` and
> there is no conceptual ownership transfer. While it says "owned ->
> owned", not being `Copy` is quite important here: the guidelines

Just to clarify, Delta implements Copy:

#[derive(Copy, Clone, PartialEq, PartialOrd, Eq, Ord, Debug)]
pub struct Delta {
    nanos: i64,
}

But it's just i64 so your point is that there is no conceptual
ownership transfer, right?


> clarify in an example for a `Copy` type that if the input is not
> consumed then it should not be `into_*`.
> 
> Sure, "Variable" cost means anything could go there, but that doesn't
> tell us much, i.e. if it was completely free, we could just as well
> pick `as_`, which would actually provide some information since you
> know it needs to be cheap.
> 
> So the whole argument for `into_*` is... "it says 'Variable' cost so
> it lines up"?
> 
> Now, what I argued is that we may just as well define our own rules,
> since that table is confusing and doesn't cover all cases. If we do
> that, then you could propose things like "all owned->owned methods are
> `into_*`", which I think is what you are essentially implying here.
> 
>> I do not think that is settled.
> 
> If you think so, then the patch shouldn't be applied.
> 
> Cheers,
> Miguel
> 
