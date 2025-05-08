Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EF9223DD6
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 12:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746706353; cv=none; b=h+cyIPaPB1d5i8kOsKIjzIgJa+/YjwRdCEOgB9F+jrqQS7v2t0gHBd8cWrx6U1ufvWF4Gwgq2gjXdEd7zEAlL3eJBP1rPr6DTBOdHfvFzwG5uWodwO1PQ5t1hWkoCiR7wLHaNxFpGKEfHIo4Gq6U70bBsyLTHBXoai7Vt0Y5O/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746706353; c=relaxed/simple;
	bh=YTlEjrVaZMORPcdtqbke0C4y8V3UF0+iZCzRvxQRU+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Br6jA9qtAnGfX1pdKvDkkHv9EoMSaeEx19Ti9jqaUyU8vXSbAxFpdOprEldENWSbvrsKsuk/iCD1/jw4JTfwPIem1pYx6YbEG86vNqCXQYCPqBxvjBoJR3x00K4iaJAkm6VUHPG9VpsaggdhfxF7k9z/PslH+tC1Jgkafz6CMcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com; spf=pass smtp.mailfrom=futuring-girl.com; dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b=dK6g3GB4; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b="dK6g3GB4"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b1fb650bdf7so501690a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 05:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=futuring-girl.com; s=google; t=1746706351; x=1747311151; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y0GnN2zLN+jwcqw/AYevnBc6HDx0sVBLUkFkXjcaYbg=;
        b=dK6g3GB4iqqxMCMk0rsihfzdiuOAnX33s56Y5sv1IGBmDm/u02J/LVyRNTm1ET1/xt
         defyHwTHdbtc9fBHgok1+wGRsUFnt6dJsIBOJeRP/iE1KeELVM6sMxXMic6Klmce9LyY
         M8G8wk0f0quIuPBhDp+AI5j0s4FhmgEaNvLFrw9L+egcOoLHgKTrMnzRxkQJZNB3t6xg
         sGUV39EKm4ZF1ZLE530yG4Zy3fIEV/IyH6ZO4yKlnHS2V+MRbbm/PsJwO8E3aHAJ7D9b
         JghZiEkDAxbOz5Ch8NacpQUHVmLofgG9WS5WfDhKDydu50j/E8ZX4H+u5Ks5TP0Pb0OX
         r27A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746706351; x=1747311151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y0GnN2zLN+jwcqw/AYevnBc6HDx0sVBLUkFkXjcaYbg=;
        b=hbxPokCcL6eCOQwD6LU6KfYRnkxW65Ucj+/NRZlV6v6YOdpXph1UoC4JKlNzyla2zi
         LnZnbML3a8tCkHUmfZnmtoVAszCLFy1QR+iKFA/V/Y7TU6glaG1SRRCTdh44/cYR9RXg
         EtFw/HwVXIDRDpEtq1zarJ1yDRXN9L88vGhAdyDpZFGxCUrh0a6S8afoLtqvFkcgo6Xw
         sQ12FaetIM9Oa984HtyZ/Tz/3Nt7beNCKTFHZhf2pLj4f3VubKOavHq3r+ex6fyc3jsB
         MX4viA5U38zlvn2rw6pCsl9gvUYMBBXl6MEr/sQ87cmGxRrW46sLfyf9SRGYiFT0RwJc
         Jfaw==
X-Forwarded-Encrypted: i=1; AJvYcCWuFqhCjQ0cxiW1kIwnVVCIHjofjzMtnf3cxrq8vYMs/xrYy4+6gamQHutF8e2aYLFma12FsJalpDNf5ok=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx2cpRKmnyu3AcKVxsDr4eKtegoBzyLKLTw+js19ErWt8wxaJu
	7O/kb21+wODbyhhd3AEYafP7h1A8QXos2OxNlEl8hjRFxe0CsnJEiX3uS7AsITfIgDJqqxOsgTi
	b7pXKYVYkm/4tljdqMeWGfMWPQ3yaXUGNtjVFVQ==
X-Gm-Gg: ASbGnct0wp4YhgXZ3/JnOzoE/aiYTFXQTI+MF9HHAO5QaI1VwgiM3vcfdI+78GHESjk
	iCxfrf3f4EYddtdKMnFlw2MsGmpRemCtHcvXibCjlrRN8YoUAlJSlkiYiW9W/TbrZ06TFD38bEI
	0qJl23lMI3wGS7AVEKE6CmAA==
X-Google-Smtp-Source: AGHT+IE5AaZc6k+qedv3ywSbWB9YaEJxg6FlsqvBzg4yPSs5n2Jeme8sRai66OYETNlq66zkPNs4uU3wMHLIl8bpXHo=
X-Received: by 2002:a17:90b:3e89:b0:30a:2196:e654 with SMTP id
 98e67ed59e1d1-30aac1b2907mr11342735a91.15.1746706350545; Thu, 08 May 2025
 05:12:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507183824.682671926@linuxfoundation.org>
In-Reply-To: <20250507183824.682671926@linuxfoundation.org>
From: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
Date: Thu, 8 May 2025 21:12:14 +0900
X-Gm-Features: ATxdqUH2P6CaWRpb5gIEUbHMjZ59qZg07BG41t-BPBu0QIMK8pwNTdQkClHsJ_Q
Message-ID: <CAKL4bV76YR9PX1KYY3PF59yDqGRH8koppGbhU7YL1244wPc-jw@mail.gmail.com>
Subject: Re: [PATCH 6.14 000/183] 6.14.6-rc1 review
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

On Thu, May 8, 2025 at 3:50=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.14.6 release.
> There are 183 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Fri, 09 May 2025 18:37:41 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.14.6-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-6.14.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h
>

6.14.6-rc1 tested.

Build successfully completed.
Boot successfully completed.
No dmesg regressions.
Video output normal.
Sound output normal.

Lenovo ThinkPad X1 Carbon Gen10(Intel i7-1260P(x86_64) arch linux)

[    0.000000] Linux version 6.14.6-rc1rv-ga33747967783
(takeshi@ThinkPadX1Gen10J0764) (gcc (GCC) 15.1.1 20250425, GNU ld (GNU
Binutils) 2.44.0) #1 SMP PREEMPT_DYNAMIC Thu May  8 20:39:36 JST 2025

Thanks

Tested-by: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
