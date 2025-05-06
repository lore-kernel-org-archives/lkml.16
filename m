Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC6E284B37
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 13:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746537631; cv=none; b=RDCCp8eRdP9OSHcafzROFYiuQUdrSULNqYRhSwSF0sV/5h8hBKou1/wSdUVV7INFh6N7CjHW2xntvoVC7k3225Q3Cgf9ElUkQmxZvXfxub54C8ssYYi8r9XeKlRDAQpDT7zPFBa557GB5ADPjZtBvjBCryXpRBEWSYoZCjtnIsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746537631; c=relaxed/simple;
	bh=4DeN/DPKw5wRuHPLDO0TZYd7KmFT2iB1A89ex9ARX5Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lL0m5ATaEBA/edQumUaaSjwGhoFKSeIBZdPTL7VYql0p+uvnwxO7DP2E9J44iWR7d6+zAcCX/SJPjF7Lpp4W4gAVNgDTLhwKV7am1T1Eek4CUxoKxztjJu5bbs/f3NfqxhkN8RQ1tfoJNWlP7gl7m8Y6RVztM+trEgWBOH2XIvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f1mHoExS; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f1mHoExS"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d00017e9dso30050185e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 06:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746537627; x=1747142427; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oIiqBCWX5MzqP0t3XcVAZebiA0Ed8DRzeZF9xiXf3Ao=;
        b=f1mHoExS12v/NMYUmhq8pfz8YhfgyBVbDf7zu1NTk+DMUQAVi4qvpvJfFzmFMetQg2
         KinJmYCU1htuG9ofGwTCJaSrVRpuiRZcByvuTlHgJ6XSd2LwzCU78gMZZJXFLCQQhq65
         AMFicP9gJkWbS8t21A8aS5QWbplA5C6vhk5unHs6mxwJ/Zkhdqvmpsdm5xfeRIX/EN68
         Snm10g2i0uCxl1tHBjUrWdNuh3066f6KsxJ1LwR2drybZXJ3mZKinj+eIks+NhR4034s
         LNLKzo3T1WxI+Yhoj5YLFqpFzMGH6btwaz/RyH1dPJsFG+t6k9XLFYGnh/R2tZoc0FKF
         u8uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746537627; x=1747142427;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oIiqBCWX5MzqP0t3XcVAZebiA0Ed8DRzeZF9xiXf3Ao=;
        b=U0YzxSmngRdt18O/rk78g4DBhiADrD9pneYYVoIvMStlVkPzOewILfROlukmAYkc66
         5sNfwckBhMg86tugDMFBCxPdDZUH/Ez4ys01PGpKG+phPxoSoPK2wRooubsgFQv5Pgp9
         1QKKfPieCm/b6SxSjnSIUdFnH9r0HbZNIY2HHXFWkixhxIFRn4fSaG67cS3WSsdHd0Kc
         uB5bU0sW4Cl7Nlf0nqhcNEbM19joSNmBuLegS6F3Erbhxu4ZcJ8d2hnmF7k1IsaWi3ZV
         VVmnB0TKa4iVIsd8+5Y2nZANOD4wpeCEatpGHanuxRKNBrgF9x9PyvwGnyLhIaJIoUgY
         HYxw==
X-Forwarded-Encrypted: i=1; AJvYcCV25RbJ4Q8NYChG5R8sfewT/ztMA3LjlYxVL7fKPYTpujQM06D0RNQuvrSpZEi5kXW2+LaJBjw1Tx4JtyY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwIoEF0KgmeL4FMTGeq5I+iYFbQb3o1YvARgqPK9WaCPebmwkv
	3+6uuvSAWu5KSLrEdmJHbAEUsDblJ1SF/GiqdDlzKNKp7vcfVxYHW1VSQQCY9Pi10rQFZxJ9YEb
	nelDeaa6Zbw==
X-Google-Smtp-Source: AGHT+IFY78pcCTbbccXODWSDVdP1qDT1isRm3G/s4SH8FJC+JVpZUwNfnB50fPQ1ngFDis6ebOiU9A1BaDFDbw==
X-Received: from wmbjg12.prod.google.com ([2002:a05:600c:a00c:b0:43c:eaf6:525e])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3e05:b0:43c:e467:d6ce with SMTP id 5b1f17b1804b1-441d0fbd329mr28022185e9.4.1746537627644;
 Tue, 06 May 2025 06:20:27 -0700 (PDT)
Date: Tue, 06 May 2025 13:20:25 +0000
In-Reply-To: <20250506112509.905147-2-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250506112509.905147-1-kirill.shutemov@linux.intel.com> <20250506112509.905147-2-kirill.shutemov@linux.intel.com>
X-Mailer: aerc 0.20.0
Message-ID: <D9P3X0NLQMW5.1J74MJ7FDRBFB@google.com>
Subject: Re: [PATCH 1/2] mm/page_alloc: Ensure try_alloc_pages() plays well
 with unaccepted memory
From: Brendan Jackman <jackmanb@google.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, <akpm@linux-foundation.org>, 
	<vbabka@suse.cz>, <surenb@google.com>, <mhocko@suse.com>, 
	<hannes@cmpxchg.org>, <bp@alien8.de>, <tglx@linutronix.de>, 
	<david@redhat.com>
Cc: <ast@kernel.org>, <linux-mm@kvack.org>, <linux-coco@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue May 6, 2025 at 11:25 AM UTC, Kirill A. Shutemov wrote:
> +	/* Bailout, since try_to_accept_memory_one() needs to take a lock */
> +	if (alloc_flags & ALLOC_TRYLOCK)
> +		return false;
> +

Quick lazy question: why don't we just trylock it like we do for the zone
lock?
