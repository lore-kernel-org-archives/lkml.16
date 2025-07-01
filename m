Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7041F0E4B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 16:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751389088; cv=none; b=YxqyLJu47zdHjf3GJXVbX04MkJWYkmp8560pp6q97eEf2zrXNk0AfrozgtH3PdVGQhSdgzEgqk2CZDdZx5QJesvrpVU0oYDbPOXCTZqZ5PjsyptMBl00H/5xIW3cV4bj29M36TjMvM8btZlkw1p325cIH1V9LyfLSR55MQ35g0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751389088; c=relaxed/simple;
	bh=dzI4RRItBwP5q3Y5PX2f12fubIl/5nheXaVm8tXeqzs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mmhhdsoqEo+AUJaksey2aRr322Y76/2SC3o9JvUj6rnQWZyDtQzEfAfMg3no21HSd28WHDNImdpWEMxDlv6r3o+5VFeBinx4JbmEYxujnt73Vma6K+SwWra7QLeJWpxpFKeB5HlNcTPUR0mThbILvdOVt8Be/HFuiDdIOlc6aBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=o1uSGvQn; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="o1uSGvQn"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-553ba7f11cbso6966572e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 09:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751389085; x=1751993885; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dzI4RRItBwP5q3Y5PX2f12fubIl/5nheXaVm8tXeqzs=;
        b=o1uSGvQnoBEy+UbAFy9CF84H7qNMhTqxEH3HUkeZW3RvShGbjlnfkQu93n/0SLjyMt
         gX1tXUt4hheVI9bqOti6idL6SzxwDf74cFhyE5MBjPIVJiItmVn19/8of8u0t4IJf2eg
         1vysT+58K2YwFGIDQuCaV5AglbHyPlACQHpXTym/MbglVOSaa+BVTk6mvzrsuZB7cV5r
         T6FXggU6qs1JPnpJbLXE7S9eJxjghWpwGEnb1Z1rJCS83LwN+Tykw/BEvUKhtVevgyZu
         2kHTc4BjyWC1pQ3SGz3n64OlMXHBtMGYY+WSdGtO6CewpX32yNy3zf2V3teT80Z8b68X
         XsWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751389085; x=1751993885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dzI4RRItBwP5q3Y5PX2f12fubIl/5nheXaVm8tXeqzs=;
        b=QwyxxV+hOv0bWbGV59uFo3qcG8BgpSSNzBaHUfdoT7mHWuvsWNN++VOpwZtwoAKcc3
         WL0lNBmmVZryWEjx5xAD38iV5b2IIhOJ1sI4MiJBx6YK3rg8/r0dD5WauG4hYAwDkUEA
         fiLOP+cwln0oL0hiRPjPbH5nlRDApUzEXUZybZ4EPI/a2caLOJaFt0vDFogxaa85S7F7
         zOq2CyuDQ5TKW+BGfo8mpa9P+S6KIzLko4LCTFjv/SezvQCT+Rn16u777C0rQPPcPfKw
         ansoIo/bGKf8J5FesSM51pC7Wd+MgeCLoJNLJnuMy5bwezb9HykNWCp1APKJXxxwWkRS
         PlZw==
X-Forwarded-Encrypted: i=1; AJvYcCUWiUKe8WqUHjE+D8y4cVZbaaRqVbAv7VG12n3aFU4TttKQmHQdYcYzm/7HlSPJoMm4ssTK9LkqE967ciE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzN6cvvvKERMRERjl+GtmVuJLEhp312qzeTcqYNbW9fXyO88KnA
	yLWNHIho9fcpLlZIdcKWmAwOeLc2MSYvf+zVFrG6Zbe7vfUQks1MwoZBdiPPjqzFc50LVIhBeq/
	JH+wAB31qM0JG9TvkeXevMO5sHUM+tBmC3CvTPgj5slgesIWvB2jTCSU=
X-Gm-Gg: ASbGncsX0m90Ycng6xMzDuOP8KQHGUrFCH4vHla6kiFfNgYAfj0BPa+huozRroKXRax
	zqlvjnAkh0/TeM1M4VpjXtdoRq/afDOiwqLUASpzKaaAgiFxyencNnUfOrpzqqUXato7i7ZKZiH
	9TDzByKkVH4e2Ymb4YNh1FAWihxqDGzWHNntzlY7dEo0lZgvoeU8r7RDYEhv1Ic04qKIC/D0czb
	xSqBX8Q8u7y
X-Google-Smtp-Source: AGHT+IG64nPVO4Y/HQMnxFfKxk246jSY9LbY+uqXpxjn3azvh8I161aO5RqsHD6Sfyyidkbufpf3uFPmik9YHQGyJsI=
X-Received: by 2002:a05:6512:3049:b0:553:2418:8c0c with SMTP id
 2adb3069b0e04-5550b9ee29emr5961397e87.57.1751389085164; Tue, 01 Jul 2025
 09:58:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701-qcom-gpio-lookup-open-drain-v1-0-9678c4352f11@linaro.org>
 <20250701-qcom-gpio-lookup-open-drain-v1-1-9678c4352f11@linaro.org> <DB0UKX1N7VZ5.VYBEG94Q6Z5I@linaro.org>
In-Reply-To: <DB0UKX1N7VZ5.VYBEG94Q6Z5I@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 1 Jul 2025 18:57:53 +0200
X-Gm-Features: Ac12FXzDTOrYTtHpYNbE_jTA6vgiJc1jLZBGQpE_nFsAEMlIS3CpRo6kKLC1EjY
Message-ID: <CAMRc=Md6+p2wT5rZWOBwUMFcLw_p4rANBxbG4pvWyM6AuW1wAA@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: qrb2210-rb1: fix GPIO lookup flags
 for i2c SDA and SCL
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 6:09=E2=80=AFPM Alexey Klimov <alexey.klimov@linaro.=
org> wrote:
>
> On Tue Jul 1, 2025 at 10:01 AM BST, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > The I2C GPIO bus driver enforces the SDA and SCL pins as open-drain
> > outputs but the lookup flags in the DTS don't reflect that triggering
> > warnings from GPIO core. Add the appropriate flags.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> This works on RB1, thank you!
>
> Tested-by: Alexey Klimov <alexey.klimov@linaro.org>
>
> This also should be:
> Reported-by: Alexey Klimov <alexey.klimov@linaro.org>
> hence Cc list is not full.
>

Thanks, I should have added it when sending.

Bart
