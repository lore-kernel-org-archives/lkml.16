Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59F1267397;
	Wed, 21 May 2025 12:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747831513; cv=none; b=EMVe3x5+nArEQszO/BLmG5AtikZXYA3BqScgkcT8WD7meH/Im4D23FXk3ZtnLJncAnOuq63OH2k4QuW1DX1G3Jpiaa8GDDYS2iQ2J/T3CF+omhIuMkaBU8g+2s5nPz4dJects6wH3u64NUliOsOmVhZNrsQ39C7x0h4R7cT0H2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747831513; c=relaxed/simple;
	bh=4H0rPkjQH+/fJ/cjuVaeZatOtnNeHYnsf/hZvYEqwrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kWYwxEVeiVx+7zme0b730p4iAX0wm7WSNuEH+mrl0AZijWb5LRz1yxfKj4rhn67kVR818H7Qsu7U9c+o7h9Y2JFevRi9gNeA+o1BIBJCJyhjJ0Mnpn6DmOFvudZDL0NtA2rZXzIrXE/Ho1KLpZS745zc3y0wovhzGpz0uRwvJy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UTnGNjdE; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UTnGNjdE"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6f0c30a1ca3so66665556d6.1;
        Wed, 21 May 2025 05:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747831510; x=1748436310; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vhnzj3NnJO366VT/ATwYapAPa7ylDj+dwVk+TFu/WXo=;
        b=UTnGNjdELAWoS2Ursmtk+PExd44r6owpYWGHTwpRJ2sM/IfUFwT8/v8BglAbIhuZ0n
         ftUl80CeXohbwzEJutS/sf+00K+FDuJArlxPSDuPEVWSu1oQFFzU9m2VtU40bahzC3T9
         lpzix4tb6WAFz3iuJoGLEIKCC/QVlVw0YY4B4H0nP1LUXqgOiD7scrrVDPMDsoPecJG7
         YjZ9MCuopqQ45gGUP1O6DVDJZoPmzFsDCdzRVk5N5bXOJR6clGMXKqy0VLyvNiQZNQxe
         GqZ/8+k+jcE14cLPojE8zMDJzZaQn4+NCATHpUGio0eW4vzR39E1GBRB9DDTRQhVB2aq
         DxMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747831510; x=1748436310;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vhnzj3NnJO366VT/ATwYapAPa7ylDj+dwVk+TFu/WXo=;
        b=u4Wdwb+ZBhR9tyMDl/motOIrq1HV6ej0e3bOogxd/7qmgH3YixGe9kZIu8CGtK+dKI
         6y7kc0KY8Sil+v4olkJK1RdIyu5SJHMY9zQrODer0jq4FfKlH+ZN+9qcMnE8aKo5REBM
         GBzD64EJltMBqJzMDiNedH+WLl9Inu8oisbBd/78JzYt+ApY5rrYUUqxLC8H353wTaqV
         jiJoMmHk/aQm42erkgcTuCcHXEpkrPnHkZHvKCeNBwJdjW7k0QFiq5B/O1k7Oa/lrRHJ
         zHFBF+cn9/VXHltktWjoJC/hajfsQ/7eQPJN5GrBbx08MW95Y370ZTtHeDZ4c1fnVzp5
         fdUQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0/m2xqLykc3BBh/UoqyunTx8yOr6j95uJQg2UfAsdhfX7pmaZtg/1yp1ugTCjp+lWAGA2kuGY1rGtQtc=@vger.kernel.org, AJvYcCXX8CPjw0ASg4j3dzVwYLil+xXIKn6RF4nr7L5DlMW60hR8XHWdvIOkp91vKOZFcHOt/JbcWhszBSwR7jlc/Ks=@vger.kernel.org
X-Gm-Message-State: AOJu0YyD8YBQSYkIDq6nUefaoMUOij1DIfp1FLfxrGLrf5MJswVNQI1E
	tvrci3ywO6TN2iLOf7nPI+yktGmLTB6onirZzwOGogu6rAYNd9mUl73i
X-Gm-Gg: ASbGncsDGfpVcQ7rWpd8/94aBA4ygbKFnYIpLu1LWlhoKVdsdPjg74Ggw7/yvmIufM3
	LA8pNmc2gYCY6VuJnAZ0V8yk61wm2qS0eFTja6A16oEbf1mq5V6TqtHWbC7eJf5M8OYSSbJNxwX
	kEbx2j4ckoWHlYi44y/D7LR4Mzlgmv4XGuKtVlgiZ/KsZ6N9IwbTFKomCGPQfEpNSN/v8hVs0bU
	lA3hKdSBsTG8afX8yt3EbBd1Co0RomOzewBVVeyeakayuxy528GAnnKHkDizpAkdLPPm/lE/rVR
	3MKkU1WRrva+XkWoPFxPmY9/5p+0VJgbwczsPO8dLW2DpXKyiy06vpeyaQNjTc/4T3XNVM2I9wm
	rGaVx23bCcXNTSjk8nxPROYFz5HNyppULloG18bXkpA==
X-Google-Smtp-Source: AGHT+IEfRSqcGJ5t4rcRxmzM2k920FXsaJwu1wxt9D1Hfdpn8uKSN3fb6OCq2dNh4iOIGz1TYtv/Hg==
X-Received: by 2002:a05:6214:cac:b0:6fa:864f:87cc with SMTP id 6a1803df08f44-6fa864f8a4fmr18904046d6.33.1747831510427;
        Wed, 21 May 2025 05:45:10 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b08bf66bsm84578696d6.63.2025.05.21.05.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 05:45:09 -0700 (PDT)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id 5CD34120007A;
	Wed, 21 May 2025 08:45:09 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Wed, 21 May 2025 08:45:09 -0400
X-ME-Sender: <xms:1cotaFbzhLa-AVxwpQ35d8kX6hIq-ZwWislwhChbDGrE886dcXNkqg>
    <xme:1cotaMb7eFhXctyLi7ci4R4k3tFn2T2VAuphJPlupRodTcGwYg19z8qCxeIB3OiXg
    GoUBfDa8naZrFuR_A>
X-ME-Received: <xmr:1cotaH9vnyOR6XHBgx3dt1S-54GBmy0ro27iatwvJnw6GrIg8QlhdE-Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefuddvucdltddurdegfedvrddttd
    dmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgf
    nhhsuhgsshgtrhhisggvpdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttd
    enucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhgg
    tggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunh
    drfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrhhnpeehudfgudffffet
    uedtvdehueevledvhfelleeivedtgeeuhfegueevieduffeivdenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgr
    uhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsoh
    hquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghr
    tghpthhtohepvdehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrtghouhhrsg
    hothesnhhvihguihgrrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtph
    htthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegp
    ghhhsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhopegsvghnnhhordhlohhssh
    hinhesphhrohhtohhnrdhmvgdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpd
    hrtghpthhtohepthhmghhrohhsshesuhhmihgthhdrvgguuh
X-ME-Proxy: <xmx:1cotaDr_BZnTBO2ZZrxy5srrQmZLzeo9gWXnSOIXgNKffweWuOxofg>
    <xmx:1cotaAqMl1zRLe7L77t9gwX1n54-xBKwNgVE1PMBxXFMnUOO50bscw>
    <xmx:1cotaJQ4dtper7JsxvJG39LklNMIPguYPvErgkSuMnOiT_alNE6wdA>
    <xmx:1cotaIqgOC4ilrO4JZb18O9O6GbSlFri46ozj22VjBeOFxpIB5P63g>
    <xmx:1cotaJ4jQULX3Xw0qsN9n-dwPqENjGgYpRv_JvJUfS2Dt1RcyknYAt6Z>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 May 2025 08:45:08 -0400 (EDT)
Date: Wed, 21 May 2025 05:45:07 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 03/20] rust: sizes: add constants up to SZ_2G
Message-ID: <aC3K0-z7JARmg7Cc@Mac.home>
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-3-05dfd4f39479@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521-nova-frts-v4-3-05dfd4f39479@nvidia.com>

On Wed, May 21, 2025 at 03:44:58PM +0900, Alexandre Courbot wrote:
> nova-core will need to use SZ_1M, so make the remaining constants
> available.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Regards,
Boqun

> ---
>  rust/kernel/sizes.rs | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/rust/kernel/sizes.rs b/rust/kernel/sizes.rs
> index 834c343e4170f507821b870e77afd08e2392911f..661e680d9330616478513a19fe2f87f9521516d7 100644
> --- a/rust/kernel/sizes.rs
> +++ b/rust/kernel/sizes.rs
> @@ -24,3 +24,27 @@
>  pub const SZ_256K: usize = bindings::SZ_256K as usize;
>  /// 0x00080000
>  pub const SZ_512K: usize = bindings::SZ_512K as usize;
> +/// 0x00100000
> +pub const SZ_1M: usize = bindings::SZ_1M as usize;
> +/// 0x00200000
> +pub const SZ_2M: usize = bindings::SZ_2M as usize;
> +/// 0x00400000
> +pub const SZ_4M: usize = bindings::SZ_4M as usize;
> +/// 0x00800000
> +pub const SZ_8M: usize = bindings::SZ_8M as usize;
> +/// 0x01000000
> +pub const SZ_16M: usize = bindings::SZ_16M as usize;
> +/// 0x02000000
> +pub const SZ_32M: usize = bindings::SZ_32M as usize;
> +/// 0x04000000
> +pub const SZ_64M: usize = bindings::SZ_64M as usize;
> +/// 0x08000000
> +pub const SZ_128M: usize = bindings::SZ_128M as usize;
> +/// 0x10000000
> +pub const SZ_256M: usize = bindings::SZ_256M as usize;
> +/// 0x20000000
> +pub const SZ_512M: usize = bindings::SZ_512M as usize;
> +/// 0x40000000
> +pub const SZ_1G: usize = bindings::SZ_1G as usize;
> +/// 0x80000000
> +pub const SZ_2G: usize = bindings::SZ_2G as usize;
> 
> -- 
> 2.49.0
> 
