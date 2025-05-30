Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C54171092;
	Fri, 30 May 2025 19:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748633781; cv=none; b=HJgqY2MWGRHbmMgwEq54G8n/Hjw4SgfhRYwX23ubJjzp7OelELrEW6DAr3locaPq2mpqNRZA03cAd1Q1ZtCPyDSENT0MvMFpAuknWcpddm8nDAyxyImwxLr9ojqK4lTBAyUF7Mm9n6F9kNyfCRc4AbcR+BwEyIWNAyitvbW3dWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748633781; c=relaxed/simple;
	bh=RQ1cgmsBiYtBcV2JvJx6KX21xrWXKFk4Ysc0nbvB/Fw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B0YeIuXdvCxrDZQOhWTR3B87YEPQNpRok1gEKZEFUBR+G1AjQhIzNhZrTvZoD6LgVhUV9O8GymcV9ov+L8NeLeZWM1eJz6VJfOkFdhdO7he5FGHFoINKssoEsZDpV6G2lu7hQykU9awspMPNkwT+vuljL7BkmJ7SirktyKKuUx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F4rqJOlo; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F4rqJOlo"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7cf749ef9b1so233957685a.2;
        Fri, 30 May 2025 12:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748633777; x=1749238577; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e3CLWQG0fpm6H2RjIdxn9ZQPGTCS57iwIFP+Fd0KOAU=;
        b=F4rqJOlob1Kr3KmlF3nRO7JNzn4xblfmU1HI2hPcUVs68w2qNWiM8EYNniRPF8XT9+
         jv2Sju7gqbCVqSG3hmOyyOSuOOW3n+m0VAf+pxK3f56iDsvmc3kpJ+mNAgfhOAYduiLf
         OXSSA/0rmXMahGhFS+9q0Oq0QsXAgt0crmwpmLUGadGlF9qRfdpKud0YXDkoHSi4gKaC
         JnlI5c3j7rr7EU3+MJVM5kXQW6OBB0oGwHtnPDRKAH9nxS6KVq5DdKM11H6HZT5hBnOw
         4glHKB38N2dbhD6XtzvGtp1hoDRuACEXkt7xApkkh7brp2D9uM+aABlUC2fDtxaoqh91
         5EnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748633777; x=1749238577;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e3CLWQG0fpm6H2RjIdxn9ZQPGTCS57iwIFP+Fd0KOAU=;
        b=glLDULy+KyWJPHHDvy3KuZ5FTaUNi97DYQ6P4NbsXxRl+l6dr7QRHBRas8/V/qfdDB
         WE+FSQjdMTNLMP8anyh0HUJqDGygTeevkAnf8lXfWBkEqEl0/1dLPVDP/KWOQo0dADBy
         KSOTurIF2h4qCMXyot2Wx7WhgNJnGhAhmQkAH6TcvBNvpVxSVQXWSZM5YtaJ+L5XZ9zL
         4L99vKay5jEOCfmFhmLHMlek/C/vimanLy62oGcRcI4VUGXXjR5++4FhySKkXYF8blBu
         4D1hQGCyIaGNdcFBgg9/B0Uv/ctC6d9a5iIa8wYQzGSg/BXOhHwJshMTCArOAAqYiEb1
         9EUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkyUUegmReMT9xbIFVm/KohwUVxI5q5N3nD6QBo4cBlCAiOsE2XWuVmSs9TWkdglb/aMLolQm5Y7y7zja9kxM=@vger.kernel.org, AJvYcCWgn6F0sPnwKXk4oQiB4U7qhEHMTuwezAS+BaDTXqrXNvU9WsvylRYwd093+i2PQoK2H5Y+T3Tb1Wfb1bI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiEDKYcb+aA2b9urwgnWe5mV/NIB5PkB6rp6nT3W+h8Kgzl2Y6
	FG2ByREBKZMQ8XPeDJeP3OzbdLkow8RmSHLOKuEjDl3lO5EOESYvsFtL
X-Gm-Gg: ASbGncsThcMUGHGX9z0i9MR6r6bTBRb95g2GYpoxLKxY3YAWkb7CXKVKOqYJ74P1KuS
	bzzVgoBu06QcbSPpegIpSngflDUEJPm6ZozgcLQ6NJMiPJOz3MN2nme1f/Y0bOvALyIzFESE/x3
	X69FxL5pZWN3mtYDKwe4QGtwLj3LEqYDCAb/Ej5TdT9udEb95TmswHSmldEQ0NQ/Gxh4Bk4trmO
	wvH0PqvSs50ufStdUTZzhR4dA13BKVVTbT6sqFlb9TXJGVw56bJ1WgQzwi49SdLkWrHf5KnOCeY
	FBX02gBhhEHhMa04osIpV6+QP6mc74Lre6MXRrRYp0lJJZqJkJOfs1Ub0GHsKng4K1nCGQBVYgJ
	jlcdVAfgMxx4/oJ6tZlvXptdnDJS5iCPIBQYivql5eQ==
X-Google-Smtp-Source: AGHT+IFiBM82z8gOjhNxN3QjK51zi++nQGc+Dmiv8EOfRzy2ZiVHjoBycd573cXAGEAIUetEKf+KDQ==
X-Received: by 2002:a05:620a:1b9b:b0:7c5:49d6:733a with SMTP id af79cd13be357-7d0a1fa598cmr745351685a.21.1748633776777;
        Fri, 30 May 2025 12:36:16 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a115aabsm281505485a.60.2025.05.30.12.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 12:36:16 -0700 (PDT)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 115E61200043;
	Fri, 30 May 2025 15:36:16 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 30 May 2025 15:36:16 -0400
X-ME-Sender: <xms:rwg6aEl3uIEYoeIYaVTvgw4KoknUnF2o0_JgOwzCQ6jUOHk6RZgKyQ>
    <xme:rwg6aD18-INRY-Di_hHHI6iIJjxiw3gw7_VKKVbWXquUBbprVP9DrzwhGlSfuqyYn
    Dl4YkuZXAQrqbLyMQ>
X-ME-Received: <xmr:rwg6aCoMCNZkHCopabAJlVPvJgOful7L9Ttlpu5m4jWEzZuoqhfY13cU_w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvleekjeculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhf
    gggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquh
    hnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvghrnhephfetvdfgtdeu
    kedvkeeiteeiteejieehvdetheduudejvdektdekfeegvddvhedtnecuffhomhgrihhnpe
    hkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqd
    eiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhl
    rdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudeipdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehlohhsshhinheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtoheptghhrhhishhirdhstghhrhgvfhhlsehgmhgrihhlrdgtohhmpdhrtghpthhtoh
    epuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrhgvghhkhheslhhinhhu
    gihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhi
    esghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothho
    nhhmrghilhdrtghomh
X-ME-Proxy: <xmx:rwg6aAlW9kMQZwsOZ_iuqRS-U2H3frjD1GwISOwNT3PLoRzxT_iePA>
    <xmx:sAg6aC18vpumpSx6T5GkvXoXr_5rKJpGQ-FNEGd_dB0CFacR6ARzWw>
    <xmx:sAg6aHvpDXRy9LQElPCPngUTToXkeCf1E9NxgOWoZglxFVTGrX7qKA>
    <xmx:sAg6aOV8skPFim459YZqQFpVpaOnbHSB_YhfPFpKRYTD7A96a063BA>
    <xmx:sAg6aF24AfFaY9GRlCrPGXmDNq--0CQYRvFpNibdQXG9LlNunt36UFtT>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 May 2025 15:36:15 -0400 (EDT)
Date: Fri, 30 May 2025 12:36:14 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Benno Lossin <lossin@kernel.org>
Cc: Christian Schrefl <chrisi.schrefl@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>, gregkh@linuxfoundation.org,
	rafael@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] misc device: support device drivers
Message-ID: <aDoIrq6YCh-KwV4S@Mac.home>
References: <20250530142447.166524-1-dakr@kernel.org>
 <9e0acb35-7d10-4a8e-b5c6-968d1310146b@gmail.com>
 <96891e54-8614-4f98-8a98-ad90f18c8e43@gmail.com>
 <DA9QOTLU4U5M.2X7K7UWJ53QGI@kernel.org>
 <aDoIeYM2b8kXG8-O@Mac.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDoIeYM2b8kXG8-O@Mac.home>

On Fri, May 30, 2025 at 12:35:21PM -0700, Boqun Feng wrote:
> On Fri, May 30, 2025 at 09:24:28PM +0200, Benno Lossin wrote:
> > On Fri May 30, 2025 at 7:29 PM CEST, Christian Schrefl wrote:
> > > On 30.05.25 6:37 PM, Christian Schrefl wrote:
> > >> On 30.05.25 4:24 PM, Danilo Krummrich wrote:
> > >>> This patch series adds support for device drivers to the misc device
> > >>> abstraction.
> > >>>
> > >>> For design details, please see:
> > >>>   * patch 5 "rust: miscdevice: properly support device drivers"
> > >>>   * patch 6 "rust: miscdevice: expose the parent device as &Device<Bound>"
> > >>>
> > >>> This patch series depends on the pin-init series from Benno [1] as well as on
> > >>> the misc device series from Christian [2], with UnsafePinned replaced with
> > >>> Opaque, as suggested by Alice, since UnsafePinned may still take a while to
> > >>> land.
> 
> Maybe I'm missing something, but don't we have our own version of
> `UnsafePinned` [1] which can be replaced once Rust upstream has the
> `UnsafePinned` stabilized. I don't see any discussion about abandoning
> that effort.
> 

Missing the link..

[1]: https://lore.kernel.org/rust-for-linux/20250430-rust_unsafe_pinned-v2-0-fc8617a74024@gmail.com/

> Regards,
> Boqun
> 
> > >> 
> > >> If you want I can send out a new version using `Opaque`.
> > >> 
> > >> We could also add a type alias like:
> > >> 
> > >> type UnsafePinned<T> = Opaque<T>;
> > >
> > > I forgot that Opaque doesn't drop, this would not be quite as simple,
> > > but with a newtype with a `Drop` impl it should be possible.
> > 
> > That's one issue another is that `Opaque` also allows uninitialized
> > memory and (if the upstream one isn't changed) also modifies the
> > behavior of shared references. I don't think we should name it
> > `UnsafePinned` if it doesn't guarantee the same thing as the upstream
> > one.
> > 
> > ---
> > Cheers,
> > Benno
