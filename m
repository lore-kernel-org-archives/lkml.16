Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com [209.85.219.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E3917996
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 09:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747213860; cv=none; b=cYhPTIHwKO9ORDP3hls0+dhd4szZrQFmYUp1s8pxKPnqlYmbmDxUyv1Rm2OoM32hLUXMoJjLc9Hwf7QpQ+xd0vha/nYOGIokLMNhzzDQVAjsaNp60mDIaE51fr/rH/I0UZMbmbgyeSsYUbVklRu2z8q5oaKH1qnKAj6iesgTsIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747213860; c=relaxed/simple;
	bh=CM5grMBdlFWIvR/uTVEife3NYvwwqAT5OSYd5XdA+2c=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=VjQL+7NCwGmQOq8/5HGWy0FWnuEzA/uZxOeSAIkPu1eB8S6YzqCV718M5YL3Umrh7eUBdP6ISXsr1VLmhspV2d38Qx2N5ZyokTz0QvoSHwugzDFlXaHGB0rmRV3XtaXZshe1eOgkWSg8Z1xmEKZVhImDD4XPgrmwXwqb1Wl/FJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ANyXtnHW; arc=none smtp.client-ip=209.85.219.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ANyXtnHW"
Received: by mail-yb1-f196.google.com with SMTP id 3f1490d57ef6-e7adcaea616so2598306276.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 02:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747213857; x=1747818657; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CM5grMBdlFWIvR/uTVEife3NYvwwqAT5OSYd5XdA+2c=;
        b=ANyXtnHW0N/GEEgBiqCUGzMD+6P6FTTDVz54Gw6sHHurVPf7k5UQNvmd6t6ulNrvl4
         3QY4Mwr/VB1rDQX5ItPIPqkE+m73nM1KRyYw7iTMGXB0SOganhrDbPTeJPAkbMrpIbn1
         ZwLBYnN9vF8wYTJtrcc87Adt+nscLkIU8s3t5DSXRvNw6Nj8TK5AW8ut8TuUy1c9rkMx
         7QrCIa3YFlc0Y7hL96GJSsv2yexKqEdo5ZBQ3yWzOmuY7mPGB/5k6c+wfwYdVtWTvUds
         g4OktRwbSEiml7zpvlt7/7vGmu5sAQoYzfZi/0aMgG3aR2S5LzldGr3RVYlh29DF1oqa
         0a+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747213857; x=1747818657;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CM5grMBdlFWIvR/uTVEife3NYvwwqAT5OSYd5XdA+2c=;
        b=nIHpRed2qEqreEWhoV3y6GM24ztug+yWxSZLDloeC0pUp03nY0ZD5d1XdfVdgZ3DYy
         MCa42h03nk5i474fA2CwlI+aVnFoP+76ISEXAq64PZBrVDq2q9IJsn7RTLk/x+KIRWh1
         BgE2zqpQLWgCNSds/mur+PCriB6DZqwY3aBgDKAB9hjtF8JsP8BTK+AY9UW6ZFoJuj8e
         LQS2b7wZKQ1Eos4yVKPiNNPCU951y6wazvAfXBzUoQ0iq/3cWYNKzKr/dETpPVSntbTx
         q3RULPXvAS17Y00vhgykp7A196PTwSD1VN84c5pZKQD+CaDyNpkX+sYt+7QPfBGTN0jL
         Jozg==
X-Forwarded-Encrypted: i=1; AJvYcCUUUrCxqFkFjA7vMBNFHp7wgG1c+alfb7DepAUUVEiQ+IealP6nw+k04Z6wvoLPH5vs1iGA1OFaNYp/NLA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhum2xfE8AX6g+HtdFWppJ6LjRVu+wE6Df433X9IFNPDuH2Kiy
	3I5EPU8nizZ8oINu2r9BkzHlNTVjPKWt2LUW2hiCDbhUVhXioalPhW411U/i3D+f6Ryi9frV6jz
	gmP8K23KKtngRktngMd6iKJ0giac=
X-Gm-Gg: ASbGncsLprmgsCXu3ZQb4qJSJpE4PABQmuckfX4PvqbdxNAWso4w5NrAb6slDiOsJKY
	WwZauen3MBxElxUGfpo1F4mUuNw9PpQjf544cRKp6uV1F7kGl3uCbmgypDhYfeY09JcoKOOYg4d
	GD+/kVxv44wl5IiBOqV4/YPSAkfe3LUHtJna4=
X-Google-Smtp-Source: AGHT+IH7+Ie8eyW7gbs3gcJMkKTL8axpyEl07ATFRvwU8CD7ajrIJ5H6ko0RoyVPw0DmnE2BQBpxI4816AgaH3l31Rk=
X-Received: by 2002:a05:6902:1690:b0:e73:19b7:f1a3 with SMTP id
 3f1490d57ef6-e7b3d4b7339mr3118937276.6.1747213857686; Wed, 14 May 2025
 02:10:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Guoyu Yin <y04609127@gmail.com>
Date: Wed, 14 May 2025 17:10:44 +0800
X-Gm-Features: AX0GCFv2bylRsS1gyepXYXxmr1Ein-NlWNYpDzAWkJ6ZToPe-Gep4MKzee0pHaE
Message-ID: <CAJNGr6st-3Y3SKtrAxtKTBoH0fwTm5SV60rPxYSm9jVA5hNC+Q@mail.gmail.com>
Subject: general protection fault in pwq_dec_nr_in_flight
To: tj@kernel.org, jiangshanlai@gmail.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I discovered a kernel crash described as "general protection fault in
pwq_dec_nr_in_flight." The crash occurs in the workqueue subsystem,
specifically in the function pwq_dec_nr_in_flight
(kernel/workqueue.c:1994), due to accessing a non-canonical pointer,
resulting in a general protection fault.

According to the crash report, the faulty pointer is
0x0b249150ffff8809 (register R15), which is a non-canonical address.
KASAN, while checking this address, computed the shadow address (R15
>> 3 = 0x0164922a1ffff101) and triggered the fault when attempting to
access it. The offending instruction is cmpb $0x0,(%rax,%rbp,1), where
RAX = 0x0164922a1ffff101.

This indicates memory corruption in the workqueue structure (e.g., pwq
or worker->current_pwq), possibly due to use-after-free or buffer
overflow. The crash was triggered by a specific Syzkaller workload,
potentially involving interactions between the workqueue and other
subsystems (e.g., networking).

I suggest reviewing the workqueue code and related subsystems to
identify the source of the memory corruption. The full crash report is
attached to this email. Please feel free to contact me for additional
information or steps to reproduce.

This can be reproduced on:

HEAD commit:

38fec10eb60d687e30c8c6b5420d86e8149f7557

report:

console output : https://pastebin.com/raw/tqUrvZZs

kernel config : https://pastebin.com/raw/u0Efyj5P

C reproducer :
part1: https://pastebin.com/raw/w4GawVue
part2: https://pastebin.com/raw/Ux0XFRbF
