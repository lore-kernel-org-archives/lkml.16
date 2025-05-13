Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CC31F1518
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 11:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747136338; cv=none; b=g6AZS/87HoUTaaFXn+WXoDtsBP6hX9O8nuxyMV4kaNPhuyl7SP9fPbvvCyckw7EJWv/kJk1dzvTqUusg3hSBVTQ5AnLo6tMW5uhEcqLazi9583t++dvP7yR/6KHYAULc5cknsyqQOQgt5TkoYXAmWlMnrcLm+Md6JgCDW47r6aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747136338; c=relaxed/simple;
	bh=QY0m5Mq3QK+qfBlMurOu9d2I4hNQNM9XNrP3mIvuRdY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OmSTnI5tg5BlqwfH8eFuEFr2lpxVNPJsSd5x4kyEK5/o704eVxp9hDcu6DjlYy0an7XM3UBsEeex2LoPKTrPaQ8vIz3R1XHPwzS4zujDueYP4OH8oOZgBaD0MnkhWw0R03wLutQ12xWJoblmgYvbU/Ppg16Y9pfGePb6aJ1PFx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com; spf=pass smtp.mailfrom=futuring-girl.com; dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b=NupMLPoz; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b="NupMLPoz"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b0b2d0b2843so4205348a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 04:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=futuring-girl.com; s=google; t=1747136336; x=1747741136; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TCDA/phudC5Ubp3SYy7GMsyot2oOw8W6PSjAa8fXQIM=;
        b=NupMLPozXzGpaR85/35iHBmprYRuIhjhVQDmZuP8/X/fXWjA6A2dwrRP4ZKW8DBQkl
         dH+XSxfQCvAhtlzd/7HDN1fc/9+2xcZjb4qd5sgu+zL2i+w9YRBW9kGxKl2IOuAsbe7D
         TePrCLrxKmCvYiEeiqLDMwBy8z8z2Ot/D1XrWoUBWTfFfkMKs30dUo1+R3WjZGBL2TNq
         9bDqCy7meupTVLW8qqPG6bSDA/R/Khg1egPCGGdsK2sLvQF7EAGbKepuUqtoMF3Zjr/l
         Ou/7glMlUC3x0m4ZkT6prHSivTemXd0zr+SJdhOUi9B0ifTkYaOtY6oqL8+wQ9ZOwe3N
         Qq2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747136336; x=1747741136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TCDA/phudC5Ubp3SYy7GMsyot2oOw8W6PSjAa8fXQIM=;
        b=bqa8pC4r3hD+92UDAghdNRqwM+ckGABCsUWxoVczfgqb7cTvYYi5lELHk6xme5HCoA
         XpUD7irppLXmw8iq5zTcTDXlVTnH8TKSmtz1H2SNJNrFfqy0WJZ/1wCmejRnCsEAuhO/
         7+nFNeT/HoeTaIzEMfpFdr8gTGc9P9VOYUso0Yp9/Vsv04vETUhfsxgi5mjDK9XHwzvr
         jbSWgu4UwRq19sSHk3u5wmnxLDs1MLFQmus6COVxYTJX2qHkeI84ka2eddIyuFgPB2fV
         sLrLcpSsrb5f5EChnPVxcyR6WIb3o2MrrR5HVNDs2m23v5M1J3BSF/o3bvHw/BkJBkbN
         XVPQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5VGge0tE1WMVBqYcjD2gr6oKyFIhzHyDq8qBXknwuKOOx1P8uzLjbpiT4gBbpGMaIk2EKiRjJPHdI97Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvAJ6jgyenlkLuC6wDuoBZ5bmktYtr1rB6lWNzadkltLE1G0h0
	McTlzPwtuSQ3ASszHKDGAQm9pIdzmcUFvcFr4hNnyFpY9WZXhTvpzUKOMZKlfd0JklrdQdPjCHS
	bGTYsTJkR60wUWbm1FYwCLwSmHIYhpCueGLf2zg==
X-Gm-Gg: ASbGnctcvkaKYFfjgoF8AmO78vXa+PKp26VhKvyKbsv5CEhOLJPP2KC+vKPEJyS/1re
	xyZ2E/04pYfgD5hM3cfO7oPwRjGquXpc4JTmxweiCRGOrMiArqP8OlQMBQw6pwfC/D6Uv27lQ78
	jsiiMKpH/RBHi/+kxjmMbmLNVm4v5CIl2g
X-Google-Smtp-Source: AGHT+IErFEavacYkaYzKyCsj03GcwMurqloDPo5UyC1bTq/RXs01iErBjbluQ3pLpthUG2UvLKbubccEK3QOiy15YTE=
X-Received: by 2002:a17:902:e492:b0:22e:39f8:61fa with SMTP id
 d9443c01a7336-22fc918875dmr204499885ad.34.1747136335849; Tue, 13 May 2025
 04:38:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512172044.326436266@linuxfoundation.org>
In-Reply-To: <20250512172044.326436266@linuxfoundation.org>
From: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
Date: Tue, 13 May 2025 20:38:40 +0900
X-Gm-Features: AX0GCFsWaVdpAcTWj-O0CPOKts0lC1GIeXOFV79lBRasU6leEtinvJHx6zatOhY
Message-ID: <CAKL4bV6qHhnbm=Q-pXp5wzba7GKhwCwgWGc1QsRCq-eACo_CxA@mail.gmail.com>
Subject: Re: [PATCH 6.14 000/197] 6.14.7-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, 
	broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg

On Tue, May 13, 2025 at 2:44=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.14.7 release.
> There are 197 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Wed, 14 May 2025 17:19:58 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.14.7-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-6.14.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h
>

6.14.7-rc1 tested.

Build successfully completed.
Boot successfully completed.
No dmesg regressions.
Video output normal.
Sound output normal.

Lenovo ThinkPad X1 Carbon Gen10(Intel i7-1260P(x86_64) arch linux)

[    0.000000] Linux version 6.14.7-rc1rv-g4f7f8fb4f8e3
(takeshi@ThinkPadX1Gen10J0764) (gcc (GCC) 15.1.1 20250425, GNU ld (GNU
Binutils) 2.44.0) #1 SMP PREEMPT_DYNAMIC Tue May 13 19:59:27 JST 2025

Thanks

Tested-by: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
