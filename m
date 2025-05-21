Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59441E22E6
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 15:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747842189; cv=none; b=qo3nLiE1l3Zgn2J/Cpkaox/4iLgk0cxy+8MGBt32jIt/fLaarf88+AJWZk8c875A30a1TEtxrncaReeGyHZa++VHAYFzbsxIj70YtpAcBw9MtkMma5NL2cDo3g0O89ER+o57VaI7DhKz9CTHrhzcD5exXuJienrP0eCvVaiQG4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747842189; c=relaxed/simple;
	bh=ub6EBjOX/x+g4JEYt9PJ8xuK1jnmJgK5m8DaA8cx6Tw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=HCqVSzXFXWgTg2zYZgA6CoE3SAc7mxCbkJWX1QzaThWjodKM64gg8pniIifnPSDIVkWeaG6bgW4NLN/uIXUbuoKDAYpJJzKYZhN2OOTxv07jKGUU2Qm+klu9KNk/emuq/vVqy51IrrSBazbPDMYauKTNpC+2sVZlPmQJi38jTkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SK44UjCt; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SK44UjCt"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30db1bd3bebso65404361fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 08:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747842185; x=1748446985; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ub6EBjOX/x+g4JEYt9PJ8xuK1jnmJgK5m8DaA8cx6Tw=;
        b=SK44UjCtNCDU61Fb95vBKqOY1zwopGdykohtHCJya7+uXLq5lRCk8YDdqo9btZExkn
         EfqLZd6P7bHJXjxahS4XbxiHtX0KMLArAXQJmWJVKBmLp2KwSJ6Y5mA7JhHKMmlStj3d
         fn75mjaJzmXLeJGrjwglcFlhVpkGz6YKgQVk2JQ1I78rWdazWUbEPLPTczkvW5nOG4V1
         ZGJqKlIUnxmlJh5/mL4FUzg3aEnr++CUW9riKoeLNxeWKT3hQPHo4WpmdWENitwxSSpY
         2Og0fU+DnLtJQfXfesl/TvWrn6nQ1tmFpH0sOAQleV9qhTaonovZyR8f8SSCQcv0rjK1
         gS3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747842185; x=1748446985;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ub6EBjOX/x+g4JEYt9PJ8xuK1jnmJgK5m8DaA8cx6Tw=;
        b=bUeF8B/se6yVcYDg97P9mYOpWU3o51TH9qbRWx+lYjibqjnLSQfP1+NXyqAFuUNTLU
         hGSdqf7BXBl2hBf5iqAdPKnNE/jceKIYCE+G8S2AD+2Nju7JcuApiP1sdklcAUC2aUg9
         SX59YI6C99JGofNd25mehUCUN0IJmRLqESI26SLofH3snC3LaaPkIcoMqj4Vzjy9cXzn
         8DQusmxWJzUKiwSDMalCDv2ssAQX/JXbESG6i5AHAZQo6ETLPrlNggKbrcBcEnXo2WgC
         cQTqEihVZOsAWhc9Sx2ea+LKHlzPaBiABpbADLuLeDcJ/b0HPH9DVGaEvkKuiVdeNhm4
         YryQ==
X-Gm-Message-State: AOJu0YyY5zgbh1TmAzl17MlYuAukMASd00emcts8kgpMv4FAtpqMNIoG
	lLi65axM0ZyCun0Ea68hdhfHMFe25FhSTKF5PkvkhujOl2FejstJR5ylB6/fywOi1LQYRVr2YOo
	QZz7clXDgBi3RrGTw0x/UOTqn7zP6r3hHSrmjIA==
X-Gm-Gg: ASbGnct4XycBqtjj1wRE/FJJtzFq+rkzVOglmVj9JnXf1AvafmzuKdTZMbUY+yb7hqz
	aLC2g0eWfL7twTIv7dS6l1EyD1h68e84bVTBRl1AAaZfkecSFYQaAAAlrioQbxaWHrS+5jGv3a9
	pLBxdG4ZS9VaXIatl1r9FIThgV25B1+fEw2H0uomMOhRPacPGbsL+xiA==
X-Google-Smtp-Source: AGHT+IGVZb5hn2QbRv6nwQRgi4kKwnT+oUI36zscHQFKXXAjeUxlahe0jxvBuartDax7LQgeWTa0bCJq1TWB1lj06mI=
X-Received: by 2002:a05:651c:f09:b0:30b:ed5a:6f3c with SMTP id
 38308e7fff4ca-328096b5d72mr54804511fa.10.1747842184452; Wed, 21 May 2025
 08:43:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: John <john.cs.hey@gmail.com>
Date: Wed, 21 May 2025 23:42:51 +0800
X-Gm-Features: AX0GCFv4ykq7_C2kdkkSXUlaFmyciwyiuFbZddHkDdRCPwUNZJToA1BKM4qVv9U
Message-ID: <CAP=Rh=M3f8uNL0G=dwEALH2AQxV8tznsMjMdXJ9TWcgNhHooGg@mail.gmail.com>
Subject: [Bug] soft lockup in cleanup_mnt in Linux kernel v6.15-rc5
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Dear Linux Kernel Maintainers,

I hope this message finds you well.

I am writing to report a potential vulnerability I encountered during
testing of the Linux Kernel version v6.15-rc5.

Git Commit: 92a09c47464d040866cf2b4cd052bc60555185fb (tag: v6.15-rc5)

Bug Location: 0010:stack_depot_save_flags+0x133/0xa00 lib/stackdepot.c:619

Bug report: https://hastebin.com/share/jemayogixe.yaml

Complete log: https://hastebin.com/share/judumibuhe.perl

Entire kernel config: https://hastebin.com/share/padecilimo.ini

Root Cause Analysis:

A soft lockup was detected on CPU#0 during kernel execution, with the
testing process triggering the hang.
The issue occurred in the function stack_depot_save_flags() in
lib/stackdepot.c, which was invoked as part of the KASAN (Kernel
Address Sanitizer) infrastructure during a kfree() operation.
The failure originates from a pathological condition within
stack_depot_save_flags() where the kernel attempts to store a stack
trace associated with a memory deallocation event.
Specifically, the function enters a long-running or potentially
infinite loop while performing a linear search through the hash bucket
used for stack trace deduplication.

At present, I have not yet obtained a minimal reproducer for this
issue. However, I am actively working on reproducing it, and I will
promptly share any additional findings or a working reproducer as soon
as it becomes available.

Thank you very much for your time and attention to this matter. I
truly appreciate the efforts of the Linux kernel community.

Best regards,
John
