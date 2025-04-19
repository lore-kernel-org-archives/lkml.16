Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81B11DF244
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 15:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745075594; cv=none; b=UQGz8JE2jlTKVxtwxgU6zYGq/96Q+RFRxtdHl3lx6YNf+ImXL9ReE3/3UyP/9VY32hAfQwb67IZmGxi+NgVEaqZmHCX5mj7a5n7gulB9vaU+KcUs+B8YmaKmydJFAhy7OrERXR5cNFCt0UZRCYk/GL2Ti5BO6FtD/mTkuHoPnr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745075594; c=relaxed/simple;
	bh=3CofW3nXZrmceK15AfW5p+sn2cuh26U/EBkEBaryD+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OQWYc+gCzf2c78L1FzIiNrE0ad79+XOQl7JWtQ8E5fbqC564Y0chqZ6D4U8MVwBsdzBLQwg+jwGnAqpdDL3OBv/w3sf258mJdZ3jpHeYUcdSTn972qJ1wMS32SQAf7Yno4ksdUsgSg2Ge0y4nfaoXIWYp0cc9C1XacqCDq8hgbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ol5o6J5Y; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ol5o6J5Y"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-225887c7265so5020465ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 08:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745075592; x=1745680392; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3CofW3nXZrmceK15AfW5p+sn2cuh26U/EBkEBaryD+4=;
        b=Ol5o6J5YGlmJCwov0PT6UF29xSWf97XkshgniwE/775S6NlGAkAS12Sxx3p5v/Bt8d
         HpISJ4zjikmcoZNuXEMJSnC2v7el/pD+6/2naeJsMU+vf0ARloD1+8BJQhlvog/q04a4
         +h2lP1UHy2/EdIsaM4A6yfut73J8YInBc8Io8GriDFC8Blm/KnT1xkCP7Zar4AHIMSvn
         KYr3IJ1DRYyIi0pCf++Wl1487Guf61pJhzc9y27RkOSC9YPnxc2z5guMx7crXm5/nXv4
         xBqerE8tXNYERLWiRGpozZHJ1c6q+mhsMJ08MeIyUylQFWBAL0OQ//PRvoEDvskCIiQf
         Bgyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745075592; x=1745680392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3CofW3nXZrmceK15AfW5p+sn2cuh26U/EBkEBaryD+4=;
        b=AkLAD1sWa/8V7yxb2V3IT8buZj9gJHGT/Y1+NP4dVf8rI3kg6K39lgLvo4IjKmekH/
         jO8iTVJoBIleDC50NLhWWHNKz13m7LBpAIXUbdHTdbUb8F7wDHIzfVmtP68iNi9Wq73d
         iWRrP/8qdyRhYMhjGBpf6xKW/SGi2UcpPwFvNnG88oApnQhhAXkGCvBaHDyzumK99677
         wLp/EBE26iImNkU2jIjXda9j/ngWvOWUz8POmVccSyixiuqHiCR02XYQnikWfhgiBb1M
         /rfSq8pXDTPUwaJB/bOho2LSPx4M6HsgU48unx/zkvl2vmqWVgeaFGGc59L+0zFUB6xP
         MR1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVJD8IGW1pwVuqKKlwogIZTurXuNHzDAMUPK1iDE8jjm6SGzJEvOsxUcOztQhY0NM0qZGdYVENmmq2Figc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqu/C8B6itfMRvCX7bfTNau5GYLhrp/y98PzM13FHovY+GzL9v
	ctESKf3pSsNvHoUUNW8ndfiVcWI/n15CxgRZgis34Ab7HOb7naIaljFIC5p7NwjHJYwx0h0VHzH
	evXQUtCF8ae9HO5J5wJkBQzIOCk4=
X-Gm-Gg: ASbGncuY5Ff5YNJfdfSpmuyFaaO8jhcUlhf2H0rxjxi6I2jMvA37u1k8BfIZ97Qvj08
	xpTaZngKu+uKQl4jOwasG21WkIowb5evQp2R2TT2sU/ovb06tgdl5gsdV4FWNfjJluBe1tunGnm
	PZy2CITYsnmsXw1lj4MCy9WA==
X-Google-Smtp-Source: AGHT+IHphlWBMlhbjmkBFyfL/q3M6NQmqluoHQlXSEO9MJG1hNTqWNBruXB375qqofrrESObQZb3L9dpgWeNX05VWT0=
X-Received: by 2002:a17:903:987:b0:223:f903:aa86 with SMTP id
 d9443c01a7336-22c535db69cmr35553235ad.1.1745075592062; Sat, 19 Apr 2025
 08:13:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402203516.GA281819@ax162>
In-Reply-To: <20250402203516.GA281819@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 19 Apr 2025 17:12:58 +0200
X-Gm-Features: ATxdqUFnjA3ZiR077fl60cIbz3BhN8_bCQdWMv9lLxf2UOBn49aVsMCbRZ24eEQ
Message-ID: <CANiq72krxPC3s=+UiGfe2wqypfMtKTs3yjo_xa7Y8G2zmXd7qg@mail.gmail.com>
Subject: Re: Prebuilt LLVM 20.1.2 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 10:35=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> I have built and uploaded LLVM 20.1.2 to
> https://mirrors.edge.kernel.org/pub/tools/llvm/.
>
> If there are any issues found, please let us know via email or
> https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
> opportunity to get them fixed in main and backported before the 20.x
> series is no longer supported.

Build-tested with a native defconfig+Rust x86_64 build -- thanks!

Tested-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
