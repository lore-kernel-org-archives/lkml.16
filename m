Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D299D2EE974
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 10:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751623808; cv=none; b=dOxUC0L5we6ncGePhdWKgfAwOelsEtJGKL0rq+A4vAuE+erP44NVW5JJ9bLEJqDSo+tumXajQnDV9vwTo8vzxIhK494vGkVf5ehNWWzNeKc3C1Ys8r/6O7FwRD/KvJzTHpvzKIGDoP+8njdIwwFAEp7Ek23t1pqbcdQX/1i5YzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751623808; c=relaxed/simple;
	bh=BvJSQBbLCgsK0nHpn3Pabnf+DjFGHNKncR/GG/p+WXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DqOaMNLsuQUdd8ZEVrmU16VCmcYhvZgtueUoXhwfpp5SyHuNGjEqf1qpLG5QJrqrgrjusnSceQ8r5+3LNAmJzFzXOkDgg/HGPAgTDE1/01ugGLcmZ36OBTw4TNTAtpe+DrEDvRAXITX+UeKm33FBi9qaTislNKl6iOiGB4n597o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com; spf=pass smtp.mailfrom=futuring-girl.com; dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b=dZEKq0/M; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b="dZEKq0/M"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-31393526d0dso631831a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 03:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=futuring-girl.com; s=google; t=1751623806; x=1752228606; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rGomid6tXjDATmj2wPfvjxlPuB+5sxSNFD5zhmmdhyQ=;
        b=dZEKq0/MDYj2TgPwVItQIkcKa3XQ/C5iWfu0mzowkIeS1YaUcj0o3yxKYdrPyvtZY3
         hvTpu9Eq5q8J/Rj1mOphwiXK4oQUF0mUClv7Jkx/c4y98kBmA17TLYMgL0Zz3oHGVJ05
         bflY7+p65obG8FdWLokS2+K13hxN2MxsrDZkmmreEfSsyyonia0DsjtWb9REL8mEuk1M
         /EyKtOmZkRt6+VClqE97ngJNwV/Sfx6j2GTPf5FFSH8VO6ufd5IVCOSeXpvoEpb6yujN
         JT5F6ymD9G5+ExbCF6496VUtZohO9FqurS3Aw8WCl/Xa50I7QczXHON0r7cAVcwVnaA6
         KOZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751623806; x=1752228606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rGomid6tXjDATmj2wPfvjxlPuB+5sxSNFD5zhmmdhyQ=;
        b=oJFy/dz3NHjZsNK+RWWSZYkJh5x6oRBoHFbVmP2ZxLFX9BNnK890HymMViiHUD1hFo
         8AacUBN8mPZdw0Nvc9TC0MKS1V+Bk70yO/1na1u+scYE2gcwAzV3jhx4EYOYy7MFQlzp
         OCZEYsx3no3W0s2C5tNrV7XidRLYHgFlPTE8PxtoS7otiVLvGYAf7mW9/2frUzgn+no0
         zESeeMJ2VHuzvtucuafM/H013vY7vPbBonbtdWmdLGz1xptuRhjfBOS06DvDq/ezD0yu
         ChttZ735mibE2nlMZepksheGae+XfT8nzg6gpjSrqBcbiv8UvNv7XW4LzArLVFSfQ1BZ
         sjlA==
X-Forwarded-Encrypted: i=1; AJvYcCVEMCOf8CR90MI9eMPjev93Z77qtFBIbGl6bQRc2CT94o93G3PBHHGvWhkkqihs0yVBk5Mj5lITWKMO5iI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3i5f5rdg7x1Js95bC4qcpJ/ayGNQTa3iOUQqMhFgweMpX70Sx
	0RodolRsJZyMQ9f1vDIybMOl7cwH7ZpxjFVjehRPAbHar4XLAH8s6APYuTLcR5yoqM9Kxp61mAM
	Lq0dUcsWSQtuC8w6vmfQYVHdldwt097Tvb3FnE030qw==
X-Gm-Gg: ASbGnctHSRjIORogksp9q/TKW6mOj2FHeXWdYNktJhGxbbWuqoAlKtpuCjdCj0nsPF3
	j7X+tASyzR91hbv3oIquS624mDMzdNS0XWq2GyYr+WmUumnSeBBLk5jvOnJGzDboMQdqY2vliMT
	pUR0+JDfiE4di40SJlgyioVS97AXa/94eYkVcnlP46BXE=
X-Google-Smtp-Source: AGHT+IH4BxE99Ef0qUkehLWAfQZiLQKgyRZHUcLhWdiTkP5SU7gyIx7AeqV22ZhDCpVD2aL0hWTQw6EzayZ60F59q/4=
X-Received: by 2002:a17:90b:5488:b0:311:a314:c2dc with SMTP id
 98e67ed59e1d1-31aac451a00mr3813426a91.14.1751623805958; Fri, 04 Jul 2025
 03:10:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250703144004.276210867@linuxfoundation.org>
In-Reply-To: <20250703144004.276210867@linuxfoundation.org>
From: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
Date: Fri, 4 Jul 2025 19:09:49 +0900
X-Gm-Features: Ac12FXx8MuFp5ghMIQFlEe6cTz5NY-x9cQoW3RZ4g18YXENAdqBUMD0S6cvI_8w
Message-ID: <CAKL4bV4mSvr9xRyrdYpopTb87BsbsBCj9t7jO+33PA5BRaFe_w@mail.gmail.com>
Subject: Re: [PATCH 6.15 000/263] 6.15.5-rc1 review
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

On Thu, Jul 3, 2025 at 11:57=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.15.5 release.
> There are 263 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Sat, 05 Jul 2025 14:39:10 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.15.5-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-6.15.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

6.15.5-rc1 tested.

Build successfully completed.
Boot successfully completed.
No dmesg regressions.
Video output normal.
Sound output normal.

Lenovo ThinkPad X1 Carbon Gen10(Intel i7-1260P(x86_64) arch linux)

[    0.000000] Linux version 6.15.5-rc1rv-gd5e6f0c9ca48
(takeshi@ThinkPadX1Gen10J0764) (gcc (GCC) 15.1.1 20250425, GNU ld (GNU
Binutils) 2.44.0) #1 SMP PREEMPT_DYNAMIC Fri Jul  4 18:24:44 JST 2025

Thanks

Tested-by: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
