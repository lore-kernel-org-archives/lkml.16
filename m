Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD60C215073;
	Wed, 30 Apr 2025 10:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746007839; cv=none; b=NOYMwwDHQqEjC7mxKyxrQqa6HEPBeyXyVWIeFHSP3YNROM7Q8XgAiVaQuAj5wUwBb+CPyHqRNTE77wn6FetvYK+r6OK3Cq2v3ZY4nobYxbu1GlSnrQd+HwJ6FkCvyPGkk1MPNCoz0/cv0MaOhRacUVXFr4kxC39Vg9LmEh/dTYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746007839; c=relaxed/simple;
	bh=A+ai1yi7CyR7wfx6SL6+0B8dv3jNL80Z9qij1S+DR/w=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=athFUztjY7261pvenE6fGGrVpFpPfWp1vsYt5be5hKDNRMCJ/yroQnho5BnrneVlZiZI+YT/9EfTOhSun0qIADNKtAOFTHhpFKG5BfrnEaTte+eb3LY7zF0cxtvRe3DC1D36UyBQf/6Jnvuxx1FTEkqEIg/ne8swKlm/JQMGS1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B7OmusVO; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B7OmusVO"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-73972a54919so5959023b3a.3;
        Wed, 30 Apr 2025 03:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746007837; x=1746612637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A+ai1yi7CyR7wfx6SL6+0B8dv3jNL80Z9qij1S+DR/w=;
        b=B7OmusVOa1mT6AIKlfvHei9HQpaA1DdCDOgUNYtKQWHz5LQVqNWhdGMmAAI00Hqi/K
         yNNoX3mBhnsAwAEnggf9EktdXGAH4qGFGTKiBiCIwVg9l/pgPmuRiuUoeY5d9RKuyerm
         +PiaeaCaRJDoS3mlBDxBdqLSb7ZIXwHnvh3VgH5m0/AoXqToP1LrvBWa8HrQkKw/bHhc
         cx2xVpN7aKimhIlwlM+Q9nWEuf/L3ojrzEpDlZEeAUk8jM2ee8/0OtC6XuHsvrawUW9+
         R9SbF6EmQvjWdF77KnPGq1f3LCc86n8U47jJLTT+MulBz/HHq0s6omzK1R4URmN3p3o6
         WDJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746007837; x=1746612637;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A+ai1yi7CyR7wfx6SL6+0B8dv3jNL80Z9qij1S+DR/w=;
        b=fZWy7RmpVnrSNPMExVXhsvnKySzGfN73/Xf5nJnRBN0To3uC7y3RupPH7Tjxwie0R3
         tI52F8jQPRpK1RACWPFyNHBqGG0vNDKd0Zx0CBX3DEmZvyqmzLJmwMVjrQtYTQJR2XO5
         InmRWRAvwLF9f5aQZJjiFuSV1Ccy6+3KImocOqI+0jr0ZXZMSg/pemw4RiERjKikIULl
         LnkO1gMAR1U47wnxn0QaYsm0OkBuTUhHsoIIivZTNwQpI8sT5QaGeqL0uzBLu3fLUKK5
         OcWO2cV/qcbCZgob0HusxPF3SdLb5KwvOYH6/ablJTxGGonRti8DLcXujFI1dqqu+SWb
         6CjA==
X-Forwarded-Encrypted: i=1; AJvYcCW2/kWT4F89+e+QMfGqgirIzciphfb2AFL8oPEeGGPzsWKR+cVLc0SYy711oXm6eDVgkPqEspzkh5vMRNarIAIr0rT9xQ==@vger.kernel.org, AJvYcCWZCtwu1JxWVT2Pk/gCculv97EiPqt08w+bvqah27JrwAQrruJX44IZhofnfVr1AyV1EFrhENoTqL1zqLbG@vger.kernel.org, AJvYcCXstjI4jFXp1lP9rh3wyU16ydM1gqrUXwVleeNu9MJ/vfPGLL/ZQiAWS1WNWAiisV534HO/+Lvsl7Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKyMUF3rSi5fYk4EGGtw/1s7ebCs+4phugdU3I6H+w3BBKUzLk
	2GoXjqKaeCpU6ikd5IOUJpvl8I1zVpAQwWQIfdgb+OgYDy3lQ+AC
X-Gm-Gg: ASbGncs6GrK5ID+aIpuDFTnmwb2wPARCr66/zT6E/QS9R+4H+oDBVdk8SlTylfrK/4X
	HYzhgbsZYcLFhsS8bT8zqmtQNfPMhQfYijv3xzsVjh+RjUEQqx8mHUtZmzHJzz2BnO6iIDU3DXF
	wMaUWUwB7qiXB+TMvSIr+6L570Zn2wIsFdQZzK35ZGlp14EOx9TiewIqZblXr0ZHERCUu3TypZo
	pXrFsyj3WmiyhvZ/k+xtOoLT03rzpv1EJ5C4Fn9iBT8LqxJR5STvZkdsvHD+ZFgzhKtHYDVq266
	ga4RwwXVGKCGho52nE/LWAj+vGZTqrXBiYj23ZspxsJtQfcvIRmy4l72g0QU0nbWc0lk0r6i+gQ
	epGWOpAERL2aOkBqSbOz8oQ+J
X-Google-Smtp-Source: AGHT+IGDoHYYHKLhr7kiY5AgNFNLBsIJ7/wURocSmLBFOGRvhA0ytCCyy+DmlyLg78Ycp4cMRSvjKA==
X-Received: by 2002:a05:6a21:1643:b0:1f5:a577:dd24 with SMTP id adf61e73a8af0-20a87d4f3f1mr4083706637.25.1746007836826;
        Wed, 30 Apr 2025 03:10:36 -0700 (PDT)
Received: from [127.0.0.1] (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15fa80fa97sm10217887a12.51.2025.04.30.03.10.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 03:10:36 -0700 (PDT)
Date: Wed, 30 Apr 2025 03:10:36 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: ALOK TIWARI <alok.a.tiwari@oracle.com>, Hans de Goede <hdegoede@redhat.com>,
 Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
 Mario Limonciello <superm1@kernel.org>, Luke Jones <luke@ljones.dev>,
 Xino Ni <nijs1@lenovo.com>, Zhixin Zhang <zhangzx36@lenovo.com>,
 Mia Shao <shaohz1@lenovo.com>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 "Cody T . -H . Chiu" <codyit@gmail.com>, John Martens <johnfanv2@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 5/6] platform/x86: Add Lenovo WMI Gamezone Driver
User-Agent: Thunderbird for Android
In-Reply-To: <1108c3ac-4815-814d-82b0-2ba74311d883@linux.intel.com>
References: <20250428012029.970017-1-derekjohn.clark@gmail.com> <20250428012029.970017-6-derekjohn.clark@gmail.com> <a18175cc-3513-4621-9d8d-e9556ede1022@oracle.com> <F54435E0-B3F5-4F99-9184-EE4D8D54DBD6@gmail.com> <1108c3ac-4815-814d-82b0-2ba74311d883@linux.intel.com>
Message-ID: <855BB61E-C9F4-4D1A-8A09-260DAD61E2CD@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On April 30, 2025 12:58:35 AM PDT, "Ilpo J=C3=A4rvinen" <ilpo=2Ejarvinen@l=
inux=2Eintel=2Ecom> wrote:
>On Tue, 29 Apr 2025, Derek J=2E Clark wrote:
>
>>=20
>>=20
>> On April 28, 2025 9:39:55 PM PDT, ALOK TIWARI <alok=2Ea=2Etiwari@oracle=
=2Ecom> wrote:
>> >
>> >
>> >On 28-04-2025 06:48, Derek J=2E Clark wrote:
>> >> + * Determine if the extreme thermal mode is supported by the hardwa=
re=2E
>> >> + * Anything version 5 or lower does not=2E For devices wuth a versi=
on 6 or
>> >
>> >typo wuth
>> >
>> >> + * greater do a DMI check, as some devices report a version that su=
pports
>> >> + * extreme mode but have an incomplete entry in the BIOS=2E To ensu=
re this
>> >> + * cannot be set, quirk them to prevent assignment=2E
>> >> + *
>> >> + * Return: int=2E
>> >
>> >The function returns int=2E
>> >But logically it's returning boolean false, true
>>=20
>> I may have overdone it by removing all bools after the v5 review as I=
=20
>> interpreted Ilpo's comment to mean I shouldn't return any bool c types=
=2E=20
>> I'll wait for them to weigh in before changing this back=2E
>
>Hi Derek,
>
>That is certainly a misinterpretation=2E
>
>It's perfectly fine to return bool from a function=2E If there's no good=
=20
>reason e=2Eg=2E because of some API that requires int return, booleans sh=
ould=20
>be returned as bool=2E
>
>I was trying to say your kerneldoc said "Return: bool" for a function tha=
t=20
>returns int=2E Both "bool" and "int" are C types so there was a contradit=
ion=20
>in that, which is what I tried to point out=2E Please write "boolean" if =
you=20
>refer to a boolean which is not "bool" typed (but consider what was said=
=20
>above and if the type too can be changed to bool in that case)=2E
>

Okay, that makes sense=2E Thanks for the clarification=2E
- Derek
