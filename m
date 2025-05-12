Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036C9254AF6;
	Mon, 12 May 2025 21:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747085043; cv=none; b=lVrvTp4MSFBQ+q1JLttbUODAtdV/+tpF+EjJClXzPB65a3DAl0Cznp0xLcWHy6bytRdJdXpeMWoBMoYj1PJlrheEVBoxfdct+SFboqH46KrQb4VgkjYtkKI+7fRX3rNn+uCPAAdWODJ4ENNp+yWrSEP8Q9JSGKXbZocTILrv2og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747085043; c=relaxed/simple;
	bh=AgRKYtMQIMH8ehdZO9efCTgqJfzUevCpWL5LffGLj04=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=X8TFeybJPTZf4igBtaM5J3/PjqALPmiuYzaOixhQXlI+TrACQb6Zc0e6kYKk1ZRGz6MLZwsxohFthE5i1mqsuEHWlUKj7pipzSJQJzHqNUBasJulYQTdOlVcnTPo69TsywnC/XUGUuHOSuWEVnw9FRBCicN5NAO7yTZ4qAZtV2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NjhZIeRN; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NjhZIeRN"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5240b014f47so1834425e0c.1;
        Mon, 12 May 2025 14:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747085041; x=1747689841; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H1y8ddqUwK2mifQat1oCyUc2hwl5C0u9uYpnJo71fuE=;
        b=NjhZIeRNC58AobS3dS5GpxTQO4ixIjZkRlzLDW+HACpJvYcGy8w/6prrhV94sJMOnI
         vdg5ew7dWkFTfUq70ca/qel9MYjyg/BnbxBAKQ7STFLZ2mbvBaWTJOi3CX0XU5l3/FoB
         Y9mGR65rOyZfE9RbatboQBZS/u5a93eKPBZM2GYGFcSQ5a/ROAKKhfg5RKxzRh4MN15/
         hCSvTXAcf34NoLb6LrDBpC2ZnZIc0UE6yGbPLJoOa5tlsnn6rUa/TJujR9+Wadc7+j07
         mrz6zlMkA6uFahjn03EetnNIfDZh/gEEODmOGG0tDhXzwo65+urDZnyCNHAGZjmXJ7Nx
         4Ufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747085041; x=1747689841;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H1y8ddqUwK2mifQat1oCyUc2hwl5C0u9uYpnJo71fuE=;
        b=lAhxt4Vh185fSRWdayLT5Lp7LEjoqsqfgVH60Skj7oNCUqBgh+9Ic4qgayPftM3qfm
         J25TJ9e/j7UEXy/4irOqu0cuzkWNCdF1VBG05r9JDF4VXcXwZ2wpr76967Rb83nMmfPE
         Ou331HE9IgmBiF3atxv8sAHdCwkOwC0lerA0EFfxsbV2iRrznI6mNCDWhA67lxTayVOQ
         B6Gd16fIGzo2qPZQNwWqaoaFJqqVuUuGjjHOGeQ7njOj/YtsqjsmFCaGLXJxRN9SjyNQ
         UaLnFxXpJvltek4mn4w9BOaPqmehh6BYHIy584O8INSsHPCxsniHB8qtFhC9k4nwgJTn
         naQA==
X-Forwarded-Encrypted: i=1; AJvYcCUcnPOwr6JRm3guyXqgvnhIoGa8WGaPbnlUiCj1vSy0DPngaEMv534mVrX7bMwJnTCg9tU5mOixQ5Yx0q9r@vger.kernel.org, AJvYcCWB9Y2ZBfTYH3W8n7J6f5yzUBcI1BJEQcq6KCpdKmDZmCL3kgJ27cMFgr3CPpt0mI4e2JGSraMvrxU=@vger.kernel.org, AJvYcCWcMm+3L0Fqj05ATBR4EJ6qmVV72fcyOqZjL4vl8O7ehXVI0JLNV/gWWoSxzsemC7CiC+37rQ33E6S96Wo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8jJW0LfE3YZScySLhahIW4EhXuINGCDiBo/Wb//41IUh6814R
	iRe9mVtdO44D3lizfl7l/cE77G2o/3WmHsRuvX3tpPPJrvIQedeP
X-Gm-Gg: ASbGncvmNCNjw4GTx/o0oMTkNaZ1U4b86rXNmlcxU9asQBelaqpKfMU+iq3AkOlSxkO
	s+p89ZLBcGXrzOvNolf+yDwQAljLZCitCRfriNsoh3TWRme5bcL1z6Rec12x9X1N50BcHHUyGeP
	rcpd6dMzqXjxUxDh/df7Z6ZfUHvYv/pkIIgaAjkEq0a1/8UbL78yBhoTDr8k2GGtYl4/blpkQgk
	rAAWT+g6F733zR9D9TmY9pJIuQg0bqZ5bGd1rXXE5qtd8m9LDJPWF81ME2wtNdSja1cUEaISH/o
	4igZmDdXcnl/5DjpKrpSUyRe5FXd5E69TFMIGQjb+99L
X-Google-Smtp-Source: AGHT+IGJNYqfAtG1JdrrcwOLDs4b80cqSTnpN61CB/xrNs82fEgIxdlKPwf178QFoQNeK9272PXodA==
X-Received: by 2002:a05:6122:882:b0:529:2644:8c with SMTP id 71dfb90a1353d-52c53cb288cmr9706394e0c.8.1747085040746;
        Mon, 12 May 2025 14:24:00 -0700 (PDT)
Received: from localhost ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52c5372af6csm6394067e0c.14.2025.05.12.14.23.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 14:24:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=254b8c2c11cc424654e002f764a298d777677eb2956769ac6cfe99a4f75e;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 12 May 2025 18:23:44 -0300
Message-Id: <D9UHYC9360RO.8BN28N2MJ2G8@gmail.com>
To: "Antheas Kapenekakis" <lkml@antheas.dev>
Cc: <platform-driver-x86@vger.kernel.org>, "Armin Wolf" <W_Armin@gmx.de>,
 "Jonathan Corbet" <corbet@lwn.net>, "Hans de Goede" <hdegoede@redhat.com>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Jean
 Delvare" <jdelvare@suse.com>, "Guenter Roeck" <linux@roeck-us.net>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v1 02/10] platform/x86: msi-wmi-platform: Add unlocked
 msi_wmi_platform_query
From: "Kurt Borja" <kuurtb@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250511204427.327558-1-lkml@antheas.dev>
 <20250511204427.327558-3-lkml@antheas.dev>
 <D9UFCPLQHE5V.UH1BAK279S5M@gmail.com>
 <CAGwozwE6-=9L2RTwipgHjmdQWzBAX7PxBYgJO_oGcWaHtLhoSA@mail.gmail.com>
In-Reply-To: <CAGwozwE6-=9L2RTwipgHjmdQWzBAX7PxBYgJO_oGcWaHtLhoSA@mail.gmail.com>

--254b8c2c11cc424654e002f764a298d777677eb2956769ac6cfe99a4f75e
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon May 12, 2025 at 5:51 PM -03, Antheas Kapenekakis wrote:
> On Mon, 12 May 2025 at 21:21, Kurt Borja <kuurtb@gmail.com> wrote:
>>
>> On Sun May 11, 2025 at 5:44 PM -03, Antheas Kapenekakis wrote:
>> > This driver requires to be able to handle transactions that perform
>> > multiple WMI actions at a time. Therefore, it needs to be able to
>> > lock the wmi_lock mutex for multiple operations.
>> >
>> > Add msi_wmi_platform_query_unlocked() to allow the caller to
>> > perform the WMI query without locking the wmi_lock mutex, by
>> > renaming the existing function and adding a new one that only
>> > locks the mutex.
>> >
>> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>>
>> You only use msi_wmi_platform_query_unlocked() to protect the
>> fan_curve/AP state right?
>>
>> If that's the case I think we don't need it. AFAIK sysfs reads/writes
>> are already synchronized/locked, and as I mentioned in Patch 10, I don't
>> think you need this variant in probe/remove either.
>>
>> I'd like to hear more opinions on this though.
>
> Are sysfs reads/writes between different files of the same driver
> synced? If not, it is better to lock.

You are right, you definitely need locking there.

However, what do you think about introducing a new lock specifically for
this state?

IMO locks should never be multi-function and I don't see why all WMI
calls have to contest the same lock that we use for fan stuff. This
would eliminate the need for this extra function.

Also keep in mind that by introducing this patch you are also extending
the time the lock is held per WMI call, which is also unnecessary.

--=20
 ~ Kurt

>
> I want a second opinion here too.
>
> You are correct on probe/remove.
>
> Antheas
>
>> --
>>  ~ Kurt


--254b8c2c11cc424654e002f764a298d777677eb2956769ac6cfe99a4f75e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSHYKL24lpu7U7AVd8WYEM49J/UZgUCaCJm5AAKCRAWYEM49J/U
Zi7zAP99xb45vUrqw7yJ5tFE0rSGA79wZt2Q3mTC7iPwI/xUygD9GcEHVVY7P6ss
FG8GFO8i3rKWll1Kls500qeReLmHuwU=
=GJbb
-----END PGP SIGNATURE-----

--254b8c2c11cc424654e002f764a298d777677eb2956769ac6cfe99a4f75e--
