Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0352D2391;
	Thu, 26 Jun 2025 09:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750931981; cv=none; b=njtQLk6FGCDTHsRJuGaNMDI+naTTFsbYsuf5jxp0KGBkKYxmHAv9eg359NrBdUcDhyF15bQXIGf4v5UgS1yueBvhzUf31j92PfEZ49jRtsui/QSgcfd799BExvwVuAwdcq4c7lYEWyb0BBASgXrffeYiF5ziGgUtIqaYZF5wKeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750931981; c=relaxed/simple;
	bh=Bpq9o8eUwss/BaTqZOzEf6o42mVPU3/LRRVIvXJEbnA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TgaoXOdzvm2tmT3s6K9mI3fMELcbNlBMoRUNAjU52DzOclOLJh9NyXCTOQx+w/WrYmP4VGjd5MCfi/oljpC+TO7Omj7SobPR3VUDqwrho83ny+C8QgoD/zn6iu3ZSfLWWPHHRhXcg+bWVOO92Vi2QRmDEh802VfoTmBA9pR/zaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hi35t+rc; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hi35t+rc"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-313862d48e7so125027a91.1;
        Thu, 26 Jun 2025 02:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750931980; x=1751536780; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bpq9o8eUwss/BaTqZOzEf6o42mVPU3/LRRVIvXJEbnA=;
        b=hi35t+rcWbOfU4mBoP40lWnBwYMX9PSKzXKsbmGDY8LoZCLFKaP4Kmn17nVqeaDRWA
         LgwFvu2EqScX5f5pW6qv8ZwX9JvwAnpLO1NrxJx93E/m3SQ956G1q3s+rz5Kq6lqO/ad
         h3qXwzViwexkCNkNoJnO6k0vGL5Cx5zyZV5xYP9IE1WnXFf9YAR2mY3CgYGaf9fEo1g+
         RTffIASkNl5RYIgW4eUQmDOIwCxZwfG/Q8+PfYBShvahgx7w2g6BmNF/P1ihuWwtjDKF
         qXrBRRr5R8jL/uVEvjM2uNZ1QZbiFIK530L3i15xkZaiHWUu6XxNFgckJWc2AG3U89hp
         ungg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750931980; x=1751536780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bpq9o8eUwss/BaTqZOzEf6o42mVPU3/LRRVIvXJEbnA=;
        b=cdLdzyannHaXpxKgOxs/HDTtOm/r7BqKBT7gkcbaCyoLZkwYx/7z8HXPx/qy9QpysJ
         PeBjQOA4+R+rkL4P6+v6nOhNOinPV2hH6Etd0Os24mOAFoC433Cgdz1UpJ/hEUSxBJw9
         HmLbW3VlRCEj8+0Uz6J8/9sIuNvyegm89jopWrLz520UbtXUW+Aa2v6u/Wb9q0iqGjuB
         joxjEsifAOMWjlWxJgZhmB2hWAuNswKnQkxo337NGw6up1khRb27m/1WdbI5JcVAe1Zz
         qaj1c1t35HxoYZ3YopiFLzMufQiBEZe5W7uHex/dU5ULR1IizRVQm1ol8q+nrBqO7zVB
         hmyQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9vyxZM6krlU93kGwKXOrm1v7B9TMCmTEZCSS7LyxnuKC0LEJ1h8iWw3RvBxx3GRjJuRtahp7ovuvhEhxMevw=@vger.kernel.org, AJvYcCXZ9ZXgrtdjJd4D1MGB0+R5GxY/QWj+GW0+W96M6HGGB39vLRESXl7qZncgPXRtBiXKVs0DMl94TavsUAU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLG2FOA1x3GTap8DSZ5JcWYhmbjorF0DkGTucRVexpIKgyLhNM
	aaE+pBMIiDBr4BfYqBaRXFhZryZlqF+GB89EPaLTslybpawteHyij6nfxABhF/6f+49g0tBuM1N
	32FWuVzKdRViXCnnabndRV+pSDqBm5VI=
X-Gm-Gg: ASbGncuhVz+YUV/kc3ZDanT+uAGtfe61wXaunLZpf8H5X2iFxRbJgkXLGj9s67ql017
	1InREpOpmw/cpZoGLDjwGz45ljzlOs5pYF1vRyRCG5Hyf3sZOGH4ZeTyEHwKAPPQl/gRg/95Aue
	0lfdcqGC8Pq5Q3ZHTPL86rjgIhboaXikVHK1ZLc9H9fVE=
X-Google-Smtp-Source: AGHT+IEUPRSreZyNR4k1We+vGp6J76QnTlOZXRU+JCQcRvcuo3Ny4sxSBFZh2aPsYfZFAt97vpXJt5mq3TljFZT/9Mo=
X-Received: by 2002:a17:90b:3845:b0:312:1ae9:1537 with SMTP id
 98e67ed59e1d1-315f2526b31mr3932419a91.0.1750931979878; Thu, 26 Jun 2025
 02:59:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625043630.7677-1-work@onurozkan.dev> <aFux2MUDAGEYY49I@pollux>
 <20250625113604.21a6ec4a@nimda> <aFu10-dGkoyi0I2T@cassiopeiae>
 <20250626111045.2c90a402@nimda> <CANiq72nsQzCje3167G_4YSJ_he02Czr4NveLOf13zYj-DO_gsw@mail.gmail.com>
 <aF0XhFUkdQNLNwef@pollux>
In-Reply-To: <aF0XhFUkdQNLNwef@pollux>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 26 Jun 2025 11:59:25 +0200
X-Gm-Features: Ac12FXxlITAJAosYeQh1GQFYtM5ErCxfI8u90WR6MDiQKiwkosuUcDaglPqa1V4
Message-ID: <CANiq72n5EMj3vFJO61wJ=JTGpockZjBshTMcbeDYhAmj+bYt1g@mail.gmail.com>
Subject: Re: [PATCH] rust: simplify `Adapter::id_info`
To: Danilo Krummrich <dakr@kernel.org>
Cc: Onur <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, rafael@kernel.org, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025 at 11:48=E2=80=AFAM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> It's a temporary branch containing patches that are staged for applying t=
hem to
> the driver-core tree.

Ah, that explains it -- I checked driver-core but didn't see anything there=
.

Thanks!

Cheers,
Miguel
