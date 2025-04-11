Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0352367C0;
	Fri, 11 Apr 2025 13:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744376779; cv=none; b=E5rC6TcBkgXyYv08Ga1p5debVlyqVUDjx7AuYkcobOPhT+etq7pHT/WLiZTWDcvtRJCarO2bIiGT6hT/nRkkFPRYtWxDZVAoZkAZ0XeDD3CLMBZgXgxIZf2I9zqK0H7WIhYY9+hLPStP8oMso8XahD87v+jVQma31hZ2hzV37iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744376779; c=relaxed/simple;
	bh=i1D2Ou97CKVNAPnCQI00E6G84TcUKij7uykbq1EQXK0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ADBHxHEND026rEs7mpma0RZYGVLG90pM6OASM03bUnk3k3JBxBgQb8Zf3kH5fFQEpiMsbKV+WvStHs2BzkAE46Gp52ivkx0Q5yJsqt6hyLxttXIQmFRxzhznsmVvJV/NGt1fkMaeQFb4/d6io7G21e+yhvN4rnajWrrMvlWulhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TGipx4Hv; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TGipx4Hv"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-af9925bbeb7so1539576a12.3;
        Fri, 11 Apr 2025 06:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744376777; x=1744981577; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=16Z5M5DcOE9Lnz/2YoHjE2xbLvcfJFwuxbZ0rHOXp1c=;
        b=TGipx4HvMS4zU5F4RlzHJTOnTwWBHJRAeX1jNccXPmN251//Y0pqGGAc3faSNcddRf
         fd2R3hlh8JYrxwfUt0ldQEKWLHGjaagd/riD0n2h+UJ8wIYO1FDxjfNNmcLe0cpMxvG1
         rAe68mDMc6BhkXoIEpsuH8Fv+HEaFHBau6LUkQZtk7TDOoMwmjLuZzjfmYRJNKZygTL4
         pz6OGxpq7S+C3kl4AvLNT2/aGpvYMbLCT6yZTcE6CGkBOPpniD3kZuyx5Q0nBZRDQueQ
         Qi0FQFIkgQ4C5QNIpH4x2WVTPV/Kd9G4s3lkEYIiV14KgdsovXCnvWmY0sYig9Xdd4tj
         4pjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744376777; x=1744981577;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=16Z5M5DcOE9Lnz/2YoHjE2xbLvcfJFwuxbZ0rHOXp1c=;
        b=w2VVpBVAAvDblnMLWb/VYi7KvK1yzouVer7w8BkQn+gZODxIpKLvjrcLuFiEox0aWt
         ZNX5TKn0ve8fLRZMoolIIjRf4L4o/iA6pcHcRsFCMk1K2xKYKOB5ZeL5LmqLeZ7fB2Oq
         lqdSXv80hYtSMLkZoEFx5ebe8a0vSxbXjnabrT8/H/1EL3WiX9gZuLlm/qladocQGlf+
         kuDH20zaoukqaWr/MBFMrskwl2UPO2rgcnmstyuoFslKVNersAqAl1+NzkW2RhEVbyV3
         QQ1p4EPh4EH7hA/Rl/wVzW/Q51bSV/2BLnlAkwEFA65rdlmeilXSX9CsX4zExmnO0o+5
         NLtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlHhnVqJahGJugYRhL+HkKIJcd3ASmChaXEGMydaARtKPyd/C+VLQfi9tmhdsT8m9yL8iCELXTio2dqzUk@vger.kernel.org, AJvYcCXCEHoZk04h2BPoaxqbR061C9dpVyS3RTBR1YC+jB70sU7nGXhcUCL3wKWc04+KwLyleeiZl5mHsWsRYcO/s4Tb5Wuwtg==@vger.kernel.org, AJvYcCXSYhKH/w+bwtKgTBWIiIxEDmBqbe9KD7hXHduIMJx3TtxFcSHbx4eNbz9iP+BDssXF5EgYE2wA4iVYdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkZ+g/pDFPEnsVOShkZ4Yrq3R+SW3EWsYd/c92ULHIzvWi8MyL
	N4+81JF5eAR85jPQXfFWC4n/azBmpZPEhQK7utmTvRIah0TmuEKn
X-Gm-Gg: ASbGnctuSwfsMe1tMnqbp3XVN3sGbx6tHHavwf8mgBCKFKoL3cvbsBM5U5hTC1cWeX7
	IUIONij22MUW18ksd4MIfmtD4nvCnBmhE2PZghy1Y7XBNVe7h8wztrDlhJxvDmK2BG1l0e6lMyT
	JFtBCYM5mv28FyjwsR4WtkiHakr7o3qG57llJUDih7fKg4vb6vidaprjXwTfNpgY/CJcd5jFYpH
	rQZv9M0gCVnC3BBvbe+/LyTUW/SCBpr4DUez/KLwXujsFQyHGnX5BpVqgeBILdmBPbUNwLSo1+u
	c0U0XprbxIvb7rwGdCeUvrTZSHno2ykInA/dz6YFFMAz
X-Google-Smtp-Source: AGHT+IHXQQJNr5f+2rw8eFFY8+eyi02x6fIaImpu1b5SZ9n1NvT8kBsWxbUjmHZDGm5jodN/VR8VFw==
X-Received: by 2002:a17:90b:582d:b0:2f4:4500:bb4d with SMTP id 98e67ed59e1d1-3082367494fmr4128050a91.20.1744376776800;
        Fri, 11 Apr 2025 06:06:16 -0700 (PDT)
Received: from localhost ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd18580esm5628306a91.46.2025.04.11.06.06.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 06:06:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Apr 2025 10:06:12 -0300
Message-Id: <D93TYI9ZM4N1.R9F1FMQ8H12S@gmail.com>
Cc: "Hans de Goede" <hdegoede@redhat.com>,
 <platform-driver-x86@vger.kernel.org>, <Dell.Client.Kernel@dell.com>,
 <linux-kernel@vger.kernel.org>, "Guenter Roeck" <linux@roeck-us.net>, "Jean
 Delvare" <jdelvare@suse.com>, <linux-hwmon@vger.kernel.org>, "Bagas
 Sanjaya" <bagasdotme@gmail.com>
Subject: Re: [PATCH v7 00/12] platform/x86: alienware-wmi-wmax: HWMON
 support + DebugFS + Improvements
From: "Kurt Borja" <kuurtb@gmail.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Armin
 Wolf" <W_Armin@gmx.de>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250329-hwm-v7-0-a14ea39d8a94@gmail.com>
 <174437423366.3859.4617952203843157795.b4-ty@linux.intel.com>
In-Reply-To: <174437423366.3859.4617952203843157795.b4-ty@linux.intel.com>

On Fri Apr 11, 2025 at 9:23 AM -03, Ilpo J=C3=A4rvinen wrote:
> On Sat, 29 Mar 2025 04:32:17 -0300, Kurt Borja wrote:
>
>> This set mainly adds hwmon and manual fan control support (patches 7-8)
>> to the alienware-wmi driver, after some improvements.
>>=20
>> Thank you for your feedback :)
>>=20
>
>
> Thank you for your contribution, it has been applied to my local
> review-ilpo-next branch. Note it will show up in the public
> platform-drivers-x86/review-ilpo-next branch only once I've pushed my
> local branch there, which might take a while.
>
> The list of commits applied:
> [01/12] platform/x86: alienware-wmi-wmax: Rename thermal related symbols
>         commit: 8a1a0fb55f8a8e482314d2769a9cac0703016fd4
> [02/12] platform/x86: alienware-wmi-wmax: Improve ID processing
>         commit: a000da9dbc249642233587a80df03130e8983d10
> [03/12] platform/x86: alienware-wmi-wmax: Improve internal AWCC API
>         commit: 45983d19f305a562386f4d13accd11056b99f48a
> [04/12] platform/x86: alienware-wmi-wmax: Modify supported_thermal_profil=
es[]
>         commit: 77bb2ec55700ee3af0cd902398fa903363826679
> [05/12] platform/x86: alienware-wmi-wmax: Improve platform profile probe
>         commit: 32b6372ddd4385a47a6a4b6ccff0c22b7be8765a
> [06/12] platform/x86: alienware-wmi-wmax: Add support for the "custom" th=
ermal profile
>         commit: 3dde0ae1eb5f00c1d61959d1fcce2b1b46ccc199
> [07/12] platform/x86: alienware-wmi-wmax: Add HWMON support
>         commit: d699907834959c87a6b6c5214d5e9a3e8ba6b5a1
> [08/12] platform/x86: alienware-wmi-wmax: Add support for manual fan cont=
rol
>         commit: 07ac275981b1f11a58dd7bb7790eed66252b072c
> [09/12] platform/x86: alienware-wmi-wmax: Add a DebugFS interface
>         commit: b028fb497c152febbdc48b544aaaadbe06406dbf
> [10/12] Documentation: wmi: Improve and update alienware-wmi documentatio=
n
>         commit: a56d188a0a8f3df4860acf66a6af89318ce611be
> [11/12] Documentation: admin-guide: laptops: Add documentation for alienw=
are-wmi
>         commit: 3e48767ab53b56d31c77a063d022ca9aca43bf22
> [12/12] Documentation: ABI: Add sysfs platform and debugfs ABI documentat=
ion for alienware-wmi
>         commit: 361813db5d9ba33434754c0de1207a2b91264ab1
>
> --
>  i.

Thanks a lot for your work on this, Armin and Ilpo!

:)

--=20
 ~ Kurt
