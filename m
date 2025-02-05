Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DA722B582
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752718; cv=none; b=pMO7+voz6A3zEASDd5dg0LkhlyYcvoQPTLduzhZHnkIciDwDyn3++IA2BjueAnzHz7PFkbX6dq+r+sh1H3ImWlRe2cpjN5itHjBgRg17BN2EteyoVs2jzItmPkcyWU/LK8q+XM+UScc/oy1mpYhipSuVdyO7GjAJiABe/oHgQGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752718; c=relaxed/simple;
	bh=MkTEZVh9IGEk/2Ry4HKVB2HHbZ4G2gGJp/dNSeFY8xU=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=QLqZLrfd4sb72kHHd+/NxR0hh2SYNEoYTG5D+bNGsMbcj6bf1fJCvxDMmF3PO1xpT0XBigG5EAHHyVoorpww3wq9xFiLU8H95AFRmE5r8MvAjyMsRRbeKBT6u95r9LkZJmwhNnbRc7s7u8XPo85JeeJ8WpsCOuZVSi5GuxJzo0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=frank.scheiner@web.de header.b=M6L5p4X/; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=frank.scheiner@web.de header.b="M6L5p4X/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1738752713; x=1739357513; i=frank.scheiner@web.de;
	bh=u9ut1uKocLMNmxhep4faPZcCPLISfOH/I/gBokh0WnE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=M6L5p4X/SjefSjOFHauEo99GWZOfZ3pgvUbe1iO2EcMEIyknvqxut5nYS7VXp5sK
	 5KWj+p07ZzKSI3gdqLk4FDVlehzYYwYf1b/41hPdn5+ZKO7De+Et4LnHWH2alEPTS
	 KEHggrXjv66htC542pOtaRLvf9f5FYrDzQpd0qTneP8wM+LYefFFjdD8NwzLHuSqQ
	 l5VkRF//cX4fJ2I5CzOIO/rTOZQFgBaYkNF5konrcDVocu5CjcJYpdHDbacWvUO8g
	 DpUBY+buhNObuGAWnBI1XHsSjgVP1N5b3q+IcJGsLEApU5UMflDw0txpNyaXmpVkN
	 95t+ruSgLHUEJp/pNQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.30] ([79.200.217.82]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M59iy-1tgjTJ1Tq0-00EQUP; Wed, 05
 Feb 2025 11:51:53 +0100
Message-ID: <74f9a401-44ca-4d56-83b4-459ac6bca598@web.de>
Date: Wed, 5 Feb 2025 11:51:52 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, =?UTF-8?B?VG9tw6HFoSBHbG96YXI=?=
 <tglozar@gmail.com>
References: <CAHk-=wicYNCkEgH06w0mpR+GJhJ_ywe0BLTTFXBAj1+y0dqe4Q@mail.gmail.com>
Subject: Re: Linux 6.14-rc1
Content-Language: en-US
From: Frank Scheiner <frank.scheiner@web.de>
In-Reply-To: <CAHk-=wicYNCkEgH06w0mpR+GJhJ_ywe0BLTTFXBAj1+y0dqe4Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HpiR+bi3DvuRUxQDsX84LOsOCo4vO9HLwVXXmtHphpfKrKSJk9b
 99I4zK8bgxaVXmdchYxvj5iU2jhBM3GOgy0yRDestDbAtu+b5hvEQ7s5vfuEoYqRPPuTIxO
 eEf+2ZKUccQLC62LJVlA2Es0CyslTbo/At3nmPmXSGG61ErI7lhbjhU8V31nkzx5T48cuTM
 4dMP3pH9AhV4kyKkprEGw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:EObPR/ddCGg=;vx5YpkUpcjJvwwhgPNFx39Ze9q4
 /lOcuK+W+K8NQewFIfWbBScW317DiRdZVI9ssTMqzIzLbjRolpf9aZHyL/982as/lLtIKQHFQ
 AK/hP4x1uj5TzJpPwwpSahBGNt7UFuU3oAIV5DCtQmRkjm4igho6dKl16TBo1hrriLidYInRH
 9HwQR3lfbvdCQRdIztUIcbMpvLiNsG434QvDWo24nmC5E1lfAKZMzJvGBk6PVieNrpWJv7vzd
 dJQBKKB6+4ow9vW4ia+3/N9ldFMY7qRYzsdBXvVAOQvOn39SysAQ6soGRTx++N7PgLRR2g5qt
 ZJ8aRSwH+vR9wfEW6b4PZVibAWL+3XX1qfHQpRNot7u7JcOqYITx9DmQO2stpSBD+FAHPXjtA
 w4F+YVZrFApqV3EmpWbwc/cNo7V7WnN7ivPTbYAB5X2n3sr0bV5B700X7CSiQiMwz7U3kTq9b
 mU0ElGjfsEyKK9rr/kYyhoFOpdVEcNeRzVNyvUnR2IYcYqnXm+FHZkW5o2bZ6aUS8b5KS1uwi
 0cKanIsF6f05ZYaPBt/TaY4NGAXmN5+IfAk8RR1b4XN/8XQWxeDHF+5AWrnY6+3iTYce0Ae2l
 K4UY5MMeaxazAvtw+20QvgsZS/tLBrdD0qhjkW/fuKAVDnVGnQrOrF7qbKCx3XQdw8/pFQ9Tf
 En/1DpT56p1VxnI00cpqsJaBY/eE0VoF7mG+tx0zjKT6OTW/7me112Iq6M9f2BvDHLPw+wyzJ
 xTAAnbi5fwHzHY42eFxFHpQX0hT+y3lVXJxxpybw3FtM1aIPkEmeoi63b1KoQjXu6kFv/qSqM
 LJnd5twmNrpOj3AV4ERYagSW9TNDg2ECecFPkwlcYaLKo39tmc4RiMqCs+7rXgmTcw9CY0oKZ
 QEmeOGJtsCGRW2k4B3wmmCuQDbL4Je2m2t5el7p8m1zLptZnpjRGLo7veZF5oraGoP1WU8OKS
 DcUvhJk9Ofs5WRnHrdfNtg/uuzeLRV4Y6rYrPvhZTSDGsb96wnLiJkOraZkhssFKjfJNrAyzg
 QhcBux9pT1otCCUFE8V0x2d4ksyvTskgYlDaTbDJ4PfpCEAkWeDS3Gi4BwyfCU6Iki5EpsCAB
 L6fXh2cL2wI61a1gblqmDXHjJBqdbk+PNDvqAs38RDBFgWTUyYqtIX2u8w9qmcPSrilT1VGsN
 4xf8ZyaqQUVl9dZi2XeRgm2NMd+D5hgmsunIRiLM5lfmJxkbhfFuA2GeNLkqLVz55oXZXDXNb
 qT3q+OTwaWvidzbe03Kf+f0uqYH8R4ScFCk2XAxZZzM//afCQIHVatZtc6cc4ZizM6tyh88mE
 l1ET13+YnDUii/PFnWenCy4vf5fggTklejR5/DwnWgyt+umuFKydln00EvgcnxLn30Jy8naYe
 XCkO7WN8hF1CVzE0gRD2B1OAGkI3SuXG0f1eBjSsm7y5HyA3pzl9/GaSUee7e8R77yAqp/cQw
 pBdicgV+vVq38YBjQv/ncDSf+J38=

Dear Linus,

> Two weeks have passed, and the merge window is over.
>
> This is actually a _tiny_ merge window, and that's ok.

I can confirm, that this merge window required much less involvement
than the last one. It actually felt a little unreal - compared to last
time - to see our mainline autobuilder succeed that often during a merge
window w/o updating the ia64 patch set.

Let's do it like that more often. (-;

****

So, as can be seen in our logbook ([1]) and kernel table ([2]) - after
making the required adaptations (everything after c15d28e on [3]) -
v6.14-rc1 is running well and there were no regressions observed for the
things that are regularly tested:

* boot to login and small package build in T2 (rx2620, rx2660, rx4640,
  rx6600)

* boot to login and building the "weekly" package updates from Slackware
  for EPIC Slack (rx2800 i2)

* booting in Ski and a `7za` benchmark run (hp-sim)

[1]: http://epic-linux.org/#!testing-effort/log.md#2025-02-03

[2]: http://epic-linux.org/#!testing-effort/tested-kernels-table.md#v6.14-=
rc1

[3]: https://github.com/johnny-mnemonic/linux-ia64/commits/v6.14-rc1-w-ia6=
4/

As "always" the v6.14-rc1 builds happen with the latest GCC snapshot
available and - since binutils had a new release in the meantime -
version 2.44 was also used during the builds w/o observable problems.

****

I'm pretty sure I will regret it, but if time allows I'll try to extend
testing also to on-disk installations during this cycle.

Cheers,
Frank

