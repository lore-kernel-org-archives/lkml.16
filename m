Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069EF23C4F8;
	Sat, 31 May 2025 13:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748698816; cv=none; b=tfscMufjN171mG+ZLgkNqmu7ojJka9iq6bQKd6dWc4MEgX0jdlAhd8aXhYt9IlQisdZ/SfcKLZcuAFFbcl2Epq9mCBLBLr3jcPQ2rAMZxvRrsdEz7AD1iaFiMeLsgj1r9nBp75owwWoUVdilDog/CUxzD6QYtW1vBRhHi2w/TuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748698816; c=relaxed/simple;
	bh=bWDjmSzU2yzp+AegH1vxwlklLZWf4yPOlRPht57hKkc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cMBes/3sclmxswjW6/HGft11S46+ZpqNY9r6XCTnn1lfmcS6ejKJIgJ0HEGXT5huTR1xZQkT61b2Wsz5Vw1oq/eG6VlUGEa2yoh9WuhInyh+QaIqd1fbObz1CTTm3tkruRNdQb/1+s5+IKpJpcrH2omjU0wZpy2BZVhQAhZdPO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c4+EE4Hk; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c4+EE4Hk"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-234b9b01a76so2508935ad.3;
        Sat, 31 May 2025 06:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748698814; x=1749303614; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TjytCL6VHWdVLEYo4df5YAeMdP0m5fLZbWIXvH9pJt8=;
        b=c4+EE4Hkwd+/77kokQpAfQ3P8BvrylpjZENvYN5KvDqUY6fUhgxySR76Xof1826BtH
         qQv8/J3Dmn23u3sSZ5dE+A62iFYaBgz7VMBOBZuL6S9ML/YhQmYQb7ogk6dynxEmDiZT
         kbyuLxzDsKVsV3e6BU/njiG3w613PikhBHWkOqSq7PtSzUOUJUSwZR4OPh4Fi203hVC4
         iwthqJWu/fN/xGSiD5hrNzIP9euKYhuilxtZBm3Gn73Ldpjt8Nj6hclXori5W024YcXw
         pNxpArlAu+RCSRfmnBm4/xeHoszr3yfY8ENci33SUCdv4lOea5Sz66lpmmT6MKWjCaiQ
         GUGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748698814; x=1749303614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TjytCL6VHWdVLEYo4df5YAeMdP0m5fLZbWIXvH9pJt8=;
        b=QhwbzJVLTyfL1D2lwN4VpxufNTD52G7kiUKgC0/uBfILp24ZS9z31CYX1fotypzDfm
         FoHINYOUZKX+U18K6nxDrzm3lXAVWf2PyFMu09S6qKGxuD9E3xJ/P0ME88SmV03g5IJ5
         xiRbMpwMnMg0J8o8yWLsb/rblT4+4uKZRL6DlKYG1v2iPjRbtzVN+4gZUYb55kq0AAQ/
         lNFWO+FctK+S3NmgAbSzuNm3tFZkScch0oo0/XMliQ+BRhm028D9eEzHOcXHIls8FhVm
         utp+M59pJd1Dd+KBXsWzI2UhTVJW9lyAqYjaVBeZth1DhbjwcEmZJkWF12f2qF9iQ4JM
         Wb9g==
X-Forwarded-Encrypted: i=1; AJvYcCW2CXyJYVXwxoN3yY4nFxlvwkntbMF4c7V9gbLxX3ACorI1vdMxLxhPzA7HurcbNRrZWFjmzSx3cxgOtTim1fo=@vger.kernel.org, AJvYcCWK9X8Fb3mkv4fa9lfgJVHLnM+Nu6RsHdDlYzYyTKoGQxnup2uNn6UbZZYfwFJ9yHzv65rv1aNF2sHrC7M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJZz8fd4DM51Y9BiZw86gKbHF7VY1xgmFRFJSX0fbgm33NHfHb
	vkWL5M5TmYHKhDkwqvGsxmwyNaC0bB/dUyvvwuqMAw25heOTO3pp3DKRgGQw5mqKPMsXFkzkR9k
	jTyK/SNCga3Sr83XpJJjNB5jAYn5nTRc=
X-Gm-Gg: ASbGncsL3ChOu0RenCbq6MQuSqiPlZ1CzQ7BOwKW555apKuDbVUqdD+TH+j+luY0WmH
	iqEfvrHXkbt6avRI5cw5YqLzRFmPrufDJZvFKkfuLNw9Gn2M/5weWxdw9GPhhfhL6PciIlqGWwz
	rHJQ050RLRqFm4OeGC9OVJAzGFr8qwguBb2Vv3KAfPGSc=
X-Google-Smtp-Source: AGHT+IGM/VopKp/r6apLhI9rmp9l1qxkDiRkPFj/MKpgaRuzrg6NcdRAoIs0amXnu7mRkqF+MHQp9zxNSktQEX8jyuI=
X-Received: by 2002:a17:902:ce82:b0:22e:6d69:1775 with SMTP id
 d9443c01a7336-2352960ce85mr39194065ad.11.1748698814133; Sat, 31 May 2025
 06:40:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530-b4-rust_miscdevice_registrationdata-v4-0-d313aafd7e59@gmail.com>
 <20250530-b4-rust_miscdevice_registrationdata-v4-3-d313aafd7e59@gmail.com> <DAACGEDVW8D4.66KOF7PWD1I0@kernel.org>
In-Reply-To: <DAACGEDVW8D4.66KOF7PWD1I0@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 31 May 2025 15:40:01 +0200
X-Gm-Features: AX0GCFsJX8q4mifGojT5sQ1ck48NjEHPefut2SFVLV2ufOJhDgn09COymBLeliA
Message-ID: <CANiq72=mdaekPrR-LWzfM5hKkNaQ=zGqDFh42Mbi8eqQT71tLg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] rust: miscdevice: adjust the rust_misc_device
 sample to use RegistrationData.
To: Benno Lossin <lossin@kernel.org>
Cc: Christian Schrefl <chrisi.schrefl@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	=?UTF-8?Q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 31, 2025 at 2:27=E2=80=AFPM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> Let's keep this newline.

There is also another apparently spurious change:

> -        pr_info!("Initialising Rust Misc Device Sample\n");
> +        pr_info!("Initializing Rust Misc Device Sample\n");

In general, please try to avoid unrelated changes in patches.

Thanks!

Cheers,
Miguel
