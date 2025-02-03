Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0988C1FFC7D;
	Mon,  3 Feb 2025 22:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738622842; cv=none; b=dGcMYnGLJkgvgnUY0VjA9u+h/3FTPDEFrjKH3EpAvfXpBdonq/xXL4cimqKE6CgheMn60axHFirAlnh82MhfU33HKNOLrxQY6Y626knqbch1r8cA3I4PU4zW/QFcQYs7Wh9B9BYzDdW+pCAhQMheleGGI9CdzIihe2306ljT1/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738622842; c=relaxed/simple;
	bh=7d46RoY65alDw38bKJwoy+yPglRBvvjFb0HrFVhITMQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L1+Ndr5bsUvkIZIIg8SDkvjR3nrKq9wlSxYe3rnRF6vSm0Gr55VrIVT7S2v1goI53k4MX1XXRhGHfdrzQEfCbYl2yJ9kvYozXLIJA2LvnqdHMgQLjsZd9leqlsnfdu6QZUX30Ba1jbI1FMwdWw+z7Ka8iLBM9W2Bdf7suXpvNfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iS3cs0Ru; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iS3cs0Ru"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30613802a59so54979861fa.0;
        Mon, 03 Feb 2025 14:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738622839; x=1739227639; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7d46RoY65alDw38bKJwoy+yPglRBvvjFb0HrFVhITMQ=;
        b=iS3cs0Ru8LUzspNZ0AqNmlPwwIWXGnttwLbVr+K2v8f2z/l3Aia4SUOYiqcGBcHZkp
         tMU/wiZHHVopBNt7tyZ4/1RDpHEYtr+inoJRNoSQUdHRp8MTxUGw4SDRc88DHt9AVAk/
         0eT0X5wgkZw8L6cPViIM0pgHbRtkrJGMIW/bJyDaVJGNg0E1flh9VFALII2fiUa9gzm7
         AC3qvf+BCqfN5TniOmTwkIfhdBt0B18xm3ndHOReXYlYEZSSbPWy1sP3e2RtRoi1bATH
         DIGxhFPMO6Ql7bYLMa2EtuF1sX0XVG6IntGbW8Yb4Z5XsUZbz1cngOM9ffpToKpr7Vvn
         vA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738622839; x=1739227639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7d46RoY65alDw38bKJwoy+yPglRBvvjFb0HrFVhITMQ=;
        b=ui2AGUjSSUoXZBxwzZkdsuCsEJQMPNge0nRr4eLDAlXYh7hjJKXyrF73Xl+qm+Pg+8
         901p+/PhDtLvRzX8ivoQtsMNz0LOh6OQqDqDoJ8dIrFqgZLYRn9FsR7JSo4Wm7i4PYxJ
         MLLiTTySOnB3a+dCp6+WW45sPrXdhd2YrOSBrHq5jX3L3juBHadKgqgBlhYTnfME8fV9
         1TPvN5wzrcSwyzBhsEa6GEniYPvrvOu/pqd6Q0rzRCZ8lALCYfj26OxTf+NNEeZJ6wt+
         y7NtR6WfQoyxUQezTYchQg3Phh5GM9/RXZymaZQsF3hrosFaeDarnVtLYbZBLdh4Er+6
         gZ1A==
X-Forwarded-Encrypted: i=1; AJvYcCV9dw9Ky28GPOqc13i97KJujm3FDkyCDOa6ElgW75E1KNDFmZ1kiLw59vyYbBjm67RzRWVJL2TAga+SlCw=@vger.kernel.org, AJvYcCWMvGn4orTNR5j9UltG3HP0xP02vt/gpadxmWIgOPE4pf/4WQk8B1FoHon8gBfu1q2XEoelsbPB4U+Db8SLSQM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoTdHlcTXhSl83jr3Yqj5bApKjxkFWORQwiM76VaMy04Bda/LK
	OWuV9P5cclqZQarHkz4O5untYiZhcwAeohHuaWCYVNYRbkPRQSaZq/zz4ydSduHuvMc9uFPcU+2
	35KObRxueXxxDERWKonr2ir6coTg=
X-Gm-Gg: ASbGnctrEB7UVv0hvJcgxbaoeCWfyMt0C9XuDGc6/QoIEpqXHi/xwgxtseTH4mvQfse
	nO+wMRY+ytU4ZDZ+E6vWdF3r5bT1QjP4zwPoyGNLD/05kPTCyqgGk6bbaJlBNTrPMDZDlnoYj8z
	7y4yCxLMuiW53o
X-Google-Smtp-Source: AGHT+IFyaX94PZiWjBYdW6Wz4tbz4DlkGTKPrDrnjUfsiCFgUwBdwwtfWYHCIooF3vuildN7LmldMIfovJTbJI/O4OY=
X-Received: by 2002:a2e:9a11:0:b0:302:4115:acd with SMTP id
 38308e7fff4ca-30796872a96mr102119061fa.22.1738622838805; Mon, 03 Feb 2025
 14:47:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250110-hrtimer-v3-v6-12-rc2-v6-0-f71d50f16482@kernel.org>
 <20250110-hrtimer-v3-v6-12-rc2-v6-3-f71d50f16482@kernel.org>
 <3zUeHP9VQ7ZaBieXue_fQ_8V8tcTW1nc83OQA7ehwV7itvlpzwF5DHHmyqTU70UzpXhUKWoDtueUb2fsFQdyUA==@protonmail.internalid>
 <CAJ-ks9mygX61B=FOgQegs3uReBHDju2cs6eFRohjNEX_GPwAjQ@mail.gmail.com> <8734hid0qh.fsf@kernel.org>
In-Reply-To: <8734hid0qh.fsf@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 3 Feb 2025 17:46:42 -0500
X-Gm-Features: AWEUYZn5SU9cpBdRg3Li86auuAMhip7Uqop2pGVeup-4Tv62QMJTLI9KhyyoEtg
Message-ID: <CAJ-ks9=gKET-yaTkqta2TfTaxe031yKqnUHNXFjjJH_AYF2oqw@mail.gmail.com>
Subject: Re: [PATCH v6 03/14] rust: sync: add `Arc::as_ptr`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Danilo Krummrich <dakr@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Lyude Paul <lyude@redhat.com>, Guangbo Cui <2407018371@qq.com>, 
	Dirk Behme <dirk.behme@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 16, 2025 at 2:23=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> "Tamir Duberstein" <tamird@gmail.com> writes:
>
> > On Fri, Jan 10, 2025 at 3:19=E2=80=AFPM Andreas Hindborg <a.hindborg@ke=
rnel.org> wrote:
> >>
> >> Add a method to get a pointer to the data contained in an `Arc`.
> >>
> >> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> >
> > Can this mention why it is needed?
>
> I can add that after the cut. It is for impleminting `HrTimerPointer`
> for `Arc`.

The broader question is: why do we need to implement `/HrTimerPointer
` for `Arc`? Even broader is: why do we need to use raw pointers so
much?
