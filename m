Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320F61D540;
	Wed,  5 Feb 2025 12:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738760130; cv=none; b=G916hoYmDzSQaawAIMG0hTJqVjRErJCjIrBa675jruMujLgLd+PsYvSpZb9P15fanaMScwv/pMxZVHlb8oVlsZFo3a5B3pm+cJddBsZDVATbTSCEbAl1TjRusktd14f7ky9j79aUWLJwN20Ujph7+MjPcamtzirET2xsHg7yMOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738760130; c=relaxed/simple;
	bh=pdO6+jAkpYOeS/DDflPmApHSf/rDiLzOQJfZe1ZN7mw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r9MAepN1J7kZ80wlRhw3mgP5i3Hfx9L0qkjsbIrHiswKeYjj5DTSHXStoQMHtZxN4KgUOrurrCKzNXC2ugatK3YWDvNE4cD3oY9T4PMr4I2rOD31D2njd0n2TtGFgIcWJWvMI+GQ7WpAHPHLbyw7kRm01T1ZldB6cFgJTnzPx7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VXEgYAQA; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VXEgYAQA"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2f9f90103bbso9384a91.3;
        Wed, 05 Feb 2025 04:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738760128; x=1739364928; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tcnHztUUdnVPJ+/5e1SOyz1DfV3d17PwRKV3Z/iivJQ=;
        b=VXEgYAQACLD3bpBF5XFaUZcUIYXQ5w0iZzry0uW5PxApGprVQqvtjP00CpWNceH0K+
         pq+kZ/6DkzPsPtgCGC0SMP8vpqbIDRXqH6ZTFqniqNYnFZrZE83diO4CRZrt2rt9zI1g
         ndRJrJREGTXbfz9W4D57iie0t2OH/98sjh2s2i58m8jzNdHlb1ah1lxngqZx5dPobPuZ
         mlauXjvQpE5EbYl6sR5n23fe0Qb4CaJd+9yPKsS890vhOA+9wr5P8Dn1bNmOR09C/WmN
         g1aQ64WSAAUq1fehw178BAN/EtAUrkz6VVGxX8Us2lvdzEGXEDBY5MhOSLWSMSaeS83F
         LUWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738760128; x=1739364928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tcnHztUUdnVPJ+/5e1SOyz1DfV3d17PwRKV3Z/iivJQ=;
        b=Eogy2XyEU87SnN8MMdwa+UVviaH7ra8gEDnoeqMZJHEc18xsKzQ8UcOT8Uwwiv7vpN
         Is9O4chVD8/op32poH1A1HkCxdxP0l3GoG8kXW8WDV3iqxHFqBo4Bll/JFOvbJIDX+9/
         ZXCAZ5ANjxWoEGlXVDVrUejqHEPwi1mDu0GCyC+nAnFDKptZ2re8gaxKDFdDSRE3aDre
         6+GTvfy/dmnll0inb4btn4pXg7GZyCibl5pQv9GNDBP5Gfaz7EBFhUu3yegFIMG7esmf
         VK+QBpL0QzJEwj+YiIzcw39Omjc60wKPBrN+/FI2lS8woM/t5blA+z7Y5F52hX/iob3P
         rVRw==
X-Forwarded-Encrypted: i=1; AJvYcCUtpQRFgXLRC5K5wL0piIh4Unh6VGtmcaph7XoFHGIFIFO3oHpSFlDiK0qlat4Uv3Zxe0mCTn+TP5vjloA=@vger.kernel.org, AJvYcCVi71IHji1iyP4ur6nixS6yrq+9O5RP+7m1bMQr2KTSR0hF//elA8MjTHtzF8HMafBORMlsZApa4PEIysaBLts=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5ZTK/Hs0wupg4xic1MYfTVovx/i20RL9ARctjiLFQvucZWClp
	gi7uthVc+9Fb5XGRpUAGS4NQP5eDRqf3+aawrdwxlSkUSqnOYBi/D9F6JwQuWxwHA/sU2IiQe9j
	MjiP0MICLVZejL6LK1CLf0iO3wG4=
X-Gm-Gg: ASbGnctqVePw7XqwCRclp1qO6X+8X9R9FWkaUCq/ErIYfZAUzfzhU9jTz9yrVuQbxO4
	5kBF1wJ21tpRnYdmxNPDfDhRcGg/ZeZQ8sG1VQAMyDf3xfwxJo5CFyeozbg8gBQkneWS31Qtw
X-Google-Smtp-Source: AGHT+IEIMfbxShlzWMZcpH2fXxb6ERAAGzN6huAPFG49+BXJdhaAwaJJSRCZ9jGX/NvNM9jk3hqQzfxa7DJVmf7UC5s=
X-Received: by 2002:a17:90b:44:b0:2ee:6db1:21dc with SMTP id
 98e67ed59e1d1-2f9e074fa35mr1857013a91.1.1738760128284; Wed, 05 Feb 2025
 04:55:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205120540.387447-1-kurti@invicto.ai>
In-Reply-To: <20250205120540.387447-1-kurti@invicto.ai>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 5 Feb 2025 13:55:16 +0100
X-Gm-Features: AWEUYZkNknJCFOT8YjssXYTp28ufsyiShHXFJQ4K8n6_FoUuQB29W8RwTRHBk8E
Message-ID: <CANiq72kN-FaciYLuv-mXHNGdN13UpvqoaRX=-0mKE4M9BdtY6Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] checkpatch: strip comments fix
To: albankurti <kurti@invicto.ai>
Cc: Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Charalampos Mitrodimas <charmitro@posteo.net>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi albankurti,

On Wed, Feb 5, 2025 at 1:05=E2=80=AFPM albankurti <kurti@invicto.ai> wrote:
>
> Fixes the false positive warning when there is a comment on a pr_ or
> dev_ log that ends with \n correctly.
> Also contains some improvements on the macro_pattern to make it more
> concise.
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1140
> Signed-off-by: albankurti <kurti@invicto.ai>

Thanks for the patch!

It seems this is v2 of:

    https://lore.kernel.org/rust-for-linux/20250203201149.330117-1-kurti@in=
victo.ai/

Is that correct?

If so, the commit title and description looks wrong, i.e. it seems
that you are explaining what it changed w.r.t. v2, but instead you
should put that in a changelog after the `---` line after the
Signed-off-by tag. The commit message and title should describe what
the commit does, just like v1 does.

Also, the kernel requires a "known identity" for signatures. For
instance, the name you use to sign documents in real life. Please let
us know if that is a problem -- see:

    https://docs.kernel.org/process/submitting-patches.html#developer-s-cer=
tificate-of-origin-1-1

Cheers,
Miguel
