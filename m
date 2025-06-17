Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638F9D2FB;
	Tue, 17 Jun 2025 08:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750148048; cv=none; b=arKWYsv2Hug6p9jpBdtTgsXlNoIYBhOaxX7x34dN+5DagXkPKq9YwvNo5muQUYSuVAEatlAQKhCg6pkLk/jlAFYLxfJv7in3jw1mcU5IzZjzu5tdI0abebaHLjgu342Afdh/9GMwTt5LIn4Fc6+d//FP2MGuKNdvGqcs3eMejkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750148048; c=relaxed/simple;
	bh=k/E4tuvDIfwhOgujXNxrjLQos1RXOfrBVSIIOpcuDMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YIu0lc+2BN+GjbWaxdCC9BmlmP1/6QqcV1LM2aUf7h8i9K6tScFRhfQNakKdt3FeSXjsSNCt5eGQ8IVZ8F7kw0ttZDfwRxIYC8o/Cd/v7MY/uJN1LmH3YTvY395inGQ6x1DwIJAoDJc3TSCn20PLzY2uYwINmnvnSdeOxSeVLdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WLmC+v3t; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WLmC+v3t"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-234eaea2e4eso5047995ad.0;
        Tue, 17 Jun 2025 01:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750148046; x=1750752846; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ar0/P5Kw1m8fmFtjiCxao5il/3/x8AeYn4OHNHEjEZ8=;
        b=WLmC+v3t30iSBC12BS1tgkStYDfIWCOhgEvBRzTtNNTuQhvU78A6Fo3rhhFql7im/s
         TOiON0eJbahB0YDv0gvEHde3zUBpTDDVtaK0I8wpY0lvQn5/vWxls+C5vZGEkMZQLUCh
         axO3S/5wfyokoA/mjpSrhikqOHwY6xXHRYHQWmlHEZWOmQdCn1OMqHoA5NzQuDcqPOsI
         +pycA2dHphLm780/jtyWUZ6XfDPO2DwNpBUieDx8de6YfqV44Co9OkOmA/kOTdFblR3Y
         RvD488EvmheCF1rPmCSb4jK6SvVVc7EKg1C5MNEvdMUxqSFFtl1KxRIzlsLL1Y08pSr7
         kMyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750148046; x=1750752846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ar0/P5Kw1m8fmFtjiCxao5il/3/x8AeYn4OHNHEjEZ8=;
        b=bUKLO86T/b64TLiGNXHsBJKfi+WcF+qk5PMsScHQDWr3qkGVVhPnncr49VMUDvDZ96
         bZiXOjgRRS4dD67aqvgBglSOoL+wxBNMdhvQELJybf/Suwixx4Y+zbyCLyyLteQEk+5U
         2faYG1yGhiwXXoF6tk3y7rLx69M+Gk7z2OFF774EBJuTlrTIaW+Xau+d0KfMOmsZCHN0
         Idm7gzRqN/xkfx1QlEq1rNSjzlfoRNvkLhWGMrP+p4pV5GH0VPr1YSs4CgawGgedULFo
         uVQP/lpfE/2E587ntR1ynGX8oSP8sfOuH9tY4M3yPVRH7BLfE3jBvkLwCq/fc03vGOO7
         b9Wg==
X-Forwarded-Encrypted: i=1; AJvYcCUmn+XMdxwiL7YpD6FnorUbvCufGKdKyJlNruDLW+IMmIcAssttJ60csRNx0CcdPeGD4BPcnrQ+C5sG/1UZvDs=@vger.kernel.org, AJvYcCVFNjz92a5BlMX5rPmylHTcQrHtIowz3dS6zqPh2V3hmf03TnLrY7xKTQfS7Dem9R20BMuHsF9bsqZVO8c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXr/QHcdNwAQlIONS0T3SVJ5/vm2ELh0KkmDmfp/hdspiUFwDY
	baP7D6Tiun3Ns/sQlyq0W1fn32YrOMwlCYWoVFRrNv3mbnrjpJgAr/bbFiIG7eA13drMX0526SX
	O3F7jDrraxWH/T+IdspdoMcnMOnlweS8=
X-Gm-Gg: ASbGncuW35tYw8ew3+kHXTCipTJMGLa40+yBMBKbLp3L9wbbAqro2H4ZTktx4Bp9R+n
	19FA1woFKmE6gfcCvpHaDah4NNfQ3kZ5/PoRZq3Kia7/yVa0LVbsIkpvo2QcdNe2ssDE6nTkkhm
	S0PFmRAj1AMwkS9cICIu42XJEFUeiF3Eivxv1ImHzVY44k33pJxdu5DQ==
X-Google-Smtp-Source: AGHT+IEwXsaJz09g0M+sCi5MGJqpAP6O4Bn6uzXPyB5z8CD7Hpnlz/4qj935HZY40/z1/cUf2R/60T30fjbq8FhVwMA=
X-Received: by 2002:a17:902:d48d:b0:234:d14c:50ff with SMTP id
 d9443c01a7336-2366b00ba59mr65090025ad.6.1750148046614; Tue, 17 Jun 2025
 01:14:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250614081312.763606-1-ewhk9887@gmail.com> <DAMGM426FUU1.2IESY59SPIIHN@kernel.org>
In-Reply-To: <DAMGM426FUU1.2IESY59SPIIHN@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 17 Jun 2025 10:13:54 +0200
X-Gm-Features: AX0GCFsiKreLRYvHVJ996TB9IOhASLP3kCM0tIA-R3RP27FVCr0UYyKJ8YfeNNY
Message-ID: <CANiq72=egnqm_uY6F0t0t69ToTpREYfENwjVZqUPqi01m0hRZg@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: macros: allow optional trailing comma in module!
To: Benno Lossin <lossin@kernel.org>
Cc: Eunsoo Eun <ewhk9887@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Eunsoo Eun <naturale@hufs.ac.kr>, 
	Benno Lossin <benno.lossin@proton.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 14, 2025 at 8:16=E2=80=AFPM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> I didn't get the second patch advertised in the subject, did something
> go wrong when sending the patch?

It seems the series is somehow broken:

    https://lore.kernel.org/rust-for-linux/CANiq72=3DQUbe-koU-BEhEJ1-7AafC0=
kGcG6HOhiVaR1TWqPoLFg@mail.gmail.com/

Cheers,
Miguel
