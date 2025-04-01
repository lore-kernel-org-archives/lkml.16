Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721D2204F6E;
	Tue,  1 Apr 2025 14:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743518642; cv=none; b=JHmnvdHaFAqmMlv/d20zudcv1apjiJVN3l1cYKeYczs+LLLhiqWUj0hxTsV78LuHi57vbr+EZQyoMpc0kgQLJwlf/XQ7FYk1y/adMwa/3/erwRyngvCN21iSHR6n7Y/vlS+1xt2BIWizKq2ncsHNgz8yM4W8ee5B51CmurEw+jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743518642; c=relaxed/simple;
	bh=Ox/5eYi4GlhBdnBXV0M9N+R+ObV+LJoTiX5br973HpQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=tEMu8dpiZkPqYL8KJyrUFw4iVpsJDE2SOTC4NJzhlVXgUQOymfBsGyaRG4LcVG1yKlnosqppKWYtU/CYfWfyGjfu3BEyZV48QWggXZHHfnCX+pG5kX8b7G3UAL9qLoAIgNlbiOD6JmmTQZkI+RMR1CSHrc12vQ4siZwxMyiAOnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XIuyo36o; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XIuyo36o"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-223fb0f619dso105887615ad.1;
        Tue, 01 Apr 2025 07:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743518637; x=1744123437; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=spmdYh5iTMHiWJde+8Fl/6vRQmlnAOCyfRLFHTdbiq4=;
        b=XIuyo36oJCpnd31Y+oRB9/mOM/F1pbrNOKoVF7qHmnu9ycC/aJMePzbm2mScq9IhsI
         kvtF5xbanFxolljmlBC+gwxM2/XXwq8OB9ujIQ7WUxS1mDcWi+2lVM8bMp7UGfuZkSfp
         8EEhJjqPiN5d3fulkGHkldUGQrcgCDok3YckDNaev75vZQ0ycljmUuD9Ef3V0LqVQTXk
         i6UA5sBCtXMhZ2m4PtRi+ZXsRs8cQpx22POUTF3MWCyNCBY2o5fJxwPNh75KjgFNmV+C
         tzk1VGqo62Npx8jeG3/B6o1kn05Ggvf5RLO7l5HmBedYSMmNjLSD3cXleXmCF/q9v2rJ
         TLUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743518637; x=1744123437;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=spmdYh5iTMHiWJde+8Fl/6vRQmlnAOCyfRLFHTdbiq4=;
        b=Hg2ZTOyWcfCyomEiNfotQubckG15OlksM8z69sBmtfSezjVwFlaYUVOYMXfrUrq6U8
         Lr7tTkaLlek08LlH5DvRHy6LvMd71bCJoJoQmG1WB0ziRxPp8PNQAdwlw4mMdKKL1po0
         SehrSABBJDMaBkqQY5hWoDBYmkx1SePW+6BdOuQDrOCm74ImDJub4l60qFnYX8kHGK49
         PGlWvk/JsDsk+BfoRUQCJEjdzdyEt6RTT6r1P8xdhSQ/eVOLPrVnscVeaJfSXg1LjUjm
         SYbWBdfLLWaACmbSTruECHbfAPryqyW7doEm3cWa+q/50vhvDaCIuzjR3AG0ApkVLO6t
         vWRA==
X-Forwarded-Encrypted: i=1; AJvYcCU7gbJ+r9PY9kqKK6YDDIEu4Svd9dM3vZmPSQQW8CHHt7LkVa2u2pmcCfLjkfrJUop2UJImc3sHnuuo89I=@vger.kernel.org, AJvYcCVVrT/OLKzI70UY7JBJRfG50SG1CwnsuQsOC7bQEHQ83u2ChHauyI2eE8kLJLOVzjHqQYM7DAHVzIaYsJM8o8WcFzKIJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlOq2fZEKlo2Jj/+3DUatt/JAZuPF9H9ktnf+Ocer1ZG50OKTa
	3IugPN/6pQdoRKXst0nNqm+Gc9FwlrFYg53xzsb1u7rpDXm+OBo8mtUW9g==
X-Gm-Gg: ASbGncskHL7TaWyDsMANlLAuKMPAy8G5atry9f26KODkM+3t8LPaiyrDcM8S2TZTX3f
	rsjIjbLbhJIN9CQ5oqe+40mNr9p8aGDqhfsDUQl37C4GXSczxclrzNie7UaOPk7NMobiqT3WnJK
	B5dH14aS9Se5ygBv55G9nsXYANp5TFpEj6Jy07EGYElodaH13nRq4zUo4k5xHMgFc78bX1BhlUR
	tiiNroqAtkjC7P8GiCRwn8WbECt+mGNLcKSIsk3kppsHtfQeQOFLr3GFLEcAG3uCHVxti7O52u5
	kSJIs8hdbWp+O5rviwYHEleeKLsBPxY8uNFHyg==
X-Google-Smtp-Source: AGHT+IGsbUh6DxXIIDAIc+hYNcWrRaxqqBY9nNJl1ZK31CCY9lO+b/4ITi+8JpWodsXphv4cIkxwaA==
X-Received: by 2002:a17:902:ce12:b0:226:3781:379d with SMTP id d9443c01a7336-2295c0ed130mr48778565ad.33.1743518637565;
        Tue, 01 Apr 2025 07:43:57 -0700 (PDT)
Received: from localhost ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1db99esm89014855ad.159.2025.04.01.07.43.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 07:43:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Apr 2025 11:43:54 -0300
Message-Id: <D8VDRV58EWSK.MKGI5JBD8RX6@gmail.com>
Cc: "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>, "Hans de Goede"
 <hdegoede@redhat.com>, "Mark Pearson" <mpearson-lenovo@squebb.ca>,
 <ibm-acpi-devel@lists.sourceforge.net>,
 <platform-driver-x86@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, "Damian
 Tometzki" <damian@riscv-rocks.de>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Fix NULL pointer
 dereferences while probing
From: "Kurt Borja" <kuurtb@gmail.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250330-thinkpad-fix-v1-1-4906b3fe6b74@gmail.com>
 <455d5e7d-6f1e-a0a0-773b-85c26418bf54@linux.intel.com>
In-Reply-To: <455d5e7d-6f1e-a0a0-773b-85c26418bf54@linux.intel.com>

Hi Ilpo,

On Tue Apr 1, 2025 at 8:24 AM -03, Ilpo J=C3=A4rvinen wrote:
> On Sun, 30 Mar 2025, Kurt Borja wrote:
>
>> Some subdrivers make use of the global reference tpacpi_pdev during
>> initialization, which is called from the platform driver's probe.
>> However, after
>>=20
>> commit 38b9ab80db31 ("platform/x86: thinkpad_acpi: Move subdriver initia=
lization to tpacpi_pdriver's probe.")
>>=20
>
> Next time, please include these into the paragraph flow normally obeying=
=20
> the normal paragraph formatting. I changed them in this case.

Thanks, won't happen next time.

>
>> this variable is only properly initialized *after* probing and this can
>> result in a NULL pointer dereference.
>>=20
>> In order to fix this without reverting the commit, register the platform
>> bundle in two steps, first create and initialize tpacpi_pdev, then
>> register the driver synchronously with platform_driver_probe(). This way
>> the benefits of commit 38b9ab80db31 are preserved.
>>=20
>> Additionally,
>>=20
>> commit 43fc63a1e8f6 ("platform/x86: thinkpad_acpi: Move HWMON initializa=
tion to tpacpi_hwmon_pdriver's probe")
>>=20
>> introduced a similar problem, however tpacpi_sensors_pdev is only used
>> once inside the probe, so replace the global reference with the one
>> given by the probe.
>>=20
>> Reported-by: Damian Tometzki <damian@riscv-rocks.de>
>> Closes: https://lore.kernel.org/r/CAL=3DB37kdL1orSQZD2A3skDOevRXBzF__cJJ=
gY_GFh9LZO3FMsw@mail.gmail.com/
>> Fixes: 38b9ab80db31 ("platform/x86: thinkpad_acpi: Move subdriver initia=
lization to tpacpi_pdriver's probe.")
>> Fixes: 43fc63a1e8f6 ("platform/x86: thinkpad_acpi: Move HWMON initializa=
tion to tpacpi_hwmon_pdriver's probe")
>> Tested-by: Damian Tometzki <damian@riscv-rocks.de>
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>
> Applied to the review-ilpo-fixes branch.

Thank you!

>
>> ---
>> Hi all,
>>=20
>> The commit message is pretty self-explanatory. I have one question
>> though. As you can see in the crash dump of the original report:
>>=20
>> Mar 29 17:43:16.180758 fedora kernel:  ? asm_exc_page_fault+0x26/0x30
>> Mar 29 17:43:16.180769 fedora kernel:  ? __pfx_klist_children_get+0x10/0=
x10
>> Mar 29 17:43:16.180781 fedora kernel:  ? kobject_get+0xd/0x70
>> Mar 29 17:43:16.180792 fedora kernel:  device_add+0x8f/0x6e0
>> Mar 29 17:43:16.180804 fedora kernel:  rfkill_register+0xbc/0x2c0 [rfkil=
l]
>> Mar 29 17:43:16.180813 fedora kernel:  tpacpi_new_rfkill+0x185/0x230 [th=
inkpad_acpi]
>>=20
>> The NULL dereference happens in device_add(), inside rfkill_register().
>> This bothers me because, as you can see here:
>>=20
>>  1198                 atp_rfk->rfkill =3D rfkill_alloc(name,
>>  1199                                                 &tpacpi_pdev->dev,
>>  1200                                                 rfktype,
>>  1201                                                 &tpacpi_rfk_rfkill=
_ops,
>>  1202                                                 atp_rfk);
>>=20
>> the NULL deference happens in line 1199, inside tpacpi_new_rfkill(). I
>> think this disagreement might be due to compile time optimizations?
>
> How did you map it to line numbers? Is it just about difference in the=20
> compiled binaries that results in different line numbers?

Oh - I just manually followed the dump trace in search of the first
instance of a NULL derefence. If I understand correctly, inside
thinkpad_acpi we do reach rfkill_register(), which is line

 1227         res =3D rfkill_register(atp_rfk->rfkill);

and I imagine the RIP happens when device_add() tries to get a reference
to the parent of the allocated rfkill device. But it's weird because we
shouldn't even reach 1227, as the NULL deref first happens at 1199.

NULL deref is UB so I guess it makes sense?

BTW I got all these line numbers using the base commit.

--=20
 ~ Kurt
