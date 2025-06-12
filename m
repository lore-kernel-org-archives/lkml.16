Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CCB2D322D;
	Thu, 12 Jun 2025 20:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749759140; cv=none; b=mzKVUqctZIPjBZ9lODAH4WjMEdpiRTc9VFMTw6Yx+oFq7z6hssQWGmfnZ9D0C/Vjvb43Ru9khnNYDsLXmtO11/0/qZjROGpGJnhZXi8lkkT0RNOq1e6uhvCJUUYQ88BE4mn6amsqWDnuFsaDoujEeDL3sRA8U/K36U/hXg1rX10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749759140; c=relaxed/simple;
	bh=TB46SWRWJ7qi3GWgPbZfTdPZtm18IUtfsAfAwyTMCcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=keqgPY05zA5Yc5do2UeSzTjCZTO+Th5z1Yw/pH8JtWTZ2QkwJ5BZxMukDcaacW7gzK10CtMKm1uljTmP7T/5WwsW47J2K7NFHIrxWNYc0yiJ0fb7Rmj/1ru7Z390H1vNmZ+XTIuGd91Dk0CSzoQa14yb0feEESm73zT+ygyCXmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D23ZrHEO; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D23ZrHEO"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6fb1be9ba89so12827826d6.2;
        Thu, 12 Jun 2025 13:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749759137; x=1750363937; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVFfh/OIaSzF+T7uh2as5eWwfIjPE42Cyz++RGQQ/jw=;
        b=D23ZrHEO9yO0jh+MezAP8vrRU2RArpGykliuoDKvKn7Rcuc6yzHyy6WJsf+nTe3o51
         hxmwL4KyRZCjMKtg5WMPmniD4qfQY4fMzdnHuqNXsw8eOxJmaL/EUcqersbNI+RR1sKK
         jHN4IeK6XZxUZj0cJMo+zIfssrSJbrJpkVecYiKekIwbANWn5JLDl+Vn1MpYNZe3FpI+
         yaOUDIcc42ELi8+FVFAMqz6mysJHJIVheOm58Q45SaAQ8+nsyQ1rV6+SmZwuDHeAPqPl
         b6FXG0mNGaAuVnaVoUmJbWlZ0T0rD+ctounhksW9uGCu1qY1tgB9u3z6XIdjL+s9tPfg
         xunA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749759137; x=1750363937;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PVFfh/OIaSzF+T7uh2as5eWwfIjPE42Cyz++RGQQ/jw=;
        b=ros59BsLQParvQWA22/CgefXfrj1RE5DU/C3zSCI4BlOznyzt0urYtTvwQJ8MwfXoX
         MxTOxSB/uu6JnVJFrv3zPaLij8nink7kWBk0jPJYxsIF5+NzsdOGfbIwhIhMqYGQYM6s
         gaaJPIBukO50m9bk6BypH1zVIHFKHsVnbWojirNNp5IYrpQRHj8spcMRknd5t4xo8HmL
         guRDET9+jccWihZZSav22WbW7zvlhZbtvfPFFcbNHtwp2nVhulJ82BQ+qWlLD071j9iN
         4N93wCtcYG+mW86sHP1SHA6tLPAyfBc4hLBgFCwpweRVmyBrOAkk8XoacmlqklS8YLYY
         7Jtg==
X-Forwarded-Encrypted: i=1; AJvYcCVVOG4o3zqsDMy7CoefhNCz17Uhoi4VXgoUhshqV7RFbYT0IyRi4dYRVTfCDjn1FIRDR6zNWp3VZJC/yapMhDU=@vger.kernel.org, AJvYcCXmx757QX9Q2/NiFILgyiU7GNP1kTPJCVLJCeWwcFYklDUnCA1j1+XbaMxI8t8S84QCFeExp17qj2nq1Zw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwM4IoiauPEoJzZTsIJQnhcizi61VP4coaBjMxGfX6lgDE5xJkh
	/s3wx5ivU3MG1kJxMCusdLUeluKT/sa4K9eAvN5ue85Nzd2zbx2RvTDD
X-Gm-Gg: ASbGncv2BCfU4GMpmhAGz8abBQfIoajhFdiXdzL9nEvP8/epoFfD81CjxK0JJPkE7PW
	QEUbL5IIw91+ZEULgs6kFKdCmfLqU0xWOCLcdg+N2YcTwhxbq9DJvBYnEEYMdkE8xGa+mEf88sv
	wBodA9RPeXJ0f+ywp8MXcnxUbdda4Wy+DvuXrsb/STTmuVfq91OxwItCR0T4pSHXavuouFoyED5
	u5EiFL3HN/etdLKLSff1cfIc9yY1PYlSA10E+cHU1quFR28Xc33IW4UBVdoEwMnwVjF7KBVTS5M
	i68oNOJDH5hHLF/g2gjmVVgPpekpJY1/LRGdw+TLgpwbTfQbvv4pFtTgicfVgHpHqppIh4dnKXf
	ppTyZiohH+JBt5clzNJiV7TZMZOpZiukfPcyzZ4RhT7WZHJH169HH
X-Google-Smtp-Source: AGHT+IFJNlGuVyvaF9eRVutRSsDpcCFkY1tMrNQNHCT2HWLojqkctlXf1dIxq1F7oOHuTDrPXVYCgg==
X-Received: by 2002:a05:6214:f22:b0:6fa:ccb6:600d with SMTP id 6a1803df08f44-6fb3e5de4c4mr3415446d6.21.1749759137250;
        Thu, 12 Jun 2025 13:12:17 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb35c31ac3sm13639086d6.68.2025.06.12.13.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 13:12:16 -0700 (PDT)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 240E31200043;
	Thu, 12 Jun 2025 16:12:16 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 12 Jun 2025 16:12:16 -0400
X-ME-Sender: <xms:oDRLaFc_03txAVqTKE90sYUCBRynSpdVPHQjWgopAaipmum3EiCnWg>
    <xme:oDRLaDM-BKIpyWnAjmG32Hzuxc51gt3WkipfILmRtJEBylR6gtaf1-EuwHIuyFDec
    xcKpbKvEIlgvu2oBA>
X-ME-Received: <xmr:oDRLaOilFFQO6Jy2Y-t7G7IOuF_sHc6ylNB99aGCDl28AA-AtAF-VtDkIDs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduiedttdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleel
    ieevtdeguefhgeeuveeiudffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
    ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
    hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedvhedpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtohepjhhhuhgssggrrhgusehnvhhiughirgdrtg
    homhdprhgtphhtthhopegrtghouhhrsghothesnhhvihguihgrrdgtohhmpdhrtghpthht
    ohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnh
    horhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgv
    thdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprh
    gtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    rghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepthhmghhrohhssh
    esuhhmihgthhdrvgguuh
X-ME-Proxy: <xmx:oDRLaO9_nMB1tWbwRzzD-Zvo5jVdXayR0dtZaUGL4e1pHfne-1RzlQ>
    <xmx:oDRLaBv3KgwHgSY_H5-Rb6oL2HftHm2kKPDCQBIcmCZYPEgQgo5bmw>
    <xmx:oDRLaNEUGIB2EbhOzkQ_wdcDKK-5DOKcUxk89H9GjZDLTc0CkEcEKw>
    <xmx:oDRLaIM0Pg4EkifRY2hLgxF5UDZFc2yPS5CxYJKvuwT4dfJqVM4b3w>
    <xmx:oDRLaKPaHv8UVEXfB6bNyd0pDweM1L1hyRFATrjaqFtjCelg0iQfmsFJ>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Jun 2025 16:12:15 -0400 (EDT)
Date: Thu, 12 Jun 2025 13:12:14 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Benno Lossin <lossin@kernel.org>, Ben Skeggs <bskeggs@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 04/23] rust: add new `num` module with `PowerOfTwo`
 type
Message-ID: <aEs0noYbLf1crnAf@tardis.local>
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
 <20250612-nova-frts-v5-4-14ba7eaf166b@nvidia.com>
 <aErtL6yxLu3Azbsm@tardis.local>
 <f8d9af76-fc1d-4f7a-8dfb-a0606e44c56b@nvidia.com>
 <aEsy8XDy6JW8zb6v@tardis.local>
 <529736c9-15a1-4777-be30-cc9aa9d11a87@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <529736c9-15a1-4777-be30-cc9aa9d11a87@nvidia.com>

On Thu, Jun 12, 2025 at 01:08:25PM -0700, John Hubbard wrote:
> On 6/12/25 1:05 PM, Boqun Feng wrote:
> > On Thu, Jun 12, 2025 at 01:00:12PM -0700, John Hubbard wrote:
> >> On 6/12/25 8:07 AM, Boqun Feng wrote:
> >>> On Thu, Jun 12, 2025 at 11:01:32PM +0900, Alexandre Courbot wrote:
> >> ...
> >>>> +                #[inline(always)]
> >>>> +                pub const fn align_down(self, value: $t) -> $t {
> >>>
> >>> I'm late to party, but could we instead implement:
> >>>
> >>>     pub const fn round_down<i32>(value: i32, shift: i32) -> i32 {
> >>>         value & !((1 << shift) - 1)
> >>>     }
> >>>
> >>>     pub const fn round_up<i32>(value: i32, shift: i32) -> i32 {
> >>>         let mask = (1 << shift) - 1;
> >>>         value.wrapping_add(mask) & !mask
> >>>     }
> >>
> >> Just a naming concern here.
> >>
> >> The function name, and the "shift" argument is extremely odd there.
> >> And that's because it is re-inventing the concept of align_down()
> >> and align_up(), but with a misleading name and a hard to understand
> >> "shift" argument.
> >>
> >> If you are "rounding" to a power of two, that's normally called
> >> alignment, at least in kernel code. And if you are rounding to the
> >> nearest...integer, for example, that's rounding.
> >>
> >> But "rounding" with a "shift" argument? That's a little too 
> >> creative! :) 
> >>
> > 
> > Oh, sorry, I should have mentioned where I got these names, see
> > round_up() and round_down() in include/linux/math.h. But no objection to
> > find a better name for "shift".
> 
> lol, perfect response! So my complaint is really about the kernel's existing
> math.h, rather than your proposal. OK then. :)
> 

;-) I realised I misunderstood round_up() and round_down(), I thought
they are using the numbers of bits of the alignment, but it turns out
they are using the alignment itself. What I tried to suggest is that
for this align functions, we use numbers of bits instead of alignment.

Not sure about the name now :)

Regards,
Boqun

> thanks,
> -- 
> John Hubbard
> 
