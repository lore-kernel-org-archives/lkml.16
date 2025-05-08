Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF6F1DE3BB
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 10:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746699192; cv=none; b=B16moie/ww5tz8z15wbPZxPjm/22lCPW0MGmB0VkE6JAxyqQFjMez7aqktnsiREpwaAVEpay8p4SPMXOTrrM3EtpyG8qxEmuOFzDcbr3QQ+A+sz0sNMFXpCf4+62wAjC0nbSWpmyx7cC0r/Wzzlzn5rmEO/11/d7wMAkiNahz7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746699192; c=relaxed/simple;
	bh=GaU7b11uch6HEVNCi/BIgaqFmQ/4amSpG/dObURRasQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Flsu34p5+3KITokfNgU4/JMeN4a1db6EFECQMGeiKlRKjtiBUeH0cfRMRzYfSbL/sEl8mXnWKQM6vs4cdSuyyIPH8KIceHgNLmANE+Pn7yrOJs2VQwIEyUDdbaVeyVtR7WlIyLF6G+enOF0jQINdmDAc65IR2kEFCNcg+ZW34Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z56VpmEf; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z56VpmEf"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6f0c30a1cf8so14153056d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 03:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746699188; x=1747303988; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GaU7b11uch6HEVNCi/BIgaqFmQ/4amSpG/dObURRasQ=;
        b=z56VpmEfIr3G5KDQb/tzjCLh9LS0YOrxGz7zPE8YfcbybOktu/P8cuQBsEwqpoADdX
         SbJ51/+mYNOgClsqPCFK4MfjRVCd+daCztCHyP5EnVz70gq6Su/JL8wGl92s5in/i/cf
         Z0abIf57pTYZF3byCZ43Ez0YQcCwJuEjFzQyozvDbAppNMOwVix+DHWimqWSsXaZa09E
         27BA2dXmcVXqFFsPmvkLo65/GCMKITUgVF1v3kLFXV4bXAQMjDkuj6sagdN8G7AItqnn
         IbWahmTfqA1vEiHz0sdvOwTfAnxM+C4drcN10wGE0xTwaJSTUF6Kdohxg1heKTI5IS3l
         4SMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746699188; x=1747303988;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GaU7b11uch6HEVNCi/BIgaqFmQ/4amSpG/dObURRasQ=;
        b=AsfAGOAvpKRqcg9HdxJRaxew8D/7Rz/bce07434BsDwMN03lo6+jqZKLuNcW2xFV/m
         kBMUahjIuoGR/qslh28JH1rjpjQTThUgTI+DYpVQQTaAdHGTJmxK388oA+V/9wA07aBy
         1GHllwpgOArQQGuvBjBjrA5Zabo7udRn7q7CSzXmVwLhjFMDOZR9oEQ7drQrOR/6OPC1
         neBvC4GV1zqZ1WdhcsVgp24atZlDqbbS40uQNj4ngc5uBPYU9GeT4w5BfLD4skdtpYPe
         vsiYBhOXsDniW09PKnlzMvotEIMZWg51J3myxKirECdSM5EGEsg0QEv1SGEYsTQ4QvAt
         5ImA==
X-Forwarded-Encrypted: i=1; AJvYcCVcUi5HIYHdt9XYzD/uozsvhlUuru8FLqVX14T+TuM+0TMvFdVL10hfE1guq9DsKztQEKGBWz9HIeiipJw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp43Xw1JhrOS8clR+Gz1+Npt9Gx7m6ElEEb7qbSHirZUwi5Kcl
	RgVt4a1iL3GFiDBGhZRiu+Bxv1QGmXm+C30aBNnRktUUGyc/eoLhZT4eXDdp9dvobeT7TSMfvhA
	u29R0K70ouO0QEf6mJZhusQABaUo+1Thqqk69+gvdw6OUWpIF1O4=
X-Gm-Gg: ASbGncsg7ad+ry/qdP6UrchPfIuRob3QQj5QDwoljNMotbGlixDX3x3f3UucN72Jk0X
	J/HM/dsPj8RBmrKrzC20ojmvPbVsAAiEwUMFUW8kHJXBpM8fEruGj1kz0EvNjNRnHZ/9vFXK0hI
	l/J3mM27bdX3yvAA+44pqfdpM=
X-Google-Smtp-Source: AGHT+IGHZuVXaUQ/u3XZJbuAZafur+n/lC9GK9G6Emz/GScjl53R/86ubfnNKLg/l/AxbJxOUCz0O2Jkui3OicdLBOk=
X-Received: by 2002:a05:6808:200a:b0:3f8:e55c:16ea with SMTP id
 5614622812f47-40378032892mr1579070b6e.24.1746699177190; Thu, 08 May 2025
 03:12:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402233407.2452429-1-willmcvicker@google.com> <20250402233407.2452429-4-willmcvicker@google.com>
In-Reply-To: <20250402233407.2452429-4-willmcvicker@google.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 8 May 2025 11:12:46 +0100
X-Gm-Features: ATxdqUHvE3fzypmFP1S8IOQDU_RCSOzzbAgcVp5I5etYCYOISwNGGPhI-JRyTfE
Message-ID: <CADrjBPphh0DgdeFSAZ9WDNqUOE=C8XasoW_9Hq=p1Q8onZj+AQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] clocksource/drivers/exynos_mct: Set local timer
 interrupts as percpu
To: Will McVicker <willmcvicker@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Saravana Kannan <saravanak@google.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Donghoon Yu <hoony.yu@samsung.com>, 
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Youngmin Nam <youngmin.nam@samsung.com>, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Apr 2025 at 00:34, Will McVicker <willmcvicker@google.com> wrote:
>
> From: Hosung Kim <hosung0.kim@samsung.com>
>
> To allow the CPU to handle it's own clock events, we need to set the
> IRQF_PERCPU flag. This prevents the local timer interrupts from
> migrating to other CPUs.
>
> Signed-off-by: Hosung Kim <hosung0.kim@samsung.com>
> [Original commit from https://android.googlesource.com/kernel/gs/+/03267fad19f093bac979ca78309483e9eb3a8d16]
> Signed-off-by: Will McVicker <willmcvicker@google.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
