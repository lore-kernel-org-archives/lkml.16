Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19B01514F6
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747835398; cv=none; b=MtOhnlUBQFpMH6dJBrQzE6zg9nxY85kSDgW7Ri8bf3UClbq/e8qVdbxejRaCF0nqL902+hg+pKJBaBKNE+MacdpXQ8ogmBac8z4koSho3Nv9Ge1CHT4MIfTBzFBr9ZYQ0tcUnNP2zJkxKyA/j/M5kL2zM3YN/rOFFeDyfiQoIw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747835398; c=relaxed/simple;
	bh=oSV11ENTMg2w3bSJEVf0KH0iJTJ+aiohPEtiAl5sHSA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=nyqWycn0L9UwPj1AXeOG2kszq6aB5STYNCayJtYqdeSW/EUskPYJIZROlDq8D75zi2bLMjYDl95TFkhHhVU8S9+Ca9xvnIcwdc89EoeY+dx3ZR8JkkNKh6ROsHTmWPOKLn/cTRbvdTzUWTtdAIy0kLSUSakgp5ZbFiSlprNgEY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eBsi6bGL; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eBsi6bGL"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-327fcd87a3cso57067551fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 06:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747835395; x=1748440195; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oSV11ENTMg2w3bSJEVf0KH0iJTJ+aiohPEtiAl5sHSA=;
        b=eBsi6bGL9Voe1iKx90OKM+cbAbCVVgQQ9YQ03gk6bCD3AEs9w2A2fldHNpuw8pGb+a
         yt7ZQpWKbXMet/WdasMYAvlXYV4lJ/wsijKxRM3JFpu+qtYcT24dI+USE89fmRW74bqt
         qWrdNLlT/dCnrsuV0BbtzPvTDJN+KtkLgQGN3EmnZCFU9XG7dL9TNRg8bgZn0JBt4DRQ
         ErsapL/KifdC4MwlpMTH8mWT/+iSQrqTjoOWDmktg4hgULftQ7sMY0FiYiLrwhBKPtPR
         AZayzCPq99qEkR3wAx+VC2sV9ES2toRbC8Kdy1vCH4tdPn5drCa1cZwNtY+OqU5CKBgQ
         Aopg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747835395; x=1748440195;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oSV11ENTMg2w3bSJEVf0KH0iJTJ+aiohPEtiAl5sHSA=;
        b=dhF0Txbm8XctF/DsmBNiXyHuWLE/V/WAIl+Xul0naQa9Aju7IZBbqqitAF1FD10ofP
         8HdrGaX1P6Jzu2YNbMKBq777oz5XnHcqpffRrFwjxtYT57yhxdw54IyVjY9m2YYL5lI4
         XJIswCDGfEHd4GvKTeAvscuxI6oCvgoKCkDRhrdB7dQaeWkNhzX3QHnlc/IhIkDfrNqv
         Bno+S72fVzRDq7jDuY/EGRYI2Cbb6EPPMb7bVcm7dV7jDPGz32x+ctZTDinJvGLg9NLo
         3kVkmkAD631GkvT2kLnMH6ER0SMm3wvsa2eZa9J8dYfhK48upeHrHdihT//XuGNXrQY6
         kcxw==
X-Forwarded-Encrypted: i=1; AJvYcCX910Mpf+f6AqwJ/IfS+9vX7zmdARBvOe+fQRs9DWDGRdkMOEtPb+VZhAr1iRyMBgD3GcZKYU/FdkzKsaM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPWwz/Yrautmvm5iX6GtXjn0lpxijvZxEq8Ktmmba0gjW0VBXI
	djPVSLm8rIPXpjwj9CDWfXa0+QrFFhGtT+xZLbi2L7JTAqP43jCymiGHC0m4N6GdgiwFffVTXIs
	jx12yms1VSR7z3hhOqW09XwlZawaBkw==
X-Gm-Gg: ASbGncvkY4HMj33bBoZosyPEFZtGe4Jku4YsZc/NOIWR4EEyEK+YMT42IGaTzblKo97
	m55McpgWuO0BnYzachS3bYzhyCqwdSWJBj0llJ7nPYzIt8PnUhi11Iy7FFONdkGGY3PGsqtLUNA
	aIUGuo1ndruy19qVfs+02vWjgvkb9BPZjgrEhLgpPyuM4W4BVXZOrUsg==
X-Google-Smtp-Source: AGHT+IF1J/6kLNLfMhffERVH52BxFyrMfiCmBFfWaxLicPEgoFedKGGTMH69Uxdu3ehFeVQfEU7ZiuqQ1HursAepV/w=
X-Received: by 2002:a05:651c:30d1:b0:30b:ec4d:e5df with SMTP id
 38308e7fff4ca-328097add4amr72171661fa.34.1747835394830; Wed, 21 May 2025
 06:49:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: John <john.cs.hey@gmail.com>
Date: Wed, 21 May 2025 21:49:41 +0800
X-Gm-Features: AX0GCFt9zN5vfFG1MxMxUEBvRB2bKYQsqwL6bvzWAU5wGxUAtBlRug_dBXzVy9w
Message-ID: <CAP=Rh=PtKsiXGLYeK5tr4LSw-AHJ6LM4kuTWR3Hs5sQQp02wCw@mail.gmail.com>
Subject: [Bug] "BUG: soft lockup in perf_event_open" in Linux kernel v6.14
To: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Dear Linux Kernel Maintainers,

I hope this message finds you well.

I am writing to report a potential vulnerability I encountered during
testing of the Linux Kernel version v6.14.

Git Commit: 38fec10eb60d687e30c8c6b5420d86e8149f7557 (tag: v6.14)

Bug Location: 0010:orc_find arch/x86/kernel/unwind_orc.c:217

Bug report: https://pastebin.com/QzuTF9kT

Complete log: https://pastebin.com/XjZYbiCH

Entire kernel config: https://pastebin.com/MRWGr3nv

Root Cause Analysis:

A soft lockup occurred on CPU#0 in the unwind_next_frame() function
during stack unwinding triggered by arch_stack_walk().
This was called in the middle of __kasan_slab_free() as part of RCU
reclamation path (rcu_do_batch()), likely triggered by a SLAB object
free in SELinux's avc_reclaim_node().
The system was under heavy AVC pressure due to continuous audit and
avc_has_perm() calls (e.g., from selinux_perf_event_open), leading to
repeated avc_node allocations and reclamations under spinlocks.

At present, I have not yet obtained a minimal reproducer for this
issue. However, I am actively working on reproducing it, and I will
promptly share any additional findings or a working reproducer as soon
as it becomes available.

Thank you very much for your time and attention to this matter. I
truly appreciate the efforts of the Linux kernel community.

Best regards,
John
