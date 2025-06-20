Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED7928033F
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 09:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750411224; cv=none; b=MfqpMpfwDGiVljBbh+Vag2CPffbh6eXJiovtrGm/SS9kRyFTKQnEdghNFO7I4k0rRQJocPZrK+X/A3B+v205CF9jCuUIaD6OEGQWgGizvpBxOGEL/6LQfVkWsP7ZUEChGW+ZH51EEyc1bAt8kxmpKEGhooma5z3EliEXgeWxWNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750411224; c=relaxed/simple;
	bh=mZ5vhEEnS31cSdEN8193qbJmhpsPbTggj6HeS32WJVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EGlrUdLHBhmQnW29ijl7UjjzOeiPWvemp43wiTieL0cyWU6oLjgCLfircSE6O7u59sMBhuMC+ViDPUPWMznJjMjgt5V8DRMyUSOb2ybU2UsW6D5G9tnclJtvDiA8XTpP2JjOt2mIOIW3u2hCdBbPMDRvOgFV0qT7IAotOBUfoSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X7M/J3Um; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X7M/J3Um"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-451d6ade159so12105015e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 02:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750411221; x=1751016021; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZ5vhEEnS31cSdEN8193qbJmhpsPbTggj6HeS32WJVU=;
        b=X7M/J3UmmjlvgncqVfIVgg/xzZ6W0Q8RvB+kCtrzmk9UEe3z9PSc9svd/7JTsMq3K1
         tDrc17g8bKSOw1WC1xHKOhGYSthMwAG+OcN1YN4Hq2BIm6simLJY8+8okc3joacD2p2X
         BOy0ilKtiPcxQHW73dNKdOQfIt1MJPEDcpsbiTEfJXm6F8t3f7WgrswFNiGpK9mWEPv2
         jMXlV54WBfqGV6yPV1/lszdm+QNOQ24AG2m9XHRfoZsTS7e8PlbG4PSRiqpn3iLcfCKk
         DYO2KvKNa9y3BGHBp9Zw20YsuRAb0FlvfKpHhNbY1kzKltc8dzR9LjTlPF9z7VjzSs0X
         OtPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750411221; x=1751016021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mZ5vhEEnS31cSdEN8193qbJmhpsPbTggj6HeS32WJVU=;
        b=KPkkfTd1VfvVAy9ZIQESekRSl4o77kWWSGqF+78Fw0++/4gsDlCYPs3K1SLkexoQkW
         Y0sY8eImZtcasmRCe77ZyF7zi8UooroE5kW3kjCfdDnM7ryT8aDDJCi9t+N4fkKflmr4
         4Rxn4ffph5ZJzgtY7IzuiW2EB1SQjKDyqTlTQVy+GPtc1ScUCIlKIIcavf2L7OZQL96u
         Fk7JEXyBRbaBP2PR/aWZTtRt8N0l4EN0JulWhKIstVAtmjt9ue5BFCl+o6GuUzOrbyuP
         96LNMpC4Uji974tkntvc2HpZceA+bNwV/FG8dJRlFwsdCa5YuP4gTJzfHnPFKcr7gY/p
         gLxw==
X-Forwarded-Encrypted: i=1; AJvYcCWKWYpOT4gjAOrE/kR1wFXGmubmhdam4gBeZkjDQ59Yb9HVeL4ptXCbvFgkfv7PwikuMBYlmclGLq6THok=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWN92GpNO7Y9kJK3C90xoI94c8iRzjK//zWx//K5pFO4ssjtR7
	HbHxKeSDn1N2uKEKCN3xU19svdmdH3h1C1mwlZT3JFqcbSx3sj2qtIGmXxCiY9398atGYA+02zj
	7UdO/WIBe2HnF7YVYFbPaRGPM1mKT4BYrUPPpBdD3
X-Gm-Gg: ASbGnctSGAUW51vGNABtUHTXPdPymzQ0ALwat7kimHZo9n/RaCGW8bxD87J5hBXKAuu
	huM5wFJswTQdbANnpPGGDjQkKO2H/Zo8XsNQteB3qfgijQwtN6xC1mnH1zq8d9iFvGGrgngb/mS
	pCgAsxjETBFA1/oXzkM9f7JY5D//l30HOIW4JBERMeAYwf84tTNWxeIWAGuWQ4wUYPNGrfTsYA9
	g==
X-Google-Smtp-Source: AGHT+IGOxu/JyT8LKL4rOBc+Bsq5zNd0RaoYbcY7WBLcAPcbTS+9Tu0MnTso5BqDG5xDYUQ4UIo3GUoxMrDuhykIYPE=
X-Received: by 2002:a5d:5f8c:0:b0:3a4:eda1:6c39 with SMTP id
 ffacd0b85a97d-3a6d12db6dbmr1837913f8f.13.1750411221085; Fri, 20 Jun 2025
 02:20:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620085229.18250-1-abhinav.ogl@gmail.com>
In-Reply-To: <20250620085229.18250-1-abhinav.ogl@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 20 Jun 2025 11:20:08 +0200
X-Gm-Features: Ac12FXy-s6NWQAaZ_bmMiAF99B9M2tvOKWO1ll0w8OfTgwH-nexB-TDc0pyPKqU
Message-ID: <CAH5fLgi-QG2KRt6mAiU3P-tyVG_xevPzB6VK_W=is2B+7=63kQ@mail.gmail.com>
Subject: Re: [PATCH] rust: cpufreq: use c_ types from kernel prelude
To: Abhinav Ananthu <abhinav.ogl@gmail.com>
Cc: rafael@kernel.org, viresh.kumar@linaro.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, dakr@kernel.org, linux-pm@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 10:55=E2=80=AFAM Abhinav Ananthu <abhinav.ogl@gmail=
.com> wrote:
>
> Update cpufreq FFI callback signatures to use `c_int` from the `kernel::p=
relude`,
> rather than accessing it explicitly through `kernel::ffi::c_int`.
>
> Although these types are defined in the `ffi` crate, they are re-exported
> via `kernel::prelude`. This aligns with the Rust-for-Linux coding
> guidelines and ensures proper C ABI compatibility across platforms.
>
> Signed-off-by: Abhinav Ananthu <abhinav.ogl@gmail.com>
> Suggested-by: Viresh Kumar <viresh.kumar@linaro.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
