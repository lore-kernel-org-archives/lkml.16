Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5226267F65
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 04:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749010518; cv=none; b=q1yKMCHe97rOf6eNIswbgjQ1FShsoqROS6/ryyNoxNHZDzLrI94cc01pWmhJd4UENngN9wzb4+MtIGJpZw+i4RVp4oeoMdk4fiGQydbcUeR1uYuqqnGO/Cs0SNrBY7MTs2Az3TD2zFAn1ykcmQseWVfHaOlyRF1LtZn4euSYguw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749010518; c=relaxed/simple;
	bh=BhS57WC781FGhl7wiFaoKFwTnnlOk4VqYm13+Xn7qKc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=QRDVyNMq/CS6/mFS9fglf730xpRjQ+B04tJ7SyGLgK2KGcPLOIRd/4mXmZ2zmjorqDetGJroJjC/nHu9V9Fa8/WOaedUvtq7XtkY00kpS+A9aRxkpFqRykJTu795MR4U+SkDn/rXpLKuk8CluRek3yKIzcuU/H/Nncwq4+EPhbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jUS8cxrI; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jUS8cxrI"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-310447fe59aso64524491fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 21:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749010514; x=1749615314; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=612kEmpPb7m3pK7JQGNKK+GWWWPmWdnLdhvjoEp7tmE=;
        b=jUS8cxrIf0Qg8jtuqTcQm6490kulAt2nTP7eKI5jgUYGNq4wLpI8zobD9hnCYNzMiC
         /a73t4BsB3d6H9EZrbrQNlSjGaLVx0Odz3yQFWxG09Gk5ph1MAlQ8Vbc/wxFJE6nYSv0
         maB3nDE3y16i5UgvJDmWgYZHvtozKSKvuXiApJklX0KnYTLTffxoFIknT27zgcOsdzQL
         BPPxdoVYdTU9UXLfdxsGvneDckmJWcwqGo1SAVkd8PYoQcLexc83SffDuLh5wsCt1lTl
         j1g15d07z/x3Ob95FMqAyzlb4ZFPLlhf2ohDttHu+pX+UhqITuBJfw2lFckxbdUR4W5K
         3tNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749010514; x=1749615314;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=612kEmpPb7m3pK7JQGNKK+GWWWPmWdnLdhvjoEp7tmE=;
        b=u0I2EcJZPOj62JNmhSnk/xKnng5DkArTwWArSsW3N6iTEpG28Sr4Lb46lkeCOMC26j
         T+X0QdrQiqvRh7ikwKRycLuxjNsLfY76wX0IdSTitE3WdavO5Y4Y2EYaNuZc8F2px63x
         U0Sok8arP+t8CxXj2EebiqmSayMt695wEuKSEOOMq3nCEXbSM3GXbAC51l/PL5trxURh
         XNA6E+zXHx6mwuGvrVjPJ15aRqZO1hnQWrGRNCzwsOYlPZLWeM6fFnDmATObAZJUC1ZE
         jQ84SBZ2yqdSVdG8xtqWQZyCn3GV0ZdLkg2Y55luzBO6dVGQQYjtiHqJmFHuS7E0ry2T
         j41A==
X-Gm-Message-State: AOJu0YxrNXfTCqxmsfMnNOk8assZi7as2RIKUpzA/+uNhWGdfB0AP7Gn
	4qGnrrSFI+eH4rkFCiHOaeQbYTf7+e/q1X8SEwru+k5TNGCkozas0XZHyrjv84n1FcHf2zl9j6g
	b3fTh2P4suDETamV1zYFxIGARmBfSR+oo0uFm
X-Gm-Gg: ASbGnctDUJ+/i1TpvIyRIx+nsuVHRJPFJYObHLsM83x/IC+W6tdYyxiH7GRW93wVOwH
	CEKP4W29sDrZja6eIFHNnk9+utjmRuXG/eFVpHatUu2a9jh54NeEO2uc+3QjtHk39CGiO8+3yQg
	MUe9teBeVxuO09G7Bq0a3Ctg122RLNxwHJZfxDcMFVSBPLkQ==
X-Google-Smtp-Source: AGHT+IGzX2RVPzAjskYqVtHebEn6TjQEUimQcfPKgxd/zZdJXDKyGzEkF4NJDHJ2ePXTPBNyt5qzrQFAf+gdmXYWPhQ=
X-Received: by 2002:a2e:bea8:0:b0:32a:8101:bbd4 with SMTP id
 38308e7fff4ca-32ac71ec8bdmr2645061fa.14.1749010513553; Tue, 03 Jun 2025
 21:15:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Luka <luka.2016.cs@gmail.com>
Date: Wed, 4 Jun 2025 12:15:01 +0800
X-Gm-Features: AX0GCFv2DWI_mGvL4HsHQm0PJ8kBvDmJqIA8LXoHiZaK86BDTSjJBZTJ4nlRVW0
Message-ID: <CALm_T+1awWGubNXHYrU7N2OOy8A9O3ofEbbLr6eq7Fjp3Agr3Q@mail.gmail.com>
Subject: [Bug] task hung in rescuer_thread in Linux Kernel v6.12
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Dear Kernel Maintainers,

I am writing to report a potential vulnerability identified in the
upstream Linux Kernel version v6.12, corresponding to the following
commit in the mainline repository:

Git Commit:  adc218676eef25575469234709c2d87185ca223a (tag: v6.12)

This issue was discovered during the testing of the Android 16 AOSP
kernel, which is based on Linux kernel version 6.12, specifically from
the AOSP kernel branch:

AOSP kernel branch: android16-6.12
Manifest path: kernel/common.git
Source URL:  https://android.googlesource.com/kernel/common/+/refs/heads/android16-6.12

Although this kernel branch is used in Android 16 development, its
base is aligned with the upstream Linux v6.12 release. I observed this
issue while conducting stability and fuzzing tests on the Android 16
platform and identified that the root cause lies in the upstream
codebase.


Bug Location:  rescuer_thread+0x83c/0xbcc kernel/workqueue.c:3528

Bug Report: https://hastebin.com/share/wenexuhiwe.css

Entire Log: https://hastebin.com/share/monedirasa.perl


Thank you very much for your time and attention. I sincerely apologize
that I am currently unable to provide a reproducer for this issue.
However, I am actively working on reproducing the problem, and I will
make sure to share any findings or reproducing steps with you as soon
as they are available.

I greatly appreciate your efforts in maintaining the Linux kernel and
your attention to this matter.

Best regards,
Luka
