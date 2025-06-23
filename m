Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848552D4B68
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 20:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750711341; cv=none; b=TUYNATW8DMXbDCOqtRzuDhOUQRAjAMapk9pnxeMOelsh7thi0Y//PHYbqmwzjR42qPXsd7VTZ0fkGm1OEDe/SQRP8W3U7BVm6VGr/nXHVEeHy8g04jU1UyRvApYv4w8GQotBNbsft6oH4KDu15TRIW8KOXyFbZ7Qp18BUGgXKdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750711341; c=relaxed/simple;
	bh=Wmo/ZDyQ4ImKtrJP3QIyntQ5jCXk1PtVU098o5eDPqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YyhRWiTnjw+7Z3fvZuyoUHRfY3z/ZViDFcy/BUZUUGrasuiW4ZdMgzl+jMpZBGJK4CqcrfgEg/Bm/sx+vjsyhPpSNRS2OJPlvuWM0xSIZeBpFGXb5FYEtak4hunuQ57E+5ioPAwHHQXHepGe9xg+PGD+vq3vHWvk669wlIIqdFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hr6g/a/6; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hr6g/a/6"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-234f17910d8so41582675ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 13:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750711339; x=1751316139; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R1GMvmqx8uhrSae96cG9GRQgWxsC+nfXg2Ck3Wi+fO4=;
        b=hr6g/a/6Hz5cKvTnaYKuQvhItXW4utN6cIrjBV0s6IgKbXaxMfvRdPg9amqKsSuDnR
         E56gA8qO9Obvda04CZRtRVAAzkwFm83y08SsyjNPlkS9BGKeguDakYhs0r4+uXhRh/Fo
         63XUiCWBc7F3vrrvh59QMa2YJ5wYzqtgy375TelOD0An5kTv4T+Rl22JZWZnmnAnDwbX
         rsaIWVk5ZzvSJC9rYkxd1WaSBhJj1iUcF3OvdG9JcklKyst1Aq+fufSL6dyZoP43lqCK
         290h570Hkcj7RIBsEgwegyJRj8EC6OWAD401tlal4amSwKOe63JQ7UrHrwjMbUVnF21D
         3vgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750711339; x=1751316139;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R1GMvmqx8uhrSae96cG9GRQgWxsC+nfXg2Ck3Wi+fO4=;
        b=LXs9ywhgaXP7AunQreAz/GhtFZLtWv3pHTaNIbrkIMzFQBXvJWfZFXl86LQqUSa9qu
         8VWRT7vGZZBfBNDDwBBVBpLPaUG5vP9bTi4qi38OgYhgb+D2JTemJil6D4aXHsPJucOU
         +j+96Btt46Nr424f6zogxjHGugy+/b/Ypd3bQDEJjHwKe7liT9Un9h5NXL1C5DrHYlZl
         g3nSaluXGfBxHgH1Yb3iuKHHiIjafH7l7q12qapkaH5DOwfZbuo+zmhrnxmB7TmR+no4
         6aKLmxSha44kHML0gGB0UbC948RhLPIpv0HyvmV+PU332XyFy8B623vV4FlIKTez/Q+N
         F1og==
X-Forwarded-Encrypted: i=1; AJvYcCWSbFLRwoPxc/ohmLCF0xGXaCEyq2gFF5hSueVSL9i8dSjsliA25jgVCEINp/ul7f8h/j0CTVPBDemF/L8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1nD2ETt+J7DSsLQTnDkx8fM/gwgKSBCFlNo7ALB0etFnlNS4S
	tVf10Nvm1ASDncPp3TfrH98Ce25kurAvHgqGBgRxsiSUvDb0a0J4q3Wq4c1tZAOg5kd8mHI4uhX
	jlHwUsZ1MLc4WSQc6QGeQoF8W5pX0mROQNlaWBNodQLjKdluW81bTeXHwag==
X-Gm-Gg: ASbGncs/n+4YDYFopPXsKtn6YWZ/7VYj+5tTVLMG9Q48Qn7Hz2qZDHHnYGXIUfPLMA+
	oMGaNzz0d90+Hz0hpudRR9V+Ol29RwATEAsilfWhuBvgdHwfjaagwfhr4gqldOwapeKZtUDsUDg
	3EPeagC98f2N3jdyxgABKlJl0EEK4Czl3w0qyn7vfHV/Qt/3SvTAQZS81nnaTnwy+DgRBob0+3F
	hlx
X-Google-Smtp-Source: AGHT+IFldOr82kECNHRGpbqAwkSHs/i+CSLaKvpxnRfW9bQfBnUjG7vDZLwfLs8m8yr8Dg3Wptvso52CY6mHfjG5K6E=
X-Received: by 2002:a17:90b:3bc5:b0:312:25dd:1c86 with SMTP id
 98e67ed59e1d1-3159d8cf587mr24603693a91.18.1750711338873; Mon, 23 Jun 2025
 13:42:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623130632.993849527@linuxfoundation.org>
In-Reply-To: <20250623130632.993849527@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 24 Jun 2025 02:12:05 +0530
X-Gm-Features: Ac12FXxCahOKxqInrOQt0BqXjl0ygzYTl3HNC4qxXj17qIpUny0WkUR4sQ_jwKU
Message-ID: <CA+G9fYuU5uSG1MKdYPoaC6O=-w5z6BtLtwd=+QBzrtZ1uQ8VXg@mail.gmail.com>
Subject: Re: [PATCH 5.15 000/411] 5.15.186-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, 
	broonie@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>, 
	"James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Jun 2025 at 18:39, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 5.15.186 release.
> There are 411 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Wed, 25 Jun 2025 13:05:51 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.15.186-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.15.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Regressions on arm64 allyesconfig builds with gcc-12 and clang failed on
the Linux stable-rc 5.15.186-rc1.

Regressions found on arm64
* arm64, build
  - gcc-12-allyesconfig

Regression Analysis:
 - New regression? Yes
 - Reproducibility? Yes

Build regression: stable-rc 5.15.186-rc1 arm64
drivers/scsi/qedf/qedf_main.c:702:9: error: positional initialization
of field in 'struct' declared with 'designated_init' attribute

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build errors
drivers/scsi/qedf/qedf_main.c:702:9: error: positional initialization
of field in 'struct' declared with 'designated_init' attribute
[-Werror=designated-init]
  702 |         {
      |         ^
drivers/scsi/qedf/qedf_main.c:702:9: note: (near initialization for
'qedf_cb_ops')
cc1: all warnings being treated as errors

## Source
* Kernel version: 5.15.186-rc1
* Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
* Git sha: cab9785699236a7505c3f740e006a05ae70f47b0
* Git describe: v5.15.185-412-gcab978569923
* Project details:
https://regressions.linaro.org/lkft/linux-stable-rc-linux-5.15.y/v5.15.185-412-gcab978569923/
* Architectures: arm64
* Toolchains: gcc-12
* Kconfigs: allyesconfig

## Build arm64
* Build log: https://qa-reports.linaro.org/api/testruns/28835767/log_file/
* Build details:
https://regressions.linaro.org/lkft/linux-stable-rc-linux-5.15.y/v5.15.185-412-gcab978569923/build/gcc-12-allyesconfig/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2yuYENOCa5bRAG0bKRLJc7p69cI/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2yuYENOCa5bRAG0bKRLJc7p69cI/config

## Steps to reproduce
 - tuxmake --runtime podman --target-arch arm64 --toolchain gcc-12
--kconfig allyesconfig


--
Linaro LKFT
https://lkft.linaro.org
