Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA9778F5D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 10:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751451440; cv=none; b=rsoTBqbb2WzW3yE8RdbDZ81lL0PErkJuzWML7+apXqif9WNi6Ut1gTJEWwsZPGB937S4NPLpydulfNMlwmhprGHLdDKiI/drcsiYm778VdXYdoJhwIDw3iWUFgqpC9mPzKU+5B4SmOuwj+HTuQWUPXT0JDv7Ir4NRUNL6tBwG8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751451440; c=relaxed/simple;
	bh=OQXKIEV7E/i3m2568pnhNxUhnfzOk+xoGPAzZX26p2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b5u8YUHPubrFd34MO98usxDbY6bndQQojjzmtAk8Gm2TkBP+P1gQevo5SYG9uCIcvL0TegYDnOxHvHRuqambz0r/ySa1jWCxgeUG/wvDAtTRlBe+JNF24OhpRp+tQ8MxXvWyD8BrtmQvT+wYR7bpB5lZ4AiAcwshniz3mlHrJlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PncWELkh; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PncWELkh"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-713fba639f3so65373577b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 03:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751451438; x=1752056238; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OQXKIEV7E/i3m2568pnhNxUhnfzOk+xoGPAzZX26p2g=;
        b=PncWELkhYStIDYvpkt+cmLi7ceI/MofG9FKaUWvhVtX9ofMSsD5BZAujzKYZeVgJVs
         t5HSNQhofqMPKHNfIeXWEvkAyYA0U9XM9KatJuTxoN0yDgyWnpndEdlu6LNMQQ9VMcqv
         PM2TTpOvd9+Elb+lkD/ben5swF79YAN7A0oxo0KEqxzpgA4c7kqm/IxPUbTGrz+0JFQE
         +N7Pb+kniaZcR9XiyO+hJjbksJ4dRskhEJ2qZ6kwndynMBfX0bdB2s/BNeUkGWgInv8g
         XAy/UbR9lmPv9+hTiPwuXkgHbjS05hVg7h5BZaPizZUWt7ael40h08qsla7QkOxMnRXW
         rKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751451438; x=1752056238;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OQXKIEV7E/i3m2568pnhNxUhnfzOk+xoGPAzZX26p2g=;
        b=ZCZ3FmiWF4Dq0QS4jo19V9cuIM+giphPggZiQ7GPcXVdgqMlIqV4t7KM6OkXrunPnz
         ZDh/FbBkxJ9L4wQrSp/veaKBz+P5JlUO8/XwB/9OEvnBh+nMUj7RVgo/4Mmfg+d0b5hQ
         j3AUNuJzTGPcpganPMvrJ6kXGdpZam3IpPPQNG8p2UIR01fNSv0zvvxi1eNJfKD4p+ut
         R2R2YvfBMf+YLQmFjETqgkU+3dPQUGbEY9KRv3M7ajC9774uFEyAcJTIxg62Jef8xfSl
         D8we/+NhLpHK9rWw9kmQNDOtmYKFwx1iiEaxbymRshcR7PL4wZyxltbsKTcENED2h5Fk
         j0Wg==
X-Forwarded-Encrypted: i=1; AJvYcCV7Qj3EJshCgrPtycRPkmO2HyWl+AkGBF14+0TzhYUlQVT1nvIINcBlpZlQpC0PScy3Txm7R58cRTayOhU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTk3VHt7wGUlU4XDdz3fUl+hYH3YvuOJXYPHBHC1R+3X1c+J2I
	ssU+06HmY0tH1KmfUKBUgbpXmjm8GlZtZcw3HEza8iuY6GawkrRfdnPbBFKfxRJoVRs2vjoQRFf
	Zg7qcC+DpYd5dmhC/i9jePYW+2eqkWiX9MbTKbJ/5Zw==
X-Gm-Gg: ASbGnctWsFZxLZxAxBOiiTy/kPs/mkJU7yALwZOdl+KWx02TpsEXDi7iAkrJWw2BGUH
	5NETs4DaU9Y5RjmSSmlf70v6mJ9pxPa6oSjCyR/3a1EsfdhRRilV6mP/T4vaVI05q62To9Xgzrv
	EJF9op9dBPeWL1O0Ph8uodbahLncWTZMSUoj9Kovsgakb/lnA6WcEdfQ==
X-Google-Smtp-Source: AGHT+IFkxNQMKBmmJ9CHpNmpP2Eu7W4sPO7KthCl2z1kt7FCPHBJbjsCw8uI9+EZQUZEtSbd0EqItRiyQR16Ssqrmf4=
X-Received: by 2002:a05:690c:4a0b:b0:6fb:a696:b23b with SMTP id
 00721157ae682-7164d571f91mr29995547b3.33.1751451437681; Wed, 02 Jul 2025
 03:17:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701142313.9880-1-terry.tritton@linaro.org> <87ikkblkff.ffs@tglx>
In-Reply-To: <87ikkblkff.ffs@tglx>
From: Terry Tritton <terry.tritton@linaro.org>
Date: Wed, 2 Jul 2025 11:17:06 +0100
X-Gm-Features: Ac12FXzqBxkveVShIhOUpDdDjk97AbKpwZ2ofDUlNcnP0hGUSjlvZVzO9wDFzKE
Message-ID: <CABeuJB3voQYT0FZ2ETBL_OVW6Lec6bOntLfKQd_J-huJJOyzHA@mail.gmail.com>
Subject: Re: [PATCH v2] selftests/futex: Convert 32bit timespec struct to
 64bit version for 32bit compatibility mode
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Shuah Khan <shuah@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	ttritton@google.com, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Wei Gao <wegao@suse.com>
Content-Type: text/plain; charset="UTF-8"

> > Signed-off-by: Wei Gao <wegao@suse.com>
> > Signed-off-by: Terry Tritton <terry.tritton@linaro.org>
>
> This is still wrong.
>
> If it is based on someone else work, then you need to attribute it
> Originally-by and omit the Signed-off-by of the original author.
>
> If you just picked it up and adopted it to a later kernel version then
> you need to add 'From: Original Author' and preserve his Signed-off-by.
>
> If you collaborated with him, then you want to use Co-developed-by.
>
> All of this is documented in Documentation/process/
>

Ah sorry, I thought it was just the order that was wrong.

Thanks for pointing me in the right direction!
