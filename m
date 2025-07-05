Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E6123AD
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 08:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751704544; cv=none; b=AcVuJpgiVBiOL/2SR3Zg38VGB42mAyjrW8K7Ej5Iq+/WC9IklUtx9ylrjzDrXi2PfxXHNx9PXgOUaCL9NUcSf+CPXWqHp4Cty0LNdlbQhCWfNHCfChSZkGfPJfDpWNNirhOwyWaX+zKtOYtpGFAkMB64NgVJMcucUX1m4sbwjCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751704544; c=relaxed/simple;
	bh=ah4SIvptMdwSFRwkpjHC9dZIrJE8W7eJFE6nNgvIwz8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IZmmVYrSaWVhFG8IjZmzAYZFr0sOUuW2fWTe4rL45jpF2Bzyu2bD2th6XPqXxUHwIFZFOgo9WEcDO6DcmZxqvWktymNfP+a83SjIC04KCQ8x+ecah7bfy2tUGmMi9fmypQHBrkShavnVgXyro0bBOS0VKEElOfBHR8FJMwbgdzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VxNsaGXm; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VxNsaGXm"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a4f72cba73so1698209f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 01:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751704539; x=1752309339; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ah4SIvptMdwSFRwkpjHC9dZIrJE8W7eJFE6nNgvIwz8=;
        b=VxNsaGXmpFBZzbGKOd6IK9X/JtW/udqf/QFYkdXLMxRPH8E9mWRWHzOT+AbD9nMkC1
         vaV1j7SBSvjfLydUz29ox3rRRDZpZzJRbQEGkh0GwAz2fLNT0dw0/NXxuNgJZeLMROHS
         Q349P3/x4ugtlRCxNp3zhbinpl0JTgQokNMmBk+oqFHEDeRH/44vvvHgcyhH1S3X3GX2
         tz3pFZw9743bK2bsHftHI6JlopBSveB0xVs+haMSn7ibzFOVJFyTRP0hnMuIk6GPjdpz
         HNHvsXdqQc6gu8JSIiWFTUtYBokNkCcIauhl6GCovDOlUxd6nSbvcDR5KxM1IgzY4s7/
         oyMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751704539; x=1752309339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ah4SIvptMdwSFRwkpjHC9dZIrJE8W7eJFE6nNgvIwz8=;
        b=i9kqVto7kdwdI12JfIEEPPHSEY76BPKvuRKYan1jI28qKIO2t6znCrx9JjYQDVHDVx
         IN4SQWTKtJAhiINn46gRwMU19A9lS2/rsh46xg8PIQciaUx5+dIXMr6crk/oz8ac2Bn/
         RRToT3pfvEIphErSY23XlVDn3iL/FDwy8REFAvnjswuVYHiOwwtfI0YdkM+22TC2/N9C
         Tjp7gzwCPkE+wp2BNqCnGGaTV+ZAomFEtVwFLUEFjaJvX8WjGVsgWynUExU39ugc2Q6I
         E05ojb+IuBf9BDEKXZFOHqtCwGyuTffqVT/Wxjrq2vQQgfH7IqSXm0bvEmwhXCTO7Zts
         O0Bw==
X-Forwarded-Encrypted: i=1; AJvYcCXH1dUwzkGApeSWfJ1aujmNGY8Pa/btH/z2rUWppMQLO0xI3NZK+cJad7kRYzKXytiA6xsbMjlTRH7ofmQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyVIRzGXnIUbq5YTgf0djLdAeNWj5/+mUXznz5YieeFhZ/zeZk
	0SOurQ4Kw7CiXuoLpGBkePVSBDhC96guGtObR92oQFaX+oc9D/TFEHQKzAePf5aKsa1vop4H6lG
	DVPlSo+xddJ9A8AtvdF/WgLhhH/VCrXyQ7Ln8Ff1Z
X-Gm-Gg: ASbGncstqvrWKkIVVPc5qHnWLh9CcHHGlKzRQ8bnGiBsJgpFNu/nZiKmRtH2L/VXe9A
	mhC1wvXsnkTe+/LVbAj6vHmSiSHxFI08ldOKQFZnMiIg49+4rsyB2wGsdQ65a4YF7g+n6eJUKmn
	MnDsI2mMaNLT5LifJRxxNHDdUdDpx+8ypn8ULBMER5mLZN0uy1LXZ6YCs=
X-Google-Smtp-Source: AGHT+IH/pkllT3Sy9Cb1lHriZM/tG78khhI42JnRhbPr8kP9tTs+gtmjri5ZYwhkuP07q9yAkZH9HXYofTd095qzzFE=
X-Received: by 2002:adf:e18f:0:b0:3a4:c71a:8119 with SMTP id
 ffacd0b85a97d-3b495cc4ea6mr5351566f8f.25.1751704539369; Sat, 05 Jul 2025
 01:35:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704-core-cstr-prepare-v1-0-a91524037783@gmail.com> <20250704-core-cstr-prepare-v1-4-a91524037783@gmail.com>
In-Reply-To: <20250704-core-cstr-prepare-v1-4-a91524037783@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 5 Jul 2025 10:35:27 +0200
X-Gm-Features: Ac12FXyGVQLpnmxvOqtVG7V_plS_x4VHl-FkqPG4Jcdo-zfXWt7_Lhls-5TlbKw
Message-ID: <CAH5fLgg=4ZqKh1hqFD9bmGJwUf3LK3=K+Q4tTRPnT+NaMubpLQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] rust: str: remove unnecessary qualification
To: Tamir Duberstein <tamird@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 10:16=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> `core::ffi::*` is in the prelude, which is imported here.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
