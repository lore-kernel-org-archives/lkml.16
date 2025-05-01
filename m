Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929951C5D7B
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 10:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746095056; cv=none; b=X2Dw+/z/lnMvFLbIIoqWykZM6e5/AnLYvEpV+JSKDKDK8R7GNEi1f3fNxTIhA5BpmIWgtKw1Q0W5hBcZ+Ak0SX71g6T2R8hWZmKA9HQ4usVAdWUfQRe16C+sq4mf/0tBhnABVGN+y3TAL3ytJPbr2w8Q/8l53KZsU0kL4+xd13I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746095056; c=relaxed/simple;
	bh=DsPNkIC1N8o/Edk9Kwdar5GbDZ/Ys/0uF1BAmU+NY+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F9pr4ztkl3ELhiVxiGcw5c5Vb9jBuHfZrtukF25mw4HnY5t/KcBdDgHPf0hJzoUx/iXcxjxY5849ngRF+5QO8QXmd0yFJ0CnLCMPWNTtgxkEqaS9DyzeA9RYlFuDkD+iceekZjQts1g66JRwD2YIUhM8EKN8imSvNdeBsD/I1rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LzjfVz8d; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LzjfVz8d"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac6ed4ab410so126807166b.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 03:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746095053; x=1746699853; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DsPNkIC1N8o/Edk9Kwdar5GbDZ/Ys/0uF1BAmU+NY+o=;
        b=LzjfVz8d8FbADtmN2emcEkSldLaWHJK1uiHjEG27XiE1Hw81RBbw4yBEGIhpFUeCb+
         PUS9dtzda20/Gx4a+a71RC8kYUgwRgpyqNZI8Ckyp2L9c/qcLPJPpYCu8xzrGSuKaehS
         HmO+bDUVOQWBkzOAMh7i03voluu0867eTublW5lwlyK0sr9blFf4QObdMyk8X/X/lTY9
         9OBoffHpOLQ5xYtazuhMLMUbOFZxadnSG9gBzdJRTXqJZxhc+NeIsa/HXvIYl7pqu22b
         uc2+c+jsTS024uRi23qmYA0oVa7swkQxDYXRz9FvSAY/MifAZoXFErr2GvmSNbw0JMqn
         Xb4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746095053; x=1746699853;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DsPNkIC1N8o/Edk9Kwdar5GbDZ/Ys/0uF1BAmU+NY+o=;
        b=Tc0D3vCU3Z7j0ytvrU8FQCRgaCPHyJDWRWgjiTPT1V7CBp6blbIar4An8yHNYC0xs6
         IqqOSGu/mda6dk7d68CPvmLRDvsRtT4f8fhr0mxWRn+esr37WHTFjitUn6+xR3Vo+pqM
         GLE6TIUGrtcQEzUlyk36GH5vcblCs5TcGTkgCtCMyC6CDnShzYqWRAVNxPIlnKtDT6nj
         7c/y6jklC/BFX4D5hB6pLLDWabQC/VPK54mGeO5QG7OwRJuX/4gw+DxveB0ExIxwCtd2
         4mkJsTzPmBA6OqSZModAwJW/F4Egbu6eSIA5lJc1aWrEnMyw3PMTO09dzk5P+SKm/36r
         a7vw==
X-Forwarded-Encrypted: i=1; AJvYcCXL2pLI/MwMksjeVl6yYt6yMRhYHW8XJ7IL4eoh12NUUTcdzWsyJtSMK80FJQ+oba1j2LmHcLae07+aBeo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv+iSqEWnl1SYrNZID46rKuimz2tpnRQCbXV0KYcMyQAsN5dn9
	noSjzB4Z42InoLBHqYc4UIm3tl6ZTFQUCYQbpOzKIr8fbo0PWfLlgRgtuy5pMZKUXJk5IGldZMy
	2c7JVIIqLsw8a77BZWC3qOVRGnaKyRaOf+ir6rQ==
X-Gm-Gg: ASbGncu2vlDxO8lGsmE2WpHjnsjnVEYj1lVAvG2sYXX90rkCteowMIigr2lBsbY/KcB
	UqqyCpQbxLrcfM09dv8qdt5bYDK/yR4bZ2/UhKR4xxxEh7V0IFECzitLWZnKE1gzUaSkXgHISe2
	eMbzbifkjlIiN/XWDeTYhFW9/MJzVcyd4K
X-Google-Smtp-Source: AGHT+IG2ekDS4CZIppjCAw/MzlXbJHvZxPVMNFXtvL8IBzq6Zf598iEdE9eaYG1Mu2EXBJJRusavtuWuCoMHMHylleE=
X-Received: by 2002:a17:907:3f1f:b0:acb:4de7:14d8 with SMTP id
 a640c23a62f3a-acee21a69b6mr631701966b.14.1746095052926; Thu, 01 May 2025
 03:24:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430202315.62bb1c1b@canb.auug.org.au> <2xUHqc3nyQdHW2SNbAQvQwy1mR4qz-vdR0UF8fVwFvm-rDtaJmhOUqJJvNWkneTh1XD58UlvoBT3umKbMjNlYw==@protonmail.internalid>
 <20250430104234.dmwnn5ih232kfk4z@vireshk-i7> <87selo1xdh.fsf@kernel.org>
In-Reply-To: <87selo1xdh.fsf@kernel.org>
From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Thu, 1 May 2025 15:54:01 +0530
X-Gm-Features: ATxdqUHjKvP1KrNdFhp4_8bQbjW0VqsOwYlAsd2KpD8LQCLT_2Dq114053VP1PI
Message-ID: <CAKohponC_E9Ah4wXNNg0YVSo0UuRn+hNq+hxjrccbjeNKWH6Rw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the rust-xarray tree
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Tamir Duberstein <tamird@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 May 2025 at 15:45, Andreas Hindborg <a.hindborg@kernel.org> wrote:

> I might add tags.

That won't change the SHA for the commits, so I can safely rebase over
your patches.

> But I guess now that Stephen carries the merge resolution, we should be fine?

Yes, that would work as well. I anyway have prepared a branch based on
your's, I will push that anyway to avoid merge resolution.

Thanks.
