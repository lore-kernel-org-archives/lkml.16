Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626F42798FA;
	Fri, 30 May 2025 19:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748633726; cv=none; b=A73d50sAlyXdL+63ASfeUOtrCLX7lVkaWxqzW6ZvAT/WawxCmeoGQh/fRPqtGL9Nn9272xUdXlHYDumaRrwfAGeJT3vTIW8RhnFFHrbhA3/+DlnHSKfrRFyb98sGFTzeordj9XfwMgKveb7zSRpRf/8f631UQ7NaRnifipFuOG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748633726; c=relaxed/simple;
	bh=crsWdlr8Tu80QVWjnPvfSNTuhCP4tul7TADU6OtABbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s24ArD/zJBoJCz9J+hOwP/HaYimE2eGYoB9EvYGcgy9+PjGUCLKYooyzM7L8vV11B23dTyuAA8h5iTAb0ep8bHgxkY57u4cKp1VXTweidUI2eHgeQlBCkV1+nFMzCGPBgrPuUMogMtDTdReMUXQPFCbzZ3hiaSPxcBL6VVo4miU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EkSnpofa; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EkSnpofa"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6f5373067b3so29610076d6.2;
        Fri, 30 May 2025 12:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748633724; x=1749238524; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJ0bLtfmk1vmKz5VO+u7xPHRO1f2Qu56Ue0NRvjpF5w=;
        b=EkSnpofas3U5RTolb17oRdVLT5dg7MfTwQYgjXbbzxcYgSxBQqxmf/mRIIJLORdy4r
         u1dbJhrZKoNOo65ZapjCpSJ+gk5jbcUaNWAuGMg0L0Hwtd+vmCLcbPs7d8nyZEb/qvc7
         QKrr/jNYBPQw5JT0FaOwdhcmnFzIz1LeHUkWCWGnNGRQ1DKTuKuqdkqv/M4kF1x90o80
         Odq5vwuPI82zQi3TYwuJwJxP/GOMmstdO0b0tNUHjGNHQ7dEW5edlL013+inkyg3pJjC
         5Q/58PkFR/wrvfbfw0NkIVQ0QweXu2NShnx6Weh9XpNNdBwZp0pwy7T5IcF6/Jf/Br2v
         Ncrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748633724; x=1749238524;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vJ0bLtfmk1vmKz5VO+u7xPHRO1f2Qu56Ue0NRvjpF5w=;
        b=lfR/fkSZzFCTSi6H/CzRW/mnU7v+hRHklckSjt4b0ev5d7KprbNSr+qP7ORq4kpljP
         SQSx16dcNWmsIaYivWWRerQP2VK1NomGiT1RsDYAHxOfWOsOd/x/PpTRC9oK0adqPwOq
         SvqhgFSjMWyQTm8OpDL0ZPywKlo6llq9+ga3YmQaFYHGGYxWGb8lyS8HmKarMZF4LMCe
         z35rtuX79GvYdFlNLe3Gk3FGyOhEyW9eNqaoixPal5Sp/exnEsWBFDqZjnYuowilhqBr
         BXWOLiEMdR0TGBLcr7Uavye3ODgX/VBqwYInzXwC9hs0O9u3GipxEUOEKBZjtkdYVquA
         uoVg==
X-Forwarded-Encrypted: i=1; AJvYcCXtdVzr7FYWiTWOUPY6JEBvI9NJFY9KPlhYo5TVWrYj7krZ1pogru1rq93rvqc9/nb59jRM9g2sPtjeyYI=@vger.kernel.org, AJvYcCXzw3VeM8R+emYps1pUORrSh/cmym1MFUbzcACMWwIZlPO1qmDVxgH4LuxdK3yXjwN2iF+QIRPg5SV7EEZtkFo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCqxSO4rCtA+vKzbGXooiga7HrfP/AM44VGrO90XqTMENUpKWd
	6nJXyxT4358kE6nr2Yego70ADbVgX95tVI6wfrC+vOVkSV5eLa/tG+Oo
X-Gm-Gg: ASbGncuIa810WDEujIgG2q+zUgg2hvnaamI2zOjyqdfo/QKHrh/rrofpdKPS3/B6d2S
	z/jSASiDrObZfaXQyD748nQi8ttqdWekxVHby/JRP6LBbTuwyDAydQbwqxmRsNux/0zlwrV3mVj
	SOq3uZUt2Bw2iDXXvSbSVi+6f67vvHcwXLXXmTLR562OrLC2kVgsP8zf5284quPmmOUXyKf81Oz
	XK2orGvEEykM7uYGHTQA+9reTd9HoXr7TCceEK/uSsH2//8Z+U13UZGraaM8iW5ZyiPWz4YOJV5
	e2tp4oF+/O3gdDTXX9VOG02vsd+NOFks7p2e8JpiemwnKhvS7yP2/smROgWBms8hmU/ZlaSLlFT
	iR4LCj8xDNPbSf/jUKEMqiF7r3cU4jFgICw7zxRLPdw==
X-Google-Smtp-Source: AGHT+IG2viu0pMSjQjDLvR0tZJxFS0dBUIbA5WJsUgRJhBklyOmW+O+i5acgca7h5Ey6wO+97ea48Q==
X-Received: by 2002:a05:6214:27cf:b0:6f4:b876:5fb8 with SMTP id 6a1803df08f44-6fad18f35b4mr39127306d6.1.1748633724091;
        Fri, 30 May 2025 12:35:24 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6e1c68fsm27633526d6.110.2025.05.30.12.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 12:35:23 -0700 (PDT)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfauth.phl.internal (Postfix) with ESMTP id 3689E1200043;
	Fri, 30 May 2025 15:35:23 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Fri, 30 May 2025 15:35:23 -0400
X-ME-Sender: <xms:ewg6aP0SknmNOaytDfPuxMh0BMfbpoCD3eb9VI9SL2IUTt96kL5VGw>
    <xme:ewg6aOF_cy_B3DPKz47n36IGJ7wb_T9u3me71dho_JsljaTy2tZcby19DQzJGThE_
    gSp5miUD2EKOPrX5Q>
X-ME-Received: <xmr:ewg6aP7w3fE7eIwSOXa5OU8nJ7X5in5xMnVz6VvS2O8Emxp981JwR0ibBA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvleekieculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhf
    gggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquh
    hnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvghrnhephedugfduffff
    teeutddvheeuveelvdfhleelieevtdeguefhgeeuveeiudffiedvnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhp
    rghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsg
    hoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggp
    rhgtphhtthhopeduiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhoshhsih
    hnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegthhhrihhsihdrshgthhhrvghflhes
    ghhmrghilhdrtghomhdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghp
    thhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgvuggrse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgrihhl
    rdgtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtoh
    epsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:ewg6aE08DxVtS5Ne-z_Y3tb866Nwk1JnyEa3OQV2WUPMr6vqNSqUIw>
    <xmx:ewg6aCGf6UCmh8ayf6MUSmS29uH81nRGKtc0JjtfdN8Fh5F_Nc_csA>
    <xmx:ewg6aF8Dw1lHozAZG98YqUBpcY_-cqOQd6GRTE4Fxg0-x52Eklx0uw>
    <xmx:ewg6aPlaQV1hrVpHSFXdcFjrMwkzwFXPh0813zchxP-g9KqRR5PGbg>
    <xmx:ewg6aOE-zECG3ceJyL_VfbvtMEPdSwKLytwGslk1Wd3yaNYYPYwq4xCp>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 May 2025 15:35:22 -0400 (EDT)
Date: Fri, 30 May 2025 12:35:21 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Benno Lossin <lossin@kernel.org>
Cc: Christian Schrefl <chrisi.schrefl@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>, gregkh@linuxfoundation.org,
	rafael@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] misc device: support device drivers
Message-ID: <aDoIeYM2b8kXG8-O@Mac.home>
References: <20250530142447.166524-1-dakr@kernel.org>
 <9e0acb35-7d10-4a8e-b5c6-968d1310146b@gmail.com>
 <96891e54-8614-4f98-8a98-ad90f18c8e43@gmail.com>
 <DA9QOTLU4U5M.2X7K7UWJ53QGI@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DA9QOTLU4U5M.2X7K7UWJ53QGI@kernel.org>

On Fri, May 30, 2025 at 09:24:28PM +0200, Benno Lossin wrote:
> On Fri May 30, 2025 at 7:29 PM CEST, Christian Schrefl wrote:
> > On 30.05.25 6:37 PM, Christian Schrefl wrote:
> >> On 30.05.25 4:24 PM, Danilo Krummrich wrote:
> >>> This patch series adds support for device drivers to the misc device
> >>> abstraction.
> >>>
> >>> For design details, please see:
> >>>   * patch 5 "rust: miscdevice: properly support device drivers"
> >>>   * patch 6 "rust: miscdevice: expose the parent device as &Device<Bound>"
> >>>
> >>> This patch series depends on the pin-init series from Benno [1] as well as on
> >>> the misc device series from Christian [2], with UnsafePinned replaced with
> >>> Opaque, as suggested by Alice, since UnsafePinned may still take a while to
> >>> land.

Maybe I'm missing something, but don't we have our own version of
`UnsafePinned` [1] which can be replaced once Rust upstream has the
`UnsafePinned` stabilized. I don't see any discussion about abandoning
that effort.

Regards,
Boqun

> >> 
> >> If you want I can send out a new version using `Opaque`.
> >> 
> >> We could also add a type alias like:
> >> 
> >> type UnsafePinned<T> = Opaque<T>;
> >
> > I forgot that Opaque doesn't drop, this would not be quite as simple,
> > but with a newtype with a `Drop` impl it should be possible.
> 
> That's one issue another is that `Opaque` also allows uninitialized
> memory and (if the upstream one isn't changed) also modifies the
> behavior of shared references. I don't think we should name it
> `UnsafePinned` if it doesn't guarantee the same thing as the upstream
> one.
> 
> ---
> Cheers,
> Benno
