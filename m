Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364A1218EBA;
	Thu, 29 May 2025 16:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748534812; cv=none; b=JiFxqDXkgjw3ZPYgwolxXa/IQu+K7cRFAbwxUkXNB2Q0vfms+oSUmbXnFTbNHkGhCwxbZodti9Wjh7SIi2byBT4YX5w3BnSBH51FxrMViikqd4XyLsJU7fDQMMvMNAF2cqOFys6BQO4RYMZpoXM9UwmZV1cjPgpe2mj1dPJJGvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748534812; c=relaxed/simple;
	bh=DZeTq1Z34fV7clf2m8m5aFRHSWmtIHQQYR2+vx5yauE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AUkWPzvzOQYG2oXB9UxGv/y3CS+o0/A4c9sRbr8eMVo4UligvEpfoPF6ZucuvkNs3soSl+1Ck1Y2sS/kBH/mXUUyJuDLlcULKKs9JsOjweDivqhPiGzemHCmwR8H3Q1z6HLgbGkGkmTmgn7UbeM0lDPbGJPKEgUrLEwCzQb6zqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cklpj7uR; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cklpj7uR"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-736c8cee603so57287b3a.1;
        Thu, 29 May 2025 09:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748534810; x=1749139610; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZeTq1Z34fV7clf2m8m5aFRHSWmtIHQQYR2+vx5yauE=;
        b=Cklpj7uRKNnxirKDCegNjCury4OFtN9vG6zAaYqZmDu6/8H8nm4duzNuMyMavSG1gh
         GYn0+QtHmmBQWLySzB5YH3UsCCa23M6BAww+EsVjVSdpHua/KgB2YGe3+JhjTn1MKaDj
         zzNWuFKaKI4zumvcevfC3c1fr17sMbRy32jlN5o904l/WMIaCqyvYaEEXlDyF4ldHyBi
         Xv5rh0tNAGi6hzHgNQAJ+wzPXx6HjZFfUo6VNlHm3W43Vgn/e/knXkCgecghlpKVbXqF
         tJWkcMttCNSS5iMvw1wVevY3J9izW4O1clcxTyCdIxcJqFXXrpkNmyx9Lmzt1NU7lRQd
         5rHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748534810; x=1749139610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DZeTq1Z34fV7clf2m8m5aFRHSWmtIHQQYR2+vx5yauE=;
        b=HqQPvfk28NWRbEw6A2kcq1rpiCgAkwCOJkZwlt9E7/ZA9iugleQl4SteqbH/8p4Uvk
         zm+oBkv/IsqWbKwy3h0mmwZKsMW9A86Ef2h4O0XPElJLN1f6e6ZPfzUZEwpmuy89sKVf
         IHRQHLuyWjDnK0DjZkWYY94OmG7qM/oe7ClKCYDkOefYBBz1e0L77KZFxFDxHULgEb+x
         gt1ZgGUC7GJkkSso23vlNx37mk1+IsGFqu91RgsGlaKv0pUF5VIC5In+kvkDmqXWWvET
         3muFLoqNWW0hIg7UtLgBPXqjwLbJWm92L55aZpcHwiveTgKgKO2Vmb4QTj0LPVogm5XK
         iU9A==
X-Forwarded-Encrypted: i=1; AJvYcCU8f2ZWAnpJ3ZiXKuIDDcIDPSQEizGlQFba+Cdtw63/LdVeZR7tyYcBWkSeh5jPcqkSPDLa03BdeXrEilk=@vger.kernel.org, AJvYcCWfmmho/aNVdSJGDVn7bkbfbwwThC7nScjD+dW57OzR3gz30oVSnKy6dYHfnObChsFORSqAmyVZG0Znj5tQUVw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3bV4j2WU3/NrvhSmp9az+ti0KmNZZFu9Rx1I/XLz2gI+bmzbP
	7ug4KMO+FHiShxCoajBUOUE+64W4vUbtSZTh/DbdGmKGTlzsPEY93E3g43veDQmpLQNpGqn3QAG
	E0C2lIF1WIal8jXDYIbzDnJvfoZvWPDM=
X-Gm-Gg: ASbGnctVfsNkf3ORE8ckwe+/F3sED+sMqBSPdgPCVK2YMIsKCaMv74+8l/qQVY0RURw
	qmiAcjL5tDgOVtVxB8XPvqKNrJ21ut2IL+O3dqIRr597z0gCc4vc+Dwx0VImMYaVKePdMw4PjL8
	rLWIvc0d+PfgzUrmB9TyrgWe/bGfIPvYOB
X-Google-Smtp-Source: AGHT+IG5TCv4i6cmndIU14HLVEQHSuCcRaoH5NHMxQf+i0oNsRE8Ka+3RPquIM+1Q8PuSOZDQDPn6nqCTBSGa+PPhqE=
X-Received: by 2002:a17:903:1a70:b0:234:a734:4abe with SMTP id
 d9443c01a7336-235291e7b44mr818835ad.1.1748534810326; Thu, 29 May 2025
 09:06:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250529-b4-container-of-type-check-v4-1-bf3a7ad73cec@gmail.com>
 <CANiq72=B4JMK4eqK0tL5ECWFAKcBGm0O9LsZ74dd38N2GrZOMg@mail.gmail.com> <CAJ-ks9nTrOuDK1W-qFpsMow5Wf7XG9hGBbf6h_kS2Xo16wyHjA@mail.gmail.com>
In-Reply-To: <CAJ-ks9nTrOuDK1W-qFpsMow5Wf7XG9hGBbf6h_kS2Xo16wyHjA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 29 May 2025 18:06:36 +0200
X-Gm-Features: AX0GCFusN0tT19vkvSVlp_CEDJgnrcd4s8QQKeTlt_7JG3sJiDojFmDHN7OofL8
Message-ID: <CANiq72m6dCQafKUvF5k+Fc5jo1FnGAoDA4XpGU-qNkQe+e-gew@mail.gmail.com>
Subject: Re: [PATCH v4] rust: check type of `$ptr` in `container_of!`
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 29, 2025 at 4:40=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> All fine. The only problem with the version you pushed is that it
> evaluates $ptr twice, which was flagged by Alice in the v1 review.

Right -- this one also has the `&raw` too, and Benno provided the tag,
so let me take this one. The error is a tiny bit worse with the
`$crate::` in front now, but I think it is still good enough.

Thanks!

Cheers,
Miguel
