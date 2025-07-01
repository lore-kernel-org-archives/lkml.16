Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7094A0C;
	Tue,  1 Jul 2025 08:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751357087; cv=none; b=belBwsUCOEc+crmo0LuPgGHpI3dBPr2z3UcDOZnO+kudwUuUqYhb8FzyArlP0gZ3RT8GSijhIGlUFK60pNZ75rl7jj33hg0lzCZMaBmKLckP/9rdxvStGbvuh4i2l1sqxtlx2VjNOkVkRFRu2d4yRaz3Kf54eKZ7YJ8NtnU6bps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751357087; c=relaxed/simple;
	bh=RPEa7KSAWfZxwZp9sKE/4exi6Y+uT0Bn5BIxc1co5aI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YZsUAznFyVG1gSgSHNCOFPqNvkKdPrMTJk7C+FU60yvdCVIYscvPLTCRSV2o70REZ0EPdOk3+N67FnaAOvlugobmlv75chLsLypvzP5Z/cCONok7BtYTL8UoRRydJ8f2aSwZ3MH+5T+dQum4o3fmdIzT7slrIE4yCeV23lrifks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rf2T0qLV; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rf2T0qLV"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ae3b37207easo34872966b.2;
        Tue, 01 Jul 2025 01:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751357083; x=1751961883; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RPEa7KSAWfZxwZp9sKE/4exi6Y+uT0Bn5BIxc1co5aI=;
        b=Rf2T0qLV9TABwdBNp7BUayJZ8Mg6sHx2a1auw3LuI5av85TVZePvIi0NtcROP0nKxQ
         LZBuVYaoiAKC/pHJilsLv5ahgGfVCTwPmh9WhltVlQMDc9Pv4Zb1OkFF2y/K75OcwGln
         R1IBGwnpwzF6D+3hRhjceYPPYVj16nlgctW32Cyc6XC1ySq7uwroSMo4PwX9LHt8dOs/
         WuPSMukzihROsUJGmV6T5DykJUxCz2yA4r2OEo33+kyW2NufyKv8hbI0AQwIDr11CdS/
         tfQh+FZL9amh2hsaWI62ZAOHQBl5I3vWcKaWHgPlm1ah46hE/UsZZMaa9WlxQ+fYOg7o
         pXTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751357083; x=1751961883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RPEa7KSAWfZxwZp9sKE/4exi6Y+uT0Bn5BIxc1co5aI=;
        b=cnOcKuMZ9t++EUNusk4TtQt4D7FExeiXrg1uWJbo5sQIrGCLDVf4LhHGdrRb8N9EX4
         47RTipGiQP9EOZyOfYaAE/LnHcVdxlQDD2cF3OLb101MRUqHpoUvA4tU4qJU1rYj5zqV
         wo4fXCnMLXReAq+qEfIRoPcBvPi7y/T9kmxvDNckhDdMjcBsjggIAK1w1LKnVZOAIICW
         Wsooz5dEQYZUWw1drVhJefXt85idjmkSdYOmXdAdr3RyXViMUiI5/17bFzGVQRyVHpCk
         nas+lS/NNQhSOxCWsk3XVe5TmOOtZ8u6GFnrmjwl8xFtuAvHr61e5mNmtq72LvmeYTYt
         1yZw==
X-Forwarded-Encrypted: i=1; AJvYcCUm9foaurbDXf8oSoNmCNW+jz7WVyutg9KnNOQ41Ybxy2T4CO+dCSjUOxwglmMLShaGA5aqYF3rY8rH9oJF@vger.kernel.org, AJvYcCVPZby98fNWl6F3Ll22Y60RZcivJzLNnY8bg2oxMZzzNgdGjwFizfB3AAgO9rAehEFTPZv5a5t+d4m2PTA=@vger.kernel.org, AJvYcCVak0alGylsVoe7bT2MqwcNPLV7NnCKTHtSY3zm5AnxeOsD1diErMf3pxWPsEC68saO9jM6x4wQRroG@vger.kernel.org, AJvYcCXQakYRINDfj+WAgFEb/HpkAQt63IeoLfogn3wUmoWGQM9mvgs5xCaLBnyLlOrsPKpem7D3qjkS+9CV@vger.kernel.org
X-Gm-Message-State: AOJu0YxGeC7YjO7SMFfPpH24ZeO9e5Ieo59LdmvXuKuphoJIore0YBbh
	af3fRmmvQ56ox5qpwbD7kZdjgdeF6YSekzDyRvE4kZOBd2XNp+aucddwpLTT3PsEguxYRhdsIYt
	h2idCuOR20D64VB1c4SVwW5cddJQW3hE=
X-Gm-Gg: ASbGncvNiSWYOx9UwyOZGWYgBMW0P9eBrhukOQjQtSIaKW8Fq1V9o0rIFZklo5EtBFC
	AnOfjRyMjo+X5pLEOrHF0lTlm5XO2cN4N9Tx2p1MnDXfB5UqDfORddHayvN7z4BNMjpK5jo9ky1
	HKRkrfC8Iw68k0mnOQOO+hBqZc0YS4lY0mHh7/YvDm5TbSs5QcggP0A5E=
X-Google-Smtp-Source: AGHT+IG5PQkgai0r7oYxRYQ+fYVfaXfIEla4taY+SwVVdFU3MDsQv7w8o15epC3kOeEe8kxzDR5ZhBkaJRASnhb/USs=
X-Received: by 2002:a17:907:268e:b0:ad5:3055:a025 with SMTP id
 a640c23a62f3a-ae34fd06f98mr1422916066b.6.1751357083109; Tue, 01 Jul 2025
 01:04:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630112120.588246-1-Henry_Wu@quantatw.com> <6e5fcc5a-46f0-4c2c-918e-545d0ce5ccc3@kernel.org>
In-Reply-To: <6e5fcc5a-46f0-4c2c-918e-545d0ce5ccc3@kernel.org>
From: Henry Wu <tzuhao.wtmh@gmail.com>
Date: Tue, 1 Jul 2025 16:04:31 +0800
X-Gm-Features: Ac12FXy6IY2ocpJXDncRGlZ0Bzw21Og-DP3PkqnOZ8uP3gyncQqa5E8NvA07VnY
Message-ID: <CAL3H=v01Y6XBpkZDZT6qZeqDm4PR6uCaOGKYU=_z00a3ux8HgA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] hwmon: (pmbus) Add support for MPS
 mp2869a/mp29612a controllers
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Fabio Estevam <festevam@gmail.com>, 
	Naresh Solanki <naresh.solanki@9elements.com>, Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>, 
	Michal Simek <michal.simek@amd.com>, Henry Wu <Henry_Wu@quantatw.com>, 
	Grant Peltier <grantpeltier93@gmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Cedric Encarnacion <cedricjustine.encarnacion@analog.com>, 
	John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Ninad Palsule <ninad@linux.ibm.com>, Leo Yang <leo.yang.sy0@gmail.com>, 
	Kim Seer Paller <kimseer.paller@analog.com>, Mariel Tinaco <Mariel.Tinaco@analog.com>, 
	Nuno Sa <nuno.sa@analog.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Alex Vdovydchenko <xzeol@yahoo.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
	peteryin.openbmc@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2025=E5=B9=B46=E6=9C=8830=
=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=887:29=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On 30/06/2025 13:20, tzuhao.wtmh@gmail.com wrote:
> > From: Henry Wu <Henry_Wu@quantatw.com>
> >
> > Add support for the mp2869a and mp29612a controllers from Monolithic Po=
wer
> > Systems, Inc. (MPS). These are dual-loop, digital, multi-phase modulati=
on
> > controllers.
> >
> > ---
> >
> > Changes in v2:
> > - Fix coding style issues.
>
> Which ones? How?

I used checkpatch.pl with the "--strict" option and made the following
adjustments:
- Removed illegal spaces
- Converted comments to block style using /** ... */ instead of //
- Applied lowercase formatting to function names
Would you like me to list all the changes here, or should I include
them in the next patch?

>
> > - Using the pointer to replace the memcpy.
> > - Fix wrong device tree entries.
>
> What exactly? How did you fix it? I see zero changes. Your changelog
> should be specific, not vague.
In patch v1, I placed the mp2869a entry in the wrong order in
trivial-devices.yaml. In patch v2, I reordered it based on the
numerical order in the device name
>
>
> Best regards,
> Krzysztof

Best regards,
Henry Wu
