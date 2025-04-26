Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5FA6FC3
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 06:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745648209; cv=none; b=ky3X1G5cRktZXfQ6WQhqPPUW8Wa5YqYwbEfh8Do1BeBhbsdmvjUqUrML1FjEtspJjsGAcaS18D9S2URPS+jYmEXdaxcx8QQJsQJAU55Et0+IigYfDi44vaWueKgIx7XX4dga1bCzhLpQYvqNENdLTfacEZ4phno+rcFBBGGDYYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745648209; c=relaxed/simple;
	bh=IYqWRy70BwPfNez9JQY0bWErxeeRQ1VBIlJa4x9Bogs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fjsr1Y/eNzsjLjubJMVL+rp83QbJOGHip0TxVP71PI64wKLj6QoxUbXr7fg1Fzdvgzg9x/n/iiSlonWAKmRlQxctwnHZQsEu52WpnYW/Uz7kdwHppz/sMABJjGNhIy6/uL3yMv4ovLyt/63Hi/PdCYuwqCkHSzgqKYIqyhQM/Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=IkYWTtSe; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="IkYWTtSe"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ff6cf448b8so4174928a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 23:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1745648206; x=1746253006; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IYqWRy70BwPfNez9JQY0bWErxeeRQ1VBIlJa4x9Bogs=;
        b=IkYWTtSe9TgvdqijRFNGnDd+KuK23rcpHVK2tFKg1eQOlKNRrgQgC8+kHqo2rW5Ibs
         i9Sn0L+I5y4AMA7CXlWmgccCFaQWKBqiVURAwRRCKL3LpP9e+ohjCaZlfAvJynJc+qHB
         9n3C39yS+dG9tJl317mvbj9KH09JwN4BYMHBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745648206; x=1746253006;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IYqWRy70BwPfNez9JQY0bWErxeeRQ1VBIlJa4x9Bogs=;
        b=KBfbpQTsIlyQ/3ay1CcbDZJQU7kFz3ufB2yP32fQGppIlxxgY4cls9TGqtMSfsxpAs
         xsT3X00avT8+sq15BX2d5+QwR25wPbJn4Mqcbn0IWn8LkbANXnMJtAAqKAX95bOqQaQw
         D1DqelBcY0nxFXVpcUgvqL/r9NxWfq7qEaQtl6SaXErLUAonbalybPps2XE49lZb1tBG
         DqU+lCDOGiIvN+4Ry3TKSrKf2lhqQu/UauSGGQFi+9N36vVI+lOoNii5tEQwVY/uYC0T
         q9IAYx/M0sxANep2zSkxrDN8/Mi++VCqM5ynYDqYyWZNSG5CZ9Z5UXBH+H4K0I9YYHJY
         Ar6w==
X-Forwarded-Encrypted: i=1; AJvYcCXRf9EsEOSABws4Ef6Ip42CXnWh5LE26nb9u1da3rwUzQPIdkpeRT9CpHITZZ6hiLvdMP9JpT2aStNI3jw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2N8PnVObuybo7zzdSXYpg2BcB8T4UBUJdLBy7NAaRPYHwUMgA
	XD6ndVC4Xp2IjXOVp6uSJLfYAbH8uPhf+EQOqyhMImG9WshUrRXD+TXZJJQVWPmjswnZwKMqK1Y
	1ycx43CGjOXDU95EnI0JRCljvxEUcdRhuNG1P9ySUzetRHrI3RUY=
X-Gm-Gg: ASbGncsg9H/uBRSF72S2sqgxjhuacuVuNOwx/zhsFnbycXmpYOWmruLsKXX6Rnvxfnd
	ENmr+DxlfUd8lsmE2A423JDEhOigYk74DZDHVQv8DFCXesOJK09a7AU0z+r7TWZBa9YT9Mkuig4
	1lP9uPQha0BzaKqq867R3f5dYi0TtB7+Wb6qCFmcF+wEYLzxp3R3PXIouC
X-Google-Smtp-Source: AGHT+IELi2tAHEnPLQw6SkWD6XCJ+BLVNircwkg1uSUwyHTfIlK05UK7mBwZhXLlKl5iKatN0cG48Iruu7f5Eg1I+Tc=
X-Received: by 2002:a17:90b:3909:b0:2fe:b8b9:5aa6 with SMTP id
 98e67ed59e1d1-309f7e9eab0mr7065118a91.31.1745648206483; Fri, 25 Apr 2025
 23:16:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250426041212.4141152-1-daniel@0x0f.com> <20250426051423.GA8239@1wt.eu>
In-Reply-To: <20250426051423.GA8239@1wt.eu>
From: Daniel Palmer <daniel@0x0f.com>
Date: Sat, 26 Apr 2025 15:16:35 +0900
X-Gm-Features: ATxdqUENDeJQTw5UpF3mEseOMbv6ZdkIL3YMLuvtOl3-rRMiQjZxBnh4QgURelU
Message-ID: <CAFr9PXkU3W6DdYKhHz13K7bk9bnik67R85wqYUwHeROKEx59zA@mail.gmail.com>
Subject: Re: [PATCH] tools/nolibc: Add m68k support
To: Willy Tarreau <w@1wt.eu>
Cc: linux@weissschuh.net, linux-m68k@vger.kernel.org, geert@linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Willy,

On Sat, 26 Apr 2025 at 14:14, Willy Tarreau <w@1wt.eu> wrote:
> Nice, thank you! Could you please also add support for it to
> tools/testing/selftests/nolibc/ and verify that it works ?

Sure, doing that now. For now it'll be using the mmu enabled m68k virt
machine that QEMU supports out of the box.

> changes. You may possible have to add a few ifndef, as I don't
> think we've ever had a nommu platform yet. If you face too many
> failures or just difficulties, please let us know so that we can
> figure together a suitable solution.

I need to test actually building and running something for nommu but I
will do that later today.
Making nommu test automatically might be a bit difficult though as I
think it only really works with some changes I have to linux and QEMU.

Cheers,

Daniel
