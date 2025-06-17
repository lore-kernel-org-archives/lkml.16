Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7852EE986
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 20:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750190500; cv=none; b=a9JQBZ9H4uM2Yy2kZqkSw/9vFauGs1kWQFF9l+7nF3LkfMjcDd7sqtSVixTfV4ZzdESpnPUdcJqfnaVVcIG965VcEHEzvXsd6gqLRG6YSON//WcIi3vc3Udn52eE+OKBxl9RuYl36pNA0heCRBu9zxAC74ZNvpKYXzsDHAupvb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750190500; c=relaxed/simple;
	bh=LxLRIM3c0qdb2zOAm+rduDpDgZAMBgw5SL6tNGivXSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uYrqRW5okYxLxyKwmd9csUGfVT42eObjPFKtZj/8xcXKK+FndWHOyWUZbFUrOl14nIgiPSymoXCR98wVVinLRMNzB9Bhs+lIcSnuU92//tWEKJeCSGCZzZNrjRsJ807amu5+Crp+3pG/Tn58ODzGDqCXS6amLzAjqptH6XHqHtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nXcepmYR; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nXcepmYR"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-312efc384fcso1076128a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 13:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750190499; x=1750795299; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxLRIM3c0qdb2zOAm+rduDpDgZAMBgw5SL6tNGivXSQ=;
        b=nXcepmYRusl0Yl9e+9nF3DDb1IfnNA5RGQUGPFefccO2SvCIcCZqWMRKTQctVVLv2Y
         upw8RGM1mQQqU6FuUW33Vew3xOBGYUelPck2fPiKQ57HYzbbJmLHRbERkRkZmObdm44J
         /SQSvsfB3ncUe2jQFersvaRRHy9qBZPA7Ga8NcB/W67EkqoleZIobhDGU6ZHDx79Y5er
         NQYooM6WNZvtwLdOv/e7PKTBaGVeRz5+IJij1ESd0Tnr8ZvPV7ya7KzTvSsrzJrrAD6A
         xpse4ZSJM12yE6VZG9I+see82RzgRHuH8owjNWewml/iWTYnWy3LOEFKlk3c5+gJtHbg
         0Rig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750190499; x=1750795299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LxLRIM3c0qdb2zOAm+rduDpDgZAMBgw5SL6tNGivXSQ=;
        b=EP9xSn2xniyqpldphRfZdJBGQ8I9K879GJy6BOEfiQtiskqmMcxtyn+op9eOC1WmHH
         Qt+yw1Qmr2a6akyXhLSsEEq8BrXNYKweeGQ3ZvxouzzhiUtisu05MysV9peSFvHmuBuY
         KVF57ck/KKXApLM6xjF38yOu/WK4gFEjrXViil7rCk0kxs3h+zHmScxXKv/Z5SLiyGAS
         /5C4HgM5eOCZ6aDpaNZVnYxxawnl2l3j2kQd4agzRw+YxX9iIeTxxg1f5kj/QZgfIACs
         6Z5qrN6uuYxm+VfdlB0nJ4rrIQ4szSKSnDmtsHrYPkz3rPs2RK5qM/hDmFmKoTgzEMSy
         X3iQ==
X-Forwarded-Encrypted: i=1; AJvYcCWr9mqVR9T7+MD9Ri9ZrQ4NWj8YY2o05/X+psgBoHnODFpeVirXSHnp/fhYysD10ke10246KMx+hgN8vms=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPVkr4S0271Z+M3KpfHHkb/XlQKXrrBKBq2Fwn9k25eULLDZRE
	oyheyzqt2IJq7Cn1Y9UFbvQF6pM3QBcjB04EuvZT/WEJaFPwau9n/g9sOAWJoyKg7IW5q13c0VM
	mX90Elj4ENrvpRCKNp+17kVX2td+Ya4c=
X-Gm-Gg: ASbGncsSSdRJbPV62293gaHBFt0Jq9+xso3MnTx+SfrllSxTWaisyxe+AHdSx4QD8Ta
	TJ4f7l2RsHlPK7ftrg4jXoa1o1zye9TKmc4zCAelBF7f4iXFzbXsAm7y29Lzv6h8hCCejrIXM5S
	T3AA/WaM+sJ3gbATGTwQGNLinUKNsdHwiI/bG9k2/1k4A=
X-Google-Smtp-Source: AGHT+IFgC2I+mbHQVN+fSr3xWk3eFtw9MnutDVKO3nQ3T78YvMy5t79nTBwDkDa3QpiEK4FD6YchBOI9OvZY6cd+YrQ=
X-Received: by 2002:a17:90b:4d12:b0:310:8d79:dfe4 with SMTP id
 98e67ed59e1d1-31425ae54f4mr2636350a91.4.1750190498555; Tue, 17 Jun 2025
 13:01:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613213311.GA1445087@ax162>
In-Reply-To: <20250613213311.GA1445087@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 17 Jun 2025 22:01:26 +0200
X-Gm-Features: Ac12FXwbba_z7Hxge2JAspnJDfASZGJUakU9W_NQuGn9BHnBtJV6Vo9PzZ6YHf0
Message-ID: <CANiq72kUt41pCtJSUP+H5bxWpduoEYit4HT2k4jOTFMHuASqXA@mail.gmail.com>
Subject: Re: Prebuilt LLVM 20.1.7 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 11:33=E2=80=AFPM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> I have built and uploaded LLVM 20.1.7 to
> https://mirrors.edge.kernel.org/pub/tools/llvm/.
>
> If there are any issues found, please let us know via email or
> https://github.com/ClangBuiltLinux/linux/issues/new. This will likely
> be the last 20.x release according to Discourse [1] but it is still
> worth reporting issues in case there is another release.

Thanks as usual! Works for Rust:

Tested-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
