Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A56720C01C;
	Thu,  1 May 2025 21:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746134906; cv=none; b=op2uB8LnHfWfZv+12SCt3UaVi+einM/q6uIa6VPbJoRds9ZmMK9nguNSmYR36eAGIEjJrr6r38NPbbLVqV7hE6BKGnTQVQITqqRWjZewKUrIyWeUT39EnWivjIXYJUo2Atnx32pBfujlBkvc3WsoRGMag2QNiWNOU0JWGiH3AJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746134906; c=relaxed/simple;
	bh=605cJofwZF2Yh2+AsDgGAjAP/+kAhRpYSptcLHnt1HI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=su5Bp2CYfrpqteDTzQJE4dy0Cre5H4kQkGkCJqz8AjUSelhESzNWBzWglquQWO6iEAmuMKzDB0JwszzcmhjxBx0TSyZMTkuZbzLpNLUD2NKgyC5hMZiVMNb4UBFgRxXRvhNuW5C9m0M/bDIVyR6ATn8f0DMT1hTy8s+GYnDk9oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ePizqRaw; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ePizqRaw"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3032a9c7cfeso154313a91.1;
        Thu, 01 May 2025 14:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746134904; x=1746739704; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=605cJofwZF2Yh2+AsDgGAjAP/+kAhRpYSptcLHnt1HI=;
        b=ePizqRawRerZQSbTGwU4VQezjaTImrzXT3Mzt7qBB2LThEad121hs9WmhWuIQSieAS
         VSHhxbVX50oN0ICjJ/r3cq7Duyhxa7DwqnnUuwH0Ow37zpYknBJqcGlJShh0PQ5SJF5e
         Mf7/lHMEv/iCoOuQtcnyandmWKFltD3VNOJS/VNf3iK+khiKr2W3sch8YsGMEuV5tuNW
         B/yhUOYocAHMPoHK2Ez1M5sJ0GKtLaLH59O1VJWXj5Eyo9h6A0oNkWOwW+6pa1hDhxi4
         qZxySWfZZF7geSO7eyCKGF9u0aWeNrORNKprrmedtiiSUb2wT9rm0GzlyuwSZaSvlRxI
         Vz5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746134904; x=1746739704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=605cJofwZF2Yh2+AsDgGAjAP/+kAhRpYSptcLHnt1HI=;
        b=Q08YS0eoAsCvlEH/j4ZUmG56Ia4IX8qTP2rf4ohjn7HB/dvsB2T7ALG0sPnhXwncqz
         KUtPmwGvinRcAchn9dlUXc6wNoGzPSF/no5ZSFVlfm3EzFSBmHkE8+DbP6AuAxmC3sut
         WRtIkGnIlMY2cIB9pPl2VsT7VTiZ7qPnfrmVpfN3dOGT7RDqlE/zsuERQA7brNP8OWbo
         NGDCep3WCt8m8D7JPpEcD2TlRgdTYLsW5JdRzejeT6w3HRWq7/ETLuNjojPDY4EPUvU4
         D9nPvwGMIe+9sb1X1F+vyIfLMEoRfhzjPEyqzkg1MntWTM52ZbpbsLbU1Ti5Jmd5s3JX
         SN2Q==
X-Forwarded-Encrypted: i=1; AJvYcCW/OZtn2R1fxpElqvmGytIff1O4fILjoNtOfmWkpxOUSFGe/2kATbo8AvQ8EOoupWbeASnSyaLIDAh4GBA=@vger.kernel.org, AJvYcCXkdDNyD3yDEP8Dsvsf00au9AbDV3oVCTPSQBxBs/P9VaTmwtXj5flaXU2urb/AfkMhe4I9zm4IoZQnXPwuW3c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/DfPcR1jiBlzSStFN+i2rSGBadx19+fMfKXP7Rf5TJtldpKTw
	PV/edcKGa67qPPu8//RmqjzKp7SPXrwptg2wwYDc63SMHh5BdgBdJauyPa3xe6IKW0cfpcSBlZx
	ZroX+3426PuXbici5uW6KeDFm3FU=
X-Gm-Gg: ASbGncujyKaN8BHGKATL+JOZIFVdSW4TQWRrFbiSInRoUiE5JD+Gzx1ssyIDYv4yN4N
	F7bpp/BQPrlPs8xoSod/5lBFchm1MDmJ5/iX0t5eTS72XaSIFv/6M7PFPNf8MgnHBHZBx+c8Jwr
	H+uMGlk14oSGDWdGpm+7kzlZ7OHQEo1BJB
X-Google-Smtp-Source: AGHT+IGi+2DdQTaYueO6+nHZPlGj9gbHL0EUu/2kUhIa9+btPbRNXJllCrW/6X3tii93OItGqLGRaYQMbA91c1kv3RY=
X-Received: by 2002:a17:90b:1642:b0:2ee:f59a:94d3 with SMTP id
 98e67ed59e1d1-30a4e3f01e9mr398188a91.0.1746134904286; Thu, 01 May 2025
 14:28:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501-configfs-v6-0-66c61eb76368@kernel.org>
 <20250501-configfs-v6-1-66c61eb76368@kernel.org> <ELsEgktE6XbGxDyusumtuVzyX-eotyYuQdviHTZaIxN7KZaGFr0fNqrv5tac_gYWfbDZYNTC-wQyQuxnmufA2g==@protonmail.internalid>
 <CANiq72mS_HV5rDjP+t+k0jX9QeAgF2SB9_xX54iEBTH-GoPuEg@mail.gmail.com>
 <87msbw1s9e.fsf@kernel.org> <86-cT9dBPpEIyQXWVCeEmj3TRvBm6Ta0p1B20sSngRGOqOuC96i6hG3Q9Hg3bN8AQTCPXlsxg_C5Ok0G4JJzpQ==@protonmail.internalid>
 <CANiq72nd0Pfv4TrpULGQ_fZkyBpHyVVZ1H45_RJBgBxkJuzCJQ@mail.gmail.com>
 <87h62419r5.fsf@kernel.org> <FLMJjrvUlrMEWy7KzihcYUt-V1IFyP8nt9KYysmVPsWdxUR9dRVXsRoSBw4Z0oFX8tzfWieBDkP7YPAHOXtFcg==@protonmail.internalid>
 <CANiq72miL3eZ40ujmA-pXCqMS8y2AzJQ1UKpL1_hX03AJ0fteQ@mail.gmail.com> <87bjsc154u.fsf@kernel.org>
In-Reply-To: <87bjsc154u.fsf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 1 May 2025 23:28:12 +0200
X-Gm-Features: ATxdqUE4ehUxDxCshNJBlGTuG37ycuOAfHWYd6xHU0XQaMK7_2afIBYOTDc_3ZA
Message-ID: <CANiq72=SD9ogr+RpPK7E+cFmn2qAVu+MBCoChdp8-hw7JFu6zA@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] rust: configfs: introduce rust support for configfs
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Joel Becker <jlbec@evilplan.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Fiona Behrens <me@kloenk.dev>, 
	Charalampos Mitrodimas <charmitro@posteo.net>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Breno Leitao <leitao@debian.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 1, 2025 at 9:51=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> Ah - I understand. I missed that you wrapped the assert in a const
> block, a quite important bit =F0=9F=A4=A6 Thanks for explaining!

Ah -- that explains it. Yeah, your calls to `add` were from const
contexts, which explains what you were trying to say.

You're welcome!

Cheers,
Miguel
