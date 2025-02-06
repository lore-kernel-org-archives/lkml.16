Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14818226165
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 09:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738834033; cv=none; b=JarCCxsG18965SwthpDR3kR6ZJ5oM2TbUg9U4BD7mWvFnppshtGV0Fr2RHEaLsVz1O/+0nRSsW+FJFKeBG1RKz8K3ahE09kDUGiLh6FqEuEFNF1sv4vjf52OrhFn6n6VF5V92Q+vSbuz8TCrbEUj5LRDtfRuJI4bjZ8YIwQcT/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738834033; c=relaxed/simple;
	bh=lP8L6P99Da7P5rOznCiD8xPrVuKAMRimkUUQabFUPq8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lZNsHWr9hVmNHVINCHgplg0pL9i045as5JTWI8Hkac5RYlgx+gDpA6hiboaSgGlc6eWmcNOvUfgsCAz+zf41zFv5em/4EoPw1KN7dihi3nv3k7ifBK1TcEGjuOD5Ikqcj/XijFidJ6mKva5T+ZMfO6XlqfZeHH5mzncpPkoxLqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk; spf=pass smtp.mailfrom=rasmusvillemoes.dk; dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b=TH0TLVUJ; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="TH0TLVUJ"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30227ccf803so5761811fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 01:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1738834029; x=1739438829; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lP8L6P99Da7P5rOznCiD8xPrVuKAMRimkUUQabFUPq8=;
        b=TH0TLVUJozoM+l8rA7x6uprvrppR9ob008u3V/WitQQISEizgqD5C0tis9Jupnx/b8
         0QEMp7hSmBeBCbBvEoMGoGEpb/tITgsUXcL6mpvMaxux7C9EeC1krxIBpe0nU+D1efGJ
         oW3uV4L1wRykG1IqzPFJcSxd56zNut41yKqpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738834029; x=1739438829;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lP8L6P99Da7P5rOznCiD8xPrVuKAMRimkUUQabFUPq8=;
        b=wcZuopBpHQj73l23AzG+Ex7mwulEZVvFP03wCDI2MRbxWW7ewKa3lNmaw4/Sko3Rn2
         KHXonVU5XfwgnGlSBstsIiQdZfmX21t3eA1XrC39dNdRhy6w8HJZ0IA7U3rWPvsq/1Ia
         B/XEBxCGUtbNTkNpdf3j31IHawW0Avle+Bcv3x7t6aqGD8AHIq3/LHSj/3iMdFMEbhWg
         SyGwE+otj9At/Lu3YCJpzfiG7mfXtMm8eR6HVFh/MK+GAf+XVwQJ+kFM5gB8MQDUYfMT
         RZsZo3KxJY1QL3F4QugMWJl9BojmDpkazqFSfW0FaF0aluSEKkJDd3+2Fe6qcbNLQlV6
         rKHA==
X-Forwarded-Encrypted: i=1; AJvYcCXZybllXYvum9qMTMgiX+CnTp/u1jZyxNIT2HeD7UXWO+Zx8PuS3uS+zERhW4Jys1jMVDf/QGifPD9xj60=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzyfm95XbjiONdMFpiJ7Ok90aq0JgGKtxGa9kmPmX6S4eHZOTD
	Yc9/WXDpiZSbzIzN71npVoPyvZrQMmAZLQ/83TuIWKwImtTH4kvwccYj18rqYHB4IRcOozFgooD
	f+FxGU5DfLbjjaJChtDSrNpxUCvs+DsZhlj3oQw==
X-Gm-Gg: ASbGncvi6nD06+HO/4AHYtQlxl3ky52Cx/dnIHXOZUusjqFFfUQZuBtmjNOXSD6X+HM
	jgDn2aJikTqc8OJPRyDbX60C1VH63qFsiY6nmCbeoXAR44IWnv/btbbhDmPCBAOADkM3Mch8V
X-Google-Smtp-Source: AGHT+IHPnewXkffAiBGcrtmcy3j3cfhDwZ+2SPwIiAKww3nKVPkKcTuwbR6xs8hTWb+0K5c2LwrluhW6I8eg+D5eWiY=
X-Received: by 2002:a05:651c:249:b0:302:17e7:e16d with SMTP id
 38308e7fff4ca-307cf2e7ab2mr21136871fa.3.1738834029088; Thu, 06 Feb 2025
 01:27:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250204-printf-kunit-convert-v1-0-ecf1b846a4de@gmail.com>
In-Reply-To: <20250204-printf-kunit-convert-v1-0-ecf1b846a4de@gmail.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Date: Thu, 6 Feb 2025 10:26:57 +0100
X-Gm-Features: AWEUYZnFSg2BHwTqUgiMh-7R8tClcKx1qxbeUbsIzoGqPOf06jI3u33zNtE0gIg
Message-ID: <CAKwiHFi6SUCT7UjUTdKmLJ8kiAEqVg=d6ND60R05MJB85Eoj9w@mail.gmail.com>
Subject: Re: [PATCH 0/2] printf: convert self-test to KUnit
To: Tamir Duberstein <tamird@gmail.com>
Cc: David Gow <davidgow@google.com>, Petr Mladek <pmladek@suse.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 4 Feb 2025 at 20:36, Tamir Duberstein <tamird@gmail.com> wrote:
>
> This is one of just 3 remaining "Test Module" kselftests (the others
> being bitmap and scanf), the rest having been converted to KUnit.
>
> I tested this using:
>
> $ tools/testing/kunit/kunit.py run --arch arm64 --make_options LLVM=1 printf
>
> I have also sent out a series converting scanf[0].
>
> Link: https://lore.kernel.org/all/20250204-scanf-kunit-convert-v3-0-386d7c3ee714@gmail.com/T/#u [0]
>

Sorry, but NAK, not in this form.

Please read the previous threads to understand what is wrong with this
mechanical approach. Not only is it wrong, it also actively makes the
test suite much less useful.

https://lore.kernel.org/lkml/f408efbd-10f7-f1dd-9baa-0f1233cafffc@rasmusvillemoes.dk/
https://lore.kernel.org/lkml/876cc862-56f1-7330-f988-0248bec2fbad@rasmusvillemoes.dk/
https://lore.kernel.org/lkml/0ab618c7-8c5c-00ae-8e08-0c1b99f3bf5c@rasmusvillemoes.dk/

I think the previous attempt was close to something acceptable (around
https://lore.kernel.org/lkml/57976ff4-7845-d721-ced1-1fe439000a9b@rasmusvillemoes.dk/),
but I don't know what happened to it.

Rasmus
