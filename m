Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7944928030F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 10:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749551919; cv=none; b=H9LDQDReL68PuAH2ipNzrBdd+VzYABgodqshuBmXLrHglr4PQrENLisU/P+95Zdpl5JjFqU/JpTc24UaTXnQRGsEi5j+UenvOJ4QT152B+qpOcrmu4RoUpjfmaEdicAyjVV+jRy36clmPH1Wo+35SScwgtRZBn88HfG4RL0M/TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749551919; c=relaxed/simple;
	bh=RtnMrmlXV9IDEuAe0xQcKNhw7/57Ldi7nJ2CsDZvIAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rnN/EWERIm311JjYYqi9dar1Tg9K22Wpees6foTloiU30c50msLYbaiWTBPVmkEXzLtnA/VMXeFGNoe+lnqf+oDpigLoiuH26ahZDKiybpf4J/2dG17j9jZ52pcNcOj1iHP8Yhky5f2FKfb7dQA0kLOqtY5bQMpdQWp/DeAoJnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ls1ObZqB; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ls1ObZqB"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b26df8f44e6so5287299a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 03:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749551918; x=1750156718; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kXIjHn7dVanx/dh81apv7WxrCAGv0rouoOBBRWo8fJs=;
        b=ls1ObZqBfoxEafiiAoRs4Viiowa2d76sy5WJIukUbGDOIK3bvdp0EoYxTWXHzNS2Dc
         7TGdF6aL/8ex7qvc6bnSBTqDmaibQftspx7KJT34IJYyR5biZeO4DmWhSTqWSz8CA58g
         MyQB3B7+hjuQqza1bnVFIsTFUyWO6c9eyGTLiRuhjiCn4vJd0FqrjUga2XoX56PWpj5G
         wd9rgoyAYeFIoelk4ndyx7aNzxW763TyjNUAFKqGHwiC6QcIqNXhwjrup5LbjI8Ima1C
         quYHOtasy133AaO3NTuH38jzagiYAt0NJkUUVyFMGO4LFQC+LQP7r3+53WvzLdwC6v6s
         48Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749551918; x=1750156718;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kXIjHn7dVanx/dh81apv7WxrCAGv0rouoOBBRWo8fJs=;
        b=mn86RI1iKlg6hhf8ybvPOw9kpeNwwCXQdzKqL8ygNYGREofaGg2cFmk6E4hrXelLvq
         1YxZhDO5KBWgM9IQz3wb2AZqG0RoJ7U4+jIHyYKYEhNVRFKs7XuEGa40/80v9opzf6b+
         IjR+j+qFj1kNNrZITqr3u5LeWTK05jOxezUIQPYwiBcVPjy8j9D9w8YUik/X3ZiOPtBz
         FvvnOOzPrkwouoetUJa4nAQVPDrXPuy+uecKf89HtZdwjDZMcWJKedbUinWbw9KQmhaI
         Bck1rtzhagn44ii5G8SuAkqHoIKKbsHMTmr+Z2TdYq9CEZn1+0QJ5YXNw2G42nwX5eRX
         pOpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpNNaoQX9J3WaR+TF3nYpLqppdLzHYfeYDqU7axoO3Ydp+65jTOFArjAjp1fK3vBSVgyF0EgKFtnbi3ng=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXPdy48UR02HZZq9JSQGTL0IPiCVBwZlNMuCH+DSaxJSys6LcJ
	3XkkX/CSYgmjjnWuOAj7cjFg7tefKNd5lOwnyNFRwcaQOS84NxHwjS/JRTjbF5tmR4E=
X-Gm-Gg: ASbGncvDwZCGVE2v8xMh4SHJMJ1pt9RdIfgSHVXh3PADXNXg3ti7acVIKaGgm4sT9On
	6TbXLZ9Jff6M0bFES9k4xP0srOOpKwDIuJCNdlSxlgMiTgaRPQ61ivJK/+jlK4FEehYtl50aNFz
	rj/yR/cIZJGk8XIkL/HGUOnAsG9wgY1P686+c0SwS0Y9Ixk5CMZU0UkNDbB+1yS3CsURhyaqd6t
	zvbYRPlH2hkByYDeFy2J21tK4OHZJRPweyQMy5NRcSlGM9Xoh9hZHCzrkLebVnq1UArx6tJZEV9
	mSWAOuM0QRf5eZtrikp4XiF5vp37QmXcZYLdVF49hm/ksaU3KUXauC+wHJT0p88=
X-Google-Smtp-Source: AGHT+IEYxgFtuUO8rprFJtHGGMBI2ccjNlWeNIyHcQi7l22B1BFH/M5F5SPjP82SwQlO1/YYkJuhcw==
X-Received: by 2002:a05:6a20:c991:b0:215:dbb0:2a85 with SMTP id adf61e73a8af0-21ee14c3a23mr26299879637.0.1749551917806;
        Tue, 10 Jun 2025 03:38:37 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5ee70730sm6573730a12.22.2025.06.10.03.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 03:38:37 -0700 (PDT)
Date: Tue, 10 Jun 2025 16:08:34 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Yury Norov <yury.norov@gmail.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 1/2] rust: cpu: Introduce CpuId abstraction
Message-ID: <20250610103834.iqwuozp6mrgz2i5v@vireshk-i7>
References: <cover.1749463570.git.viresh.kumar@linaro.org>
 <f10910c7585f5556869ea6f34b64d4136b8d5581.1749463570.git.viresh.kumar@linaro.org>
 <CANiq72=WpuGELzLbH-fxdOeJy9fiDFwatz6ynERDh=HP2z2MBw@mail.gmail.com>
 <20250610100025.e2jadqzlmimyq4rh@vireshk-i7>
 <CANiq72=dKx22CksQ_r7XuTrufTCh8ty-aAicPwFX62Q4JeAVTw@mail.gmail.com>
 <CANiq72=uZLZ-ddUpyhPA8Kn-4DRKDgYT00wzc+zDRLOX3kv+dA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72=uZLZ-ddUpyhPA8Kn-4DRKDgYT00wzc+zDRLOX3kv+dA@mail.gmail.com>

On 10-06-25, 12:21, Miguel Ojeda wrote:
> I meant "for your files", I meant, sorry.
> 
> i.e. it takes some work to guide people and help them get their patch
> setup right etc., so it can be often quite more work than just doing
> it oneself. So it is understandable if a maintainer doesn't want
> those.

Its perfectly fine and I am available to guide them and review patches
:)

-- 
viresh
