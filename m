Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A40CEEAB;
	Wed, 23 Apr 2025 16:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745427399; cv=none; b=LsB6niCLRKJRBiN14o1g8zB7o+KC0ypDij1NT1Vzp3/rOrjOiUJ13ziq67oqY8DkZUVTGXwIVv6gfDliqlMxiOT2x67Y2wmKrFR1OhOWYqSNYNlbjWdvS0pEZJX6daH8Yks35VFhKAt1DyxoZEaSNF/OymD+btPIMjoOk0qheag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745427399; c=relaxed/simple;
	bh=hW7Pk9hidnmZtQDNgmt/o9awtQ9RkrTmjYfXAKrfR4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OBseU2o4zdsjIsu7W1DYRhZT0Hsaul6q2YF0tjvAasrJygKpC7atx5UofqEU+AWTlqLb5u7kUvf2pHUnFnKI7jJiOOS0fpW6EuuhWGl4P2XIb8kCbzjzyKTcK6dlyGV4cZY3EFRjE0tCBIwOyRLehT2GmYmM736asqeGaMRePtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PAFBRest; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PAFBRest"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-30549dacd53so85666a91.1;
        Wed, 23 Apr 2025 09:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745427397; x=1746032197; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gFR+gOpkUdQbM5Rh+p84V4szSqyZ4YTz2YuAgB5+XD4=;
        b=PAFBRestu9t3LNOmJ/Fj/ZRinDNUY9vLnYIcAYWbLBAhP5GpiufbsP5jibyxvG2wYK
         CXzb4WUoXV9jsqQnicLBlfczmG0hRd/i/U/pQWT5oRCQK+vniZHAOvV6da6Q0luUO/QK
         QByvnB5ewOSqzmqGPWS1C/oGetG9A8jhVhDyY/7IcyNaJ003j0Zvz3bX0L29QEFnKMOV
         62maqVzimY3ChV/hRGP4nwsfV4EL1DXoXjMVPXvrQ65n+QBaFum7u6Mwl5ntg0j10qpM
         irxE7YQzcS8QZZFaTQHqh1czR2Dn5uoCRkh6M1cx5eJxyioYe4JmbFuyCez1XLxBPDgS
         eZJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745427397; x=1746032197;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gFR+gOpkUdQbM5Rh+p84V4szSqyZ4YTz2YuAgB5+XD4=;
        b=fpde4euCop9UQCsnAI/Sx0Vdrva60IHEyUZi/x8AtMS5cQHoQOKO+w0j2+jnPZiD/2
         kx7SrO93D4I7f188gwlXUXCPSNqClDK04XLLIXhidLXrgWoLlZYDlsum05A+Xe1c3WjI
         JMu3c46d1MhwywL2Hx4MYH0/UyIoxnw6CrEA/PVAyyorx9NFQzabu85R+wAvG0VOWkT6
         /w/axq0cLCxcXNsDakxvpozvE8Loj6C7JcB2rfFDN09we+lpThTvGgRfB18x42Vq6hx/
         Y5VYqLx9Kj79OClhvGYL1GX7LXFtfPWh9z0z70B9qF2m1XxzqNJS6naF9RjmpJEyYk+q
         Y1ZA==
X-Forwarded-Encrypted: i=1; AJvYcCUgE0dHBu0eDG768k3RPr5ZHjUYNXG6VWQa9ay8paoQjwlc6fznwc3Q6u6hx3f7UQN6jHafYLXK/pVKSkNB+1Q=@vger.kernel.org, AJvYcCW1bcaKqAgQu1nhWA4QBZE8Xmt90PelqCChfuC4E9t8SKDc5F7LcK42jnF+tqkGOg3M3cPlYDRDv981HkY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwdDiHLWHjko6h3dIxpjjL1Li6z0xM5fVxMUI7J7ora/1fHvcQ
	EdSMCidu8Mjc+TEojzVDiVYk2MaT3I5tNLKVPXyeOzdOa4R8Mb5gabZcjX1+
X-Gm-Gg: ASbGncuSPy2YB95qCO42O3mDY3JDYG/BPVUD0ordsktfhTTy/2s/cY5Lfk7becaevbA
	+4PYpz0LgfO+KRUzuCvDCcXsrceBdXkf/bK2YLaPGheBfqAL2ggedGdZHNXZgnET5zZWK9XD+Bh
	w9v/Os0lgx5OYIuGmgAaiuYxP34IYykRUbxOrQe1alg1BRuYhlLc0mewoUST+uf7CUTna2wKOjh
	gzUlHst+RhPc8cNLGnVswMqy5bL+iX9OvWMQw4SE8CeiO46auvYOfjUTJ7WDcUVYEJ7JholAkjf
	qg6Gnvk5iQdPk3K0Iz79ye2dggkh1D/ltB3W6UjGa5vKxUIdIlQ=
X-Google-Smtp-Source: AGHT+IGOzI/P+2LneiNF1O16tla7Q/MbcQEZMA6Hku4ZstXoTDMAFNtlVy+fvZGtP4CDretd8agBiQ==
X-Received: by 2002:a17:90b:55d0:b0:2e2:c2b0:d03e with SMTP id 98e67ed59e1d1-309df0b1fb2mr4983708a91.5.1745427397302;
        Wed, 23 Apr 2025 09:56:37 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309dfa0ac07sm1865161a91.15.2025.04.23.09.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 09:56:36 -0700 (PDT)
Date: Wed, 23 Apr 2025 12:56:35 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Burak Emir <bqe@google.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 4/5] rust: add find_bit_benchmark_rust module.
Message-ID: <aAkbw0jEp_IGzvgB@yury>
References: <20250423134344.3888205-2-bqe@google.com>
 <20250423134344.3888205-6-bqe@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423134344.3888205-6-bqe@google.com>

Thanks!

On Wed, Apr 23, 2025 at 01:43:36PM +0000, Burak Emir wrote:
> Microbenchmark protected by a config FIND_BIT_BENCHMARK_RUST,
> following `find_bit_benchmark.c` but testing the Rust Bitmap API.

So? Can you show your numbers?

Can you print the existing C test output back to back with the new one?
Can you also ask 0-day folks to enable your test in their rust config?
 
> We add a fill_random() method protected by the config in order to
> maintain the abstraction.
> 
> Minor fix to the documentation of the corresponding C config
> FIND_BIT_BENCHMARK, it was mentioning the wrong module name.

Indeed. Can you make it a separate patch, please?
  
Thanks,
Yury

> 
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Suggested-by: Yury Norov <yury.norov@gmail.com>
> Signed-off-by: Burak Emir <bqe@google.com>
