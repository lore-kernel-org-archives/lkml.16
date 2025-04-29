Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE12216E1B
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 14:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745938635; cv=none; b=p4iPeNkBJsGLODpka+76jgkfpVNJYlRiOqL3YlicuK3y1aFrPmOS64s52A0bQmacrIDK00qBxz4wNalOqKMho7bimiHDY+1ZGYBtDqdW1Wgjo44JJsiljTLPGZWsocMhNGtKihkhs96cwmIhcCde5H6CvqM66RzyY/SPBI4rKOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745938635; c=relaxed/simple;
	bh=2Q8upZle3Pl+hSpx+WcywIF4WjHDWMmyBOgsLI68l2M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=K6rvPubHTfRINJC7U47ALqb2C/jggDCDwQLhf06+CGe1b7S/NUJkaheK98AoWRQPNxvbh7m/VAK8C3klevsqo60pITjrjCKl9JsKT5w76VJvtqHmJbJppCs8/re2Oa/REMemAqHj/S8RkfOMnhSg6Vk5vBzTO/Namuu3bpOLpAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zEVipC7L; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zEVipC7L"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7395d07a3dcso4139478b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 07:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745938633; x=1746543433; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TB43dZ4ujKYVL5yH6f+GKwT+k67GpAb3MV7+vj+l10M=;
        b=zEVipC7LndMYRJs66BZX3e2FzgbctplqRYk2Yoa/AeS1lvF/hSHan6TGTZUv3jSdTE
         7PeN1orp3JtpP2+OFrH7SSNDbUl82rBQ+z2/87pLDP+ZPyyk/7wC4dMITbqR3OEmwfn/
         yizEXXbkVzsVgjyfuhI77AS1jzSRDIgR+518T4dcihv7q2JCIBSaJ2UXjBT6f3KbEqY+
         dxx/k25zBkSQQkkkEE4uYYaxYTcdNd+J723SXuEutnV0UkqAbqeHN3wiNEjt2TH8S4rM
         tZp0cOhxPAiYC+rn5OFa7rPJZ8O4skUNMo+4K/GF7no0/mzL4QO2NB+BOGVQiOYcrrs1
         LnbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745938633; x=1746543433;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TB43dZ4ujKYVL5yH6f+GKwT+k67GpAb3MV7+vj+l10M=;
        b=CHQhZCbUB9BHXX0uBqQHysBxy95S+sr3TtMX2YjdeEpOu+0q1l0yNnlbUdSVbcmNUS
         dCOj0ckR/RA9C33eNOQeaH1n0aQPs5dm/cdUafvPI3XwXHsYeXC+g1iEDh/G17u4NNV9
         OpErRz1ayp0Fky7EtGNsGNJdmeysA+EhsjxNUfCC5RI1J2Ajm2FoLiHkVmXdxEyWNYbj
         GrDQGUTaDkv/uOscffy7E/hMXqBOzF9bzc7AnrXAKMqLJAnuixwlsUxsphs172OVi7p+
         jhoqc6HaMdlujCXSsm7YZw3QbmRlWLMqX9pG9QW0hTgQdnyVcK/0WTO2cGTs8SCMQv+a
         7OYg==
X-Forwarded-Encrypted: i=1; AJvYcCX6H3ZfC59kV3TOBZxhgAtPTdKb1BePe9J7/q6tfJ574gqXwPXt4gn5scY759NB7jG+GzrPoWH1Ud2bjhQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YysmGwNn0CLdaxwrGbUJmMAX5q2MUo7oCgeXIwHp0bMW56eK8D9
	6A0JSuFCpvrEmQOMrGoMmqZa9epIn17ghROykbOD6NuGxlpd9xXBRiVJhdVWwpPTwFLTb/KnFtP
	zig==
X-Google-Smtp-Source: AGHT+IFvUz4j9goI4AfIal5aVOI3Op9qWLAmmNjkH6AEijmG7O4ajG3tpIdGIyQ/2zTowTeP0K8nQOPnXyI=
X-Received: from pfbgl7.prod.google.com ([2002:a05:6a00:84c7:b0:736:5012:3564])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:10d1:b0:739:4a30:b902
 with SMTP id d2e1a72fcca58-7402710cc5emr5417993b3a.2.1745938633185; Tue, 29
 Apr 2025 07:57:13 -0700 (PDT)
Date: Tue, 29 Apr 2025 07:57:11 -0700
In-Reply-To: <20250428215952.1332985-3-carlos.bilbao@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250428215952.1332985-1-carlos.bilbao@kernel.org> <20250428215952.1332985-3-carlos.bilbao@kernel.org>
Message-ID: <aBDox0dlo6S7KzSI@google.com>
Subject: Re: [PATCH v2 2/2] x86/panic: Add x86_panic_handler as default
 post-panic behavior
From: Sean Christopherson <seanjc@google.com>
To: carlos.bilbao@kernel.org
Cc: tglx@linutronix.de, jan.glauber@gmail.com, bilbao@vt.edu, pmladek@suse.com, 
	akpm@linux-foundation.org, jani.nikula@intel.com, 
	linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, 
	takakura@valinux.co.jp, john.ogness@linutronix.de
Content-Type: text/plain; charset="us-ascii"

On Mon, Apr 28, 2025, carlos.bilbao@kernel.org wrote:
> From: Carlos Bilbao <carlos.bilbao@kernel.org>
> 
> Add function x86_panic_handler() as the default behavior for x86 for
> post-panic stage via panic_set_handling(). Instead of busy-wait loop, it
> will halt if there's no console to save CPU cycles.
> 
> Signed-off-by: Carlos Bilbao (DigitalOcean) <carlos.bilbao@kernel.org>
> ---
>  arch/x86/kernel/setup.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> index 9d2a13b37833..3bfef55e9adb 100644
> --- a/arch/x86/kernel/setup.c
> +++ b/arch/x86/kernel/setup.c
> @@ -16,6 +16,7 @@
>  #include <linux/initrd.h>
>  #include <linux/iscsi_ibft.h>
>  #include <linux/memblock.h>
> +#include <linux/panic.h>
>  #include <linux/panic_notifier.h>
>  #include <linux/pci.h>
>  #include <linux/root_dev.h>
> @@ -837,6 +838,15 @@ static void __init x86_report_nx(void)
>  	}
>  }
>  
> +

Spurious newline.

> +static void x86_panic_handler(void)
> +{
> +	if (console_trylock()) {

A comment here would be very helpful.  Even with the changelog saying "if there's
no console", as an unfamiliar reader of console code, I have zero idea why being
able to lock the console is an effective test for no console.

> +		console_unlock();
> +		safe_halt();
> +	}
> +}
