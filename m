Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594EC14F98
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 06:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750315539; cv=none; b=NVAgLFwp30bPZwJCWWmyF5WM58GDZccsIo02J9Zt89+qYa+K8V7P8SMuf3SacoFbTPXjQK9jFd0m3LfRCexiJk8gX3LBh/JdziF0znlQC/yjBtRVA7mRBo+RNm2j53pzL9qYYuvhz3DccCW+CCR2JpNWS9WORemYKXhtLXCVLe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750315539; c=relaxed/simple;
	bh=+eaXs18pbIdN16VjbFQKb/82Ep6y4XInUcmQiPzMqeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MPXjBj8yFgUdkf9QjWFeEIpAUUhajI04TLzH47dmc9Plro3Zq//K5fiq9fbKX9b7B4LpIDgxEJcbYAmhQ9HsScCkJPBtJ3n3hmk8eT2GuVL/u/nxtWDPmcoqYb0Pzx2LEnAaZl+rRm9Wpv9VQBC0XSIclCgsdX/uFpEXyy2NVHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hkoKGdU1; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hkoKGdU1"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-748e81d37a7so278223b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 23:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750315537; x=1750920337; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ErliHYPaGrgVEE/NGmtD/hd2ZJlTMAp3Vp1b/8FHHgk=;
        b=hkoKGdU13OY4Iw/aWO1ZtDgxoon4Us8wm1qV3TZ9LplmxbdVY33OJKwNJJM2wm1Pzz
         MYTMegM8u4PUVJGfznIDDD59S4u5iMOpl+uTZmlDi1YXAyqXLuVBIbRfCNTAGosishlK
         3MJlqu7Jeh3Mlu6rscioaO31Zf3OUTVQHKayN6l8cSisHRg7ry8ubOFK2dJ2bFg+e51i
         GElKWybjkIc/RQnXHgGDoU9v0Ao7Thr1Jm7zuAMseQX8lQtFOx/zbBg5K+JNVbLIByvh
         iOXMANgTgbQ9JXS/hkHHifWyvPLw6xltX37mK5Jv9e7htqHX/Th2wj3CF9MFN6lcIpcU
         lfNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750315537; x=1750920337;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ErliHYPaGrgVEE/NGmtD/hd2ZJlTMAp3Vp1b/8FHHgk=;
        b=I9qprPmYvBqZIq0iaXzhILW8zrVKhqfc4fxb+bHVzTplb3R3yjiRRaXFdrWSxy+xvk
         S40mQFLnyBKbqaMmVt3VLSsDtRmchgy7YGZmYj5/PAg7z4zhqTDdCU/zZk6dWwA9aov/
         +5sOb+TfwZ1LCIqzEakKPEMaST50mmdFErMGlVbKpAvEI0Pv5KuNVv0s7FbNWtLjEjpH
         qpH+WyWS3J8h48O+jHFK2tL7gJhhIFMdG5FlgOzSej9udDD/+mRVlxphZFl+tQUIU+UW
         8Xkge5B8l6I6tQCfBIRwlw7B5Jsx2zIIdryZH2K8N/Ih+gvT//JPGTnGMBdACbajDu+4
         9ayw==
X-Forwarded-Encrypted: i=1; AJvYcCXBE68DVaQPMj2JSrmFwRFWJrI3g1Bn6HhIO8o8OamdbI/ON6u66UIdWqLzkfyDgpQjfDMDaIAWSLbWhI4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhMcBkFyA74XpkLJx7MKomVY0b2Wro9z24yN+k5r/s+Ri6TIUC
	sdnOC4j4V/BUPdf0j9rFJcRcZJ6U6ABQqEJRN6eXkGSfjmxfbv+sN7ZNgqyy2/+ZEBo=
X-Gm-Gg: ASbGncvjKfa3lyZXBrh2PlvW8EJkHaeQ2et/R2K2OKtc94bsEVJ1YWW9xHjG87Tw/u1
	LDQruLE7ln3FazxXyXcA2MkEasAW4GHjrPccpwecGQZZvaS0+Y9Lf/AEbBItcRPrwkGX+cEOpG9
	2H5xLSirg21XHz7Sze/JMvM9Xj6ymt4fE7++jGnL5HfDKfHInYrwQMuxPBBwG0QRkNNGr+9iVwe
	lcNrx95BnHv3IrwYU0C24lpzwzRWXIsxhxgGESF8MSf0tltJIK5soRXQQbHh0LAjCBeZxPLjs+/
	pCtBaRxXh1k4FDakSBiaGsnh2vtrVAtZ0VYuz8dzebGM8QguQL42MDN7AUwVPBu3KmgZJYEiGg=
	=
X-Google-Smtp-Source: AGHT+IHIpRyDDmSazg/HxBTkiTvghcwJZ4JLLCka55/2JHWzaYB3i4/iq5jFfG6qzHy4OHiMpdt6Pw==
X-Received: by 2002:a05:6a21:6e4a:b0:215:dfd0:fd24 with SMTP id adf61e73a8af0-21fbd634a22mr33361216637.31.1750315537600;
        Wed, 18 Jun 2025 23:45:37 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe163a498sm10335555a12.15.2025.06.18.23.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 23:45:37 -0700 (PDT)
Date: Thu, 19 Jun 2025 12:15:34 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@kernel.org" <sboyd@kernel.org>,
	"ojeda@kernel.org" <ojeda@kernel.org>,
	"alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
	"boqun.feng@gmail.com" <boqun.feng@gmail.com>,
	"gary@garyguo.net" <gary@garyguo.net>,
	"bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
	"lossin@kernel.org" <lossin@kernel.org>,
	"a.hindborg@kernel.org" <a.hindborg@kernel.org>,
	"aliceryhl@google.com" <aliceryhl@google.com>,
	"tmgross@umich.edu" <tmgross@umich.edu>,
	"dakr@kernel.org" <dakr@kernel.org>
Subject: Re: [PATCH] Various improvements on clock abstractions
Message-ID: <20250619064534.nipg4rs2gwepxqw2@vireshk-i7>
References: <20250616200103.24245-1-work@onurozkan.dev>
 <CANiq72n0v7jinSyO85vorYRFB=y5NH5roW4xLRjwZz+DFJ5QSQ@mail.gmail.com>
 <42151750134012@mail.yandex.com>
 <CANiq72n3+qzDCCf0ct-5gtQHKXDbT2rr1fgxVQP4qBW69JmmhA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72n3+qzDCCf0ct-5gtQHKXDbT2rr1fgxVQP4qBW69JmmhA@mail.gmail.com>

On 17-06-25, 08:55, Miguel Ojeda wrote:
> On Tue, Jun 17, 2025 at 6:28 AM Onur Özkan <work@onurozkan.dev> wrote:
> >
> > Yes, it should be "Onur Özkan", sorry. Should I update that part and re-send the patch?
> 
> I would suggest to wait for other feedback, and then you can send a v2
> if needed.
> 
> > where my patch converts this into a single straight line which I think makes it more idiomatic.
> 
> Up to the maintainers :) So far we have both styles around.

I am okay with all the changes, the commit log can be improved as you mentioned
earlier.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
