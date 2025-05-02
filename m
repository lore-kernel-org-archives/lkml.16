Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE5613D2B2;
	Fri,  2 May 2025 23:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746227278; cv=none; b=dvq7UIIhrw9jbLS+B/Txf0DAVjuf3InCxX7Mbb50KSQbT0+gIXbGtncMW59Nh84cMF95Eu9E4Eau1Z8e7p5jNOlmw/5+cw0yPxk2uGmeYWIHCP2DfBv/ahcKgIbYhe2UDO65NSvUbcwYXRmh3nX232Z9y1XJNIA4ngvOkNfjj8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746227278; c=relaxed/simple;
	bh=tc9yGx3co974bfSGctqpDe0i39FjfOVZTVB2pdr+SUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I1roWXot+AuCYvFPnJumfLxemmhFV0Afvk30odDsHv1zEeYW0b64vzaBLC9g570RCe/tqTwWqUXd2vkt65DJRchueMz6y3tmWNUYdX5MwwDu5jjjKt9y5zLMvsh7lbBllBl5vorCvLeJFYka4QdhZRkWS2SuM0kjuKxp0vNcSgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h2l3QYB3; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h2l3QYB3"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac29fd22163so431599066b.3;
        Fri, 02 May 2025 16:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746227275; x=1746832075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JlP3a+m0IjRiq2W/RVqqbTK+dALgPFu+VpvGEX/jbgQ=;
        b=h2l3QYB3frwMVubLRUoeNU9AIHuH+xCktDY6aI3ahIe7elkvRBE1MTdvdZPhEW+UmV
         SlXJzdCbyQdB0/n0K70v61zhae4vjU99h+q6ivpvVwKEZ7+odzdz/Sy/ajxbXFVZyKkg
         6r4IEoA054F63mWij8eZVVYoAp1UIdl2xw6a5Jr0u91WVfjunsr0MApRgZCHfyKoknNq
         0B1EjhesFfeakBrFlcvN16TbpRsJ8xRBIVOy6asCNErdN9pwkugPf9xvVnjgK3K6EO42
         HXTjOLCOBqiWyumZ59Un457N65P65MnJA7To70gO7LGu61HpDrFfTS09XrXe0ni59iOw
         40+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746227275; x=1746832075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JlP3a+m0IjRiq2W/RVqqbTK+dALgPFu+VpvGEX/jbgQ=;
        b=ZkkZGwDaJX6Bo3SkAOKZDWzGpa3qtYbtLhgkg5bWUBNcl08Ql2Meqz7XfHwecu070W
         hhLGge9dxQsl6FuqPGZ4zkMmcHOl/cQoZZFi5yypz4Ec9j8b5hfsfqX6+wAKDWKAvFLy
         GRcsba4Lqf1ulZM4HjgYDy5m3kATKV0GqNXi9Hgk06lxmYpGpXU+X7j5WWR7Eyw4QjAG
         vmHYxhdaFYNOzbc9szybRwH+VH2i23Ckk/IFDJZ78L045TV/7ZlqhDw90q4Fap06ylqg
         THV+IY7Qgedh4eSbig+1MfWKSt4tKbgKmPitptn32/tZJV1/4Xm0f9+VQALvKwR0vs8L
         sE0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUxFWlXh+xR1pIb6vVmtsdaAgI+k7okFUCYAdzBsBvwLbwv12wuDweqsRzbti6y42A+r5jMTEGtKLIWp85D@vger.kernel.org, AJvYcCVY9yBujUH2Y7jWny3nJ907ggm2SVNrdOkHuRZ0hiMTq+1lsNaiV7+5j68BPoGhgqcEnqU7Zqu4dVCfFg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4zaP2q5czGagHLfk10sA90nex8p4ysa0Uv3zrMW61FH+j5C6K
	YL/Ui2Dxl+3/3F48JFhVbOYO+J7xBT+Dw15dSodr9XczTX/WlKU4
X-Gm-Gg: ASbGncvAw2Zf9egK27rxwNL/VDgJWLh9UHC0mE8MAQZCNLR5AFi7XF+AtuUl2FkSepV
	JlSboO3LpzuI7uBrI9qzY0DWEk4jzrQCt9lvBMoK+gs5qbEYPlZ9K721X3OViXN7Uj20VO6kt53
	gvxQiDxKz+KJjt0HmmUOhh549xO+1tg9EQEpvNTzGv4sQehkEUzbPm/ts5Nik81zdhnDa2oreeT
	/0oW0A5W6+yst0aaJnot77+YjR1N525bcs8zphdWLLZt/GkYK5hi9wOl+MgtJuUIBWK2MmvpqIP
	gtTDV2jQU4rJy0D40lbfSSkkG+5WEC9lVIj8ZOYXrquGhV9fDzbZZbMvxQZI9Vp0EEkSbvQhXwT
	k7y4Oh9xA3YSjAwDL8e3GquFWKzs=
X-Google-Smtp-Source: AGHT+IEC08GZvNS3qsYUWN5Fi7z/6lYEenodZmh1nx70GagMXJlnfUgq8yH4uH6AJx5HS6RcSBDmhQ==
X-Received: by 2002:a17:907:9409:b0:ac7:322c:fd0c with SMTP id a640c23a62f3a-ad17af232a6mr473226366b.40.1746227274764;
        Fri, 02 May 2025 16:07:54 -0700 (PDT)
Received: from localhost.localdomain (host-82-56-126-113.retail.telecomitalia.it. [82.56.126.113])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa7781b1d2sm1793112a12.39.2025.05.02.16.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 16:07:54 -0700 (PDT)
From: carlon.luca@gmail.com
To: linux@roeck-us.net
Cc: jdelvare@suse.com,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lucas.demarchi@intel.com
Subject: Re: Suspend/resume failing due to SPD5118
Date: Sat,  3 May 2025 01:07:53 +0200
Message-ID: <20250502230753.616322-1-carlon.luca@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <92a841f0-ab20-4243-9d95-54205790d616@roeck-us.net>
References: <92a841f0-ab20-4243-9d95-54205790d616@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> The timeout is observed when the resume code tries to write data back to the
> spd5118 chip. It originates from the i2c controller driver, not from the spd5118
> driver. I have no idea why the i2c controller would time out in this situation.
> Presumably it should have been brought out of suspend by the time devices connected
> to it are re-enabled, but I don't see any associated message in the log.
> 
> I know that others have tested suspend/resume support with the driver and confirmed
> that it works. It might help to enable debugging of the i2c controller driver if that
> is possible. Other than that I have no idea what might cause this problem or how to
> track it down.

Hi,

I recently bought a new machine, and trying to hibernate results in these messages
from the kernel:

[  195.176483] PM: hibernation: hibernation entry
[  195.200054] Filesystems sync: 0.005 seconds
[  195.200760] Freezing user space processes
[  195.203723] Freezing user space processes completed (elapsed 0.002 seconds)
[  195.203732] OOM killer disabled.
[  195.204506] PM: hibernation: Marking nosave pages: [mem 0x00000000-0x00000fff]
[  195.204512] PM: hibernation: Marking nosave pages: [mem 0x0009f000-0x000fffff]
[  195.204517] PM: hibernation: Marking nosave pages: [mem 0x4ee2f000-0x524fefff]
[  195.204924] PM: hibernation: Marking nosave pages: [mem 0x8b93b000-0x8bb7bfff]
[  195.204941] PM: hibernation: Marking nosave pages: [mem 0x8eedd000-0x8eeddfff]
[  195.204943] PM: hibernation: Marking nosave pages: [mem 0x92fe3000-0x92fe3fff]
[  195.204945] PM: hibernation: Marking nosave pages: [mem 0x944ff000-0x97ffefff]
[  195.205340] PM: hibernation: Marking nosave pages: [mem 0x98000000-0xffffffff]
[  195.210276] PM: hibernation: Basic memory bitmaps created
[  195.212709] PM: hibernation: Preallocating image memory
[  196.875538] PM: hibernation: Allocated 1013859 pages for snapshot
[  196.875544] PM: hibernation: Allocated 4055436 kbytes in 1.66 seconds (2443.03 MB/s)
[  196.875547] Freezing remaining freezable tasks
[  196.876843] Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
[  197.559071] printk: Suspending console(s) (use no_console_suspend to debug)
[  197.771716] spd5118 1-0051: PM: dpm_run_callback(): spd5118_suspend [spd5118] returns -110
[  197.771734] spd5118 1-0051: PM: failed to freeze async: error -110
[  197.979717] spd5118 1-0050: PM: dpm_run_callback(): spd5118_suspend [spd5118] returns -110
[  197.979739] spd5118 1-0050: PM: failed to freeze async: error -110
[  199.028103] PM: hibernation: Basic memory bitmaps freed
[  199.028080] mei_pxp i915.mei-gsc.768-fbf6fcf1-96cf-4e2e-a6a6-1bab8cbe36b1: bound 0000:03:00.0 (ops i915_pxp_tee_component_ops [i915])
[  199.029101] OOM killer enabled.
[  199.029104] Restarting tasks ... done.
[  199.088935] efivarfs: resyncing variable state
[  199.326219] PM: hibernation: hibernation exit

the operation aborts and I cannot hibernate the machine. I fixed the problem by
blacklisting the driver spd5118.

I see that the reported problem was in the resume operation, mine is in the suspend
operation, so I'm not sure if this is related and if the logs can help.

My kernel version is 6.14.4-arch1-1.

Regards.

Luca Carlon
