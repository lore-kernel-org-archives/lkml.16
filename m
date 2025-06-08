Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8D61E1A3B;
	Sun,  8 Jun 2025 11:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749383042; cv=none; b=Qlf54byqWWGSmYBBaOs7mrS0hxiEvfsZWr//CnQk3kORnL4jo/FJFfdLnRwtuWSQnKRkC8vOTKC0X2Tyw+moHLGqhS5J2J6kIiMAik4YDbIVrsqkKSbTDsuyaiCaCJTloYy0RNlDHI8Y/Ln0WFk7KAI+xINcKkZVXVDwUJE+r2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749383042; c=relaxed/simple;
	bh=ArzTRoRwLsrFlvjmTXvixgq3rSuyXXAC2djNWUQm0Io=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hfGYmdLVK4lYy/JVySnq07nXbZ6lFZO0KMj5BBVqxk15csUyDvOEsoQJUUviCAylyqJgSl54VC4D97QhBrx2vpA2jVPHrvdpXJdAtARVLORNmWgq7GvK0s8wG3KHQbvrX/Nq81BXdMJ9anRXrY2fIZ4UnftMt79jUhTVrBguqSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TPM1zBCs; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TPM1zBCs"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-451d54214adso29448605e9.3;
        Sun, 08 Jun 2025 04:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749383037; x=1749987837; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mNCQjnVu5PH7nIy1RPU7m+FfVDlTCjN0DisQa600buY=;
        b=TPM1zBCswu9wseHmwQ6X0FozXHzkXEjL5B6CKO4M+QCjeYA1NyAUckkUaWmLgzlo/L
         +wrA+rB5c1qz18HRHnf9YXrk0yOL6EYiyUuOUBefGTUShah5vcCjyPeGZJDR12/RxVk2
         dVK/7372kguizdhOT+IPar/TY67NnNz2PRqKtQ3EXfEie491ckTYiTT5Lg9zMJfGv56A
         3DF8g5CL1E+JiPDiHiqPGz368/i415tw3bqNb0o7+onPzq5AoKDtAN8SXsvrklPQjXeD
         sIfpxS7c9XU8g65sN/b8DfmX9dt2nIWbk0kHsbbzO7VNcNQBvax8hOitoYaxNaKN1QEv
         FAlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749383037; x=1749987837;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mNCQjnVu5PH7nIy1RPU7m+FfVDlTCjN0DisQa600buY=;
        b=gwawzkba5chmpy1MXtMT0SaBoHVTdaf6t86jR10223KZEst1UVZZBlL9XljwwYnhEC
         yJXuuT1UiKQXjieVuEaY8qNLVNOLBjG1I5FUasLncmZusT1750dixV0ERWJ/VClKqlWc
         Lt9qNx5minuoyuqqIV/nAKRsk0UuWEFWGufSvbr3IRn1SIaMtMoWtBNpJTA/kLaAh6+s
         Z/z8mOWggnsFJqPL2MY9bUsRoM6462DCH+YXOOd0hIHhGRhGsD6+FwhFcl6Dm/HJViqN
         sn3qTetg2EPU2hAv/rrg5Qan3CGS35+gydhRLFdPHI8ZWlbTIOXL35yEzymcZiu6RF7h
         6JfA==
X-Forwarded-Encrypted: i=1; AJvYcCUf2O+fR1HRlWIBO26eSxlzwgE9OzK8mbT1GvpKYR2ACE824pKO0LEcwiKDuyiIRIrzv7MvaetzQ3UsiKVS2+0=@vger.kernel.org, AJvYcCWDm9n5B2kkxi12OE0cUBCAKgS9MFLTPPrDXsjRbc8uqoZVE09U/rHYerPLoDcwpe9uwt4pRORsRW9GxtY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz7TkemfWpuL2rvesf/m9BoZ+PnCikgBsSaoR6xCzHOoHgq2AY
	f2aGVqInPhsJi5H4kb9QAAEnOPVDN8yO3Cx1wPnNyM1w8z/foefh1KCq
X-Gm-Gg: ASbGncsGHtkIUSq87brcRQTV04xfEpfCztJlGIDHjghymj7OccZ+ODV4espWGUc6KbN
	fDhbUMAqkpz6uYpH/aUAeoe8K5iItk0FyqJZTtyOpC4UuheJ7NaPsdcff4Yr19z3mvwf9c2EQrL
	EXM729fT7K2H0wB1z2EWu8fyM3izwCdR4fJ57OCpK11sbvxB+Cv6e+Rfn7yejO+bUG16lzxVi8i
	QUuDgjonensuaCw04zwq5WsfLNlK1pY2EwKjEBDEmWsW0brY/gna1TqVpmgUZyOR2ShSdN0ZM7S
	I6KjuqxNzN1seNPaMVcvYl0Ib97mVNQw19COg2M5MFWJBJrA7Z9GSldMnw6wViwT6G0L2caMDL8
	=
X-Google-Smtp-Source: AGHT+IGik1GwWjbfvKCisBtGH3LVP4ekbyIrYTL6B5d5f/bo/OH62T1e1yQVY9BOTqAGh5kQRUGr+Q==
X-Received: by 2002:a05:600c:3849:b0:441:d4e8:76c6 with SMTP id 5b1f17b1804b1-452013ec612mr104012535e9.30.1749383036899;
        Sun, 08 Jun 2025 04:43:56 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:3372::1ad1? ([2001:871:22a:3372::1ad1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5323b67ccsm7027604f8f.40.2025.06.08.04.43.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jun 2025 04:43:56 -0700 (PDT)
Message-ID: <d5204efb-dae6-4e6a-a1fc-3803bb4f1674@gmail.com>
Date: Sun, 8 Jun 2025 13:43:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] rust: implement `Wrapper<T>` for `Opaque<T>`
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Benno Lossin <lossin@kernel.org>,
 =?UTF-8?Q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250607-b4-rust_miscdevice_registrationdata-v5-0-b77b5b7aab5b@gmail.com>
 <20250607-b4-rust_miscdevice_registrationdata-v5-1-b77b5b7aab5b@gmail.com>
 <CANiq72m=cw7kqc2hBU5_REXPMOpiW4g=NtXRNqvd9uajZGtSZQ@mail.gmail.com>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <CANiq72m=cw7kqc2hBU5_REXPMOpiW4g=NtXRNqvd9uajZGtSZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.06.25 1:42 PM, Miguel Ojeda wrote:
> On Sat, Jun 7, 2025 at 2:07 PM Christian Schrefl
> <chrisi.schrefl@gmail.com> wrote:
>>
>> Reviewed-by: Gerald Wisböck <gerald.wisboeck@feather.ink>
> 
> Was this a privately-given tag?

Yes, sent it to him before sending it publicly and he gave
it to me there.

Cheers
Christian
