Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B5D21423E
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 16:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743437101; cv=none; b=azeO9sk3LX+6BqeNeWYQmW2HaZS8wZj3uEtS+3HocBhZZ9dMR7CQy3JM13AV38k09ZGwCb7zssYVKqrCuzQtAR3GYdAcfzqxJcZbYc5Rz6+Z0l7AYiEYrsxhPv7HimjsnbhXKZvw1YO/HsiFpqejjWaeylThbJ2ne0vVKAVAErM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743437101; c=relaxed/simple;
	bh=tZAxirX8RFz5t1WTOr8nUlZqMufXMzg6X5IFuo2Zrrw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=tzToce/pPSbLLfLPYjtDdpnybwfKokc8fpT0Y6CmHMlFsFXQZs/5QHWAyw8wyHmTzrER8Ed60rYQGjVouObAuocB2UO4DTKVDw0Anv6Jy8pZXIpZMgwLMxy20IQk8XIA3mEQ6u8pGmtSi7APSG2sb8p9wK5s/LkpkRHUrgOSGc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=denO9aBB; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="denO9aBB"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-225df540edcso103856685ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 09:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743437099; x=1744041899; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tZAxirX8RFz5t1WTOr8nUlZqMufXMzg6X5IFuo2Zrrw=;
        b=denO9aBBn2oexzDIFEcSKFUoCpZMUltFO/rgY7BNvXI1k3l+8tfJLISdO7FZ6yl0hg
         eAk6QRqLGHJmNh41w7gAn4WUovsFAP9sPRvI4w3Q2bigqo92VsVt05d/L4PgFwYSQf4/
         As02mmy9cc1M+6HyteE1N7YhBImD5KTwYPY2Zg4oNbhzLYs24vxB3+NTvXoqMYXqt2NQ
         ee7Ek+soz00XDn+mKhixXZLhQ71j8o38FBpV5ujin/3SLoU4V1tfcXCGWP/s91CPH4QS
         Z4y1ixsWa0KbbuXfsFaeATCPBGjLWTV5lh8ulsQWgmqmLWIA+xeKLg1hc2tuhL8gYa26
         t4wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743437099; x=1744041899;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tZAxirX8RFz5t1WTOr8nUlZqMufXMzg6X5IFuo2Zrrw=;
        b=jIPtbTLeORFT5co5BZqznx/uOEvne+3qDGCYAu/nxOsrz3kuMXXCyfrri0Qc+/5Tq+
         jdr6JdrmsIa/5SS4eKwn3+rwKt0QltsA6S55A8J3hna6uSZ10Sb4TVrSWNHVcDHVa6SA
         49lqOmkiuzjdBflBAV4sU/cuZBqYGawk4ardvj/zTThlOZ36r6RgRNFQmo1q3ZYpwNOu
         IP5nybjlNL1V+M+qMZ55/7x1p/V5tNUYT/ET8/9J66MjkUeLQodEJzKOp4orJXDjAFDQ
         fbLlXiD+y+ehpOF7hlcD4UsitCG8guTk1xzD/WvqnqwNhsvJAkM9PXSxpzIOlU2tzjl+
         V29A==
X-Forwarded-Encrypted: i=1; AJvYcCXuMyibwMgnErt0PauU8wP+IthVgMK2Y0eAZeH+wvUWA0eJgLl5E9/JwZnjpeCJj2s73C3v63dMdzRYmCw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHmMVCGS35hovjGdA6n/XPK/C76cDzV7s2zS2aCXGBfTuhQM1m
	7G6RiN6GMriE1uk1rOMiLlwVL/SBEemDKRif33UII8alVPog4BBA
X-Gm-Gg: ASbGncu4IhW2ifjyYrNSEhp/yqVAkoc/d0KjCLwEHOaOuRPwMV189WITMbrDOly/Ir0
	FjOL2HrIvm5ncXqXIP6tOrKsX4eberVfDQqRNDhCf4RAgj2y4/KKXDsJnq5LE79D5F1RcSHJ88G
	WiDb0Bt2rLGD0H0pLU5e10vPk33YqmKTpJ3PVVt7JEh8/D1HZTGPcFh0KqNl32KqwwMVjRcm81W
	L/w+LilFzuuZAdvoC9q5jreVgmf8fx9bIIGSTOQUQrAXpMhlzSrZ1zF+ZKEVqXhHLGSOu3+YQFc
	ceH2h1MIG0AVlpsqbolDdi5baSPuajdSX+aVSQ==
X-Google-Smtp-Source: AGHT+IHmZwSrBpBsX/AV97DyLLc+CTcTfbhytkmiLByPkxvlHuWUTWN4IeX4IPmKVEeP7c/h/Vgt7g==
X-Received: by 2002:a05:6a00:35c7:b0:736:b923:5323 with SMTP id d2e1a72fcca58-7397273be9fmr23904034b3a.10.1743437099374;
        Mon, 31 Mar 2025 09:04:59 -0700 (PDT)
Received: from localhost ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73971068581sm7124895b3a.114.2025.03.31.09.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 09:04:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Mar 2025 13:04:55 -0300
Message-Id: <D8UKVCL4JHTO.1SFF4L6LPUE3O@gmail.com>
Subject: Re: platform/x86: thinkpad_acpi causing kernel oops commit
 38b9ab80db31cf993a8f3ab2baf772083b62ca6f
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Genes Lists" <lists@sapience.com>, "Jeff Chua"
 <jeff.chua.linux@gmail.com>, "lkml" <linux-kernel@vger.kernel.org>, "Mark
 Pearson" <mpearson-lenovo@squebb.ca>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <CAAJw_Zt1cYcg-Fa_rCecwHnWKMi7uO2UGNEhMsxPiQa-pgUMnw@mail.gmail.com> <D8UG6DGW1FKI.HZ5UFH4EVY9R@gmail.com> <f63160cde06665bc4bf0e0a18402074e3843f9eb.camel@sapience.com>
In-Reply-To: <f63160cde06665bc4bf0e0a18402074e3843f9eb.camel@sapience.com>

On Mon Mar 31, 2025 at 12:05 PM -03, Genes Lists wrote:
> On Mon, 2025-03-31 at 09:24 -0300, Kurt Borja wrote:
>>=20
>> I submitted a fix for this that you can test here:
>>=20
>> =C2=A0https://lore.kernel.org/platform-driver-x86/20250330-thinkpad-fix-=
v1-1-4906b3fe6b74@gmail.com/
>>=20
>
> FYI - Confirm it fixes the problem here as well - tested on mainline
> commit 4e82c87058f45e79eeaa4d5bcc3b38dd3dce7209
>
> =C2=A0Tested-by: Gene C <arch@sapience.com>

Thank you for testing!

Are all this driver's features present before the regression still
present after the fix?

Also would you mind re-sending your Tested-by tag to the patch thread?
This way it can get automatically picked up by maintainer tools.

--=20
 ~ Kurt
