Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2CC1DE4D2
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 18:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751655343; cv=none; b=X0w5VRu5a2NYHExBKFH1CU03ky4RfDoP6Cw9zdSa8i6QB6gjkJgt54cHViVgG9e5r4Q1+6rxJ7YinuqMWMGE9+F8AbWzSaDZgeuRQzyqQau4SeHcGUDkARmuR4dkaD3cVOiN3I+CeggIqSHLbuolS2Qvg8L/X6k7R+cphaQyeck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751655343; c=relaxed/simple;
	bh=i5UrnJioarzHLByYSLycjk6gxtQARLu2d2F8hbNdkaQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dtVAwbvLtXoMgaUVIiD88RDVjJQrKUzu4d+4AciOtw+/lBMs9fEXfUXL8EvdO+dQM1EYc/DthD2TqybM9KIjuPBZVWFuZbaeWF5Jc0S2w48m+xZU8X9dEke2npjPP5KO5KDqLseDsbxi7xZ8N2veuj0WYy+vVyI9xBAzL6NNqAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mxVdEJlj; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mxVdEJlj"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e7311e66a8eso1121527276.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 11:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751655341; x=1752260141; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i5UrnJioarzHLByYSLycjk6gxtQARLu2d2F8hbNdkaQ=;
        b=mxVdEJljmD3oWeYcmSC6hY5ucxGQQeNi94/WSgMotvQXiqpBQHq0xqOiAWb+RmqnJh
         ygBvRKuIST5dEJcAjBABjh+SOXijS+yM8dFlJ2rnQWADCT6U6+Wwf1Of9TAdep5yMHjP
         5lbNZWccN3YaHxq37GNoSaCYWh1Q2fnUVmHufXerL5+yCRnS2xRVxfBYAId3qTj6qmcq
         TT+IKaHiNL1g4waxfmCCeJ62EEIr7ogYOHj/BTJdFX7n7RKs/ZgFPqLNgPT14gPN+9Zo
         tGkI6Z9sJPxcVMM5BmYUbibdTgUR8IIuWOYaVObnQJLtB0TjU8Jmm/aUX/7CeJ0NTXfc
         Zu5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751655341; x=1752260141;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i5UrnJioarzHLByYSLycjk6gxtQARLu2d2F8hbNdkaQ=;
        b=uXAs19njSvEWerxe3kBVxIUaB28X6PCszXkQEqpHoMwDY+5JGQgQe4Z4BWrwLlbAIE
         z9+X6FJhql0oXiY7GiHOq98D+anX8rP1PXs5N25qm6z+G15SNyc67hTSsjf3+39Y8AZX
         xaA+Zwy8NvRQ1OEhTTH7hCvTfIGrz0pUhOQQNrMTw1k8FE8pvDrdae7N10ZFfwVyguwG
         dOLWQFc8VxXdVhwQnRiYqYMFJl7KO36Zy0nTNlD6dbfGyI2EEen6j6vbITdp8i2dW3Zw
         5cMJ927J0ze9W+RiNsi6tNEAhNt8vjUvuneSvdgbfM6MWkjHDhpSr23Nj0rODcz8giLH
         1I4A==
X-Forwarded-Encrypted: i=1; AJvYcCUqlX98ENkT46X3WX414vpGyfI93WxTKt9GAxa7cIfy2LQAAxVm0KE6hfZXnnFb1dtSsKm8LnZmwab0KYs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnHl4VHgxGQN3VGGkJKmnTLekcgPtpmMzu+cs811al+e4NRU/2
	zuwrTXOW/IBBSthOrG0HCVf6xaMLZ/DRLwcG1LixbtqOrmfSd6e9LK8q3eLcbD8RPqkch+qO40k
	krSPKs9fl5dJj8sV8UHiDXU1X0L3DXkVCSqnDLeP6/Q==
X-Gm-Gg: ASbGncv0mf//LL5TV1pnAauPQHA3f7IThyckGzwWEpo3cAkq6jRBpN3ZTO6neL6OSk3
	508FLNER2F820q2ZgjnrksheMJjchnwgBA8HuK6PAbHnXN+T5tBnm+jw4j88jCMEmEOI8Q7gQ58
	Phohj5MQLToRZCT9iGLHk0lt4QsVTkxmurkxpRA2IJ1ZU=
X-Google-Smtp-Source: AGHT+IE8YU8yP6esqnqUnZk9RLXSToml0bj4v9nH7DrJYcsEUr7XQwY4dJ3lhgYdPf76EoZr+KTAoSLIcBsb+9QtwDA=
X-Received: by 2002:a05:690c:d0b:b0:70d:f338:8333 with SMTP id
 00721157ae682-7166b6cdd09mr39558687b3.22.1751655341084; Fri, 04 Jul 2025
 11:55:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704103521.10124-1-terry.tritton@linaro.org> <61f90ebf-3cb4-4e81-a7d7-cfffe41d9d47@igalia.com>
In-Reply-To: <61f90ebf-3cb4-4e81-a7d7-cfffe41d9d47@igalia.com>
From: Terry Tritton <terry.tritton@linaro.org>
Date: Fri, 4 Jul 2025 19:55:30 +0100
X-Gm-Features: Ac12FXzsS18VRi1-qE0dpcrfnADu66E0lCMTJzxKRd3EQs1pCzZ2Ghi0HmE4GGM
Message-ID: <CABeuJB1QxwBHn+_6cZP9WJXG+gh1x5HWYW9CGVEajqHL6GSEbQ@mail.gmail.com>
Subject: Re: [PATCH v4] selftests/futex: Convert 32bit timespec struct to
 64bit version for 32bit compatibility mode
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: ttritton@google.com, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, linux-kselftest@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Darren Hart <dvhart@infradead.org>, linux-kernel@vger.kernel.org, 
	Wei Gao <wegao@suse.com>, Davidlohr Bueso <dave@stgolabs.net>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"

> However, please check the results ./scripts/checkpatch.pl, there are a
> lot of codestyle errors:

Whoops! Can't believe I forgot to run check patch!
Thanks for letting me know.
