Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DD9281343;
	Tue, 20 May 2025 19:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747769127; cv=none; b=k+noOTCUyVFLNlv2hagy8PaRr9QRmON1joiq9l4klbRrnPIgH93/HMqsjICSsDREITfPNAiJfBrRdwRsraVc5zsVFsR88xXLzKTnJJlZ7Nce0igRMZa2VQUC0s5HigX5vf36bwp/S6Hu86+g2QmGdrjUeSltjsdIgYyv6cmG4oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747769127; c=relaxed/simple;
	bh=xRG49+PpG7U4ZkVsvft/ymPJLA1JQ82j7TzgDK5o4V0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dhw8f2zcwD2zQgpNKxUfVevtSFu8PXV4e2UQ52SKo8ZjTcqdu6ls1+jvjQAZU9r3PUThUgXSNtqhyZA1NlNATEexj2OjhghDYRHrU3Z+LN8XnxVPOSpBamJT3DlPWOxuZ/VBHr7ZbKw8GXD8a4P/nhCEQQvpR55khaRzxh2hBgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PhL2s4CI; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PhL2s4CI"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-551efcb745eso3658195e87.2;
        Tue, 20 May 2025 12:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747769124; x=1748373924; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xRG49+PpG7U4ZkVsvft/ymPJLA1JQ82j7TzgDK5o4V0=;
        b=PhL2s4CIA+TjtcMJTd9k2O3Gvtx3LChOvP0km7EeMcQeabqKGd1mPyRRnF1e/Xgh54
         itjSBIeG4Eqna1nPc3ByBD7oj9S3rOodTOqxwXCQcscIVAXY2/c1r9AB3KnDpeEMNQi+
         odTK0hjwDGeNC76lWgygWCdPVuqtOMf7YVqi3qitYlgEa5iBMrPwJOTE01Zbg7ctoOLz
         R/DrRfOhhsjoACGoCpr4Wcm8nmKWgcQjXDxYDWYdCNGEne0aTSa8Rn7OL8ua38T+c6Mr
         U6etkZr+blR74Ll29N4vs6KJqo/WRvUFpgCMXraSsBWE4c4m1XUNKcwoKRl2yz/VBUZT
         qobw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747769124; x=1748373924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xRG49+PpG7U4ZkVsvft/ymPJLA1JQ82j7TzgDK5o4V0=;
        b=n2VV4b46dxyY2p8v2zG5p4Bk53W7FqYAFCYye4NSwdPqY2EJSt0lrwwIcFugHfR5Wm
         +PiHN397YpIh2Tjb5W9h+D4+aaKHGEd59hw3YLrJoLYDs70dOxqlqVZiz2kVNZy/sATj
         3VMKnmTHHcCLmz8WJxgtknWiC0CYMI1InUdL3vQrZdmsDcK8JrRHG2lVN4/EIggBjKCq
         lR8Bma9OmxHoQnKV6sWc4b/Nn3LqD7vCpYAd7tmBRaybZQMm3xAbWELj2/Q9z8kL7ZcK
         Q/333zvPPtqOYoPuRwyrUyDCOtsSerW5QiUp+EVQTTxEQcgIY/UxCB0ZU82pbTAca/3X
         OmdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQNwcw6R6xlKgzSkB6+PozLOWmGPK+e2IcYJAn7QjoHwmhBwSMd/fipDqNWUptH6jJdAVvwEFEMU334oo=@vger.kernel.org, AJvYcCWwaGT/PzN8KpWjYx0x3hJGdrMhGODLML3eUCNoDG4RaH2GmUnTrMFTdv81uzB0m+FuJWBZGKWCUpfvVrm4Wu4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVppc32guwZglcszW1Ge+Z5j8POIMDYDdXzdh2jOD2+pAomtA8
	No8HDjwYHYAuePQV1vw3D2WBgXxIERIcjvepv/eEm8TbG8sUTlgudyUmZDScq3ABgbS4dx/chdG
	mPl/v2OOai9Vj7JysxekXVwVttMZlHCc=
X-Gm-Gg: ASbGncvOSyyWZlzDkdoTvObUH8ryCTcjIiSaXKR9ZUv40nACl+v6EEl1teV/vauLV4L
	y1YTwTj6OELar5X6f7zTIwV/44I/1icijV6RlhXTc1ukEpUT+s+cQiZBGu4eb9GBf261/CMNOXW
	BjTs6/FgbdOpxjT33OceiwMTmPHvorkgMsuuuYGUjUKyfAgkTmPst3p6K54LyWi+aMpQ==
X-Google-Smtp-Source: AGHT+IEt231Hia+2d5t1uKCJJ+Q/JT7cC/Op/NwMXFOpCHRunyocwxy5yMFgmMlR7stLBoD1FpbxO2tKh2yObJYkw5U=
X-Received: by 2002:a05:6512:650e:b0:549:8cbb:5443 with SMTP id
 2adb3069b0e04-550e724a21emr5127582e87.47.1747769123724; Tue, 20 May 2025
 12:25:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520192307.259142-1-lossin@kernel.org>
In-Reply-To: <20250520192307.259142-1-lossin@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 20 May 2025 15:24:46 -0400
X-Gm-Features: AX0GCFtuqgLLr69Nc8UFXGTMandfNmhiFetxWkvHV9Xr60PZmguzdAcmFGi9tkI
Message-ID: <CAJ-ks9nX-JtQ4toZjYnQ4Y7-pzpLhO5OVYffGSt6V9L7xxUVbQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: add `pin-init` as a dependency to `bindings`
 and `uapi`
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 3:23=E2=80=AFPM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> This allows `bindings` and `uapi` to implement `Zeroable` and use other
> items from pin-init.
>
> Signed-off-by: Benno Lossin <lossin@kernel.org>

Please remember to update `generate_rust_analyzer.py`.
