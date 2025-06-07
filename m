Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC05BA3D;
	Sat,  7 Jun 2025 15:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749310776; cv=none; b=QWNKpvrpW9x7K+RUgBWTR1JWyz46LFGC3otkICEJfMXxreQQTQXbYwFs9q29R6PfIVL/lYZjXW40uUy30/F/xdFSEidYe9jObom+XnFXH0DwoX09pHPAbl00Mo8L9mztLIVcjsqewx6yo4GiBk4HMIK851VjWKAvzEJjswb3e1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749310776; c=relaxed/simple;
	bh=Z2m7JrXGaOzzqXtuG5FSIGOVp9ssQafzYXn4iOBE5eE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o5gDKIkk3BCjBwdim9uETiUg2e5CnWjQbNpJ12YwG1W+X7exHQjx+GPKu697nUpi+GJGh4NIN1ILh4ZAXOAFcBGNTyvIrB3rFzS22hI6h1m/4BAj9+HX68NCDDh2qL6un28k7jnGFEUjQp+v1T4PjM4uav0rxN9dHeqimZy41Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BJYLd1FK; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BJYLd1FK"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a5257748e1so2061556f8f.2;
        Sat, 07 Jun 2025 08:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749310773; x=1749915573; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MNSC5rkf8JWeT+F5M+CqP3x29GUpMOagqHWNRJAoYg4=;
        b=BJYLd1FKmT5D/5Fgd6PLu8HrlxBRwA4Nlc2RoTFCdRzUkovkDLp2DFc4ox4rCpC/tw
         aJ0WBgSgPE7JTYGRI083rxdjrdPQZkvL4zOGC0e7EfQkcsRuUZzPy5n1ePRJlCiiEyos
         qymb8Ir+eccqQqdY5PcXP+zJm/V/hojLAoyomxHKBNxO7jeTnVoTlmZkHUz7mJjYIOwe
         694er9ZgGBNSHkjwFdWwHoPI/1er6qUz+KxFXRq73wPX/iQvbQmgEwYIA1XUnHu0M6xR
         +Z4dKpwUzzllw/+MwmNOhT/uxLVAXOj+OlKeuhsqvW8qwwVjHvj+7fLo1imKjMJyTl0U
         cE5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749310773; x=1749915573;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MNSC5rkf8JWeT+F5M+CqP3x29GUpMOagqHWNRJAoYg4=;
        b=GJFssioIFI2DgwM74Mq13+b/8dDZAN9RCaFHAfzxzlMtk7xkTLoYX49IeM+v8bC44/
         SOfCquhd84YQviNjF4lWnpVTpUGT9Nj7dxUN1U5eQjlhrQmuE5HU5bNmuaOVKbU1SaQ/
         T5mzX+un9lBcy43Qz4zwsIen354B4aWvxGioYP+xpDhFLy0HZHTUSuJSfktUC/DDySMQ
         r5IZBtKnnUbgJJCaqnMQLbb1nEazvKs22/FzLN4jmWG4/QVIqhwVVT6+BxjNvRE1mR/5
         XCY5ihrDPhua22jjprzz+CGg5PotrPtDyfkcB+hvg+CiG2PFQBzVD2CbB1DlzMRDYIAT
         vieQ==
X-Forwarded-Encrypted: i=1; AJvYcCUk6jmOSa/H2pyOLukLzG3QDCI/1hdXEmCtP+QDxW7qMkCZClMCedtU1xRbnJ6C/2fYa8niW+7idCmnusQ=@vger.kernel.org, AJvYcCXu3KNOluu0IPQ4zbLu/N4CK/7FLJ6kXoHiePBlS6fuudWnCR9X3RAYxxPTdgBd0l24LL3gzF+YtX9ejxP9vco=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKOoKRVNhQNjv94FCjnpY1v+cqc4q0nqUrE8jNCPsunpnZ6kJt
	CE4q54F7c4eReAyB6SD1CzB/kwvKVcJDE2HKGG4pyVIjoqvwWgLKeA+C
X-Gm-Gg: ASbGncvdtJRMUug0oKoGAX9uRo8NuX+ohY+zB0GbNDfnYvJjDMi41CcxgBBbJB/HW5y
	Rm+ZB/8UjQGtEDQFMl3Kd8oKuwBy/GU/o8xP5pZtMO7Vws5B/eYcV+rdssb64yglxDnynjni66J
	xFu5VBzl0Xzu7krPGzEOfPzt4fZ1RcuS+o84LV776heNidAmuN4pJzqfbG9LcQPNHFHOCb6W8ks
	fdXMxxZu8u4Zmp5vqB2fCVD8GuwBF+UmNk7bVX32Sd4wje6LofrKMdnGiF+Ye2Ows1SuerAraax
	rrV/5Gf9GRh6H8/Lxor+KPG+bolGC5mIzOjidDqgGAEhxz47U+2ID+ebzB220kmCgkSJEClLro0
	=
X-Google-Smtp-Source: AGHT+IFDuAzFysvvljmZdoOX1oaIaptYHAcbNC+1qYUaD4ZQQq85gGduVskWAdCrCrXu6SGsoiPyEQ==
X-Received: by 2002:a05:6000:2289:b0:3a4:ed62:c7e2 with SMTP id ffacd0b85a97d-3a5318856acmr6259702f8f.28.1749310772451;
        Sat, 07 Jun 2025 08:39:32 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:3372::1ad1? ([2001:871:22a:3372::1ad1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229de7csm4943387f8f.14.2025.06.07.08.39.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 08:39:32 -0700 (PDT)
Message-ID: <68fd9ef6-a93a-413a-99b4-1b4d100aecb9@gmail.com>
Date: Sat, 7 Jun 2025 17:39:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] rust: miscdevice: add additional data to
 MiscDeviceRegistration
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>
Cc: =?UTF-8?Q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250530-b4-rust_miscdevice_registrationdata-v4-0-d313aafd7e59@gmail.com>
 <20250530-b4-rust_miscdevice_registrationdata-v4-2-d313aafd7e59@gmail.com>
 <DAACCYW3QRQE.1O75L2SHJYVPM@kernel.org>
 <3eef5777-9190-4782-8433-7b6ad4b9acd3@gmail.com>
 <DADAEIT9E1R8.1J69W5DKYAQGY@kernel.org>
 <3c1c0563-7f48-4222-a28d-316f885bcad4@gmail.com>
 <DAEQ7VRHEP4W.4O0KV31IPJFG@kernel.org>
 <89066f83-db7f-405c-b3b5-ce553f8e6b48@gmail.com>
 <DAERY78ROO76.2WSPPIC01XQ5H@kernel.org>
 <8f491c61-e7b2-4a1f-b4f8-8ff691015655@gmail.com>
 <DAGEV65EU1DO.152XYF0ZYTM6P@kernel.org>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <DAGEV65EU1DO.152XYF0ZYTM6P@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.06.25 5:37 PM, Benno Lossin wrote:
> On Sat Jun 7, 2025 at 1:34 PM CEST, Christian Schrefl wrote:
>> Yeah I understand that its not UB, but to me it seems a bit fragile and opaque why it is allowed.
>> That's what I meant by "a bit iffy".
> 
> What's fragile about it? That someone could add a non-opaque field to
> the struct? Or that one is not allowed to take an `&`?

Yeah that a added field could cause UB seems bad to me.

> 
>> Alright but I doubt that realistic, since the `Data` would always at
>> least be shared between the owner of `MiscDeviceRegistration` and the
>> `fops` implementation. Meaning its always shared with syscall context
>> and I don't think it makes sense to have a registration owed in 
>> that context.
> 
> That might be the case, but I think we should have this as a general
> design guideline: avoid unnecessary trait bounds.

Alright seems fine to me.

Cheers
Christian
