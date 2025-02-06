Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B65D1F419B;
	Thu,  6 Feb 2025 16:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738858326; cv=none; b=Lxq1dTT0H9MjIoXmN64hwZ2JdS94dBMhHJX/6mb0Wsl96uuGVl1oIPvx6/NNQl7Qb0fkK3m2owK8GkznIWRbo/Ri0bgfO9BtjIordi2l5K9cK9dMXKdeIFsEHgURrLIEKUwGGoQpCUdPKfP5Nn7oAwCanzbmliilGobvMMQo11s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738858326; c=relaxed/simple;
	bh=HhH4amzXgF44Osc7EyhcoSr3ieMh8P2+h5rl5kU9Ico=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UhCOUXZBGLtmRTJ1Jiq20o2ogyjBjPi3dEXKtZ15eRDGfTZ332I5ibo7x9zqdHIQFGPfxH8ODG07kEhsJTFJ6g7xGzwHFZE7HZbTfk9DH34tVXay5Jl/sHjS1kTQmCNAsbHRuNT45e+eQz0TOjx8SmOL6jaROuDMlTqniO6C4UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fJCu9mMS; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fJCu9mMS"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21f3826e88cso1740435ad.0;
        Thu, 06 Feb 2025 08:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738858324; x=1739463124; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EtZRM/BNpNEwgzIhJIm9sS+WQc95LhJovLyEl9cVNjo=;
        b=fJCu9mMSSQLusTqpPDk8KqR5ll6enNlXtz1IPxg3sDqecQ11f60QqURuBzVJwUEAYl
         qK0qT94s69eBcXqGt5OrZ9Z1UpTWDgj7s2o//U6xnykGvyQqdIkrn6NIgswWI+lsf0Uk
         /GzSC3wnEmrrG7EINmCxHbTiGzvbdKj+o4zspwW16KRVh3MaaMBX7TMvUikXLEDsR6kY
         OcSyjrx1aedRNktdxCSckwaiMspDacfQWS/FIMMnM4tVts1VX3S/9LNfXkKNSAB6rUpg
         DXD6iRvk6gAvhEHj/DjJ8DP5JWmbDkV2hfK6kpCYEEiw6RAY2fz90YuFLYi06oaN2blP
         wanQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738858324; x=1739463124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EtZRM/BNpNEwgzIhJIm9sS+WQc95LhJovLyEl9cVNjo=;
        b=tlwZNY3M6iTDdS/qG3jMos8HEJED9pCxpSXwzvXL71vEqvnBT8+32KFxoALx7NIfSU
         4qJzL7vdZRVcd6imMGt55iAraXJb44FkLnL+sEe0BmnWu/ma0/TeUA+WOOvVvj0NkI+H
         WczFRdsnmbdr0fwcwfNo1vs0DCdHumnK1d7SZqw4tRIGmrCyDjWkgUjAlbXvTNYZcsSX
         +z1SKkvEq/xwW6PAkeV4hwVmYWPfGcJrOdPqcDvkM4S2/QVMnutcWabjSshOQWKDEs+5
         s90OKtFoec8wwK2I9m+i8LRc+CAsCxUsyEYsjU2WUx6nni2hwM8WscaLtUxSf4g2NMCv
         vgyw==
X-Forwarded-Encrypted: i=1; AJvYcCUCdr5Pjvi9q0NWpQYysGNCwxXk1gfi5sCNiSWR+pXrr76OA+u/ecpxTNesywfOk8R0qaMiTOMU9nbM0MoaZO8=@vger.kernel.org, AJvYcCW+JPlLB+YK8THMFnvRKfJVrT7JdZDsW5nsffPWhXtIqWp862NwHK5be+2YB9ABlRbIIkO7nLB6Yq1Q7hw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHZvUjJg4LdJoZbKlfnLQ+3e9u+p69E3RQUeZso28SfXIgFPok
	HMmIQSOoIZaVVN//Q/FhvwF/l9KM3h2/fWr+py6lfP3vwG/0mZB2wbngPi1oawzobd8R7XJg1cG
	uxQIAGeCKQyfIq1KLNGL1lhRw+bM=
X-Gm-Gg: ASbGnctBh6Rtgs/3HaJWvlX8fV6BkiJ+8+V1OzU/Vmj3TjviVLO93F8ffdxILZyxFjO
	32O5ngk4zwUdi0VTYS5ZhlNvSe6cw88Aq9iooL1Cae4AB82gRhoJPmJvEhj9U68aKPdi9qsnG
X-Google-Smtp-Source: AGHT+IFSiXvXNTgA8TrqWkoPQkz+SMbg9VapwbxKW3QnL+WXQCcmzD7oApJb8fPLdbR0/L4ArPvRVwLFkQ3zHN8A5Fw=
X-Received: by 2002:a17:903:990:b0:215:5f17:4296 with SMTP id
 d9443c01a7336-21f17e3e4eamr47980705ad.8.1738858324509; Thu, 06 Feb 2025
 08:12:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250130220529.665896-3-daniel.almeida@collabora.com>
 <tencent_2E2CD1359817A58BB51F59E790325CFA6A0A@qq.com> <CAH5fLgi+Qf=o91XEPamjycdrGeso1yDEDOGNQRmmy-miakDaOg@mail.gmail.com>
 <tencent_9719A47A97C91AAD7453E64CE987EDABD608@qq.com>
In-Reply-To: <tencent_9719A47A97C91AAD7453E64CE987EDABD608@qq.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 6 Feb 2025 17:11:52 +0100
X-Gm-Features: AWEUYZkU1T74Ris2ZJ-7bYKB39i33oG5Rk1rzMhthfMhG8Cal2ozvrFPZNPSTi4
Message-ID: <CANiq72mS-AgdAva4mB=FWf5dh3vZg95Ka7Wv36ypoZXChuwk=A@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] rust: io: mem: add a generic iomem abstraction
To: Guangbo Cui <2407018371@qq.com>
Cc: Alice Ryhl <aliceryhl@google.com>, daniel.almeida@collabora.com, 
	a.hindborg@kernel.org, alex.gaynor@gmail.com, benno.lossin@proton.me, 
	bjorn3_gh@protonmail.mco, boqun.feng@gmail.com, boris.brezillon@collabora.com, 
	dakr@kernel.org, gary@garyguo.net, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, ojeda@kernel.org, rafael@kernel.org, 
	robh@kernel.org, rust-for-linux@vger.kernel.org, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 4:59=E2=80=AFPM Guangbo Cui <2407018371@qq.com> wrot=
e:
>
> With CONFIG_RUST_BUILD_ASSERT_ALLOW=3Dy enabled, this compilation succeed=
s.

Yes, that is expected too (but note that the config option is there
just in case -- it should not happen that it is needed in normal
builds).

> Even if the size is determined at compile time, the compilation will stil=
l fail
> if CONFIG_RUST_BUILD_ASSERT_ALLOW is not enabled.

Yes, that is expected -- the idea is that you cannot make the mistake
of calling those.

I think you are suggesting only exposing the methods in the case where
calling them would work? That would be great if a design allows for
it, of course.

By the way, Daniel, in patch 3/3 there is this comment:

+    ///     // Unlike `ioremap_resource_sized`, here the size of the
memory region
+    ///     // is not known at compile time, so only the `try_read*`
and `try_write*`
+    ///     // family of functions are exposed, leading to runtime
checks on every
+    ///     // access.

Is the "only ... are exposed" correct? i.e. are they exposed? / is
this potentially confusing?

Thanks!

Cheers,
Miguel
