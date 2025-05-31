Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E716C23A9B8;
	Sat, 31 May 2025 14:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748700584; cv=none; b=gqkcxFDqUdFy6iNIrO9R7h9QkevSE5w+5Hi3tW9UPDiBYOdAjpMu0q98zdsvPsh0IopTPHCArsENq8senkwZ7Wl+p4zjs7dI8VQSgbBRg48TUlWtFeihGPLoD89kS4wYYHG+xLo/bLI868tsYOdXA7NldI9/sCp+RS7q3+FsZY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748700584; c=relaxed/simple;
	bh=rfYdJxC6jgp4ss8D+DPbehl2pgusuRgqNoAAJ5YwPDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O5OcO9GQ0rE2/bY0OJgcZSjVT75JzRDWg8xz9ksxljgV65P+TCRj0nbpWVch+1OPm9i0LxOpfpKJiVtmzXFjp94AKKclDcs2bIbm5HYwcxbKmk9GwCaSxJ0Nm8JjNBVN0etJrYuJ+ycR29bi+fjdJdtvK+WR/Rr2vB2zw68qqkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NnjXSF9F; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NnjXSF9F"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-742c1145a38so513537b3a.3;
        Sat, 31 May 2025 07:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748700582; x=1749305382; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jUoEx8H/KVzfoUg1ZEZiII0xV0maDmmY5gK2aXzz3UA=;
        b=NnjXSF9FJcDK/ujhubkulyDzLdYvjvK6DkUX+fOs7aEeKRw2G7j0ygGTjulUq2yZYa
         CKBLIwx4HTpHLCjlMblEPtdyGUGkJ8CHLGoVlVXfbRt6w124ySlp6De3FIMGI6ixn146
         ED6gdPWk8g3yg6/fjqm7IIwMUa7jOLyGfAaY9HRoIwPsS/8xxj00i38hd2n6rWWfcPmP
         Sv9ugpNBPY+2E/E42VfAKPTDlQSJ/P1S1rzLhobGttQVq87o6aXxbY3QJFZB04Vwne5w
         9K8vk/qK2uv5RrOtQdr9wZcBJukNruvFtBcEpnW+wy7/WrwMd9sQ65OhgoZpjs1EAak+
         O4ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748700582; x=1749305382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jUoEx8H/KVzfoUg1ZEZiII0xV0maDmmY5gK2aXzz3UA=;
        b=BJ3k07ezLny1FDqfCVhyA5LSdAKCh38MPW7mCcJ3K3nDTc6Nn+osaT/AKlyrHsYji1
         R94c1Sj1Hqpx3HypSyVD1dWOM7WezBqyu6ZWcbb/AJLzB0uwlMexns2/EOXePXNblLJE
         530hFRpqSAKWM2YlS1xHWMpahsdaXZwcOPYWoGpereFVAnUQ0mNBSGCqRepy87Z0ONJX
         JWcCvPQZSLazvykuZqTvyZi16z1lYpuNFnQwVIzdmVytLFWNJtd35gbP/myx2NbRCREJ
         FMq0lVmzwKL2SrAs9hmUskpp4Ct58XfEaxKqlqiWIUXjO6DA6OMwtdjXq+/yZiuyJj2l
         YWsA==
X-Forwarded-Encrypted: i=1; AJvYcCV2vOMehwNuHZ31FO5qM/M1m9xnaJZuUs7G6Ze7JkDDdgCE8vuFGnUkQJiRvz68SPQhs2hBsBzV85Adnmk=@vger.kernel.org, AJvYcCX56d7LIvMiN49tJdw3WyWhloVC57OWxv9F486DZiFwsQLNuaPH8X+di+5cXWnJXAVRH71DZvDmVlxre1lKySk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yya9vqwUpCZ20SwHlb29iqnrkbMgvmcnyJOxVw6ZyYKSsFKKves
	t/QbEH8fxRAngzg+mje8A1Pn3sWtbimvunh+S5fo40r6QUkWiWk/xPM1iylfqdmm1GELYxUEeJN
	lzoX19PodaIlDYcglh/nnBvFbHNl2OJw=
X-Gm-Gg: ASbGnctZnE03eZYoUyrX3pOfS7+rPDhaCG1Iv6xskk1G3BnqvMCzXkn4EhO7/P91E+K
	fAC4dqWM4yMzF/7SCqwGlC7PmahftuHC5LqUOzpfXNiwBE87T3thPOhv1R5tnyLrsfZlRU0B51q
	1xY8LieVV69x41hPBj1zZKzi5eCwn1zcM/
X-Google-Smtp-Source: AGHT+IEspOjKjrSMaDPUZm3os+Lu9UscySkhErkqZ+b2ldXhGBsFlg8mPJC77+6o2Bz6O5zQXWG7deG8XDVluRWv3GM=
X-Received: by 2002:a17:90b:3c85:b0:311:c939:c855 with SMTP id
 98e67ed59e1d1-3124db050femr3602044a91.3.1748700582022; Sat, 31 May 2025
 07:09:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-11-05dfd4f39479@nvidia.com> <adbf5fa1104978df76ae40705e5df13dfbe59bb8.camel@redhat.com>
In-Reply-To: <adbf5fa1104978df76ae40705e5df13dfbe59bb8.camel@redhat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 31 May 2025 16:09:29 +0200
X-Gm-Features: AX0GCFswDAyLG96-rV_NBPeq61h0apxRhahuyfPFqf41zfiQeci120cEPxAvoNk
Message-ID: <CANiq72n42hbKPmED4PnzCADsy8iM-i0R2dizypTd_Vui5GctJg@mail.gmail.com>
Subject: Re: [PATCH v4 11/20] gpu: nova-core: wait for GFW_BOOT completion
To: Lyude Paul <lyude@redhat.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>, 
	Ben Skeggs <bskeggs@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 11:51=E2=80=AFPM Lyude Paul <lyude@redhat.com> wrot=
e:
>
> JFYI: You can actually just say Result here, since () is the default type=
 for
> the kernel's Result type

+1

> TBH - we should really add some safe bindings for sleeps instead of calli=
ng
> this unsafely, I'd be happy to review them if you do

In case it helps, there is:

    https://lore.kernel.org/rust-for-linux/20250423192857.199712-6-fujita.t=
omonori@gmail.com/

I think that is the last one -- we have been going back and forth a
bit on it (e.g. we had `coarse_sleep()` in the old `rust` pre-merge
branch), but, yeah, let's try to get the abstraction(s) in.

Cheers,
Miguel
