Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2F172626
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 21:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746651981; cv=none; b=Q/ru0Y1N6FPZM+ZVRO8huR6fwvD9cW1uGSl/i/VxzHu3sUz0XaQtER2mizLaTuGnvg+zZ6iHriEqNHEhJ1wynJfo6Gvhj66aSg8rdiSmQp33akYL0E6o4ss09lX/zrr3ggPmXd3FCFy/DR76wfStoFe9aEFOb7qntPj5npvT5NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746651981; c=relaxed/simple;
	bh=XtTsVAtq5Aa/qds/mZ03c/a2dVfCPxnBWxrBVfFn9qg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KOF3Tff5VY3RTKsNcTUcnqqyIE6YL3BnW9OChttuAGLqTKdz3DNYoucsubujz+ObFVBFvVMVaWkyujZAygA91nSe75paW4GzJF1vnkDCULrMXZ2po5GVnr2+RQH7DaUfVmbbNDipXF9+CIwWneDcewQgl3Y4vU0W0Pc2X0OXMhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fWa8zeS2; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fWa8zeS2"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3d817bc6eb0so1245195ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 14:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746651977; x=1747256777; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gt0PzsH7dWP1Jv9XAe02KqpL+75JPfquQQIOm1GgXlY=;
        b=fWa8zeS2HzgeRMgxZn7qxzvcXL+ZMJp8IlbLWmKvLBt3IrpSPkEYY8iFfy+1D/jwzm
         ZxY2a/Xlq7O2DcsYFcRc+S35ONMzd+B3/3m5HQ/dIam5IlqnQNjI1KWOIvT1cEC5jMbm
         c+RVNH53YoPxQ45BP7CWP8i2po4P/I7i8+rRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746651977; x=1747256777;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gt0PzsH7dWP1Jv9XAe02KqpL+75JPfquQQIOm1GgXlY=;
        b=JhO7cxWoxCUb6T7oarduXq41H/s79RSSuwILbaCqpTagzoRmCQJSAa030qxHMhD0RB
         r2yuiEgSaLaTpzp/HFwgogML9gsPgMrrVaxVstIxTtcwrDYn1q4nXRwvM2rqOkDjBZuo
         vWPGYyQtxEZ/RxYkBulwgvlWyVno7OYgDXVJQookKRXLR5kNwAxBai9M6yVbuzkuuyKg
         M3U7IA7pDjq3hX9q5r2sEJ4v57preVupGCbZeIHHBifiZ3ueFwLqGirUYBdIVHyF20V9
         n23uZ87SuAgZvVjnwbDqg2MlavwS5Wo6u/x6iUSwx56t5mI7K20yBc+BI+68N+WgrtWc
         42NA==
X-Forwarded-Encrypted: i=1; AJvYcCUBa7ftGUymIsaEQUwMyzSf7OUzEgGOchn+wOchTr82y5o1ZQUusL9IQcSAQ/9t0c58vnUbEd6rqiegTc4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNruXWJTW3uop0nXPSRwB1is0UUOW2D5sQmp9NwCzbEXkatE0s
	OZZ2L5Eu2OdGTwiWKofxmimsigKPiKY2fbKX30vrrgx73FAfWBYMmPA2lcFuvxE=
X-Gm-Gg: ASbGncuF2EO6djnuZxykc3/2Odufv5FNTGksKMfMuEyMLJkAQntJcIGSdB3RYnFmJTr
	1joBVf8SkXMFUEcp8jjYVmTw/AV+cpNbiFv4/Ac7Ott/ntvPFbc/oMxuqXjIHW6wHcqVGjtFNJ0
	uAyz/Mrudpv/KMdwhUEmLIqCWECQwU1yGJKrUl/BRP4sZPLrqpBIlJYL3Fd+ZoNMl2qAiM4MwqG
	mAmDHfr6xmJj66X1n1hdCUMpLudrS8uGOjUxY2xSepo1jqYEkxtEV6O0h9oXQTemvjKIcqZHGSK
	ReZGIres/udZTGrFPCHNRs48BPEx05FfwjRvF3919FHcYTsFYuo=
X-Google-Smtp-Source: AGHT+IHil6UBUd1d2VFVV3oLh2+dvDjnd7fFqJ7qiYmhGGigtFWjtbpZGojq+iOGKz2limwEmfyriw==
X-Received: by 2002:a05:6e02:1aae:b0:3d4:337f:121c with SMTP id e9e14a558f8ab-3da738f9f2cmr51404305ab.10.1746651977014;
        Wed, 07 May 2025 14:06:17 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f88aa8e16dsm2886817173.114.2025.05.07.14.06.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 14:06:16 -0700 (PDT)
Message-ID: <5609c6de-e5cf-4f6d-8412-71149fae2580@linuxfoundation.org>
Date: Wed, 7 May 2025 15:06:16 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] selftests/timens: Print TAP headers
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Shuah Khan <shuah@kernel.org>, "Bird, Timothy" <Tim.Bird@sony.com>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250502-selftests-timens-fixes-v1-0-fb517c76f04d@linutronix.de>
 <20250502-selftests-timens-fixes-v1-1-fb517c76f04d@linutronix.de>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250502-selftests-timens-fixes-v1-1-fb517c76f04d@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/2/25 06:03, Thomas Weißschuh wrote:
> The TAP specification requires that the output begins with a header line.
> These headers lines are missing in the timens tests.
> 
> Print such a line.

There is no cover letter for this - so I will respond to the first
patch. The TAP information is added by the kselftest wrapper if
you were to run the test using ksefltest.

The following will add the TAP header or if you use make kselftest
command from the main Makefile.

make -C timens run_tests

cd timens; make run_tests (will also add TAP header)

The only time you won't see the TAP headers is when you run the test
from the test directory just as a command. Is this what you need
to do? I would rather not see TAP headers added to invidual tests
unless there is a good reason for it.

The problem with adding TAP headers is two-fold:

1. It becomes hard to read the ouptput if test is run using
    the framework a. make -C timens run_tests b. cd timens; make run_tests
2. These headers become bested and TAP doesn't like nested TAP headers.
    My undestansing is parses will have problems.

I am adding Tim Bird to the discussion.

Tim, is this still an issue? Are nested TAP headers still a problem.

Even if they aren't there is the issue of multiple TAP headers for
each test when we run the test using framework.

thanks,
-- Shuah
