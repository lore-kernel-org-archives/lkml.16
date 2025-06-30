Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1858291C30;
	Mon, 30 Jun 2025 17:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751303970; cv=none; b=YaQ54MnxSgB9kRtZp/5jpvV0BkGd0/ZPN7X7LpKfvVj6yss9d/YlwV5ALDPFvMnz86CphUPt0a8zuaSc1E0fpJQtXfrHPir7ZrHkfufq83LknAAI6jYJE/SqDxffN9/ldyG2mmeP/XGF/LjTjD3jsZFPDFEd4CyJZxwclo878vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751303970; c=relaxed/simple;
	bh=aBHh8k34IFJzeCdbR7OpwK5tXeAmEli59bp6Th6Hq70=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=BpYk/4bIj3xTX6FfmvLTclYPQ3CVlvCgOFLtZYDj8Jpsrg0eQd9AKkSnVpo9D5rHI7uh/rjMpFZkTc1JDOhIO07V2RnQz4xw7ts08Uzipm05L2BQjv635stBAjYH+5o5GMXnIsp4Q848pJxvg826KW9OhHpRKsjWFC3A5krNOyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lf5FT/6w; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lf5FT/6w"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7d3f1bd7121so229388285a.3;
        Mon, 30 Jun 2025 10:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751303967; x=1751908767; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=My+Sd9qKBXoQQgJZzomU2pSofVLYPOkVonsDsMPeVOk=;
        b=lf5FT/6wsG4pJWBnvstWuaCldcvPB7XvJNvfXP4tHWXmnRIchuOpvF1Hop1H42KCa7
         bera6xnzePl5TxU+fRfHkeevdtuBBkifU3yuE2VaXsJyjWaaUWtLejKTQQfw+1GUCMu2
         W6YQnRsTe5iA+guvITL8Yd0xlRv0XYF6perl624uxvXM2tEXm3M2Hj8NeogDP3Nk6/mb
         kxC33G3E8e7MA9KUwN1tTO/ViiAVZJDya3xGFoCWKbgXEUzCKhrk+mSSySfDO1i9c81n
         /drhirdujDn32oytfNkzMN8F9fZQpdRoydEp0Du1fBFYZsE1T5Ro/IcpZeXZhL9QYGBz
         nx3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751303967; x=1751908767;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=My+Sd9qKBXoQQgJZzomU2pSofVLYPOkVonsDsMPeVOk=;
        b=FRdurBfunipgDjHhCqWpeAU/+ZYR2kR0q3CNgRdlFKhYs2bTWOltoXTlfFvI0jt7eB
         ULYg1HDkzJa4o6uEhDvsRUZB0oxxfbBMimbuXQZla6MBxRLl5YnSOZdLQgmRC9w6a4+k
         9lFrNtD1ezcB9uTIXIjQV3kVr7t/4AJn7CoJ44dBg7hXFguG1E/P/ofD7yHiDq7WsSJu
         0NTfR3r+zEbvzN/Ml6WbHwU1XbXMBgUOpld1MOCIavrBLHSMDKuZjkai0FXe/czOmhwT
         2PRiTIThLvmktmTwSkJFqX1maxBS9NdE5EvXB/GAIpUWPgkrGfS5UtMP3Jc/Veg32Twd
         Zy4w==
X-Forwarded-Encrypted: i=1; AJvYcCUGexuLCKBbOVEjL4aM22MAZ1fRFHjmIrLPraXY4J3H82mrT/6GQEKqKeEqxkIzi4eXtFpdA+TBSC0bgNg=@vger.kernel.org, AJvYcCWIAXmB2bwm37Aq/taPZF9bponXR+xNVvMYT2vnwUF/+uNP3SUYJiSp32f7S5mqfB/2OFiF/nyrzqEuYknrkzaV4O1Bsg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3gyKb1gMtYhnox7QTcu18wyoVLhUwQMfxTJc8jLMpLcGO31p0
	zPTlrzkYYyfT/P/j6RxPq9bAH9WK0k1WwtT2q6pOsf68NT++EVZwR847JRsviL1P
X-Gm-Gg: ASbGncvpEFOodpNO6iOIaRAm+6nonWeW1tuqfVVQS1aVWt3yIP2zMf9fV1OCy2MaANd
	qxif8YW0vFl79l29Ctdv+yNpbjum13b0PDh4nb0yiFShVW2c/Q07U130rs75QNhnQsHeuble93a
	PVT3cVjTI8Cl/2wpJShn1T953WCZWOKN8T24b0mDEzCpNu8peEdFC+pNcmobO3E+DYWzEoMuMOr
	ykADSmnOqAkfBtyyfOHF6YeHaeN4qUeL0s1jtbxLvHRJ6QY9Vy3x0H8XfjkgTEcPckSmFfxby9Y
	bhxooc1lSlkveq6jM1QjQyn/ARP4pxBJCiJ/egzTjM1sjcsGpbE1lS8=
X-Google-Smtp-Source: AGHT+IGxBURdNCIiYI0Fgw7UXD7Psq9lNzuv/sGDalOMDIh5FbdKbuOopkgoPjE5XHAiPaHwkNz9jg==
X-Received: by 2002:a05:620a:2b97:b0:7ca:cd71:2bf8 with SMTP id af79cd13be357-7d4439ca6admr2323639885a.54.1751303966627;
        Mon, 30 Jun 2025 10:19:26 -0700 (PDT)
Received: from localhost ([181.88.247.122])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc57d530sm62157231cf.61.2025.06.30.10.19.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 10:19:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Jun 2025 14:19:23 -0300
Message-Id: <DB01FY24LYWZ.1JZJNZR47ORO4@gmail.com>
Cc: "Mark Pearson" <mpearson-lenovo@squebb.ca>, "Hans de Goede"
 <hdegoede@redhat.com>, <platform-driver-x86@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] platform/x86: think-lmi: Fix resource cleanup
 flaws
From: "Kurt Borja" <kuurtb@gmail.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250628-lmi-fix-v2-0-c530e1c959d7@gmail.com>
 <5ee91db8-8ed1-6860-7736-9fb723371bc1@linux.intel.com>
In-Reply-To: <5ee91db8-8ed1-6860-7736-9fb723371bc1@linux.intel.com>

Hi Ilpo,

On Mon Jun 30, 2025 at 5:54 AM -03, Ilpo J=C3=A4rvinen wrote:
> On Sat, 28 Jun 2025, Kurt Borja wrote:
>
>> Hi all,
>>=20
>> First patch is a prerequisite in order to avoid NULL pointer
>> dereferences in error paths. Then two fixes follow.
>
> Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

Thanks!

>
> Please send v3 with stable Cc tags in all these so that this dependency=
=20
> gets automatically handled (as per documentation).

I forgot the stable tag in the dell-sysman fix too. Hopefully it gets
picked up by AUTOSEL. Else I'll submit it manually.

>
> I'll apply this through the fixes branch but I can deal with the removal=
=20
> of the lenovo/ folder from the file names myself while applying.

It's easy to rebase too so I'll do it :)

>
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> ---
>> Changes in v2:
>>=20
>> [PATCH 02]
>>   - Remove kobject_del() and commit message remark. It turns out it's
>>     optional to call this (my bad)
>>   - Leave only one fixes tag. The other two are not necessary.
>>=20
>> - Link to v1: https://lore.kernel.org/r/20250628-lmi-fix-v1-0-c6eec9aa3c=
a7@gmail.com
>>=20
>> ---
>> Kurt Borja (3):
>>       platform/x86: think-lmi: Create ksets consecutively
>>       platform/x86: think-lmi: Fix kobject cleanup
>>       platform/x86: think-lmi: Fix sysfs group cleanup
>>=20
>>  drivers/platform/x86/lenovo/think-lmi.c | 90 +++++++++++---------------=
-------
>>  1 file changed, 30 insertions(+), 60 deletions(-)
>> ---
>> base-commit: 73f0f2b52c5ea67b3140b23f58d8079d158839c8
>> change-id: 20250628-lmi-fix-98143b10d9fd
>>=20


--=20
 ~ Kurt

