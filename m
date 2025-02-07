Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568F623ED62
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 14:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738938527; cv=none; b=hldnKotm0TsYjgWlmfbUlMLBR6IIxcVIoXsqAKpuRnC52O3OJRQll1BiYW8lLiS8C/6Y9b3WouBG7mi7Vf2Opzq6fvMOHr/aO/uhwKJKKlWmEgpXlSQntYt79+FzrjMx9TcWFz3Nqft0VEb/pGnQ2S/JKeKZiVpPwfeXYZ4PnbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738938527; c=relaxed/simple;
	bh=1rexS5WS3OHSZZeEo18X8h4yuoDBRbHA45XPuN3amY8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c1uGyV0Wy+cQsCqMseZ77vpsncSIPuuvNQS3nXkXhEHA079OTpo1skazzXF++ooA3jo+vcbM7M+GSXX2exD1ffrbp8ePoxJL9yjLQSWiUoCzmCMMCaU5AGRhLyE6CZ76Kh/UO8gDGLmWOuTJDEkDl7dLbJujhgLy5/76iOb9Uo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XpiX1YoT; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XpiX1YoT"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-467896541e1so245231cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 06:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738938523; x=1739543323; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1rexS5WS3OHSZZeEo18X8h4yuoDBRbHA45XPuN3amY8=;
        b=XpiX1YoToM+G9j2J2QS0Fb8XOwOGQguVyndtCxxXBd5T/75TwLr9cex/1XIL+6nNud
         7Cz++lqVBldkbtX1E+gVi0nATS1tvPcG68rDXAoYzCTfXc4TOie1dOuUeODZOJu0drJG
         c7dKv970cKW6mQgtEYpjpzhOUf9JMTaAQRhXZL6cLTeehy9joBJS6RyBE1bn+bnbvb8Z
         XzkNqOHvOvRJpUvDgRJKADpCYuiRgswDHpwxmozChyLIgscQkzqFJqBg/T8tsQmPs4ua
         tMZ2mr74mTj/7RE4QIKeY3vv/Bw4g+rISRUBA1Sr3ojjJfIVioF9CqaSiqXOq4h+9vzr
         zvQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738938523; x=1739543323;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1rexS5WS3OHSZZeEo18X8h4yuoDBRbHA45XPuN3amY8=;
        b=PpCaAz4UyRD0HC3POmTFua4S7AFEv4FSOP7S9eS4n8h6jF8yi+G90g9dDXGfC8ecG7
         a1kTzAEVHszwrPXXKqU3lRDOhMZIviWFf/aDNEpG1wFqLMe3+PLK0wHKqvmlxmgToDCi
         cqNAHM60wcU2Q81aDLlHd3H7nNtV21sblJ9f/vXqhPgdmdXBneGZHiG1rw1hFUs5iE8M
         55WWxlpBUR5OVCrqRecG70s04gg1wxFAp+78Z22bxZL+RpASExpgSSk6XPF/55h+04aa
         YugUlCVoFlk5OSct7fdAbvSJiPmuCQ5vDDTTAXiHxORHoJzX0BK6vccoCy+aZYPBHK72
         EZKw==
X-Forwarded-Encrypted: i=1; AJvYcCVFjuHCFF9yktqKUB8crGxGoFYQcRcZZ5WXg4ci6ggJr1lkYfhJZKBA62Y5kY/VBjtx+WFN0Zudw3IlYrU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoMmlQSYWiBf3S6tk16Rzr7znUxliL1wrJTUlWjo7iTF4zU6UQ
	dC/O/tinL7g+3A5C6TpchT7AAYvUtqwZvDZpv+QUU71JD4GUCGKpEw3Ylv04dpqSWgFHCHtxgAi
	ZKVfERfInl+lv1LvWffm3ylB4GDMgY3zEVoU5
X-Gm-Gg: ASbGnctcwsXTV/eFaAXkfym9ovZnN2iKBpFItZ0AKMBLcfmIl5qeSaJ6MqnK9xjTXEz
	tnOU2S5y89m6NQr72L9hdU5GyQ5DSjXTJX3G74w/apdiE1I+cbijnHycBbE0ab8bzKzf0ioRs4i
	gys6tKNAgROvOgr7t87QpLawCe0H8=
X-Google-Smtp-Source: AGHT+IFIy/IxSZaxwoz/qDlgIY4R9UtPhyTgiGBPb3DyRDFkqE2ug+PU7LD+LVqbQubD7czlGvLtOu9vozxN4sdeTOU=
X-Received: by 2002:ac8:5a15:0:b0:466:90dd:19f3 with SMTP id
 d75a77b69052e-47169c9b938mr2645491cf.7.1738938523070; Fri, 07 Feb 2025
 06:28:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206044346.3810242-1-riel@surriel.com> <20250206044346.3810242-2-riel@surriel.com>
In-Reply-To: <20250206044346.3810242-2-riel@surriel.com>
From: Brendan Jackman <jackmanb@google.com>
Date: Fri, 7 Feb 2025 15:28:31 +0100
X-Gm-Features: AWEUYZnhjPFckHJVpbtURfI6azwiA7ZfQgaxMPfiq7TlWaGFfSzT8QTgqpVPz3I
Message-ID: <CA+i-1C2QgSTq4gbGZqjyzGcuscsFZvymHvXnfJYuT-CNjPPuMQ@mail.gmail.com>
Subject: Re: [PATCH v9 01/12] x86/mm: make MMU_GATHER_RCU_TABLE_FREE unconditional
To: Rik van Riel <riel@surriel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, bp@alien8.de, 
	peterz@infradead.org, dave.hansen@linux.intel.com, zhengqi.arch@bytedance.com, 
	nadav.amit@gmail.com, thomas.lendacky@amd.com, kernel-team@meta.com, 
	linux-mm@kvack.org, akpm@linux-foundation.org, jannh@google.com, 
	mhklinux@outlook.com, andrew.cooper3@citrix.com, 
	Manali Shukla <Manali.Shukla@amd.com>
Content-Type: text/plain; charset="UTF-8"

Hi Rik,

On Thu, 6 Feb 2025 at 05:45, Rik van Riel <riel@surriel.com> wrote:
> This is done because some paravirt TLB flush implementations
> handle the TLB flush in the hypervisor, and will do the flush
> even when the target CPU has interrupts disabled.
>
> Always handle page table freeing with MMU_GATHER_RCU_TABLE_FREE.
> Using RCU synchronization between page table freeing and get_user_pages_fast()
> allows bare metal to also do TLB flushing while interrupts are disabled.
>
> Various places in the mm do still block IRQs or disable preemption
> as an implicit way to block RCU frees.
>
> That makes it safe to use INVLPGB on AMD CPUs.

It would be nice to update the CONFIG_MMU_GATHER_RCU_TABLE_FREE
comment in mm/mmu_gather.c to mention INVLPG alongside "Architectures
that do not have this (PPC)" - and while that's being updated it would
also be useful to note down the paravirt thing you explained above,
IMO it's pretty helpful to have more examples of the concrete usecases
for this logic.
