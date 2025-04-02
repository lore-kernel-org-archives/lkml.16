Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34F339FD9;
	Wed,  2 Apr 2025 16:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743612611; cv=none; b=pKbNsm3ZablyGkvn18I4fBcmOY7FwyktRdct8aIwZDEg51kRAHLgwTpyjt7dSan+M2FXQqKoApoTosy4oay2Nufru+74AK/TslQCtakbg8W+43YRgbAHWxbnT8vkiSS8IoVipmwG0fwMkZbKpkAq/UTmdJPIm5QzpiVtqBzC6Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743612611; c=relaxed/simple;
	bh=iSZjFV4FMkeVCtteZT6YTkC//p4kPDrkkcJ34PwkHrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SaZbMqzoHmKkDtROPtItVwN9EzF84qlSpsxZPNgsZyRjJHBDShUoX3J7sOKbSlqb6VwdPlQ/eqiTNBfG8LB/sn+O90bQegb7yR8zg1La+3s/zwwPldfed7YR2AYC97j1W+gv1JZDPcFobWDGzd/W+YM0XWc9BJh2rFicChQRSUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DCVW+1sj; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DCVW+1sj"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30c461a45f8so71071751fa.1;
        Wed, 02 Apr 2025 09:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743612608; x=1744217408; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iSZjFV4FMkeVCtteZT6YTkC//p4kPDrkkcJ34PwkHrM=;
        b=DCVW+1sj40fGUKRxLGUivVW/+w7Wi2PN6NL0RiGN/86O9L/XELZi9rhNBOL5ZybJzR
         fyeF8r9TsDvoQe37fmXpVNprmcFDypjZAlfEZ1pvC/2snMJOrjDGsrRZEjT+eaEOGrGt
         TfS5pKUWrSOd5kfT+PO1yQIEC2L7h4ZeFYfq6Inh65iYvbZW1AxHTFvDiP4l+rh8EbtV
         MVpp7rcFj0UJn+BLB77FziAdWHy/5tlPdOSKhsO7WvCzv9cKSpnpDDfHzIhW2irZfI6j
         SMW8FiXbUCUYLbxD8RRf+qGDMdY3iBlSKJQdhvHtkNkIj4GGJYNaHVzQkG/YvUtVg9mw
         U67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743612608; x=1744217408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iSZjFV4FMkeVCtteZT6YTkC//p4kPDrkkcJ34PwkHrM=;
        b=g0wOde8P8+RGEK6hprMA1xfbwdBphMfnA5dt1rKa5+DdeW6ny9DZnDTjB+7ID2nod7
         cFfgpvU/T+qFdjd2dKMJe+6dInJL+EwbmeL5iCsXyd0zwXzlcv4AbWPMfeLZkELesU8/
         JBgCG9ZjdZyIGGRg3lIj/UYMLXGedrf93/M79iRI+JZlxd3loBQjO8zS3IhP38xJoZCs
         8Ntjs+JN6L+E+Fp/fukU+RO7MddzSjPhki84+2ACtuA9/+FPJ2f/D08ju/r5tYknTXw8
         7qID3a0TPziHzpc29lTqbre9MaHY9+Yp+PG1TJxf0JFfF2Y9uFpueLKj7lx8JvfBRI4L
         op8g==
X-Forwarded-Encrypted: i=1; AJvYcCUITJpw9tkVXHXIKIHB8UY7dsGvwRser6IN+GNlT92Xox6h7que4hb+GYtI0tJAoz0EVUcHWciU9sb9SoQ=@vger.kernel.org, AJvYcCUJehDlI6JcWAK8RHBFTykJUisa0OM1mdUTRKhdhp2F9T/IEBqtmqfdSHTJWIjtVwdXylsQmouCJynfMS6v4Xk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfDlsuNUINNArNslpnxI9DnoQspA7v7YRRwnZ2fR+noliAvZXl
	BqY8EGcwBVWU9dwjns1BH3u8NPk6jcRa2ofhGnzN1IkcvaWgpoW9Epz6sav4SYNP5eOKu6xV2Hs
	Biaa6qls/+CXI2C0Q4OikT52LqWib/iMK
X-Gm-Gg: ASbGncvGUKau8cf9milB1uerPzsJWpWBhz96HQctTBolXcpldXsZsHMgMI9CXAWFkFS
	Xhn5EuROF10zVJ9iQ88dRa/qkOK48/fKoIAELsY0Tx8EPcWEGEQ/JTBq/chriIpC0PMP/jBsh3f
	BRAXqXmVXpP1q5FMRwTCI4Rv3/1UD+DomIRt4lL0DozQ==
X-Google-Smtp-Source: AGHT+IE8elyosTdcge4gKh9yer1gFMOPkHrLQdRFSkE8Vt/zBXv7geZvsuea4+ZxrXW5DeT89Anmh1JfpH4cJv9vJiA=
X-Received: by 2002:a05:6512:1597:b0:54b:e9b:db23 with SMTP id
 2adb3069b0e04-54b1110d348mr4845013e87.37.1743612103286; Wed, 02 Apr 2025
 09:41:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401221205.52381-1-ojeda@kernel.org> <D8VPGBN60E61.1Z48FQW6TL3A@proton.me>
 <CANiq72mdvnHvWbVNQbiXSRxd1xrF+A=v0RdJO74xeY3HyhRmcg@mail.gmail.com>
 <CAJ-ks9nAAcoJoFF+qNPbhsM32kOh9u+LGYUwFN_n9qqudB6YhA@mail.gmail.com> <CANiq72k36Tvwbzkg6nRdxB8VNRHLf8QzLeCXZq7sEPewccsWNw@mail.gmail.com>
In-Reply-To: <CANiq72k36Tvwbzkg6nRdxB8VNRHLf8QzLeCXZq7sEPewccsWNw@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 2 Apr 2025 12:41:06 -0400
X-Gm-Features: AQ5f1JpBg-RQ9FN1Bi9_jh02mPTTG_EQqJu7_lcW5lhfKYW7j632XCXjTVZcM4Q
Message-ID: <CAJ-ks9nfEg=sdn_-q+xOc+k9mU0pdMuumwRb76LXzE3RcOtg6w@mail.gmail.com>
Subject: Re: [PATCH] rust: clean Rust 1.86.0 new `clippy::needless_continue` cases
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Benno Lossin <benno.lossin@proton.me>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 11:27=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, Apr 2, 2025 at 3:59=E2=80=AFPM Tamir Duberstein <tamird@gmail.com=
> wrote:
> >
> > Rather than disabling globally, why not `#[expect]` these instances
> > with a reason?
>
> That is an option sometimes, yeah, but in this case, writing those
> lines is also a burden -- one that is, I would say, worse than just
> using `()`.
>
> It would also need to be `allow` here, not `expect`, because older
> versions do not complain, which makes it even worse...

=F0=9F=91=8D

> So it is all about what a lint gives us in exchange of those false
> positives, and about how much time people would need to spend on it. I
> have always supported adding lints (I think I added this one, long
> ago, in fact), but I don't want that we overdo it either, so I am
> happy disabling it if it is going to be too painful.

The counterfactual is hard to prove - you don't know what true
positives the lint would catch. In my opinion disabling lints is
risking throwing the baby out with the bathwater.
