Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B69118DB35
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 23:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748388290; cv=none; b=S/eWnrHvjzT5vDkQdEhigFsf9L1j4BwrCm5Va18v9Vvh0AR0TvG0nUDO1d4GCWhktcBm8lkgiSvp3gh4bnti6wvEc7JM5f1DYI00Zv/vO7wAcN0z0OR7Njj6xBHx9OTCe0vFh2du6Y8v+wgAfX8rga5jULu9CUv8x+bUIwi86FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748388290; c=relaxed/simple;
	bh=jKy9NgchQt+WvfZ21StHpNggfPe2eTnQo5wDW9nwTDg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O5EJ1HtkJVnLcIHNoJiG+6hyLdIRifdmm7P/y/Ej1sQ3jaSiD4SexEVaPaBY59I48THb73N7EORVuUEJzrvbv2sJ3YZ0aWfrIDyJaKJmb3EhwAx83CFM6+1FD4kgJc4METsrVpfGfdS8z3GnHQ+SbaqPxJPQU0Vyuc1OKK/7qvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com; spf=pass smtp.mailfrom=futuring-girl.com; dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b=WcAFA9nj; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b="WcAFA9nj"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b13e0471a2dso2293523a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 16:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=futuring-girl.com; s=google; t=1748388287; x=1748993087; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4/AdhCxX+fhaAjqKIeGANn/dtdFJvwGse4cpAiUUl8I=;
        b=WcAFA9njMa2VYAI8j2ZPo/zHc5ORWTTIycFo221I2UboREN/oMXU35jOmFhihfNKtO
         +pyzt1L47IOh950wVEh/zeFIX/TIbCUO/52qCPLeHg/KSyekuA2QmZJ0kVdhSry1xCA1
         22/nyj3G4TUzQ8XooQqvURm+Eoqto7zwRYRczF7gVWjPg79xDtYOLJJx18rsZ+BZD29j
         S2g/slpOuXFlnfbvYIeWT6rABL01hK+e2i+e9NMMgIMNziSJ1Q5e7fzwbmmA/Za+jI3J
         dds7yseeUKLHXDyQBlvtjU6ss2K9QnLgQbs8PNIeGkptOj/+eT84mUmRZXlmD8zNvXcC
         7Acg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748388287; x=1748993087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4/AdhCxX+fhaAjqKIeGANn/dtdFJvwGse4cpAiUUl8I=;
        b=Y6Wv4/UVke8CKuvOdIBW3l+M4bIHoi2kykCc83tiZNp+bjSxXWltT1LWYt5n3jGJjF
         +nFgiJDeBiYueSg1M3klAlphsC7/8oRAzMeCMo3wNQ0aEEmbl1JKbbXFnTXPQgjSYOoL
         4rZCh17sp7GW3uvIg62UXlfqGmyORsAQdn3By4hwULW9RZN3Dgh99NqBVtOxhhQdsuN0
         09wE+4va7UyXPzFhZHDPXe+HgDlxnQh/jLbZJ3zL5DEByxPWSkESS+utEH11WPMVG3pK
         wOeh2YPZdmdCusuMW4AGMn/GAnm6ZPOKHPGJ4AcXhvxEYGEl9TILYCHjAged/5GXovVK
         Y/oQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeJilt5K3cf61rnP6JkIJOm/t9BnQdWD7uff84Ke8Yx+2UZBnfzopykxKfdg/ValMdin/Ra3xO4LmYqZA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBaj2uFPZ3N0rbA8syCst4OwdQve88tEv3S6eoKTOXhPpFseEp
	CgpuUMfettwRbJBD7osku6ScdKFDroe9WQdNPeRIe11B/F+yeRxUfc2G7AC+svjZiO45YjM8Nin
	LpSVQPLsHOfpT7Mx+DSdC29JpGyTaXjOPp9JF+uJlbQ==
X-Gm-Gg: ASbGncv3y+8vy7ihO0f+cppPl6R3vPyahYOWU8tKBfzTkTRTDA6lU5VQIeu+xnqIKmV
	Sc9kkfU3WdzFCAW28XOZ0JgUGtcVvynBTvHXtp3SiEYbBMEHUA4iHfleCxPCUtfWtzGfQ3ZzoPB
	fAUiKk06o1YVw06JErkR/WlJtYJfDv2sE/
X-Google-Smtp-Source: AGHT+IFmwubUy4FOTdwjh+r8gzogSmYCj71cSJuKN6sXG+aSYoZbuPnq23rLrIFrYEL3P6VofYv7oiykuQvdMbGlOtk=
X-Received: by 2002:a17:90b:2790:b0:311:d670:a10a with SMTP id
 98e67ed59e1d1-311d670ac7amr1862164a91.21.1748388287317; Tue, 27 May 2025
 16:24:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527162513.035720581@linuxfoundation.org>
In-Reply-To: <20250527162513.035720581@linuxfoundation.org>
From: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
Date: Wed, 28 May 2025 08:24:31 +0900
X-Gm-Features: AX0GCFtS3HerPG9aWFxPBUWJU-YtanQX6WBozRmlEInmQtVP7B-aaEmISIQqRe0
Message-ID: <CAKL4bV533B2X7zzAUY5VMUD0VWey8AK5LFVC=nXOdYu8stf8-w@mail.gmail.com>
Subject: Re: [PATCH 6.14 000/783] 6.14.9-rc1 review
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

On Wed, May 28, 2025 at 2:19=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.14.9 release.
> There are 783 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Thu, 29 May 2025 16:22:51 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.14.9-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-6.14.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h
>

6.14.9-rc1 tested.

Build successfully completed.
Boot successfully completed.
No dmesg regressions.
Video output normal.
Sound output normal.

Lenovo ThinkPad X1 Carbon Gen10(Intel i7-1260P(x86_64) arch linux)

[    0.000000] Linux version 6.14.9-rc1rv-g10804dbee7fa
(takeshi@ThinkPadX1Gen10J0764) (gcc (GCC) 15.1.1 20250425, GNU ld (GNU
Binutils) 2.44.0) #1 SMP PREEMPT_DYNAMIC Wed May 28 07:41:25 JST 2025

Thanks

Tested-by: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
