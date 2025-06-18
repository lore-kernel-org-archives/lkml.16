Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78175217659;
	Wed, 18 Jun 2025 19:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750275001; cv=none; b=UMvgbGgzLeijPnzl4eL0lNKsYCPlNbOP9WDOAzi0qTZzc8kNuHkjs5Fwlyn83XJEtzXGhhRw+jSEHEPzvQpcJZGlIHqj24pYJVfVSxMA2PxQYb+FVxaRHGWNKUWrVRsU7YMV43kFA9E0siIQrGM+ZkEmIV52QEBfWAREnrg6lQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750275001; c=relaxed/simple;
	bh=bscHnQdch1jXifTnWlmlQD5hRdNGeBFePaj9ILZbMqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R/HUxJzi9p49oqoIJn3J/2t5sbSyAbiqGLCqUpVBbBYqVh5tdhK+1vzyR+a1dtfmzUlAYINRTtWoq3aEazfkv29tKQ0cuN3I+DD9lUBogyHM98i6rSB0cGvSqkQ+h415a0RfS9++BLDo/05KH8cpOnlgMK+3gRIVRwKSAIUPRdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g7F1WhZy; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g7F1WhZy"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6fad8b4c927so10776d6.0;
        Wed, 18 Jun 2025 12:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750274998; x=1750879798; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VWKmI+GkA/dbePUed4Bynqf5qAwVXHkIo1ucJHICSWg=;
        b=g7F1WhZy7ZJawaNAlpBWOhlMoblTxncuUJVq5K2AiXs39XA8rdgB3yGLm+m7BdlhIW
         AG5btskXkfUgOnZcr3r9aY7wY7vib6rQ0LmbDPGG3+agpvEOiT7Hg+DjRTAh1j7cwxUe
         lqaLZSlCPXpeCtink5mfbRs2VPpq7kdDCW1gLubOVXvVIJ7kOP2aDs1HYqiASyMDpEMk
         kBQQkalbZaz1TaCD9MungH/jpVRxxsLsZexLGOsXlWOAaNSgSBR3992em4Yp08KkAaCO
         LjnaX9LseB+5YIKcptlOP8hGGEB/bzTdkISGJ2xczffwb+Yjjdafxg5h63y9H8fxFAfo
         EDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750274998; x=1750879798;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VWKmI+GkA/dbePUed4Bynqf5qAwVXHkIo1ucJHICSWg=;
        b=hD3dL0ogpWx5aSePl6bqolsSEzyUZ34AFADWSuZXGT6BucZ0vEzP3sP3uZ+DCeCPRi
         NG5S7TzKAL6KN9sy/Ygre1Jdbnzqak8AuoMza097kvanoM5DVua2neBxTtBAveM2hT99
         ToAan695/FFkqJAjSpO36ceBly6c54qs3iwtT+OegUR1MbNDlZtO+SjIMaZ/Z5Y1JeJB
         IuE0nGZASa1s29Nxk7lv6iBw+8fWcDfB/f0bvFMv9mu52o3nqk+qn3Q9jwrS8sY7KA0o
         8gc7WobTE+5G6Kq3I03xKAHgGlQTLh5w2HRgTOrT15trQ4GQN+dsZznJfUHyIYPvv8OD
         VP8A==
X-Forwarded-Encrypted: i=1; AJvYcCVzQR/cj6v75cQpBBEk3yljao3ky1ugReWLAJbIFLN0qWe8mD2238agzmNamOBqyRmxgx8JtfKNU7o7LlY=@vger.kernel.org, AJvYcCWt7RrlelP68Uxv2m68of5hmK61KSOwk3U2/1kAzf1wc727vnccFpG87HEdNpB7GGT0uWTN+pe99VDk8FOhrRc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnIii5goHAY67nteIxBa/JG4vdvcligFhzhNCbvxHdjUjRXlrX
	Eo6igF3X7sUX8QnOMSO4HkNx4zcxqFhPb+VidnUrWRQ3fmEn/0cSnKMy
X-Gm-Gg: ASbGnctiTDg9sQT2IwsSHs6KjSHVopBeXcByjRVQIE2p9Vccju3pfFstqgd90YfwW6V
	dSOSEfz0yn+0uUQThBuuaWlG7oWE3Cz2JYOeCGn8L3bqfcDf+D0THm0tpa7r2bjab6IuRa+pyx1
	Vm/sPFgCSfcPz1qZExNTFEQP9E/Lh1uZSAOjQuWrMo/Ss3fkNmlXVKcFn2bfGvmkvj0pc4KOdkB
	kCvJSSfOA/lWA25JdCo7rTlbsKXdxAfFFyuOQ1Vskc/Ls0o3VOqEbExDsb0U2Znf5a4FJkE6Cam
	lzoBsR/4C8kgFNrkKxUF09ISmXqt+MEy+p5I0R0GlbJDa1Yr+sdFyTfx037RM4iip0aYiV9eJv+
	FHMVvWvjxIn0sZF2a5eigXgFqDrCnsR0L0Ywf0CLGO0tPH29boKgb
X-Google-Smtp-Source: AGHT+IHLnGKCZveunK7tiz1HcW59Q7dpjBTxoRIEJqPlYLK2DK9/WfSE7R23mvJDl/Jlifmz4BNlsQ==
X-Received: by 2002:a05:6214:328d:b0:6ed:1da2:afac with SMTP id 6a1803df08f44-6fb47798095mr328841456d6.32.1750274998198;
        Wed, 18 Jun 2025 12:29:58 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb565058fasm35688096d6.31.2025.06.18.12.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 12:29:57 -0700 (PDT)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 4F7E41200068;
	Wed, 18 Jun 2025 15:29:57 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 18 Jun 2025 15:29:57 -0400
X-ME-Sender: <xms:tRNTaEZq7cnY1EvLjEJhNw7WzAY2BcaKy577i0QkF5nRyfILANAOYg>
    <xme:tRNTaPY_DzwGpZ7q_tZam7GdBJllBomgW_rtSZoy3heCxvY-3aGNPYk-ygcY8QNBI
    BysYX74HqgGfs0VXQ>
X-ME-Received: <xmr:tRNTaO-XHYiFCRCRwkVWtZzqVYLA7AGRoFtpeMtefx2_DfRRcAPsWhHHonB2ow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdefgeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpefhtedvgfdtueekvdekieetieetjeeihedvteeh
    uddujedvkedtkeefgedvvdehtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdo
    mhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejke
    ehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgr
    mhgvpdhnsggprhgtphhtthhopeduledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    eprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehfuhhjihht
    rgdrthhomhhonhhorhhisehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghlvgigrdhgrg
    ihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtph
    htthhopegrnhhnrgdqmhgrrhhirgeslhhinhhuthhrohhnihigrdguvgdprhgtphhtthho
    pegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhopegurg
    hkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfhhrvgguvghrihgtsehkvghrnhgv
    lhdrohhrgh
X-ME-Proxy: <xmx:tRNTaOrWUSKiRAXVz_kx0mXEAXOBkBHfkX7Sv1WQFaWVOSUwt8bxng>
    <xmx:tRNTaPqB6msMAX9RjHrYSkZOQ5grT-JqpzUcGm9-Sve81-yOWQ0vLQ>
    <xmx:tRNTaMSP_sJ-t7w0TJsEko4p-P3Ic_XieYlx0Qn0HSrZTaPBklw4pw>
    <xmx:tRNTaPrf2q4lwHwgkKMGcePJvApDB-oNILeA33HeA6DEIHlf0s2D5A>
    <xmx:tRNTaE7GlGdwWha_UkULTirDKEtRgxyV6B_UBgN3GYQQHS2k81hucpon>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Jun 2025 15:29:56 -0400 (EDT)
Date: Wed, 18 Jun 2025 12:29:55 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, alex.gaynor@gmail.com,
	ojeda@kernel.org, aliceryhl@google.com, anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com, dakr@kernel.org, frederic@kernel.org,
	gary@garyguo.net, jstultz@google.com, linux-kernel@vger.kernel.org,
	lossin@kernel.org, lyude@redhat.com, rust-for-linux@vger.kernel.org,
	sboyd@kernel.org, tglx@linutronix.de, tmgross@umich.edu
Subject: Re: [PATCH] rust: time: Seal the ClockSource trait
Message-ID: <aFMTsz63qOo5LQOE@tardis.local>
References: <20250617232053.3927525-1-fujita.tomonori@gmail.com>
 <aFIEAiDKnxsZQ8s4@tardis.local>
 <aFENRtYZixePYn0XFOGCbNOkSV9338iV4jWk8XJYKI0crpf4QniT_GyZCmFuqmsKs5Cl64z8qlIK6aVfdTBjbA==@protonmail.internalid>
 <aFJINI8ImfxMnvrx@Mac.home>
 <87tt4c983g.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tt4c983g.fsf@kernel.org>

On Wed, Jun 18, 2025 at 09:13:07PM +0200, Andreas Hindborg wrote:
> "Boqun Feng" <boqun.feng@gmail.com> writes:
> 
> > On Tue, Jun 17, 2025 at 05:10:42PM -0700, Boqun Feng wrote:
> >> On Wed, Jun 18, 2025 at 08:20:53AM +0900, FUJITA Tomonori wrote:
> >> > Prevent downstream crates or drivers from implementing `ClockSource`
> >> > for arbitrary types, which could otherwise leads to unsupported
> >> > behavior.
> >> >
> >>
> >> Hmm.. I don't think other impl of `ClockSource` is a problem, IIUC, as
> >> long as the ktime_get() can return a value in [0, i64::MAX). Also this
> >> means ClockSource should be an `unsafe` trait, because the correct
> >> implementaion relies on ktime_get() returns the correct value. This is
> >> needed even if you sealed ClockSource trait.
> >>
> >> Could you drop this and fix that the ClockSource trait instead? Thanks!
> >>
> >
> > For example:
> >
> >     /// Trait for clock sources.
> >     ///
> >     /// ...
> >     /// # Safety
> >     ///
> >     /// Implementers must ensure `ktime_get()` return a value in [0,
> >     //  KTIME_MAX (i.e. i64::MAX)).
> >     pub unsafe trait ClockSource {
> >         ...
> >     }
> 
> Nice catch, it definitely needs to be unsafe. We should also require
> correlation between ID and the value fetched by `ktime_get`.
> 
> But I still think it is fine to seal the trait, why not?
> 

There could be potential users of a customized clock source, for
example, a device which also has a timestamp register itself:

	https://lore.kernel.org/rust-for-linux/Z9xb1r1x5tOzAIZT@boqun-archlinux/

So I think with ClockSource being unsafe and well documented, making it
not sealed wouldn't be a problem. IMO, sealing is for the cases where we
must not have downstream impls, ClockSource is not such a case.

Regards,
Boqun

> 
> Best regards,
> Andreas Hindborg
> 
> 
