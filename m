Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC871D63E8;
	Mon, 31 Mar 2025 08:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743408401; cv=none; b=J2WuEhcQdHLSmlpVFz+VaeoKGt85M3DdE0dNdfa7au6unDa/71HepUU+o7JzPRBzwWIfor6W4AyqpuNuSSX6TNMeK0VvpWLqoxVjU19vPBjYrFRBossfDtJel2D8Ma4oZL2Y05dHnkU9TB4mOH0UT0BboBdZFLsQE+rW4nl7HGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743408401; c=relaxed/simple;
	bh=pMR0z8cpNwEgCOa/C+ZAgIbmc8jq+a+R5RmTYNg5tEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qh5y/aDesntUPJBB7r4ZljsGrKRDr2vPSlbJUGUF+egKpfqhEfaZEfu2C0ZYXgqp+syuJns2kDNQ/fgfl50gmVBla0JTju/9nG7BHbwNf0/h3Y5hNm/reLCsIeoj6KRX5aNlyKhrPJDAGkNEXczbHqWoSIrPk/f3/J553P3+ws4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g+lvL6eP; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g+lvL6eP"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2ff73032ac0so966895a91.3;
        Mon, 31 Mar 2025 01:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743408399; x=1744013199; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMR0z8cpNwEgCOa/C+ZAgIbmc8jq+a+R5RmTYNg5tEc=;
        b=g+lvL6eP8M3RXTnO2TqhPIBAKNw4VcQgLJNKl+DReJHUFeTxEI7cUAHNYm4CqN+1Ou
         VJ1rcnHGZ4Z+yenb43425tT/jOmLIVC8qOvtAv4UdH4FwcDPzvoo4aCQJ3C8PNgLslWC
         Y0T0hTZ/fi3Af6gKh1OrHfY/fnpN5TNrKK9vIjFZqaSODwWGE5ASMKpFqaqS3OoliLVh
         57ayWf92/rUC+sbX8wmGXltCootgM6w1qUgs/F5gBrhbcbX2DBzdfk5m7Yms4yOGNth8
         ZeFKiTslHv2edfdQO2OuGDTSeIljZTv4fJTYZNId0FYHDFRbT8VWCOytBWr1i3A6xC9/
         pjdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743408399; x=1744013199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pMR0z8cpNwEgCOa/C+ZAgIbmc8jq+a+R5RmTYNg5tEc=;
        b=OL/ehLrY9lxo/FQgPJ/dH1JAOegBjDAahcA7knO8sM2+Ny8Mxjt83bIJ9lRvQfsItg
         iMr3qCWhBQVPQmN6sCbBqCxCIlgzhaw5D9QoVQRsj9Ha3/zbu7O3A5Ly9yG/1Mz2TvYk
         HPwj9ALdYMxJUjCRzxA/QR3xiyL1NrAHNDcccvKBudUKhNDWuNHVUZfHTFgvx43AuvKX
         nGK6KXJE8QaMJo0jytH8rv9ruv+rXqH8MxqTELAgkBuFf18Yud7C0QJ4TdpK6ajkUlMd
         Tvc8rRfVXiyzV4yvT+/DqYr7OdKUeuPjHZO4ArjZfnm+KupJcsRYjJQk7Ru+9InT07yk
         VSZA==
X-Forwarded-Encrypted: i=1; AJvYcCUPO1bYcFMIMVr59GHBMgp+vhhMiwdjuXr1OlJKI8mvxadk4u2iGCcvq808aUaM4uqUaLHDmbSpsg4Kwuw=@vger.kernel.org, AJvYcCVHKpbxp+W6ZMJrX3xA5l1bCwXvTegqkDXNKNLkWJ8WQzkB4yesZx37Umc11GU6pmGj4LJeSejxp87kzKgGrXA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsHAkIFzhEztORrb64/sCb4cOdX464HxrUpdcH8orfK0shRqGT
	UoV/B0Tq41l3vdCiRgJaUOW8z1rBs1uX2pLmSlDKBRKHTsb5FwbrMVRu1rb6mzNchQqrOG+m7I5
	kQPm4c7NmFkmh0L7/8Qlop7EX3xQ=
X-Gm-Gg: ASbGncuQ7ut7BoyHG+Mu0FxbV5TI/OBGXmMgkmuE+HGo3A/huM+gDPEO8WiaSEQ8uSp
	GQ4cIuzxcxCdvwSxkwYEn9vjOjG+R+gPEZHP5cbPFx5TCcVVo/5BIh1C/eA8Bim0ais0RBUV0Ji
	d1HbDJr9ZV3pzJ5BoqRbH907Ry7A==
X-Google-Smtp-Source: AGHT+IFEr3CTEG0QP9x9JSSC55uzenqEQf1h4v7x51TbAttpEEcTBFR5wEcJ9Ba3fd26i3yQIDWH46+NHjF0dgaugBs=
X-Received: by 2002:a17:90b:388b:b0:2ff:6ac2:c5ae with SMTP id
 98e67ed59e1d1-30531f7bef6mr5375318a91.1.1743408399053; Mon, 31 Mar 2025
 01:06:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <AM9PR03MB7074692E5D24C288D2BBC801C8AD2@AM9PR03MB7074.eurprd03.prod.outlook.com>
In-Reply-To: <AM9PR03MB7074692E5D24C288D2BBC801C8AD2@AM9PR03MB7074.eurprd03.prod.outlook.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 31 Mar 2025 10:06:25 +0200
X-Gm-Features: AQ5f1JrrF-mgR2QxkRwbj7EnhKN34r4f1vPBnOG5nf4N9ddejcB1LuCd5hnzsR8
Message-ID: <CANiq72mWjtP3L0_W7VsOD7uAW8LMmV=E8oHSbrT2dePyzthxxg@mail.gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer: fix pin-init name in
 kernel deps
To: "Lalaev, Andrei" <andrei.lalaev@anton-paar.com>
Cc: "ojeda@kernel.org" <ojeda@kernel.org>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, 
	"boqun.feng@gmail.com" <boqun.feng@gmail.com>, "gary@garyguo.net" <gary@garyguo.net>, 
	"bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, 
	"benno.lossin@proton.me" <benno.lossin@proton.me>, "a.hindborg@kernel.org" <a.hindborg@kernel.org>, 
	"aliceryhl@google.com" <aliceryhl@google.com>, "tmgross@umich.edu" <tmgross@umich.edu>, 
	"dakr@kernel.org" <dakr@kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2025 at 8:18=E2=80=AFAM Lalaev, Andrei
<andrei.lalaev@anton-paar.com> wrote:
>
> Because of different crate names ("pin-init" and "pin_init") passed to
> "append_crate" and "append_crate_with_generated", the script fails with
> "KeyError: 'pin-init'".
> To overcome the issue, pass the same name to both functions.
>
> Signed-off-by: Andrei Lalaev <andrei.lalaev@anton-paar.com>

Thanks, good catch -- indeed, there was a typo in the merge.

I will add a Fixes tag, send another merge typo I noticed, and send
them as a quick PR after they are in -next.

Cheers,
Miguel
