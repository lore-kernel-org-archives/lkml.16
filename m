Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243FD20A5EE;
	Thu, 10 Apr 2025 12:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744289975; cv=none; b=iTjyZJIYoOYTThNSn+Nq9GcJhpKzzkCE8d4sKuOmhOHpc0xmheZjdXd+j8m66/V8AomLKfsHSsJTBq1PeUi3iVTJbriBstIKO2jD6lt9u0fcjRLn+uoDuVmdFgwrJhHedhEh90kiX0tXoup5x4oyoUtB0M6XRriP7P/gH6lqJsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744289975; c=relaxed/simple;
	bh=TThZnr8GGUqTJIDx+ebwAzbp14J0GMkL8SxOdBHkw64=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=kYmqNcMHWDsgrDRxxNtYsKegmymY60zgg9IiopKfT/QLy2vEa+JirA8TWSSmC7l5h4MN06OIVImvH6R5p3CyMXlnDCgfj+6DURKhfpFI3mxVbifPCCcJDH4Ne+s1IJ7nQjcNnjW3cox+QAZiuXZ66R6THf02XR/fmixKLrqWFMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GLBHAiez; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GLBHAiez"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-736a72220edso709060b3a.3;
        Thu, 10 Apr 2025 05:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744289972; x=1744894772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LozqbR9IL9/g0fmUUEgIf2uGoH8VzwQtTCEA4Ars4OQ=;
        b=GLBHAiezkJYKTxz0eDOw6oxEchaLOB3UvlrEu4lFSyP7hqFa6r5Aw6fOQFz15DYery
         bggGpWYfK4JLyqC8NCYy5jVAaL7+DVhZwo0GZ/0Wn7t6RwYhGn7DRhxvIIBpL1qJDXlq
         F0Zc1QsAxQOOtMHGeW98tfPjhTe+Mrfs9qF88l9DVvUaw8q5Fcfkj7txaLGYZu9Ud9TG
         YEPMsERCFZTOZT8/y5x3LeqjeuXKF+D8AybeFPpLmkpP0LYNsMJwG4W8CdmwrrlOBcS9
         8SGCrDvf12LqqsfoUqfz3e7FWw3hJZLrVc2F/RRdlZmQFy5azFKxXimFzHKezzmN1gpI
         ln1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744289972; x=1744894772;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LozqbR9IL9/g0fmUUEgIf2uGoH8VzwQtTCEA4Ars4OQ=;
        b=m7PCieF+qqemxv/F/e+PnVXnRXajqNLkmnOYobOMQ5F1iorqZwO27S8dJlJTR1OeUw
         9QV1BX3sGMuFDQEXjNbREZ+K3qf4/bpztK8EnvKFg5jkXfLo36TO8WCMUdi7HwPUXLnY
         T+3P9OuZ2jNj1Mm/fMMdp+wtXkIg03VO0jxCauegzxC7oGOYzn9wRTMqjLT8FglvPvKU
         u+e7TSG+QknwZlR3CcFrNNqwRA3TTjGzQol4pbRPHh2c/lxbuMXV/RwvcVkfNiFXqwqY
         uZT6OD98OxBB2xCpHl9gDGWXchyrOjlDe+uUcuHagzTZQh7rF5v0muAzPmLzovowb1ZI
         lEnw==
X-Forwarded-Encrypted: i=1; AJvYcCU5FvaE9R6A3lMptayoJnSnYDUCopkTK63wIUvbitFO+i7XB56xjljENYrjFT+TzsKzzOSgyXJ/36cYzjVEUbw=@vger.kernel.org, AJvYcCUHZ4KzJe0gj3fW7cbXDdLCVkZSfjFxg4FAZdR3Y98OD8/Fx6aFpWHGC6z0+VIdZSbKuC1Zp/yvuEahVqc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPZylyhK0PY2tHm3VDhinVfH3LfewSD/MLy1nFHWKTEqQ0SPG0
	WrCfgl3qpk+0lE+9mSc63Dqg8P3rh5m+Gg0A8aOq7UVaKw95kObM
X-Gm-Gg: ASbGncuHOXPS0cn6m+opCKsroo2xM3xBjQPiH/QG0v2WazbrFUFBtYXSTXPQ0/pb6Rm
	Ow0vE3tXbjMoScD0b8op4wgnH5iXNGgGl8gyyAY/6hNRZC5QNkmv7sOHT8l5IDMzCyX+vo+T3Bv
	vcriyWwTd1KIvAX8so5kVO16ZljNTnazSTp1q/5l2MAz0nf2tB2DJPxwsiSdteHQ3g8lGqysBJh
	lE3559sLLxP/IBhdkcMgxFSY8/bt1Wk9M2owMrj9okMS+b6rzhy5pKH+/dzytFw1k8Iz1UVmnex
	ydduWgjkELg7U6BPKFArgw6Mdomfkp8mcdxeX9XiIO5bMAoqW012iw5b3AtxXk+xltIXoc5n+kx
	qjW1uJmQL4DoWUaQYxuqWlzA=
X-Google-Smtp-Source: AGHT+IGJPHjVd49AP1vnkkXdoNhLmWRlnN8bBMrIsSb98QO4pJ0ywmGWDK5XHRmFIFMfKdgm058ksw==
X-Received: by 2002:a05:6a00:39a2:b0:736:6d4d:ffa6 with SMTP id d2e1a72fcca58-73bbef81e0bmr3330939b3a.15.1744289972311;
        Thu, 10 Apr 2025 05:59:32 -0700 (PDT)
Received: from localhost (p4204131-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.160.176.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1d68baasm3149041b3a.73.2025.04.10.05.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 05:59:32 -0700 (PDT)
Date: Thu, 10 Apr 2025 21:59:26 +0900 (JST)
Message-Id: <20250410.215926.1864188340028703395.fujita.tomonori@gmail.com>
To: dakr@kernel.org
Cc: fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org,
 abdiel.janulgue@gmail.com, daniel.almeida@collabora.com,
 robin.murphy@arm.com, a.hindborg@kernel.org, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, aliceryhl@google.com,
 tmgross@umich.edu, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] rust: conditionally compile dma abstraction based
 on CONFIG_HAS_DMA
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <Z_Y4tuyyYIleFj_E@pollux>
References: <20250409055501.136672-1-fujita.tomonori@gmail.com>
	<Z_Y4tuyyYIleFj_E@pollux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Wed, 9 Apr 2025 11:07:02 +0200
Danilo Krummrich <dakr@kernel.org> wrote:

> On Wed, Apr 09, 2025 at 02:55:01PM +0900, FUJITA Tomonori wrote:
>> Make dma abstraction conditional on CONFIG_HAS_DMA.
> 
> I'm not convinced that this is the correct fix. This would require drivers to
> depend on CONFIG_HAS_DMA if they want to use the DMA API. The C side does not do
> this either.
>
> Instead, for functions like dma_alloc_attrs(), there is an empty implementation
> if CONFIG_HAS_DMA is not set [1].

Good point.

> However, this definition is not picked up by bindgen. Hence, I think the actual
> fix would be to introduce the corresponding Rust helpers.
> 
> [1] https://elixir.bootlin.com/linux/v6.13.7/source/include/linux/dma-mapping.h#L189

I'll go with that approach for the next version.

Thanks,
