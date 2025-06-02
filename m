Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846BB22A4F6;
	Mon,  2 Jun 2025 15:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748876802; cv=none; b=SOeGdG1Y3hejKEP3GKzaVJq8jxUwtjeEdEGwNLQB/+Bmiw+WQJTDTu2u+xP1+rPVHva/GwLJddPw/40F1SU2UeYIOGoD9LL3hP+1eWreuTxZ0Tpb0iNKpixQsg7zyMcuSFmhoLpA24ySVCxK2WzG3ZQuc622YlPRCMbXb8/3uB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748876802; c=relaxed/simple;
	bh=WREH288by42fntfZNOyvljZvH6LrThAC2JpHsElT6OM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oJpQCsyxtc5OQ3D3ZH+614HVyZwI3aOr8TTygGTsNIJf6jH02huTkrwWNE/w0reVmvgQiF7Tgguqx425sxHWgTQ23Vb6PG03k6SNGea2+6bsa9vUUsBeFcAeZS+yZCq+TphH7/MkkCegS1cAxkR+EWHvfs2hVewg2dsS1z63uv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UgFik8T2; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UgFik8T2"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6fabb948e5aso48903836d6.1;
        Mon, 02 Jun 2025 08:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748876799; x=1749481599; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XVefjSAXWWzcvPrC3apQTPaGnK+2wyIAwOCbqvveL8E=;
        b=UgFik8T2Yhj96FGHdy4Q/OfGFexTFLY3fhnjV0JeI5gs3hUNyKuc/VUu24xC6/QIMx
         4qjgTDXld4GU0Mszm0lLkEsNU8bfK9PtmFUtcIJO+h4SNpl0yRIKYCvKbZ/LrEIePfz7
         hO4f01FVgtyaE3AaOARyX6cPRn3E7iQPNqCTdeWJUU5D+lpqc0xEmNb0k2S/WsUNg5QF
         ignfIrca6TxwFUUHeU8gXB1Y0R6s2P3b5AAXB67gtJ9Q7HlcJaUsYLceTml3jQ+jD5/r
         yGpkZOrBczc/pG5qjQm0EEnyOqKsXS4LYC/xYoHiPB8BEiX1G5kA/vrOmHVb5T9VNrx0
         7Biw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748876799; x=1749481599;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XVefjSAXWWzcvPrC3apQTPaGnK+2wyIAwOCbqvveL8E=;
        b=btHid7yftSkTCf0PpCKzbyaQQ0jM51K2U+ZPqQN3h4DW56wfJ2hnAJSdf+/VDj+3Hv
         Q4Yt3vY9dgVmKLCHg7hD9nqTVgvPr0hxditukP4PmtrF1BisbVh203j7LoEi30SNxTCD
         53ab8QV6j7btcgGe93VHPbsifa9iiwcam7qV2wzTQ0G/DKcfkC7+kanrWViiytMmJr+4
         mdIWnKYdW6KpKD5iF1QIZE2d87W5AYuCw/Ntlo3joyQKu8ZdWIL2vvVMevvObMVt/QSw
         ETlJwP4fLXdIGXI76DhX7utOXk+3BAxA+HCqYqeW4ZreO2/Tfr1O9YMolVAx6/mYNW4B
         jBtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQoKtfKcQlkYnWCOQecCQKQ6PhH/vOKS+rxvtAJrOaz6sN/S9qSzeftui65gRRMoESAJOIBEZ4iTnVXaU=@vger.kernel.org, AJvYcCUnnlBYnpc105AkY2SnRhqzBJ7h3x5RBgztQXefQCsh6B3/Z7ydjUrQZk1WoYt0Wc+VM7ABmTdMDKAe1mcaDEk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjFx0bsIUOPITpazpx6k0M9V5zdEgnyB4+O1qRVbxATDMTmc0W
	voKAQK6TxUelMvvGjaGndWNqsJiA7y3kpYkMvkt+67MHn2t6aXNetk2Y
X-Gm-Gg: ASbGnctRkojBvlRUG9ESjvH+PMuz3MD0TVxiHGejNUxM1SaHNjN71OHl2DORZ9Qvtn4
	Bm9eyxjim1vGDpHdbLRYTxj/ab261dsp57nNsAvoOzswgyIEui4OrQ/anPTsPH9wTT7uOPXZrdv
	QgLMkZ/YWO4e0b88UifPW9bl/deUrEG5DiQcVGJFumxOgnatxhPp9R/wcTlLGLjMl+TrR+F+cF9
	ydIlLtGEDisSZJjID/Rn5750vuG3Ktc7KRkQFqwc95HPO6Wuvv+DysGuv22vvRB3Y3cMEQYy7QS
	lPj0yQ5LMTA9a7xFFnxJ9rlqbprJyFnqsbLn3VOhd+pRRFhY4po4dJfviIDF55bEjdVua23vdfH
	NOvZCGhC77Wy8pP0T4ZAwsVLM90s/ehlAj+UrhKAtdT1TRnzR8bie
X-Google-Smtp-Source: AGHT+IEaoleIGduB98ZHMbQsSiMSdeVv1JbuOBtKz/UgK2XHzzFObKzgA16rxspYoGkHfdWnMfI+Hg==
X-Received: by 2002:ad4:5ba5:0:b0:6e8:9e9c:d20f with SMTP id 6a1803df08f44-6fad913b474mr136386906d6.21.1748876799104;
        Mon, 02 Jun 2025 08:06:39 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6d34931sm61807986d6.6.2025.06.02.08.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 08:06:38 -0700 (PDT)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id ED4B41200069;
	Mon,  2 Jun 2025 11:06:37 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 02 Jun 2025 11:06:37 -0400
X-ME-Sender: <xms:_b09aBXl199WSelYfafL-SZQSn36SvLclbH617Msiq62_k1peZk5xA>
    <xme:_b09aBmED_SawMT6cTa3Q_0GzD-dEmHTb3E9KOEqfpOt830K0uvI9xQgm-oiuBzm0
    viMKx9PtUDNq0SLtw>
X-ME-Received: <xmr:_b09aNYMtkcNp9ZY5ZM2tkNSJDYq5o0HeQJbxo0y4jSj2oWXoCIHsTptaw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefjeelleculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhf
    gggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquh
    hnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvghrnhephedugfduffff
    teeutddvheeuveelvdfhleelieevtdeguefhgeeuveeiudffiedvnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhp
    rghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsg
    hoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggp
    rhgtphhtthhopedufedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprggtohhurh
    gsohhtsehnvhhiughirgdrtghomhdprhgtphhtthhopehlohhsshhinheskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhr
    sehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpd
    hrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghp
    thhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlh
    hitggvrhihhhhlsehgohhoghhlvgdrtghomh
X-ME-Proxy: <xmx:_b09aEUnN8YSLv4wnd-mtg1FPYB-HsfMi9pKxM_sfLQyKD_8jwdpkQ>
    <xmx:_b09aLl6ozhcoM9MTqcfuKS3WmKNg4AKHYpXjKrNjILkqkOnJ9eXZg>
    <xmx:_b09aBcTUA_z4RE2Hv3e3YQ5BamecbkkQg0JQVZLtSJbX_XLrMlQBA>
    <xmx:_b09aFFcEHSUEXtJrS2l1mhG5V_zQBjuK63qyjC_keWbrIC_6MFxAA>
    <xmx:_b09aFnhRH9xsswMulJwCDmtUQq5W2e5yZiz_AhwdhBPQr-AFR-F_mXp>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Jun 2025 11:06:37 -0400 (EDT)
Date: Mon, 2 Jun 2025 08:06:36 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Benno Lossin <lossin@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] rust: alloc: implement `Borrow` and `BorrowMut` for
 `Vec`
Message-ID: <aD29_GfdV02X4q5N@Mac.home>
References: <20250601-borrow_impls-v1-0-e1caeb428db4@nvidia.com>
 <20250601-borrow_impls-v1-1-e1caeb428db4@nvidia.com>
 <DABBUFXP4O5X.1JG9O6Z2BRAQX@kernel.org>
 <DABND24P80ZZ.NLCKU3AYPN4X@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DABND24P80ZZ.NLCKU3AYPN4X@nvidia.com>

On Mon, Jun 02, 2025 at 10:13:22AM +0900, Alexandre Courbot wrote:
> Hi Benno,
> 
> On Mon Jun 2, 2025 at 1:11 AM JST, Benno Lossin wrote:
> > On Sun Jun 1, 2025 at 5:00 AM CEST, Alexandre Courbot wrote:
> >> Implement these two common traits, which allow generic types to store
> >> either an owned value or a reference to it.
> >
> > I don't understand the second part of the sentence.
> 
> I want to say that Borrow allows you to do something like:
> 
>     struct Foo<B: Borrow<u32>>(B);
> 
>     // `foo1` owns its value...
>     let foo1 = Foo(0x12);
> 
>     let i = 0x24;
>     // ... but `foo2` just borrows it, subject to the lifetime of `i`.
>     let foo2 = Foo(&i);
> 
> And the implementations in this series also let you do:
> 
>     // `foo3`'s value is owned, but heap-allocated
>     let foo3 = Arc::new(KBox::new(0x56, GFP_KERNEL)?);
> 
>     let j = Arc::new(0x78, GFP_KERNEL)?;
>     // `foo4`'s value is shared and its lifetime runtime-managed.
>     let foo4 = Foo(j.clone());

Maybe you could put these in the "# Examples" section before impl
blocks. E.g

	/// # Examples
	/// ```
	/// <you case above>
	/// ```
	impl<T, A> Borrow<[T]> for Vec<T, A> ...

Regards,
Boqun
