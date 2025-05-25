Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F0FC2C9
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 11:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748173131; cv=none; b=i0DgaNvyv2jOednHgQJvuS7d73M3KEnbShPdQTU/v2dEC3kEqTkByScCkpgLpNJ+LdUmw6S8U/vDvTD8Ukut/vvSygTisQI8BQwXGk7lXA9xtFEfElC0dgP2akmRYLuZt+1T83SZY2qe/i7emR5Urzz2WCgEpagXmo7TmYpQpqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748173131; c=relaxed/simple;
	bh=gZ+329Gf8Ksd360Ad03Wnrg4lmp+brRRtiiXQxFLyEE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dx2maepTlrjoDlB6V9Fikid1llISgRdZk4odW/K18+y+65Jz/wlQD4+Sxy9SZoE+q77Sx8x54BI3lciUItbIrRMRjnHsnkiICnoNomhvuQM4gqF39WquUqHmArNTmwQ5XLHWXBudwzVz7wD4Lf6zLiuJwrZYiN2cv9UzuamMf+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=co9svpV5; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="co9svpV5"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6049431b0e9so246684a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 04:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748173128; x=1748777928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ERvriPVwqNPqNOdrGzW1XcUiINRpo2cYdPd3Dbw+Q0I=;
        b=co9svpV5jnSf7xY46r/R3YfXguxjGSmLFQngND/HEbcPDmXQtypqll6gzcnnjOssye
         RnecLlkoGWc4QvqwYyHKUb4zwwd1yp7x5uNzAp1I3hnzpdP3B/bJvZfkWXa0fJjunI7c
         ZtYLWOU3a8JWOuniL+vY9rzn6Bp77HBNBx8MECQGlDMjWv8kO/H3W+1AvLhOKxCC3FwJ
         MoqpebtngLDAcdOfen2+FAs7RnUUyELkcFwRgY8SL27GiIHQEl5OAystJAfCRiy1ZdaY
         bDEMhEUX7JPQL4AIAzTCeX9sIcX05PdHp9DGNpAw3b3Hgim+WZ7ImPHVJANhabPfonDh
         VYcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748173128; x=1748777928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ERvriPVwqNPqNOdrGzW1XcUiINRpo2cYdPd3Dbw+Q0I=;
        b=m3jcAmXihJh3jezYAQKCn7k5ODI/q1fFxt+hWOOL2SwkNtSwYfN8AqXRsD5T9670dV
         0g5ab5oNUvT3v3ACiTmqHDv6wkhhJrzvEpZyqEpZp2i7N4O8o9pb271uNicxfydBdEAV
         xbXs8v9IFSYe/ekiiPvOm4bTdsv2w3vWNmBk4TlLkUL6HZvU8/0J2NYDFpJbCLVOGP2M
         /cQBw9f+vQ1l44ube/7QmZPBuj1EKla4qyIacfnZws8tmKu+EbxrzeElSZ/3AZBnvMGF
         6ukhH0nX5uRGCB/I15DxEIshp98ToePgLzgv+xjuD8T9l5Zi4PyDQhh7jHts9bGy/V+p
         +JDQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0QGUkxC3pGqujnH3R4eXKaM2jtMmOxvsF1vywBSLsnIX1/PzFJetkImFgGruYkZHTWTUHNlzs0M10T80=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeJveMjk3cyc48qtw16qvenRFCmfEKK06zi76CdcLzrUq4REhU
	C05qWyDlS9tVd6f00gRzEMGXDgoR+fNX0jb/7oV3g9KngYESBymBVjy/
X-Gm-Gg: ASbGncs9bKRCiT+ElveMkx4L9eO1O9kQzBzZyJcVlRGgcPHf+vcxW/8OSiUbTwB7YSK
	CufdcHgjeoMeQiTdJOBe6kq9MVC8hUOcjVbNkOX+xY/8sFn7yy1Fl2C5EEQK3D6FNL/I7IRJ4vq
	iG80JpRf18R5JVrMLH+yw+29OUI9tM/n3bDPYUsUf6VAZ+co82DHcwRalWGRnZPW3txc96jw7iC
	hn0KES3w1XhNQzZi7mLIfzVJZ8dRZjKXfoUMqhi9KFB52StVMEto+RO24An6stL/e7BN74x1Ihr
	4QVbhEwzmp0KPcAT/5B9GLUxujYR4vBDfFJRsaxLeaGGxb5oMhslHrARqNu6JiBcaig8ZsFTd2G
	PLAOwhBlzWpra9g==
X-Google-Smtp-Source: AGHT+IG+dd7Mw7rBsTAcM+F6iBgNAEFb4r3s0yJJuR+QycpbS1LmESYmw+i5gsM9WhPXoPrfrdsz0Q==
X-Received: by 2002:a17:906:1e4d:b0:ad5:4806:4f07 with SMTP id a640c23a62f3a-ad85b0507dfmr346095366b.2.1748173127938;
        Sun, 25 May 2025 04:38:47 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4382c0sm1543802666b.90.2025.05.25.04.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 04:38:47 -0700 (PDT)
Date: Sun, 25 May 2025 12:38:45 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Nicolas Pitre <npitre@baylibre.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 u.kleine-koenig@baylibre.com, Oleg Nesterov <oleg@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 next 3/4] lib: Add mul_u64_add_u64_div_u64() and
 mul_u64_u64_div_u64_roundup()
Message-ID: <20250525123845.5b023297@pumpkin>
In-Reply-To: <403s8q39-33sp-pp3s-95o8-14s190or25o5@onlyvoer.pbz>
References: <20250518133848.5811-1-david.laight.linux@gmail.com>
	<20250518133848.5811-4-david.laight.linux@gmail.com>
	<321rs9r7-8858-p195-263n-49q78q8rn25o@onlyvoer.pbz>
	<20250520223700.2ec735fd@pumpkin>
	<148nop5q-s958-n0q4-66r8-o91ns4pnr4on@onlyvoer.pbz>
	<20250521135246.7dab6bda@pumpkin>
	<403s8q39-33sp-pp3s-95o8-14s190or25o5@onlyvoer.pbz>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 21 May 2025 09:50:28 -0400 (EDT)
Nicolas Pitre <npitre@baylibre.com> wrote:

> On Wed, 21 May 2025, David Laight wrote:
>...
> 
> Depends how costly the ilog2 is. On ARM the clz instruction is about 1 
> cycle. If you need to figure out the MSB manually then it might be best 
> to skip those ilog2's.

I was going to measure it.
But I've pulled chunks from the kernel headers into a userspace build.
This is the x86-32 code for the 'if (ilog2(a) + ilog2(b) < 62)' test:

    1b2b:       0f bd c6                bsr    %esi,%eax
    1b2e:       75 05                   jne    1b35 <mul_u64_add_u64_div_u64_new+0x75>
    1b30:       b8 ff ff ff ff          mov    $0xffffffff,%eax
    1b35:       85 c9                   test   %ecx,%ecx
    1b37:       74 0d                   je     1b46 <mul_u64_add_u64_div_u64_new+0x86>
    1b39:       0f bd c1                bsr    %ecx,%eax
    1b3c:       75 05                   jne    1b43 <mul_u64_add_u64_div_u64_new+0x83>
    1b3e:       b8 ff ff ff ff          mov    $0xffffffff,%eax
    1b43:       83 c0 20                add    $0x20,%eax
    1b46:       0f bd d5                bsr    %ebp,%edx
    1b49:       75 05                   jne    1b50 <mul_u64_add_u64_div_u64_new+0x90>
    1b4b:       ba ff ff ff ff          mov    $0xffffffff,%edx
    1b50:       85 ff                   test   %edi,%edi
    1b52:       74 0d                   je     1b61 <mul_u64_add_u64_div_u64_new+0xa1>
    1b54:       0f bd d7                bsr    %edi,%edx
    1b57:       75 05                   jne    1b5e <mul_u64_add_u64_div_u64_new+0x9e>
    1b59:       ba ff ff ff ff          mov    $0xffffffff,%edx
    1b5e:       83 c2 20                add    $0x20,%edx
    1b61:       8d 1c 02                lea    (%edx,%eax,1),%ebx
    1b64:       83 fb 3e                cmp    $0x3e,%ebx
    1b67:       0f 8e 0b 03 00 00       jle    1e78 <mul_u64_add_u64_div_u64_new+0x3b8>

If 'cmov' is enabled (not by default even after the current plan to remove 486 support) it is:

    1b2b:       ba ff ff ff ff          mov    $0xffffffff,%edx
    1b30:       85 c9                   test   %ecx,%ecx
    1b32:       0f 85 98 03 00 00       jne    1ed0 <mul_u64_add_u64_div_u64_new+0x410>
    1b38:       0f bd c6                bsr    %esi,%eax
    1b3b:       0f 44 c2                cmove  %edx,%eax
    1b3e:       bb ff ff ff ff          mov    $0xffffffff,%ebx
    1b43:       85 ff                   test   %edi,%edi
    1b45:       0f 85 75 03 00 00       jne    1ec0 <mul_u64_add_u64_div_u64_new+0x400>
    1b4b:       0f bd d5                bsr    %ebp,%edx
    1b4e:       0f 44 d3                cmove  %ebx,%edx
    1b51:       8d 1c 02                lea    (%edx,%eax,1),%ebx
    1b54:       83 fb 3e                cmp    $0x3e,%ebx
    1b57:       0f 8e 0b 03 00 00       jle    1e68 <mul_u64_add_u64_div_u64_new+0x3a8>

with:
    1ec0:       0f bd d7                bsr    %edi,%edx
    1ec3:       0f 44 d3                cmove  %ebx,%edx
    1ec6:       83 c2 20                add    $0x20,%edx
    1ec9:       e9 83 fc ff ff          jmp    1b51 <mul_u64_add_u64_div_u64_new+0x91>

    1ed0:       0f bd c1                bsr    %ecx,%eax
    1ed3:       0f 44 c2                cmove  %edx,%eax
    1ed6:       83 c0 20                add    $0x20,%eax
    1ed9:       e9 60 fc ff ff          jmp    1b3e <mul_u64_add_u64_div_u64_new+0x7e>

Neither is pretty...
Some of the 'damage' is because the x86 'bsr' (bit scan reverse) sets 'z' for zero
and leaves the output undefined (unchanged on later cpu).

For reference I can get the multiply down to:
    1b5d:       89 f0                   mov    %esi,%eax
    1b5f:       f7 e5                   mul    %ebp
    1b61:       03 44 24 38             add    0x38(%esp),%eax
    1b65:       83 d2 00                adc    $0x0,%edx
    1b68:       89 d3                   mov    %edx,%ebx
    1b6a:       89 44 24 08             mov    %eax,0x8(%esp)
    1b6e:       89 f0                   mov    %esi,%eax
    1b70:       f7 e7                   mul    %edi
    1b72:       03 44 24 3c             add    0x3c(%esp),%eax
    1b76:       83 d2 00                adc    $0x0,%edx
    1b79:       01 d8                   add    %ebx,%eax
    1b7b:       83 d2 00                adc    $0x0,%edx
    1b7e:       89 d6                   mov    %edx,%esi
    1b80:       89 c3                   mov    %eax,%ebx
    1b82:       89 c8                   mov    %ecx,%eax
    1b84:       f7 e7                   mul    %edi
    1b86:       89 c7                   mov    %eax,%edi
    1b88:       89 c8                   mov    %ecx,%eax
    1b8a:       01 f7                   add    %esi,%edi
    1b8c:       83 d2 00                adc    $0x0,%edx
    1b8f:       89 d6                   mov    %edx,%esi
    1b91:       f7 e5                   mul    %ebp
    1b93:       89 c1                   mov    %eax,%ecx
    1b95:       8b 44 24 08             mov    0x8(%esp),%eax
    1b99:       89 d5                   mov    %edx,%ebp
    1b9b:       01 d9                   add    %ebx,%ecx
    1b9d:       83 d5 00                adc    $0x0,%ebp
    1ba0:       89 44 24 28             mov    %eax,0x28(%esp)
    1ba4:       01 ef                   add    %ebp,%edi
    1ba6:       83 d6 00                adc    $0x0,%esi
    1ba9:       89 74 24 1c             mov    %esi,0x1c(%esp)
    1bad:       8b 5c 24 1c             mov    0x1c(%esp),%ebx
    1bb1:       89 7c 24 18             mov    %edi,0x18(%esp)
    1bb5:       8b 44 24 18             mov    0x18(%esp),%eax
    1bb9:       89 4c 24 2c             mov    %ecx,0x2c(%esp)
    1bbd:       09 c3                   or     %eax,%ebx
    1bbf:       0f 84 1b 03 00 00       je     1ee0 <mul_u64_add_u64_div_u64_new+0x420>

If you follow the register dependency chain it won't be as long as it looks.
(Although the last few instructions are terrible! - I've tried a few things
and they won't go away.)

	David

