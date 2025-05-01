Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA76818C930;
	Thu,  1 May 2025 13:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746105909; cv=none; b=u6EdWihJQHiOIGe6lTlRjEU3jFiRHDbB72INsQirox3NjZ6LOOj2QilcuLTWB1ha8IUGxd8Nwco9JYXr5mnfFIt6sxvmLZae5E/eCVE1KeHen0JKfzXb0WpYvSFgRmvN1iTCIqZfGwrx/8ZEkhaMAtBosCjNDTALW2ZIsXDHcP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746105909; c=relaxed/simple;
	bh=+uHNcawHpPqA2ZvQUdl2LMp4f1w7AlTqnaj23Ow2WXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NecUC2yxC12oc8LeTXua85qN7X0NyCJl8z0oKGkIoWDZ+n7cY9yxPgv+GlFA9aR+6NqupZMUIWGoXnTulizMlDpyonjLmP86c5059QW2FxfIB0pW7HnLxYeTVZqfopJi50J5IkCF7PtskxUBi0tZoxtZS6DiesHUTQ1OHxVng5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C2v1s19S; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C2v1s19S"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6f0ad74483fso12307726d6.1;
        Thu, 01 May 2025 06:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746105907; x=1746710707; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BZ7hCATxsjxE6xSXXtB/44UVmbg1xX4P6V3ZZAsfqO8=;
        b=C2v1s19SLOsP2IKTHaZJGjm/rv6pOlXq4sl7OrQavE4YmuuYTFZk3Hzf/Dy+AECok0
         eao98JhC4I5V6nllnxd7yivRyy+0orK8WIxwuwxds1lKhLiniB2tZVT3GJzqVsRlwJhg
         0AlQY9RMK0gfteWmVoVCTaO6M6C88vmL5ejqqDqpGkofsEjm2LJxu/slrsknpX/rIzr7
         j6gML49zrlAR0enbOiSgXRYnUYYYYv6keJ87ovglvHaZVkvejWxniUheQmYLQsyEb6Us
         uCEclB85JC306dtTwtNk/2IJK/+AxAuBOx22Y118gbZUx8GiOKBwnAbOZGhnXcr1msmq
         ujTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746105907; x=1746710707;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BZ7hCATxsjxE6xSXXtB/44UVmbg1xX4P6V3ZZAsfqO8=;
        b=k+oYbvPVpm2xgrU82+J5DMEr/AG6bB9IOWb7cBWuHIyGcYmb8YGu1thl4zJHjTDL6P
         wMpoHt8ut6sD/CuHELgqsMUbJYeWnx+yZX4nGkyY08A59hF9gVM/nqX5K72hT2ZHr66d
         DFurOUMfS2FHnJA+2klQUMfmTNjvJxNwoc9cZcowB7yfiMEuMC7bplCqhaRMn1eApyn1
         qniiKd4VfN1UxKNCJ3B5QE+uuajLwlCXXqbAMg8+MXONmHO9tzM5IHNBhMFZQs9SO7gP
         KCYF9gOilnUhA+RMBOKP/4ny/7a7A46+UTTowG68dx1W6RAkTeBuRVYCbOAo15s7TcQ2
         0Kgw==
X-Forwarded-Encrypted: i=1; AJvYcCUIdBFzub07FbY4O1CCjxBPnfFohqtZwO33jOal7iBDX2Klq1MIlAruryRSOsZcriBiZzB4stF2iP/ER14=@vger.kernel.org, AJvYcCW+eoXNZhdH26IbsPo8i3tia1/UJPd02tu1dLEIyyt7B5NwlvUua8ZoUH5JE3luBF8Ik2OgNa3oodkmynhYgUw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRkmFOSeeN3AILSe/bJKPSZpHwh0iLFBecHfXRvkoVN0zdPjGo
	JUn5NyXJez8SmwdxcJij1X45QKEov+K0ixOVPJatjP4r074Qo6mJ
X-Gm-Gg: ASbGncvFV0g3citVTk/oLkYRJmjMPAtFuhiA9uO/EQgTGAvnoKpkRdQMrCq+JawaDHP
	sg4vS4Q37Z2a+GPE5iS+ihYJAn55qg48k9DXvQ6t3LwJLpa7XkqVfikzhBu1ukm9GlSEOZXQcyJ
	7H7JZDTfv5JurEtEakLy9j6fq8dRqKDx73m7zUuFrNjTJYMrEJzkVuIXC40wvAmiXkO/m+2Mo0E
	EuxC26Nd3Od8LJfuv0ojYpAhtEbTGOBm7eC3aLsDjz5M6V+Z4DHedVMtBGSpIKnMp9smZ/LEA9t
	PJmzDqhBo0h+ksbekPJO/iQX4GRqRGTZ9p6Fgw7qnja47J3oSm8f75Px3p1f/ixSjMC4clzcn8r
	+Pd5nbmeSZfI3Q7ZoDDJ5cwGkUL3/oIY=
X-Google-Smtp-Source: AGHT+IEqw0BxiHB4HLZuVjPtniAQy7F83jM0v4mr7MRuTd6CwIbAUhxRvOtJPHCLrhbd/0P0bSHctw==
X-Received: by 2002:ad4:5cca:0:b0:6ed:1545:65c3 with SMTP id 6a1803df08f44-6f5090d408amr48724246d6.2.1746105906523;
        Thu, 01 May 2025 06:25:06 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f50f480e6bsm4225876d6.102.2025.05.01.06.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 06:25:06 -0700 (PDT)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 88BD8120007D;
	Thu,  1 May 2025 09:25:05 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 01 May 2025 09:25:05 -0400
X-ME-Sender: <xms:MXYTaP1rFjDHtuGAzSoI4HPTm97NAxNvmpA6PhqfK0QbK-JK9CoIxg>
    <xme:MXYTaOFkw9l5rUdF3MWyN_vU3k3CiwmspYIP8tZvinvEV78dIFF5VpECEySH5um6K
    OmsqgvfSkVNCtxmqw>
X-ME-Received: <xmr:MXYTaP5xoFkp-N8BJnTkFDF2-F8wowZjj76MoI48nVSDmO3Igbqiq0Vm>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieelieelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddt
    tdejnecuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrg
    hilhdrtghomheqnecuggftrfgrthhtvghrnhepvefghfeuveekudetgfevudeuudejfeel
    tdfhgfehgeekkeeigfdukefhgfegleefnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhn
    rghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpe
    epghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedvvddp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhighhuvghlrdhojhgvuggrrdhsrg
    hnughonhhishesghhmrghilhdrtghomhdprhgtphhtthhopehfuhhjihhtrgdrthhomhho
    nhhorhhisehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuh
    igsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhn
    vghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprgdrhhhinhgusghorh
    hgsehsrghmshhunhhgrdgtohhmpdhrtghpthhtohepfhhrvgguvghrihgtsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehlhihuuggvsehrvgguhhgrthdrtghomhdprhgtphhtth
    hopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopegrnhhnrgdqmhgr
    rhhirgeslhhinhhuthhrohhnihigrdguvg
X-ME-Proxy: <xmx:MXYTaE0pxu4GXlZeipPeL_I662Gejx_jXbOfa71RDnzDbDY99lsFUw>
    <xmx:MXYTaCGIusi2nAvCAl2eAZ_clyhu9K1YCzYph8hZroqChkNtTV_moA>
    <xmx:MXYTaF84DKs-3VJotd99oyud0Zjsaa0LetsC_oPFTIypCufgBvuHEg>
    <xmx:MXYTaPnrCpt20NxiPs1-uJS3VJXkeOY9RjiLTGGiFhw1WU56K2W_zg>
    <xmx:MXYTaOH75FMSsG25OW_MP0UWV8LAumBrdlnRBUVytBF2QADryxGhzzJO>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 May 2025 09:25:04 -0400 (EDT)
Date: Thu, 1 May 2025 06:25:04 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	a.hindborg@samsung.com, frederic@kernel.org, lyude@redhat.com,
	tglx@linutronix.de, anna-maria@linutronix.de, jstultz@google.com,
	sboyd@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	aliceryhl@google.com, tmgross@umich.edu, chrisi.schrefl@gmail.com,
	arnd@arndb.de, linux@armlinux.org.uk
Subject: Re: [PATCH v1] rust: time: Avoid 64-bit integer division
Message-ID: <aBN2MMaxGrvhF08W@Mac.home>
References: <20250501015818.226376-1-fujita.tomonori@gmail.com>
 <aBNojspyH5dHsuOm@Mac.home>
 <20250501.220717.849589327730222635.fujita.tomonori@gmail.com>
 <aBNzIp9UF7GZVYLs@Mac.home>
 <CANiq72m8RfL5g9kmAhZdZZbrpDschrXf1yJVvkWmvMzdnMaSvA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72m8RfL5g9kmAhZdZZbrpDschrXf1yJVvkWmvMzdnMaSvA@mail.gmail.com>

On Thu, May 01, 2025 at 03:22:00PM +0200, Miguel Ojeda wrote:
> On Thu, May 1, 2025 at 3:12 PM Boqun Feng <boqun.feng@gmail.com> wrote:
> >
> >         #[cfg(CONFIG_ARM)]
> >         fn ns_to_ms(ns: i64) -> i64 {
> >
> >         #[cfg(not(CONFIG_ARM))]
> >         fn ns_to_ms(ns: i64) -> i64 {
> 
> I think `cfg`s may be better inside, i.e. as local as reasonably
> possible, so that we share e.g. signature as well as any attributes
> and docs.
> 

Fair enough.

Regards,
Boqun

> Cheers,
> Miguel
> 
