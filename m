Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA0B1DDA1B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 03:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749698025; cv=none; b=METvZHTc99fI4VWJo43kH8QthnTQ0w6R/Rwo4stBwZf1ZUi+XdxB9xo2lo6JRG6VwkGM7WnHLQA8+xC/Gm8DqomOoS2wB7TPAJRKhBYPeqM0kE46UD1EzilUzsWvkJepLUqRh8dKm/OHGRzrakE434sZl5Mfin+TQ5Oq4XukFsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749698025; c=relaxed/simple;
	bh=wipVe6P4oFp3pGcagZmYLUGTje+r9xdGOuVBYiEo2Xs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mg85SMKs6V0VpkgsF0RDlmkAM6SSiq6FG6DGJFQUzaJ/VHRJeWVtw5IWL0C6xyYo8C72TEmFpQgfQ5B8aMkTdOl0WmBDtYKLJmhHydm7+sNLp2Hh7h/xWTgok5tPn9X590NMiV6cBMj87agUwnYFy0YtUVLHfsVsC9v5yC8rBRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GCRGhldj; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GCRGhldj"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-747abb3cd0bso1180837b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 20:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749698022; x=1750302822; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qh9i9vpk+Guo8j4fjmcragl7ZrjyqLwr0bzeHQ2yACE=;
        b=GCRGhldjaPrLZS+HBcr0ogcZKsT8/N0+i3Aw7DSwNuiMFQEIw+9qagiMrrJk80CzbZ
         T6ehZ66csI+aKQCtFkC5Z5Qpz6r2yoCTtAjUdNxK6bSOHDnyIS8I4FDdgBp4vxISa3AF
         aL1+weOMKIUeVs7phtbC5MkH3gyNJEI/n67JFB/xrx6ceIGPBnKGffCj2kEL/quptIfH
         P3kOs13RUvtafVZbvVfkveKydX0YGAXv6hlMJdsaCGy9aLjklWzDWTzjKdcfoxJ3F4ch
         TMJXe4UuMnStVAiLQakFWkgtCh4ZBMrLZsx4/MvfwqSLHOvIvqDG6Q1p1oomFX0DkcTL
         6m3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749698022; x=1750302822;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qh9i9vpk+Guo8j4fjmcragl7ZrjyqLwr0bzeHQ2yACE=;
        b=Wl9gdvHZDP7hNHw1GLnO5O4XiS1VmlEtf6E2tzro7Sq9xI5nVSuLkiJL/wg/2eCzrT
         dMDCjuwZoZI1YOukw3V96e9PFkDDJDex/+IdIyjDGkchmdvlouGgnoZj59Fmg2SrKXnQ
         epAp6nYCVzPf1FQirO+H5tRJjhaP/P8e8ArVnU5ET2XdBeoilkPAV6ELlh+/5UQ5dh5k
         xfOJGCAy3ylSHj5ciZGg4i/jG0x60X+u+dZkomkY2upkp/FH9v12JD+a9ZStyH5Cz7R/
         udMsWIytv9qNAJw2mIMdwCIGRfLfdPXFqnesyRi9Ij57KZDqOpPm8m3CjB37yrKCHL5y
         PVFA==
X-Forwarded-Encrypted: i=1; AJvYcCW+fUiRgRVcmLq5sjJ8QdPUli8QtcxK/e7/zL7L5ORgGUclgXuUakNrtD2oMXuFfvQglni4skcdg4JSxks=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfw5gBn7uZZOl+ryuunQvcAM/seH4svjxF4egHl3Jk8Rs+VpcM
	GpF+33j/gVzh9xqja2mUnvVnjiJ//DK79WwE+WS2IEi6C39CYr/WeICNNOlUpMF2rJg=
X-Gm-Gg: ASbGncvnL8hTAT5yuZRMBnMjzEKJZ9p/J4h6SDDNrl+WGoPMJD5qdKwnsCNHBV55IdT
	p3KwQh+Ryjx5rKke2WGrlxJmoJW+bFCWrRD3o9ti1b/7dfRivwIxxisbRjT9UY3GxIX9wBh0miH
	O27yFMLYq/bg/OiviAb8bYtP/1SOtakE9bQeD+RviMlTnLA1e/8vPohjFaOfuG6CdzM0d2dy03I
	mLKUm1Bv3VT7eJXJE0MUEzaNGqcnjVM7LHOzDS8KN2ga0Gy9v+fsVz9CLhZ4VKojoLN5RqCgYGk
	PMk+0D80DlO5NPcRIZ0XJOoHmEZIvHYZpiIIUHkbq4UmQ66DQ5Wk6V1lNUFEZ8aif5qcg2xiXw=
	=
X-Google-Smtp-Source: AGHT+IEx4FtddVmCwIprRBbPQw/iieDTdTOeoPd+4mASwm8d54DrSHbf3paRrZHlzISXauRykvkroA==
X-Received: by 2002:a05:6300:6d0e:b0:215:d64d:412e with SMTP id adf61e73a8af0-21f99106bdamr1479819637.20.1749698021896;
        Wed, 11 Jun 2025 20:13:41 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fd611ecb2sm352591a12.16.2025.06.11.20.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 20:13:41 -0700 (PDT)
Date: Thu, 12 Jun 2025 08:43:38 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Remo Senekowitsch <remo@buenzli.dev>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Dirk Behme <dirk.behme@de.bosch.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v8 3/9] rust: device: Move property_present() to FwNode
Message-ID: <20250612031338.rlkwize5xw6nr22g@vireshk-i7>
References: <20250611102908.212514-1-remo@buenzli.dev>
 <20250611102908.212514-4-remo@buenzli.dev>
 <aElxv3hRIc6Z_7jg@cassiopeiae>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aElxv3hRIc6Z_7jg@cassiopeiae>

On 11-06-25, 14:08, Danilo Krummrich wrote:
> (+Viresh, FYI)

Thanks Danilo.

> On Wed, Jun 11, 2025 at 12:29:02PM +0200, Remo Senekowitsch wrote:
> > The new FwNode abstraction will be used for accessing all device
> > properties.
> > 
> > It would be possible to duplicate the methods on the device itself, but
> > since some of the methods on Device would have different type sigatures
> > as the ones on FwNode, this would only lead to inconsistency and
> > confusion. For this reason, property_present is removed from Device and
> > existing users are updated.
> > 
> > Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
> > ---
> >  drivers/cpufreq/rcpufreq_dt.rs | 3 ++-
> >  rust/kernel/device.rs          | 7 -------
> >  rust/kernel/device/property.rs | 7 +++++++
> >  3 files changed, 9 insertions(+), 8 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
