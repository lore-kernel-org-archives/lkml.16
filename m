Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256B91DFE1
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 00:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744072540; cv=none; b=to5QSkgPtDV2mad8cl07vCs3DHKP3YubqRl6lK+pE5EWSJ5bYyXe8Itljudc5tVt9CVg6VqLN+ZybuFuZwPvX34RlTTls8/1I1mHB54isx6Z63Dyw+aG7CZDOZyzapQ6x2WNlQeyWRpX/vzyvhYSelfv6lzGbdONoykoAWKOmHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744072540; c=relaxed/simple;
	bh=DaV65SDOazR9yPifTzNsvT2tHThc/Q1IbGQ47406ibk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RV6uukWUQQYZp72XCn5fAaKFaxqvBA4m9ZpClUyWkaqzRlsRujq66tj5ZFPgGAxMftHkSK1g/J82AsjzbpPIplZZrsAh0XPp7NW83ETWB/V0UKQZdX7pH4P6tcVnAdEM1g+jIV50yCBDDKH4WKk4ZvT3zQYVolapck56+xkqHI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=g2jD4cIs; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="g2jD4cIs"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac29fd22163so848423166b.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 17:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1744072502; x=1744677302; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r+ZxkGINI7rLoBc6b8D+uct/d147JQCfpdqDjWea//I=;
        b=g2jD4cIsQDr0PafwB4xOJQ9lrZAbLiNxHKZkDs4+IwguGNPqnkOqGChb8rcNHujfqZ
         +TP7irfrsnpynQX9IYsbVfP+61h0s7g8t9kc6iY0mmcsdwiJWuiLCYfVQ0yKhURXYvrb
         SxYyBBCTTE5Muq68dd1e4+G0vPkIr8xjcX/c8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744072502; x=1744677302;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r+ZxkGINI7rLoBc6b8D+uct/d147JQCfpdqDjWea//I=;
        b=bBTyOwyLM+ixN5FgM1JUFki9yRMpkh/qOxifmbmDNJ2gP9vkHpAx+/B9FbCOntVb6V
         9fyLgqhwMRgMiJ0FeGeQXfhDTR9290JerX0WtkA++g3rfc+a+CKNusYMqn92ZjqGNKu7
         8/SC/KrTp0FFZrrHE7W39rkTh3VnINNRQFucxUbet5U63W35ZfsWTxh/CwmHomyL4ec2
         ch7xZrCxw6R8jxpelkqaI84TZh5I49a2B3CbDAzDN9uVbRshyDxXg7FbjsAj+vIrI32B
         8/M6NvH6EEHb2d7BKOWZ9Rrqr6UhF5r5Tag6iqXNJrassF+IngN7KtOJubJoNpG6rAV3
         2/pA==
X-Forwarded-Encrypted: i=1; AJvYcCWnrLiCSPPqQlAPejyCRmwNwv753YR3FmTOvJslZnMcnq8w5YoX5tjgRrS2Nl7P1F37X2bByqpS79PwP2E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4Ju0hDeVv3zdGMlVsgs1z76XwYdwvIPvgzPJWWnp926hfDSb9
	fNvaRK6F6QiJK6kfmyG98CJpsZKPe2mQddsGcHLHCFw7VwZJeiQaEXQs8rvf3OCm8dWWNg0Z6BM
	iSu0=
X-Gm-Gg: ASbGncvDB2Bq+DSpd//MuRqEVWf/yJkZh+q6eD5CF7+n+qXUFR7CyXSpa+2ICafLsUO
	V2Tf1qyxJQeVnzkMy9gCvYvRca6CbM3jhN2yeh8jd5BrQOlDnRWZIzBV6gGQrygfB5+6OxYecNr
	eLyxhk0euk/XRBfIe4OWbvyurB/MBhVNHuM8GHngAXALD39Ocnn+OtUvMh6MUlbvJUL2zyKrwOZ
	otBRBX5GrhV6J1XsJu8zCATvR/usNV0Qczz3vq+Pk3j8HfBF6w5TzzwImWm3sFiIifGlIgMRP+v
	OwXAdDKY0CoXd9r3kjet+3S/reB5Leoke/NNSYN1ZpdNbSaOWVJ69gar0rvJY3LJ8YWUjBxBBHK
	wu8X0iHwfb/+np36KG1w=
X-Google-Smtp-Source: AGHT+IFj7UY0GT1Egoe3dWyFP05RznO6h0+qDFGaFx8Y5ZLV9SszAwrN3P781ZLW2Xml1hCpuyXARw==
X-Received: by 2002:a17:907:3f89:b0:ac6:e42b:7556 with SMTP id a640c23a62f3a-ac7d6cbd8acmr1014919266b.11.1744072502332;
        Mon, 07 Apr 2025 17:35:02 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c013f646sm811069666b.120.2025.04.07.17.35.01
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 17:35:01 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso670449166b.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 17:35:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUiXP7eHSCKU1zn4gLInVH5QgW7z0xQVezrbvKUwJ5s22x34sYYVFBlRGmv44DP5hgwdJ1zyis36jVZvgw=@vger.kernel.org
X-Received: by 2002:a17:907:7eaa:b0:ab7:bac4:b321 with SMTP id
 a640c23a62f3a-ac7d6d6447emr1163743766b.29.1744072500876; Mon, 07 Apr 2025
 17:35:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <alpine.DEB.2.21.2502181912230.65342@angie.orcam.me.uk>
 <CAHk-=wgBZk1FFOyiTKLnz4jNe-eZtYsrztcYRRXZZxF8evk1Rw@mail.gmail.com>
 <alpine.DEB.2.21.2502202106200.65342@angie.orcam.me.uk> <alpine.DEB.2.21.2504072042350.29566@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2504072042350.29566@angie.orcam.me.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 7 Apr 2025 17:34:44 -0700
X-Gmail-Original-Message-ID: <CAHk-=whKa0-myNkpq2aMCQ=o7S+Sqj--TQEM8wfC9b2C04jidA@mail.gmail.com>
X-Gm-Features: ATxdqUHVWAsCJEhhvm-QPqcunGy72geDTRo-IlsWBZxYAFW1rFkcbu5rDcC9MaE
Message-ID: <CAHk-=whKa0-myNkpq2aMCQ=o7S+Sqj--TQEM8wfC9b2C04jidA@mail.gmail.com>
Subject: Re: [PATCH] Alpha: Emulate unaligned LDx_L/STx_C for data consistency
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@unseen.parts>, 
	Matt Turner <mattst88@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Magnus Lindholm <linmag7@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Apr 2025 at 13:46, Maciej W. Rozycki <macro@orcam.me.uk> wrote:
>
>  So unless I'm proved otherwise (e.g. that all such code paths are now
> gone from networking, which may or may not be the case: I saw IPX go but I
> can see AppleTalk still around; or that no sub-longword accesses are ever
> used in the relevant networking paths), I'm going to keep kernel emulation
> in v2, because what just used to be wrapped in an unaligned LDQ/STQ pair,
> which we trapped on and emulated, will now become an LDQ_L/STQ_C loop.
>
>  Do you happen to know what the situation is here?

I think networking ends up using 'get_unaligned()' properly for header
accesses these days for any of this.

If you don't, some architectures will literally silently give you
garbage back and not even fault.

Admittedly that's mainly some really broken old 32-bit ARM stuff and
hopefully it's all dead by now.

So unless you actually *see* the unaligned faults, I really think you
shouldn't emulate them.

And I'd like to know where they are if you do see them

             Linus
