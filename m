Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4E2481B6
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 09:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738920752; cv=none; b=rE8HfqGoh7lwNFLSIYSC84mzEaOGFM9L5Z67QgXv6iFgUB1HOdjEOYWxrWy73DI21HJ10zRVPlFUqb0/C+MMVlUQ1JjdnP2XTlN/Ie2C8ZLzP0+cL6+UQo4t7JLgsfj0OnNOfbQ7pXl7D2YUAOnQdxJFXUof/xXgPdPTTMMGUE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738920752; c=relaxed/simple;
	bh=yOJ134mbLY6z3cyo5sh6OViUF0CPPUVNFJuqk4yunHQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GOdG8VqlaLXNcMfNXj0VOf1nJ6DyzmzLYuFNh2Hn1wsCgqXYwSZeHvTpIWwhxI2x2Ez1+0CROnzRQ6ryP3AuCK2ROqHJqMi1NbKLten/Yx6/CJ24J/UyXhjIj7W3nZOsnttCDkB+l7EO+yf0kOS50SmYHJniJap9ANfFjBB+U60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aRVCZafp; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aRVCZafp"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso940641f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 01:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738920748; x=1739525548; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1zSVrIrWUdmAiWFTc5k/o0pGtWSNU1TlVuXxG8iRrpc=;
        b=aRVCZafpGzbY0Ej3gVTWx8XL1XdxgMrGWFaWBrz7CZqWFfHs3xPMQnqMpfZ4hiB4in
         Xn3/xBlDlTUiBdl8HzmUqkjjTn3Sk+RQvDY2LtQcnQ98B36aV7d5HkUTDJ6l/kYZ8QCK
         exiUmrx2rHyE4YNAN5ySgg7rAJl9IAsE52PT/TPFoOrWWkEt2skiOodHUlkWFrxlTTq4
         NbVSbdCpJh6lMdWKa6UMJOjpGyA92upt9fWUL/oiQDCG+AgFcoGlquljG66tB+fRtrSJ
         p89uhUafz/KhlF0FY/RnGTe0fpxMtAcZlAi9MqgGbEJLNd25XMXTNp2+lYneZGdojLP2
         +lig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738920748; x=1739525548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1zSVrIrWUdmAiWFTc5k/o0pGtWSNU1TlVuXxG8iRrpc=;
        b=uY3GGmkMXNhsT9su8du3/lfbIAWOxgQtk/TuMYybY73wfTva7xE9j+tb8RLn2WwdsR
         pk3iboJxWGI5wSQepiSNQL+VsMYhSC3DiT1Kp8PC5OOqPVGABgZXnLl/xjZBxPWa+6WV
         4eRIL/H5YRX+NCw+4S5sqyuZvn9ddkjNY9YRT1MXcvAboP2iXxETXETgwWfFQ/Vhg8TV
         Nh+9UBS1Yq6vb3xgKnqNpAxeSa+1gWtZqx2huvqIL8hp512liqt6X/2KBKwYZDE9My1E
         J66tqm2lAsQg02mytLyOec0RfT45ctkycP7qn5vbeKFhDmPTHJmM1SRaa2LxNOVOrm5L
         f8pg==
X-Forwarded-Encrypted: i=1; AJvYcCU9w1BPG9rLQcR5M9YS+Hl3gSTB1kFu7Vs2wYCRoJLy3VduemKy3D2vSYMe81W8nj9CRMLHz9Zg3FypphU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk2Gv37etYALAgDQUYHrZaV8+Edqaf62G8SR2nHecEd4m3+KHM
	kiOtAvUbFWvU+cQ1R7FwCmGJxIt6h3wu6zwbSogW8BJh67ptkATXzL26Av8+4VTKKS1HC+AWRL6
	F4sg08DfX/CGdyrU6Yg1IL3sFSmifeL9f+84j
X-Gm-Gg: ASbGncvyYMbwxfEqMsqL1+uvtYyNwEdg0oThVAqdwKuB3QJzCO7+aQZZT9WmJfp6Ani
	Iecne38W0u8+l/UWtl58dBxmap2r/alPKWMyYCWwBxjmwBq/mz/GopIfNL5YsYMnriuThvGmCMh
	QXHqW6U1fvxEP5UF5xp087FoJUy38=
X-Google-Smtp-Source: AGHT+IG+Q7x8v5hu5r2ifN7Rqyw4qGtgoCj9DaHe5IDHAo5PkpaolJPoXt15hLt1LXvrYSWpGMuE3glJvEvPs6RQZmk=
X-Received: by 2002:a5d:6da2:0:b0:382:49f9:74bb with SMTP id
 ffacd0b85a97d-38dc933468bmr1711155f8f.35.1738920748435; Fri, 07 Feb 2025
 01:32:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207004049.178049-1-lyude@redhat.com> <2025020702-garlic-kindly-8377@gregkh>
In-Reply-To: <2025020702-garlic-kindly-8377@gregkh>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 7 Feb 2025 10:32:16 +0100
X-Gm-Features: AWEUYZkYb2NS_HzU9qPCFPkbmughlQwvhf6yXzIrmDwPZY9iaK6Q3Eh7MuDigK8
Message-ID: <CAH5fLgixWd862P_mma0BObtT=gm9fTzQOZot62aet1qx4mai+g@mail.gmail.com>
Subject: Re: [PATCH v2] rust/kernel: Add faux device bindings
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Xiangfei Ding <dingxiangfei2009@gmail.com>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 7, 2025 at 10:25=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Feb 06, 2025 at 07:40:45PM -0500, Lyude Paul wrote:
> > This introduces a crate for working with faux devices in rust, along wi=
th
> > adding sample code to show how the API is used. Unlike other types of
> > devices, we don't provide any hooks for device probe/removal - since th=
ese
> > are optional for the faux API and are unnecessary in rust.
> >
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Ma=C3=ADra Canal <mairacanal@riseup.net>

> > +impl AsRef<device::Device> for Registration {
> > +    fn as_ref(&self) -> &device::Device {
> > +        // SAFETY: The underlying `device` in `faux_device` is guarant=
eed by the C API to be
> > +        // a valid initialized `device`.
> > +        unsafe { device::Device::as_ref(addr_of_mut!((*self.as_raw()).=
dev)) }
>
> Just curious, this is returning an incremented "struct device" to the
> caller, right?  And then when it goes out of scope it will have the
> reference decremented?  And do you need a wrapper in C to get to ".dev"
> of the faux_device structure or are you ok doing it like this?

This uses the &_ pointer type which does not involve any refcount
increments or decrements. What you describe only happens if the
ARef<_> pointer type is used instead.

Safety is ensured by the borrow checker that fails compilation if the
returned reference is used after the Registration object is destroyed
- i.e. it's assumed that the value is safe to access without refcount
increments as long as the Registration is still alive.

Alice
