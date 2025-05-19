Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com [209.85.219.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC48BA2D
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 04:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747629598; cv=none; b=GP2+PEKd8lf23yJ0vO7gGFwZjR3dKlln/g2Qke3IP4OBpsFxBnJ7gweMDJQf5/0ndOcFiteNeBUpj2kzNRFqvtddXveDwDcVHx6A6REmJKDqyV17FH9aS+2tD8A5aWhEV07T0m4+0EAGcwv8cbRlDNROsFzUq5kA6J+3dGOykUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747629598; c=relaxed/simple;
	bh=y0uOJBG49lBfEhU+I1bcegH0E6/QgST4QGKSSPWkqZQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=HYFcsy/JFwVdeLW1aCBs7R+pHSe5bzQU8HSplgm3V1DztR2ZPTCJE2qdBpab3ru7jYCQGAbixqAFw8CmfXLuITcOhED4yFq7GLg14YuAt7HtrIfD91V2pT/0m1Yu/9RKICrNMwmoruOFmJHjc/5/4Nf38/8wVxQRVs9kCErAK7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nInRmagM; arc=none smtp.client-ip=209.85.219.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nInRmagM"
Received: by mail-yb1-f193.google.com with SMTP id 3f1490d57ef6-e7b9972069dso609239276.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 21:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747629595; x=1748234395; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y0uOJBG49lBfEhU+I1bcegH0E6/QgST4QGKSSPWkqZQ=;
        b=nInRmagM1n9gKiN45lBUNJN+0/76Kg2hAWBs1xZb3SG1ct0Lg3tS79bMxPAXBLhHW9
         dWxb30FDS5qBiCa7DVq6y0D/XMyAPam5w0ABIrg1+rFA94fc5/hlOrPSIjUgGHTPuqPE
         XNepJvAtzWdHMKTURizx7Q+O1SbX6yVOU1dKLMMu1lfr6oPcy+rtX8jokxHydI+PrbfG
         6NDHO5T9GDRzHNJn5WBPrUwc3Z3ilc4h7yFPV3kC7qB/SuP77hkEk8fVy4DDp/+tj9RM
         rPHurNDPlOM224oJS25m4UKHDSrmG7EbVVBngwPymaWyBMbzcQWLmoXKLHFpdcbU827T
         QqSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747629595; x=1748234395;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y0uOJBG49lBfEhU+I1bcegH0E6/QgST4QGKSSPWkqZQ=;
        b=msqN6Vk8ySIdZ78ykaUG5HE11RdSVXpObGAmu2L46UHYad+HcHt30Ojkz9ZNwDBF/T
         MCathtQogzvzeJysBVJMPLCbsf4IkP0Ef8ozmJt9FED2HIkfeMixsI6EOeLVH49ZVmtu
         lgXrc/NHE5Ty9/gkxUgoEz7KNY/tunr9oiSnPSJfos6E/nFEay87W3EnzoXv1M8G6LJQ
         kHhh5xXStg9EXp6srnTEv4oVUvDLQjeslMJmTkbDvQ4p4tiywjv0LMTfo/cC2Dj/69Ip
         KK3YwGKJ9BiO7vUB+TpVGxbwlCVpNFqxE8OvmTaoPSe/mErZnUhq56Q1CXj3b33ti9wz
         ZP0w==
X-Forwarded-Encrypted: i=1; AJvYcCXIJi2PQ41EapTaDCbonzST59qoy5O492ftwLYDJYLB9HoaW8xP+vZLjapKIjncE3xfyOLUsUHFvO7hNhQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3U3UvAkez1mia/DbskxgvjDuooKQKOUh+jJumd5KCQtkGuFgF
	rZBA0ufaTSi7PqNfoEl9iDfI/l+72Wz6gGhDTBeJT26ih6QZ6LSdmlTvNqtKNQXv7poPnT6B3MR
	i8Xszo/kJjMeSLdkfJc3nmCAhGCnPvdc=
X-Gm-Gg: ASbGncubqKfCiIEAZE5pSpklA8xVPWmW5jvNwll6dopa5K1j5ZZU2ptVpGli4h6mW4W
	ePkOWolDeKgxDj4wx1735giHww82Y+nXWWif8/C2LGDDcTmNaBobm7I2cdHQif7s9kFWlWbcyYH
	leS2x0D2fFTYYYATyuAY0h01WRJC2CcS4UbA==
X-Google-Smtp-Source: AGHT+IEX3MxWt/dORjFhGvNhJ9GwFDD561jalJRC+jBy+mHSpUu8blwiT4u9rybqcDDs+f55pcmGCifYHvlvFMDjw+k=
X-Received: by 2002:a05:6902:12c9:b0:e75:bea4:5ea4 with SMTP id
 3f1490d57ef6-e7b6a412026mr14608253276.46.1747629595681; Sun, 18 May 2025
 21:39:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Guoyu Yin <y04609127@gmail.com>
Date: Mon, 19 May 2025 12:39:44 +0800
X-Gm-Features: AX0GCFvcV0P9cCPFB1RYcgX8fK2UXRBnjjRIB5m2manzO5ZCnHuk61OyvNPeX2U
Message-ID: <CAJNGr6u38oVsWeh57rmW15H80DpPrd0CH0uLH5kff1W0v6SHLw@mail.gmail.com>
Subject: [BUG] INFO: rcu detected stall in sys_io_submit
To: anna-maria@linutronix.de
Cc: frederic@kernel.org, tglx@linutronix.de, linux-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I discovered a kernel crash using the Syzkaller framework, described
as "INFO: rcu detected stall in sys_io_submit". This issue occurs
during the execution of the sys_io_submit system call, where RCU
detects a stall on CPU 3.

From the dmesg log, CPU 3 is stuck in the enqueue_hrtimer function
(kernel/time/hrtimer.c:1085) while handling an hrtimer interrupt.
Meanwhile, the task syz-executor.1 is stuck in memory management
functions (e.g., unmap_mapping_pages, mm/memory.c:3849) during
sys_io_submit execution. This likely causes the RCU stall.

I suspect this is due to delays in hrtimer processing or prolonged
blocking in memory management operations. I recommend reviewing the
enqueue_hrtimer implementation and the interaction between
sys_io_submit, AIO, and the EXT4 filesystem.

The full dmesg log is attached. Please feel free to contact me for
additional information or reproduction steps.

This can be reproduced on:

HEAD commit:

fac04efc5c793dccbd07e2d59af9f90b7fc0dca4

report: https://pastebin.com/raw/D6PmW878

console output : https://pastebin.com/raw/qeLqJsRF

kernel config: https://pastebin.com/raw/zrj9jd1V

C reproducer : https://pastebin.com/raw/EprKHENh

Best regards,

Guoyu
