Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCB3145355;
	Tue, 24 Jun 2025 15:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750780257; cv=none; b=jqddFxgWM/04aNYENdneqyMEt4rWt36MqGpbKPCX59mmjRunkjUBgzLIHEDtiq1OxUPwXYO4IgkzLNNKzZ0F/DMjcHIRhUndhu/9UQqZFVYOfI4l3MUgL1eBXE1e/xTXz6DTXsVmEefiTOnFUN6+Hpe/fEc/xxxyGJIgOszdCfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750780257; c=relaxed/simple;
	bh=fNLPhMp4lTEFXkCOuujjiKNjZOI6aPE3WGNRI7f4uE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c+6vqjAVaap9gIwKovx8ZolNWE1X2BTjGrHU077QYuL+oYTmtKKHeLo2LV4P3tZfKCpfvuW6MGLs6gBAc1dFXTdN9b2HtNmsF8QLj3OkAQRvE6p4pBEUF7VksSwQefx6uAHef8C9Tq/j5AIem3wi8rFq/358dO3EaV5XVHr9/20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iH8kYhx7; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iH8kYhx7"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7d3da67de87so55505185a.3;
        Tue, 24 Jun 2025 08:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750780254; x=1751385054; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rDR18IrgBtO5TS0RMZe4KQzn+MlNrwNw8bMyZk5uk0w=;
        b=iH8kYhx7YkvONUOsk1nKkmvmlloZrX62xPt3tOXNZKHPlBkppEURE8vRuFpw/iBCFi
         PjAX29QUcXDC5efH31DVR79fSPCU8eFAZSUkHFoyytvyAd8+TspNDWLQHKaHL0lZHMWM
         sGf972cSQxShT5D2Z+WPS71nsZ+oT15p/PLsT2VZHnc0jKojV2l3tKpdjzKQermO4RzI
         o7KZB7wX1sZR2fiz3klDcnkt8VyuL+K8AvW9VQOnCiFmjAZjhOG8lyEV4s1efFkLwp5X
         64ojqwcAOZwGvGbDfRuZYPnjbv81kGwsgvyCvLr4rO4NtNkIpf4kuuCeo34YELTAwjUe
         Ly6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750780254; x=1751385054;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rDR18IrgBtO5TS0RMZe4KQzn+MlNrwNw8bMyZk5uk0w=;
        b=QiQ9vY43uLtHUtELxR51WvceVVSap7CEOaGOm0CowxHB2ndbMPhEnwx3pG5vJNTh5P
         6T9x9UOZFRSB2wXM2+x8EKRu4r9wdAqrKosC/kqgy4eZrPE9ay7AERyw4Z9zErm3lRgD
         RSt6ANG+azR2ScEgDCTcMAA9t/26bGKrpc/v2p4bPFhj00E8YZ8P/LXHkyHrbG49CW/L
         A3NvF0ByfzxqjW1nNnlVi2+GO5GILormVZ+5kKkUhx0WEcVSdnMRkb947whf+rL7CQl9
         deMQzgtUXZuM492geqCtZ3c0pPsk64F1gpwTaxQIbEE3Id/RFnWaHXnnx7Y5bhJb5mwl
         NDIA==
X-Forwarded-Encrypted: i=1; AJvYcCWHTSEGQhAP7Hqhz3TAPpYtiy9bufd1okAUQI1EJSdt9qNYCIDyff8j3ve3Qu45bfTOetZ7rOYpV9b2dD0oh2Y=@vger.kernel.org, AJvYcCWsYE1EKARv4ZmOZS3955Amj6kLWYLi01r/rNztouGDYx58WdlCp10yTQPMwRBXxD9JD23jTcVj7PbMd2I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVwImhmQj8XZjetuqDET13dRCSFJiGx3f+WUG/5bZtiFkQOGOz
	qYB8y8kcwAoNO/ZNgAIzZNkscAYYWSgguy9TPmB1shWL1NzCWdyrorKrzcy0/g==
X-Gm-Gg: ASbGncva1nX8iy8+k1AGiwbFJ1T2Np/xsMH4Y22q0hLClsTYvvGg1a6j44L0V5BhAo9
	WpYcghag1akor/zlPrYM5ozWc4eFQbDqLf5SPF2q+iQ/6jD7LZag+/hD1rh9Dqbqb/mBXgFMamy
	IagYmcBV0nKURpc7bxN+4Bt58KPZY7KGLDGy7GLCx1l9JfQknTQmUDBwGoEakXALFzkmHNEiOqz
	2B63j10sZdTO5MxCtQiD8tPfS7zdBscMZXhNMOH3gRjAGQ/IoEezFKriNBLDnSvevBwDNdlQcYO
	9jsAYAzbTjpzKY6kWcnsQHm/vcf1DyLnPLc2kuZH0Szzqbr62LUy8nEUT9mqwVZjbMUmq+H4wjY
	nlY+oFX/BdTTCktefnbE+EzRcXBTI+CPwx9eumujMY+N2vDbnbl2O
X-Google-Smtp-Source: AGHT+IFSr/qTOXafKTj+NvpW/Gjb5c10LaPSJ3957VJkh5+DYtNOSMgLq0V6H1bLfcrQepQewUFBmA==
X-Received: by 2002:a05:620a:2699:b0:7d4:de4:a7cb with SMTP id af79cd13be357-7d428c9f7fcmr15258785a.16.1750780254306;
        Tue, 24 Jun 2025 08:50:54 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3f9a0727bsm513818385a.108.2025.06.24.08.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 08:50:53 -0700 (PDT)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id 33CED1200043;
	Tue, 24 Jun 2025 11:50:53 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Tue, 24 Jun 2025 11:50:53 -0400
X-ME-Sender: <xms:XclaaEqoYkJ0tfWVrlshbCkEozM8GTyWDFmnVV5lAI2-DSnu2jtsVw>
    <xme:XclaaKo_Yn9ozhYPT7zKyvzSUcYoSfyjBQ146x9qUcg6oRE5sLpOjJdhxGWnWZ5ZN
    CGORsKIGXo4inkqVg>
X-ME-Received: <xmr:XclaaJMvIJYAbMQW0B2TJuyw7uI2pofH_ggQAdNpiaP18skXejWuCBprOg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvtddvlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveeiudffiedv
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
    hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
    jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
    drnhgrmhgvpdhnsggprhgtphhtthhopedujedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepmhgrrg
    hrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphht
    thhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvg
    hrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdr
    tghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepoh
    hjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvth
X-ME-Proxy: <xmx:XclaaL6_2XBaLpF35rjNnwBwDCT2oXNskgG-EyGND7fKpNXpKfP63w>
    <xmx:XclaaD4cZ3JuKmvXt3KFhyLa7hUw5E4LgyWP7Yawz3vvw2MTg8-JUw>
    <xmx:XclaaLhWVafqbMmSCcVSMyfX1yW8R-yuf0ejqHhJa8TLaw8uqFmO9g>
    <xmx:XclaaN7NfN9SnkOW5g6IJqUNFXRI6hZxRH0o4MrKOAsJ5Q5Gc5uQ-w>
    <xmx:XclaaGLocZ4woJHHb2yoZgdfYcgbXaZEjxz7CTN2k-OJxp71YcVwVvso>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Jun 2025 11:50:52 -0400 (EDT)
Date: Tue, 24 Jun 2025 08:50:51 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Add Opaque::cast_from
Message-ID: <aFrJW31m8anUpnJ2@Mac.home>
References: <20250624-opaque-from-raw-v2-0-e4da40bdc59c@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624-opaque-from-raw-v2-0-e4da40bdc59c@google.com>

On Tue, Jun 24, 2025 at 03:27:54PM +0000, Alice Ryhl wrote:
> Since commit b20fbbc08a36 ("rust: check type of `$ptr` in
> `container_of!`") we have enforced that the field pointer passed to
> container_of! must match the declared field. This caused mismatches when
> using a pointer to bindings::x for fields of type Opaque<bindings::x>.
> 
> This situation encourages the user to simply pass field.cast() to the
> container_of! macro, but this is not great because you might
> accidentally pass a *mut bindings::y when the field type is
> Opaque<bindings::x>, which would be wrong.
> 
> To help catch this kind of mistake, add a new Opaque::cast_from that
> wraps a raw pointer in Opaque without changing the inner type. Also
> rename raw_get() to cast_into() for naming consistency.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Acked-by: Boqun Feng <boqun.feng@gmail.com>

Thanks!

Regards,
Boqun
