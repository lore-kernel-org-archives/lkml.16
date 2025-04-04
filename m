Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1321AA7BF
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 13:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743772839; cv=none; b=FI+NjPuynhd24s1/36fMtzjFIaRj5sWgdXtAvxrsrSkrXsrXK8baajBnWBumZniaX7J0D7dPLKav6w8G5uWQTQPbyFuZItT44rnZXqo37/67t4TsYZCBs+mwnTmeM101Sm5vijTNMyBHyCGM+ND6kkU+EIZuZpLfDi6ps08N8U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743772839; c=relaxed/simple;
	bh=hJW5FZE9wzMGEzmWLYyjuRGd9tpoV26paptZV5/csOY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dwl5SeDgqJI89iw7s+1zWnQMPjsz3MQkvrazFzpU9mEl4+nDDglZy95PP92vs6Yqg+QNm1kGeh6QmAVjMePc8B5/vZI5Z8fODmtTf+QYnfRn9DmlGVCzq2/RxUxmXmgjR9iM+RPKqUzhNK2TliDC9xNQLV1kcG7TOuy9YUy50/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com; spf=pass smtp.mailfrom=futuring-girl.com; dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b=WtorwnFB; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b="WtorwnFB"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-301a4d5156aso1868462a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 06:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=futuring-girl.com; s=google; t=1743772836; x=1744377636; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Kiqs1g4/i+eKRX3/NK1xn8WGoGucOOXfAlNORNd6cI=;
        b=WtorwnFBKvhqc7aCGs4hY59Ed/oSicPsTlVbibhVz1J6fJM1zC2iPbVKxr+624xUBk
         C3wDrIfA2FC2I+jo9D80B9WyoU4DkXlhe3+kS2WaNlw/B6zWyZzCP+y7uf9TQbnhVNkE
         xRrVJDiEixA9B9zhO5BeEu/uHvsJYIp6+wWPuNsiGcELmd4dNlMchjdmL5OEWNOJqi5K
         Bvgjo2FNx7IXXYSIi1fn4iMbLNF9/fOrvv8HXwESyznoZPtKhZUg1HVsa9V8J7Nr/xfV
         MHdBTlpmUxxb5UoyWCXLBzkBNSD5UmDDpDmXpuRwzSu/uDgiZMANd2P62P7Eprai5vqE
         4zxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743772836; x=1744377636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Kiqs1g4/i+eKRX3/NK1xn8WGoGucOOXfAlNORNd6cI=;
        b=xAP/lZRvWGhfDTDMEa42F/N+cEjHi+7fSDTE+MdlUTNjO4Ta1NThAbHKrCmIwNTgcc
         tCHolZXeF5sVyoi4JTPc4ku02pHqUZuIR6sBSO8G9mi+C7y/zA9dFMszSgsopo7Pb9bq
         JccT9W4JboqME88n8ioSrbMrwW98CgdsiRlY5OoKAzIrApxy8+m1AAcn/9bnBgN/zM4Y
         qQIUmaBELzeu8FqNFOPasApeYTUC3IZbERIBHrMDDZb7YsafUefE1EkmkHE0I7AonKKa
         n49zWcPCROCtBEXsgpnH6spbtTCrHxwN90LI1hG9dlXT6FCl3yRxFl5Ko+bbjUtY0Ihw
         REOg==
X-Forwarded-Encrypted: i=1; AJvYcCU2K2grezwh68YyWJ/jkY1zhen8V7DCSEjzp01prrDWxQKWjEYyyWYspkyvN9N3zrQc8cThxK5sE9J9CmM=@vger.kernel.org
X-Gm-Message-State: AOJu0YytuW9NcPkNAA6k2tz3dIe3lPAocCmzlwHjVRq+IyokVdzVBKXM
	qXMgtrJ1QUEktxHt0llmaxdGVhiuOjiW8GEkVzDwm4EFTPUxwqyF7iF1nk6l4ndpwX4L63qhyay
	5A242F69wVeyIWwWN8k0B7vy+nSIe9MWooaCqhg==
X-Gm-Gg: ASbGncug10aKCdSMPqV8+yrWY41aRbse0e4MjB3YRiDbRULN2qw7vFRfm+4FdiuVgJv
	mqY1jirmkkHWBPJdS/gd3Y7mYDjXoIeap+1ErNCJjDMFAvq41vueD2o0HDrntHNJb7BE2SomiJ4
	+TjvMpB4Q984G5pXiIiEYBy5l1Rg==
X-Google-Smtp-Source: AGHT+IFulkjD6tJbY4C9BZj/bnJRutZmb96NKhGLWA8BRDLemCTGRD/MaqJKIKr0q132IsKbryprJauKtWGVOBdc1Lo=
X-Received: by 2002:a17:90b:514b:b0:2fe:b907:562f with SMTP id
 98e67ed59e1d1-306a488a241mr5725486a91.14.1743772836383; Fri, 04 Apr 2025
 06:20:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403151621.130541515@linuxfoundation.org>
In-Reply-To: <20250403151621.130541515@linuxfoundation.org>
From: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
Date: Fri, 4 Apr 2025 22:20:19 +0900
X-Gm-Features: AQ5f1JrOLjXtchCUzPwJ2RZcncY7USR5UWmg9tb-6yrsTcTvmjvQ9nHhIM79vXk
Message-ID: <CAKL4bV6hBshXXw5ZCMV7XMOehheoEmwJ8XcDceXDwuUq15H1EA@mail.gmail.com>
Subject: Re: [PATCH 6.14 00/21] 6.14.1-rc1 review
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

On Fri, Apr 4, 2025 at 12:29=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.14.1 release.
> There are 21 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Sat, 05 Apr 2025 15:16:11 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.14.1-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-6.14.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h
>

6.14.1-rc1 tested.

Build successfully completed.
Boot successfully completed.
No dmesg regressions.
Video output normal.
Sound output normal.

Lenovo ThinkPad X1 Carbon Gen10(Intel i7-1260P(x86_64) arch linux)

[    0.000000] Linux version 6.14.1-rc1rv-g8dba5209f1d8
(takeshi@ThinkPadX1Gen10J0764) (gcc (GCC) 14.2.1 20250207, GNU ld (GNU
Binutils) 2.44) #1 SMP PREEMPT_DYNAMIC Fri Apr  4 21:24:59 JST 2025

Thanks

Tested-by: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
