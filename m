Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B392253FD;
	Thu,  1 May 2025 12:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746103502; cv=none; b=WC+bzhkCIX2UAzlOARPZTuZcQhSMmmPnwqzJMb6T4aMCFuQ94hd6SG9ThTSmlBxJwOj+hwKapVxtGuEXj6MvOVxZcX92iqZn3QQdDddR3qpuKoGPer444PMPxmffdAoqoMs4ZXSW/YUE9Tofo31O0exknaqByFX7UV3yM9TrFxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746103502; c=relaxed/simple;
	bh=QKMTwiIEsJGFLzMOxm3KyHZoz9uomV6Tnu1SO/dioxM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CRTVayc6VAbmXHPOJv3Bs3dy74ZzFySxramr4pv71ALeSA6idKLGEne6LQCfTvV5Cv65jMGpTbBMmjvibgLtwZ02ykATD9x/RHXCIFl8AhO3a6W63wuCWwuBRfI42niR05uGFs+sT/7aFEvGsGzJmFVgWPZfDkH20wyFBu4jWEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UTf3gk1K; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UTf3gk1K"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-8640d43f5e0so80605939f.0;
        Thu, 01 May 2025 05:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746103499; x=1746708299; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QKMTwiIEsJGFLzMOxm3KyHZoz9uomV6Tnu1SO/dioxM=;
        b=UTf3gk1KIDIomD49D5y9iTH84A/POp19ycIHIqZCOQbA08SFKsL/A8lwBgkX05Uf5J
         BvohtAb36TCX4Kac1g7l7bY3uyjWo8hLzd7jxIDZ5VDGQpfti5FUMmbmwPgL4Dh6dTZv
         PLrxf/MI5peyYHwckBreQfWHbFbQVQehQvB1fvKU7bkks7pNrGdZ3/XFuDPSOJ/h1BwZ
         9869t4/PmRBpp6ajJLOXUF2D7LeftESj0XcBUngfJV6B+ktntPjhpVhp5Fv6udwJPLEp
         Z+B0QqBENp5SDiFpTCHoMF/++27z+lI10qCBdrn1wB22h+BFcFVIqd+klCBJEcOuFbie
         RtpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746103500; x=1746708300;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QKMTwiIEsJGFLzMOxm3KyHZoz9uomV6Tnu1SO/dioxM=;
        b=YvzYxfHeHWGLu/ISJa8yif3p/KzeCQhL0a2v/3bYTXQ+L+EmWeltImeO80L3Fc+f11
         hF994Zh0qBSdn46gf/IiOfoG5suJ4KdjzN/7lBed1vzTuW39ptstUEgVyxahhqMg+SBN
         3KaCwFbK3EjeS9A6dHJblqhqhsBnXCkdSIkUC3hnks/1JZ/ZKpALWJL8kqm4sddaXIad
         jx7VNJknfGxTq/0d4DTj4lQ//Pi05q5FCXl8IY4Rq4pwsWYdBEQnhOuODAa3vJVTuwjY
         Vdsnri7hcRWkjDxoPG51Be08B9aToQyZIRpoh6Y4S3xIjA/ryZD+fZttrzA4wFx+yL0s
         RAMw==
X-Forwarded-Encrypted: i=1; AJvYcCUKunX0iSga8Ma84pCD4ORFgNepmKxTe0nuvu+TkdzTfss7SXYH93qruWa12gincLOJk3WOuYKTDZYaug==@vger.kernel.org, AJvYcCUjvg06PbGemcGE7NuyKg3fqxNFnIcpVS/99e0P5TO6rasVo3mCcX4HVOw+fLFFgKpWJCD6w8e1RKaqdtk2@vger.kernel.org
X-Gm-Message-State: AOJu0YzrOmKMWXAz1ZQPXcQRPgd+655vY4vqAnq6DPdFwGgvKV091Fef
	VSSoSzAjSNURuabnRhU5DaMcUBNG8mufVfviz8fpI0f2VwHC96VqL2f4hlQHydfRja48pdF7hfo
	usBDKug7ZXdzOmeU65I/LlZoTr8Q=
X-Gm-Gg: ASbGncugFfUhKfiiB4cJtul0FYNJpl45qnGM1rAL9u/Fc6qaIsbw9GxosTHl6nIMxxp
	I4UGPD+qSwzhJ/y0tzPGwHhbwcAj8tiSOQ8Q0fo01J+3EeGDtejH+6iocK9GPFeNnDk91lgOvis
	Z+Dale19MQaFdEdQGaNr1LEW4jpJVaUjvBfEgbeWMBsSSWHSWn1rv40w==
X-Google-Smtp-Source: AGHT+IEoIlQuzwtCK9CN1q8fmd9BsjDzk9j05eb0BG++LrJGjMoq0gvDeKEJcBKjptuWQPARgPl5+RibVhiYEbL//Lk=
X-Received: by 2002:a05:6602:4a08:b0:861:628f:2d2b with SMTP id
 ca18e2360f4ac-864a33889d1mr368032539f.1.1746103499702; Thu, 01 May 2025
 05:44:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425200051.2410-1-a.safin@rosa.ru> <CAB95QATm-iNJokfcSxpen3YBbx6xNUrecELD44squoaqCQ-b7w@mail.gmail.com>
 <8dec9c47-d13d-4e59-b1ca-fcb9e3beccbd@roeck-us.net> <CAB95QAT4JJFYiXviJB78KELFnsitDj=Zb3EM_1F8uqiRHMwBhw@mail.gmail.com>
 <38c7114e-3ea0-4f4b-bb12-5715c992656a@roeck-us.net> <CAB95QASErsOGibQ1+kB2LjNr-v3-KS86w8KvGLurB67D_4Bt4Q@mail.gmail.com>
 <1e5fc32c-04dd-46b1-8943-03fd9370bfdc@roeck-us.net>
In-Reply-To: <1e5fc32c-04dd-46b1-8943-03fd9370bfdc@roeck-us.net>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Thu, 1 May 2025 14:44:48 +0200
X-Gm-Features: ATxdqUHrkiF4YmBR0wjOhrH4quo0zYC4OEL115_6oBV9Z9613-E7jJGLbdrBhhc
Message-ID: <CAB95QATpPN_jGK7HvwqeWSPU9f15x26j66K2sUDk0pf5b=4NBw@mail.gmail.com>
Subject: Re: [PATCH v2] hwmon: (asus-ec-sensors) add WARN_ONCE() on invalid
 sensor index
To: Guenter Roeck <linux@roeck-us.net>
Cc: Alexei Safin <a.safin@rosa.ru>, Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 May 2025 at 14:34, Guenter Roeck <linux@roeck-us.net> wrote:

> You do have an excellent point, though: The messages should display the
> sensor type and channel. As for logging it every time: No, because _if_
> there is a programming error it would clog the log, so once is enough
> to tell "something is wrong with the code, fix it". The same is actually
> true if the hardware changes "under the hood".

But WARM_ONCE() can not behave the way we want, as far as I
understand, printing a single warning for each sensor type and
channel, can it?

> Regarding RAM errors: Those won't be caught by checks like this. You'd have
> to litter the whole kernel with checks at almost every line of code
> to even have a remote chance to catch problems like bit flips. Even
> then you'd still not catch cases where the code itself is changed.
> Even trying to catch that would be futile.

I already had a bug report (race condition in this driver, another log
message in the code) that kept me puzzled until the user reported that
it was caused by a malfunctioning RAM module.

Eugene
