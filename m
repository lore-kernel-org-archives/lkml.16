Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA1541760
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 21:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748468579; cv=none; b=YRCSUCrUben1I42tF1DVlQBO9zClDK1LXaYbJMtcO/FO/O8MB2q6TO4Rl+ZGoCzPHfOciHs85k4zOg6ZJV9lG14xHe+gtxzc7RnaefkmeGaJLExN3hNlQuFiu1Hrmj8T3dy8sojtFOia6/5QDTB+TA5ulvUeX5JfoqqHFZsQdXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748468579; c=relaxed/simple;
	bh=5SEO4Lii/dO1ErTWQYUDBUHArBBPtFeRt2gLsxAsbww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YVskY7FzWeDpx4OgBvikMFWVMZMGgcHaMAju/ShofhfGT5GyYfJRT9HkuLh0kzCp5I2lxJydKwifssnI6zGnNxonjkCqWS8GVXOfnwSgeATC4fRTQXJ05jq330PrHM7gPUUHAoay3Fsd/9tlJGXvlEfTeg3slVcBA5QA0gADwmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=hPYc7XV+; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="hPYc7XV+"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ad5273c1fd7so41947066b.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 14:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1748468574; x=1749073374; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F3HkVKIWy8f2uOrQhhKClido3q4z9FPIBYGEy/T4RDY=;
        b=hPYc7XV+3pFI24+qQ6+iSSqEB93hIhHX3+HK2/jfhca+uyDrImL1av05GxpPBl6mf7
         yyvjZWVDF9HmG8/bv6M3niqD0otCYGsNUfiLwGtQcw2xKQJOeyjQrCNSckm/GSqxhsPy
         NstKli8d65ZOe6OpIqqcFYPsPKe3owFsI1O/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748468574; x=1749073374;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F3HkVKIWy8f2uOrQhhKClido3q4z9FPIBYGEy/T4RDY=;
        b=fUxTWHBCiH2R9htzDKSKzIItGFEH4E7zWbGmM2GlBHraPy4GRP1kCbpaCRGRgKUkiv
         p5k8PgHbwDXn8N1VOMsnYPHRFOCvsPR9PgsrPs4zgDoqOf09PDZ3qrn1wIjmdU/hENNX
         MMWapNTaAXNxB9fEABTHvlgpEYz1qhorxLeIL20PwvY+Z1fyv9AXXT8gxH8acRbwLyI8
         IiqKYGervs0uENLCggR56pQvHq5xeHXP74X8GJ2DdW+sanlo9Hdu8Ru8dLVTUZe9uipU
         TdkeBtQlpgTTQS6etWOvf+8Ov5L/Z1Rdd7cCOnR0MIR+R6sf/fb4SHfDzN8dCcqBbURW
         fP6Q==
X-Gm-Message-State: AOJu0YyD8KtwETHuGeb7D+QDlPn83A2Va1kTJw915Sv0hmHSgn7Xx0+J
	ruVIfVb20UG2E2v9AecYhPOYBJ0ado/SVPnsSxUbntq/WqG3XZlDcNytwWWJThx/kUdy49Vb3zS
	ULz/gZlA=
X-Gm-Gg: ASbGncuKYMExpaON+ukfHuWuQ1KAg93Yq0roIp/v5lL/qw6AtCwDIYGkjH4CzT4do9B
	c5LUzbg4Mm1gW+oYu7CXRbEO4orARpu/AQ+rlztQtGm1VbMN+wg20B3KprO5JcTvVU3LLljfvjN
	IEDicFZcpCsHhmEk/jPYdBhtk2AJZoTTnSlG17PTx5wfnDJ07Ox4bS86Gm7f2Tuzxb3UEccj7NH
	OvC9a9cMOMbfDIMG4Rv2r9XRDF6EyYZuPJY4+cSaFy4RnR4vvBmK7OYtML+JBVj3P2bEizHyw2a
	QGdSsEAjtZJ0gIUj3UsEKGR3eGEbFbpWlgj2XdxhmmEslBE1q/Rx6aZZuNVPSF4819TcBoSBKT/
	TIZ5dj39inibyx063je4sea8K5YQeJJtkvjDU
X-Google-Smtp-Source: AGHT+IHU50JzDeher6U7Sj4qtwlM7n1WrYNI7tNsEW2du8vXaKoPt4B/YiLnojgmEX9fl3gBpUHLtQ==
X-Received: by 2002:a17:907:3c8e:b0:ad9:f54f:70a2 with SMTP id a640c23a62f3a-ad9f54f7193mr29247366b.22.1748468574028;
        Wed, 28 May 2025 14:42:54 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad6a84dsm5437266b.162.2025.05.28.14.42.52
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 14:42:52 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ad5273c1fd7so41943966b.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 14:42:52 -0700 (PDT)
X-Received: by 2002:a17:906:dc8a:b0:ad2:2fdd:fef2 with SMTP id
 a640c23a62f3a-ad85b27959amr1686791966b.53.1748468572584; Wed, 28 May 2025
 14:42:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aDYMkVGnByTn6HBQ@yury>
In-Reply-To: <aDYMkVGnByTn6HBQ@yury>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 28 May 2025 14:42:36 -0700
X-Gmail-Original-Message-ID: <CAHk-=whi6O47-0r=eOJHnd1ACa83Kd-aaELi=Tw4p4HwJ74q2w@mail.gmail.com>
X-Gm-Features: AX0GCFuXsEL24gGxqfSuC-fjFFuIPbV9XNmmcuRKPnT3ULibMV1e6RdKmOAW9T8
Message-ID: <CAHk-=whi6O47-0r=eOJHnd1ACa83Kd-aaELi=Tw4p4HwJ74q2w@mail.gmail.com>
Subject: Re: [GIT PULL] bitmap fixes for 6.16
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Luo Jie <quic_luoj@quicinc.com>, 
	Andrea Righi <arighi@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 May 2025 at 12:03, Yury Norov <yury.norov@gmail.com> wrote:
>
> Please notice I changed my pgp key.

Well, I'm not finding your new key anywhere, so I can't even check
that the new key is signed with the old one.

So I can't pull this.

               Linus
