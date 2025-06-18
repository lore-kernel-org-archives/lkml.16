Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EDB188006
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 20:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750279076; cv=none; b=tDqjTrOADlKMgKFpISo+vNpySJfI8rZ/ALT1ncc+EKRle5QjAGA0BU6tXO8qnt3tybrTIkeuACp/z9AYsDM4yzVv38sJ9+I40pyhgfGh1tMOvAFW2AA3tym0i6QZEkxaSeDvqeJJYuZPiNJNgRLfHxmNCdmchn6Yz9ZSL7wIGMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750279076; c=relaxed/simple;
	bh=ThWDIJUcnjIcGO2orH+Z275Dtmkr0zasv/AY8MYDvuw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lXoRmPlKac0oDs1Tsi1rTYunrV/YskGRi/dBwpLNmjRTMqG2vpJaVeMvjGFtxe3gmz1I8tp0mW+BiX3F/8u5v9ewKXk4XqYqOahCKFNj0FwFBNbJaFro0f4y2IvqXu/l1t+ZiXKz0Twx7ahfJTakQkSvylmXf688NHHrKC1dlgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZprP57u4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZprP57u4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750279073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zNT9iz5HBFLrbqV+hQa0TNtoL5i74hf59IkxgJEcfQQ=;
	b=ZprP57u4OkuEW2DzjzmbbsWfOVZNCJinoVzbXBhJtUKqXieNXvtayIUvikWFuBNAKT7Brk
	kR2Xl0BJxJA+yOTWc+NV4BVuDZRxODlgUuSsoUZUd5ogPp4JuY0zdFN2TrW2IE4W7uWvY6
	ZRXFdhR/Skj3zON0sNMdgsHC8bTjfKs=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-481-ZM7l28AZMZSX9EpOkT9xBQ-1; Wed, 18 Jun 2025 16:37:46 -0400
X-MC-Unique: ZM7l28AZMZSX9EpOkT9xBQ-1
X-Mimecast-MFC-AGG-ID: ZM7l28AZMZSX9EpOkT9xBQ_1750279065
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-32b6e039023so158441fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 13:37:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750279064; x=1750883864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zNT9iz5HBFLrbqV+hQa0TNtoL5i74hf59IkxgJEcfQQ=;
        b=da3ippcKKuoJPS8bGq/7G51RNslfQqYBIMd1AEL/S4F9OSshCmR0JZxXpgFdzzAaYx
         CWDSVyltz5NmLbNY4ke2Tk9BCGzjyFdOS8GnmsKJBlVmagmRtWbBS0Rb34v2cZxjCiy7
         OpAJxZhpDMUxs6JUPB7kYfSRsf1EpwZwL2DTkjRquBgsTTzYI6LTRlEa+xh67LmY4AsQ
         MDl/ujR2bOa2ylnDo826J50OoPF0s94KkoKdsuaSdFuL8jshpc0e82FhAP3VB8xM2MaH
         WkkNl/TxXP6QkJ/xHBamyd9/USMU9876pUedi2fk4iS4eiVYBwGDf7RZhgt6HnLl2701
         BTjA==
X-Gm-Message-State: AOJu0YzjgY7IJ4z295XTXkBmatNvl4F8UVv58N5CivT7s0cpfq74q4df
	PFlRF4Z54VQlTHwO7jFFso7BKKdKIrxJAih3BI9/deBcBvSJaA9zU+Q/yCNwdlZxb/e/N2bb7cC
	dfox+4V3ZrPk2ylhBQEcukO3cPEN3UGeoLl/hh7oiCE+wUTa8KPD4OAgu2XVMF1aiD8vi8qSSV5
	hGnKJf6aJO65F8GE3/ekm5zDnRCMwXaJREN+t1i/9gpY6nWEn0hao=
X-Gm-Gg: ASbGncv3LDn0uAn/UX9jFlhzxZF/z8I7gjK7vgNVKQNdO21ah3jQp2gkijpFaPkkQiC
	5fu5tIM6fT57gY+iYKqgcsfGO1GlpAcYsllxcI6dXcwxf1EVHx3M3+e2z3/b+0bP6Dv48kYOhEP
	vZR1I=
X-Received: by 2002:a05:651c:2203:b0:32a:7baf:9dcf with SMTP id 38308e7fff4ca-32b4a6855d8mr68118521fa.28.1750279063929;
        Wed, 18 Jun 2025 13:37:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLMY7siBNrdS608WDliBgn2z0Bx62jhstDrNwt5U2Hc2fiN7JQv7xXW+H5SIAw5pAb6GH0czraodQFnWRuqxk=
X-Received: by 2002:a05:651c:2203:b0:32a:7baf:9dcf with SMTP id
 38308e7fff4ca-32b4a6855d8mr68118421fa.28.1750279063448; Wed, 18 Jun 2025
 13:37:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1BDE6C83-889C-4E9A-9F92-C43BC50C529E@gmail.com>
In-Reply-To: <1BDE6C83-889C-4E9A-9F92-C43BC50C529E@gmail.com>
From: Jirka Hladky <jhladky@redhat.com>
Date: Wed, 18 Jun 2025 22:37:31 +0200
X-Gm-Features: AX0GCFsCo3Z6cZxV_o9H_dgZPRIn-xd9iJ-M-3of-K-AlINt7Pbx0tEUL1o1FTg
Message-ID: <CAE4VaGAaPjczTYZh8sG47KmAL361cO6dtzfi+F7mufbj5Q+5ag@mail.gmail.com>
Subject: =?UTF-8?B?UmU6IEtlcm5lbCBwYW5pYyBpbiBfX21pZ3JhdGVfc3dhcF90YXNrKCkg4oCTIG1vcmUgcQ==?=
	=?UTF-8?B?dWVzdGlvbnM=?=
To: Abhigyan ghosh <zscript.team.zs@gmail.com>
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Abhigyan,

thank you for looking into this!

> 1. Were you using Fedora's debug kernels (CONFIG_DEBUG_*, CONFIG_KASAN, e=
tc.), or are these closer to production-style stripped builds?

$grep CONFIG_DEBUG_ kernel-6.16.0-0.rc2.24.eln149.x86_64.config | grep =3Dy
CONFIG_DEBUG_BUGVERBOSE=3Dy
CONFIG_DEBUG_KERNEL=3Dy
CONFIG_DEBUG_MISC=3Dy
CONFIG_DEBUG_INFO=3Dy
CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=3Dy
CONFIG_DEBUG_INFO_COMPRESSED_NONE=3Dy
CONFIG_DEBUG_INFO_BTF=3Dy
CONFIG_DEBUG_INFO_BTF_MODULES=3Dy
CONFIG_DEBUG_SECTION_MISMATCH=3Dy
CONFIG_DEBUG_FS=3Dy
CONFIG_DEBUG_FS_ALLOW_ALL=3Dy
CONFIG_DEBUG_WX=3Dy
CONFIG_DEBUG_MEMORY_INIT=3Dy
CONFIG_DEBUG_SHIRQ=3Dy
CONFIG_DEBUG_LIST=3Dy
CONFIG_DEBUG_BOOT_PARAMS=3Dy
$grep CONFIG_KASAN kernel-6.16.0-0.rc2.24.eln149.x86_64.config
# CONFIG_KASAN is not set

Kernel build is here:
https://koji.fedoraproject.org/koji/buildinfo?buildID=3D2732950

To get kernel config, download
https://kojipkgs.fedoraproject.org//packages/kernel/6.16.0/0.rc2.24.eln149/=
x86_64/kernel-core-6.16.0-0.rc2.24.eln149.x86_64.rpm,
unpack it and check /lib/modules/6.16.0-0.rc2.24.eln149.x86_64/config

> 2. For the crashing systems (especially the EPYC ones), did you observe a=
ny particular NUMA layout or memory pressure signs prior to the crash?

No, not really. The tests are running fully automatically, and I don't
see anything unusual in the logs before the kernel panic. Example:

[58447.906402] Tue Jun 17 23:49:12 CEST 2025 Completed in 23s
[58447.930818] sockfd: 1038050.164394 bogo-ops-per-second-real-time
[58448.473983] runtest.sh (545855): drop_caches: 3
[58448.489326] Tue Jun 17 23:49:12 CEST 2025 Starting test 'mmapmany'
(#27 out of 41), number of threads 24, iteration 2 out of 5
[58473.589610] Tue Jun 17 23:49:38 CEST 2025 Completed in 26s
[58473.613499] mmapmany: 904046.369461 bogo-ops-per-second-real-time
[58474.158233] runtest.sh (545855): drop_caches: 3
[58474.173944] Tue Jun 17 23:49:38 CEST 2025 Starting test 'mmap' (#28
out of 41), number of threads 24, iteration 2 out of 5
[58493.524125] restraintd[1960]: *** Current Time: Tue Jun 17 23:49:59
2025  Localwatchdog at: Thu Jun 19 20:49:00 2025
[-- MARK -- Tue Jun 17 21:50:00 2025]
[58497.412206] Tue Jun 17 23:50:01 CEST 2025 Completed in 23s
[58497.459789] mmap: 196.528701 bogo-ops-per-second-real-time
[58498.003368] runtest.sh (545855): drop_caches: 3
[58498.018847] Tue Jun 17 23:50:02 CEST 2025 Starting test 'fork' (#29
out of 41), number of threads 24, iteration 2 out of 5
[58521.139714] Tue Jun 17 23:50:25 CEST 2025 Completed in 23s
[58521.164051] fork: 34719.527382 bogo-ops-per-second-real-time
[58521.717218] runtest.sh (545855): drop_caches: 3
[58521.732624] Tue Jun 17 23:50:26 CEST 2025 Starting test 'sem' (#30
out of 41), number of threads 24, iteration 2 out of 5
[58544.844994] BUG: kernel NULL pointer dereference, address: 0000000000000=
4c8

> 3. You mentioned repetition often triggered it =E2=80=94 did you happen t=
o try pinning stress-ng using --taskset or restricting cpusets to see if th=
at changes the outcome?
We are not pinning stress-ng. We run approximately 40 different
stress-ng subtests, each lasting 23 seconds and with a varying number
of threads. The entire setup is iterated 5 times to collect reliable
statistics and to determine the noise in the results.

For example, take this test, which leads to a kernel panic:
Starting test 'sem' (#30 out of 41), number of threads 64, iteration 4 out =
of 5

It was running fine 3 times, and only on the 4th iteration, a kernel
panic occurred. This was 16 hours after tests started. Before
Stress_ng, the following tests completed fine on this server:
NAS, Linpack, SPECjbb2005

On other servers, crashes appeared sooner, for example, while running
NAS or SPECjbb2005.

The kernel panic occurs quite rarely, around once in 20 hours. I know
it might not be easy to reproduce this.

Keeping my fingers crossed!
Jirka


On Wed, Jun 18, 2025 at 6:42=E2=80=AFPM Abhigyan ghosh
<zscript.team.zs@gmail.com> wrote:
>
> Hello Jirka!,
>
> Thank you so much for the detailed breakdown =E2=80=94 this helps a lot.
>
> Just a couple of quick follow-ups to better understand the environment:
>
> 1. Were you using Fedora's debug kernels (CONFIG_DEBUG_*, CONFIG_KASAN, e=
tc.), or are these closer to production-style stripped builds?
>
>
> 2. For the crashing systems (especially the EPYC ones), did you observe a=
ny particular NUMA layout or memory pressure signs prior to the crash?
>
>
> 3. You mentioned repetition often triggered it =E2=80=94 did you happen t=
o try pinning stress-ng using --taskset or restricting cpusets to see if th=
at changes the outcome?
>
>
>
> I'll try reproducing locally by looping stress-ng --sem under perf to tra=
ce any irregularities.
>
> Appreciate your time!
>
> Best regards,
> Abhigyan Ghosh
> zscript.team.zs@gmail.com
> zsml.zscript.org
> aghosh
>


--
-Jirka

