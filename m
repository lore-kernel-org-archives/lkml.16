Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC4A28A1CB
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744705917; cv=none; b=n0/GLxq9MExmI7MvkymXnQCBKd3OmUSqQ6Ow7CJTigy8OAzrrCEujMU44Rv1n2cCgWIdUfg05N7Dput+VJZk5VLgnJLfRRQ68q1Mo6awM2ByGzAYu1MInlr1kjn1vzgF7MtOnnkmktByJ9HLRFb22TLZz1Z8fqyo3WRppXqP+TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744705917; c=relaxed/simple;
	bh=B7riYPHIhu0uBRv6x+RWfsJSyYqOl1MEa443E4KREd8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ny5lh8VP5hThIGAwu15yyhpPbJhtGgcz0NTCVspspjq3oR34LvyLhykpoPyYuUG/fankei5QQUycB7lvx2qC0p8UzGFSiZ4QNRHa8t6uiv6Ee4yIGdacmbj4sK6s5FQtp1vxsW62H91fjvccnwnmIa07ce1mFnFmz2+a3KQUHvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H40CaPJL; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H40CaPJL"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30bfca745c7so48227221fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 01:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744705913; x=1745310713; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7riYPHIhu0uBRv6x+RWfsJSyYqOl1MEa443E4KREd8=;
        b=H40CaPJL8XETrIfg/KZlt4culzIj5IK3oUjUHAxBXbc5jY5TtDcMWxUxU/kTV1LokD
         4Ko7Y3yIhouQNwWAhH8+X4XxwC4exAdT1SDkr4Gbww9C3jY7iec2RYV1DfBsEuwYxSbi
         8k4jTzIV+izcINn7vCinToOaIEi8G3iziolRI803AQenJS9/99W9mCXiaT9yyLazwMgX
         25t9/05lBajlqbaI93eAeZL3s6V1IwCOR1KP4yYVb8GHGfVqwon/5cMGDOt0FQ6voe3d
         pgDH7RZ8krS52135oNmV14Ov8DCxaZ6vkoqzKyqk0ygb1v24JVRKJrpuj+Z9HfkgefTt
         4L5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744705913; x=1745310713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B7riYPHIhu0uBRv6x+RWfsJSyYqOl1MEa443E4KREd8=;
        b=XFEqPxnojFagPV9LiM8H3Wh6sq+xvLGJ8mZNsVScMt9Zjudf127sIJY/dkobsSFXaW
         4eSSghtTlLpDipwfwCPO6yC6A6n8xiZkGWX+xlL//uqSHzdEIdcRxWrihJGYzdko6SOd
         BbfwIkWZn9mBykU/WEKuK6WqK/g8hp5UBClztHgdgLoGVwSnPoV0MyvLCBQvpb8VSPpA
         tUXM0GyVO4t+XAYCov77OfaF/6BVecywYJDrIuAC3Omak5HX41puVVvnZtAlgdDaMNw9
         63jDbzG0fXo4TKFkyzKiEd2uPq0rHwFXcUxb1tgeQdA0A8P8BIaS5bbkjU1L7PFFDgw7
         wyug==
X-Forwarded-Encrypted: i=1; AJvYcCVMHMVDVjG4984mcrlJxa5imQ5OEvF0y1+CWK/yzgmjrVI3isEO+I5pLjG54vwmXvn5FVjfk/pgy4YpDuM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3fRtakOdO76Ng5p00lsBWu76WJ6nT1ZL7eoqZt7uL6Lm7qm7P
	OygDaEbJ9mWRwkEqeHSlzDUKtLm+KbLuVzZyIBCpFNIguztw4IT1yJVErzZvr8xU92TFHAdyaaM
	m0WTdWav60lJXkVMEkuPY5jHCgq4pPiSJLh9Oxw==
X-Gm-Gg: ASbGncsjrLD4Ts97GPx4tHiF9KJPoUklTVzg4tOCJ8tWC48jyCvUViUXUKI8GDtMugx
	VUpUZcR8C6zCLymKCMhe+dOZsVJ6LIQknCFXNfGoEQ9ULypo+xPDlOFU89apNrtwmmplYOZ0fTf
	QMfFI25cFScvkrCb1eJWgM6w==
X-Google-Smtp-Source: AGHT+IGH1ng3eemaLiy2FccAdv5wmGCyisWcTNC6F3IB//KuZUZl3sZBa6JyDHfOEAGA9K0ahHlVeoeGPs038wmjQjk=
X-Received: by 2002:a2e:bd85:0:b0:308:e803:1180 with SMTP id
 38308e7fff4ca-31049a7e306mr51922881fa.31.1744705913598; Tue, 15 Apr 2025
 01:31:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-input-v1-0-a8b45b18e79c@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-input-v1-0-a8b45b18e79c@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 10:31:42 +0200
X-Gm-Features: ATxdqUGjreib7Xgx47uV3zG2PDCmOkCmRcW5QPy9tyBeeK1O7_SOAKwD-7sRSTE
Message-ID: <CACRpkdb0Dy7m51R7ssrAHvs-PEiyEV0V19NHLPUbKqt77znQgw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Input: convert GPIO chips to using new value setters
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Michael Hennerich <michael.hennerich@analog.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 9:19=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> all the GPIO controllers under drivers/input/.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
