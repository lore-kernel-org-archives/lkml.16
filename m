Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EE8212B28
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 12:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738673435; cv=none; b=lFgmwmdXNZ3/KxUQKpNy6F4lHlWbBHxW9VWdDdXH/cEBGP0F0RMOYAQXUW35cKag1dyapgxWAs9Lc+N53q9iaREOg1RboCnoxemIGzPqXioggix0QiFtpyCrlhesbxt7j5eELTl2E9kOVlxJ3tYNsKMrav0xc3f+X0WdyngKy9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738673435; c=relaxed/simple;
	bh=5Wravk8n8L5gSrJ4Tsjze24NR0gc3nfzt/R8JDHkrzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h05Si6whDAps+BU4/YRzGOuaJKfgODLVSuey+D3n1i7JfSVsrHAFnJrPc4mUdaWGHZRjJ035jSU5q14Wdv3ej5r+OVtpp3939qbmiOHotVe3j57lpl1oMIEM5s0txJk9HM6YFnwVZA8yVPRg06zHS5PlQK4AAhIRHIct4o6bN68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GsZwQGop; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GsZwQGop"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-436345cc17bso41120415e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 04:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738673432; x=1739278232; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cw+RvYlLVEgZc4+jlXK0g8BHWRUPBup4VgYqbE87bNk=;
        b=GsZwQGopARiYq/juFef6TujcRVKV5rLU265YRViern6tWgtMCjOVoV/pjUg5Az4dvb
         oymS1jP/Sr7Pug7SxjhetBcVBfZhXRlaZX0uUdd5NeNW3Cd2Mxft39XTIbSloRUxy7dg
         uoBqzrJspW7lKloxT8442KLrvp+OLqVVrxlqmu5UDVz924KDsCOB4wCDKKkx1MpFfijV
         SdhbL3DxE/fROtdO1DpIoyluIOXk6MGXHpOLFzsApjf7PxHQBRgLhbSLypLpq9ewSSSR
         tITO7dddHq+GCvIVQawhsNW4GY8j/UaUZfj9nG4sER1tp+ak9iRXD5nnZygn2ASSmU8a
         Fi+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738673432; x=1739278232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cw+RvYlLVEgZc4+jlXK0g8BHWRUPBup4VgYqbE87bNk=;
        b=sgyxrWcnNoKJR+xr2hVBsY0QGojFPdMoNzg0Xdpkw9uX7myRBNjrfIlWqaetK4DNvM
         4kLVnC1QFaFgIcCSEVDOGQO77Js/hxmrXrk6MwHCLF9uas2ksOzckZucRcbAxhh2HVpf
         hr7R7T6JpMf2shPT3K/G75VEUfV0n0iN6YdkX5agy8/jh4HtL0+FFGqU5uOlIIzE8DPa
         9h11UFrLeB5AL8WBoJ1hmn81/8APDlY3LcsyjrNfViWQmEa3CYpUo0RCxBhxwrMLSSGS
         Elhm/rFBowCNxr4x8lRbwJ8//AYQ9PWLb1r6ZhawUZJHGG877fAb+VRaTsoCJZd1PKIR
         Bs2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUgJJVNd5xptFdYHzdgkgFXK4o0J02AyEmYZCrdJjKOpwDch3XHAY8UMI9A3wW/8kpI8n4CqnLa/DJv4e8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhz4A/IB9BKW5dmSckd+cnQLnTAwFDke0klFn7czgPmQg7qa1M
	S6l/g6Y7kgl9vcxxu+6FMpKfj+KbREpoHJlyDSMpzQoS6NNSgAC3W/n8WBi3prqNRv92eVGUmsQ
	VWdWPWv8RtDC4xs8bl+M3G4QQ9k8dGWyXLEv1
X-Gm-Gg: ASbGncvyOoqKdOOmno5PK4UPPH0XzOR4ou2DEv4x5VtdhBPnFeYq0KEv/30iWeMzKgm
	Wh4pb+xOFaS0BfOfA6gIsC67HlaWsY/juNa2Y3CqN3RZKBmVNM1pP8jP2vx/vGgzNAaCHXyHRVy
	VO8bk9hqkvKGX4uqfnkvZds/As3w==
X-Google-Smtp-Source: AGHT+IGnnk4K4dvnw1pigNvIyl484rO5AHHh0Oi9KTNVimfTokNMh/75NQSAs357TKv97JHN4whdk6OEEaDnknc6Rwc=
X-Received: by 2002:a05:600c:3511:b0:434:f3a1:b214 with SMTP id
 5b1f17b1804b1-438dc41ef52mr196029345e9.28.1738673431786; Tue, 04 Feb 2025
 04:50:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250204-module-params-v3-v5-0-bf5ec2041625@kernel.org> <20250204-module-params-v3-v5-3-bf5ec2041625@kernel.org>
In-Reply-To: <20250204-module-params-v3-v5-3-bf5ec2041625@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 4 Feb 2025 13:50:20 +0100
X-Gm-Features: AWEUYZkSscLm9QITCQ4BE11ZvV1ZiuaYYeibDFpJkeSienDQcuqiQO-NoGxF-C4
Message-ID: <CAH5fLgi-x6xT=xBV-Uv9do0tCaAOMOARZ5cigjsUBSyh2EJBOg@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] rust: str: implement `strip_prefix` for `BStr`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Luis Chamberlain <mcgrof@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	Greg KH <gregkh@linuxfoundation.org>, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 1:05=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> Implement `strip_prefix` for `BStr` by deferring to `slice::strip_prefix`
> on the underlying `&[u8]`.
>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>
> It is also possible to get this method by implementing
> `core::slice::SlicePattern` for `BStr`. `SlicePattern` is unstable, so th=
is
> seems more reasonable.
> ---
>  rust/kernel/str.rs | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> index 1eb945bed77d6592216cf30678fcca70d4c0b3b3..80601206961e5b2d682af5f70=
28434bba1604272 100644
> --- a/rust/kernel/str.rs
> +++ b/rust/kernel/str.rs
> @@ -31,6 +31,22 @@ pub const fn from_bytes(bytes: &[u8]) -> &Self {
>          // SAFETY: `BStr` is transparent to `[u8]`.
>          unsafe { &*(bytes as *const [u8] as *const BStr) }
>      }
> +
> +    /// Strip a prefix from `self`. Delegates to [`slice::strip_prefix`]=
.
> +    ///
> +    /// # Example
> +    /// ```
> +    /// use kernel::b_str;
> +    /// assert_eq!(Some(b_str!("bar")), b_str!("foobar").strip_prefix(b_=
str!("foo")));
> +    /// assert_eq!(None, b_str!("foobar").strip_prefix(b_str!("bar")));
> +    /// assert_eq!(Some(b_str!("foobar")), b_str!("foobar").strip_prefix=
(b_str!("")));
> +    /// assert_eq!(Some(b_str!("")), b_str!("foobar").strip_prefix(b_str=
!("foobar")));
> +    /// ```
> +    pub fn strip_prefix(&self, pattern: &Self) -> Option<&BStr> {

Perhaps the pattern should just be &[u8]?

The code itself is fine, so
Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
