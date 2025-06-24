Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAAD2206BE
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 19:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750793158; cv=none; b=gt0LPzzWrbxeccfMNlp8L8kC0aSpiX2MkL0Wnnv1MoPvuxlbC1aNgUFN/IPIF5HZO2Jnnmgxr7l6TEplMqDPU/9sNN2IPXSttiuZiHY1ZQkNB8Vttb1Tpj4dcBUTMKG4k5Ppj+VavKNJqgWWn3Zg/mys8/ZRG9M9GYR0ccG+LTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750793158; c=relaxed/simple;
	bh=O/XxGCdRT5677dIKZkpmfz5WR25prUU7MyTPbxh5LeU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uHl3Ep48yJfvjhCOzcP9I74OT8INcxS85oKuHy7HD4zSBb9v0SiGaQm9RIn4oh11cFdGxiF34L9CjPmWl0VQqsJIYaC0U9suB4F7ZiTs8Z1PrAGVeZxfRNDwyOHRdEU+FF75mrvGXuWlKABtNRdA+ne/0ajxCZuVRMWm3R7QE6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NfnnfCxV; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NfnnfCxV"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-553ba7f11cbso1030579e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750793153; x=1751397953; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O/XxGCdRT5677dIKZkpmfz5WR25prUU7MyTPbxh5LeU=;
        b=NfnnfCxVTZd7vJZFXIchr7HQxz24q5dE3bI375lFdIApdI7qd/26Sm94VXv8x3c6R+
         O7LJTo5jU/r5UzkGKdGV/NoRkZRNmeH0FR96bZKyxvRuSy4p3Xg1K6XqkWmGC4HR0c9M
         o/PgO2urM/sgfqUcvotKMLq1dLY85QBtM5UmqPDvVune8qP8yZ6YZ2bPzaGh8cyAi185
         WIvdXEhhOX34oEZPA05gqJARP9gOtZv+DVtpPYUieA7nyS1YwzFL72W+brZ0c7qxAigk
         lVAuaev1I5brqTRXjyTCShajxLrIqUzELaJfqqXABMQw0OkVZFwZxn0gIS5+2+4kKonY
         38Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750793153; x=1751397953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O/XxGCdRT5677dIKZkpmfz5WR25prUU7MyTPbxh5LeU=;
        b=WLMtBnocXboUwO+7ptX/VA8qw0PpUNEgYrhGyEdY0iz8xQC8EwyFgDiXzeeinIamKo
         aPKXbAV/IcD+Be6jrR+hluxkcCqJ2GDze0SeTBnq3gU5IjVjwJ+/7Wfpwe1ra/UKidLA
         zcdye++ablGE5mGKcJU/ThyPgzvIevs8BPQRYLkX4QpZbGoIM+Wg/D+uEvN2Cjk++tZm
         1CuDNq3YLa4D84xbS3+njx8GvhicsTxEKipTPtOVsHdSBEF1w3mtPFzgKYDzP3KuaPdo
         oL+0vlHce8hwGe5cmCaqABVxCTuOqsY8Q86xsDKPntlQ5xSCkWzTkn/RZhf19s87a1Rj
         AejQ==
X-Forwarded-Encrypted: i=1; AJvYcCURJCawX9V/LWr+HDZLCahgfIck8MZ03L+jK2O/KxXzIE0H3nkvNFIx3Mee0qChc0gMlCfLV4VqHx9iTYU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsPuyspCPY9J2jcRaE0XUhRz7nEblxTgSBcjJhbr8bnK84PTH4
	+JzMwOyx2/zYzxrghksstWvnb0VDoXrXQIiUXbB5uVfTWdwHl0L7emqaOi9YmmrGV3RL7XgZeJ1
	CvPav15D4u5+UcWddcERshtytyE9eztAOQ3tdOi4iSg==
X-Gm-Gg: ASbGncv0ti1pR1DyJRuX16uFLLd39QGeaFJwWg8fpjm8u3qphYGTvOP32vmSKtGBQCE
	wEK/3Kge0HYpJY120M7+MIRqUEZwGiEImFM9eegprYFau8K3K1aD9nL89Za0kzMjnP5eWas2krf
	ZM7W0trXCVMUGSkS/DdKwwldyal+hwElHpD78qp4KU/II=
X-Google-Smtp-Source: AGHT+IGfIYY9ja6+MyS7nJgRCe0NKGQFj0wJs4m710HBtSTQrEiLVhY3RtHa3mZNxJGIIiJJmkhYu1xm5OosUwV6rEg=
X-Received: by 2002:a05:6512:4018:b0:553:a740:18aa with SMTP id
 2adb3069b0e04-554fdd19f31mr29838e87.22.1750793153546; Tue, 24 Jun 2025
 12:25:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620-gpiod-is-equal-improv-v1-0-a75060505d2c@linaro.org> <20250620-gpiod-is-equal-improv-v1-2-a75060505d2c@linaro.org>
In-Reply-To: <20250620-gpiod-is-equal-improv-v1-2-a75060505d2c@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:25:40 +0200
X-Gm-Features: AX0GCFs59E-1SHptMGQVMOGsJv3WHoWXZBWNBNSQupjPdwTjOjfHVsxUuY8gVro
Message-ID: <CACRpkdaF_h69v3JWdfu=m0BFV43jyDVvXaD_f-De61DEcB6qzQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: make gpiod_is_equal() arguments stricter
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 2:58=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> It makes no sense for a GPIO descriptor comparator to return true when
> the arguments passed to it are NULL or IS_ERR(). Let's validate both and
> return false unless both are valid GPIO descriptors.
>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Link: https://lore.kernel.org/all/Z_aFBfjb17JxOwyk@black.fi.intel.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
