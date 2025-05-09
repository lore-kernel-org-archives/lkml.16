Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0C6233144
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 17:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746812359; cv=none; b=uTNGZS+wW7pEXaqO1gTRR8SYyWRsbRyt0MDF5kOLI1I4+PJ8X9wDrQp1KUtKfwMK6S7jKWwjvJ2yB3hVplP9s+5E60fA/9pGek5Hd8gOypx35kkgfqJfo0UG0FJsxbnbtrk65SlvjB7wn92pLqFLepXUmSxXsPM5OwY36mEDtOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746812359; c=relaxed/simple;
	bh=LfrZCmzoSG/oOv69lKZc62lKRYOxuwevfizEFv6KoOM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jiyQwJb3NLIXEhyWzhhHqLjY2av9AVK0lQsR0SGtMXlWvzxAu1ndGFYsjYMf/3gxqhGfCS0AfXLd3+XgfmymHEuOq8t1oVDkSGPfl2JEt5V4d7Cuxk93NVhcx+cxqDYnBWjW/QA8eDeuyEPXN04QwFN5QpmJhc4HCpcxYqhaKdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com; spf=pass smtp.mailfrom=dubeyko.com; dkim=pass (2048-bit key) header.d=dubeyko-com.20230601.gappssmtp.com header.i=@dubeyko-com.20230601.gappssmtp.com header.b=LPm3qxWQ; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20230601.gappssmtp.com header.i=@dubeyko-com.20230601.gappssmtp.com header.b="LPm3qxWQ"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22fa414c565so16913615ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 10:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20230601.gappssmtp.com; s=20230601; t=1746812356; x=1747417156; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Awyu6yx0XWHa7ZiRVrCdZHl8L0TrAJxNWpvp17USw3Q=;
        b=LPm3qxWQ8pnjwAu6kxyJdVODFnhiWz6NZKK+DW0rUcnqvXjy+gGyKdQl6ZtOufOM7i
         TxWjUkV6AOLrEFVxqQxOsoQEcjeBwYKB5xrbUhDsaKwTEFN2JQKbDt3JNUWAx7h7Z+2l
         CBz6xpvsv5xt1c4IqGTZTjSLp961YkVsCg9qDWPwevAksMmwdsI+gm2/pwxdKuOvO4Ow
         XlROs0z/zakzqlT8WRqqZiGbDzE7djFcv+SVeumhgxyxrzFs2cYigSZCmjHVPLbXh61S
         hLbyS9dZSHdKh9NuPLDpOsgxgFGKt51+xSLqgs+0tIuS/G6ZBCAA20+9S5ghIqTX0A90
         dTSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746812356; x=1747417156;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Awyu6yx0XWHa7ZiRVrCdZHl8L0TrAJxNWpvp17USw3Q=;
        b=IR9B+3tDeYrLU0OVaKCsIlqGKBrQSU36rjgvtFHOTIOORpJAsyKKqslw0Jk13vHtk5
         UxTEGixbUtognJO9gEIHaUJeFV5lUa5pLo3c0scaxVNJolcVM1eqpS0A8lfkRU5f7FyU
         rnK+xRUBjji4W0pUFlwm9DqVub0aKp2Okm60QYrs0A/bX2efZwqrAorgh9sm0BiPomL1
         McTRgUbHZ34wdqaI7sFZOPWNw58+VuQN2SJFJYAgp9F0tluxifjYTUCRaVRrtvRvOD9Z
         9fGmaIkKJwP0+kZVGNRxhgaQKNzQuYYWuzQJEIyp4NhGmOwFFDzjHiG47jFO7Ba7zm6o
         PjdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvWxcsiRUCPI8ily7ycR+68BLw7pc5hUHsSIaxaY9mUN1L4dGOfXrxQ7FhAuS7SKsG33wXRQCwXj0ZQCU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxB27jqhbmCRERXdM+lLKNxorxq8u57YVbEs4AGGsDYu/LeAAj7
	W3At+pFYZ0sOkoJKf/bNZR56LpSEjq63tJO46hI6TXhAnWNWPxnjYgBpjIhiEEc=
X-Gm-Gg: ASbGncvfxVszIdfv+jBmNDHv89LsXkp9FwY0qe0MnVplZFD+q8qjBQnROSU/7f+v6g1
	T78p5Sl6eDwXEvTXh0X7f3MZFiwMHYV9DXup8QYuVZaaZfM5EigF7VEox0Ile2dHj1I5zjesZU/
	1wS5vFfQeIsGV5K/9pGmOhIi9psNoW3GIJMxmml+JJadPDu94tdVOFUd0rBQXEmC+vPDk+wLwlI
	tQPavy/8Butw5qeVZhFfSW0+3Hixhm6FXMrYSkrK6yCdkGdpIrsE8Z8hZOpMqFE38Zml2z7QezH
	sYWpDHPGrNb9QX0c/fxi8+aqX6+DkQNyKSuDtK+x/Y4PIzD7iC+0
X-Google-Smtp-Source: AGHT+IHGEwIyBm7xgc5W0YMlKDOYo4LdM3owzYLLhxcicqaKrdscfNIqz3QiEtNKj0ZCYv/G3JnZUA==
X-Received: by 2002:a17:902:cecb:b0:22f:a932:5374 with SMTP id d9443c01a7336-22fc918d1a7mr71694425ad.48.1746812356347;
        Fri, 09 May 2025 10:39:16 -0700 (PDT)
Received: from pop-os.attlocal.net ([2600:1700:6476:1430:f242:4c31:ff5d:e2b7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a50b3sm19857515ad.240.2025.05.09.10.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 10:39:15 -0700 (PDT)
Message-ID: <e87e0fce1391a34ccd3f62581f8dc62d03b5c022.camel@dubeyko.com>
Subject: Re: [PATCH] hfs: export dbg_flags in debugfs
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: Yangtao Li <frank.li@vivo.com>, glaubitz@physik.fu-berlin.de
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 09 May 2025 10:39:12 -0700
In-Reply-To: <20250507145550.425303-1-frank.li@vivo.com>
References: <20250507145550.425303-1-frank.li@vivo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Yangtao,

On Wed, 2025-05-07 at 08:55 -0600, Yangtao Li wrote:
> hfs currently has some function tracking points,
> which are helpful for problem analysis, but rely on
> modifying the DBG_MASK macro.
>=20
> Modifying the macro requires recompiling the kernel,
> and the control of the log is more troublesome.
>=20
> Let's export this debug facility to debugfs so that
> it can be easily controlled through the node.
>=20
> node:
> 	/sys/kernel/debug/hfs/dbg_flags
>=20
> for_each_bit:
>=20
> 	DBG_BNODE_REFS=C2=A0 0x00000001
> 	DBG_BNODE_MOD=C2=A0=C2=A0 0x00000002
> 	DBG_CAT_MOD=C2=A0=C2=A0=C2=A0=C2=A0 0x00000004
> 	DBG_INODE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00000008
> 	DBG_SUPER=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00000010
> 	DBG_EXTENT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00000020
> 	DBG_BITMAP=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00000040
>=20

Frankly speaking, if we would like to rework the debugging framework in
HFS/HFS+, then I prefer to switch on pr_debug() and to use dynamic
debug framework of Linux kernel [1]. It will provide the more flexible
solution.

Thanks,
Slava.

[1]=C2=A0https://www.kernel.org/doc/html/v4.14/admin-guide/dynamic-debug-ho=
wto.html
