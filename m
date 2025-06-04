Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA5B10E9
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 08:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749026059; cv=none; b=f0o0uKGcbZy+pu2pnn+3Os/Wc/xayMTeyFWPcsSXrEfs0SFfUHOvN4f6xFNX+rkDQlzlr82ELEydOIfwy+660f4BZfi9Nb1owN2VSc5u4AwLTzrpTmvyI2pTMosX7v/Jqplt7nocUyAiC89Pri1pGvHdaLRdk5Pcs/lzjqXSVoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749026059; c=relaxed/simple;
	bh=oIRXxYpaCE7P1jXJfM1KOU/ukUCp6xeSehnHV/gu2PY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SAavrqjXiiIfGJ8nxJS0StLAbknmdlF59YtYeJJbBNjdI0C7dbiqqC6GhDYz8m3Ah3Ozt7COS40TPzj2Du3BYi/4oHb4VVqHhIsj9WmRzxuBYcf7mkAzWEHwBjLfnYXPc09qPD2uuZCw9Cc+VdIRV478kInXL93txcFYqVWaZlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DR9tZW67; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DR9tZW67"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-710bbd7a9e2so25704357b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 01:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749026054; x=1749630854; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oIRXxYpaCE7P1jXJfM1KOU/ukUCp6xeSehnHV/gu2PY=;
        b=DR9tZW67GrnfddsR2iQhT3KM5xtXRrndODiWvxGgPodgfcPLV+zt0tu+HNPzOPKsxf
         fPEg7E+rbrrnr5/2x00+CemiTSfkhFQHkBw2eqLuylNCPOo7mkNxSQbPHRQyeJAagMLN
         R81NPeq96OZzESD18wBPRm3robMDmPJTSCMdDwrGqwwHC3iri7NjppnGeccMoxbsyaW3
         P2hN83HLGgygGLTea/aYuTUBUKYkDge/piLqDxgn6bfoZ7aJY0g/QZKAcwm2awch8w14
         gT3rb9nrMjmd7yoSfnxemnuxYk3/hrShWKePfbmQX8FiDbBtSXJyy9fFUZamcvgUI5C7
         WM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749026054; x=1749630854;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oIRXxYpaCE7P1jXJfM1KOU/ukUCp6xeSehnHV/gu2PY=;
        b=lbqMCKZh4FbAE1Zbwd+uwwXgl40yaRgMd/L7O+XseCJ/KpN9rjTapC03FjP2nOZxdV
         /B9XeSsR3pnmiPx6Iu43YSSpAnsozIjVN0J8o4EUko0wZvbkdI/SUTvWclchnzfvaCHj
         o11KAWVzWt5F62uZZFNm9kU2hVdQECLlQ5hQ9fVkv75vCH6VI1DLUvHX4Mx8rFiIiYAd
         EhYurvDNeqyi582V44V0GKfFjgIbSsnSeZ555nF4uB7dfYSKbBjd9PeUmGBHqa2u6xJl
         5p5TRt6pg9mYm4E48YqSXpvT90J3qCQyGlD6KHChFrXhbGtcquBDY8zDKSrwS/5RxXg8
         7PWg==
X-Forwarded-Encrypted: i=1; AJvYcCVrli9vQP/gL/dekDNM+sRUuWbgfyogpGsXt1+EvReruZpE5srKF92FWR3jqNyMzOdk+dy0L2UNzoiBN7Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXMGLLE/r8+VEI4E7wqx5ydocGPyaCHoDHDhTM4obyW7ENlD87
	O8NCttFQPT6OiE+A8ac2GhhfStF5e1WK76mCLkJ2snaCQnIcGkqm/LWtwcKpAFD4c5VP4R6uo4t
	mL/pWedsPWcKWplDmSfPxXhTdOpUKWGIrK4Ci3gz9Mw==
X-Gm-Gg: ASbGncsnKm+3PhxOd4OS+alwKzEBw3cPt2CLm1oQBpbYgZhMyvmgL9DuPX+VS2lYgn9
	l3ZHgNJvFlC0vm+aSVV3wfa/NlId7TC4Oplq9AIYQnI2ddN7uIyrbVdsipwOANblaJSk5oNaxwX
	YyMBS8As4uH0lhT/J2QkrgG+s5B98SS+P6
X-Google-Smtp-Source: AGHT+IFdMlKQEHFB9rAIPubm+oWCxtLQaBriPs9FGR9ZFu04+vMyrF1AGrH76Qny9PZkqn4FiSFsMO29KEcocYymM64=
X-Received: by 2002:a05:690c:6e01:b0:70e:29d2:fb7b with SMTP id
 00721157ae682-710d9dba8e0mr22420457b3.33.1749026054535; Wed, 04 Jun 2025
 01:34:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603201036.44504-1-terry.tritton@linaro.org> <CANDhNCoiKjPOyGwiu5Apg2y4LduPTRQvEjG7snmbzrenZojAKg@mail.gmail.com>
In-Reply-To: <CANDhNCoiKjPOyGwiu5Apg2y4LduPTRQvEjG7snmbzrenZojAKg@mail.gmail.com>
From: Terry Tritton <terry.tritton@linaro.org>
Date: Wed, 4 Jun 2025 09:34:03 +0100
X-Gm-Features: AX0GCFvGl7sGmmJPlA-wX27a4YxRu7KVpfougQMpQZxrLZQMi9H8NHMyKYJfLQs
Message-ID: <CABeuJB3vDEaaPuCK_n1JZ_0j2wgcpe9j01yLkEpkt6hsMLSB_A@mail.gmail.com>
Subject: Re: [PATCH] selftests/timers: Fix integer overlow errors on 32 bit systems
To: John Stultz <jstultz@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	ttritton@google.com, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> So this seems to be undoing commit 80fa614e2fbc ("selftests: timers:
> Remove local NSEC_PER_SEC and USEC_PER_SEC defines")
Thanks John, I somehow missed 80fa614e2fbc and was wondering how
this had got in.

> Would it make more sense to fix the NSEC_PER_SEC definition in time64.h to a LL?
I was just thinking the same this morning but wasn't sure if this would cause
issues anywhere else.

I'll send a patch to change NSEC_PER_SEC in time64.h as its a lot cleaner
that way.

Thanks
Terry
