Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B1886344;
	Mon,  2 Jun 2025 20:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748897121; cv=none; b=D7Uz0BnlVdXbHP/WwvBNkAyaOE5We335gtaWc91w3HPMUX4ZH+r7NXjMbe4ONn9CFi7WHeFWCvYKkyYv0s8IbRfbCOfsMnu4dyyzzMWsxILEuSIBJ9aPOedaZ3UTdp+38PrKoQutdqxgGwxLAgHibP4TPrC6q0kyrO1ymEIrM9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748897121; c=relaxed/simple;
	bh=zGqRfRjrSvhTKwQaC3bGi7daTwSCctRXFDrrTFKNp9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oADnAOfT7joup+YtBQ/jDqQ+InfJJwtgMsZlEWVB2BGgxQbb7o79NNVTemJ+LzHpRx49oO+t1bBtYnOFNkDEnB9xKzx4NwJM58UwzstlDtgNIG8UgMGdigi3fTjdXmXaPwod6YmHjUzk+KEVO/GEQaMkgjJmMwDdy3jyja+ELg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=blE2Bg0R; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="blE2Bg0R"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6fad4e6d949so19351326d6.0;
        Mon, 02 Jun 2025 13:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748897118; x=1749501918; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OjK/rO05j30ZVJYV5JvSHI3Jgudt3ddY5j3wq1XmI+4=;
        b=blE2Bg0RBdCFtN66AoB6k7RzqpLar30JrjY81ljiu3TV3tnxneM7AP0yKB4qWjzLWz
         R70bBWEOuPrYH1d394b2CVoqTSYaGKnfiOaXiL9VyfEGsT6EIJ6InwFYultfwv/8L7B2
         EXC71SmxvY8ZsEeUajm8sc1FOdCs6L13ZHL9TjD3APzjHSQK2XBvvDbHbT+irxY9cpMQ
         GI1TH73oPpMO7jkPpNu/P5Xm+SqtANIIMwjD6aIqyjoe5OB8lJs+THY/hyCHG6XgIxHx
         oUo1Mzz7yHTAIUrfbt9+6VxlDn3DPiN5UvNKn12nQUvMPxyR5Co2hEst1QIFlglJ6K7c
         97/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748897118; x=1749501918;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OjK/rO05j30ZVJYV5JvSHI3Jgudt3ddY5j3wq1XmI+4=;
        b=NRcWZ1FEIJpkfVu9KIlGDp0Hg6m8Y+UJt/95TAIIcsVvHldhHJ0zUeEMmyhryjIiFF
         X0RNKgRbmPov4eHEUlaUODN5GksNCDiaO7NrvQmnANyl9g6j5IaO5d2bRpI2R1xHy1Ll
         1zKsCZsB4pDG08R1fzzc5q/lkoSHb1AIcaeD2ZnOYbtKknuF+Pk5Ck2ChnDWWdMIsgeo
         jD335Wb36zzusOxksXGtB3H1QxIb/lDbVWvcOYbRzHIifF9NFea3vhdGOC5Fe6z4c4sG
         FldGKUu8rDQWxhQx0o+O4HIvO5eogeZW0VF/Ji6CkSQsp2XhFgyjTjzAB8VQsHkqllB4
         d1cQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVaPFxj/nDhoUipngO1xlBvjAUiiDNOX3dOA6QWp4VXsUi3QVDqrC04Z7cUNh3i3sXyrGm/j0JtjbDlKc=@vger.kernel.org, AJvYcCWzv5kMJlt3dl15Kox9yO9CIdV2lXoSgB3I743EVZGG1i7npM8nvNexAZNQN01FH45nq/G6Nla568osbnXm4bA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2KpiUbZ2ypr4jyThBG++ASmvOpn/cidcANMTp2l4sr8iye8IQ
	tqi6FddBRA2r/Nmz3mtoX/kWRcj/LyqoRSHTSGxgwJRZyIfSEH2pOM3H
X-Gm-Gg: ASbGnctDG+WLr42cFS+zXs0O8F7Sm1rt5xdcPqvL7cKqNooLrYGUuGqWJhNZn4P5lFR
	rV3YVYg4nM39JISrLdNqXXeGY6xMpBTSHsDUqJyw4JkceQN+MCu4CPZ8HNU+W2Vksk8RVh/RJ9p
	giSlEnX9PpU/zb2vTkzpXDgkDWD9uwtAWWD/Dlj6IWehFRGbiVnIv16Xhnl60EYBz3B7hy0GmhE
	2PveuvsoTwpkrWoOSeiAQA4GxRG773SyoANYO61cEMA+K5gTM69xe9niya4JcP3fy5v1cZxgeRu
	j+GD6WCIBzdkNOR/SVACdziT/LFoe32Aj+ZsX/b9/zrz22j5jC0Et7Lvv+bC9z9EcFulvoDAHbd
	2UWjYIpYqxvKydDxKX4AZqp5fKvfHUSHQs57N61LWTw==
X-Google-Smtp-Source: AGHT+IHI6r9iiNAQHIpedBBy0YLuWybDO2Js4HQWfVC+CGEo6MGrxJEZSakupIUANxeaGKbjBbV9jA==
X-Received: by 2002:a05:6214:2461:b0:6fa:ce87:230c with SMTP id 6a1803df08f44-6fad913ac01mr188525926d6.25.1748897117531;
        Mon, 02 Jun 2025 13:45:17 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6d5b144sm67043746d6.55.2025.06.02.13.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 13:45:17 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 856C81200043;
	Mon,  2 Jun 2025 16:45:16 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 02 Jun 2025 16:45:16 -0400
X-ME-Sender: <xms:XA0-aOYiUDYgB3kCoD8eAJs1fcKhSFS9jaD74kbykNyg0rX2m_muTA>
    <xme:XA0-aBacdwenpvwcpBA77HxnzFTLMd666eHWIK26_H_Kt4sPr3yTNzIx7AZtoV3Fa
    SIXv12THB-9kHZ8cg>
X-ME-Received: <xmr:XA0-aI-R0ZPwqukS6CJibIFz7b7Meg4pjgwWev0h9FhZarFbOfOMBJcv6A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefkeeiieculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhf
    gggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquh
    hnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvghrnhephedugfduffff
    teeutddvheeuveelvdfhleelieevtdeguefhgeeuveeiudffiedvnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhp
    rghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsg
    hoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggp
    rhgtphhtthhopedufedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhoshhsih
    hnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrtghouhhrsghothesnhhvihguihgr
    rdgtohhmpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhr
    sehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpd
    hrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghp
    thhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlh
    hitggvrhihhhhlsehgohhoghhlvgdrtghomh
X-ME-Proxy: <xmx:XA0-aArguK_k-W4Vf04DhSiWF_dhM3xphmtZ4QRlUhsGEl877_2TkQ>
    <xmx:XA0-aJokfFwe00rrTh82NmQeHamMXF_CwSLoOzsWvQVLQPpq2EobeA>
    <xmx:XA0-aOSNnLRnf8RJXZv9HV5hv6wOxFhADOF5I1gWS7CKzhY0FgUIfw>
    <xmx:XA0-aJrT8IZV7Yw7UodKLTy3mRjiLGXDlgDofvu6lUzrqddL6zyREA>
    <xmx:XA0-aG5BT3lkDRdHRDF6CkryLXvgZGyg0XpsCJNa06eT-O_0MfALGJE3>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Jun 2025 16:45:15 -0400 (EDT)
Date: Mon, 2 Jun 2025 13:45:15 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Benno Lossin <lossin@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] rust: alloc: implement `Borrow` and `BorrowMut` for
 `Vec`
Message-ID: <aD4NW2vDc9rKBDPy@tardis.local>
References: <20250601-borrow_impls-v1-0-e1caeb428db4@nvidia.com>
 <20250601-borrow_impls-v1-1-e1caeb428db4@nvidia.com>
 <DABBUFXP4O5X.1JG9O6Z2BRAQX@kernel.org>
 <DABND24P80ZZ.NLCKU3AYPN4X@nvidia.com>
 <aD29_GfdV02X4q5N@Mac.home>
 <DACBRWLT0TOK.3BLVIST5ICH36@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DACBRWLT0TOK.3BLVIST5ICH36@kernel.org>

On Mon, Jun 02, 2025 at 10:21:12PM +0200, Benno Lossin wrote:
> On Mon Jun 2, 2025 at 5:06 PM CEST, Boqun Feng wrote:
> > On Mon, Jun 02, 2025 at 10:13:22AM +0900, Alexandre Courbot wrote:
> >> On Mon Jun 2, 2025 at 1:11 AM JST, Benno Lossin wrote:
> >> > On Sun Jun 1, 2025 at 5:00 AM CEST, Alexandre Courbot wrote:
> >> >> Implement these two common traits, which allow generic types to store
> >> >> either an owned value or a reference to it.
> >> >
> >> > I don't understand the second part of the sentence.
> >> 
> >> I want to say that Borrow allows you to do something like:
> >> 
> >>     struct Foo<B: Borrow<u32>>(B);
> >> 
> >>     // `foo1` owns its value...
> >>     let foo1 = Foo(0x12);
> >> 
> >>     let i = 0x24;
> >>     // ... but `foo2` just borrows it, subject to the lifetime of `i`.
> >>     let foo2 = Foo(&i);
> >> 
> >> And the implementations in this series also let you do:
> >> 
> >>     // `foo3`'s value is owned, but heap-allocated
> >>     let foo3 = Arc::new(KBox::new(0x56, GFP_KERNEL)?);
> >> 
> >>     let j = Arc::new(0x78, GFP_KERNEL)?;
> >>     // `foo4`'s value is shared and its lifetime runtime-managed.
> >>     let foo4 = Foo(j.clone());
> >
> > Maybe you could put these in the "# Examples" section before impl
> > blocks. E.g
> >
> > 	/// # Examples
> > 	/// ```
> > 	/// <you case above>
> > 	/// ```
> > 	impl<T, A> Borrow<[T]> for Vec<T, A> ...
> 
> Does that get rendered in the docs? If not, I don't think we should do
> it.

It does. I just tried myself, in the "Trait Implementations" section,
if you provide a doc comment for an impl block, it will show under the
"impl line" of corresponding to that impl block, including ```code```.

Regards,
Boqun

> 
> ---
> Cheers,
> Benno
