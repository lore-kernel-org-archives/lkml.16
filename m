Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3B41ACEAF;
	Wed,  4 Jun 2025 08:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749026908; cv=none; b=ro9fInuRH8r9SVpfjAOaDqKcPQvaL7F/+3XH0aI0/RvWMPFw7GmcfvLlyaYvsNizy5P1tracST2fJrBdBDavzbajb7fdfDilhpEgGOQ/Dy5wLXY6fqwHf7tx5jvpP6nFwb9se8qzmXstTgGqduakrD8JKcjgKrJsetXQyn1QNrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749026908; c=relaxed/simple;
	bh=B22946g//iI1Zeum0E3UnQPVhm0Sl1Gxrt0bukW4dSc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kGq8UM7iXzJKCsBuI7PKCEHLo1WKU/2lZk7dFp5T4Qb/ZxK4utnGThtRTq4l6qyKO7IJyH2LsyrvijVqvqtQGCeUJTveyN4Y91Q6ER3al6W3OgmWnZEWaVoCtazQfJmubZDn+MRNuBiKJmElXP68K39UQ5a8DKfhhhhXdPILlWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=anElONG6; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="anElONG6"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2352b04c7c1so7059805ad.3;
        Wed, 04 Jun 2025 01:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749026906; x=1749631706; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B22946g//iI1Zeum0E3UnQPVhm0Sl1Gxrt0bukW4dSc=;
        b=anElONG6zJV+9OGPZHOrFJ0KPUn0XUxrFfaiIEMydh7kcNUtIXWCIo4iBg3WHGPFsC
         vUf21ywOa2BbiDmQ0+WjvRb05SESDS7gaWVh23+W64AR56WvQBT8FB3W3aJ7v5EJ/Hwi
         pJgjZKH3f5eHyZUOK0yeV6UE2PoguXVE3tqAwffiA4Qf/8oksj/AzqJLqksFyW5yE3o4
         ZRwjIkAWU05TLBqVeLSB+KPWHH01+Z9lL+I4ZBhcQ3Xz/PPMXjlyWoK0wB/fVzAI6hVL
         uxsvPtclumd1kSh53oPH6DwV+YYGlfVJO0GJcbC6p9Eg/2MqnGlm/Q43EA7Hak0eHzfF
         VK3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749026907; x=1749631707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B22946g//iI1Zeum0E3UnQPVhm0Sl1Gxrt0bukW4dSc=;
        b=A2jCzLzxJD0NkYmnSHnwbkgx94hE0Poy3Q8AL4rz5RxWdmZcnodkQUfM2KBjXfspeK
         Qwl3qptods3lj6Rl8apQJ/f/uvY0FksonwaXs0sqSAs540+2xfYZ00VWJV2gVKbsaYj0
         aK1ZO3AheISf/2+w/vcTaaV+Qda29cuXiR/EapNJkK4++m9exZJ3KDZRWYvYhyTJOOdn
         PlOKhzLePL/S/rBXRYN7kPn74F211rsgHiJENd8oUxIDlNXEjaP0m2bByRvV2IUfsAkm
         gfD8vQr9uE4WNvPS0uhZWCQH+WELaPkFs7V4J0BFBtXlRg06Pjb072tcLb2sSQc7/iUw
         yGqA==
X-Forwarded-Encrypted: i=1; AJvYcCV8Abd+5P9+iRflUMkfsS+rc+9uE1m74yXSzbZIQYbItma5WgOH/8LfJyHxUgxFbvU0LIHkjWFx+mlaB6c=@vger.kernel.org, AJvYcCWlnsjU8u43nQF2JBtijhzDo1IpwEMxIQPZzGPsgbDS6MgRQIqn7KIEqHD+XxmeiiRimsf+XxO6iDt8APhKraA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPhd4LccHhCDbrXEkXnuphROaKnonilZ2d9Xw0N25LGEz2/WCO
	mICLd7eFb1pDp/pMYb6QYkHXzjaiwtnA2iOBZMTy0qQm8a0Il5+GtOCIfuB+b1Jo8yBVVWmUde0
	O924ny3UFMVitkjzWKwAqaYJn1P6w++k=
X-Gm-Gg: ASbGncuVVVEiqkOm2TIhmm315yZXGDOkA9Pkiif8/MCzM191R6OBVvJrYkyyAX/29uJ
	MKTvMYa89MkuF8oWd6+6XFgJFXx7EH21adP5GSMHMOuW85k7TI9ifRHKjWldVM5aNRCugIfXK/N
	eFy3Q/ONmIAiu7cLlIeQ38LO/WdU4g/SoI7ZuDMN6CkQI=
X-Google-Smtp-Source: AGHT+IGo5kz/xDs6MHPuQ3dDfVTBUxM0wfrY+gZ2cPa0H7JewFX4CC+DfgvHavmOLx1rUE4sayDMUurW6TzmyxGZZ1w=
X-Received: by 2002:a17:902:f684:b0:234:d778:1411 with SMTP id
 d9443c01a7336-235e11f7977mr10030555ad.11.1749026906596; Wed, 04 Jun 2025
 01:48:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530-b4-rust_miscdevice_registrationdata-v4-0-d313aafd7e59@gmail.com>
 <20250530-b4-rust_miscdevice_registrationdata-v4-2-d313aafd7e59@gmail.com>
 <DAACCYW3QRQE.1O75L2SHJYVPM@kernel.org> <3eef5777-9190-4782-8433-7b6ad4b9acd3@gmail.com>
 <DADAEIT9E1R8.1J69W5DKYAQGY@kernel.org>
In-Reply-To: <DADAEIT9E1R8.1J69W5DKYAQGY@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 4 Jun 2025 10:48:13 +0200
X-Gm-Features: AX0GCFsLB4H1RcJdYLIIq7_smD_2AP3DrC79dyRAE4xTA9ppo2fCwk6B7iPTvS0
Message-ID: <CANiq72=893T0ZHawsym358N5iexbj+5UEL_RqMA_w_dEbJ+Ujw@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] rust: miscdevice: add additional data to MiscDeviceRegistration
To: Benno Lossin <lossin@kernel.org>
Cc: Christian Schrefl <chrisi.schrefl@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	=?UTF-8?Q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 1:29=E2=80=AFAM Benno Lossin <lossin@kernel.org> wro=
te:
>
> (the `assert_sync` function should maybe be somewhere where everyone can
> use it)

+1, and likely part of the prelude too.

(We may want to put all these into an `assert.rs` or similar too.)

Cheers,
Miguel
