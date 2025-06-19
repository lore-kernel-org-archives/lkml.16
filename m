Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E1821C9E3
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 07:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750319970; cv=none; b=C/tQs3hU5HtbML7R91zBkCxDAm50ok9FjQmRO72S5b2tnDa//E2dYm84hzHypjI9kCr4G7RKqraAmOr8wiqWJcpHN2w6f8US1sex13ESzQc33cwtr/V94vqOgiYKtQFAdt81ggg+vAlY179wvQlzxUtqaW2nKSltNXax09QVH+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750319970; c=relaxed/simple;
	bh=qmTIT7TE5o1AMakCWk3TpcXBKxAE1s7w+sHy2Jg1Ohg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tZRFxAWHGUpNruUCQcchyNOUDshOLQo853r27M4uWyOcU9ZQsgvn43ysSRVAu6lRgNPJHIjKEvIbEX9lXwnqs9yHOkiQiWdjL/tQ/kvyw5oLVwpN55Qxvh8UrrIO/ilT0DPHhlBeepYk0ZZl00BBXnR12TYVFByVm7Uvfyb1e2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JQbawT8v; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JQbawT8v"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-747ef5996edso382662b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 00:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750319968; x=1750924768; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cInoigfZTtwglkgDR0xmxDXjKijNgKERgzu95Txxg1s=;
        b=JQbawT8vXjHrPpgSDiE1rFd2j3uEEi2DZDhzu88zYO3p+PlrjE6vhHDKVEsEQWUVMJ
         x+d15zGQnG6RnIVCxnTDYczGQygUO7tM2sxWQSCZuZIxbvgJIoIopgUsyv7XF9uHyHOY
         /4xHhVxUQfdMFX2ryT8mLwsh+PIm1Kj7ut68LllZCgzSY9yTF8+x5UC7FDyqM0fD0INi
         h3BaUmQvk1fS6bBdpbdNYEmPQxYbKqkSI0wEh3byA/Iq2Wf0ajZJ8OGptrLMlU8w4/ly
         YYtEQ9fqQs/tjsMuVT7aidnMegCf3Ns6Mt9BwJS9nmzJ5dbPQubeK+96JusCVNMH3tYT
         Ovpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750319968; x=1750924768;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cInoigfZTtwglkgDR0xmxDXjKijNgKERgzu95Txxg1s=;
        b=vVoL1cCyZea+YTii3Y2PUkuvFHoazjMDCKbixozRUAw/opNfVot3Wb3/dyQLXg2Ue9
         Ym2Ch7CM4pZoNDxGe1oevgew/aBJ1tdlBgdQlermCri5WBhvoyrodlb4ZajFC8AnRKIc
         +JCKRaxoKAnJjoF0kdaTRrhIRKi0l8J/3oQJ3+5mjO+nyjAzt1jQKMzqbEq3jkphWKuB
         IybJzyW2h7HmvZXQm8fI2+Fvl/kgWbBmGpmxJ5wxawS5Iin24R+kTNnddX78yxTcWwl9
         Dpe1D1fX/vitfSXJ/NF93I87KD+3hGDWRu1dKOPqLUlFStf7Yub7DjRhlbsB6u05RKyY
         E5ag==
X-Forwarded-Encrypted: i=1; AJvYcCVfT2WSEblqwj2dBbFfEKI4hn5Y0CXDsVhX8D2zELzl+yenv+LoygNtSa2013E8eE9pMVSfJZHqKr/jpbY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe9uRCSLnf1hNcfy4zFVbor3wVPUuUWp0DGrbM60/LddTi2Q0X
	VFyaHzzgmW7Qlp6nSucswvkxATeZhN5Ax3prrNMtu5bcaAz2DJkMnVrHQbXYZahJqjg=
X-Gm-Gg: ASbGnctSXIwkzHXsrTK8PLTuie7RyVyhyN6o18TIM7K8n92bkL/t87IJL/ZCLoIHWL2
	vGOk+T8mAWpdASkrdJtE36jxOWi/V7F9QKYs6Jvf4s0G1eG6ASdV9Z7W2uU7j3lHBkVvM/Anj6L
	l/efosuYGV9W6dx68cYxN+RxevkxREBjfAA4jqaZczYcv3pc2Tm6zFnR9egWLzwF12RdmP/8Y23
	9PLXDPazttRsLJ+LDV3Ps4jI60byO76XppwMlMmG8hBvlbO7s3XGR7PB3LVWG1ljMyftiR/f6mA
	yY8kk2u5/1AApytrHSZtpOLsWLM+t4GF9fkXVhomDKKsLIZUU1Ntdz+n6x5MErk=
X-Google-Smtp-Source: AGHT+IEHfU6bbYUYkS6wqhh+4RphCH4wKMlMEHQgk9iyWb8pXPgDQPEQZzKXARvmNYDg3J/wIX8yOg==
X-Received: by 2002:a05:6a00:3928:b0:742:a111:ee6f with SMTP id d2e1a72fcca58-7489ce3cd70mr22825218b3a.10.1750319968295;
        Thu, 19 Jun 2025 00:59:28 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffecfc5sm12951000b3a.13.2025.06.19.00.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 00:59:27 -0700 (PDT)
Date: Thu, 19 Jun 2025 13:29:25 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Abhinav Ananthu <abhinav.ogl@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-pm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] rust: cpufreq: Ensure C ABI compatibility in all
 unsafe
Message-ID: <20250619075925.b2s4ngza75kc3dsj@vireshk-i7>
References: <20250613101815.18092-1-abhinav.ogl@gmail.com>
 <20250619065713.hm5ye2uhikaei2xo@vireshk-i7>
 <CANiq72muPYoPGLrb7jYWMqbWgknMuWJSPMdFPRQMFduFsDTs0Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72muPYoPGLrb7jYWMqbWgknMuWJSPMdFPRQMFduFsDTs0Q@mail.gmail.com>

On 19-06-25, 09:32, Miguel Ojeda wrote:
> In any case, from now on, one should just refer to them directly as
> `c_*` (please use the `kernel` prelude for that) -- please see:
> 
>     https://docs.kernel.org/rust/coding-guidelines.html#c-ffi-types
> 
> I hope that helps!

Thanks.

-- 
viresh
