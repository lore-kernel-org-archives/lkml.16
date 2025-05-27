Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3917C1CD2C
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 03:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748315713; cv=none; b=R5wEfrwy7ce+PbEJpJugOuKFXmLPxznXUTgVmZwIX+kLpJ3rLnwZSIXWbTzqoL2wZt2DxZ+OdhEMDjmynmsTX0KNRze1ikVLs52Rogprkzp6IhPL/lpLU2SEs9qXH6ljOkMeFJZCeSLYojAT/cbty8IO7MuPXsPqsCWGKyt5oJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748315713; c=relaxed/simple;
	bh=w+kMsPOiAx0i4Ymbpa8qhe1VrDsqNROHfmktDmqxzS4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=K9KQokoeXUO/YvLcDV8DSLTNn9NSuE8Mm4fXDi/h1aov6TgeVTcnPKCJxsw6NwKqS2uihHttazxHwhzAUJaY8c8Ni4sAUceaPAb5jG3YEbeblEfKrDSzOhFOH6vq4DyeF9BqXmN1svk3TgusSZJcMN6A+Vi4zQDoYeB0qhoFBIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jf0RvKd6; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jf0RvKd6"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-52eec54acf4so777443e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 20:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748315711; x=1748920511; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=w+kMsPOiAx0i4Ymbpa8qhe1VrDsqNROHfmktDmqxzS4=;
        b=jf0RvKd6vPiC5G2UNQ9dbHiw7/G/Is23V018sMz5zmk2TfmlnA9TMOxt7p/xFkCE6+
         R91HaKckhMDzIR9M/7rR0K38u0pXpPTk2vvXAxtr47FiHC1/n9jqwrV2+pAv0zcNyNis
         lGO6I3UcMbuB3JfyUfxdNYFg1hxKPzkUOC9wnbNWqsUL1ihuc0pDfM9JCIMOnV9UPVqX
         Jy/JaGzisQFPeeV/NYeyuePFLeKunv2oCg05Etq26f6/7KF3NrIXxtKdXl5v8XITwqAz
         xdibx0wuqY6uiuLsxNuMTBDjWhyvNwzjqZ41GHYqSXeQkecpdE3j2+iJLbDKdzDUsdRE
         YSOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748315711; x=1748920511;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w+kMsPOiAx0i4Ymbpa8qhe1VrDsqNROHfmktDmqxzS4=;
        b=Pg8IucXrv8nTbUJqlyzmMAceCvWrTg2yM5IuyE0CgUfaCb9PHC1ioE9i/qgvhaOU/0
         IdJAena7AknzViHq2hRbMSdokr40aacm23u3N7YFX/1q3DT4p6HVXcbq6LsdS9hugmEn
         6rgujRlgWR/MwliZ8JArkF7EOBCJT5MALReNFDxWxzw6kV1HEQxE/N8OQmfA1ghfQe0t
         3gkodTopgZbToYLummQwyWurmClZugTgBX3B//DAd70WNFbbIsnklQKnB2j/TctSkPoN
         vwcaD7ZUDbHL2m9sbpP3XrEwxvRPNo/nGqcAxKFkGv8sGR0B01FxJBZrMwp0+qqq5tNb
         PNOw==
X-Gm-Message-State: AOJu0YyrMeu5zk1k7bRp1Z8plWUURONCPbkXA0+5O0HKqeckqOS6ABkj
	wToX1VYe+WOCYN8uHZWlaNaXEbo34+ujhCvMTNP0FS9LE4xCD1uoA82sWXBQ8vNpKuNmBieAO2+
	7gLXuqGpbrlG8WQMbft7VaFUsrjp1mu2h6b6y
X-Gm-Gg: ASbGncu1VtirSU6M/qXeAtFxkGbJ5gRa03Z7EHWguI+vfgIU+PTikFcTGGqJTji+Nw6
	HGiVxrrPTltc4UxtXOPKdwIO9UGX+juUaUx0avzHpGoaMpbzkJmaC2YlS9R+0hhrqvUmV5Xx35b
	OjVxParRqeu5SuGNfJAg4mMBHlXuncnIfyUA==
X-Google-Smtp-Source: AGHT+IEdXnmii+8bq2HYYowJb1MHQck7dk1NcMaVrqMz19QTSnXLXUTgZBYtf0VIkifhFMkeU6sATXMgXPKrVwoeanE=
X-Received: by 2002:a05:6102:304d:b0:4bb:e5bf:9c7d with SMTP id
 ada2fe7eead31-4e424151c53mr8695722137.17.1748315710759; Mon, 26 May 2025
 20:15:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Xianying Wang <wangxianying546@gmail.com>
Date: Tue, 27 May 2025 11:15:00 +0800
X-Gm-Features: AX0GCFtl3Zouph7mlx4U-IcF9FAYzUXqtYo1WnVou6mAOFqm-c0Bp4UX3unfJUU
Message-ID: <CAOU40uBFoDg4F2Xrqg2ABJOJXV1QsyzOXv7tvA3M6hmE8b=PQA@mail.gmail.com>
Subject: [BUG] BUG: scheduling while atomic in stack_depot_save_flags
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I discovered a kernel crash described as "BUG: scheduling while atomic
in stack_depot_save_flags". This issue occurs in the function
stack_depot_save_flags (lib/stackdepot.c:676), which is invoked during
memory allocation via mempool_alloc in the block I/O request handling
path. The crash is triggered when the system attempts to schedule in
an atomic context due to a failed memory allocation.

The call trace indicates that the crash occurs within the kworker/0:1H
thread when processing I/O via the blk-mq layer. Specifically, the
blk_mq_run_work_fn function dispatches a SCSI request, which calls
into scsi_alloc_sgtables. This function uses a memory pool, and its
allocation path eventually invokes stack_depot_save_flags, likely
through KASAN instrumentation.

Preliminary analysis suggests that this crash may be triggered when
the system is under constrained memory conditions. In my test case, I
manually increased the value of /proc/sys/vm/min_free_kbytes to an
extremely high value (0x7fffffff) before triggering the I/O. This
likely prevented GFP_ATOMIC allocations from succeeding, causing
fallback logic to attempt sleeping, which violates the atomic context
constraint.

This can be reproduced on:

HEAD commit:

commit e8f897f4afef0031fe618a8e94127a0934896aba

report: https://pastebin.com/raw/1Rc6hMYx

console output : https://pastebin.com/raw/c0aR0Vcw

kernel config : https://pastebin.com/raw/aJ9rUnhG

C reproducer : https://pastebin.com/raw/43sWwB08

Best regards,

Xianying
