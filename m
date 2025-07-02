Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A142309B0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 09:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751449852; cv=none; b=PGggHtc2L46c435HuNsvgeqMn4TOGTTv2/G32qq4zlyc2aLuFoAmc4lxsP5696lj0ztYY9u+dnG8sxVAVngcIyzBaHfdOxne1bzH+qry7WXnub5u2ReJ/vdnA136bKbhVu/Kq6/gl+JdDxqAMVwN7DjovTYuYFhb0lEU/AxwDZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751449852; c=relaxed/simple;
	bh=FZN7ov2fejb1PPwc6riwGfFAbnmQoUBR/y4B+tXjjuM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MEIVKazOp8jXeWW7VP7HGTQP/1fmFnVIaoWs4eaJpDdRYZtEPV2azTeUzJYIlqaMOW61CVUixT14ZY/LsjZMhIguM7Tmq5WCD1PwOhDSHd+S532xC60lyIFFkIzH3wHwHec+inu2cea0XzwM/+fqSzenj2Oc6kHDfh3XMd0Dq+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YIw+uuGt; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YIw+uuGt"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a6d77b43c9so3891556f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 02:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751449849; x=1752054649; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FZN7ov2fejb1PPwc6riwGfFAbnmQoUBR/y4B+tXjjuM=;
        b=YIw+uuGt4vaCEu75NagIdWAl0vMOZyqmwFls8YfBgHkp2zpDAU9CJoGEdH1rK2nLEm
         t4x/4cH/BgKWTvXAPfv9HNUbXBvQERvMgrems2ohOhxR8ZT9YzkW464JbERgYDQYRFS0
         q3yya+u05p1nYoefaSZeZnWMQGNm+qGFVF/Nww0uAE5Qczv2f15eka+hjaj2mgKW5Oas
         gEJUQXXuE84btwzDxnvkCGlkTVLcZcVTnuXR8U9jQhCKUjlK5Co5OF7aYBKpEpIMxVeg
         mTaqqGNMe/RIY23LDmvFktHZNGMpnlN59tjv0wI4nlhXInUJBGsm6Nv8l7YdXsK5xXfN
         Zq0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751449849; x=1752054649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FZN7ov2fejb1PPwc6riwGfFAbnmQoUBR/y4B+tXjjuM=;
        b=txLmvZp8ohT5oc3v+eRw1PHDdTIlCAE+0jTjqy7RnoAYeECBt8b1q3bDcjqm8U2hkF
         InCheTGugnFj9smLbKyXElrsUr0HRwimef3CtX849luOxA+v+hBMinJXnGaMiMhcvuOM
         eHadcSmirQ4QXaTxFwWWqkLlUKhxAzOyCF92W9U0xlnG3VT1lZreDh3x5wnnPddmHUDw
         qQgISHDl+GHKAh4Rbeox81GsRLdVbVU7ttSkjTuAqAw1Qp7clZXHVRDr2nmrq2Ws5acd
         HF6aIKX4SqSzeR4nrXzICNiXeITENPJJI7y+39REpgqp7pyBzfr8zSfcShRGVnmHdM19
         W93Q==
X-Forwarded-Encrypted: i=1; AJvYcCW+6sQ0YiGkTJp7o0EXwkKePMvDtBm9fV34Q36b9P8z0iop7to65WtgceVpTDUtnkMHzxuG6EegVsK3EJc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDjUX6YD+jdZuVVeuNShprCPQdB3M9NRxcj49zZdFxDdtlTH8W
	ucHXxydblNE3nmtYuWlORo5ZwfsFl1MNSsaxa46gv35dn755EpLXjjnzRTnWy6bi9EYM8YaLSs3
	uOuaw/hb+Glk1jc7+Fxn0MZGYlizo0ws76sMydPH9
X-Gm-Gg: ASbGnct/wOKmPZ5z6HErCjz3mYWDTQ5Dro74g7ItGXqFC/i7j6pnlg4KxQAOzex0jSG
	VIskPekKM0dBngBq72xLreI/fHvKeDcc071OJ+xrYoaHLnapAiVVZV/8+ElTSxoQwQdE1txUcFB
	xitoRd0VTs845DnT12lO3fQvCcF3t1uRqNqLUznp3sVyAtb28klmOG1bv7kWXvEwJPHwBJ3q8l
X-Google-Smtp-Source: AGHT+IFinFQvCiDd7DyIlomk5YKpY4AunxXUpyYDBethh+ZqD2nFnCbSEvSWbZeGQLXBm4KeF+X+5F+eyTNv0077ACg=
X-Received: by 2002:a05:6000:43d4:10b0:3a5:1240:6802 with SMTP id
 ffacd0b85a97d-3b2015e19b8mr1128287f8f.57.1751449848583; Wed, 02 Jul 2025
 02:50:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630131011.405219-1-fujita.tomonori@gmail.com>
 <CAH5fLgirsNn9WwEUgFaY2z9+9gG3SWssCoNSzpE56F=sS02kEw@mail.gmail.com>
 <WFqBzZDwsggoxcPQzynlG5_2FqsVdmQlUKufvcDECQUsXJOPHCA4dzoAByNPpuPrAcBoeKoDSR9v3OkJxsYxNg==@protonmail.internalid>
 <20250701.083940.2222161064880631447.fujita.tomonori@gmail.com> <87sejfuf3n.fsf@kernel.org>
In-Reply-To: <87sejfuf3n.fsf@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 2 Jul 2025 11:50:35 +0200
X-Gm-Features: Ac12FXycwJqNF5jcIgfkkGlHIx2iR5_a-gqm_uvnzaU0d1vhvUVxcwhatQ6m4wM
Message-ID: <CAH5fLgjdpso4waCrP6iVaMEOpYLUmqCz8PxqXuSbQBMaxxCHBw@mail.gmail.com>
Subject: Re: [PATCH v1] rust: time: make ClockSource unsafe trait
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, alex.gaynor@gmail.com, ojeda@kernel.org, 
	boqun.feng@gmail.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com, 
	dakr@kernel.org, frederic@kernel.org, gary@garyguo.net, jstultz@google.com, 
	linux-kernel@vger.kernel.org, lossin@kernel.org, lyude@redhat.com, 
	rust-for-linux@vger.kernel.org, sboyd@kernel.org, tglx@linutronix.de, 
	tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 11:17=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> "FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:
>
> > On Mon, 30 Jun 2025 15:33:31 +0200
> > Alice Ryhl <aliceryhl@google.com> wrote:
> >
> >> On Mon, Jun 30, 2025 at 3:10=E2=80=AFPM FUJITA Tomonori
> >> <fujita.tomonori@gmail.com> wrote:
> >>>
> >>> Mark the ClockSource trait as unsafe and document its safety
> >>> requirements. Specifically, implementers must guarantee that their
> >>> `ktime_get()` implementation returns a value in the inclusive range
> >>> [0, KTIME_MAX].
> >>>
> >>> Update all existing implementations to use `unsafe impl` with
> >>> corresponding safety comments.
> >>>
> >>> Note that there could be potential users of a customized clock source=
 [1]
> >>> so we don't seal the trait.
> >>>
> >>> Link: https://lore.kernel.org/rust-for-linux/Z9xb1r1x5tOzAIZT@boqun-a=
rchlinux/ [1]
> >>> Suggested-by: Boqun Feng <boqun.feng@gmail.com>
> >>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> >>
> >> LGTM:
> >> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> >
> > Thanks!
> >
> >> Though you're missing `` around [0; KTIME_MAX] in some places, which
> >> may be worth adding.
> >
> > Andreas, would you like me to send v2 with the above changes?
>
> Perhaps we should use rust ranges instead [1]? Like this, no brackets: `0=
..=3DKTIME_MAX`.

Well, maybe. But I think it's also worth considering just using
english to describe it:

Implementers must ensure that `ktime_get()` returns a positive value
less than or equal to `KTIME_MAX`.

Alice
