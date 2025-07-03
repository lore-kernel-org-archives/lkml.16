Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B29225D6
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 07:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751529109; cv=none; b=IFxp0gdasEMUE5fhC3o9Th3RM5f9orKm0sp/oLGR0a74EHSHDlo8SnEMViVnadw5U8ZYrmaruuBmXgbr3goUTtNtbdGZ1TLslp51DId9MC5AaW9Tc39EjR7cAIsORUkPuLAjWPxBS4ymZ27BQu9mGCSsnjtfU3hjf9nkNSPXkQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751529109; c=relaxed/simple;
	bh=aetFDDrK02IXhBM57705wpAX6sb2EWo1af3VTImZsYA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iQTKg3dyHej/X8bizXhk/KWaF8AOm+16Ys1qDDP1CnAT92AvE4H7d0l8bzGQlfkhrbzo7k5/65yxWF7GCdDfPJrk0uduSHt/h9FCO26y6OOMb9iXrEiIcsf4qSRG7g3zqDXHYamW1nm9DflYG03tjE0jY0XY3jXIUlu2Adm3jXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QM4pYAV5; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QM4pYAV5"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-451d7b50815so40513265e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 00:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751529106; x=1752133906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HCOocaiZE3RHaNr4ijYeQaRjphYIZIyLbI3fYSnEAzM=;
        b=QM4pYAV5OqG2FNj7F40j7nA0+De4qo+EQ9dbVa51+9cW6KYmsWjRSCiS6rnnDomZsZ
         uzu7cz0aZQxG1PJoD8GZxL8SlLl4ItrmL7WCqXJrbs1BL4UEIbpvs/TnEb7DE+/SYnHY
         6vSAbOM26TrNcXTZ8/XyduDCy9iTac9UZabyypt9ZbI6NI4jPOmETeNwdWTiOcmPOda6
         BeFDDB5C75THezT9+rnVR4UdwkxnXrGwVvzTbHWGIjthRS3/Y+iVH7f4cMoF6jt/YqWZ
         krSdvpe+lCA85Y4bMvvyfrmGCKENr9JKbVT2W06Tq4rMwsQDzNIxRklwuzFPYxXgz8R8
         TrkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751529106; x=1752133906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HCOocaiZE3RHaNr4ijYeQaRjphYIZIyLbI3fYSnEAzM=;
        b=topcb6bFxA9IJnFd8n6CJaKvhGDb58XHJJv9AUeizFjNJw45PMGq4F5e0cAZu4VrG/
         84NcBD24F8Vg5e0f/c31+GAtR8F7o1Mad90uKZLv1uNNDpzGKUGyT5Hpq6q88iOmI0O4
         2iZPqjDL8DQdfvF0Gwp1uTcPCg+OA12uRZDXJrJMChGGtkzCSxVEPKXweTZ86oMxuo3A
         blufeDVfCSfg1ste826iMOwlnNCXNUEwESHj2Bw6AH3DsgB2kANl+hngU+IDNU6bOJfG
         6Fe854STPk2ArCdmj+ED7zm/exgI06DpvBNwuGeSYeiBess84crMh6RErl9TknuI0CGO
         hS2g==
X-Forwarded-Encrypted: i=1; AJvYcCXkYr1AQKF060BpeGDxQ8NK25uQCvRkaEU0oUT5oGCV1kjh6FLTB4DtSLenBGm5+OsOqKBrQhALKBEtoZE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/KZGg/hcGmZiPByBnkDtPI5bhSOxe000St1DLIIStfLYi3zZ3
	ou3XnMyk1MEmsXD3hUIfPTZ5Czzg6iFrect5ghTBZLkgj3MBJ442stAJ
X-Gm-Gg: ASbGnctQ92CVT67HkUq+WR9bv5kBpBZ/P8CnAFHzZ/Xys6oIZZtAlJhiE8avb1FRIT7
	kmMIZU0lHaJy6WQG0pLum7JyY2dbiUR1whX/g6sQLUZWmnBK67hVE0ef0XrAPLxNuxc9jY8xJO4
	VY7wH4sb3vpjJQ6FHXLlVslAbg7O7b7+fAGqHNITozoLciE6J5hyODYjkKLZ8y5CkbGtjOVQCQE
	tuvpfeNuUSeRKCxQ7XJkDkusPVUKrKqxf/dJVbedKMrDVL+xMe0Jmihx9XNk5RvPachY2JOImNC
	Qhrd7NalpasVrPrRxDuJAVe10TnvzNpTCTASpWRvLBRwij9qh8o6BkiFA1iQd4HsGG6NG/sQ83o
	TCI2SZ1mMIoQHr8AUuw==
X-Google-Smtp-Source: AGHT+IFz+l/hIELHhsBalX2bIxe469fhX4JRJjdI+dTOlBmgT4PKi4zvv+CcPxztLihcKrsGhMzOrA==
X-Received: by 2002:a05:600c:3593:b0:441:b3eb:570a with SMTP id 5b1f17b1804b1-454a9c620e9mr26826685e9.2.1751529106099;
        Thu, 03 Jul 2025 00:51:46 -0700 (PDT)
Received: from pumpkin (host-92-21-58-28.as13285.net. [92.21.58.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9989fcesm18768755e9.16.2025.07.03.00.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 00:51:45 -0700 (PDT)
Date: Thu, 3 Jul 2025 08:51:43 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Alexander Potapenko <glider@google.com>
Cc: quic_jiangenj@quicinc.com, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, Aleksandr Nogikh <nogikh@google.com>, Andrey
 Konovalov <andreyknvl@gmail.com>, Borislav Petkov <bp@alien8.de>, Dave
 Hansen <dave.hansen@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>,
 Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Marco
 Elver <elver@google.com>, Peter Zijlstra <peterz@infradead.org>, Thomas
 Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v2 02/11] kcov: apply clang-format to kcov code
Message-ID: <20250703085144.4afe788f@pumpkin>
In-Reply-To: <20250626134158.3385080-3-glider@google.com>
References: <20250626134158.3385080-1-glider@google.com>
	<20250626134158.3385080-3-glider@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 26 Jun 2025 15:41:49 +0200
Alexander Potapenko <glider@google.com> wrote:

> kcov used to obey clang-format style, but somehow diverged over time.
> This patch applies clang-format to kernel/kcov.c and
> include/linux/kcov.h, no functional change.
> 
... 
> -#define kcov_prepare_switch(t)			\
> -do {						\
> -	(t)->kcov_mode |= KCOV_IN_CTXSW;	\
> -} while (0)
> +#define kcov_prepare_switch(t)                   \
> +	do {                                     \
> +		(t)->kcov_mode |= KCOV_IN_CTXSW; \
> +	} while (0)
>  

Too many level of indent.

(and too much churn I just deleted)

	David

