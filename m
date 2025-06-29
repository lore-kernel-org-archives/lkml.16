Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6CC23CB;
	Sun, 29 Jun 2025 23:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751241064; cv=none; b=EO4lmtsswHp9RLO9XudmZOU6WspIFEeBkyDAhmQgbFnw73k9Ui2J3hq5ZKV9tXhgsnq15+6/2FyT3qR/fyP5rtnqBq57mrs8KZ/1eKE9xTuEs4ixe7Sofdvpn/mCP2veOHWtCpAQObaJYjGATO0TBtr9xONiPQIVogbk6dCD7qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751241064; c=relaxed/simple;
	bh=XF6pcLdmwx43z3Yq+k/jLrTG4hHJTLxzfMbYr2fql7s=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ZyBc8ME+NQAkQOI8plu38tqkRZS1ECDMgDeMGZlspbm1HnirDGyO5BVyvgYvoAbcBBT/yrh8747KHdos3Zh5a1mUh39uuJJeqqbX3A6GQ0wF0aSjDp2q23hsbg05EKWOP0oQjaeQ7RZX6r8XwnE3RpnDzPwF4lfnOw/Wq0vAT5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cXF2UPd0; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cXF2UPd0"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-313a188174fso3923534a91.1;
        Sun, 29 Jun 2025 16:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751241062; x=1751845862; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yn2mFATHof5uRRUV9gt2i4grfYSWqv8BODZ+twxdaK0=;
        b=cXF2UPd0hv6RzlA+IwEFZXpirIY0wzSEMfdt+HIHBAWu3hpYYSJ19WJQJa1p4WuiJs
         JUmIJ6x8HUD0/naAry8mxeeviCRM6SwfLTZDCSw0syYE+crrEDmVJBk6wUgbgz6j5xD0
         Y4pC/8ga2X1I0L/fbyoV1ICtkLevDU5IYfhQMKmX6gtLOWUOSQBd0OmciJ1glmdM3j8o
         Rz7QSFsgLIjaXyxzIPWPQ5qIpVS5hgrejBu88h15fVx335kI9Kiw+pKEB9viImiWOgsO
         yqzxXmModRKCvUBDv5cVOU0vCqwq9WenUUE3ZMF3NxRILxaP0O8X0JSm32vReOIKzQIR
         nWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751241062; x=1751845862;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yn2mFATHof5uRRUV9gt2i4grfYSWqv8BODZ+twxdaK0=;
        b=Y5S5m4brjw6J8EFellXtpRo9P7+rp/H+JMSMQ2TPr8NEwqOgTH/ZcmdEsxmw6M1lI7
         O11vccSwWFkCLoLAKE7zCU6KOP1MscjmzhXhgOYMT2Rs1mh2A6Et1vkFr9kOVO2VfY6L
         RWg/qcGpUYM3XNvjwxETVIHnShIjLQEQ/9P9cT2Y/om2pa0GrA6faq0Gh/kdaxOjvVcp
         qv4f8BLi4HOG4FYy2vGSmMsjegnNRLmwu8qfYFtoy3JYHZ3oHJuWNayNoDylMPa02qYJ
         LkJwTtvU2pOFZXHjMiwpKE3nuSW4i9FA/YvOG64Wfj6FPsjFticvUu79b+Po2C2fqQuE
         vefg==
X-Forwarded-Encrypted: i=1; AJvYcCUGkmXyb575qHB6lrh6Ijs9gU/uh+p0+9f0OV9PzS9DUsOlk+bqp7EnTvZQ2iF/f2dQBEcBou1YurtVn4Db4c2VsLm8Ug==@vger.kernel.org, AJvYcCUQZpnNnZErOQ8xv89ygBdxTPu5doRiX5lqmwVxunykmjY7Mi378aVJ7HvwAL26EbseXayXTh5AsekVIFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9LIw9C4DBegTIGVmanH+/vIyJ2mB7+62zpMMSSYEqrc2Datoa
	P+FvOTDl8GFzFZuq7Yzj80GTzvP0ON18OCGUE0taIv5FEOCgEnPQ+q9e
X-Gm-Gg: ASbGncuBKNAA/kgHXXvaDxplVanaDyD246+s8lNowriyWoFBkqx7nq9QTXGVS//2SnC
	UADbwhyyXFe1U1CZbtx2XSajdTWhZY6I/Px0YlGeIJ/XljnErX4gD1y0K6ZuPrApeeeuYKK5HyO
	3woBfHBVVe2QRDCBF9nWNiVJJLYuW/yYUmYpaLh2lBaHeMcZ9KR+yTBzaw1+/LNS4h/jwD977fV
	h/Co8T7HFMgxsSIjeLDlTWL1odDz5FTk0RwIKoKmBKDjQw0js74UtHh2p5LIALI5MJHLt4MznRL
	sweZZQFZb56Ih0/776CHqq2Ouhpffd7SviPed9kPLRN7A9RD+d1pJKstbOgmjR52PQ==
X-Google-Smtp-Source: AGHT+IHNBqQ1w2yoBTgp7/iAjHHX/miFsAt9FR6ru6zR0LgoUcXTgrZGC6oCV5825QmQvrlTywXVZQ==
X-Received: by 2002:a17:90b:4c86:b0:302:fc48:4f0a with SMTP id 98e67ed59e1d1-318c8d001ffmr16826344a91.0.1751241061801;
        Sun, 29 Jun 2025 16:51:01 -0700 (PDT)
Received: from localhost ([181.88.247.122])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c152338bsm7487143a91.47.2025.06.29.16.50.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jun 2025 16:51:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 29 Jun 2025 20:50:57 -0300
Message-Id: <DAZF57H19N50.2CQE5TCAK4U0W@gmail.com>
Cc: <Dell.Client.Kernel@dell.com>, <platform-driver-x86@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Jan Graczyk" <jangraczyk@yahoo.ca>
Subject: Re: [PATCH] platform/x86: dell-wmi-sysman: Fix WMI data block
 retrieval in sysfs callbacks
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Armin Wolf" <W_Armin@gmx.de>, "Prasanth Ksr" <prasanth.ksr@dell.com>,
 "Hans de Goede" <hansg@kernel.org>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, =?utf-8?q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>, "Mario Limonciello" <mario.limonciello@amd.com>,
 "Divya Bharathi" <divya.bharathi@dell.com>, "Linus Torvalds"
 <torvalds@linux-foundation.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250629-sysman-fix-v1-1-fce0000a781d@gmail.com>
 <6a9b6660-acd2-44b4-a57e-2245043471ab@gmx.de>
In-Reply-To: <6a9b6660-acd2-44b4-a57e-2245043471ab@gmx.de>

On Sun Jun 29, 2025 at 8:37 PM -03, Armin Wolf wrote:
> Am 29.06.25 um 20:33 schrieb Kurt Borja:
>
>> After retrieving WMI data blocks in sysfs callbacks, check for the
>> validity of them before dereferencing their content.
>>
>> Reported-by: Jan Graczyk <jangraczyk@yahoo.ca>
>> Closes: https://lore.kernel.org/r/CAHk-=3DwgMiSKXf7SvQrfEnxVtmT=3DQVQPjJ=
dNjfm3aXS7wc=3DrzTw@mail.gmail.com/
>> Fixes: e8a60aa7404b ("platform/x86: Introduce support for Systems Manage=
ment Driver over WMI for Dell Systems")
>> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> ---
>>   drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h    | 7 +++=
++++
>>   drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c    | 5 +++=
--
>>   drivers/platform/x86/dell/dell-wmi-sysman/int-attributes.c     | 5 +++=
--
>>   drivers/platform/x86/dell/dell-wmi-sysman/passobj-attributes.c | 5 +++=
--
>>   drivers/platform/x86/dell/dell-wmi-sysman/string-attributes.c  | 5 +++=
--
>>   drivers/platform/x86/dell/dell-wmi-sysman/sysman.c             | 8 +++=
+----
>>   6 files changed, 23 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h=
 b/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
>> index 3ad33a094588c6a258786a02f952eaa6bf953234..792e7d865bfb1cfc13b59c90=
ddf7de47feff408f 100644
>> --- a/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
>> +++ b/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
>> @@ -89,6 +89,13 @@ extern struct wmi_sysman_priv wmi_priv;
>>  =20
>>   enum { ENUM, INT, STR, PO };
>>  =20
>> +enum {
>> +	ENUM_MIN_ELEMENTS	=3D 8,
>> +	INT_MIN_ELEMENTS	=3D 9,
>> +	STR_MIN_ELEMENTS	=3D 8,
>> +	PO_MIN_ELEMENTS		=3D 4,
>> +};
>
> Hi,
>
> are you sure that this works? I suggest we use defines instead as ENUM_MI=
N_ELEMENTS has the same value as STR_MIN_ELEMENTS.

Oh - I wrote that without thinking...

I'm pretty sure it works, but I'll go with defines anyway.

>
> For the rest:
>
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>

Thanks!


--=20
 ~ Kurt
