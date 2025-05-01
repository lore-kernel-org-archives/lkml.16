Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324F3218AB9
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 18:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746123189; cv=none; b=ZRxfhT6kezU0ROZARAuFRmdXGXX0KrrjvlkD8/XeYHrYXHZUwLj6cL5rcvg4ci8yd/eBweZCMIIgJcB0G6lqfhqO2uiCzdCZgAcDwAIO0sYVv8GauNsj+OppvWUAnTSlx7mPXyvTgXFJxrA1Q0YgJ6St1Q6IZcRX9kwkMngt2GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746123189; c=relaxed/simple;
	bh=orKMMdq9gN1Uy0eUdHFXvJY2/aFW9UG8f5Jw9EztR+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YQ3qv/cnDqM92EsegoL6Eluhgc0fMWy8OopeW8ujYRSQ2rz4NdV3velKx1wtY+6/XgQa+mO5tE4+Mps9GPcRq5Muk79UUBrzHKxp0PlOpFnM0H+bASt9xqZUDTewWfFxf0UBCWGrFE2mLjJCJD9xTDRkBx5W1/9xveKHHImzgvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R/tSD/l+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R/tSD/l+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746123186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=orKMMdq9gN1Uy0eUdHFXvJY2/aFW9UG8f5Jw9EztR+0=;
	b=R/tSD/l+XfqiG9mLXUuDD+n9pioQB9PGVaZuEfWtZ3PMbtJOohlwexZWHFHqCMmCN9zeNQ
	8+1+aOT3TdIvg6NM5EQCqwl6xoS0jYVVyjzPom9IZpUQAw3mXG78cB4lf0tclMsbrxgs3h
	tpIphh2tMPc0aHn1uKzIV5TC0u1riWE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-193-zYZaPd7ROdK9oYzZuLncjw-1; Thu, 01 May 2025 14:13:05 -0400
X-MC-Unique: zYZaPd7ROdK9oYzZuLncjw-1
X-Mimecast-MFC-AGG-ID: zYZaPd7ROdK9oYzZuLncjw_1746123184
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5e5c76fd898so880301a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 11:13:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746123184; x=1746727984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=orKMMdq9gN1Uy0eUdHFXvJY2/aFW9UG8f5Jw9EztR+0=;
        b=ZUG5hTtkNdIDf0jxLOnVZR/GkgoT0DYwDVDFIB6MZZHpkRg7vaV9PhfrcW3LUL8pKU
         HGSxXJTragEMTZPwiMZNQ6FLMMkZSWlvblyZhlBe7PknOqQoEfHUQQlmEyQjrkoC4Mbn
         xeDQFN4h9Ujg7omZm59e+GXSQIhX7liG1nGUW5ZxXhKr8BF2Lp/IhMPYkkrgtRsmVzs9
         RIfqBnCpzm9tFLEezOQoaWXIjWr9w/88PQTSYJQ3HyP9+eqHJRmaK3rPl+XJRjvFn4Xs
         9aKdC03wLwN1lBUASvQ2lDXk10M5hvvYywcCxFDz1oc9ZavuENrUGL4g0UbecZ2lBAcZ
         YPDQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7RxXx5CisQ+L46ZUUNEAAQ+Ia7+5u6kg2EFgxpW1HImOfiY7st+j2LG63jMxcOJ53D36fjwk2jpWHKjA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBXA9WZqkYn60HQGmCCBMJrKercxFQtcmH7PbWUQih6pskjAu/
	+9Lp2zRJwmri3WbO4q8tPUmu5TCbhuHGW13v56j4wA3XH6SmY/OUDCIm64k0u6pjl8GbKQjkPwH
	bfGIHjmTutA+BfeX2jULvITEUNDw95xNcwiPSUsAro59BVr9hYogRpfBw5/lQ1I8UZ31nUKjPJX
	AIiLYYD3wCJgGb/OgYiNsfkxSSg9tsxdnOqVo1
X-Gm-Gg: ASbGncuiFdvFOFdNaI9Kz6SFx0cGfWVNjHmnuy5/yu+LSEcmPa4zEEmSI5Gzp+OdIDG
	WaWiRMMh14W2wWxViLYtuxCgWgOxtUhSR6YqIeH859d28hIh+40zEUKtW4PiHARaTRU50GV2rc5
	9D220CCusO156nVGFB9zCZH2OAeSs=
X-Received: by 2002:a05:6402:2712:b0:5f7:2893:a6a4 with SMTP id 4fb4d7f45d1cf-5f9193c8ceemr3025577a12.13.1746123183802;
        Thu, 01 May 2025 11:13:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzw1qAMlPTeCyAI2DAnaT/0znUw7Y0kh1s/V5jH+CzIvUHnnt20FZtg5X6HDdIHPTx/IhQPG4wRtra2vetY2I=
X-Received: by 2002:a05:6402:2712:b0:5f7:2893:a6a4 with SMTP id
 4fb4d7f45d1cf-5f9193c8ceemr3025554a12.13.1746123183440; Thu, 01 May 2025
 11:13:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250127170251.744751-1-costa.shul@redhat.com>
 <20250227200623.60f20571@gandalf.local.home> <CAP4=nvQXaFmemBeW8U3U9zTMK0gVYvp23gfq_6ALsBJPTXt9Uw@mail.gmail.com>
 <20250303150351.28007ad1@gandalf.local.home> <CAP4=nvQ9pXYtihL7HTTRK=EzUEubtWbxDr78JswksSo-wa7zYw@mail.gmail.com>
 <CAP4=nvTCVLa5MzBbJVz=S_ZiDoJ2hY-8fM+uRnGgumi0sFivWA@mail.gmail.com>
 <20250304121053.06b84874@gandalf.local.home> <20250501104251.46c2e1fb@gandalf.local.home>
In-Reply-To: <20250501104251.46c2e1fb@gandalf.local.home>
From: Costa Shulyupin <costa.shul@redhat.com>
Date: Thu, 1 May 2025 21:12:27 +0300
X-Gm-Features: ATxdqUF1UicCo53Lzxl87-4gQodTQGBOAsSCzXPl1dl8uCilZuvNe0SaqkbpGhw
Message-ID: <CADDUTFzQuwVCXO=BDhx8pXLo3Z-3sQMfw1-wHtB95i4wWuuv=Q@mail.gmail.com>
Subject: Re: [PATCH v1] rtla: Save trace when option `--trace` is specified
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Tomas Glozar <tglozar@redhat.com>, linux-trace-kernel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 1 May 2025 at 17:51, Steven Rostedt <rostedt@goodmis.org> wrote:
> I just noticed that this patch was never applied. Is it still something t=
o add?
No, it=E2=80=99s no longer needed =E2=80=94 we can drop it.
Costa

