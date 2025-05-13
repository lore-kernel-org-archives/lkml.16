Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1662D1E9B34
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 21:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747172229; cv=none; b=kdIjkIiDoNPYKkOeoh9RGHUZlMud/hpsF5uq1HvEzP3GEejUaBuzTUQ1EjFn9zGrSR4zcR00ShUbyfTdrSCz1FLQBdoArUFO6G+memg/O1qXk2QIv2T4yaUMgrqK8ASeNrD0Yvfy46dfEVURyJhvebTn38/206yGZMhoCnUzrmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747172229; c=relaxed/simple;
	bh=PO/ZnToiSQshroU62YU04Jbjh5HO510+sm2n/R7pJeA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h9XxmHIMnBLT50hqQKNOiEHas1ZqGXKKbdx67jHOxhKYdm9sJd9h0vCYtT+gnmI2mSsQEBHzhpqpuyaERZ0NRjWuaAJSZHD2vuhwZfbYyz/hjfc/AWN8Aakebn9Sa6T6OQAAzHPq5WdKoqckaQU09jcYvCCLdUXNAl6DbACXhko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=DTW7a0zr; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="DTW7a0zr"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5fc8c68dc9fso5144744a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 14:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1747172225; x=1747777025; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PpGt0/4BlhEjF3LhxkoQUInU9xlE4Lld7uIpl3WRJ5c=;
        b=DTW7a0zrgyKgo4ABlEzTsAZmvnL3ehXNIha2LPqr9qW+vW+lQCRPYku3q+d8B4n+07
         H60UaBeSoinvt/OQ8Sy2y3sU8Cujh2fbPhl6jgzYKrHX07L6xoH3/81f423vINdLokWV
         SR1Zvg51o8TELpNKKknnYS3vYxaDGPga+K0F8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747172225; x=1747777025;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PpGt0/4BlhEjF3LhxkoQUInU9xlE4Lld7uIpl3WRJ5c=;
        b=NrFZ2y+9tR+lTkBHwC0QV+nFEzljESsGuwCDehx9crt9/uS6RY3KdPaeZPlLkGsqM8
         aoBeyACURl9nEACfpjov1BYnKDj8z5ZX/jWkV7beAke5IDI9D+69pAFTbrNJkdGw6AyT
         0fndd63BBN5fSubB8VJOHGFaF/RnLZn25eWc4KVDSB7itnh5U61E7+KaTb3JhpQ+ROO6
         JxBzmFKHMC4gFaseugeiTztBKq0OM25VgtG5UC7PQM+r6d8r4H3RYWVOXidz8XG62dfN
         yylLPhpMCuAv/0gi3CQLYq6NT/MjAWCP7nP44VJC/n87tUbQE6qJDhGALbbTiLbOpEpn
         wEBA==
X-Forwarded-Encrypted: i=1; AJvYcCX6OhtZBG8XeCXhrdnEBk4BwiDBbmhNLTlEzFUns+arxSrOHkm4IeNgnjUDWK0jO7KBq2azGg7CHbq8QOE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIaoWG1qC7ohPawyMGTIR7jJN9htoQEnpTC+TeztarktRPP1OJ
	zDovhJRS2PEBbynuDxUao/yjCR/qYpAMM1CkmGp3LLww4iBGjWhma3GQQmwncC1BEGXpIqblwYA
	mpKRWmQ==
X-Gm-Gg: ASbGncvHacGBzfqrhKAfxRanVcN7Bi7L8nAid0RAQBbQ7sSxViHzMPln3sL6wpgyG+t
	snH6Bx+8iV4MwXGp8m6j1KIYVUGoSZKSSa01K3I4A1ZMpIL35p6IL8mfUyGQnXETKPc6osPRj1a
	NVOhbpKctiVPMpgzMvdmsjjBFaUMkWp3P0yI2+Rg6vXyxzBdKs3UPfd4k8fm3nDoEB/n1Ta5W7R
	Fd5QVIDRzfpzNQ2GtrvX4Iu5Rju4V8ypee8CjeYredp6thMyKB5+2N6QRiQUbgie0hqbyYQlKlS
	LImur7VPoJWyaeyI80aFetFAVcb4ZKCypnazrj5pK4Q3xTjqXO0ZDl93LHP2gh9K6nQCQnrpW+i
	bRMCbVa+wnF2tYK219WvninHIFMZs2i6OwZgU
X-Google-Smtp-Source: AGHT+IFvzEWUyLQL1c09wlzGxFBF0SukLOK6wo7IumKNhBWeSHln1p2cxagllAv2TDSOKbk39cJamA==
X-Received: by 2002:a05:6402:90b:b0:5f6:23b1:ab4b with SMTP id 4fb4d7f45d1cf-5ff98a22459mr566105a12.30.1747172225123;
        Tue, 13 May 2025 14:37:05 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9d70ec1esm7729848a12.78.2025.05.13.14.37.04
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 14:37:04 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5fc8c68dc9fso5144716a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 14:37:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWVQo++3iqNnsRmdiZc8l+CJDIDqNUXa/5WfavPPbnZFsR4o23VXOJh45q7XjBDHU2z8r2gIGINyZfFCUU=@vger.kernel.org
X-Received: by 2002:a05:6402:5208:b0:5f7:8e59:15d7 with SMTP id
 4fb4d7f45d1cf-5ff988c0538mr505870a12.1.1747172223719; Tue, 13 May 2025
 14:37:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513025839.495755-1-ebiggers@kernel.org> <688ec9f5-b59a-46c0-97d9-f4d0635fac6e@intel.com>
 <49808711-a5af-488a-9fd1-246c4da10100@intel.com>
In-Reply-To: <49808711-a5af-488a-9fd1-246c4da10100@intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 13 May 2025 14:36:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh-eB38UMFNna8svJy+=pS2=PHQ8f9-_8wVrVG2wh0zeA@mail.gmail.com>
X-Gm-Features: AX0GCFt2gxwB0LdDLQ3EofXx6pOOcaJcwz4xjs3v92rWAEBosi4IjQfmpE37OT0
Message-ID: <CAHk-=wh-eB38UMFNna8svJy+=pS2=PHQ8f9-_8wVrVG2wh0zeA@mail.gmail.com>
Subject: Re: [PATCH] x86/its: Fix build errors when CONFIG_MODULES=n
To: Dave Hansen <dave.hansen@intel.com>
Cc: Eric Biggers <ebiggers@kernel.org>, x86@kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 May 2025 at 13:32, Dave Hansen <dave.hansen@intel.com> wrote:
>
> Linus, could you pick this one up directly, please?

Done. Thanks,

                 Linus
