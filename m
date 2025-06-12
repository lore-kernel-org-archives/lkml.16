Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5B654918
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 01:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749692539; cv=none; b=fOQ/Yvw5pMVsjr6w5SfTJIMA8xybDhzXHRSzZPtAD8FbpP9FbD6ayCllpOTgoRcvOgfslDocvYpSJr5eOb/uCdrNbZ5SsBcUQD+1GBok87+02maZRSb1j+Zzc4Tvs64AEfv8zrs8/yYLyNeXhuvuSk/XqqY3kGUZr4YOvqyM+AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749692539; c=relaxed/simple;
	bh=yekqGRUYYLfu4rmZNRUCu0QzvWyE3YgMNmc+9ucJ2S0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R5IiPYg5MOIer5SodFflP2Tqts7e6R8Uz4ZDMTrn5SOLzVoGjCQCI1TQ7xTg6CX1MRqiO5KlZV7qa1nRsCyrdjtN98ADwPrShukfnN/c/vu2DnLahKddQkIWfPZ94YnVDmMbD9ZYnMj2KX7maO4fTVj2srhDXRqaxv7lZxmgEPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aS8zANfF; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aS8zANfF"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-74800b81f1bso431717b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 18:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749692535; x=1750297335; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6GMTYoO/hH1xieNN1bEgiAsAF7Z3yvr8fWaDaLPOgs0=;
        b=aS8zANfFOoewlnHoxS75gB9a2NKvfc3aVwtpEuYLvBRkUgLVdbajvUugYuQnlpiNgX
         O1vKvdtO31ytv5O8Mpv6Revr0jOt5r0H3cQboSyBx5UpHSu2FM7rNHau145oNwt24JgM
         SuPLRI3E8lOxkoeS5jsYVmwIEgpwgtHa1VWEqgKk7D5ZtMSX3gB4Cqk71BJhAsNiyXN7
         dX0Z3h29YqnKsTl0q3Gv+PLrMWZF6BXjyYldCXIP9LmhSs6CdjrHtCVjTwZqVrkYp5S5
         W+ktguZtboDEG+3XOVE7id4b+mzh+bJz//xjj3N8qzHy7CnlD4GLKsYG5jWbJ4wm3aZo
         dfNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749692535; x=1750297335;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6GMTYoO/hH1xieNN1bEgiAsAF7Z3yvr8fWaDaLPOgs0=;
        b=Ot2qZQkXCc2r2+XSwf0zNbQisR9h6fZIXCiWfJ+t5tI1vQ2mlh80uu51wz/nfCK1RT
         T9/zL4zBqDYPCPbSTZtqg7CPonMnfJKT7q0bOolThf2url4MHP2DND1qkbi0dDS7gXR7
         vZahrT7n/AAxpFHSRQjimF9m7KWfjgZ9J/CsnYcleSq0c/7v9yJL+lqsAofaDjCTuXpQ
         yAHb/Xokmxpxc5jBRDVEhI4oE8tMb91pS6o//AkQ9FtQPE6BU7oaCYQIwJJYwm19ouUS
         SGQAbQfFuPofp2GetUeSIbbOgeABEStkBhp173jVXLqCNhOmCUqWq+DYf0ITsM7/AqS9
         yDUg==
X-Forwarded-Encrypted: i=1; AJvYcCUYR1M0its1+g2uYTQ5YjPIQcCqDGwd5DAuNAVKboZC42tTXnW2iesWblwlOZcdQ0+6DXVN9TeYLLycsTc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvy7ShpWgqaXXn0rtznbpPVIfw+EmueN9xqTtoC7a/LeKyOztD
	qYF1FSAFua1Ac4XOjLV+2izgD2k7jtvnNJAEntxBrLwR4X8lCsTNWKFXMT2S87xvRv8=
X-Gm-Gg: ASbGnctWm/YZUDV9BFHygC0PMeFscswfsgas6d+kg5PUto8cZwX8Cwh4BkVUb/l/lvM
	ZLrZU1opvt5M3mPR+MAlmmqd/WYTkPcm+C9bSDAL/SubRfTfzM90ZlgKt2Zf3OLbIMeHmWigpTr
	2Vr+CvNKkQyEpMGMopq2SE/9NsOrxmoxxDnrT7tfXfNxje4wtP34iywFPVFbqXEusYw+eI8NPj8
	jNNYTM6fVNTw85d2BD0kOGjWpq34spY4T/CGnRWJS3UHpS6jvF1l5Il0Zd5GSVX77l75D9dwsDZ
	NhXvXpbIaF1Jvg6tnevnARL4uG5HX8/Q1nk6dPL9uZhg4Jawq9WBTaKXya2QSaI=
X-Google-Smtp-Source: AGHT+IEYQuQrQ9pSkTkNr1pxDJTIIU0K6qyK009mvjKSvoQj1EO38HYFTD6dT0wcT093olcResSw9Q==
X-Received: by 2002:a17:903:2346:b0:234:d2fb:2d13 with SMTP id d9443c01a7336-2364c8d1932mr20654285ad.18.1749692535270;
        Wed, 11 Jun 2025 18:42:15 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2364e7195c0sm2365445ad.209.2025.06.11.18.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 18:42:14 -0700 (PDT)
Date: Thu, 12 Jun 2025 07:12:10 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Andreas Hindborg <a.hindborg@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Yury Norov <yury.norov@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Russ Weight <russ.weight@linux.dev>, Nishanth Menon <nm@ti.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	linux-block@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH V2] rust: Use consistent "# Examples" heading style in
 rustdoc
Message-ID: <20250612014210.bcp2p6ww5ofvy6zh@vireshk-i7>
References: <ddd5ce0ac20c99a72a4f1e4322d3de3911056922.1749545815.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ddd5ce0ac20c99a72a4f1e4322d3de3911056922.1749545815.git.viresh.kumar@linaro.org>

On 10-06-25, 14:33, Viresh Kumar wrote:
> Use a consistent `# Examples` heading in rustdoc across the codebase.
> 
> Some modules previously used `## Examples` (even when they should be
> available as top-level headers), while others used `# Example`, which
> deviates from the preferred `# Examples` style.
> 
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> Acked-by: Benno Lossin <lossin@kernel.org>
> ---
> V1->V2:
> - Don't change the header level for the example in workqueue.rs.
> - Update the commit log accordingly.
> - Add Ack from Benno.
> 
>  rust/kernel/block/mq.rs  |  2 +-
>  rust/kernel/clk.rs       |  6 +++---
>  rust/kernel/configfs.rs  |  2 +-
>  rust/kernel/cpufreq.rs   |  8 ++++----
>  rust/kernel/cpumask.rs   |  4 ++--
>  rust/kernel/devres.rs    |  4 ++--
>  rust/kernel/firmware.rs  |  4 ++--
>  rust/kernel/opp.rs       | 16 ++++++++--------
>  rust/kernel/pci.rs       |  4 ++--
>  rust/kernel/platform.rs  |  2 +-
>  rust/kernel/sync.rs      |  2 +-
>  rust/kernel/workqueue.rs |  2 +-
>  rust/pin-init/src/lib.rs |  2 +-
>  13 files changed, 29 insertions(+), 29 deletions(-)

Miguel,

If you are okay, I can also take this via the PM tree along with my other rust
fixes for next rc.

-- 
viresh
