Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E9B1A83E8
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 19:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747165768; cv=none; b=fpss1C9CgzAGwFHcIcehn8IduQVG/0O2jB8ZU7weUln+YTcGDbDAqeux8zLxTqzMGH1wm2TFm0auL/yWPUKwapwLm0HmWBMxiS/L7uGIFNtkMB96vEQkrryezNb2m+okZBwPYAL/QsnMhvwpUu0jq4mLcSGea9O64q9oY1Iiok0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747165768; c=relaxed/simple;
	bh=ikLxg3MBXkVsTCXyTjrjCIdheWVz7XC4SO91OfvACqc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JGTusXiECRe1K4jRkpXgUqK5gio/73qnyBp7R6jkcba9iEz7psESTo12ZI7aA/Es2sNLLCjQgjXs+WXcsIFzVefVLLSzcreQ9G0EJ8NJTJLRSkPsNiiAq3OmQkjAk9cfwp+CiuLMVCX4KRZq9M7hfPffmyyYIY3ZuatN6fvJqOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=WrEf+sHE; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="WrEf+sHE"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ad241baf856so39698066b.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 12:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1747165765; x=1747770565; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PsvA6fkbEWSeqHZ/fl5+/tjEQUAFgjAIUBszF8f/hiE=;
        b=WrEf+sHEXLW0m6PKpxOZe8xk04NrTYNB7c5rm7tXUCMsHZm8hJw/WCmdFw4rqw5kST
         5iF9VqDtCAbPHb9sneIgkRSdYO8idBPuAu0zJpoXlQLWjPMW/ZguxXM0MpaGSfZ1ixLx
         uD0KXvP2d6CA5ZjTMtJ3vZQYoZbHHrJwwQVWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747165765; x=1747770565;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PsvA6fkbEWSeqHZ/fl5+/tjEQUAFgjAIUBszF8f/hiE=;
        b=jE61ZLGsm7U94zbcBshiZawAaMgcFUwIpAfeOMSXlJxp+IsHcn2qWlx2dudxnCKYAp
         yo1DNO4YKJhpA/W1UXa9kDscBDctAjsSU6HsTEGy8gN1ru3G6Jxt59Wi1AUau8Pv5QUB
         iwT3+YkxzbJ4/l/fDV9dU+DTR/ZVbLW+hVPcIFj3Z1IlpKLcVfCxgWBLmSY4cxDRCerv
         lVuzw49d2NxGg175QQZX4QKzO1d2jXCDYsVwoOs7Q+j2xaIehSNd1A/+VUrrrqWZWeXk
         QH3l4xak7/sn9evJ9/wGB+sJyqWud/AXY/lW5PaMxELfmn8ODNYIUmULSbkAwrcUnTEF
         aN0g==
X-Gm-Message-State: AOJu0YwtNOD9fibKCYl4anek9WewTo/bMmF5U6vpXEfm1e0WGXhFiyac
	nn1U/CqRGVn8ZHy/stj5A11zuHtcYY8crFu+pF4uB45vApie79iRh6JCKbVWhCpFbkzXNiguzKC
	Wo9U=
X-Gm-Gg: ASbGnctOCjRY7MduJQ0CxwleLiw+hzAVCmIYUNV21WUsHnImj/ad2a/74aZEukmu8DM
	QWM+WuhJB7VxblvwCfmTP7zLEboj3l/Z6XqXXqY+fUXZVEhE87mkwxT376f2sTI//Rd9HJjHFgV
	eyCWuX4Zm+N7p9nTBnMyd3b0enZNPoWI6f5l3fMJ+6mLY3uzo8zI+Bq7UumZISNeK0C07asmLJa
	G2PdCofLcyCtjJwmwz1fES998Qfal0bH0hwUsrsQRUEQpcZfc42Sx467sFEa0p8BPXhcbr07szU
	rJoRHUjIU7/Nt47QZJZPentj9nXga2Ypk7goU/7MXcYj3nW1qKJhp42R8swWwokv9Y9AumW6nB9
	lPZ9hlVszPvk/ceaVv97xRc7a2g==
X-Google-Smtp-Source: AGHT+IHpHgbczG7fos2ul35zPK2eSp+E5Ctr+my79CZTPJzFbgz7wlfmPDpj1Pi7QhzZfPhpQQe78Q==
X-Received: by 2002:a17:907:c38e:b0:acb:b9ab:6d75 with SMTP id a640c23a62f3a-ad4f7558640mr67795566b.23.1747165764749;
        Tue, 13 May 2025 12:49:24 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2198b68dasm817531666b.181.2025.05.13.12.49.23
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 12:49:23 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5f63ac6ef0fso382235a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 12:49:23 -0700 (PDT)
X-Received: by 2002:a05:6402:274c:b0:5ff:8c0a:88ea with SMTP id
 4fb4d7f45d1cf-5ff8c0a89e5mr2111225a12.9.1747165763215; Tue, 13 May 2025
 12:49:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513111157.717727-8-ardb+git@google.com> <20250513111157.717727-10-ardb+git@google.com>
In-Reply-To: <20250513111157.717727-10-ardb+git@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 13 May 2025 12:49:07 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg6LNJmj5FD-PFXNFECthYJDA3sPkPYBYg1EjBhuZJ6wg@mail.gmail.com>
X-Gm-Features: AX0GCFuQIXZzXD2X3By67QYycQVSSbxPLcoxb-FQDDM823OJYrbvQFNwM7B9mmM
Message-ID: <CAHk-=wg6LNJmj5FD-PFXNFECthYJDA3sPkPYBYg1EjBhuZJ6wg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/6] x86/cpu: Use a new feature flag for 5 level paging
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 May 2025 at 04:12, Ard Biesheuvel <ardb+git@google.com> wrote:
>
> Separate the two so that the CPU hardware capability can be identified
> unambiguously in all cases.

Yeah, I like this version of the patch series, it seems much clearer.

             Linus
