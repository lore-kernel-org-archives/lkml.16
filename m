Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DD927FD5D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 09:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748944658; cv=none; b=N9+qbYEd+5Urmk3FKk0mnvBaj8d4/7NUcJ7hgIUIS9UX7aFIYrOk0FsghjAQIEEYKl6U0tYUihBNO/4FVspP6nepkKWSXUjDb925pH7Y2PqJTc2F/HC5MdM7wg6lbxWeL5nBJx916C/HCiL4RHR58XzJOfh7woNGclAA8T1XDBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748944658; c=relaxed/simple;
	bh=HUYg6tnlo6LIuj5RzUJU0Hk0XI6OM9+JcOCISjp77ac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lZz3znzG9XRiafgS1lfvquDyPj77YMtwClFUm2HLi5s8g2YhzJSQEMee2z00JpJLVlTak7o0JvxwvmVyj8Vr9UPSDiDc3WM4KjdxF3LkmDyIUJC70j60mCBnQTdOLIuSkk4r7aghovYii5QhUSnP3KGnRo8/YXgV8suMaCKBHXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i1+6MtsE; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i1+6MtsE"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a361b8a664so5195264f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 02:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748944654; x=1749549454; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C6+feKlfKhI5kze4o9p8P4CQwHVLqCyFn82D6V8i7sk=;
        b=i1+6MtsEUFieETwiWbo/Aj1VEfUjjOgZpRxL8MolGO1QWjEQM/2Ycq6Mi074BfAau7
         +EFALgUWN/8xEVxLjWAOG6bR4UfWa2GCIQENKED1nDdt7p9b1Vaavf4EjngtXTMJHdLv
         VOr4oj3JMxHnSsve7VqG4VKBJ2ujE6JsboEj0LqOuelC6xNt5mzAgKAN4/sMY334xHCy
         X8fRVaHBDs8kQBMKh7HwoF0p5E9M5uG+uPrtRRhUZ7LgxPHs5GyW05+bF0nZ5dXv4Wl4
         mJNT1Gs+Fvb940eO8KzDcDN+fRGvD2LmFc4fP//rZ7FtZXgtFjEYnLTU2f3RtYGKbpEp
         tTcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748944654; x=1749549454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C6+feKlfKhI5kze4o9p8P4CQwHVLqCyFn82D6V8i7sk=;
        b=hlLEhwIGPlUqCefo05hrZBqNI5BzO3X5GUwSwh768CxC6A3+a/dGPemPIQnEqT2HPE
         25KhC2yIFRNzinjN4a38rRysrVn8Y6QF1+l1X7smflYkRJcjaCXi+pzK8THKgs/GEP/K
         he6BGPEzH4W785g58FoS2PI1jPQ0WIA4LHSLgYAwd9XoXa9SjrFzI1d3gJAZU5PTIF24
         zuORgyJhMCDEkR1LrRACo07Pe/k84k2PmC3qxMQrJyYm7A/FijFIcSdXVHEQiWPLx41B
         1F653in2grpK4u+FiuTLU3IWElbm/u21r4maJnxETh9tWsvmZ7/Vy6P1pjGrbaeorw4v
         +pTA==
X-Forwarded-Encrypted: i=1; AJvYcCXB7zTcgloz/V/pHUYKPO2NzrIL7d2gXeUOWu5oyjdnoeLjRq5R1BS9u1XFLunlDYbgd7Dl3h04Eb+SvlY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsvfxloISVBMW4FR/2Rk4/09AeHhDBmJJv+AzNWlL5wy/nYYW1
	ZkVLWyRzgqX72Rj6kYrBGC5iIugsGCehhKepSR+bRNLHX9OAK5RBnOWFlDg2DclEutwLAZnn8Gh
	dqDo6Ombf9MztS8m+3sllUDlJrTSiAuP/qdg3u9tT
X-Gm-Gg: ASbGncvc9UCR/uusG4AyC96r+WKX68yg4T0pRRhVuQCcJxlDYGgFrshCmHmtXpprXMD
	wqFWqsNpobypS8mp1dVIRi/ehX2yxl5scnBBtQSsGeRGMQ/ceuPRJWmrn0qrxUzNWjw5yR2Q/Ui
	mShDKGs/aGKIEH9YXCPEjC/dcaw9Cn+U1uPiAkJfbOBdj/ZVfR3EC9mpPTbqycnpmKoAnyHFD8Q
	g==
X-Google-Smtp-Source: AGHT+IFaRpKtfqRwNn+cyqukgUbE7AiFp4RZFCy4cJS/hTiEnKZaWDVSLmPS5HDIyQeVhBx0kCKVfKoLraWlgCMk7Nc=
X-Received: by 2002:a5d:4e84:0:b0:3a4:f7e6:2b29 with SMTP id
 ffacd0b85a97d-3a4f7e62b33mr11322039f8f.5.1748944654473; Tue, 03 Jun 2025
 02:57:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514-topics-tyr-request_irq-v3-0-d6fcc2591a88@collabora.com>
 <20250514-topics-tyr-request_irq-v3-1-d6fcc2591a88@collabora.com>
 <aCUQ0VWgoxdmIUaS@pollux> <aD3PCc6QREqNgBYU@google.com> <aD3f1GSZJ6K-RP5r@pollux>
 <aD6yOte8g4_pcks7@google.com> <aD62ZGBwqXxTroeX@cassiopeiae>
 <aD64YNuqbPPZHAa5@google.com> <aD68BzKRAvmNBLaV@cassiopeiae>
 <CAH5fLgjweugttOtuiyawNp5s2N9JPoo5FTJ+Zs9t_S87ggC1Gg@mail.gmail.com> <aD7DvBfAxKi7Fpg_@cassiopeiae>
In-Reply-To: <aD7DvBfAxKi7Fpg_@cassiopeiae>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 3 Jun 2025 11:57:22 +0200
X-Gm-Features: AX0GCFu2Qb02ePG_vA66oahKh3c5RaA1SFpPb1S4Mza3WCkE8mws-HZ6_8E-yY4
Message-ID: <CAH5fLggKL4jMjrJJEYV=Snqftu+oc4-sTNj9spinON5kHVP9xg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] rust: irq: add support for request_irq()
To: Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 11:43=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Tue, Jun 03, 2025 at 11:18:40AM +0200, Alice Ryhl wrote:
> > I don't think that helps. If Devres::drop gets to swap is_available
> > before the devm callback performs the swap, then the devm callback is
> > just a no-op and the device still doesn't wait for free_irq() to
> > finish running.
>
> True, this will indeed always be racy. The rule from the C API has always=
 been
> that devm_{remove,release}_action() must not be called if a concurrent un=
bind
> can't be ruled out. Consequently, the same is true for Revocable::revoke(=
) in
> this case.
>
> I think Devres::drop() shouldn't do anything then and instead we should p=
rovide
> Devres::release() and Devres::remove(), which require the &Device<Bound>
> reference the Devres object was created with, in order to prove that ther=
e
> can't be a concurrent unbind, just like Devres::access().

What I suggested with the mutex would work if you remove the devm
callback *after* calling free_irq.

    // drop Registration
    mutex_lock();
    free_irq();
    mutex_unlock();
    devm_remove_callback();

    // devm callback
    mutex_lock();
    free_irq();
    mutex_unlock();

Another simpler option is to just not support unregistering the irq
callback except through devm. Then you don't have a registration at
all. Creating the callback can take an irq number and a ForeignOwnable
to put in the void pointer. The devm callback calls free_irq and drops
the ForeignOwnable.

Alice
