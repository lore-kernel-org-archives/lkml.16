Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCDA63D;
	Tue, 22 Apr 2025 04:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745297751; cv=none; b=tfQQAJ6lehhNMv3Qr+jQQzaVBPcvnpEKDoAKRElJIYiGhK6w3zb2s0y1z8PV1vI2JktjpUBOV2OKuxAkMWppjN40vNkfoaiEDPnoxHyxhd3dpUvsRRRgxc73HO5CnVcnU/5YBjzuYa2ZSkZN29cLDaZVFOFjEABPN/8NsoiaFLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745297751; c=relaxed/simple;
	bh=frhxUVT5MtMR7PYh3iVn2HcckcuVQzGf4LnBXAqhYe0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Egr/ix3tos6O584y1E8xoBZED+HsZGkf6lfTPdcgC1nt9BBn9r7bAZumb4KVbv9n6vAUc2Ywm22EgR9Akw+IbVTjLdtNt95MKQ+qmLm2oh8Maw5ibX/ABg4DK9PQuwPgnGutY4tvnJ5X03QJ+peeoaCoR+e6GU1YyIZ+JdYS8gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WpiWppAn; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WpiWppAn"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6e8f06e13a4so57321056d6.0;
        Mon, 21 Apr 2025 21:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745297749; x=1745902549; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g23L/JcP3rhOW1Tbqfm85nn/TzxR9R3EVTDW5mx41o4=;
        b=WpiWppAnbf8vcRIaJUTqNhnFWSlV1CjtYj09gs24Osx7f7OXrAOIO8c35Nikug+ntk
         OzEvuBUIS9JTjJVrup3R3/MY89Vnd3uta5pK3CU52Yaa20Pvvhvp89mbeSp5A07YSGYQ
         YWO+hPZ1UHz7SCGNB5J7OJwvrdr1HKBBtuwJ+RJNStpi22etffR/EyNkuqDnbgjvGr+2
         ab4PMOf5I2PVPGZ84+AuGYSLA3EUQWBz9KgUgnb6g72pYgBOrgY+xDpxcc1eMSNiCYhl
         FHs6Rd4KEOOGxOaRZraESbYmuYb79EOUtBZyH+19HyRqJCvlVjM+86nraBBd7sN5joPL
         +jzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745297749; x=1745902549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g23L/JcP3rhOW1Tbqfm85nn/TzxR9R3EVTDW5mx41o4=;
        b=U+SOWb+Jlf8njgDJxhfosWlciqiEmhA7Lijv5N92iqDR5U5S6vb7j7rNhMOWf5vfuO
         srqU8KE6p8uL4wgr4On7V/+hL+lzRwCmbmzcXLeSXwBqopXwuNJUm9fYzbscfyx27sKB
         6OkELw8IX81Im4ZRHLslwnwo4aKRosByEfm/8jQY/CTLq+gUJIppWnpNKh1mxj7+k/N0
         lKZL/wlMmbmMnNxB5gNuasZYsTz+2snzuNgmxL1uJYC4PR9oUB9as9EwjFttR3tgE70J
         DVNmQCrdgkBHL0mYp0epJXADfak1NfY83nro4LCpDUvOp8NX624TrVcw+k8NU6WOH9+v
         GOAw==
X-Forwarded-Encrypted: i=1; AJvYcCUPNhvGP3mZEYOC7zu3hMKzVFqDpSD4+I6Fm8Lygelx8zfNmJ4J7p4cWyhanSuEk3VmHKYvw4gsWykkrdU=@vger.kernel.org, AJvYcCWFoBX+8FBylqNxsy0o/Xu0SB3hJF2KYoTzv18CGu4Gx7g24lou8oZ/EzCP4GLXzlpjanFONskc5aCwiYMu+eU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6Oa2rKV6cJBzBmjg8aOodDKaSr5+JJyK7Lw1IeOL+AMei382r
	DYaxBOSSE3gg49qv+/z4t12yMrWnvvw3PFNCF4MUgK5i/DlBj8xo
X-Gm-Gg: ASbGncs29oPkZmUqSXCwxsG9N8xXJWrVWiOmL9ebHRlMSPcc2gZRKRZtdsY+BU5SEDu
	VXP0xgldzacsAKoOBA34WJwiqQMMSEO3CeuQLNOSR9ky1V3l7hm+xF4YYYVW91iEH/faMaoAHD7
	OZ1Mkt4O+GM2FiPxrMBm417MVmYrHJk6DJo9GxBvC5vcS/O4vctAfDUcmWPDXsZs60JfrRnJvre
	6MXkntSZ6B2GQc2qYlr6a8c1WDsrboFfozzsa1RufyoQPcH3A+SmrY8HDJCli/7VCIuCwHO8Eju
	DJatNAeP9uTBdkXib37YX6+TBjp2u6TQ8DqLkN0EbE8MjOuRagteytpMR4VdHA3q5VsFJXwnaJY
	AhLgZ5mTGtwu7GU3LShZPUwu8kFQZhlg=
X-Google-Smtp-Source: AGHT+IHUpe/73h8OMa9+NgIybyJUKUxBrfdv7o6nDeThStzN+9P34NaMtQAgiXMz3YmRGbQZnnkxlg==
X-Received: by 2002:ad4:5d63:0:b0:6d9:ac3:e730 with SMTP id 6a1803df08f44-6f2c26871fcmr271515586d6.5.1745297748805;
        Mon, 21 Apr 2025 21:55:48 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2c21cb3sm53004646d6.108.2025.04.21.21.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 21:55:48 -0700 (PDT)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id F09BA120006A;
	Tue, 22 Apr 2025 00:55:47 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 22 Apr 2025 00:55:47 -0400
X-ME-Sender: <xms:UyEHaMWfoJzNAW4vNRZ7X0Ln759aoDmhOMVpZAasxsna_6atre181w>
    <xme:UyEHaAkhgWeBZT1Ugk88_VYQ8mNB0xg6_5p3bnEHCHEhvKIkR0km43ZXZwE9QIa19
    OVK_1oa0CtGJv37Cg>
X-ME-Received: <xmr:UyEHaAZ_VU-KQGaiSrrx3V3DSPyz7BD0e3XILf4q6yhemXwvsIjckkb1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgedvkedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtrodttddt
    vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpefgieegkeelgfekheetudeiiedvlefghfef
    fefffefgudejvefgtdfhhfethfegjeenucffohhmrghinhepghhithhhuhgsrdgtohhmne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhu
    nhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqdduje
    ejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdr
    nhgrmhgvpdhnsggprhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpth
    htohepsggvnhhnohdrlhhoshhsihhnsehprhhothhonhdrmhgvpdhrtghpthhtohepohhj
    vggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesgh
    hmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgt
    phhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgtphhtth
    hopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlihgt
    vghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepthhmghhrohhsshesuhhmih
    gthhdrvgguuhdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:UyEHaLXl8SkQG8PFxpTgMTIuSsXBHVW265nqSmm750Z3ovCFqAU-kg>
    <xmx:UyEHaGkwfyWGVz1YWsluuAc-m3fxQQ_Mf0S1vxUvAlYso12NTVjewg>
    <xmx:UyEHaAePWGxKLOb1SuYNdPFRQ1o9zT_MdfbkL58ewByPHvQF6bWpuQ>
    <xmx:UyEHaIHBRhHWfAUYIHISnQqvKb7aN_yPvwy3jtJ8m0L9mT3Gb0rxFg>
    <xmx:UyEHaMkWlzZWqa6MLDfeAlxm01Wv-kMAwGclQ0FX6Kow_Gq50kOZjPdj>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Apr 2025 00:55:47 -0400 (EDT)
Date: Mon, 21 Apr 2025 21:55:46 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>,
	Alban Kurti <kurti@invicto.ai>, Michael Vetter <jubalh@iodoru.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/8] rust: pin-init: allow `pub` fields in
 `derive(Zeroable)`
Message-ID: <aAchUjDJsukcCgKM@Mac.home>
References: <20250421221728.528089-1-benno.lossin@proton.me>
 <20250421221728.528089-7-benno.lossin@proton.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421221728.528089-7-benno.lossin@proton.me>

On Mon, Apr 21, 2025 at 10:18:33PM +0000, Benno Lossin wrote:
> Add support for parsing `pub`, `pub(crate)` and `pub(super)` to the
> derive macro `Zeroable`.
> 
> Link: https://github.com/Rust-for-Linux/pin-init/pull/42/commits/e8311e52ca57273e7ed6d099144384971677a0ba
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>

Kindly request tests/examples for this patch and the following one
(patch #7) ;-)

Regards,
Boqun

> ---
>  rust/pin-init/src/macros.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/rust/pin-init/src/macros.rs b/rust/pin-init/src/macros.rs
> index 361623324d5c..e4054fe3ed3d 100644
> --- a/rust/pin-init/src/macros.rs
> +++ b/rust/pin-init/src/macros.rs
> @@ -1393,7 +1393,7 @@ macro_rules! __derive_zeroable {
>          @body({
>              $(
>                  $(#[$($field_attr:tt)*])*
> -                $field:ident : $field_ty:ty
> +                $field_vis:vis $field:ident : $field_ty:ty
>              ),* $(,)?
>          }),
>      ) => {
> -- 
> 2.48.1
> 
> 
