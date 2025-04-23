Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D150921638D
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 09:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745399559; cv=none; b=BhfURUdJiDpN9qfaTYYqkMMP2RX2BrQAJrvl7tJ1+IjCWps49TLC0gfTuszpEqlVCzO1oZ0YvCbaRydF4paRYaA3ThpaQKRmNjDI9wa2zWACaPDj4QnllwQeLz5VuFr02dwLnS1dqSNe+KsSN202owzTjPP2qg/lXly3lOd1mUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745399559; c=relaxed/simple;
	bh=QJeCOUQziwmIdB/2LLzhfScLQ2aSa3e2mHo767LOC+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WQ8hptr59NAGluJHNnZvq7ahnmHiI9LtOTpJBFnhX0B3zRzhC3qEhCA1/U3x+pVtyNGEEeoJTEAtjbDHsOBwt4iHGd10lPZQ42dTkdqzXnstNtg5aHsL0Qrs7uo9TFOpnT+n77S6rM5TwY5tAc/3cE7tC6OMSTu6ZZe6His9QDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n16VRcCE; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n16VRcCE"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5499d2134e8so6795352e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 02:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745399555; x=1746004355; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJeCOUQziwmIdB/2LLzhfScLQ2aSa3e2mHo767LOC+o=;
        b=n16VRcCEVZTTWYW6xd3KQ4jpfM/N/vB7WJAt6Ly4Vflj5vXbuJbg4FcBJRoLnyQI12
         0ysdp6iuZ7rMhV8QzmlKQD+nftCRWUJ4JsfXXwkmCl21qgZCIZK22ygJAtMQvuYFVvtQ
         M99Xa27BHMyOSLhKUNW2QKyMV0u2i4vkcX6RnKnBSEkpKq1zMVJEjhjSRgfMuY/sktfR
         0sAnxCPEJ++JgzzmI6Mt4XZUCALNExcBbRnsT6vhvL+dEwdZYry0W8dCX6OK81ARYGqx
         1PtssvHgL+R1dMKxmmdvQn96vnbj/0b20lIroqn4/BSAo4gKfkNvtCZ13Vmr4PdJOyeK
         0Xvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745399555; x=1746004355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QJeCOUQziwmIdB/2LLzhfScLQ2aSa3e2mHo767LOC+o=;
        b=Rwg8w6NKMSNHUO3Tn76giIJROUHtOkR3yamWsyFalpA4mUaYtaxKeB3x3XrxO6RYpR
         Wh4unqAWEDy7jK2SfWCHogInKzPDPOWA7Ru9UGNYI16GsgU/WgviD5EHL4WkkC/W6ALM
         q7JLjoqVhp1Q+siuzk/hyMuA9ny8HgPK+deoAJ+xMVYXXGX8h7dTT2YKUQFPK4BcnusV
         MnqYcPZfEt9BcSyia/1qIanyF6M7+JZk5E5RqRnbi8aY7B3xuLx/vw7RIMdA6buJfOAA
         HTdhcXT2pYQM54fw79LVfllTPmgWjum2E02mzqfrKW7ys1gPlSxYd0/OHLLcoUzIOxdI
         uYcA==
X-Forwarded-Encrypted: i=1; AJvYcCXr3+jQVusVXccJSCjyuL7MU0PYuyd9N1unv8KWBSCAmCccEq8zAS6DA/RNIHMSr3qXUf1IPqc6YaHJBf4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBY0rmmYVqPrGSy2TGg83+kOA2WnOtZ5x0HDE9KAGTpOhUMi5Y
	nAihNgsWVF7xHxQ1hNqQZq2jwKfwdPsFkxqJ0sPnqGlYAW61OfuJuvUfHk0MMnMk/niY/yx7T7m
	zD7QJEZ5jV7qRzktOcA18zvaGij8RbC1Cfy+ZRg==
X-Gm-Gg: ASbGncsXCzWB5dsXRckzDTugLhS8tjcAMYmXH671wz2U/wW0CAAg0/mr8wQBa8PMFO+
	Nj81+seDzU/JE3IWD8LZZVTlan1534krW+lmXMsXngxvrvHjsSM6wauVCXA03DSu1fhQyyozBb+
	BCoL/C5qpTdqW2E68wat3e/A==
X-Google-Smtp-Source: AGHT+IFF/xbTjLRtlqEGbjqNcxexgFOsx5O9KwDgL/LSiumuEdEwznWo16XbSoEfrNMe+sSZFz40FiylyZH+ARCcP7I=
X-Received: by 2002:a05:6512:4027:b0:54d:67d7:c52e with SMTP id
 2adb3069b0e04-54d6e629c18mr5591182e87.18.1745399554909; Wed, 23 Apr 2025
 02:12:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423-gpiochip-set-rv-leds-v1-0-2f42d8fbb525@linaro.org>
In-Reply-To: <20250423-gpiochip-set-rv-leds-v1-0-2f42d8fbb525@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Apr 2025 11:12:23 +0200
X-Gm-Features: ATxdqUEmXWqr5ybXE-1jp9J-42SDUfB2VtIVs5Nq-RfO1-UEQKemrbEsyN5V6HY
Message-ID: <CACRpkdb1YRd4QmBnRpedMrmCb4AiY+KjCxfAmm9zRQkeTUsrBQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] leds: use new GPIO setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Riku Voipio <riku.voipio@iki.fi>, 
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 9:54=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts all GPIO drivers under drivers/leds/.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
