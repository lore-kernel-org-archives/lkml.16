Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE37879E1
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 15:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743174499; cv=none; b=PPOyj3kZvD0voFKxrPGbgXDs3MneE2xUJAlQduYExLTCltv78MaXqr2LjvXupsjGy/9GcqV/WdnehaHdov4YwlDR3E/uOq9LHboPUwQi6FzAMee9vWHByUKK3TbuchfIDJ9qLc7fTWBswBh0mAWq+4DmlCXztCPSHf4X9UdjpuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743174499; c=relaxed/simple;
	bh=VGu4GrSQiMMLBzkfrV++9lmmMOpw3tUoYmItjCf4DMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NJTpV1MrJ0wk+H1aIk4/8V80hA43q+Uci7lEiinkyGFc5GfnEVCktgG3DP2N4O5bmTlNbqUTczuCMGwDtwnk4CjZSbQaHk/7p89bQE7lNxe9dAIMhVaYwDoKsYZqyRd+f3KrvYy/o6Z4HpFLCDeNbVx5HD+Q9xtAnhKkNieVb9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E3tYfaiK; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E3tYfaiK"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-86d75f4e9a1so1066164241.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 08:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743174496; x=1743779296; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+juXaJ8LOBmxG3pSfp03xaOI3VThFEhwmx8j2LctqzU=;
        b=E3tYfaiKNzoA6L4+PpL1hh4jNbuz5RzcGP3yYpRC2q2oImoRfdGmZ+vlAnZKCl85Pw
         tVlhj27fQ40gz8EPsYe5FyoN9K+BuTxnzBAFyLCdiQDsL8QK+716VcCRq8Q5uzeoLwdb
         GYlOSVQBAyQouZDTvHWBz9F1odjSa7Bi1S1ZUv9i9Y5YkJYKbuPgFGGKMZrdCOlntL8O
         +SAmA4q0yycLeJHVoNzVI3oD7unGNj0fIf7lCcsTLHpP8xE4OtNAbwQumsOVsv/Fdfrv
         fVTjAKTUfXIK/g8dTrWrJCIBXv7XmTBdRCWVMPLqoAwm4CaV7+/+h+Sek1PpprpL/Rsh
         JNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743174496; x=1743779296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+juXaJ8LOBmxG3pSfp03xaOI3VThFEhwmx8j2LctqzU=;
        b=hF0XDLFQXlUIhEekkKNyQWP1054im1F1rDXqpdussEcSun5OoKr/Wgz5UwI7jbViw5
         ivDOgFmlCXRLD+0mxGrK0lMLZFHIpbpjpCaUf8F1z60fxryP7WuFomqUNHzwR5/2k/GG
         Ppz+VPfJokfeWqMtIGYsSl6oECC/gnZodFFqsJgM8dX1Q5kdqTIdzOi0WJILZFRYknSk
         bznPralGeqey9jUMo82ld8+KXmXI8t1/usuBJDyQ/48j1UCSrfVAQqIKOm8QQBvRy8C2
         CHi5wv2QDTpT6dVyWNpvp6qXH5WKxvDI/UnmBeEWAMrJ9en7RBYK2vjwyYottQ+oNBr6
         AFqg==
X-Forwarded-Encrypted: i=1; AJvYcCXQxWbT1WDsvavYuPhqOyn14HQwWIo7ugqnJ4JEA+0my4b+AgW22OaKbGImLAlHA6gS8gnd4XW/SoUPxLo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoziJTG0pDCrgwsqHOFLubNcy1BKLm0FYCY5El2AhQSXT1rtvu
	iD7silzNUm8jE1o8Hc0llLS47Zq6mffSwi6W96b2jcHMJhEvxXZSBN0UHv2CTa5y2qRRwnOIe3W
	I+dt5aBb+hzKKaEsZU6IcGvHQkNXalZcf
X-Gm-Gg: ASbGnctWBDpGmXRTtsPVpvdFXy9jmrRBNAIsFHfXbLmW0TOwqYBpt2OW6+ShqOt8+i2
	u+CWhQDLN0rJJOjBmLak0aPllfWH3sgzkCghsVff+AoCYeorcWAOHlxLw9BWwEF5lweY8cFQp/W
	ZAvMCwOOviBtSv98j46yFcn0CI7hE=
X-Google-Smtp-Source: AGHT+IGW2TB5Pt0rLrAQzKWguP3AvEdN3lRS370FZacNbkDxA1kBarJpL39ObYrkazoD3DY2m9Ub7mdK9YwD3OIBX60=
X-Received: by 2002:a05:6122:4fa6:b0:520:42d3:91aa with SMTP id
 71dfb90a1353d-526008eb4d0mr7133614e0c.2.1743174496366; Fri, 28 Mar 2025
 08:08:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1743163800.git.abrahamadekunle50@gmail.com>
 <dd32dfe6c837d88dd13a546aadcb0bc207b997d6.1743163801.git.abrahamadekunle50@gmail.com>
 <21e624e7-c18f-6aa2-2a16-7cd46e706d47@inria.fr>
In-Reply-To: <21e624e7-c18f-6aa2-2a16-7cd46e706d47@inria.fr>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Fri, 28 Mar 2025 16:08:08 +0100
X-Gm-Features: AQ5f1JrbYHvomeCPHcyZ2r6t6buqhwyRSgbJWoum_rnkO32e5uiGmU0b90AK8WA
Message-ID: <CADYq+fZd=C-EydjBmkP6Rh6XAJS6Kg1nM7zGhyLrGYiLGkZ8mw@mail.gmail.com>
Subject: Re: [PATCH 5/5] staging: rtl8723bs: modify variable names to comply
 with kernel naming convention
To: Julia Lawall <julia.lawall@inria.fr>
Cc: outreachy@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 28, 2025 at 3:55=E2=80=AFPM Julia Lawall <julia.lawall@inria.fr=
> wrote:
>
>
>
> On Fri, 28 Mar 2025, Abraham Samuel Adekunle wrote:
>
> > The variable names use the camelCase naming convention which is not con=
sistent
> > with Linux kernel naming convention.
> >
> > Modify the names to use snake_case in adherence to the Linux kernel app=
roved
> > naming convention for consistency with the codebase.
>
> There is another naming issue that checkpatch perhaps doesn't warn about
> which is the encoding of types in variable names.  You can see some
> variables with names that start with b for boolean and p for pointer.
> Those letters shouldn't be used in kernel code.
>
> julia

Hello, and thank you very much for your review
Do I send that as a different standalone patch?
Or should I send a v2 after attaching the patch to the patchset?

Thanks
Adekunle.
