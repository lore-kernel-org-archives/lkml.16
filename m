Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FBD286439
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 12:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747140647; cv=none; b=Hj8hcNZmF20b4swIYJbXbmrOdr5omScGU2omMHcpHU1MZNMYjlAqgD63ggN9SS8YwYiRl6hqj2mwxsmEIUSpv4naEC063aIlCBAuYorYZVETnC4u/Aw/Nd8mTG/48FCnse1fdIb4WwWO5vWOZXV0/hSKM2PSWBbcF259fT+4jp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747140647; c=relaxed/simple;
	bh=cbkNHpfCazDp/U2uIDhXT83+u8gzdMCgbpu2J3wJRIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RnmNBLrL9wUekZlcaoq8OzhDZ0Q97uXyGiV0fpJJDrpbVPj0dZrI3sWO095huz9DRcS489UC1LJ8tQFCT/E7Rs64pIilR7uJFkBLVFkrodM00hWJH2HUtUDYzqKk3k6ajZFxhpVGyoJxVtCOdq8Rh1MqTShEaGydTWnVw1Htmqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ciq.com; spf=pass smtp.mailfrom=ciq.com; dkim=pass (2048-bit key) header.d=ciq.com header.i=@ciq.com header.b=RVC0RZrL; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ciq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ciq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ciq.com header.i=@ciq.com header.b="RVC0RZrL"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7cd0a7b672bso240258685a.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 05:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ciq.com; s=s1; t=1747140645; x=1747745445; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6fIGxDjB0SYqfDID/zzJ+9sqlaZDZdlnVxHTIBP3fm0=;
        b=RVC0RZrLA1j+1rc988RYMB/BOKcSbM8vAQoatix8JXJWQs0bdnqNIVfKal35JJGCFW
         Idq5tAAoATfdmFD+LYT86DLzlhvXfb3iyXRvyQTGuaUS2PX8oZwmTAe5mXzLIi2aYmQK
         w64BoibqR717T0w/e3av+r4vGiA+8ot1H/20JfNp/4tQsVoPq1/67NEeZkG6WV1GvYjc
         z3mYlUnRHw5SBg770sbO4PjfJgVGIeuzQeS0nYXQ0OvA8pHbPzapd9MKUH8fJLdvBvCw
         b+6H8SWuLgbuvOAnDMLGkTh8kv8meb9uAWxsj0zn9mcqNQJ9+CC39daOZDLyIcAqcvUS
         df6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747140645; x=1747745445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6fIGxDjB0SYqfDID/zzJ+9sqlaZDZdlnVxHTIBP3fm0=;
        b=Vr652vMQORpwTgM1WHCsw+gQM+Bi786KSB9HtC6ftEA4SGjmpeGsoihHvX+8PtjgtN
         Nd5cTv8/bvHr7s/2cD0pbEC13HwaX7XH4hTpBWxn9r5/8Xk2NWNmp4Ne2r4vGT7beUNz
         XWMjiEBiSxZAo4v+4BooTfSa9NG79jB596sbGJfEE06LbDEL6yZIxEQPg2EyVsX2XGzI
         DljkSJsNRHUMlRbcuIPin0AgFKp7pCS5W9GMmCfhkzwQH0N3A1H+LxQanTIirwH0fIJq
         6MkcLxQFqAf8m1xcQ2g/EmW3kp4eNRqK2IuoNb47qh5a4GlW2gG/NFfIqeWsb9ptncj+
         BucQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2wB7spFIOPfka8Bv+/qO46eJ9UPX/Uo55xgJTQTJiBel7qptxWEDT/9k3jDPP/D8ybblttDXk6AdbmqI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmvPbPeIsrdZiTrFuiHN07wcvmjmAGEV7ojYQOO8puX3t02Kv0
	tnntvLu7JniV5uMchC7mRd7JdyRqIFQAVPZL1LV7P/46T/6mFL8fw326ocs+pMlt6AOiUftkQaf
	7LnjNdjKz/2hC5zMOoja7v5KqawAmL4kTqNhE+A==
X-Gm-Gg: ASbGncs+fnnl8En45tSfWe5XThmL0GBGfYSEZ9C0TCeGtm9Pl3DlKZIIH8hN6d8hK3g
	DgI60orv+SFUQnv+dZj+7p2TX7B1oNDfs/0gKbklzmHzvBqD5UVq0JPfa6e7VRBnVfBcHlKdmiR
	U401nUj5xpAJ76+/xveLzyk6bzIITSM/OY
X-Google-Smtp-Source: AGHT+IHBEdsF6gSFx1qwBk8MOhT+FX89ZCga3+pTyELVVHANhV/m9TZ/cnRgBn5szaUnkrhaLYyUlGiH0Cn/NnATxfw=
X-Received: by 2002:a05:620a:4403:b0:7cd:92:9f48 with SMTP id
 af79cd13be357-7cd0114f73dmr2851585985a.52.1747140644988; Tue, 13 May 2025
 05:50:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512172041.624042835@linuxfoundation.org>
In-Reply-To: <20250512172041.624042835@linuxfoundation.org>
From: Brett Mastbergen <bmastbergen@ciq.com>
Date: Tue, 13 May 2025 08:50:34 -0400
X-Gm-Features: AX0GCFujP5y8odal_JrTQezDnw3_S4uS2-SeBQTOZ8FQ5LfW4rl2-L89_wnvi1c
Message-ID: <CAOBMUvgh215jYs+YzZ6+MxM3VNGL1_ZQ-yx9k9Fjn7NxSdbXCA@mail.gmail.com>
Subject: Re: [PATCH 6.12 000/184] 6.12.29-rc1 review
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

On Mon, May 12, 2025 at 1:58=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.12.29 release.
> There are 184 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Wed, 14 May 2025 17:19:58 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.12.29-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-6.12.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Builds successfully.  Boots and works on qemu and Dell XPS 15 9520 w/
Intel Core i7-12600H

Tested-by: Brett Mastbergen <bmastbergen@ciq.com>

Thanks,
Brett
