Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF30828B7C8
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751290787; cv=none; b=oy4sMRpk2/RQYqbW3XW9CepGU7QJ2o7+y2ZefyA5MDWI6DZHiKqX+I5Cg5RdywTFSYAOuyM+nFBv3QOSaB4yBDJdOBLX8EoCpzRf5V3msnZnFDLj2THWI+9559KwdWiHlo8SmQUKaeFFPBjKxo6WjTc/0JabPwbBvRchs9UiQzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751290787; c=relaxed/simple;
	bh=MlSK4S4EzFKn7hGl7uHsgtZBktsZvSrPSDKsgWk2fVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ceEpwG1MCBLHbXVppEwgIWQ04RTBDHz30pT9ciKkdPuIM3K/gmN0OmfszGQE3VAj/vrkspbMyehk36K4Wf+5B7Dbk4Kq6NCNK+4jNQPMDtlCWfQLu/JeP24l1SbVzYlTovAS8NfsoLafBO0pKVm+2faHEkNZuTS4TTzGDf8MMQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S+u7WtpP; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S+u7WtpP"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6facacf521eso42834986d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751290785; x=1751895585; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d9AuvsCGB4RiILp5tNnwix0tzPCkF5zQPFb/CWJ1MHU=;
        b=S+u7WtpPi+TY6+s+z0vC9qsp7fDMN0NTalsruayDUzCJEVH0IZ+5ysuLtIovK0Cwco
         9Qz8reUa59P99lmNpE+aY44fm3sVKh8Hr1q9T6MAtyn4poaOG7VGP/Sq0SkTwBjGjad4
         rd6tlSddxDymKDPCbvQqXg4jrx8r+UEHhVrMMd937McW35KE6Z8QVMdHfVNzLC6k0Y8m
         690XTST6+jegJ2QoQoSCxiDCHHargXFgAslCK1smOCGZZ76DoLVPn/qEHqEUjWp4k/2z
         Xjm8UID3+p67Wi+obJFzzSvOchu4tT48yjAwoGEKnVHNwpYAlmjk7r1+Z0RnHYL7NBpk
         3yEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751290785; x=1751895585;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d9AuvsCGB4RiILp5tNnwix0tzPCkF5zQPFb/CWJ1MHU=;
        b=lVoS9kMdoapbq+BzHNzK73VVWug4dpsi7B4VSODP5gK1qdFgzgid64AE3hRWZ32qXV
         ipVKM6GSCkuBoK6okMsDj8Gus+iurO9C861jbX53W+DX4ZUhpGhVUZ4G/ANLYuQta+l9
         S0WUQIHRzUeEWQ+4MZv15GlaSBf6OURWxeKINfVVh0axqg4wkVXyJ4G6bP/JKYNopr4u
         FaOOuQ1OBs1B/qjmMN2cYmHkqlVUxgqtAHH5TIxhCY664iZKrRowtdpcyoleqZ6AoDGd
         uTuPdGGVeUea2AOjF+H/yVIjLOi/0KLCt2RhQOn7JiRA0mWhjc8XDOLORtk4FI2TJ7w2
         IFyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVi3wx+qZy3qMCVMVdsbXzZXaEMggIxQiK1g9MRWJAXt04oCowt9bCGQL4bMfrGdXCAVi48WJsI4oQt3P0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ0wS8j9ZnlVHl5qoRG/bKndYmajNS4CW05igbm0D7PIujaz3b
	Xsb7zWvl6WFtepADd0EbrrutFvOE8mkmy8iKSRyJQFtcd7r/UPnYPZ79DJkyM934t3vMdhbTDiQ
	1P9qUjMkln3wecuA5Vl4PSmY+hl5Nac2ukxkwtBPx
X-Gm-Gg: ASbGncsM3Bct2/iLY2eXCm0/nDubHnwtAXLvYZg7jMda54zSi50JzCWvwZux2pEQgEC
	9z3MI/dI7jM/OFAj4ZgzyulfsFVZnP7IQw6heOGeNifYgq+6A3MkltqIblobVP9LfKhQ4B8pgxb
	Tvp3M6O6MevHSPqrPxnLTkpBhjL7Ypi93vMepnq/azQVvN2bayNldWiQ/r+cgI0uyNLOUIakb7s
	lqECZrpNPbS
X-Google-Smtp-Source: AGHT+IG5WQ45iK6SDtnZOJ++PhgZkenXiNDwHc9J414iOdJgOUYcSqxzMd+V5/XszLm4ELWZ9pqNkzhnxix5zZ/R8Jg=
X-Received: by 2002:ad4:5612:0:b0:700:be60:9515 with SMTP id
 6a1803df08f44-700be609549mr124994426d6.9.1751290784445; Mon, 30 Jun 2025
 06:39:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250626134158.3385080-1-glider@google.com> <20250626134158.3385080-2-glider@google.com>
 <20250627075905.GP1613200@noisy.programming.kicks-ass.net>
 <CAG_fn=XvYNkRp00A_BwL4xRn5hTFcGmvJw=M0XU1rWPMWEZNjA@mail.gmail.com> <20250630074340.GG1613200@noisy.programming.kicks-ass.net>
In-Reply-To: <20250630074340.GG1613200@noisy.programming.kicks-ass.net>
From: Alexander Potapenko <glider@google.com>
Date: Mon, 30 Jun 2025 15:39:07 +0200
X-Gm-Features: Ac12FXxcEl_XsGEIGdCHbgVrVVScwiNYO8j6atWMmRubTk4CPTsJQZpUXMmqqqU
Message-ID: <CAG_fn=WYkgf3=9bTPJCpEq0HcxCtM-Kj8R-PQkjJgh4B4E16fA@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] x86: kcov: disable instrumentation of arch/x86/kernel/tsc.c
To: Peter Zijlstra <peterz@infradead.org>
Cc: quic_jiangenj@quicinc.com, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, Aleksandr Nogikh <nogikh@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Marco Elver <elver@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

> Anyway, looking at kcov again, all the __sanitize_*() hooks seem to have
> check_kcov_mode(), which in turn has something like:
>
>  if (!in_task() ..)
>    return false;
>
> Which should be filtering out all these things, no? If this filter
> 'broken' ?

I think this is one of the cases where we are transitioning to the IRQ
context (so the coverage isn't really interesting for the fuzzer), but
still haven't bumped preempt_count.

In this particular case in_task() is 1, in_softirq_really() is 0, and
preempt_count() is 2.
