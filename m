Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E411F03FB
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 05:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747631543; cv=none; b=T5IXDO4ypuoFzAEr6JgdZGyO9O36ELgk15+gvxDJ3v8b0hzGvcaarsTrrdvPiFEOa6v9aqo53UhO8MsJJWmKXNLux2I949ndMt6T+h/mwmR8P/kWD8Cwyx6iFZxUSPG6ucowG5CEGma2n0/7etvJsss0O1VBBJb/BfUu+E7fV6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747631543; c=relaxed/simple;
	bh=YREARJL98nMn8x0h6I7v+KTCGPwNBPRJT3dvhaSnBAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=luEXJhPeCvoTgyucVIhA/N/6xblBtGoRwBhVTeweOo+pmEqnrpC50lchQmDmqOnTHWVcZ/fyDu+7rARvDl1I2BUSTNqxU4KNwjPGESYPWyi/VRtWmu+BOjfEbEWv5e6St1vQmXCIZcxdUA1krZx/cRPHXD9YhocGaPES1W+rZow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K1fJYvUo; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K1fJYvUo"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b26d7ddbfd7so4103991a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 22:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747631541; x=1748236341; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gYGQbDlVIPyEa7xs1WPDKLP/YgeKrN15Sc6vhyvvkpU=;
        b=K1fJYvUosTAhlTY2ECMk9s9FMsopa4uxNMH9CI5vlUfpJaJOjZ4UP41a5Nolksv+Mu
         wZMcTBDwB0dMOZFxTIvNz0JjlXqFVe4haoYI1FM8EFMcRqRjytCW7VF7jMAgdnCGw+Zd
         J1NW8JjkzkGnvsIjljgwvVQTsKmu11SNzgWbA9A5BDAa3R+VvcPUbtV1yEV8fsmH8FEq
         zSIAy7Pbj4wFJ1xPDgtUzjQQ36G7ETv/N+LsSdiJq728PXu0SYiZa5h7bvtgz/e3bNi9
         YK7d2TBYuqqMvWU/4+UKkyvxyk6Mly7Yssk5Un1B7KzPIiP0K7GKWrnew2rCLr0DTqG5
         qaHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747631541; x=1748236341;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gYGQbDlVIPyEa7xs1WPDKLP/YgeKrN15Sc6vhyvvkpU=;
        b=LqTkEayIjxzFQSACwENx9C4AQaBbljArldQ7zDd0CtgsuD0dmjXMDukc9xqfUG23xz
         IFXtGr0jNYWQtx7ZcD4AOYUrIjvUEMHGHPtoPW7a/8o2+Kvi6LRryDtEn53aoL1xDJkd
         IkAAbTd/Fa39ml7aYKMWAkBcyouUyMJhWrv12pF+UWtHSUtW/Zn0nFnZHwpcpB4ylWWe
         JoIeO7BIiVMQ2PCTEIbgctm5GBkUS0Jp1MklZh392349M75PS3svm7Ejd9IUKZm/5alk
         7OsDPs5lqPXB/vD2pt/ZAaKaP7AGeuMGJJFKtMbA1zxNPGrekP8xaLeS/Uwn+2GUibCh
         Zsyg==
X-Forwarded-Encrypted: i=1; AJvYcCULHOlVKEXRqdFIf0PityqWcegdk5wLvJ7fViH3HUrCCgtCTW4YfgxsbrvLrq8pqdesNBdyySARYqdXeHo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdoXh/2ZZ1+m9CNpx618G44pusG2XMHZ+I0LeQGIjvTFwHPEN5
	6EuiJ31CKmG+jZLoS1ynpE80z5l9uKhGzyEpvsUobWId9FDCUGYKjJAl3JVPzm429G4=
X-Gm-Gg: ASbGncsvggBf17kYOzrICMAqfzY6x0EGrDXVCLlCR99sUIMUfvdrInK/yYhxgXNNdR8
	hHwJ/vrMwOARJxz0FQ26eC1xCzqGi8QNi8lqn5XKAs6CG34chsVDm7MxdBtsG4Z5TcDggbLPDbs
	5YY0J6eGQRMdDd5XCL1iU/FtN7KXlCy6nka5SYDGGFyIa8Mq45bylTf7RI4Bzrg6kYZ0uUFCYvY
	wauJwiSYq0Za1pOXMR4vW7akej1NiSX/Cg0XCswwG1/jGAcPKYq5T3Kj94mET6i+Squ5+1e/ujQ
	k5YhFrWZrgsGDAe2ysjkKsnq2S9F69Ma3iK62intieR9KKB9ldTM
X-Google-Smtp-Source: AGHT+IEreJKmg3dlWZ4j347XsS/9PUGaSzSwWgE94zxhHw42bn9a5SbwwrfFutiaT9FgmTDVKLHP/A==
X-Received: by 2002:a05:6a20:6f8a:b0:218:c01:ddce with SMTP id adf61e73a8af0-2180c01de06mr16043557637.40.1747631541346;
        Sun, 18 May 2025 22:12:21 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf8a199sm4560811a12.33.2025.05.18.22.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 22:12:19 -0700 (PDT)
Date: Mon, 19 May 2025 10:42:17 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Philip Li <philip.li@intel.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	kbuild test robot <lkp@intel.com>,
	Andrew Ballance <andrewjballance@gmail.com>, a.hindborg@kernel.org,
	alex.bennee@linaro.org, alex.gaynor@gmail.com, aliceryhl@google.com,
	anisse@astier.eu, benno.lossin@proton.me, bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com, bqe@google.com, dakr@kernel.org,
	dakr@redhat.com, daniel.almeida@collabora.com, gary@garyguo.net,
	joakim.bech@linaro.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux@armlinux.org.uk, linux@rasmusvillemoes.dk,
	manos.pitsidianakis@linaro.org, mturquette@baylibre.com, nm@ti.com,
	ojeda@kernel.org, peterz@infradead.org, rafael@kernel.org,
	robh@kernel.org, rust-for-linux@vger.kernel.org, sboyd@kernel.org,
	tglx@linutronix.de, tmgross@umich.edu, vincent.guittot@linaro.org,
	vireshk@kernel.org, yury.norov@gmail.com
Subject: Re: [PATCH V11 00/15] Rust abstractions for clk, cpumask, cpufreq,
 OPP
Message-ID: <20250519051217.clxqculya7zxl7rp@vireshk-i7>
References: <20250502070109.inpes2ou3rxx2fxp@vireshk-i7>
 <20250506101311.142475-1-andrewjballance@gmail.com>
 <CANiq72k3ozKkLMinTLQwvkyg9K=BeRxs1oYZSKhJHY-veEyZdg@mail.gmail.com>
 <CAKohponbEEP4_weUuKkOGLRj5-1oOsoL_Zu_7W_SxB61hjsSCw@mail.gmail.com>
 <aBwcWzc4zmPzAW5s@rli9-mobl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBwcWzc4zmPzAW5s@rli9-mobl>

On 08-05-25, 10:52, Philip Li wrote:
> Sorry Viresh, there's coverage gap at the bot side. One is rust kconfig
> is not set as mandatory early on. Also the bot met build test slowness
> these days and is under recovering gradually. Thus I think the issue
> is not detected in time.
> 
> We will resolve both issues asap to provide better test coverage.

Thanks Philip, I can see the reports (with failures) now.

-- 
viresh
