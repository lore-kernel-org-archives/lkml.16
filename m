Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD28E1FDA6D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 23:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745365654; cv=none; b=oCsI2BcQLX7GJ2gAHKLkfFUVIBTHTe4D8qQILqaWwpCLiDWK1M/DbH/JQXv7hB3pkdIq8Q8paMbTevn/Yr5tgS1fmDYWTaKv7P43WalVhrd2Oh0KsrL4FyBLrgs1BdzifS221aDdOzNRHom49mvJViP2Fls75wOkbww6pn4FkaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745365654; c=relaxed/simple;
	bh=ukVNh6gkEjNNQE8ZcUfA6z++5Osp3iiUUXbBw5q6QYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gFOa1Ptc5h/4swv0GzWDC8IkGqbuoBE23oPNoizlF1DZ1CaKgxwP0yDqDMxH83/+6AivG5UL2agcwsdRgKMdTel/gVOIdqX8BGWEYdoozxocsLuUx3g9LSm2oDkFbJfvrS4qbPhW1WlxKZLOAbFTyFF8M+s+Vt4vP/bmC/UOsr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Apv2ySkr; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Apv2ySkr"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e61da95244so9863255a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 16:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745365651; x=1745970451; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ukVNh6gkEjNNQE8ZcUfA6z++5Osp3iiUUXbBw5q6QYU=;
        b=Apv2ySkrCvoHftX9/G52GYEVPultDPFq8MLkB4/04+aR/1AEXrPv0viffLzkKvQ6J3
         WqWfGeugvjHURtd67ckCRf+Tnr0eYaqHZCE8jM7OWnulFg66xFf/uYDvuOJypXVSpaQJ
         6kgCAlV8kxde+VB3K5nCddFt+cCLqBmzeUcZtL6ARR30HY6SrO+BPwNV/b6wgE1JUsjs
         zbAgw3yunVNnME8tgrqXfb9PDvUbBQXfiKbjhMXOzJHew1+z8UmSTE+Mz9lgO/vfmSJh
         6HIxJWVYFwtOFhihmY7BUJ4H3SwwQ4/wZGj5D01Kcx6HNvPQxfWXp6Kb9vB0vTMcLcu7
         PfJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745365651; x=1745970451;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ukVNh6gkEjNNQE8ZcUfA6z++5Osp3iiUUXbBw5q6QYU=;
        b=LNYHkVI80ECw3P60q1uLu3UEK/QwNLUV3PTugeS83UexhCFYzpFvfRtZPqOZ/Bvx0Y
         MXLIusWa4sPYKcIFK0WeMu9fynw2I/RMC1SgWN8qxunDmBb9Rp55gcEkhItFdfE/x4Q5
         tzAGKtVgshyZWi0U/HIZ5iToCBeNMoeyqEYoIo/FM5MYcAKlbrom3Xx4x4JiWOuWrHv1
         rcqeDPA19jpNQX5xHHLLqVxc9CN4YorvkriL9g1ZHvAMOs7Cj9goazsjeX5ZUldM8wmF
         6S+hEP7JTruxmLqCF5tBEYshMUusNssGpHvQLY+UrTPLSPXXBiIedhkx50wKzz3j7SAR
         +bgg==
X-Forwarded-Encrypted: i=1; AJvYcCWh12HwFibJR51IY32K9jI4LaZm6lWG+5qE0aYtsBkFk0gNDt6uZ/ZfD2Vjc7VI/VhB6506DEAfbHQB1wQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+BUyiyBxKLjMgGAZ9wOP8hXjvp/OKFXX5Y1t5BQao2Uo/6QCM
	qcAQDEZc6uZyfkJhLPrJMiO7T99hD8FL48wQnDS+DLArHIzGJd2mOMjgadUQ9wenhG8vGobZYao
	Nw2HL69mD/fIUT2Aqe4YjZcXrTEz7AECvVL1V
X-Gm-Gg: ASbGncskvJTMNdSNV0giKasGOW9ldFtxWGbGk17q7q9NyRvMc0u+DEUXqKmrwl8UrTe
	5/sKdbcGcSH6/ywvoGF7uWDxKq1Qf4mERyksliWqqyQ+vASTAwo9E6ai5ULO0cXVfCR/P7yh2xN
	+IWs5DlWsrxnK+Yp44G1L9/xVStQ0ee+VDsp/dqLXgaNADlksglLSO2JNmWAx3bQ==
X-Google-Smtp-Source: AGHT+IHWX+cJR4ZByTaG9eqY/XIVp83KudSrONhKwKheK98JSHH08eIxFd1YyKl56X9x/D2Tx9dhhXu8we146gJD6uc=
X-Received: by 2002:a17:907:d1b:b0:acb:34b2:851 with SMTP id
 a640c23a62f3a-acb74dbf387mr1661803466b.44.1745365650881; Tue, 22 Apr 2025
 16:47:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402202728.2157627-1-dhavale@google.com> <a1e86463-3427-4715-a4a2-0ef88cca6135@linux.alibaba.com>
In-Reply-To: <a1e86463-3427-4715-a4a2-0ef88cca6135@linux.alibaba.com>
From: Sandeep Dhavale <dhavale@google.com>
Date: Tue, 22 Apr 2025 16:47:18 -0700
X-Gm-Features: ATxdqUGnLf9fwBXIbAT8B_UnhGBc9SGDdMO6_GxwRbOUIVqIOs2m2iQ6Lh6mWGY
Message-ID: <CAB=BE-SbX0XyG42wLwfH69vKfBWXMw2NL9jnJisVviK00S7Vew@mail.gmail.com>
Subject: Re: [PATCH v2] erofs: lazily initialize per-CPU workers and CPU
 hotplug hooks
To: Gao Xiang <hsiangkao@linux.alibaba.com>
Cc: linux-erofs@lists.ozlabs.org, Gao Xiang <xiang@kernel.org>, 
	Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>, 
	Jeffle Xu <jefflexu@linux.alibaba.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Gao,
Thanks for the review. I have addressed the comments and
did further cleanup in v3 at
https://lore.kernel.org/linux-erofs/20250422234546.2932092-1-dhavale@google.com/

Thanks,
Sandeep.
