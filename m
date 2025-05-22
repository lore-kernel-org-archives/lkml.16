Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FB81C8613
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 22:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747952158; cv=none; b=ZY4heK0URkaow8745Rm8tqM9dA2j+PCJGM5IbnKrR2hNcoAocI+y9LxAzzME7UNQPr7uGvqRtLGfPAXPD0YYufbciAoCz/Vzx4A3muw0rg+LvHsNwCjX+zOYuDeP0FM0uHD5svaZohq/bqpdGqfoVA8Na7N65uw4bAQ0IGLlIjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747952158; c=relaxed/simple;
	bh=HMVPD+OZ4s7bW6e0XRDSTuuwdVn0ze69F4/9nj3q3/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tlIkn6x1A5mYI7EELxVygzEgLm6B6ErabP2EHqVsUp/yV6FhLBX15d6KosuuClYtwSS2QISyXffbaUFmJhciEKoxmq0y2x06higJtqdnttAs+sr7+t4InkoKJyaJo0w9GmayDHAkNznRh6Qp7/rbpxe+QhLgOKiGN5u3kEjCbX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lxXppN3d; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lxXppN3d"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-528ce9731dbso2024366e0c.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 15:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747952155; x=1748556955; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HMVPD+OZ4s7bW6e0XRDSTuuwdVn0ze69F4/9nj3q3/o=;
        b=lxXppN3dwx5vBk4EyPhdHZ3+Cm5MfUZAzZB8Sm5NNEmDPj+VOE+//P+5s+DI6G36Gr
         y0IZyFzHgdAZvuNGua1mZRU+Q89ZJdk6+aRdFZ+ASKGFcEjbvDzyLltncjr7uSqEI3iV
         +V2wCJI6tlbqLTleGPfgGMkdfECqkkfrRNEkR1Lpz7Xyfh23UMp3zxOXsinzhqGS4YcK
         AjD8xu0ancepGsLgXHWJ7R+tml++r59/P5qA87VnUO8JFGhG5HjPszezRBMAChxQdXQP
         eGfsXG82zQmLZ+jQzYmx4AkwF/s+4ahQc/NkVwFEuyB3B2CXnum3Tw+j/xvN2TeBB/nr
         2N2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747952155; x=1748556955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HMVPD+OZ4s7bW6e0XRDSTuuwdVn0ze69F4/9nj3q3/o=;
        b=NE8clCkDEpP4VBgoIp8TMOqRoL2WNvCrc5H/qG9Dsefi6ukQs92WG9Qr57WAO+TXOl
         fXdRauUL+M5J+dZnEw1a6YBL3Bh7JXg80wWrSkyi2eU746HY9zSVxm74zmddJU8fucq2
         9xEBX0zYw5Oal0KutF4OFsi5ElCXpJt1IZo1WPOVL6vCRkSDxfy4M7H6IrlyPTLyH2Mj
         J0QBcyskuIuyHTdsgURHjKz4rGEXa6mw+WuzLvBWJPLd2WVimFHnCuP6bvx1/sMLpDN7
         OF3MaMvf+xIctwyhjrUjz52lzp2Sf26SyyRrfuiiRthh/FTp8NYmzhvvzo59Gbe9LdC5
         Nmtw==
X-Forwarded-Encrypted: i=1; AJvYcCVdyHB1R3z06tes+TJT5FBnbrm+0LQlPlThUF89TiPKUj06hKaoOPAuk0zLTkLJsPtac7N1bqIACiGYiPE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXvT1CS5jJ98uRVlNeYBHhRBScK0GRj6Y9DLKDzBT4vE8buzj8
	y+wUa3Xu2M6XfbB6wFWxysbGO1BSkqTg1Z8ZhhPQalOgDigad9dzqnXyaqH9Cs9A+qEqHEWVwP8
	vQk5M3kPnhzhFFA1I1bPEV481U+fzUUA=
X-Gm-Gg: ASbGncsGnAGNkyOCLRT5Hk1pVynxJcfhbJYy/M4vO4sK/WUMnYf5eoe3yWLdEPKiaZB
	RrmYIvjFrP4dADEUHD/ihsLUZy14RWs23Hq2QfClORw4RqdigxzPf//p6TJw9jiwIrQTZTChWYc
	Bz9/AEqyc40NO7FVeqrPFoLgIaYj57tkkCvQ==
X-Google-Smtp-Source: AGHT+IELKM+qJGk4ES+SzP+nMeVkDl1p/ATvfrdoyJX0Rrj5FYUfqh6gUJLEkF1LESGIA7CBZLzcWZJYbiLJSeeTdrI=
X-Received: by 2002:a05:6122:21a3:b0:52d:b855:e0b5 with SMTP id
 71dfb90a1353d-52f1fd00ae1mr774306e0c.3.1747952155267; Thu, 22 May 2025
 15:15:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c221c98dc2369ea691e3eb664bf084dc909496f6.1747934680.git.rabenda.cn@gmail.com>
 <2f33a148-2a6d-4906-b2fc-6a8c853af3db@isrc.iscas.ac.cn>
In-Reply-To: <2f33a148-2a6d-4906-b2fc-6a8c853af3db@isrc.iscas.ac.cn>
From: Han Gao <rabenda.cn@gmail.com>
Date: Fri, 23 May 2025 06:15:43 +0800
X-Gm-Features: AX0GCFuthVeZjjuVfaYZWDOio-cbzgkI4-MTLHEvOEchzx8VHJF-GHdmQoeZq-A
Message-ID: <CAAT7Ki-0dNFU-DJNVg+kA19D29W25fiEVQcP6SakvgCUMhQz1Q@mail.gmail.com>
Subject: Re: [PATCH] riscv: vector: fix xtheadvector save/restore
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Charlie Jenkins <charlie@rivosinc.com>, Jesse Taube <jesse@rivosinc.com>, 
	Andy Chiu <andybnac@gmail.com>, linux-kernel@vger.kernel.org, 
	Xiongchuan Tan <tanxiongchuan@isrc.iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, forgot to add the fix tag

Fixes: d863910eabaf ("riscv: vector: Support xtheadvector save/restore")

On Fri, May 23, 2025 at 2:28=E2=80=AFAM Xiongchuan Tan
<tanxiongchuan@isrc.iscas.ac.cn> wrote:
>
> I tested this patch with llama.cpp while adding xtheadvector support.
> Surprisingly, this bug did not prevent the LLM from generating plausible
> output, though the model's responses became noticeably less coherent.
>
> Tested-by: Xiongchuan Tan <tanxiongchuan@isrc.iscas.ac.cn>
>
