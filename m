Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739F52063C6
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744041323; cv=none; b=sMG/+Ulud8LMZPI8WP9ZRIHrTk4kLXarCUcyIORvYV+bhPckvnOhmIcsbCdspUUIhwctbbICG2GO6duQqwuPI/Tlsni4TluS2qZ0jqKKKqyoEOxv5csKNS8Yn3kct0X2zilWNtfXM5VhBKzqAbnti4MTLxrDj3an/Bfl0BaN3tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744041323; c=relaxed/simple;
	bh=n2l+6nIEXi3Mcxdoc6f/pXUNnEXyFPXIw8vJUK3a0jc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oC1Z3zu1+pFelK3VAATAQmp66Ao4h753/z26I1puBbryHCHNVCHjx/UAl4FyeXgQjIuSi7s2ap8+YtPT6HNaPwlZbD7SxkZHtneQiE9UKL7xxwqXt4g8Avg6YiEtkNCTtVhmwA/fFlxtbInRIRmqxZOo76d+CWheZtYThzmNBbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=cTtaNAsz; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="cTtaNAsz"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e5dce099f4so5891729a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 08:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1744041319; x=1744646119; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OmhmIjtz1wfrr9ysE2tsdq/HsdFp6irtiATNF30bh3M=;
        b=cTtaNAszSBasEEz6DAB03S+MSAY4MjUJ1qdg8RyPrXmQ7lF4z6OaI5YLVFkijCAs0d
         EKdyB5Hv6vatHFKVp8XWo1xfoOhhrlUgXBwKuQlsno8awDl8fOs8XmahXA2JtOaTIqKL
         guRpnMldbRxHyPVEovVGoh5v0oMLsRd7Bsmfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744041319; x=1744646119;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OmhmIjtz1wfrr9ysE2tsdq/HsdFp6irtiATNF30bh3M=;
        b=aCDBLNq1DV2VGz9BylJiMM4alyoioMi9Rw2AFPH3ePkKHcgCqqIzukEDRDAbMh3o6s
         pcVodFuq00guElIbWXe3z1qHDIraJTffy03jhist3J5GxAudVR2N4K/wy/9riwNJCh4b
         QwFYTfabRWsUgHKkj0VhFZhvjV4inQhCg2zzcC/jExACMZfnTa2wEeZ3yfIkX0zzov2+
         0mpHmv3tldcDNnHJ0Z0U0ekWdHuFAY6fz4QQHl4sQN0Hv6hKQbsAWp9g2IyhqMpSb0aJ
         aRzqAuOZmqrblcW6e7NOspKzdo1oW6JB1rx+WYsbSacvO1zPCiejWgourJ6ex/leoZzb
         B/ng==
X-Gm-Message-State: AOJu0YyT3KIY8Kxe4gdzZEnsf35QoPUsPdahIe8xcqMfOcCOp/8RpC0E
	YaoEcT+05v1KmYK5WnvVm1FNzFCIznHdhmAMhVyev2umbRYYEM+RhBDBnUGkTs8THBuNJNE6v32
	A0zQ=
X-Gm-Gg: ASbGncvCc5vdLDNnDjmZ0jSzxZ1vx2tCMqOR325erfi9ZKf9lwgoBk/6D4SYR84cNx4
	L8Abzv5Ha8ABwrBzPrC3jj8IYPSUpiseCXyHaxsU/ieNh+lsnSqr0hoIo20s7lzHnvCTTs1Tmnl
	Wci61sFFa3361jBx/WVQw/4Nw0JnkZZ+Jn4UfAlLbXLTM4+kfza2cmVwXkP1yDeOr/Zq+/Z4BmK
	GI/IvvF/gYm6XE6fxCKMRJrprubw+9v45D6yDJ0unNJ0AeHPBfNcLWyG1MiJVsPXxzWjgL5ZYtC
	gzYRF0JaMZd4D9o20ObjPl2LO+iNfpIEXfwqD9XGn2zMrdisFTZMp7Cb5RCgRDyuzZ1vWxz8qDW
	FrR1t45qdF+hfBPm6XPo=
X-Google-Smtp-Source: AGHT+IEwcX0wNQ2bNOpiQuTnjeFRNlrbJaN6+ZNBdPi2T4pYKTYojng5s0MzQme1TiKSqwHqj02rWQ==
X-Received: by 2002:a05:6402:34d4:b0:5e7:f707:d7c4 with SMTP id 4fb4d7f45d1cf-5f0b66315b8mr10887305a12.31.1744041319359;
        Mon, 07 Apr 2025 08:55:19 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a4027sm6959736a12.73.2025.04.07.08.55.18
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 08:55:18 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac25520a289so795407466b.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 08:55:18 -0700 (PDT)
X-Received: by 2002:a17:906:3e4c:b0:ac7:ee4c:f4c2 with SMTP id
 a640c23a62f3a-ac7ee4cf50cmr678492266b.40.1744041318062; Mon, 07 Apr 2025
 08:55:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHk-=wgv_rS5dT8QY7Yh3V5UGup4BLHYToXNKWoH3C9+3YhY9w@mail.gmail.com>
 <75ec6d07-24f3-47b1-9632-ff53ef12c1ab@roeck-us.net>
In-Reply-To: <75ec6d07-24f3-47b1-9632-ff53ef12c1ab@roeck-us.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 7 Apr 2025 08:55:01 -0700
X-Gmail-Original-Message-ID: <CAHk-=whwuVsXiCV30yU-Jk-PDJBozdKRu=XDuocHtq5rbyaLxQ@mail.gmail.com>
X-Gm-Features: ATxdqUEIJEgiwJRrA2LMD1J4zrBWLRk76-hCWOk_8PV32a_tI2_27bTKgboqhlg
Message-ID: <CAHk-=whwuVsXiCV30yU-Jk-PDJBozdKRu=XDuocHtq5rbyaLxQ@mail.gmail.com>
Subject: Re: Linux 6.15-rc1
To: Guenter Roeck <linux@roeck-us.net>, Miri Korenblit <miriam.rachel.korenblit@intel.com>, 
	Johannes Berg <johannes.berg@intel.com>, Oak Zeng <oak.zeng@intel.com>, 
	Matthew Brost <matthew.brost@intel.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "the arch/x86 maintainers" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Apr 2025 at 08:14, Guenter Roeck <linux@roeck-us.net> wrote:
>
> Build failures:
>
> In file included from drivers/net/wireless/intel/iwlwifi/mld/tests/utils.c:18:
> drivers/net/wireless/intel/iwlwifi/mld/tests/../iface.h:169:5: warning: "CONFIG_PM_SLEEP" is not defined, evaluates to 0 [-Wundef]
>   169 | #if CONFIG_PM_SLEEP
> [...]
> Triggered by commit d1e879ec600f9 ("wifi: iwlwifi: add iwlmld sub-driver").
> The code was not build tested with CONFIG_PM disabled.

Ok, should be trivial to fix, let's get the guilty parties involved..

> Building x86_64:allyesconfig ... failed
> --------------
> Error log:
> x86_64-linux-ld: kernel image bigger than KERNEL_IMAGE_SIZE
>
> No idea what to do here. Increase KERNEL_IMAGE_SIZE ? Disable some options ?

Hmm. It's a fairly random #define, and I suspect we could just
increase it for COMPILE_TEST.

allyesconfig is kind of useless, but it does occasionally find the
"same name used in different modules" case and other random things,
and disabling options seems overly complicated for this odd case.

Adding x86 people to see if there are preferences.

> Building xtensa:allmodconfig ... failed
>
> ERROR: modpost: "__divdi3" [drivers/gpu/drm/xe/xe.ko] undefined!
> ERROR: modpost: "__udivdi3" [drivers/gpu/drm/xe/xe.ko] undefined!
>
> Commit 9c44fd5f6e8a ("drm/xe: Add migrate layer functions for SVM support")
> didn't watch out for 64-bit divide operations.

Hmm. Why didn't that show up on x86-32? Or maybe it did and you're
just quoting the xtensa case.

Adding Oak and Matthew.

I assume it's the DIV_ROUND_UP(entries, 0x1ff) thing.

Considering that that pte_update_cmd_size() returns an explicitly
32-bit number with

        num_dword += entries * 2;
        return num_dword;

it's kind of silly for 'entries' to be calculated in 64 bits. It does
look like it should just use div_u64().

> Building xtensa:de212:kc705-nommu:nommu_kc705_defconfig ... failed
> ------------
> Error log:
> kernel/trace/trace.o:(.init.literal+0x250): undefined reference to `get_vm_area'

I see that Steven already saw this one.

             Linus
