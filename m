Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9849F263F20
	for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 22:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743028915; cv=none; b=R++OWC+Yxo7N8seH4xHhMil5H6pIAHIVH/FM9X4HY+1rBRBF0EaVe5NUKIeYj5uCzrKrLJVsa+Os/3n9YOqNnL1Vh3CaPtRe0UNu5gsD7Z0QKST2xXzZSa5y3vpi85ag5mKqX1LXS+FVx5wQh0sqtIhBPqHLxQAhUewujjDgEvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743028915; c=relaxed/simple;
	bh=tmaH+3YPGuLoi/3X44ITjHuWcR3F46JKpcVfWvhcJH0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MQbzOU3GBdaEPPXbfVsM8SeCPV0FF6St/lKLHpuk4kHBXuGxSFx13HDl889EO95itusXUlrRl6UMH3aDKYFi0Q9/EheD27SaYeGmXSe8wNfmynn1Ls/SyALycz6fXsg3KRAPeR8P43ak4cANFu26Ug7q+Sp+eMlaOMIrsLjOSOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ReQC449N; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ReQC449N"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso71935566b.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 15:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743028911; x=1743633711; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HIsAwdBBYfPSxKw2X4bvTfKKiRWcts7FEK1QYHHkrFs=;
        b=ReQC449NseeJGhn8J693F2P3b7fqk9SnwnfmxR+xZcFHmKCxfuAQrIBfYAS5xoDtdy
         e8Q1kaRj4dNWBKHwx1iENTruqAdSUblNpfw/5JGwKulBOMYcZtzD+zNelKv+rEGEYnB9
         prjwRkrfJBCUMq0eFHk+fHFd0bg8ILjqllqww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743028911; x=1743633711;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HIsAwdBBYfPSxKw2X4bvTfKKiRWcts7FEK1QYHHkrFs=;
        b=IL264VUYaiqG7Gw6P2Lseer8QPLVqBgj7Y5ktcfHQCT+iHH3LzBTrAyihqu+XolBcR
         awIm1OVujS/LfwmAEwcJ5PM3gvQUPAR8Qhta7KJMvfXlwJZYTyNeCQf0zUzwa1XXpqor
         rjKIfGNGcHUSnw2wbzemTWjYFmScCG1XomOy/ulQLxTrmrZt8i40y+9kQp5i5+DZRjvo
         +CtACJgQknz5KH7XSb9a0oyRxqSW50IEpXqKQ6v8C/YkBezLg93pt55UmbYOi0ZCYibQ
         vuACAVJm5nck72N7m7QDyo/xvHxEJX2jvQLuskPLrUL45GEKRZniJwvpBUePUWFdaEV0
         Ay0g==
X-Forwarded-Encrypted: i=1; AJvYcCWMQgVSzFApwQ68sXlgaWq0/kmX+YHQHbzHfFhs7Qpw4mOFKgV7mKOTTBr4BSC1hM4yMUr95CPaSLl8Jhg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbnzISVf4L6/Z22n+/n0qTP4eikyIfHc6b2XQMjnvTfKbDLN9M
	ZOUlMzt6CTCk2tzy2zbeQ8Zc201AeH8YBa0iJgbLe52g6FZLM1A3T7yJOrtYU0DKqlGKHj/twhz
	JCwo=
X-Gm-Gg: ASbGncuI9Xf9PwZdBnKYhjrutA0bWlUJ4LHCghnMgVcWRzWVE40MhYdD6fLX/OV0d3t
	tyh0MQjtreh2D3V0q9TgHunrr76A8PFhMXtpt8G3OZeE2bdBH7MUQA/0lw1yThFCBquXvmT6YjM
	BtHQcdooarrVUd1Mx+jR1JgMN7wqQTAOzwOeJeMqPzcLrNB+1vGwfOxQZNjL2eOZH2TBa3hxupn
	n+sxBOvMt6AJG4gde1oDRDblVe1q7J8tf41U+UJIIwEZwwqdcGNwYwYCMTrT4zcx2YklJM1kMR4
	tCIuubIckVNpX1aw7t8KDJendYTHqfU0CT0RrV0zRObLNaT7rnctGWx5WSlUzOyi/JtSzDMWioE
	uOZEjkFdEPAWlEIfXNQKU/FRLz/36kQ==
X-Google-Smtp-Source: AGHT+IFtKBPkZB+ucSjvx1Uq1Gzfj0n+kYeEVrzugD+zG1tL+47DYWup9Vl4Ww3lDMOuBKpuoEJwvQ==
X-Received: by 2002:a17:907:9611:b0:ac2:7d72:c2aa with SMTP id a640c23a62f3a-ac6fb1bd18dmr94542266b.51.1743028911522;
        Wed, 26 Mar 2025 15:41:51 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef8d39basm1103587366b.44.2025.03.26.15.41.50
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 15:41:50 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso71930566b.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 15:41:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWGdvQdqy/g4Mgt6tUNzd2WuMLOizcJ3PK1nLBIZ+fb2jMBWrrhGe0kUcSK6mYZAGl+IVuXs+Z0uIEky+A=@vger.kernel.org
X-Received: by 2002:a17:907:d1a:b0:ac4:3d4:50b with SMTP id
 a640c23a62f3a-ac6faf4bc92mr92400166b.32.1743028910518; Wed, 26 Mar 2025
 15:41:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326-rwaat-fix-v1-1-600f411eaf23@google.com> <4b412238-b20a-4346-bf67-f31df0a9f259@app.fastmail.com>
In-Reply-To: <4b412238-b20a-4346-bf67-f31df0a9f259@app.fastmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 26 Mar 2025 15:41:34 -0700
X-Gmail-Original-Message-ID: <CAHk-=wikuhxhdSEgqb-Lkb2ibQM_hAHR1Cu7yxg-gHZu1NF+ug@mail.gmail.com>
X-Gm-Features: AQ5f1JrEsmQAOCm7pL6ucQGxLbFedCV1cucSaJ5TtT64ECZtdWuo9mNf3TsYhHg
Message-ID: <CAHk-=wikuhxhdSEgqb-Lkb2ibQM_hAHR1Cu7yxg-gHZu1NF+ug@mail.gmail.com>
Subject: Re: [PATCH] rwonce: fix crash by removing READ_ONCE() for unaligned read
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jann Horn <jannh@google.com>, Marco Elver <elver@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Linux-Arch <linux-arch@vger.kernel.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Mar 2025 at 14:24, Arnd Bergmann <arnd@arndb.de> wrote:
>
> I've applied this on top of the asm-generic branch, but I just sent
> the pull request with the regression to Linus an hour ago.
>
> I'll try to get a new pull request out tomorrow.

I will ignore that pull request, and wait for your updated one.

That said, this whole thing worries me. The fact that the compiler
magically makes READ_ONCE() require alignment that it normally doesn't
require seems like a bug waiting to happen somewhere else.

Because I do think that we might want READ_ONCE() on unaligned data in
general. Should said places generally use "get_unaligned()"? Sure. And
are unaligned accesses potentially non-atomic anyway because of
hardware? Also sure.

But one reason for READ_ONCE() isn't for some kind of hardware
atomicity, it is to avoid any ToCToU issues due to compilers doing bad
things.

And then this seems to be a serious issue with the whole "READ_ONCE()
now requires alignment that it didn't require before".

Put another way: I wonder what other cases may lurk around this all...

           Linus
