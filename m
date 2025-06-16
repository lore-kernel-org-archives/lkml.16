Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F15E136349;
	Mon, 16 Jun 2025 20:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750106424; cv=none; b=bLvOmaPPspYT7KvjaKmURv+T/poSBCLW7jVqwjoEEa5HrgzTr4zUBLwHVxDewqs8VyxGVO3C4PRWI8JNfcfkSU0Xgy+k7stxq2G3isz5XTX9WdRO2s5YOU50nXQnXzV849hzB4/kHjvq0Q2FBduQABQ526LU/ywV4/rKBS2h/jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750106424; c=relaxed/simple;
	bh=aEPKGc1joQ8Bgtnb7QcWz/ZdQ6xI8Q9rADM7trjCnc0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EYtz5hLiFXF5VjlUjn8Jp85RQx47Pl5monjU8y4EANXinOCjQnhCTidz0wpuCY7G/b1I0o4hHxtyf2V2daTYaVc6f+/c0DqZMXNB+sGG80GvaSnmMFEyQftDzQRAFemq3bWuoXdeQiwQd/p6LxjputwNa4o95XVPJFNLE2n8cEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WAE/I8k6; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WAE/I8k6"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2363bd24891so6397635ad.3;
        Mon, 16 Jun 2025 13:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750106422; x=1750711222; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aEPKGc1joQ8Bgtnb7QcWz/ZdQ6xI8Q9rADM7trjCnc0=;
        b=WAE/I8k6fQxRI/qbKcPgYsSq2d57mxRLQnf9WJ9So5wC2ohWeLH/KH5O+aVcYz+Yl/
         jW6ZE2tS7OL+LngdvpWMiJFaRQsrb773ffsWdzELvKQbuc0X6MhqmkbT6us/dFN2pDPR
         F2o9mJsYUQYqI5nHaPoOlPv0t4DTnIrqm6oiiJXEq2434FKzvlWajRPG5Absp9QDJ2zr
         u05F31hMRxRyGoEkKEp/VT1u05Sbg7DUsGLkN0fWILv5nOj5vX6e3Hw+RWpPGizmo0ui
         8y6Y56I/3SH3cDgYiGyWi4zXr+6YQwTAjj/BDZ/5w3W34f6BWVIFzLvxOQXMTYIzdz4d
         XecA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750106422; x=1750711222;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aEPKGc1joQ8Bgtnb7QcWz/ZdQ6xI8Q9rADM7trjCnc0=;
        b=XKaopKRS9njnKlCoUWlPmoiouLT3SlRfjpOUz4DG4KDmhguUIB+wNX2UUuLQTV9p1d
         6dNkb1O1DwMnplwcPHKtFTScnf9kNJwV6Lo9XqvlbIvjAJ+vS4WCKPJvkcH2xcrn7A5D
         tFcla0VAbpdO5kdGjHuG0nZvsFAFy4/PBtJBx6mFNblFFU5fqPaB5zdLVOlDNxq9NP1A
         5rfFxwlupPzC+07ro8VB2FysFG3Q3P81b7VBtcPbSW2KRn0nib4z1UgpFV70uGfstzGt
         nSE9n5qxpaKebInhbdZT6/D0ToTx/oM5elUTtOHHdK52RSVLq75yE3TkPYbBKGh0tl6I
         noKA==
X-Forwarded-Encrypted: i=1; AJvYcCWBf2kmBoyxSWkDeJ7xAAWihbjafhwGiLkd0tUOjbu2PhxZqacpSM065StUcU20/b6FXTx3lypcIbSTZGwVFT8=@vger.kernel.org, AJvYcCXeaoGEF/5tbQUCr53smm5tDRjUJBqASh67M9W02EHWtnlRLbKZ9yaW+QDlNs2m+tMUhGXVAsia/p+vx6w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWw+Q4INsBq+YWU2sBCoNJNWI1uuhj/KIa29YvKJLCbv8WJ8tY
	YEqQ5B04rq2PQLZdEZeHga5IyDnsoKF5mqpIRv44o86ch4UejA8Edz6jZuWQQI896WcIjc0DVXV
	yVa7eVbih6VQLtSXgWNrgcoh8iamasnc=
X-Gm-Gg: ASbGnctsQc0cdEZnJ8zKbcSv48ml2lzwXyD35hB6utbzTHIru3QkjMMghuxtyRPjCXD
	Nvqx1g4GbHDxzow6cK5OEoLEee5YeqCWXAMNPbk0KeFc0D+WIZqnM9fMXq86u4tChHpYB7tegYV
	xYQG4H5hOIiXCHVOullwHNh1VoL3qoINNYAVEZkCBArbY=
X-Google-Smtp-Source: AGHT+IF5b+5X5mADBGMDJdR0uuOm4nDqbKvtF5lHT8xKpAvDU+SI02Rnz6hNvVPUHov4xDdp52URkGnK0gHd0dbikP4=
X-Received: by 2002:a17:902:d2c5:b0:234:ef42:5d52 with SMTP id
 d9443c01a7336-2366b202b0fmr57663995ad.6.1750106421889; Mon, 16 Jun 2025
 13:40:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616200103.24245-1-work@onurozkan.dev>
In-Reply-To: <20250616200103.24245-1-work@onurozkan.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 16 Jun 2025 22:40:08 +0200
X-Gm-Features: AX0GCFsHSVDGSvDbmgGFchGInmnPUh1YECnC2h2pOYj29zhRcztauh9NARv--j4
Message-ID: <CANiq72n0v7jinSyO85vorYRFB=y5NH5roW4xLRjwZz+DFJ5QSQ@mail.gmail.com>
Subject: Re: [PATCH] Various improvements on clock abstractions
To: onur-ozkan <work@onurozkan.dev>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 10:01=E2=80=AFPM onur-ozkan <work@onurozkan.dev> wr=
ote:
>
> Signed-off-by: onur-ozkan <work@onurozkan.dev>

Should this be "Onur =C3=96zkan"? Apologies if not -- I am just asking
because the SoB typically uses the full name as usually written, and I
saw it in Zulip spelled differently.

Cc'ing Viresh, since he introduced the file.

On the changes themselves, the `const fn` one seems obvious.

The constants one is OK, though we could perhaps have a `units.h`
equivalent eventually.

The `map_or` is up to style, though I am not sure why you say "nested
if-else blocks" in the commit message, i.e. what is nested?

(By the way, this could (or not) have been split into different
patches -- it is up to the maintainers/reviewers, and it depends on
how complex a given patch is and other factors, but I thought I would
mention it just in case you thought it needed to be one.)

Thanks!

Cheers,
Miguel
