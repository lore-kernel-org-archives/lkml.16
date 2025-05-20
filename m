Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DD225A334
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 18:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747767600; cv=none; b=NTFRM5AZ8UB3J5bO0jwQVhEYOBHJy/1D1vB4Z3pGcCjrMi2u2hsuibAfjl4tIhBbm2+LWT/91UU3IHnu4hGv4Ty0Ud+HY31dy0saqZU9akQWLjOPyT3yhSkxGJqTQfQ3lwfLPVEsxEPUVBiabSD7r27iqwioRWCpgdMFQtd7u50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747767600; c=relaxed/simple;
	bh=pm0N4KqimJM2q5oKpFTCB6IWl6vayRKp0yJfHFkSReI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ifJZKKjawHwfdWwPRuMJ+dKJsKLDNVNIXuj0HNpBmfrGtesxwJzF4QYeiZ7M1zb8/bfaZDiZmHURGXx56Mwt4HQH11GsnY6x9qSqij+wLQzpsz2AUKJQK9u+8vv97/M70Dz5Zm1j45lCDSgiWRHdmTDon0ZPGORYJeFs9+VQZ2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VoxI443M; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VoxI443M"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-742c73f82dfso2530142b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 11:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747767597; x=1748372397; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QCFeaFE9p5xYmCud9mGS54r/EjOthwHhG8Iy4AQvJ+g=;
        b=VoxI443Mlu0tCypxvCAZo8Rp5YXClPCifBkNwMS3BX2LXYuCTx4rTxz2XGt5kcQsax
         5WMvR+/ZyTPhkCGxJ7rL1NYaYGc76PfgB+J0cXwrMULgS0VYmbjnGz4SEfc3UbozyAXN
         fCjeczMhS7USzpCpMj9oxYvG2Q/C/727sACDQFhw4W5N54yVnYXEjaDKnYiF12jXtXGD
         nG1IERxFbiTP51eY/OlKyWg+nEmfcMIKgdiXPJUn1qbqmWOp+BjeymANxXMu1jmVsyz/
         DHpYPoOurfI/yYJsYTZBWwO6uR00EJGlwEJWMqnWkC44uaSFm0XtdLQot15yF+sc477p
         ltEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747767597; x=1748372397;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QCFeaFE9p5xYmCud9mGS54r/EjOthwHhG8Iy4AQvJ+g=;
        b=EiaRYq6Ff2CN7paa9BWotwC6eq0adIxsJ0ZxGEk8bAsyHf44RPQXTq6s2XRfgrDFGl
         I44zYfO02kdZCSi8q7of8AncJ9vcIQng35u+7eBGptJ1So0ypQjS0qRzSFc0zUW7p0/7
         zvVEP/ISej1ieNrTb6wEex1vprZytXbLOo590eSUVaxHOEWToE4PGGt1bRS7qqNN9u3h
         YUZrCPqsZ7WKi+exuFJcq6VDHKS2tEsbmfa6IBkADwVgtQSd9uNqXvzjqxxBQEfEkNvZ
         hakQ6xJep5uXiqTH7HnQe2HucY58eWUrS9u3UhAth/ZRjqoflgDhuYPf7dGka+Eou1Gk
         nhvQ==
X-Gm-Message-State: AOJu0YyzNjx6Df5fPqtHTpDCZ3QCzKMaj29+R6CYNgNwnJt6vImvLKep
	l25n1x9m5s7KP/YT/R0hmSbdbeIzkrjT3TFdYT46f3TQJEQSZOkhbtD84ZcGwQql
X-Gm-Gg: ASbGncurjy1adtq0z9U/WzM79nnNisqNoa/svMqTL+2JHioaAm7Pi6SgaqrEgvyFtG7
	E3Ikc6eJFhxauEyB9ZfSr9u5lDOQDUHB9uK1FFX59GGip4T9tQnPfuKftoZh8AbgqVlisVctj4b
	KSm64hisutxnqLUBaT+QdzMCvt/q+NJ1feagLeUx9kJLiIOVTWes96u+T5iT8NQRlXi8csVgb9+
	9jtS11SYooRLDF4JvV4xJCgWHhdFksj5nxjqSw7ZHlMyYTBuxIJoHEIArqALFEsrW6omYpgezuz
	/+hJe6OvQ9pJbC2haFGXIX4Xn3RS3iUfs6pzxiTrwJIOJPHmgNB++/k6hcXbwCNs
X-Google-Smtp-Source: AGHT+IG6WhsRsT+fgNhzBA3ZelrE8DCiEzUzSxS2m1eG+NRTf0tOBkFisri6SwJDsxVLboEe2jvrwg==
X-Received: by 2002:a05:6a00:2da5:b0:736:32d2:aa82 with SMTP id d2e1a72fcca58-742a98d4943mr24196150b3a.23.1747767597075;
        Tue, 20 May 2025 11:59:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9871500sm8437126b3a.131.2025.05.20.11.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 11:59:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 20 May 2025 11:59:55 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Linux 6.15-rc7
Message-ID: <d097c63c-a475-452c-b3ac-7439b80b92d4@roeck-us.net>
References: <CAHk-=whtwpdL9e_5j1oq8C=1EZud_cXerZeHqe5L8y7wG+34EA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whtwpdL9e_5j1oq8C=1EZud_cXerZeHqe5L8y7wG+34EA@mail.gmail.com>

On Sun, May 18, 2025 at 02:19:03PM -0700, Linus Torvalds wrote:
> So last week was reasonably uneventful, although I do wish we had a
> bit less churn. In particular, we had another run of CPU bug
> mitigations, which always adds some fun to the workday. Not. But the
> fallout seems to have been fairly well contained this time.
> 
> Aside from that, some drm Xe fixes stand out, and there's a slightly
> bigger patch for sched-ext. The rest looks quite small and harmless.
> 
> So while I wish we hadn't had some of the excitement of last week, on
> the whole it all still looks pretty solid, and unless something
> strange happens I'll do the final 6.15 release next weekend.
> 

From my testbed:

Build results:
	total: 162 pass: 162 fail: 0
Qemu test results:
	total: 633 pass: 633 fail: 0
Unit test results:
	pass: 592633 fail: 0

Guenter
