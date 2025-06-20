Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E422EAB93
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 18:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750444082; cv=none; b=Pjj/v07LxMJlL2EdtI8w7Bnyy8p8tbxjEMu0lXq47qBEowIrDFKhq6T6bjZDEE8RQM44hWjYlAkRmF/kaIuSCHSqym0q7glRxgzldF3+XwtP6H7PdE0xLKLGpzhWejJ0YPrlvLLwxj4KZiiKi5/rUI241YYx/2ZvPTEG3ucfoUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750444082; c=relaxed/simple;
	bh=U84t0g+EjYUanzhPV7rUnKevdOuy7fP8fRrmugsfUhI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HyppuSbUHQ7tNIDwT7S6/5tyIhv8xzY4zbXMS152gjCqfDbNGK2mOQe6LcT/9yhnmZPnvpTjPXmmYgp8qT7AjBtx22++UYRfwvkPgQR6C1Ae54U/wl6yYsr4i5sPEDPF9u2Xy3kn02E3+6qj2vUyQCbNldCvyF0uHnaQDJxSJk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J4yvxbjR; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J4yvxbjR"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so16123035e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 11:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750444077; x=1751048877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qIuvHtNfF89wQfpWfmmiFzBvDNkW62bIo8VFEMrSju0=;
        b=J4yvxbjRA1lVzHFuNBMAeYXIfxgE4rNwig+I3RHvIsi5CX18SXUoVb/VUVBkd5O/vx
         miK3xXbyWRO2lYJM7VjZLcyDdvXxfwv/q4r0prifCkcF7ulRrjXvnNgSQuh2BkKEimR0
         mbCAwGXzRyC/8JQw+P0jB2AjO5zTMdNbzevknxVjVKMvL5+nqEvjbcIPYovZYws8+/xZ
         aD+8JOtM80Q3R4OXc8wiKWPKmVF4pUqOwWuzFpRfDjgWQTdZszI6X4j8HNiS+0iErLBV
         vWXk9ymTnfE+SApolCpUvAlXEIXjckh5nxQ0JQaMvCXtGB4hsOKYsobRJ3GJGqSb4Ry+
         QwEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750444077; x=1751048877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qIuvHtNfF89wQfpWfmmiFzBvDNkW62bIo8VFEMrSju0=;
        b=YkuRt36UOh19+s9mlQN66e2JL0QBplwhw8JRanYQWbF8fwGoV5ymFyHjbzCs0bBT1A
         xizXDR/keeJHp8icuqMDiDReJgFjWmZgKg8pOk31/pjCXZdq9aKmK+iyiB30peZBZCVD
         ybOcJk9Nhyv3upvNxf7w78CAn+1KJiX0ZW2ALsXMZ/lzJEMOKlQpiWbU2gMmaUwiZO+Q
         6mAIA/W2EKm/v3DteEx/8XRr+ARnzkJAUXSr78eB2mHVGw6iA5IyLb6dcfRMWJZd89w6
         0Ihy9OnG+8fiL4TQdLZrQdhZ3OY/cqv0+N7L3sGx3AhRV2n/xjloduFOjbGw9PG2vaJK
         +rsA==
X-Forwarded-Encrypted: i=1; AJvYcCUlNn1Y6PRijz1EthJL9B5392hqgBVNbLeCQEaVjuCn7pAQoEhodut+SXpoq4Av5O3br0I8Gn/ncyqbZY4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yya5Jd4jwn9kS86S+vTfdzeqGO43MIy0Ey6EiwIpiwnk97+mfMa
	3OB32K7Li6TuAMuI5jc1sJiK/79pQXaC64CpELpWh/sfebQVtHnKZOVS
X-Gm-Gg: ASbGncvLQEEhNr8i+eDevWrGhAO+jX40NAq2X5z+PurkCQZAuM+XdzHvFQ981OYEWuh
	3VZzyCZDVp/0YhbgamwTtiZQiLvksinEG3nMIrqjQaMyxUa7PZn+DalAueJnxuxEl2n+rInf2fE
	VkWXttxAw5Gxtd7ibX60+dD8cvb7rjfrVMcLt4rrpUj2zgeYUsN0WmcutRB4dOxKAdYPV3ZgdHk
	Oq//Jr2+84wnIrKJXcktOVmwFlBp5FPLYr3mMmAg+i3q1Uk3RI0h6iwcVVx/8Km0fAK0U1eB94y
	uukxPh6w1FPbJpkRZ/6FRfaBFHfwimgd+bAjA0fGhJuagL7ItdK43DbFT8tpWakdALlq1JKVyig
	M
X-Google-Smtp-Source: AGHT+IG/nrrlkAB9MwSBMHqeHOrR6Fpbu51RqlWhoUpLt4rbI0MPGyR0bHjAcFpGtVZyWDNfemicRA==
X-Received: by 2002:a05:600c:358a:b0:442:d9fc:7de with SMTP id 5b1f17b1804b1-453662c4ce5mr26602885e9.22.1750444076480;
        Fri, 20 Jun 2025 11:27:56 -0700 (PDT)
Received: from localhost.localdomain ([41.79.198.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45364708658sm33083835e9.39.2025.06.20.11.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 11:27:55 -0700 (PDT)
From: Khalid Ali <khaliidcaliy@gmail.com>
X-Google-Original-From: Khalid Ali <khaliidcaliy@gmail.com
To: peterz@infradead.org
Cc: dave.hansen@linux.intel.com,
	luto@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.c,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/mm: Fix log overwrite in CPA check_conflict()
Date: Fri, 20 Jun 2025 18:20:58 +0000
Message-ID: <20250620182659.603-1-khaliidcaliy@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620090140.GR1613376@noisy.programming.kicks-ass.net>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> > From: Khalid Ali <khaliidcaliy@gmail.com>
> > 
> > On certain configurations (e.g. custom builds), check_conflict()
> > may produce a large number of warnings, flooding the kernel log
> > and overwriting earlier messages.
> > 
> > Observed warning:
> > 
> >   CPA  protect  Rodata RO: 0xffff888022a75000 - 0xffff888022a75fff
> >         PFN 22a75 req 8000000000000023 prevent 0000000000000002

> That's not good. Your system is sick, limiting the warns isn't making
>that better.

There is nothing wrong. It is just misconfiguration, however i don't see why 
it is neccessary this warning to spam the dmesg log. Maybe it is better idea 
to limit printing warning instead of warning for every page in a section (i.e Rodata in my case)
would make sense. So by limiting logs in anyways is good. 

There is also overhead by logging if that happens. 

Thanks
Khalid Ali
