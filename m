Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA0F2E62A7;
	Sat, 14 Jun 2025 17:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749922315; cv=none; b=I9RoPfL5eAdIzoRWiz0r0dWf8Qx9Eq0hSzpmICewlqts+370tnfXVTZYqRsO8WHLvulKZ5+jSv1A86gfmHNgbfVou2yoV9WEuF+iPcg1c2oz008m9uSil6X2Oacn4wYBKSfyCaO3Xh/d24ltOp6MeRfy4dMgWPtzyzn+XP1OiYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749922315; c=relaxed/simple;
	bh=qzEVLCJ4y0TCHDNIu6cFpnAWeTkMTFjZRghPtMz66K8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HUW4T5IMl/bLMDiLAlaDmzJ9v/sQvYv6T23qsyWFja35qEKdR4fXt+A/gh5KnrzssYyYb6UmQRktXm9do+mH944o/jEcoZFex/fjUtJ/x4phqUeK3rNq0e7ov01yaEq+5eIudGLkJPLodolUrUfEB5aDhXLs5L5qt4CqddWs0ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GdVNSVPY; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GdVNSVPY"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7d098f7bd77so336981185a.0;
        Sat, 14 Jun 2025 10:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749922313; x=1750527113; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9vAD1Oo4GIgsQJodLIxN5GNTdvfpBs5Y2Vi4v397QZQ=;
        b=GdVNSVPYDEWO6cnxnK24UMRCNhAze0rZQM/qtZEpYZVkBEENA1j+050yM48VTrSXXd
         48RV5RZRSI5ugTI/kF+kdf0mb+joxuQAmFaEDQrq4dHAx4jUh3rvEtEaKRG2n1OpJ36q
         WxRvMDpexavebT2VgGbSGdu4gTF4E9BmZz3bpwCVgWVN7GvLOR9u/mCJxfEQ2k+QPhu8
         8RUSvR+xL74Uu+rwlD+3/TIEDLG61jw5dfO2ria3slPvz9wMbwl5MpNwmWBK5CVlHPnW
         MysqUwQ7J02nldKqaNWW8Hzjj+K/4zWnpbgvoYaaowZ0p5oyXSUFCaYuLO5JGkNqlsk5
         bwKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749922313; x=1750527113;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9vAD1Oo4GIgsQJodLIxN5GNTdvfpBs5Y2Vi4v397QZQ=;
        b=mP4zxnE334WFN/07n1X/YLu+Ki5SWGBH0xZpEaVdKnvatfLf3NydLWs7adR+3apStv
         Y0Q8FGfOzA1b5zBPjzWIZsWbgDGGGIMISgPYBKS1MmWBVEnj1WlfCZq7n9z2f1qfrGkz
         q08nIbsmH8Exzvsjs8l+rjeu7ShLEi88dqab8FPcE/lWYQqk4ZpYwAow1DSmzTm6TcI3
         TWkOcKc83PnU6ONSqKuXxrEIfgKfcZVP0XINOF/RACKNARwgGaMK4fJGD3VHkW6raSn8
         Odw/G+Rd9XRPf5RNTTjFf1I7Niu+9tqWLcrAt++nYWksKaPSkvURnDSdQZnriyjNTtzS
         Qj9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXkVDLGzFkU2IoyeqnhX/NiK4Jo4t2L8+faa+CN0pM05LUY4c+hoefEHOzSgYWvtEnclpkLplQmwudBdPmcQIs=@vger.kernel.org, AJvYcCXoG4PNcIwksqh5P+5Xca2fLX451R7RUnqfB4GfuIlOOljrkmeT/I6TJhiRE+cd5Kvo61lKwIZ+s4OQwNU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx5rh3obWbldoHoCoItFOLe1S3Fc3o71hMgvG17vyceKLAk0F8
	F2oZomCBVZCS+MTC6/jOiVIsUIZ0lOQiBSNNN4b4RpJD3dNMZyZVSSoB
X-Gm-Gg: ASbGnct1mtBiGlzp/oLztVAVM24AZTk4yUZ/a97RR6mXOfXRuDkDpiw9VHV8W3Lq+Fn
	4G9Ko+SbxRX2Gx3oYIznXli16CCRNB1RvOD5crEzUK2zVYLzs8n/hKf95+BfOi/QKj7G9B6rL1n
	2ydZlNduEk5G5IISKoqTwwKBnle5MJN/4PqAF4TIzY7QAS5vM/8/5zxUrsFDX3eOVNBVZkFI/CO
	PEZUYl2WiGe1jsngXeB4HocGY2Vzzk6S7zgOHhvUpeBPrgiSgh6iErl3bxBGQJwC68SwDzJdMiT
	tutQ88jWZcPLI9j5mophWZz2RxVyjUYLriQJXi2VphvaCur1SzcxfneI6N57/Pnj5/xggy/nQnt
	DQEwB1qPGrcEUmr8nxX8K/ktfd+pZHgRFZm1cZyLJs/kiGytavHBoWhNWvJQ9Mi0=
X-Google-Smtp-Source: AGHT+IHWbXpaW0xQ8j3ub+miaPu23oUlnOGgckN1dXQ5JdCeAoLpuWN7nPvDlT0D04EFcpHoWTBq2g==
X-Received: by 2002:a05:620a:c4c:b0:7c0:af6d:a52a with SMTP id af79cd13be357-7d3c686ccf1mr615595885a.26.1749922312672;
        Sat, 14 Jun 2025 10:31:52 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8ece837sm315191785a.79.2025.06.14.10.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 10:31:52 -0700 (PDT)
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9AAB71200043;
	Sat, 14 Jun 2025 13:31:51 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Sat, 14 Jun 2025 13:31:51 -0400
X-ME-Sender: <xms:B7JNaALbphz8h8WwKiUCQdyMfGLK8128zaxxKmGulrkaZPyAdYvblw>
    <xme:B7JNaAIonQXfZpzu3ihyYXOzraU3oXmXXhf4hKZRFCixel4-p9rtbR_YHgUcLxaex
    YHN4CQ8vOppjnppwQ>
X-ME-Received: <xmr:B7JNaAstFCv3qXjz7_iMHX1CbApHaVF63wVuShqALpDU4f4WHolkTKmR3g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvudegfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleel
    ieevtdeguefhgeeuveeiudffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
    ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
    hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedvhedpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtoheprggtohhurhgsohhtsehnvhhiughirgdrtg
    homhdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegr
    lhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrhihsehgrg
    hrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgr
    ihhlrdgtohhmpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthho
    pehtmhhgrhhoshhssehumhhitghhrdgvughupdhrtghpthhtohepuggrkhhrsehkvghrnh
    gvlhdrohhrgh
X-ME-Proxy: <xmx:B7JNaNZ7Fs0cWSwJTnBpxyC6017SCCSK54R6dN2bPoCzQzX1HGe3Rw>
    <xmx:B7JNaHbCYH9QSNvhCPgjcxPDufAr9Ah_6aS9wLpMbwHynjQsJVX7BQ>
    <xmx:B7JNaJBsl0SqeeNXa0IuPwIYbYvSquTyFEJipBKaWQ-_tu8ssz8nEw>
    <xmx:B7JNaNYqYKe6wznY-CIYskbHH-cA1_tz3bAfac15m8wZ8rkU8D8ikg>
    <xmx:B7JNaPpNZ8RNs8B0-hobud1ykDb-wQjKcTMF2RseMG5IxJnxKgeCHMSo>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Jun 2025 13:31:51 -0400 (EDT)
Date: Sat, 14 Jun 2025 10:31:50 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Benno Lossin <lossin@kernel.org>,
	John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 04/23] rust: add new `num` module with `PowerOfTwo`
 type
Message-ID: <aE2xq_ikyUZ0JwCR@Mac.home>
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
 <20250612-nova-frts-v5-4-14ba7eaf166b@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612-nova-frts-v5-4-14ba7eaf166b@nvidia.com>

On Thu, Jun 12, 2025 at 11:01:32PM +0900, Alexandre Courbot wrote:
[...]
> +/// An unsigned integer which is guaranteed to be a power of 2.
> +#[derive(Debug, Clone, Copy)]
> +#[repr(transparent)]
> +pub struct PowerOfTwo<T>(T);
> +
[...]
> +impl<T> Deref for PowerOfTwo<T> {

Why do we need `impl Deref` (and the `impl Borrow` below)? A similar
concept `NonZero` in std doesn't impl them as well.

> +    type Target = T;
> +
> +    fn deref(&self) -> &Self::Target {
> +        &self.0
> +    }
> +}
> +
> +impl<T> PartialEq for PowerOfTwo<T>

Any reason you want to impl these manually instead of deriving? For
`NonZero`, the std wants to impl these traits only for
`ZeroablePrimitive` types, but we don't have a similar trait here.


Explaining the above in the comments is much appreciated.

Regards,
Boqun

> +where
> +    T: PartialEq,
> +{
> +    fn eq(&self, other: &Self) -> bool {
> +        self.0 == other.0
> +    }
> +}
> +
> +impl<T> Eq for PowerOfTwo<T> where T: Eq {}
> +
> +impl<T> PartialOrd for PowerOfTwo<T>
> +where
> +    T: PartialOrd,
> +{
> +    fn partial_cmp(&self, other: &Self) -> Option<core::cmp::Ordering> {
> +        self.0.partial_cmp(&other.0)
> +    }
> +}
> +
> +impl<T> Ord for PowerOfTwo<T>
> +where
> +    T: Ord,
> +{
> +    fn cmp(&self, other: &Self) -> core::cmp::Ordering {
> +        self.0.cmp(&other.0)
> +    }
> +}
> +
> +impl<T> Hash for PowerOfTwo<T>
> +where
> +    T: Hash,
> +{
> +    fn hash<H: core::hash::Hasher>(&self, state: &mut H) {
> +        self.0.hash(state);
> +    }
> +}
> +
> +impl<T> Borrow<T> for PowerOfTwo<T> {
> +    fn borrow(&self) -> &T {
> +        &self.0
> +    }
> +}
> 
> -- 
> 2.49.0
> 
