Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20BF2ED174
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 16:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750264922; cv=none; b=qlnji4RxKmSHWUgXwrGt84qnOdnoHBXMmLgLPrSWYk1h7sebMv5AxVi+wqzd+Ah4xNSRDExvhImJI/z3h/bblwCLlWPhPnUs6ohugzhm7vkPhktT9kuXPhjjHudliaAk88E76llgsX/dY7EMmjgk1UF3ojQxVkt+kdJtXC2gFlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750264922; c=relaxed/simple;
	bh=9ar73Z3jHH/JbNUfAp3BvT3RPPib8zYZA6x6Icf47a8=;
	h=Date:From:To:CC:Subject:Message-ID:MIME-Version:Content-Type; b=t8i2u8E+X9MwItFy6ldSt7OzzL5jEiSFLCnjUyoXYnftDOEZi85Lge49f0TATUugOCEyj4MAYjQYBOotTgyEO7u6idJDVhECu4ukoLYFGBuSOnCpJ7dI7ZcS1DDmVUxxGg5KLGzODpemHqp/JjiP4fxK75l1qGu1XkozWPGoIck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=exsyZMyG; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="exsyZMyG"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-234b440afa7so72360885ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750264919; x=1750869719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:user-agent
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9ar73Z3jHH/JbNUfAp3BvT3RPPib8zYZA6x6Icf47a8=;
        b=exsyZMyGagkGEUG9VaLrAxfYAKfSsXty4b4o0sKm1yRlX4Nc3lh6S/bf7VaKI+DWXu
         AfTrh5BljY4Oka+VJ9vl9OKOCN/5rvWJv5ylu+8jWBewT1rOB5lvHpENac75F/z7GU03
         dOJ3jPsOGOp8dGJb5d3x8UgqQh2k285guDrgSJiFc+rK4SXKcyFRnXp7aSnw4b3aD8AE
         LDPl5X0CVpC32mapJkozQpnRDiRBDcp5JHUZbxvvVJ/pJOAWmiHGAvgGE2VgwZ3NjHyQ
         dgQ57GziP0bkqjLfbxNY4LIjGg3TueD3JUOL4yAWPwB2T7PbBkKI0pQKR4fgv4eKp4DJ
         etzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750264919; x=1750869719;
        h=content-transfer-encoding:mime-version:message-id:user-agent
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ar73Z3jHH/JbNUfAp3BvT3RPPib8zYZA6x6Icf47a8=;
        b=f3EeLHeA56wXgqHuqWzVz9aHHabNVz8In0OIpHUkcPrYlYOxnsRGm3Bt50+SKKWaKF
         HwGfBHwQkJTW/uSapih3LdlZ+PR6kNAe63muYBZzbemi1ta0/wjhdPYg1gRmp49+Zg1E
         OLQXjpIERAaVSVY+7rHZkXwMB+9HMFECCgssUsXhpRwxZj0b3oMbxSDEr7SadNmgazKY
         5bUDJnhkKPF8Iv/GPXmzIdy8RDzsqDjqoyFbx8ooCpXGA6nrgW8jno1s3xBP+DBjSZ7h
         /llvZ2Kz1JZFrpvLIF0c81jYDsvWZyzeabv1QK0MVAD+7ZYcdD68RIQosIk7Wu3zL2lI
         3QhA==
X-Gm-Message-State: AOJu0Yy5yZKrqBksaR9KAahsTbkVBUonuis8Gys1ed/eHiT6YB5UtJNz
	ABADwcXJSQ3RMV9/Bfer1+tR1UHgOV7MnRrILs9pwEgOSX2TblkkxnzG
X-Gm-Gg: ASbGncsVWTdcWdP4IOxsf2fq1+S9giM8EAxvGByfIJTFzzMVBmcYJ6QPZWBR+iL0tt8
	C8Q8dYcxfwRH1DsbznFyEVDavNpwGMurFQDbPal8+sV7u2R8pZy1pENvY4z0kerqYS9iFKBuR0w
	pQ9leZY90q/AN7XyV9gLxOGc16RyPFa0t+L5yG42DXU/r01OsYtYgVMoG7bjgtHPBmaS5AQ62UA
	/9rmiFA7yiwbFEgeDoqxlvU+Jw9qulS6qW7qh3Jn9Nm9mDmGnmKwLqlF00KJdAb4di0ci6jCRO1
	ENq/MImEqVpgwecuKuBjaZkZy/5LHy1x8cdBGR/iKzNA+BpV1STyng7hrk0BYlN9b0UaBA==
X-Google-Smtp-Source: AGHT+IHis5pu1jOUF7C0qslSDUaj2cgVk/0uyRPc+GS73ngWrIgK9bmHsioneKAv0yzMGpAf4kgetw==
X-Received: by 2002:a17:902:760f:b0:236:6f5f:cac1 with SMTP id d9443c01a7336-2366f5fcea1mr177896335ad.46.1750264919132;
        Wed, 18 Jun 2025 09:41:59 -0700 (PDT)
Received: from ?IPv6:::1? ([2405:201:900e:b1b1:6ccd:69c:d66e:a02d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de78570sm102562095ad.90.2025.06.18.09.41.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 09:41:58 -0700 (PDT)
Date: Wed, 18 Jun 2025 22:11:56 +0530
From: Abhigyan ghosh <zscript.team.zs@gmail.com>
To: jhladky@redhat.com
CC: linux-kernel@vger.kernel.org
Subject: =?UTF-8?Q?Re=3A_Kernel_panic_in_=5F=5Fmigrate?=
 =?UTF-8?Q?=5Fswap=5Ftask=28=29_=E2=80=93_more_questions?=
User-Agent: K-9 Mail for Android
Message-ID: <1BDE6C83-889C-4E9A-9F92-C43BC50C529E@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Jirka!,

Thank you so much for the detailed breakdown =E2=80=94 this helps a lot=2E

Just a couple of quick follow-ups to better understand the environment:

1=2E Were you using Fedora's debug kernels (CONFIG_DEBUG_*, CONFIG_KASAN, =
etc=2E), or are these closer to production-style stripped builds?


2=2E For the crashing systems (especially the EPYC ones), did you observe =
any particular NUMA layout or memory pressure signs prior to the crash?


3=2E You mentioned repetition often triggered it =E2=80=94 did you happen =
to try pinning stress-ng using --taskset or restricting cpusets to see if t=
hat changes the outcome?



I'll try reproducing locally by looping stress-ng --sem under perf to trac=
e any irregularities=2E

Appreciate your time!

Best regards,
Abhigyan Ghosh
zscript=2Eteam=2Ezs@gmail=2Ecom
zsml=2Ezscript=2Eorg
aghosh
