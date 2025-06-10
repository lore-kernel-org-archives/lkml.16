Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF1428315C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 10:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749550734; cv=none; b=liSzuu0r2uYjS9HVObq+/C0677qmJsiRtKPCcr3HQMQ/klgr5bLsV7NfcVS6ekfAl+L4dxwXEui++0ajYKnX9Qcg2l1ocRXAbRN3xju0rSxUtYQYpO5BspyPv87HQIdilDU6AN+nYe3HtsF8T+m5pCUz0Fe6Ab9J/NR1z1WoRV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749550734; c=relaxed/simple;
	bh=P+pX/aqYW/tn+7GsUtbwqwHh0UwfFNgdZ9EdR9PIOm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rs2nWhn6moJZRs7ihzdvFft86E+PjAmlMnMUPuW2fJigUQA2t3ZeM8b1+e1Kot5WCGwGgUVMc869zj+t4GpjiQta55nGpZKSkI0MV4a8KVkpxfrwp33pKHa4sWT0/2PVm7pLbknY884v4NIEe0Gftd0ia/HkGrtf1tCJtsgcijM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zxhxj4bi; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zxhxj4bi"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-234b9dfb842so46584395ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 03:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749550732; x=1750155532; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xd4yvKuwBDUgL3fi5ckGjS4L+klFHNpCPWQEORhaTVc=;
        b=Zxhxj4bib0Yeu0S2aKVjyE9Yd8dUR2spgiYxARQ7Hyk37ktdzvYCIecDLwxICRC2/9
         KZB9HM5fb8ulqah+Og+ja67DMV/JrCOvBeM1ddjzhhmgxoJMnUGxG4krKgjLD3aeI3SK
         0pWnyVGIk2PWUV2HLXGrtAo6pZfTTRJHcsx1de8ApucGolcAqzjDFna5onnOb2DLacrX
         PxapJ4+VzUiBCdH+EFUlZYEzVg+JSjTO7UIQPJM6+rqnsJCCcTdXeSFyc1i2YJeioMY/
         Mu01v0ZV83SY1Jrr2k4qudY8Ve4fGgFvURWMxMyVdqJYXFPPt9BP4xYP8A1jyoyvCJOp
         pxdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749550732; x=1750155532;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xd4yvKuwBDUgL3fi5ckGjS4L+klFHNpCPWQEORhaTVc=;
        b=OekgaonfTFs+ix/NOw8RJXJQBQ7XjR7gfp9AZsE/l2ZOq3qmCO12haTjsYP40U7mKV
         7ltFG/XXKGUvmoGOScq4IAtnfBrrXC6Ur3eGpxgEApx/glLEfW1S2oOW0Mk2DVVlAdfF
         2GU1LvGYhv/2tqTdgPilAWX2bhBQyBaILv+YT5xRBoHnercgcZgCQxEZVFLqL62OrpZ2
         bpx0+3pYLTr6IXR+KjW9/0rR+0yGxmCj1p4hFGJDTX5GHHnAmLp9Mp3nozS+tHKbtvDa
         H1EO8kudcPVOHpo+M3XTRSu4rsOAVf0HKyM0FoKHj5PsobDf7GYXQxdU8QXeLeYTlcSG
         q5wQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnSP4oVEcbdJUBfiVq0TY2NGW+/nESAeQFveOXSltOQ41iwG9mhpu4yxX99xRNndZ9vbslKpdDnI5w+dA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyITzPlknpAZHoMky3DoB7MK3H4bzyuq7hGsOo94H3qsqZAYG0L
	5WuN78XsEUjKbZ89eM63CP2nTXjt0tCAvRza5RIJDh4MCI94TW8ggj+PVccp0mCKqio=
X-Gm-Gg: ASbGnctd/6VTsacViNmC2fZjTCMUbf/ZylG7urP6H6JCg0cp0PzG/LmftPiIjcSBjaP
	uOjiOkgH+bk7rjXldjGExCy9EUcYEit6a+Jsv1yX5zQZv7ITpRI7RgQkw3JoXM2S0FgRKgfkN0s
	NkQSr1CZO9yrChK7SOVyUCPyV/S/IIzVw3j99YJrzVOWlBkTFmUau8apMc/4PGRaG9SJYz8nRRs
	MBtCv2YDiTq4Y6e3tdnIYie+0ESRP/QaJWVztDCFwMfDhWcWRa6/AefDgfk/I93EUOgAtWA+9b1
	5taoNgyh2hhEYs5V0QhIRoUhr9VGQ3HmV/SOitWDZ0Pnvya1x6WJO6iKGt8xcI4=
X-Google-Smtp-Source: AGHT+IF2ajXihlooCdYmJCHgGy6pGgCT4fNV+OZVa0XGOt0sKvsGARYbwa52gflRTEuMl1+UMJvbFQ==
X-Received: by 2002:a17:902:d2c6:b0:235:efbb:9539 with SMTP id d9443c01a7336-23601cfebb3mr228429815ad.17.1749550731983;
        Tue, 10 Jun 2025 03:18:51 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603077ee6sm68294295ad.32.2025.06.10.03.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 03:18:51 -0700 (PDT)
Date: Tue, 10 Jun 2025 15:48:49 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Yury Norov <yury.norov@gmail.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 1/2] rust: cpu: Introduce CpuId abstraction
Message-ID: <20250610101849.ymuw4bmjsucsoblp@vireshk-i7>
References: <cover.1749463570.git.viresh.kumar@linaro.org>
 <f10910c7585f5556869ea6f34b64d4136b8d5581.1749463570.git.viresh.kumar@linaro.org>
 <CANiq72=WpuGELzLbH-fxdOeJy9fiDFwatz6ynERDh=HP2z2MBw@mail.gmail.com>
 <20250610060711.zp6lua4kcwi2z777@vireshk-i7>
 <CANiq72kD9iQh6TPo3Rwk7AmPXEarogUrM2fmhkDn5XNfKrr_jw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72kD9iQh6TPo3Rwk7AmPXEarogUrM2fmhkDn5XNfKrr_jw@mail.gmail.com>

On 10-06-25, 11:43, Miguel Ojeda wrote:
> (By the way, as far as I understand there is no way we could wrap
> going to `i32`, but it may not hurt to add a `debug_assert!` in the
> `u32` constructors.)

Something like this ?

@@ -79,6 +79,7 @@ pub fn from_i32(id: i32) -> Option<Self> {
     #[inline]
     pub unsafe fn from_u32_unchecked(id: u32) -> Self {
         debug_assert!(id < nr_cpu_ids());
+        debug_assert!(id <= i32::MAX as u32);

         // INVARIANT: The function safety guarantees `id` is a valid CPU id.
         Self(id)

-- 
viresh
