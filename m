Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A23228A1C5
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 13:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750425581; cv=none; b=WqXvB0S7bEMHq88Gj2n+iCAPlQr84TGkKDxR7gnBz9fiU2o4M9WrgerDO/ibxRQSsJoScAMWtT36FJBvm2HpZ0zQ9TjFgKV4Fq0BaXPzpp+ChpnFXHLc+YzT4MCcH0sY8kbbCmk4bAb1kK/r1djMt540acF4yFzUQqeRVX6B+jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750425581; c=relaxed/simple;
	bh=/Jmx+66TOxItbg8HTLul3CvVj6BerFXt/VvWzTEkq/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nhsjP67jP1cxUDg/qkfgtnR/kyaFs1WUkwhgoPp1wF2c9mxpDByPSlA7xsTPyvMIGIEDFsJzjAzJSLTU8ODSlB5KPIhmlhKRt5gor7n8cOVcBPsDotfqXAqKcfWm1JIb0e5wGx23eZjp7880BvPXsLyoTHxRt1zCmgjIFkP2x/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WoZREOze; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WoZREOze"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a510432236so1442234f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 06:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750425576; x=1751030376; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Aoha9L5NfC+u+koSGou0cifrW4mZqVgDJX13pIfUHQ=;
        b=WoZREOzeb+zAXjZKhvnwQe9WUOZQuXhTS5UniJrqYK3tPidstJWAZYNWn5NSdMmAlC
         HWzyPTGlISJ+IWk4mysCgkd5QUwW3Qum46AbRv+FiLSQqptxdI4iRsyN/zTWSu03S2Te
         iY4HUVoT1ta24ycXE83XgSQTrC/SmN6VaIngfgEWLMG0dWOG4HO3/fvZ/2RY0deLHF+o
         WacOFMwgDNNbMIRofTbieCEOAcITwUgExqgogCbYALxvEwNn5/HU2UC8AC/Ir+vSNVOV
         JLTVh0/WhEqfW5PIN+U+NpLf0Rvsc6I2Jfuaqa1kmUinJ9itpi3DxZ3xPgOU0Yzbu+Hv
         vUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750425576; x=1751030376;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Aoha9L5NfC+u+koSGou0cifrW4mZqVgDJX13pIfUHQ=;
        b=LvD0fu+79YS8tYK9xtKvZtShJmbVgX3Wh51aLLwRD6hJEboTxc1+Hj4WQEOc+5iQlz
         Iz4ouAwdRozs4Gn8s1sKTfaCexk1WPA1lIZWfmcQywh4ubtJepxmlyg6X6hVyCSmLQoN
         H+o6cubTkhqkec7VA64J/+VJfDvMKT7xTKY5n1CZ3zVHyow6LSw/+Tw2PJOhaLLv4YJI
         8HaiPGdt7E8b5/bwdC060kZn+gNvhO7LmPsqSmEMVLpRX/C8b0L/Ve+wU8GAvZ1t+2Gz
         Iw/k4t+LkmGaRi3uuQ3Xu8HeRnJkpejkIR38WArpO8h7OdcZY4dQQhpFcujdcU8H8GSb
         +63g==
X-Forwarded-Encrypted: i=1; AJvYcCX9DQfpOJ3+WlqB1IxNy33dd11iXRItckT6glGmYOfsIscuB4TOL9wk60jptDhpGbB+qH5jzuvGgxR/zrE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ7E17XjuI9ssN80qU7BIHCtB8MRMLm2R+CScT8MZrSn3SmQkQ
	44hlKz2jOrsmB54Z4sumRbtJSgPOFo5+4NOHS+GQd/F3EpCciz6wmj6xcezl26X61n8zJgGCQbW
	WQUS5eSYkdNcWH3VcjU3JvX9UHKf2VDMb3QqAe6CF
X-Gm-Gg: ASbGncuG9vAo1FlMD/L7TcB3WwW5GBpxAlx+O4N62gAid+0d4g464Q3JF0gpcJLrD+y
	2nktNRmTXKqI7gurqbHD6OerOVnqBVPAKQ2kpwuHr9qfZXSj318hI73WwU6tGViGngQj6OZ4eZs
	rk1jsT/bNp/oF5ux/FpUeuqosbrOtHtSfj5pWa2TGBpHKHccDXq+4ZT70kIlI8PdlM68HhPOs=
X-Google-Smtp-Source: AGHT+IEiKSTVrmmesXo9djdNTgNBcOgbeA3YEC4Na2tAHP73NDU3cx4wo+GQbuGrJ3JBFVyYCtkNV3TI4QLwPWl/cco=
X-Received: by 2002:a05:6000:41d7:b0:3a4:e480:b5df with SMTP id
 ffacd0b85a97d-3a6d1325867mr1979922f8f.44.1750425576387; Fri, 20 Jun 2025
 06:19:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620-poll-table-null-v1-1-b3fe92a4fd0d@google.com> <DARD1ZC0W9QR.3CBLX6RYE65VU@kernel.org>
In-Reply-To: <DARD1ZC0W9QR.3CBLX6RYE65VU@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 20 Jun 2025 15:19:22 +0200
X-Gm-Features: Ac12FXyD8XjzFcyEMQs6Ycjlsh-M4ynT-jitRe_d1CuA3V-pe_mJelALY2Q-ze0
Message-ID: <CAH5fLgh7n75Q4Txi29CxFG4nfkxzceqh=bMBDyYj01G_KC0vwg@mail.gmail.com>
Subject: Re: [PATCH] poll: rust: allow poll_table ptrs to be null
To: Benno Lossin <lossin@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Miguel Ojeda <ojeda@kernel.org>, Christian Brauner <brauner@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 2:31=E2=80=AFPM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> On Fri Jun 20, 2025 at 1:49 PM CEST, Alice Ryhl wrote:
> >      ///
> >      /// # Safety
> >      ///
> > -    /// The caller must ensure that for the duration of `'a`, the poin=
ter will point at a valid poll
> > -    /// table (as defined in the type invariants).
> > -    ///
> > -    /// The caller must also ensure that the `poll_table` is only acce=
ssed via the returned
> > -    /// reference for the duration of `'a`.
> > -    pub unsafe fn from_ptr<'a>(ptr: *mut bindings::poll_table) -> &'a =
mut PollTable {
>
> Returning `Option<&'a mut PollTable>` is not an option? I'd like to
> avoid wrapping raw pointers...

You're going to make people handle the Option by early-returning if
you do that, but that's wrong. You're supposed to treat null and
non-null the same.

Alice
