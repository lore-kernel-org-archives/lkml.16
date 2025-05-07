Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC86156F3C
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 03:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746586850; cv=none; b=JKF5HZtNnrGT+MFonjZXqUnoJQFwhHMzDCPopOkb/lcgaREpDxyaMlh0kCYaXXJheiPRCwB1UkWC3mZafhlLOxbmFhp+N/YO/YCPn09l5o5phiZz1YdKdMGjxeURHEx0pF+YA9xss0qrek0jkVCu3Hn1eJrZNmPfdCaQCVW7Ujo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746586850; c=relaxed/simple;
	bh=uE60/wLPpi5RSXTHpuVLwf7zEV5Re38wJRpo94mtqyo=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=hpcLuAhnQn/0YSC2oHrUVpc+cI40nT+HE1vwavYDjLducUOzwfUkfUmc81Y15zJYRS9+Ig7EsQ1zS+IOcAWe6sl5mAt+pgBIeMEz6iLrbVyFLCGlmGKoQMD/VKE1jIWQEmLVlU6QV6xnzsO9F3xGzVN8BPAKtxOFtYa/o1sNHqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gGvejne1; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gGvejne1"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-30a8fd40723so1444626a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 20:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746586848; x=1747191648; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R7nqiTmIni6KvwJhq6FCkQ+xSAotgbtUANeN+7C0U3I=;
        b=gGvejne1KRRPSsqbA34zHr1ba8NbhUkJq/JWNVNe4L929ax0faz8r27ooLixkj8rgY
         DGc5N0mdrn58RUlF3XT9z3XkAO5EaMq12hypN50LXiihfTMb8pDllJK3AQbLBMeB06ax
         VA6bhK0+YJBjzd95zzl3Uh2oRA8Yl6cO5l3IhT5iFFQ11Wd5ZbD8inqeaaduj8qlZf+j
         rYnkUmodtocenJpasHdQAIE8nrBlUQHURC19NVZN9XAY4Coc0T3awFU938UFCdUzalwq
         PjNSIqasXs/pyfroumNyqX6e6ktBdAsrCX75bwK3I3vHxtEdbu/vNQbzXvsni1meUP8h
         vB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746586848; x=1747191648;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R7nqiTmIni6KvwJhq6FCkQ+xSAotgbtUANeN+7C0U3I=;
        b=o94kz+5eEeUq2sSl8wXJAKdQ9MBZDNFQ/JvSsv5n0rY/nX03ve5HDoMccuJLJtt6kH
         EmJEM9wi/9+XpoiwBankeOZjQ0jFCdw5ICCuxmqMisJzeyT/Xcm37lBE1GkJHP4Z0w6E
         LtLF7FIgxRzmHT4cBW6ZHW1LWyoC1GEuHYtkjdFTzIZ9ALk02F8JFFy8yoW0Nos4MLc9
         ecirOyNdjiEpf42Bqd5ZpXxUx8usErRPsferpxdKDZf14sF7W0x9qC5Vj808zG5Hlprh
         3f1WUeoZ+Kr/R3LFI7bwKtnY1Mgnxd8F0Yhl+2cbUdMIlBcu7Ww7By1HfipgCASmFGMG
         Bt9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWQcOgOmgI78qSO+tWv6H89+WaREN5k/OmQO/1ZM/MRftcjC2oFVbAeb7Czp7Z/U/rc2T95oYVxAnun/qU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzP+xjPHs4nW2Kmc/ZwMx0Qm00ZXQ4ndEXM7zhR1+RT+0IE8Kpf
	sAPFjFK2M+4UXc2Lm5js7PFpyGC08P3AaVUfQzyLrDpGXGfMe7Kt
X-Gm-Gg: ASbGnctVHCxVhZWiRNKD2BITPXV0Ahb/xODTaC2CpR61TMUveqAvqjqVNtrJRE/tDdb
	jEU8YyeZ8NAf/A8gdkk8k4wf+lLWyp1ko5L65OEqP+HkD/qD+6bCWlaHTf1uL8kpfart/y9+TII
	pYK7MN1L38EHwc8bz7O/+C1KAVmEficUL9MwZnJFBO/KjNDtiTZo8dJWEnCkmFfa8KYyGnaNOqW
	wqQdH/pF8CF+NFxReD9SOUpg1+s/YtQGpAOn41Zc0LBorSXGgo04EoPEzE4C/J5RdeiFyQIe30R
	6yb6xWFOS+CS7Skl6eGcviL3nXTuBg3vQgoPtpvpTYAXHeZHaxE9kycPzg==
X-Google-Smtp-Source: AGHT+IHI0vkS5a4iv5MkTSIpcl61PUH5z2XJqahN4auEkYPwfgfW587WNCREcR44kaSibQ4Uhdwrog==
X-Received: by 2002:a17:90b:3d86:b0:301:c5cb:7b13 with SMTP id 98e67ed59e1d1-30aac184d83mr2518229a91.3.1746586847984;
        Tue, 06 May 2025 20:00:47 -0700 (PDT)
Received: from [192.168.43.144] ([39.144.45.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e66a973e9sm1950065ad.167.2025.05.06.20.00.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 20:00:47 -0700 (PDT)
Message-ID: <9b31f1df-7dc6-468b-9418-0b13239df8bc@gmail.com>
Date: Wed, 7 May 2025 11:00:38 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: mingo@kernel.org
Cc: ardb@kernel.org, arnd@arndb.de, bp@alien8.de, dwmw@amazon.co.uk,
 hpa@zytor.com, linux-kernel@vger.kernel.org, michal.lkml@markovi.net,
 peterz@infradead.org, tglx@linutronix.de, torvalds@linux-foundation.org,
 vkuznets@redhat.com, yamada.masahiro@socionext.com
References: <20250506170924.3513161-14-mingo@kernel.org>
Subject: Re: [PATCH 13/15] x86/kconfig/64: Enable popular scheduler, cgroups
 and namespaces options in the defconfig
Content-Language: en-US
From: Yafang Shao <laoar.shao@gmail.com>
In-Reply-To: <20250506170924.3513161-14-mingo@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Mingo,

 > +CONFIG_VIRT_CPU_ACCOUNTING_GEN=y
 > +CONFIG_IRQ_TIME_ACCOUNTING=y

Enabling CONFIG_IRQ_TIME_ACCOUNTING=y can lead to user-visible 
behavioral changes. For more context, please refer to the related 
discussion here: 
https://lore.kernel.org/all/20241222024734.63894-1-laoar.shao@gmail.com/ .

If we decide to enable it by default, we should clearly document this 
behavior change. Below is the patch I wrote earlier but haven’t sent out 
for review yet.

----

Subject: [PATCH] init/Kconfig: document behavior change when enabling
  IRQ_TIME_ACCOUNTING

After we enabled CONFIG_IRQ_TIME_ACCOUNTING, we noticed that the IRQ
usage is not accounted to the tasks and thus not accounted to the CPU
cgroup neither. This behavior change results in issues [0] in our
production servers and finally we have to revert it.

We'd better clearly document this behavior change in case it might
matter to the user.

Link: 
https://lore.kernel.org/all/20241222024734.63894-1-laoar.shao@gmail.com/ [0]
Suggested-by: "Michal Koutný" <mkoutny@suse.com>
Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
---
  init/Kconfig | 8 ++++++++
  1 file changed, 8 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index a20e6efd3f0f..191df0b5cf1c 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -563,6 +563,14 @@ config IRQ_TIME_ACCOUNTING
        transitions between softirq and hardirq state, so there can be a
        small performance impact.

+      Enabling IRQ_TIME_ACCOUNTING excludes IRQ usage from the CPU usage
+      statistics of individual tasks and, consequently, it is not accounted
+      for in CPU cgroups. As a result, a task's CPU usage will accurately
+      reflect only its user time and system time. IRQ usage is instead
+      attributed at the global level and can be observed in metrics such as
+      /proc/stat or, potentially, at the cgroup level in files like
+      irq.pressure.
+
        If in doubt, say N here.

  config HAVE_SCHED_AVG_IRQ
