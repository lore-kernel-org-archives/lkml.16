Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0661DF731
	for <linux-kernel@vger.kernel.org>; Wed, 19 Feb 2025 14:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739974911; cv=none; b=QUGgTf0AWYx+GjgYgBsoVwUbalYuPu8mV9gTRgVNF045bcYf3z0M1ru4MOK7GKk7sgdixEajy283lUZC1v5DgjqmblYdGtw08jZ9vkJzpkEM4FmrfdvmyliYoN9OWlx05+GWnY74cc8VzGcDwxSoma5Lj9J+DZn6mXkBOoYmr6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739974911; c=relaxed/simple;
	bh=BMno8u1jQaY+amMq4TjieD7YTySdfmoY+TyBJeZ6gJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sunRAwP/BcBDuZ8OxX+3apbxeFGWYf+sk7DsO1jj3S66vj49IIu6IfNQoTU3f3lxzOr5JGqONDKR3ekiMBEyg+C3suZKO7IfNH/iYVATdLWQrQ+Dbk8PrMOHvZ4OBPzI0hMSUWQ7A9/5X7T5SDcQX9J5wi5rp/S8ppqsvfvuj5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D68LsSnd; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D68LsSnd"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38f22fe8762so3427187f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 19 Feb 2025 06:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739974907; x=1740579707; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BMno8u1jQaY+amMq4TjieD7YTySdfmoY+TyBJeZ6gJ4=;
        b=D68LsSnd0l2V1mEaFSNRhy3UY+MeUWpNXajdBuXF64JV5q6h1dYeshXUJ5Q9UuhmJM
         pJwFJckMIlLxoHH111qeJ/3Yza7hlZFkHzB+uoMIJ7UWW9HZ53edNxNSMNu3BrGviqeM
         NHxFHKyJbOrxAUxi/gXBEngu5OCFlOVOoBZ2pBHUSa6sN29os2YiZhu7liPcnlRSCtdR
         V56gzBYzTxlceXuzLrhupXBGVjhpjpn1YeT6gCc9RHdyDbyaf3V2BvE3aMODjmjP4Mmq
         4axnACaCTXGhTfKR1msja/FSvYP7n2LbSJPJcwnaBkpAftEayqt1g/8uGMDU/GGr5/Mn
         3Tpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739974907; x=1740579707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BMno8u1jQaY+amMq4TjieD7YTySdfmoY+TyBJeZ6gJ4=;
        b=aUex5XW3HBThsPG27TL/rMYt7j38KmDvJsf1gYRYY+UnH/hXBtJa910XaeHJtvR+Gd
         gKw0+KXaUta6TexEdDFUPYEh+rs5Z6qV0BJlVS+Tux8ANijnoslsKXY7Nwrko9ahnuBV
         2uMqjeZxe4Q/SWM4V5qmxcPy0tOfvZl6dIqUyyajzas8mrahQwVSNhy6cia2Tr1Xp18M
         dhh7BqxrOxzwRG5NlS+VJAAdClIE9m6gtdl5EodTM/UlXiNJneoirZ0B+j3E/M+urfkt
         hequa8jYAU4Th93Xustu7dyvrUrEI9zwxM/rgVbHnnfUGhDTIgUtg0hGLC2+30AWOuGc
         fpkg==
X-Forwarded-Encrypted: i=1; AJvYcCWwButphN/IifJDxY5bbROt3ktYQ4luHdwPjgO7Xa/3RHTFrzoKD/BdGSOfO+O4LYQUP3owe6fuchYn1XY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhYiD+niSMLT/DqXkQYIXfYfjCU74arhIN9fRuebOJvCrWvWfX
	yyGH5ADlRRcwHWSelJgioxW9eFmttE86DP8+FLVRA530K9l8N25TjShelPR0OhsI66ZxgnaHNLM
	3fi0hwad1Zv1P8vfV4URSTtzPSmudcEuAny4o
X-Gm-Gg: ASbGnct4+nuHEuxtCJSUWKaBsvqst3DTOE4TvaRmG4fb7Aib/TsY+LUXbHxYF19BCX2
	i87PD05IUM63LF3XausYv+Ki/5fzkN92nOdR/r0ZdcFXJbyB6LligHMFnyNRH5gbWYqbeytSZvf
	j7z6GWyVs6NrUNYVkAoqvkUS0=
X-Google-Smtp-Source: AGHT+IEHmOP0OIR1HQB+AjYFJidgPWNTjvc/OEe0XXt8WeB19O5qwBJSAHxS1wUWMJ7zNk/RjiLD9QwOgvYqKI3m0cY=
X-Received: by 2002:adf:cc8f:0:b0:38f:31fe:6d37 with SMTP id
 ffacd0b85a97d-38f33f4e465mr15693858f8f.44.1739974907594; Wed, 19 Feb 2025
 06:21:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203-cstr-core-v8-0-cb3f26e78686@gmail.com> <CAJ-ks9kyozt45VeXG7GBTN-ejy_HGMOekFYFMmzS8AbEusZMWQ@mail.gmail.com>
In-Reply-To: <CAJ-ks9kyozt45VeXG7GBTN-ejy_HGMOekFYFMmzS8AbEusZMWQ@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 19 Feb 2025 14:21:35 +0000
X-Gm-Features: AWEUYZnUHqYYyjcRH7G7RaAxm0DW3eJL1Y81A4cBEKNG0n6V96JVQgaaYR4P4lE
Message-ID: <CAH5fLgjUuCo5Ayx4WCfnrVAC1prvUbY-pvZdinkAb+KcSOWvpA@mail.gmail.com>
Subject: Re: [PATCH v8 0/4] rust: replace kernel::str::CStr w/ core::ffi::CStr
To: Tamir Duberstein <tamird@gmail.com>
Cc: Michal Rostecki <vadorovsky@protonmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2025 at 5:05=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Gentle ping. Trevor, Alice, Benno: you all participated in the last
> round of review - I'd appreciate it if you could take a look at this
> series.

The primary thing that comes to mind looking at this is that losing
the Display impl is pretty sad. Having to jump through hoops every
time you want to print a string isn't great :(

Alice
