Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F85EAF6
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 07:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749712672; cv=none; b=fixDYenIYdOCndApNsXHsnwHYuEgbGTdXzqOZYtr8oC3Sgm42uJY7zyc/7fPdFFc454nrxOxxgfUavXcnqMYhJk7Ah8IU/Zu0X+oerHIf3j1IpELNclvkr2ieJL/yE3LoTx63ulwwN2UKT6dNyaKw2TQd8u0GLqalCbxpllDj98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749712672; c=relaxed/simple;
	bh=0cq9mrwmkIbFH/Sf763+E636r+EXIIG1dxvu0r08V8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QAdxqRx9HgNsWAHRB/FMibILIEyqC6ElTomkwJGJ5UoWnaEDEd/Qgo5n1AEKKNNPZ7AL7zaGgKNVUzjSq9eqL9Q/Tubem01Qb8/lZPxaAs/ZTWDTo5OeqCCQ72vNVujVz6pVZ567y4cB/KUZb4pPDQhs1Bh4I6z1Nxsen2YXbqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UPQIt3Pd; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UPQIt3Pd"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a50fc819f2so545089f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 00:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749712668; x=1750317468; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4lZ5Xc8Sgg7JMLktm3sQpaBOvvIah6ZDu5CLELnwgk=;
        b=UPQIt3PdPB+HkqA/tKjZEAlGEe5bAsv8PsZw0VL+JtHbElLokjqQIf/DYEc1E+hQyM
         aEZnRkoLofKDaT7Qwl8PMlNYjWRlLy4p1BoC7TJP/nxUObNuVVeeK+yFU57pR5iiTRmO
         fNY7DUj1mew29mOW1aCQ2jyPnNXDNUWWNfFtH1pOJlLn/uejyataanvM6X+MeCewR0z1
         7IyYGT7zOpGb0gBtXy9fFHTeNfqUH4cmHvhJKSY1GjxRgp/VWxfDLT/Zin2tOoE+odD4
         7pKc5iUJmC6HsFsJMo/yeIpWtp4NG2XKEf2RXRoLrOqJYmwgkdnCjoZvGcpEBA44M7Z/
         ctaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749712668; x=1750317468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M4lZ5Xc8Sgg7JMLktm3sQpaBOvvIah6ZDu5CLELnwgk=;
        b=bIu92OKcLK6ZNePSBnUL4QjXGLlNc8sHaEPMwVMm/H9qEdg4knSJIrCbQFwKLZHxYW
         cIN8aMjUjOP0E08PAfqV8FGIAU8uF50SS5eLkw16Vp9/ubyHr8SO2rBnrmzEFEGMCwjP
         yhYeybboCRX8GtWep91mPnf7Lb6+Kka1jI+ImaQRnSHzJiIkdAlMtjS6DdH2c0Hfqqsa
         +k6422A5jCh33DJchim+m3IfKAwLrW+u4bqgBG/8KGQB5SbXyHQ8NzUrUEIu+i8p3NTA
         +gaLp/1PE0IcZ4TMsLu26YZea4I8dTCtiHdfw8B++Z1hrHB4nqD5XQg9wV9+otcdfTZF
         VJiw==
X-Forwarded-Encrypted: i=1; AJvYcCVdU6ywM5ll8j3GUCetuWlyWQXu9tX873jLouOQmYF3jTbxDUEDGb9mSPHgvIoc+xCisFHaA5QaAIMlDD8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs3a53/D8HeParzLdhRxxcEPorkEAayAgHvvaMK/LGJOBPuXks
	PF/k2o8tU5iSbMHZKN2CVcr5m+cCi9di8TqMiCXp4bGz4M4u6aJsqEfCHSSWzC+hHJuaFIevy2k
	2mDmKc/nCdbqRYvRIp9oRMgbkYZC4O5ZDN6Y7EnEa
X-Gm-Gg: ASbGnctjdzal5d4DdC5qkImamL05Z/lOwmbcdTlvpBjh4bUyOdwwOgV/TrqycMV85m5
	P0RfyQIK8IXiNRwE+FzqRqficeWvBukeKJNJt5F60kb95/4mpYFix6yPh7O/A0KsMJP8VYOzwi6
	2wd9jr8+hppehx7WRS6Vtmcfh9AIg1lW+EtOR3ElhP9bBL
X-Google-Smtp-Source: AGHT+IFVENwlpiB0FhUnWMwAZdG8OY0Z7vmEVrUNOxOJYjjMDkrtwYYWbU8xqV2MqAXxaPTmcqM6TG/1TjCO12OW0JE=
X-Received: by 2002:a05:6000:3110:b0:3a5:1222:ac64 with SMTP id
 ffacd0b85a97d-3a558a276femr5207432f8f.38.1749712666929; Thu, 12 Jun 2025
 00:17:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611202952.1670168-1-andrewjballance@gmail.com>
 <20250611202952.1670168-3-andrewjballance@gmail.com> <CAH5fLggTL9Ej8rcakd-gDz+h0dZhA1PRzxf+76EjxotOBJW7fg@mail.gmail.com>
 <2c9504c3-2498-4b59-8e26-0911a8be8e96@gmail.com>
In-Reply-To: <2c9504c3-2498-4b59-8e26-0911a8be8e96@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 12 Jun 2025 09:17:31 +0200
X-Gm-Features: AX0GCFtF8HBeO-AUYMJzrwzUxhIuik0SYdjvdl3lqMZsCfol0tGJgWl8D0Rl048
Message-ID: <CAH5fLghsH=JUm0+t=pj-MnTGGejwxaYiqYT-E-OQ=hZ=aX4oSw@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] rust: device add support for dynamic debug to pr_debug!
To: Andrew Ballance <andrewjballance@gmail.com>
Cc: jbaron@akamai.com, jim.cromie@gmail.com, daniel.almeida@collabora.com, 
	acourbot@nvidia.com, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	gregkh@linuxfoundation.org, rafael@kernel.org, rostedt@goodmis.org, 
	viresh.kumar@linaro.org, lina+kernel@asahilina.net, tamird@gmail.com, 
	jubalh@iodoru.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 6:02=E2=80=AFAM Andrew Ballance
<andrewjballance@gmail.com> wrote:
>
> On 6/11/25 4:38 PM, Alice Ryhl wrote:
> > Please define a STATIC_KEY_INIT_FALSE constant in
> > rust/kernel/jump_label.rs and refer to it. You can use mem::zeroed()
> > in the definition of the constant.
>
> Will do for the v2.
>
> > No, we can't use mutable references like this. In Rust, the real
> > meaning of &mut is exclusive, not mutable. (And the real meaning of &
> > is shared.) We don't have exclusive access to the DEBUG_INFO static
> > here - the access is shared, so we must use &_ references instead of
> > &mut _ references here.
> >
> > Note that by using Opaque, it's possible to mutate the value even if
> > it's behind a &_ reference.
> > #[repr(transparent)]
> > pub struct _Ddebug {
> >      pub inner: Opaque<bindings::_ddebug>,
> > }
> > and then you can do DEBUG_INFO.inner.get() to obtain a mutable raw
> > pointer to the contents.
> >
>
> Unfortunately, static_branch_unlikely does not work with keys contained
> within a Opaque, because it uses offset_of and sym. I can create a macro
> specifically for dealing with Opaque::<type_that_contains_a_static_key>
> because I imagine that many uses of static branch will end up wrapped
> in an Opaque.

Ah, fair enough. In that case, you can also do this:

                    $crate::print::dynamic_debug::dynamic_pr_debug(
                        &raw mut DEBUG_INFO,
                        format_args!($($f)*)
                    );

using &raw mut creates a raw pointer directly without creating a
reference, so that also solves my concern.

Alice
