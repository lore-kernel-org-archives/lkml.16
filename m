Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AE328FAB9
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 15:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747926586; cv=none; b=K7VEVqOx1LKmuxXKgNasJI4+v7sWrG4DeVv1hE0mYDX7LjLCpv8NknsTy52vtUqIooUKa4+uRVzHtF0bqMJkg502LFEk1MKVDY2kC2adYRXpo5PKa+xZEnKTPg/LsKr9gWHygcUD42d4xl/ucMRqEnB3TzcN/izFfdllUycMKAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747926586; c=relaxed/simple;
	bh=PuqJ9j7q8er0cMSuUmi6XE/ztP2Qv3UJsX9DeeC1LJk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=aT6CJMzcCPFX6wedqs5vVb80W4/v6H3/GJQa1MM/vcoTW4+CXEc80LpCIjLJyGzYww3af6+9baZwExuRkIldFOW+WTWdygfwaP4WMy2XkNlZpxfN11CmE2capEgYdjOWfZvr6EfS4BpKIrhTKpCeVdqWlefYhnuG/dwfD/ZLPGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EkPvYaPX; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EkPvYaPX"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-329107e3f90so53629741fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 08:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747926583; x=1748531383; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7LZBf/9xKXNiFt0/ewO9FOxfe29NyLCSWebunW9xbvg=;
        b=EkPvYaPXkSPDpchDI9uqstd6JbbSYa2+T98LvgzKlZeWcjr7DyVoNx8fsYE11udfAE
         WnzK+tULhr+7tBHfMLvJB3AhDA4E8sSv2ibDy2VfBEH5fkDT25fTvyaUgx68FJ6jv3o2
         cHDnB6FQWyguKouF5RhCtMR9ykuE96kKG5kjdalw8hsMnYa1uihRV2IV178GQOf95tzU
         DLXJzxN+aFHnWmhXdfHAUMWMv1nvbX/k4rxP/VfjubINHHqi/pfSiukJAfMt+m5Uw9Bi
         oEEAsEoClrSECFB+cgnA7Ilj4PqfHL8E/36xIE34H+2u+V/RZD4wAPXaiUhzgb2Xt+Vf
         V2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747926583; x=1748531383;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7LZBf/9xKXNiFt0/ewO9FOxfe29NyLCSWebunW9xbvg=;
        b=PSknOEQ7ecfdaW6xfjWIZQxu9oZYQD11v0K/eU3H9Gwusyp79jTLCIF6TCyNs2ZzvO
         6rDyRM8oYuKJk0m5kcI/biPIZ9pJRVvQPkhgQGfMLYGd2a0C+1gaqxSd1pHdi2gspxMk
         w5ak7C4m/cTD7jvjC8Ec6DSVvy2r465llGz5tjXR6+KDFnXufdbjK+02BfkDEzFdPLm5
         A6AaVvqZ9xiGvooD+MOCzaIgSyyBOWIcrw3kVUqoqAeKkxRkn4eeEhiezETGLhZ75AuP
         NHHNuimgxAdHohindbeRaKnzoI8pwJhUBNPbhMNacwa7ZG8dY0QkwZBh5bcYmPjS+YAn
         m23A==
X-Forwarded-Encrypted: i=1; AJvYcCWQ9cVggDoJwuxPF+Xjp9wVPI5If5VQeGlbdKTn7Cc/ATKYc3WPsgT0izcYXQ4/Q+6eXy9ubUY3Py4mRJE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWn7AP0y/Ejrjmglb5gJTUSHjlmhxhGScl1INm2JxuieHKDrK4
	EwgzD/CJJI6uof5r6Fzn1hECJoU8G7iubaP1mv+ppj3KlQuknaUPI/+MmFop6e+qmwf5Cn8UHHI
	3RtUkZJvhOsoCVr1lOa3h6p+r+hJHew==
X-Gm-Gg: ASbGncsDU1PmNCdNes5dxJK3gEB+WCcCI/gx0HTWc+Up1JeBLyhBLptHl7+IkEe0ot1
	/E4gEFywvQtEQ/6R3/ZUu3lecWYO6pK8Y9Egs9WLITSlLvKELGstr76s/NULNPzgEdQ535w38lh
	oYh9pvrIsYrJ8IEWEsIcqehs8Jf42cocsI/3N4RkCQBBepzn8djM9KBHvra1r2zpM8
X-Google-Smtp-Source: AGHT+IHgwy5iNPU7kCI1JnGEdlKo1Jm9nWx6/7skj5hPD+VYLAk6zrvWUZ7ItT4tJo57qIl2/C5LY0r69JULNg5/yQ0=
X-Received: by 2002:a2e:a9a5:0:b0:30d:b3f3:bcc6 with SMTP id
 38308e7fff4ca-328096dd6aemr98343861fa.21.1747926582520; Thu, 22 May 2025
 08:09:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: John <john.cs.hey@gmail.com>
Date: Thu, 22 May 2025 23:09:13 +0800
X-Gm-Features: AX0GCFsiCbmYnKmbU1eOjA68zQJHZKoql96cKEyiL1D2AzNGTU200HJ1jJxhtjE
Message-ID: <CAP=Rh=OLo895nvSSXq5Z2Ubzs-eDtAfg6gHDineqF3NEap+rwQ@mail.gmail.com>
Subject: [Bug] "BUG: soft lockup in unwind_get_return_address" in Linux kernel v6.15-rc5
To: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Dear Linux Kernel Maintainers,

I hope this message finds you well.

I am writing to report a potential vulnerability I encountered during
testing of the Linux Kernel version v6.15-rc5.

Git Commit: 92a09c47464d040866cf2b4cd052bc60555185fb (tag: v6.15-rc5)

Bug Location: unwind_get_return_address+0x59/0xa0
arch/x86/kernel/unwind_orc.c:364

Bug report: https://hastebin.com/share/epuwikajob.bash

Complete log: https://hastebin.com/share/sumefafijo.perl

Entire kernel config:  https://hastebin.com/share/padecilimo.ini

Root Cause Analysis:
A soft lockup occurred on CPU0 due to a recursion or deadlock
involving __sanitizer_cov_trace_pc() during KCOV instrumentation.
The traced path includes slab deallocation (kmem_cache_free), task
exit handling (exit_task_work), and stack unwinding
(unwind_next_frame), which eventually leads to a GPF caused by
dereferencing current in a stale task context (FS=0).
This can be triggered repeatedly by malformed multicast socket setups
causing repeated IGMP autojoin failures and entering
trace-instrumented paths.

At present, I have not yet obtained a minimal reproducer for this
issue. However, I am actively working on reproducing it, and I will
promptly share any additional findings or a working reproducer as soon
as it becomes available.

Thank you very much for your time and attention to this matter. I
truly appreciate the efforts of the Linux kernel community.

Best regards,
John
