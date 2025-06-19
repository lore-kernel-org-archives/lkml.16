Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39410634;
	Thu, 19 Jun 2025 00:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750292845; cv=none; b=Qoc9sOXgDk1IjEr+vqBfXJUn7oyb4pTpk9/vKiuEp6PtJebORhHuja7hX6Q9mmcUToWbcgyOFRRmhePGavecL1GHENnjsEIFYKTuTd3f8kIG15jUgbMfWJSLhLkYYcG3F8LVoOiaU5yV7ziq/98X200seXm/w9wyfFnZPQC463M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750292845; c=relaxed/simple;
	bh=D2QHGOrkPRT9cEAlzfjsTG2JKVCN4S3pMkDnx2RKA5g=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=L0GMTxyheyfu24kCRhH/wfWA9f0dx0rZ9SSdnu9hqVpLAd9AvmUMJSoMA0tsISynu0H5m88i4cm3IhK2GyDh0Lt/J56Gttt0T+i+PNRJ3NH6LIFmXsYLb/usQdgs8BeBPWnUizBz74Q1F3wVDNPA7zMMo9GvJWQrX03cragvCrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FNpY2QC4; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FNpY2QC4"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6fae04a3795so2241766d6.3;
        Wed, 18 Jun 2025 17:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750292843; x=1750897643; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:references:in-reply-to:message-id
         :cc:to:from:date:mime-version:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M9YOMpnpzeVuCi165RB7lpzIKk9X4syd6BEmBLHpsUg=;
        b=FNpY2QC4pDBabAGjYDUDxEmFW+wetnLRlrIQ9W6NxFi+aMxKOTjjNDrzO6DdtWSeGP
         fO1CjsGrePZcsZIe3Sw7f0VKLr39RNIcOPwd6jj0wVezBgIH+zW4OT18ahsVSy9/SFOt
         WCg1QMCZmHA4Ni219Fu7kd8aBzJmMc7QnoeNULOk/SesN6VY1qA/mpxIFwJ/VfD8y67Z
         snlQ9bKEzrdMOPR65R+DCgcfnlctA/lwQHZwi0UeY68yxal1gM91ZJ2kR2wxCH11/n6S
         oq5qDkcU1hkYMRFqP8Ymvz61Lm6u5o9HfQ4nLnWvK3wqXA1V53MIVSOUKeSdqELhF5eb
         tj+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750292843; x=1750897643;
        h=content-transfer-encoding:subject:references:in-reply-to:message-id
         :cc:to:from:date:mime-version:feedback-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M9YOMpnpzeVuCi165RB7lpzIKk9X4syd6BEmBLHpsUg=;
        b=P06JnPVu6MnbEvgBMhV8JUrFyfJHOMtyqMi0XtvYFoEZLmdzbdoA2z/UkTRC2OOTeP
         14DLlV454NoURiSsXVUWA4n0lOwiHilJbP3Pk5tmQDEP7ncsU5taER6IIrAxuetjf8v/
         VUkxMybhgOgGyEhnRzFOEItXOHVrmYmnQ9JYtTlw4KzHWuwFNjx/nuRhHzuDL8pSr3US
         xBLVwoLysJeUKqIuxNdw4WADTCZoVZmW0w2KaWb+lXCoE2eHGulLEzRr0ylmNAzgVWKM
         hSj7gIR4xNbZhjNiYG0x0BHTWlvaBH3L/C6OmnPT2Z+2WeaHkY3CHRvbwlY26/ftYNS/
         7Drg==
X-Forwarded-Encrypted: i=1; AJvYcCUCw8+tWE5zFBEv3LGagIWz4W1iY+eb3jyi5zMyuHVGM4Hhbz2kymhP67nluWKeoMaAm2PO88QJGROAJv4=@vger.kernel.org, AJvYcCUcd91lbjlg4bWKVkDjsakfbqwumuJgV4I+8u4Q+YveenLwCWXFK6HqJzIoSseCakD472YQuAamMGK3rjATJXk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWtRhuBNEwapg40QjjOaDmF6l8p890JA7M2rlQrwzGyHRHgBh3
	Jg/eVIbw8Ops5y8McyOO2f94LX6Cm//yxnM7cd/3gnzBCYQTNKA/pRIL
X-Gm-Gg: ASbGnctAgiMd9WU3m6jyRrsbHbPHZcXDbmNxxAZ6JoD+95dnk/2j35ziGiNuWb1bbGJ
	l4kDO7lUjpSm6hSpRxGGj7jcY6W0h/i05AvYaYCAcB97PJDBzWsU/GaKkSzs5EMoaJLn9hmUVXo
	0UOESW4VYWKZWM/EpbWawCALwXEO7jgiCuDTExIevBtFkQbyrRxaanD7yDn/FOqnQUX/mTN2cj6
	mRfP/9FoUhA2zeb/raUR70caT+Rv29ZSZY5ODTyE0BchbNWrX6kuTZHFLfTPt9LUASiyz9JrfF9
	P2VP2Ke9YM+55yUPE3i7tkpxnahM1CC30BIWPmQnfcBzoVRmomK6fFKom+polBIgqjrfGBn8gC8
	z+wlBruCfo/+Sy5/sYL1Zz1f5PCJ53vkCUWInmAJvwkHcqDW+pHjb
X-Google-Smtp-Source: AGHT+IHu9IMOger9epgEI1xHaWo2xMVSyVaBcp+8MbX5mfmFrUOf7uA1NvmSpHxs/YHyRHeG1F6eFA==
X-Received: by 2002:ad4:5b83:0:b0:6eb:2fd4:30a7 with SMTP id 6a1803df08f44-6fb4777724cmr288347286d6.33.1750292843018;
        Wed, 18 Jun 2025 17:27:23 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd014e7aa2sm1535026d6.13.2025.06.18.17.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 17:27:22 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 194791200068;
	Wed, 18 Jun 2025 20:27:22 -0400 (EDT)
Received: from phl-imap-16 ([10.202.2.88])
  by phl-compute-01.internal (MEProxy); Wed, 18 Jun 2025 20:27:22 -0400
X-ME-Sender: <xms:allTaErYsuxPbFGxSnQf_yBtu9PKTVFc_44_TIkQOXYGloru_ENURg>
    <xme:allTaKqvpk5GXbD6RmJ40_k-sCgl375UO_5ZN1OQ8l1m8amB-keRHoh8hD7H4JfSs
    FQhng_ex1XrBNEFQg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdegtdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedfuehoqhhunhcuhfgvnhhgfdcuoegsohhquhhnrdhfvghnghesghhmrg
    hilhdrtghomheqnecuggftrfgrthhtvghrnhepgedtvddvveegtdfhueelkefgfedtfeek
    jeduheegkedvueekieeujefgfeeviedtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrgh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhq
    uhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqud
    ejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgv
    rdhnrghmvgdpnhgspghrtghpthhtohepudekpdhmohguvgepshhmthhpohhuthdprhgtph
    htthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegrlhgvgidrghgr
    hihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepfhhujhhithgrrdhtohhmohhnoh
    hrihesghhmrghilhdrtghomhdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhl
    vgdrtghomhdprhgtphhtthhopehjshhtuhhlthiisehgohhoghhlvgdrtghomhdprhgtph
    htthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggr
    khhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehfrhgvuggvrhhitgeskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheplhhoshhsihhnsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:allTaJPf45LLAJMdVd63fQ4tDnaXoCa6iGlpEICDTlIBy4jtvdUcZw>
    <xmx:allTaL6vSyC95rDdlAx32JzorcbK3kzXClkzbZGhE_4sgdrzbOtYxg>
    <xmx:allTaD5MisO5nHOwtr5WowFmvR3WVt_L_lmwS_TmN_hQlRGz-zJZRw>
    <xmx:allTaLjGcBCLGebXJ01bYlIHKqzkQQiQyBoEzPuOxriw5f3ov3xCqg>
    <xmx:allTaN59y4bwGTQsTS4yTNzFwdx_NdwG3_sJz2kHE2bla7g684KIC7_J>
Feedback-ID: iad51458e:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id DFCC02CC0081; Wed, 18 Jun 2025 20:27:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T98afce9dcae29be7
Date: Wed, 18 Jun 2025 17:27:01 -0700
From: "Boqun Feng" <boqun.feng@gmail.com>
To: "FUJITA Tomonori" <fujita.tomonori@gmail.com>
Cc: "Andreas Hindborg" <a.hindborg@kernel.org>, alex.gaynor@gmail.com,
 "Miguel Ojeda" <ojeda@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Anna-Maria Gleixner" <anna-maria@linutronix.de>, bjorn3_gh@protonmail.com,
 "Danilo Krummrich" <dakr@kernel.org>,
 "Frederic Weisbecker" <frederic@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 "John Stultz" <jstultz@google.com>, linux-kernel@vger.kernel.org,
 lossin@kernel.org, "Lyude Paul" <lyude@redhat.com>,
 rust-for-linux@vger.kernel.org, "Stephen Boyd" <sboyd@kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Trevor Gross" <tmgross@umich.edu>
Message-Id: <3da3c6d4-5745-432a-8771-561b03b0e9b2@app.fastmail.com>
In-Reply-To: <20250619.092359.585578352260473138.fujita.tomonori@gmail.com>
References: <aFJINI8ImfxMnvrx@Mac.home> <87tt4c983g.fsf@kernel.org>
 <aFMTsz63qOo5LQOE@tardis.local>
 <20250619.092359.585578352260473138.fujita.tomonori@gmail.com>
Subject: Re: [PATCH] rust: time: Seal the ClockSource trait
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Wed, Jun 18, 2025, at 5:23 PM, FUJITA Tomonori wrote:
> On Wed, 18 Jun 2025 12:29:55 -0700
> Boqun Feng <boqun.feng@gmail.com> wrote:
>
>> On Wed, Jun 18, 2025 at 09:13:07PM +0200, Andreas Hindborg wrote:
>>> "Boqun Feng" <boqun.feng@gmail.com> writes:
>>> 
>>> > On Tue, Jun 17, 2025 at 05:10:42PM -0700, Boqun Feng wrote:
>>> >> On Wed, Jun 18, 2025 at 08:20:53AM +0900, FUJITA Tomonori wrote:
>>> >> > Prevent downstream crates or drivers from implementing `ClockSource`
>>> >> > for arbitrary types, which could otherwise leads to unsupported
>>> >> > behavior.
>>> >> >
>>> >>
>>> >> Hmm.. I don't think other impl of `ClockSource` is a problem, IIUC, as
>>> >> long as the ktime_get() can return a value in [0, i64::MAX). Also this
>>> >> means ClockSource should be an `unsafe` trait, because the correct
>>> >> implementaion relies on ktime_get() returns the correct value. This is
>>> >> needed even if you sealed ClockSource trait.
>>> >>
>>> >> Could you drop this and fix that the ClockSource trait instead? Thanks!
>>> >>
>>> >
>>> > For example:
>>> >
>>> >     /// Trait for clock sources.
>>> >     ///
>>> >     /// ...
>>> >     /// # Safety
>>> >     ///
>>> >     /// Implementers must ensure `ktime_get()` return a value in [0,
>>> >     //  KTIME_MAX (i.e. i64::MAX)).
>>> >     pub unsafe trait ClockSource {
>>> >         ...
>>> >     }
>>> 
>>> Nice catch, it definitely needs to be unsafe. We should also require
>>> correlation between ID and the value fetched by `ktime_get`.
>>> 
>>> But I still think it is fine to seal the trait, why not?
>>> 
>> 
>> There could be potential users of a customized clock source, for
>> example, a device which also has a timestamp register itself:
>> 
>> 	https://lore.kernel.org/rust-for-linux/Z9xb1r1x5tOzAIZT@boqun-archlinux/
>> 
>> So I think with ClockSource being unsafe and well documented, making it
>> not sealed wouldn't be a problem. IMO, sealing is for the cases where we
>> must not have downstream impls, ClockSource is not such a case.
>
> Ah, I wasn't aware of that kind of use case. Indeed, a customized
> clock source seems like a better approach than reinventing Instant and
> Delta in a driver.
>
> On the other hand, I think that sealing HrTimerMode trait is the right
> approach:
>
> https://lore.kernel.org/rust-for-linux/20250617232806.3950141-1-fujita.tomonori@gmail.com/
>
> Firstly, HrTimerMode needs to be supported on the C side, so
> implementing a custom Rust HrTimerMode won't work.
>
> Secondly, if a developer adds a new HrTimerMode on the C side, we
> believe that the corresponding Rust support should be added in the
> time abstractions, not in drivers or other places.
>
>
> Does that make sense?

Agreed. :)

Regards,
Boqun
