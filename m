Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4FB224B12;
	Thu,  1 May 2025 12:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746103087; cv=none; b=WvwUUI2R2+iePqR1Syu+Pvn54MXcv3WT3h6KzLEk3BgQLiRsr+qE9e/y3xaNTao/naUOoIYMjSN5rNQ1+zOozyb43jno4j2RaBadmcgkjDvdYdSuZm36cNydqnm6ZT7PmRPftdwmmxsZukFe4daLry+uqs25OlOeqIvq5CHKs3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746103087; c=relaxed/simple;
	bh=EUWhBEMESJNl0gkEKGlP8LOH/EcWM5RbHNMptpQZcnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QhgNZbJNqCnmrTmHNH9iMuMCosuUsUFRLL2QY4dQNQxSW/YCAqMxIk0Nmz/AlfTFf58bla+qIx8RnU1EKzo8uCDOoGtn/X5ezPsx5knNLaPUYYdlbEB4X0G14bECBjbwfzXC9eN3hNA5QkWCm+8Haio6gYaAFc2eosxynayydpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eG/ftQSA; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eG/ftQSA"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6f0c30a1ca3so13154216d6.1;
        Thu, 01 May 2025 05:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746103081; x=1746707881; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJidd/RElJbmhyzEIgi4wyEaJq853O9721Q+pPswmbM=;
        b=eG/ftQSATiXf/i3OH1ZQuUlQhfWoepmzEtitegtS8G97vB4GSM6oCSiCqRHe1zy4Ge
         9XCbFpbQqPb4PWCVPZYSZFH3o087cKhr6volEfHWmMeY0wo34TyX7DSgP3bh7K1/YG6H
         ea6x1BDn/ItiUxvtyTVVaxu16aXJZVyA4cJfDFzjrzzbNqBlpdvD5ntDGpj1U4gOryu9
         ERbF+dhRQAWu+D9U+20cSqk775s+tsccW3viclmhl8mbZOaLl19LOphXhl44zkzswdVu
         DL8NNWE7FDqRKUD/dtuYrGWwNdR9xfII+TWUGuXXPv/4swF0cBFIPBG9HTAa212rdOx/
         rLrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746103081; x=1746707881;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SJidd/RElJbmhyzEIgi4wyEaJq853O9721Q+pPswmbM=;
        b=LeIiFQNo/UKIIU6SgWunsN5zh8YhC/UmxqHnt0Er5RKgLpfskZlPW5nNdjfA8hAPw2
         rYDRj6duqwGO6H0HcGwSIUi9Z96inWVsFPawhevH/yXDfpgrgSMYk4jq/HutGDR0r3uM
         lll378x38JAR1n6X+fJIOdhG9jM9yhwOnzv4vrP95MphY/R5xLD8xM3TQx1uSPfRik+B
         ScUIw/caTR0bWDRYjbgoJYeO+lF52AuhaY0peednmZepdUv32xcpPaNbxEE57NSZHp0Q
         e3ihae8pVfuvq2NO0s7HFfrtTgsC1MIZAzeHN2N+yBKC7oHVDgFE2c2cOoOGL6N6gTKU
         kA3Q==
X-Forwarded-Encrypted: i=1; AJvYcCU2Xbhn4c5XY23rVegfdMtZxl4n5Ntt6LgQJZkxnBVOYkLQ7Wcvm3AdrfVXZsyvvwnEDY+a6IFUNmSbYG8=@vger.kernel.org
X-Gm-Message-State: AOJu0YysAxMYi86mi9WmiWJakw3st5+Lze+Z+1V7FGMcChZeGYIkcIf0
	YwiAPVmSarBLYuT65f6rbnABivuaNqF2batS9Kj5froZ2q376s0M
X-Gm-Gg: ASbGncv/uOocQO5uLl8LoHOuvVS+Szov9n1+3BK9Zg3ycfmLKNYYBwm2o5NtnSQzg2L
	4v9ebgiEzOmHz6TnH6U17ROgdZqHdGYXxJ9FgWfWQSIk8641BczWpHeYrur3M3CliPJ8KkBqTXw
	5LhpsRxWc6uqOsg6SdF8jxEXAP7ovHhZoUEWotKcp2tB0rzaxx8du1waW5jzbbS4QDGND3Hbgdd
	FY6o+v+0h1GLRP4j3crWE+DYedzuIz9vYbsZSw5V2zKiQka1TtfrYUwMXZJDeYR+q/rNhRXdNuV
	vpxMkkffOV/WMXXgwqyuR8k8w6CxoayuuGLE8OHHnnh1/CRRJWc9+TmMmVmbKLHcQypS3NSle1C
	xMIevbK9ijYjBRqaqITR2MKTRoF0FdzU=
X-Google-Smtp-Source: AGHT+IEN3F/3XgP508slDgpxydPYaRM79mgc5S88IrRp53yDSi3bT1Kp6KKGV4q+Gq1pVIJ+tQm2pg==
X-Received: by 2002:a05:6214:4199:b0:6f5:ea0:3c1e with SMTP id 6a1803df08f44-6f50ea03e74mr23978016d6.23.1746103081315;
        Thu, 01 May 2025 05:38:01 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f50f3d2e27sm3871396d6.66.2025.05.01.05.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 05:38:00 -0700 (PDT)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfauth.phl.internal (Postfix) with ESMTP id 6D69D120006D;
	Thu,  1 May 2025 08:38:00 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Thu, 01 May 2025 08:38:00 -0400
X-ME-Sender: <xms:KGsTaPYtq9mKbfcGCSS9rUlsgdv0hBe2xljIa61IdiqWMhXgfKYx_A>
    <xme:KGsTaOax63No48VxeKnCbHGtFW3iFFJsmmoYogfHxFU-JGRdXb4iZKr9f-sy_-meL
    PMGlLjQH17yIHsCfA>
X-ME-Received: <xmr:KGsTaB-7l4in8Z-sZHWGMQctaqOro1t_XWyc_NOjLVvIaQlLpDTvlMh7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieelheelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtrodttddt
    vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeeitdefvefhteeklefgtefhgeelkeefffel
    vdevhfehueektdevhfettddvteevvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgr
    lhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppe
    hgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepvddupdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehfuhhjihhtrgdrthhomhhonhhorhhise
    hgmhgrihhlrdgtohhmpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgv
    rhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvgh
    gvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehsrghm
    shhunhhgrdgtohhmpdhrtghpthhtohepfhhrvgguvghrihgtsehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehlhihuuggvsehrvgguhhgrthdrtghomhdprhgtphhtthhopehtghhl
    gieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopegrnhhnrgdqmhgrrhhirgeslh
    hinhhuthhrohhnihigrdguvgdprhgtphhtthhopehjshhtuhhlthiisehgohhoghhlvgdr
    tghomh
X-ME-Proxy: <xmx:KGsTaFryLyLnrDsvnXU7POn7_mzKUIC0f0Kl4dDpBNCtpMn3mSlFYw>
    <xmx:KGsTaKrQYlXYrUlVR2I411sL48sQ1b7_7DyinrtHOjjrdbkIqeE4xg>
    <xmx:KGsTaLQwKmzS7FxD_aZcXJWXxSq7SEic0qb6TwTrFsGICG9sC2RYlQ>
    <xmx:KGsTaCoGRmZoZZvHrq67tTW40HtjAnPrNmqySlrmYBz3uJ59yTVRRg>
    <xmx:KGsTaL4ow5iRF95Nz5vvadBNChWPt4BVVk-w8rVIoOOsdSPQLNhNU16y>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 May 2025 08:37:59 -0400 (EDT)
Date: Thu, 1 May 2025 05:37:58 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	a.hindborg@samsung.com, frederic@kernel.org, lyude@redhat.com,
	tglx@linutronix.de, anna-maria@linutronix.de, jstultz@google.com,
	sboyd@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	aliceryhl@google.com, tmgross@umich.edu, chrisi.schrefl@gmail.com,
	arnd@arndb.de, linux@armlinux.org.uk
Subject: Re: [PATCH v1] rust: time: Avoid 64-bit integer division
Message-ID: <aBNrJgLFpswcgOEK@Mac.home>
References: <20250501015818.226376-1-fujita.tomonori@gmail.com>
 <aBNojspyH5dHsuOm@Mac.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBNojspyH5dHsuOm@Mac.home>

On Thu, May 01, 2025 at 05:26:54AM -0700, Boqun Feng wrote:
> On Thu, May 01, 2025 at 10:58:18AM +0900, FUJITA Tomonori wrote:
> > Avoid 64-bit integer division that 32-bit architectures don't
> > implement generally. This uses ktime_to_ms() and ktime_to_us()
> > instead.
> > 
> > The timer abstraction needs i64 / u32 division so C's div_s64() can be
> > used but ktime_to_ms() and ktime_to_us() provide a simpler solution
> > for this timer abstraction problem. On some architectures, there is
> > room to optimize the implementation of them, but such optimization can
> > be done if and when it becomes necessary.
> > 
> 
> Nacked-by: Boqun Feng <boqun.feng@gmail.com>
> 
> As I said a few times, we should rely on compiler's optimization when
> available, i.e. it's a problem that ARM compiler doesn't have this
> optimization, don't punish other architecture of no reason.
> 
> Regards,
> Boqun
> 
> > One downside of calling the C's functions is that the as_micros/millis
> > methods can no longer be const fn. We stick with the simpler approach
> > unless there's a compelling need for a const fn.
> > 

Btw, I think you're missing the Suggested-by tag from Arnd, of course if
Arnd is not against it.

Regards,
Boqun

> > Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> > ---
> >  rust/helpers/helpers.c |  1 +
> >  rust/helpers/time.c    | 13 +++++++++++++
> >  rust/kernel/time.rs    | 10 ++++++----
> >  3 files changed, 20 insertions(+), 4 deletions(-)
> >  create mode 100644 rust/helpers/time.c
> > 
> > diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> > index 1e7c84df7252..2ac088de050f 100644
> > --- a/rust/helpers/helpers.c
> > +++ b/rust/helpers/helpers.c
> > @@ -34,6 +34,7 @@
> >  #include "spinlock.c"
> >  #include "sync.c"
> >  #include "task.c"
> > +#include "time.c"
> >  #include "uaccess.c"
> >  #include "vmalloc.c"
> >  #include "wait.c"
> > diff --git a/rust/helpers/time.c b/rust/helpers/time.c
> > new file mode 100644
> > index 000000000000..0a5d1773a07c
> > --- /dev/null
> > +++ b/rust/helpers/time.c
> > @@ -0,0 +1,13 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#include <linux/ktime.h>
> > +
> > +s64 rust_helper_ktime_to_us(const ktime_t kt)
> > +{
> > +	return ktime_divns(kt, NSEC_PER_USEC);
> > +}
> > +
> > +s64 rust_helper_ktime_to_ms(const ktime_t kt)
> > +{
> > +	return ktime_divns(kt, NSEC_PER_MSEC);
> > +}
> > diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
> > index a8089a98da9e..e3008f6324ea 100644
> > --- a/rust/kernel/time.rs
> > +++ b/rust/kernel/time.rs
> > @@ -228,13 +228,15 @@ pub const fn as_nanos(self) -> i64 {
> >      /// Return the smallest number of microseconds greater than or equal
> >      /// to the value in the [`Delta`].
> >      #[inline]
> > -    pub const fn as_micros_ceil(self) -> i64 {
> > -        self.as_nanos().saturating_add(NSEC_PER_USEC - 1) / NSEC_PER_USEC
> > +    pub fn as_micros_ceil(self) -> i64 {
> > +        // SAFETY: It is always safe to call `ktime_to_us()` with any value.
> > +        unsafe { bindings::ktime_to_us(self.as_nanos().saturating_add(NSEC_PER_USEC - 1)) }
> >      }
> >  
> >      /// Return the number of milliseconds in the [`Delta`].
> >      #[inline]
> > -    pub const fn as_millis(self) -> i64 {
> > -        self.as_nanos() / NSEC_PER_MSEC
> > +    pub fn as_millis(self) -> i64 {
> > +        // SAFETY: It is always safe to call `ktime_to_ms()` with any value.
> > +        unsafe { bindings::ktime_to_ms(self.nanos) }
> >      }
> >  }
> > 
> > base-commit: 679185904972421c570a1c337a8266835045012d
> > -- 
> > 2.43.0
> > 
> > 
> 
