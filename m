Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AEC1E502;
	Sun,  6 Apr 2025 21:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743975134; cv=none; b=ckFco3BIf8MH+7A+vCWny32JwpjXPOIm/BNG0Opc4gVjsA8CsMGWHXJMPgmCaVeYRu+ERmZjlSnu9dZStT0BKbn+ADtkP/xbnSC+FlUKo+QQ9D5bsJzHmFIIlosJNHLlWqi7bgaECVWhcJkPagVHD8X7Ic6jV8Ma3mxS8RQod3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743975134; c=relaxed/simple;
	bh=UXcjfQUPwnO0UgUsVEpN+23KbNnyrfUQcReYlaRDX/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ei/sPeG2GIgsycFrPWZcP8l457Ihfqw26CRiNiXJxGA/YxFaA5oi6f8BnwI/1Iqw5CTTSEjDMa6Dw8LHjicip/DTIQExAc8uiTjdhIp0xv/F2uCU7MuHBjoeVyaLDzRjo8CLIl34vk8w9XIQRJruPLlsVwyot0gXbvw5k82U94M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hgrde5Az; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hgrde5Az"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2ff67f44fcaso755564a91.3;
        Sun, 06 Apr 2025 14:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743975133; x=1744579933; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UXcjfQUPwnO0UgUsVEpN+23KbNnyrfUQcReYlaRDX/I=;
        b=Hgrde5AzgYwbN7Tf72T3RGxjM91zwj5AtufSksIFqPn2YLhtjhvBT0IN2+5FEl55P7
         eMongdMjlHzNNH5kCJSvHUdPAneqpk4s5LMqUqtRRffVZYg6g7fJKvBJBBWxpqsPnkk+
         RfI1E89ziTihrRLY+fjpBDJZdRxCCvFcXoOThdfaYSvrOyLKmomhevrzYPiM+htCgvX6
         EgjFYp/o9rO8Z5YtdQOrqzGXsw/D1y/Yk7+BQo3/WJtTQdCNLh4zv/U1B65j/I6A3rsA
         C5TcEvY3ml7ez3FLAIL3txkrixirMM30zX+SLTGb41VhKUVRrcvQ48Of6SgNT2PULU6r
         /VmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743975133; x=1744579933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UXcjfQUPwnO0UgUsVEpN+23KbNnyrfUQcReYlaRDX/I=;
        b=BlWpIJZbXJ9pZvqjox4CAjBpBFGtjuRruUBwxfECfHt879rjElnX+SlHR+35tTSRRv
         eY1ybbfcO9K5pa+8A0H7X1YlEVnQbb2rfeM/bvUlxq+qCXjnPqGWDopRoem2jODO/zzo
         Zai1CctrjeclTlEhJb3YIYZKJ4ZzIZcACTsPuRtlDaocBCyvfI9Z8iJ5BtgH7vBMIZGR
         /bW5WZ5iq/vxzhTeXG5epxEdtV0UuFpgOYOeHVWvutHyk4LEG6WYw/HlFLpuiB5w5MwD
         m0ZSvAerSzf6R17DcSCGIU6/p8mdLAf2kv9kZcYzqqMh90LGzbDOBrA1PFxoeuV1dcE6
         NL2w==
X-Forwarded-Encrypted: i=1; AJvYcCU5FKNz8o0UMnX+sbwnNFPNvygzp5/Cvtd3eBjLw4zKPhSVOPBCQ/4pbzQZ1ju7OG3Ms3xaX5dARcw=@vger.kernel.org, AJvYcCUA3qAARP6EoOsBU50JqUoYcIg1AKrBllwXF6Xt9mJ5eCdOo3gf52Y2jSb27/6Uif9HaDoyegv81DRUWpNL@vger.kernel.org, AJvYcCWxkEBDXhU+Hlgx+jVAmcavwJAUm2qp1aSC2p+al1eONIRRJrzmd9TWARlx8I+o5zA/CafYw/D5NFCavwP101c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/Sjd9aN1q0rz5rv3OI5WCFO3eh+Wo0ECqAR4JSGoktWv045iH
	xjgA4OLUpoxnSKFVrAJPkFIqbMtOcTYLxU7Qg2dQk9P+Q5Zy1OQd9DkLx0gOoSbtQ4k3h+HetLS
	CHEiUZPwbZYQQ5JrV91G9tf9gy7w=
X-Gm-Gg: ASbGnctr+qB0SoEEYGp8vjEMa2c63QECA5vvJ+1N9Zd7NMgBjuWAA1A+18VKvNaoYD/
	dEc7n1mS+4A8OXW9czUG0P5cM6sKmnHtZEkP4+kanbCEuRzRkCgnSZOPynjWqDxqZVzATi+yeBa
	dTQkF4sksb/5ikUcoOhPvjEmHYiQ==
X-Google-Smtp-Source: AGHT+IFQbYiouQ2/NbpP1ljrGW4rJS6JnT6dvQhKHgt0QsEm4616TsbK3MEaIjOU4GsviHk3ZR9spj/mYoxJr3F/ZsU=
X-Received: by 2002:a17:90b:1d03:b0:2ff:6bcf:5411 with SMTP id
 98e67ed59e1d1-306a485aef9mr5781290a91.1.1743975132691; Sun, 06 Apr 2025
 14:32:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <399cceb4-dcf5-4af8-a8b7-6741e9b7e8ae@gmail.com>
 <0cc991ff-e0e5-453c-91dd-84710bf7e028@gmail.com> <CANiq72=p4zjbvVKAR90wY2saFty6AS+-JCNWRvnFu7VeLzg43g@mail.gmail.com>
 <D8ZV9SWWK1OG.1HLXBSCAR76CO@proton.me>
In-Reply-To: <D8ZV9SWWK1OG.1HLXBSCAR76CO@proton.me>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 6 Apr 2025 23:31:59 +0200
X-Gm-Features: ATxdqUHEJVg7rvB57HIIvKuiXqlFs1KJ3cq29SDoo0P-lZ704b83I5UzTDJ6_DU
Message-ID: <CANiq72kTh94KiTuUkqJG4Focc-ChpyZruDqAaHo-g34=PbEcBg@mail.gmail.com>
Subject: Re: [PATCH v3] arm: rust: Enable Rust support for ARMv7
To: Benno Lossin <benno.lossin@proton.me>
Cc: Manish Shakya <msh.shakya@gmail.com>, chrisi.schrefl@gmail.com, Jamie.Cunliffe@arm.com, 
	a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com, 
	andrew@lunn.ch, ardb@kernel.org, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, corbet@lwn.net, gary@garyguo.net, guptarud@gmail.com, 
	linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux@armlinux.org.uk, ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	stappers@stappers.nl, thesven73@gmail.com, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 6, 2025 at 11:17=E2=80=AFPM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> Maybe we should rename it to something more discouraging then. Eg
> CONFIG_RUST_BUILD_ASSERT_DISABLE.

To clarify: it doesn't disable them, but rather converts them to runtime ch=
ecks.

Perhaps it should be _ESCAPE_HATCH or _KEEP_DISABLED or _AT_RUNTIME or
similar -- though changing it now may be even more confusing.

The description already mentions it should not happen, and that is an
escape hatch, and the recommendation and the default is N. So if
someone enables it in production, they really went out of their way to
do so, and even then they are protected by the panics (that they
shouldn't hit at all).

Eventually, we may just want to remove it entirely if we never see a
case failing and/or if we get proper support for those from upstream
Rust for this.

Cheers,
Miguel
