Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1893298CA4;
	Thu, 12 Jun 2025 15:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749743328; cv=none; b=lWzLSoKiL9pLuiJEVug6QI+1BkbCZ1WpvmyFayoDLb3HpaTBrO9pqkIMs+9l/S5hqNSq/dlpLba0yz9bmAz0QcvAfBZLfyi2gir2Z0zGUj0RWysMHRtyF3cjlcVdzGiBjQWskIUVut+5dZxLDfnZFoqT0aBcx45RG8P8gjssma8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749743328; c=relaxed/simple;
	bh=8HADoriTzSv3LLylQjU5OFZpVtub8FPBcT6Xb5M2ro8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l/hHAPsCGNRPRSrnewI7IHC6GN29D+hLEmeSZhPq5bEMPyiI31aMDCerxM4tdwmnM5lLZNXcKMd+ad+C03Ranp1SEvtqD0PGHI6RMnK7sSnNzN7Rzhsd4p7lvDb6sI+LgnV2sYj4mkiPqOZpbr/ftPi30lpijyX0C7B/4VAo5Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LZUemjm+; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LZUemjm+"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4a585dc5f4aso15166461cf.2;
        Thu, 12 Jun 2025 08:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749743326; x=1750348126; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zsySlexy+K3bTyJCdtJD4e5BpSRlU9lctN+3OaWRO3s=;
        b=LZUemjm+G/CEm6YUb8ZhysNEmMT4WZUXwc5I+EXV1H4//MddMNp+i8mJIT94yhsp/D
         vSoMDVPOK9Z4FxTi1bkdzeT/DqZ6gdsvS638688bT7bNimQhDXSsD4ApCmFdljQV0ayf
         9j99nWkvc9kNImnUsHJoku/HiBBTjn5ASjxIh26VCO3OQp/jSuEfBHNhBzRPvon88krO
         JKyefwtRLBYuik59lyKLl1tjfk9fMLVAKfZS82Y8fVKOmTlFqByQBfljGGsqWMpujdLV
         gTE00vlL1EB3oiWYRKhsXja51Ouron2G40zgkO902Rlys/F+CplF2Ywet6uB8wOirUjF
         Bcuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749743326; x=1750348126;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zsySlexy+K3bTyJCdtJD4e5BpSRlU9lctN+3OaWRO3s=;
        b=GCQKTEWW0kvRsXNe2TjQzkJVZQLY+xeL9rQL6HwFLRuh3WEXWO2ScjrWJWl3FjyqM3
         yz7rsv/aRhEyJSigdLYCLCHLLnDaBHnFN2FIxWfVEj3qRTvfNDkT77Sp0z+Qory5WGBY
         5IsvBN8gLz0TDaJgytg8UaSvlNgF3H/y+UceJmNitzvPmCVPhEjqWibFFNBoHXqYx/88
         1moTXIWombPD/KBaIwygJ+brUeEOtD8Lq0Kg+108hKalRXqhQ8RZFrUdpIUufolPxRL/
         kpWrcftum2s/H//WLrin7+DiUl73iXOMyQIS8FbJAxbNotuErL44yiKBto9b2TR2dFBY
         ZcHg==
X-Forwarded-Encrypted: i=1; AJvYcCW9CJ6P2XIDr7TigFyfKxnVm+yyC8D64XTCCIgFwpxTSnwLqtzFUyWWadimO9MXXT9jDZ4sKD6iloWKe4c=@vger.kernel.org, AJvYcCWeUcVP6AC1i62KN7XjlmfNFz1Q+mki4f0OEfoTHICHLD+4I9Or9FYmVZtEhRxHSCVv74grkEWza493LZErkg4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeTO11JitptnfobJ/lJM1gXPcmQrGJZltzTgXu7gBGbiS1sHHL
	Yu9HNXXm4TQZqQsIzJqWb4/dXOJueRaeZ4G/1zVhPsUBAitj92/buXFTh3VbPA==
X-Gm-Gg: ASbGnctxhcYgsRrAfSWhv52NuxDg1xPYLlsix7vWht42x6kJXbWk11rUDECSYyrhYuy
	eklehqBknenqqsazpmXqWLKIwjL1sgy4rrDMt1BOWSTn4/5ZBc5gQfTA+rl1feZNhY5Mo+0j5wy
	yU1D6tqIoKpjx4USE2sBdPcJZaCASQRJYsMjHrhJNo2dCrp/lnSwlIlrDK+5cgfBLU1rikQSMsO
	NMFLWTav28jtEMgCaiJJvDZo17ONu5lkGQCk++gmTjrbhGI7yERKR1Pk5GVqWyGPbRXueo3xrxe
	u5b//xmAQoUy9IZWpdZzxOlkWWfsQ48xh83T3IaqpyRW6l5/BF3/L2kngbkxtBiIBQmXGTPOgeR
	8C1DFGbmet5O7UxGsi5bhZ418pP6DBvT8GjmQht3aSddzFMhaApc6
X-Google-Smtp-Source: AGHT+IG6pC9iDq1hBXXy2ISGnZVF/wjbi/lAfGnQl+QyKt/sAFJKy2rQ+tdtX3IKXdm3j/eMV4jCYw==
X-Received: by 2002:a05:622a:1dce:b0:4a3:530b:2880 with SMTP id d75a77b69052e-4a713b9fc88mr140141911cf.14.1749743314635;
        Thu, 12 Jun 2025 08:48:34 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a72a4e144bsm5364581cf.62.2025.06.12.08.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 08:48:34 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id C06AB1200068;
	Thu, 12 Jun 2025 11:48:33 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 12 Jun 2025 11:48:33 -0400
X-ME-Sender: <xms:0fZKaEJ_pLq7qG1pNUvRWHQWkFQ9v4nPMzNF7bs4pMlOgPwjRYCS7Q>
    <xme:0fZKaEKXLRcFXgkXeXUPYrFV8BsLLRUzP5pUCpKstWinDvQ_ShPpOzDTZXemWoSt0
    GDecQuD7uyJgTvRgQ>
X-ME-Received: <xmr:0fZKaEsLh3jpzQWKYpwgVbG2T4_NxaGO1tv8BymheqDCjrlKzJxMryXgO8Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduheegjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleel
    ieevtdeguefhgeeuveeiudffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
    ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
    hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopeduhedpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgt
    phhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurg
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghi
    lhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtth
    hopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhopegs
    vghnnhhordhlohhsshhinhesphhrohhtohhnrdhmvgdprhgtphhtthhopegrrdhhihhnug
    gsohhrgheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:0fZKaBadrF2ZNk25pSIj88qdzLM8Q-_xbbjBqUjJHxklW_GYQsdGng>
    <xmx:0fZKaLZqLBiqOchJ5qUb3K4g9_LhYND-LDBm-GPByh1zmgh9uHumGg>
    <xmx:0fZKaNCPd-drxXTcQQ5ogQy4-WzY9RyPek3mlKEftFp9Fbgf1jghfA>
    <xmx:0fZKaBatel_ogf4C2zMMbGhc2KtUs9eILrmgcxWCfT8vq4Sb9-g0DQ>
    <xmx:0fZKaDpDtou5SXuvC1LNV92_L_KwxOLJ_EVuxj51L-QM908sO9h1TJn0>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Jun 2025 11:48:33 -0400 (EDT)
Date: Thu, 12 Jun 2025 08:48:32 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu, chrisi.schrefl@gmail.com,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] rust: devres: fix race in Devres::drop()
Message-ID: <aEr20HfFfOz8Y7pA@tardis.local>
References: <20250603205416.49281-1-dakr@kernel.org>
 <20250603205416.49281-4-dakr@kernel.org>
 <aD-EiRChuScS5TK-@tardis.local>
 <aEAWwnyP4zwwrccX@pollux>
 <aErxSYp0AsHGWt0E@tardis.local>
 <aEr120wdhFVjFXWg@cassiopeiae>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEr120wdhFVjFXWg@cassiopeiae>

On Thu, Jun 12, 2025 at 05:44:27PM +0200, Danilo Krummrich wrote:
> On Thu, Jun 12, 2025 at 08:24:57AM -0700, Boqun Feng wrote:
> > Thanks for the explanation, and sorry I'm a bit late for the response. I
> > was trying to find a place that we should document this, how about the
> > diff below:
> > 
> > ------------
> > diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
> > index 0f79a2ec9474..c8b9754e411b 100644
> > --- a/rust/kernel/devres.rs
> > +++ b/rust/kernel/devres.rs
> > @@ -31,7 +31,8 @@ struct DevresInner<T> {
> >  /// manage their lifetime.
> >  ///
> >  /// [`Device`] bound resources should be freed when either the resource goes out of scope or the
> > -/// [`Device`] is unbound respectively, depending on what happens first.
> > +/// [`Device`] is unbound respectively, depending on what happens first. And if the resource goes
> > +/// out of scope first, [`Device`] unbinding will wait until the resource being freed.
> 
> I will add
> 
> 	In any case, it is always guaranteed that revoking the device resource
> 	is completed before the corresponding [`Device`] is unbound.
> 
> when applying the patch, if that's fine with you.

Looks good to me, thanks!

Regards,
Boqun
