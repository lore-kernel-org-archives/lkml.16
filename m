Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DC91EE03B
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 11:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748863312; cv=none; b=He9E+H+4U4FIyQGlGGN6ENXrcFnj4VUrbL7KwON+rVqsjmzbV+Ypo6JknHMIYlYVn+mKO8VLpDYdJDOKih+S9wJGs9s394bx5jaQvSwRo3tlpw35vIsqe0TF1uCv+zHHl1hRk4V1SxvRDP9XUNjd9XJRThwOGh+L9KAU0DthhTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748863312; c=relaxed/simple;
	bh=AGKW90d03jRDwWPnf9xWAHWyO9Zf16QwusAywKd77kw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EWUYVEMAPkg6qG/p7n+gtj26NlraB0TUNrjwncG+1JD3aiz0EtCaiBLpT6Jcd0923Cu2nTEMctIZwEnMMNHEwuA5HvhJkrNqZ6S50X1Usg8Kebtg1rAdpyTZ+XbsING+twxjv//Kpt0oxf6jexRyvdyjkDh+zs2hF7VocUl3mU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dHFsGgIR; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dHFsGgIR"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a361b8a66cso2513769f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 04:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748863309; x=1749468109; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IvSX4c1oUCxk5IbO69mfCfI1qaHqnSt1IqLO5y3WhAg=;
        b=dHFsGgIRVBtyUDbCFxz6crugHQ9dYYtMDuXSxHE37c6cYoGKy7gQ5V1D+M1szLAA4i
         AkOuJTJRWTIsSaYmtilfZejsOUaxthSr+7iV5hwK9TAZ/yuLmSFhA8eo3OTSuqB2kU2a
         ukXWoPnrkdcc6dmIy55GTSWLKBAfAUere8qOuAYHeIl052BAE1hN5WpBsbfLqw1PXCz6
         6x8/BO64OVQPpjo4AO0/fSf8otrMEUQHFEFg/DXrdW+QkHb8RMhrddJMm12iY3OCM7mr
         1s6Nt9HPOe2NunG6YG8h6pDGFalDJ+FVfxqr0d89UNHBK1hcwQtJWp/AYrOC97NdGxYA
         3JDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748863309; x=1749468109;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IvSX4c1oUCxk5IbO69mfCfI1qaHqnSt1IqLO5y3WhAg=;
        b=ZoXCAxYLvJeCls0/bu5lUSremwBdJajF3j03rJLOOtONHTtcBs8+D9p1RIJ9dbpjE8
         8853SQtjHkgIXCtM7AZw/hiAMkK44nIBTYjzJJ/Pw5w2iy2JiVs/yNMfvAg1EEx6dwQx
         NHRw6NOa+XClPVzBXODnzNuoslncy7kMgbEVaxLZaN0LyFJbrxeCBzOoXh9QmwSx9ytw
         UlFHCGq2NbVoPd8O9AgRvQbfolt9lbyRDzaNmVi03cmoio2LyKEUGkzrgIOV9REBtpIO
         vaYE0He4lfDvYBsOEGH6M8g+069Ei5z7Bz0bIO4WARUGFHTWbwiysw5YHcChlniD3WTF
         HkjA==
X-Forwarded-Encrypted: i=1; AJvYcCU3e3W5fZVikWtg9HmQSrL7pILZExJZvL8RSVwN/ly7zbxSliSzHF/LkJ7cD9XltIiRZm9Kagkm+7JSEdQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVCft0uHngObME7JCeA+le2g8vjxeaLeJ/QZWB42hyS1Bv6zym
	+wMxHap/gQv+eU7yar+gJoaWP8lACSUIOCDUEhSLi6zHbOrOkwMVypFZE1ZaGfXB37A=
X-Gm-Gg: ASbGnct8WDAdmLjZdkrcJm3CFioerTBIXJkNfFtRZVG0xRBTlaB4KTBusXaudO/9/PX
	cmGIB1BJu3iT9bb8+7ifGeuLjgB7fim3yDDalHLwyX05BF2dHFFIK/8QBoG4X8x2XcUd7FsjvBD
	/4LeszDJ7OE6G7TBl8fydgf5v17BGb0KXyKpRiTtyJThmiIIGfhqz5rVdNvyVIwUCgMzb5ZNsaI
	Y7KZpxXs8pyKMPric0glXRaYGOQQA9HmMMmW1ur62MLpP4wP/c7HGJC1lOlNTn26YxGKr3ekzr0
	ck2SomqMsryVJ7ZqwaKAXg7gergBC9Co4SEoKeRtFhiBQCD5/i/abQltJePmyrGRW1A=
X-Google-Smtp-Source: AGHT+IGTF+HAXsPNBGrmQUE29/gpGpKoxgidb5km3iE4h4s7MfT+3UZ1l9XGBjE/dHrj6EL79cLsyg==
X-Received: by 2002:a05:6000:4012:b0:3a4:f435:5801 with SMTP id ffacd0b85a97d-3a4fe17b831mr5932176f8f.17.1748863308787;
        Mon, 02 Jun 2025 04:21:48 -0700 (PDT)
Received: from [192.168.0.20] ([212.21.159.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c8easm14742821f8f.34.2025.06.02.04.21.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 04:21:48 -0700 (PDT)
Message-ID: <2e06d491-297b-475d-af97-854a86c8e0d4@suse.com>
Date: Mon, 2 Jun 2025 14:21:46 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/32] x86/boot/e820: Remove inverted boolean logic from
 the e820_nomerge() function name, rename it to e820_type_mergeable()
To: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Juergen Gross <jgross@suse.com>,
 "H . Peter Anvin" <hpa@zytor.com>, Kees Cook <keescook@chromium.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 David Woodhouse <dwmw@amazon.co.uk>
References: <20250515120549.2820541-1-mingo@kernel.org>
 <20250515120549.2820541-2-mingo@kernel.org>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20250515120549.2820541-2-mingo@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/15/25 15:05, Ingo Molnar wrote:
> It's a bad practice to put inverted logic into function names,
> flip it back and rename it to e820_type_mergeable().
> 
> Add/update a few comments about this function while at it.
> 
> Signed-off-by: Ingo Molnar <mingo@kernel.org>
> Cc: Andy Shevchenko <andy@kernel.org>
> Cc: Arnd Bergmann <arnd@kernel.org>
> Cc: David Woodhouse <dwmw@amazon.co.uk>
> Cc: H. Peter Anvin <hpa@zytor.com>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>

Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
