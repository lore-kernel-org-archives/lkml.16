Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6847D35972
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750082578; cv=none; b=iloUx+VXb/rBReded+X6N9UoMAXsEnK/NkSeO2nijXOJP82/hAH0m/u+9MKuhVUNF26geu2xcngSwbNC3qxIt9RTS9KfeI8naIgh/wI443Y9tTWJWFbLvzof+8n2HXfB12h7a1k7V3oP+dnknR4GM9XkInIc+sBbU+4nYg1RVEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750082578; c=relaxed/simple;
	bh=M9iPmr/hd9Ggp7c2g4TZVex3t2dAViOX8F17mzyQZUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I92TmNYfkXMrrBap59pCADI/6xWWhtSho6/V1sE1X/wBiCrN3FLZcHPUxn9B93uOZAmpsutQ2FbR95dKXtFicH/2kFA6TbZpUcf8tmbQfe2FQg3Us/CrsRkN9Pdq0ZIo2yg2wPn5P07MlqH+/IpP8Jz152Hmeva0qADdOv5uvVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1tKiH8QS; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1tKiH8QS"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a375e72473so2610783f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750082575; x=1750687375; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FeI7dVZjAypUtlg/sBYp2OboqNhum0d3l9RmKtS5z54=;
        b=1tKiH8QSVPTm2a3j7uY6nsdM6L9QMy92M1AIsyTl2sim/nRQ71muIwqIkYLCA0n/wa
         8m86KMrMD29ZwdUIMDSkYRoKXWW775BqHxgoa3BZIllmYanC3TiWw79GH4JH+6rRkRtG
         /Woq+jVyYiWhQhB7sOdB3Ys9AmIyRI7KXcHCc0Qj2mPx+vstrXw9hFv3my+nQmesr8Rf
         n+D+yJxbSBNvELdh5S1fk8e42xGYpm8Xlc5VZUIr6UYITbs+ONXsAOxhvihfv9FDKXdl
         62voh4/KB7c2ZeL3IOlN63c4Ln7/INpWwQZxwxhsK2Vh1adg+QuWGT6OwQ+gy8sAVFIX
         OPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750082575; x=1750687375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FeI7dVZjAypUtlg/sBYp2OboqNhum0d3l9RmKtS5z54=;
        b=vTNUEEP3RSymm+yv071s8c3hd71veq1bdWTHRKdEp4oXJ6jC6mrNbegyGnuz6qLMMA
         45IsvhwnXStv7ASh0m04IhbdEPqRF6kr8/hv4ciM6xLc/0gILZwnGYYlmjpJt+oghlek
         ++NZprhroiyZ3pLHWao3DAKfMw0cE4JAG0HxmU9WgMkj4HZDDPI2pZGEFlzurM6JwZFc
         8YtR+3s5LLADi+jx8XRbXH1oT7/ZLRWQb8oYGujixI4ewedUAvDmLpGpF2emD5AZk4rd
         BxjwajR+MoU2UnEH6IIb62t2MShizbTgFWVbiSyeHzycNgpNNl+gN/X80T9Or5ecAfUN
         9EAg==
X-Forwarded-Encrypted: i=1; AJvYcCWP373afP2yGdIp5EgpOpf9uaHseJaIVl8Nq0LVqLPuyu/Ztd87Iq2bGr3/7I+l1tQbUfUuGTHCCfznzjQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKGF/Qv0O0V4BuGHdYRm+Q1Lg3KSvN/HeLceB6Q+vOpWkcqShH
	zcpEbIBOZl08UmzIGzsWjtUsKDqQPpUr9rEaa9BuvyqJTJT9fiHHyrVNtUZwMgDVwjAJFVoCqyQ
	26uVlc1ri9PAhByCY8jqjS3z9UoYX/Vv2qJuUjk1p
X-Gm-Gg: ASbGncummXyGMIsDQue4+l3B9pIAOwjnXUXgpinHRzGl3UvN5n/CaOit5JRceBxuaER
	brwbSPVIvM5kCWI4H0NxM6I6oT8LGFwdFdt26qQFQgc0TiAZVlvHYhvMQpRX/AYL4MogftMor2Y
	AocfvsOv8m6TqLK52J6pXxNoif+kjIuXVt5Wn0WMif6d4K
X-Google-Smtp-Source: AGHT+IG6mhibxRmrcpXyyVWbs6Zi/EB3mKvbkPCAzyyW7ZMRYgcWpCLi07Oq9F9r3b2+3Uf4STjRbMPp9QJZxFXkpB4=
X-Received: by 2002:a05:6000:4203:b0:3a3:6cb6:defa with SMTP id
 ffacd0b85a97d-3a5723ae1b5mr7662579f8f.40.1750082572895; Mon, 16 Jun 2025
 07:02:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2025061313-theater-surrender-944c@gregkh> <20250614105037.1441029-1-ojeda@kernel.org>
 <2025061446-wriggle-modulator-f7f3@gregkh> <a3a08e5d-bfea-4569-8d13-ed0a42d81b2a@linux.intel.com>
 <2025061546-exile-baggage-c231@gregkh>
In-Reply-To: <2025061546-exile-baggage-c231@gregkh>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 16 Jun 2025 16:02:41 +0200
X-Gm-Features: AX0GCFsVDhmmW3g26qu_6PoP9y5f0Lj5YfUuf6wjtzXOaEVtlzvaf6PEfRuyuhc
Message-ID: <CAH5fLgg2aPtnWDqoZ8wi1OGge4PBB_Y0LSM9TSviowquEQXCVw@mail.gmail.com>
Subject: Re: [PATCH] driver core: faux: fix Undefined Behavior in faux_device_destroy()
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Marc Herbert <marc.herbert@linux.intel.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Benjamin.Cheatham@amd.com, Jonathan.Cameron@huawei.com, dakr@kernel.org, 
	dan.j.williams@intel.com, linux-acpi@vger.kernel.org, 
	linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rafael.j.wysocki@intel.com, rafael@kernel.org, sudeep.holla@arm.com, 
	Dan Carpenter <dan.carpenter@linaro.org>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 5:36=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Sat, Jun 14, 2025 at 07:53:34AM -0700, Marc Herbert wrote:
> > > the kernel relies on this not being "optimized away" by the compiler
> > > in many places.
> >
> > I think "undefined behavior" is the more general topic, more important
> > than null pointer checks specifically?
>
> Is this really "undefined behaviour"?  There are a lot of things that
> the kernel requires for a compiler to be able to build it, and this is
> one of those things, it can't do this type of "optimization" and expect
> the output to actually work properly.

My understanding is that -fno-delete-null-pointer-checks changes the
language semantics so that nullptr deref isn't UB anymore and instead
becomes a guaranteed crash.

Alice
