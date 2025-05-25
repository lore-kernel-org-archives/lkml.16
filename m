Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B61315530C;
	Sun, 25 May 2025 18:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748199097; cv=none; b=J6cCKrTxyX8RlT7Q6tx+rMVfxe59P+jg1n9xom5Z+MQWO4sQJcr+8HgJ2tddH1mASdXP37OmswAHY6+mMnTkAgkb5myQrIrKiCHED0xpaJuNgIBn621YuFlmaGJ7mhmQ1QMSa1SXihBrMEleaP0h9UtDyDbyTUefzpGRCDYecrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748199097; c=relaxed/simple;
	bh=V4igBd45ZOKeA3g/IOG5/1HlIN08t6LSagwz8rIKO1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bZSgtyWZbu80xPAl0OF/RKBXlX+Xzr/2QJeJDh1eCpNyRp0jnlsInF7eKtqSDo2CtBUvPYyJ1J38jIE821Adb514hskm1exqWC9KlcqU/e7o27M60lOuhKOqVwTmF5wLuF3Lq2644Y/ELQfTI+G4U2xlgm2ATyXcE5em4maBVTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S91ousph; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S91ousph"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-30e7ee5fe74so247058a91.3;
        Sun, 25 May 2025 11:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748199095; x=1748803895; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=icUgK4Nx1x393/l0cexADU1oHMQseQ/XkCyFeZGcea4=;
        b=S91ousph/icxlSd0NQDjVJisc0u7CCOBJKvZCqPJ/l9EvJNpSqniuT3dkEb9uH5+EF
         k8t+wiyRe64iVwe3V+Uig8309UKOsFG4yVzaL/+f1n4db3ZCVVunWnssJZGdM/eQoQP7
         XtT03NscHvf3VTQNWOeuE8Txg5RZhFBjXyuS/Egf26ZNSVjUeDgJ6FDWJYqPCux2TlXz
         95K+f0UnM0AThtqblNsIo6FKnHOUBo/W4vUs8zBtE8Bq0x9uE3gagqEtzWt12PaAljWW
         gdy/EJQdhD2wITlDMOKqTp6TXUnuo2w0sQVi4J6FRWDmv/ke7oZ6+zPFCgFD1tGoqXrj
         HUDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748199095; x=1748803895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=icUgK4Nx1x393/l0cexADU1oHMQseQ/XkCyFeZGcea4=;
        b=bb7y5GUvwn/og0eOaiOyhzsRsImeBwHpmFSI8I+nD/XG3zBSEAixXXmFoePWcDdtN+
         40a40VxqSSGvJXiv6WgQFZQ2kHG/tmjQ1Jk7CVW+jOGVXkxFqI4saqD/JIFQilWYFtmV
         KPNSgDPmLa4FNbhjR0j5/+TxHJfjva/1/ntcu8AaQydsQVVFPjAkI8r4dlRVgB+Un611
         FCpx+6wPlhun8B8h3z3RBQJGhAmILCwae4BpUv4L5ZAvGDg44EstBE9aqL8wv0ES10mU
         32kufdGXb5rLJaYGseVvr0cL4FflW1fTpW19ik/1jzAkjiwSlgQai+me9YdFMP8fZMef
         syVg==
X-Forwarded-Encrypted: i=1; AJvYcCUW6CUZnjFKHGe5XPPdJKRZUq8Mb/aZ7mm++JME5C39GrlMmdZmbp5jweUMlKclQERdK3oZzdVL5kJX/3w=@vger.kernel.org, AJvYcCVUur0Q+Uq5acy9rPCGQ27NlAB/h9U2YrxvzxzryYmfHQAttgjhTPhyKOskTHEGSsIiSpppzBeWS/ZVu3PFucQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv7WP3OHzLcVe3jsv2pQn4Q8ZHtfKjncRgq5zd39R3/xjWm2tt
	XQRTVi9waUFuseJonMOm9vIb8FNRfnfG02LUG2Z45VCsX5tVhDRNDSy3MV9r0vLMYvZ6GH+MZs/
	JCF1QwVu2oPx8+welxQ8DwKYRd5vr/2wFTr53yeU=
X-Gm-Gg: ASbGncsP9h0LEx0BeDCnYEj9B+E5oualQgKSPO/73v/nO1XIt9puoK845KzO5aGUu3Y
	zBTp319W2aLxGd3aYx9EHosQoiMLzUxEQqcUmROym2igN1P6BbFFFIEgs+ZiSMzpfY4DvSoi5v0
	6pQjrxo3NAr0uYXXCRizokk9o0JvVHL6p8
X-Google-Smtp-Source: AGHT+IGvTO7g4XOXb1QoomUDERCViyy1Fi5bmKA51T4u0ft5DNU3sG+01poPbxoK6/h54BFKOn2BfFA66uwU48G2290=
X-Received: by 2002:a17:90b:17cb:b0:310:cf92:7899 with SMTP id
 98e67ed59e1d1-311106aff88mr3656118a91.3.1748199095240; Sun, 25 May 2025
 11:51:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250525173450.853413-1-lossin@kernel.org> <DA5FBED7E1NX.W675V3MKQSMD@kernel.org>
In-Reply-To: <DA5FBED7E1NX.W675V3MKQSMD@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 25 May 2025 20:51:23 +0200
X-Gm-Features: AX0GCFtsG00mLkCpaERAM0JQvr-ixqJrlGZR-gwpn95h3ia4krN6H6KFoOcU2C8
Message-ID: <CANiq72m_L3YBX-_1yKdknyn1VU9h2fDcTROzTghzA3grz8aT0g@mail.gmail.com>
Subject: Re: [PATCH] rust: list: fix path of `assert_pinned!`
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	Xiangfei Ding <dingxiangfei2009@gmail.com>, stable@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 25, 2025 at 7:39=E2=80=AFPM Benno Lossin <lossin@kernel.org> wr=
ote:
>
>     This occurrence was missed in the commit above, since it is in a macr=
o
>     has no current users (although binder is a future user).

"since it is in a macro <rule that> has no current users"?

Cheers,
Miguel
