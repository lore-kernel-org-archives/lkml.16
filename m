Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16E92E11B1
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 11:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749902361; cv=none; b=h7ksVaRizDDa064kZRuYoDTvotZixecZG1SQYBRCosvAULgMXiSIMdLvU4rGwM0QHM1/1kSU9pkCaCEUs7RRzyXxOB8/6y4uur75ZqPtJhKSDkEJhmkL/4ez/1n/SgycLgmXO/wRHtT5uK7tlKzugC33O3Q9EXoOaMZiVRRb8q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749902361; c=relaxed/simple;
	bh=wBzE2EHPtyHc75AYeaULeQlJUSUA6FHUYHxea0mGT94=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IgW1J1zQKlzF1OZ+QCMoRSZVJFFj+0DIaSQIsmpws92RdAzUPRR0EmASP4sG9Q+NOv9ON+XhJ76CS8cKR58VtW9kQazxUH7012j0mu+3cTfdAHgFdQY7wlbRJil+QuSl34zOaVnlzRH5LjB+WA74cxUbjxasuCz/6nBeB42oZHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RYA48r4O; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RYA48r4O"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a54690d369so3106096f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 04:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749902357; x=1750507157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZ0/zdO6kfvC4q8BYm2PzpUjPMDJ34hUfrg5+J8SREY=;
        b=RYA48r4Ohqo4Q1iA116Qp/O8lxTGrCIcDNx5CkwZtWjL6GIAmZJs2Nd2uaD0fFv5QO
         KBu3K8vdEuB7zIbUNV8AmT7StEi+rm3HuAZOsPZ3xPekuFp27xgghHiU1mUUec4msJdE
         p9FHPJ3FGAYBZlQGbs0ye6RW9X5FohCLAzAyoebKlU1KTR+nXiI+7raz1hsG3hJ7wCuO
         nmjumRRjcbVZQPr2trY6KnaIrFv7mDhTnxlCfc7sYeOxqwYDaRMM2TWgBd+tdufYrCS5
         IsFiMqrK4XiP/dLVdKhrXodwJzMkEoNPaczWp8sBhsKLJwYbRUy2TuviDSr+RPr3rIHU
         M3ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749902357; x=1750507157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WZ0/zdO6kfvC4q8BYm2PzpUjPMDJ34hUfrg5+J8SREY=;
        b=G7+vlyVUBY2OpuBnXqoOH8SZU8D5aWtFEHLscBpDTDDCeT9GuyisW0Zu9iXk5Gw6ab
         +97Dl+lxiU7AF5yjraJvFwsLj0u3Zlyvw5FmzTcFUOpksEhObrow/wBEruVySO0sXD/W
         52YlL+EATE6fD70LjaOD7sEZ8R6rEhuMmdIfW+kxR8wDKmI309PcgBZ/Bi2mFRJBw9rM
         0yRVhLBM/pH5IuCJOO6RFhhwZ3DiU5DGt2oApQIhdFlWCWBd1nhee2hKeAtsEwJuw9W6
         7qrPezZ/FHWWt008XDcZyPIYuyIyXF7pFUzNyyfOXbi3DmBHC1E9GvFVLvVJ7twocAj2
         e2bQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0Ehg8ES8xx+kOq/RNvAVgp3soPFTepV3FBbCVvsl3qR+V7QW1t9wPuXOmlfIISpFBnFv2fZ6Bs97JhFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVgdwcGq+g0QrM8A5BTRHn/kPsrYYrtb19i9xLx+tt21fortsc
	IV33liWTSI9exKy4fiCA4BQgr+gPxRfzuSIhiHPSdhdC2t3SXL5ZA2pP
X-Gm-Gg: ASbGnct2oMfiz+cK8krd49ZQRhQlvp6PpCFZZrNP0CGdYEHyWcKUpHnB6G5nCNhUEAX
	zX2xBTTUZVkqpjT/p7d4KNEm0qWrjt4cxbkcyxooRYMF/y900/4K0ytaYvMTYAeitL3dv+bSew9
	E7ymX6eQDWKdGaxnTXGdl7FNFZ8XQyPMY3qRy3Z42QsB3e09E752tIH2KJon7ikd5IfHM1LhiwJ
	n8i9PMA45nBxPL8eSEPFX5tkS2z38Ol7xEc2nvG79bJjz8hEdv6g5z70Eb6IAdPiMvJLcvXjScP
	b+Rmm6IHjDerb0NwM4mh9byMZw2sScxahWU5vzjMTqr+9NIugjaaNE0GlLQ3Eqvp6XZQ6qrwR4g
	yMQ7uMhQN98i4cgfqCiCizYIO
X-Google-Smtp-Source: AGHT+IHQtys3ESSxigww1fGEbJ4vj7Dv08KherZRh8KDpuiKla+UZX1mY3jfZKAITEHQh+JK5nQSRg==
X-Received: by 2002:a05:6000:4282:b0:3a5:287b:da02 with SMTP id ffacd0b85a97d-3a5723af791mr2642915f8f.40.1749902356945;
        Sat, 14 Jun 2025 04:59:16 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a7f8f9sm5031271f8f.42.2025.06.14.04.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 04:59:16 -0700 (PDT)
Date: Sat, 14 Jun 2025 12:59:15 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 u.kleine-koenig@baylibre.com, Nicolas Pitre <npitre@baylibre.com>, Oleg
 Nesterov <oleg@redhat.com>, Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3 next 00/10] Implement mul_u64_u64_div_u64_roundup()
Message-ID: <20250614125915.65c77f87@pumpkin>
In-Reply-To: <20250614102717.GK2278213@noisy.programming.kicks-ass.net>
References: <20250614095346.69130-1-david.laight.linux@gmail.com>
	<20250614102717.GK2278213@noisy.programming.kicks-ass.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 14 Jun 2025 12:27:17 +0200
Peter Zijlstra <peterz@infradead.org> wrote:

> On Sat, Jun 14, 2025 at 10:53:36AM +0100, David Laight wrote:
> > The pwm-stm32.c code wants a 'rounding up' version of mul_u64_u64_div_u64().
> > This can be done simply by adding 'divisor - 1' to the 128bit product.
> > Implement mul_u64_add_u64_div_u64(a, b, c, d) = (a * b + c)/d based on the
> > existing code.
> > Define mul_u64_u64_div_u64(a, b, d) as mul_u64_add_u64_div_u64(a, b, 0, d) and
> > mul_u64_u64_div_u64_roundup(a, b, d) as mul_u64_add_u64_div_u64(a, b, d-1, d).  
> 
> Another way to achieve the same would to to expose the remainder of
> mul_u64_64_div_u64(), no?

The optimised paths for small products don't give the remainder.
And you don't want to do the multiply again to generate it.

As well as the conditional increment you'd also need another test
for the quotient overflowing.

Adding 'c' to the product is cheap.

	David
