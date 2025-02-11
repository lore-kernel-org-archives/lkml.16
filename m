Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2728E261564;
	Tue, 11 Feb 2025 17:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739296403; cv=none; b=cnFy7hWhr44k2QJNykq5udV6FTosSZCrjSH3b9/F7hfsII6AtNc5zJR8ETw7a5ERLMrz/3xQ1wwHLtQlLB7q010cctRl+4Ih1G0EF/y4XJYOFFiQ0EcmmHornlueFdWkqT0e/QrAfALUDvvlQZB7oR5KPot925pCtH9DvjcQKrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739296403; c=relaxed/simple;
	bh=uQpT1QYu5IAeE3EIPfDH7a3lqxCAmkxME3bYVaBRe/s=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=VaGhQ0NRlv58cDe+YWwvqh+jNWQkpML5LnQIRgTGAgtDM3aLdPHVoWgjwu0xO5IhPtMnlucQvTdCpSsuWwe3HItWxdDzL2YFRYDk5O18WQkrWmMqf+iv+9BX08Fc/0ZdlqvQqHz4l0qVHtZxxj1wKcRj/YbTuro970mkVrBHhLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hJm9ehFp; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hJm9ehFp"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6f9aa66cbe8so43463577b3.1;
        Tue, 11 Feb 2025 09:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739296401; x=1739901201; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpCjDUwze0zuYi1LV7c+ctFeg8ySVaPm+FwIwe3wPpI=;
        b=hJm9ehFpgVncUG4G8EtcB6cCLfwdbKSemmK6iRp46AIc6eOmcpP0PV4MpW3ffSzn5D
         mEu00xXAyoBhzwwJrY9aVbi0lnAa5iDJEgtwvJAhBl7hM250UP/jTXbk+yPlFnugf9z5
         7epOkb+F8truBCUvbcEEtPhLFFIHv1J5uOewH8zoTLu1gfMgSKg1BBg0hehH61IYjBF5
         XtFCD1bhWKfDnkUuBbjbOso+egNZ71hXpIIjDUdSYDEjmdZVIquN3cNUXD2u53VfahL2
         Lfldu1y4QsaMAQkEHKRq+jaGROrA9t73T2+KnpAC1tfDqPTPOnVIQNpg5jlhq6TdxzyL
         ZNfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739296401; x=1739901201;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UpCjDUwze0zuYi1LV7c+ctFeg8ySVaPm+FwIwe3wPpI=;
        b=bzZ+aqNDFe8VbXUYp+zH6k7Y6omX+759FWSUalyKFNhZoqD4FiKfKfj4jx7czHTMju
         7gLr5Dye+IeFCOWLy0FYp2kRHwwOQ4xglnp9mp6Kme5HZ61vfg+uLhVKuJdhEl+2VrRu
         kv1V/gNkVP/y4De7ZjDuDZYLPioQep9oC0yI65NZZQRPtish1JNhywarPUI9OLpfM5zZ
         JK/mZo8ReLCDonR2r3WKy7tZLkmHWROQVDS1sNrdCcTWBtWT1xYCa4cQq+MrUruE/TDJ
         ZKAUYLbdJVrjjoo983WsJucE7GDa2Xp0tULhW9H9fagKf720i+KOTVigHRvlJ2zcC2UO
         zPiA==
X-Forwarded-Encrypted: i=1; AJvYcCUgYESopbV0gEj07a/k8X/gqHNInbUE5TDFItnNXYS/MsRl4fA8U3LDVgQtifQ3vnSP0CSaf7DS1Jrjo7I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyN0RDJ+11856e8Awl0fQ48djg3WMy3LAcjFk1pYOv30QBorphr
	RpdMFg+Vg1pesd4fuegEvCcX/o/yRCmLDymT7TZnB8TLJX7aCEm7
X-Gm-Gg: ASbGncuCONAa7Zpx0OGVQH/Z9yM9SIcmdnWtIlGed+8yguMbTqbYQpQtiPAdsPedSEP
	i9lPFjTR/DcDys5GlLKJWvw+Hbc6jl9cdQOA/Vuz/HYaJy48NbE7XAix6RdUqNyLmjCM/X/RsKt
	uH5uzKV/tWKwSMyU2fUFGAL/KYnqOJ6UVZYotnKM+0KCPMNxfHbYzpyRiDT7gWEe1IUM+azYudb
	mJUY6uzDlzPa3b+RLAU0odARBUfadNz5LmWD3wJr0532fHNgxSGAYrvzJGRh6ohs5aQq8r1tMnE
	j1Oj431n
X-Google-Smtp-Source: AGHT+IE+1MbO7swBdbqVmQ1R5hbbZRNVO+d4Pg3Pn5Hz0uCVNDyXo+xAK0o9rI36e+rJ3JGV7WbVvw==
X-Received: by 2002:a05:690c:3687:b0:6f9:aecf:ab34 with SMTP id 00721157ae682-6fb1f2d5ad0mr4850017b3.38.1739296401070;
        Tue, 11 Feb 2025 09:53:21 -0800 (PST)
Received: from localhost ([2800:bf0:61:1288:72d5:e7e1:d832:2e3d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f99ff6a5b0sm22131017b3.93.2025.02.11.09.53.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 09:53:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Feb 2025 12:53:18 -0500
Message-Id: <D7PT472556KX.JXEW7Q9EFR1U@gmail.com>
To: "Andy Shevchenko" <andriy.shevchenko@intel.com>
Cc: <platform-driver-x86@vger.kernel.org>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, "Armin Wolf" <W_Armin@gmx.de>, "Mario
 Limonciello" <mario.limonciello@amd.com>, "Hans de Goede"
 <hdegoede@redhat.com>, <Dell.Client.Kernel@dell.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 07/14] platform/x86: alienware-wmi: Split DMI table
From: "Kurt Borja" <kuurtb@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250207154610.13675-1-kuurtb@gmail.com>
 <20250207154610.13675-8-kuurtb@gmail.com>
 <Z6t9VD3r4ZodtQW8@black.fi.intel.com>
In-Reply-To: <Z6t9VD3r4ZodtQW8@black.fi.intel.com>

On Tue Feb 11, 2025 at 11:39 AM -05, Andy Shevchenko wrote:
> On Fri, Feb 07, 2025 at 10:46:03AM -0500, Kurt Borja wrote:
>> Split thermal features into a new DMI table to support upcoming file
>> split. While at it:
>>=20
>> Rename quirk_entry -> alienfx_quirks,
>> Rename quirks -> alienfx
>>=20
>> and change hdmi_mux, amplifier and deepslp types to bool, because they a=
re
>> already being implicitly used as bools.
>
> ...
>
>> +struct awcc_quirks {
>> +	bool pprof;
>> +	bool gmode;
>
> Wouldn't it be better to have them as bitfields?

Yes, I like this.

>
> 	unsigned int pprof:1;
> 	...
>
> On 5th quirk (if ever happens) this will gain memory.
>
>> +};

--=20
 ~ Kurt
