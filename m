Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5589213227
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 13:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743428740; cv=none; b=ZXg33ljPBVmZtHfglisORkqaR2/njgR1vUs1VaEBZLbzo/K/xXsZPefA5v0eMYUdyR7g5psicO3mHwJKY/Oy+qRDLttTe+U8Ps6vJsllycRpKG/2HvOy6vkU/eTevYpKi5v+kq0i79mkI2haqsdYrXkDgOZxHvrpEfD0lj39sBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743428740; c=relaxed/simple;
	bh=aOlmFBzZTr+Z4QaTguhR409fdizg8sxch+ZSAM+K3/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QqwRDfAek3Wtqx/t5mcoI/J1OUHu7k3A+hKhZDc+qfS0A0Y8elyz8C5RZ7AqUY5ijgRFvlysUHbf9/pYRRGsRAUcO5r8VpsKLFiL3ZVrrk01pfjZudzDx9Pj+lcUF5gn5MG8JB8Uuqd6T6gznGtnCjiTWTzCN9rCtcuskgkp2fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RNz77ELw; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RNz77ELw"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ff6a98c638so8979643a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 06:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743428738; x=1744033538; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SDFIPcBuRwgxrj+1+ohFmqtx+8KcK/O1S+ZXl0ksL7M=;
        b=RNz77ELwRYHAs/KccwKdfOUhf6OasbVTE+HfUAOT/eRvOIdDo4jnBrnAkkk9gjNrL8
         y3oEfsGY7pTHMru0QGcQQMe1y/I9B21DGbFJSDmjaN9tzD/R+WSs6PhOe7GPRTc/yebz
         DzXR5dheBSuJaOUFh6yupCE3XPPjhHRD5AiZUAUJF5kCZhlYL93Hv27tVDhF1bxOeQTu
         HzuTMzUw4sq5Ky1GOwH54/ztVnqN9kqZmidOMxcxJl8CLWPlFGjAe/IcOi+tTH7wveJu
         HftkMjB668Ka4RXTS06S1i4pr1l6kc41cz9hwkluDofJmnzOuJWmYohxLLzz9hzNFWzw
         O0JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743428738; x=1744033538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SDFIPcBuRwgxrj+1+ohFmqtx+8KcK/O1S+ZXl0ksL7M=;
        b=GcMe3FG9FgivlMUIeWciaEXjOMQR8oat08zLd9QhOIoY9j3uTr6EMUniBZLkmxLVX6
         ju5DxfFpr/ObfhdHc/emFFVCwOMFgXVO5xQs3lmHMjITjJ2mmULjGEnM6tN+VutyM5Cq
         UsC0nIBfHKzWLNDE7X9x2T8raVfQ4Iuy9Yjr2Qg6Etj0L1mPIehZSYaOGmFnnpi6GH0I
         otsnRsfd0bCAxHSS1TFePxr6qVdSy/FAGT0cwof2W1nBaqKxxgyQMLlsSRjflQP7eTCe
         1jV1XM0bDBzlpbQA4kXZU2NbZc8tEQjccNCQaXhDSo3psYdjhc25pmvXsb7AIj3aYH6j
         OiWw==
X-Forwarded-Encrypted: i=1; AJvYcCWCE5IicsaHq62fF74V5nIG1jDXTZzfWA+1d1u22agOql4D+1WQtfhqZgO1OdzuHfSGcQ71FDY8zaxQVaA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDgw/Cxsb7KRkwqxjdDAeS03uDjo8pJtG64ikRMgsQzdcHR7yh
	sy+bn35L7vYmwF69gVDkFdNd5CqivxUTWxkse76IcRlD9zPu7p29FfB0o5Xly921qQe0cTjB9P6
	OgD5phIJkyqgHEgem3535rB25uMs=
X-Gm-Gg: ASbGnctFKgZjVFDBUyGYpgvXskvDAnQ1WDWloaP9cEMv+UARdv7lfWkfV58YGHTAi1h
	Sz9dUU5ywYJYnnuzHvBH+8EWuGS4Mv7gkykAlNSz5XSIWxkXuWLuV196ZkD3DifG/ERcc8f0ZKs
	wBiDHKyFlZuIaaED/SGqAqnt7iQQ==
X-Google-Smtp-Source: AGHT+IG7eQvdLCXANjec8cgwFbTcMdCEAl8hgA2sYHgLaM5vanRKu3K7Py+t4ipQtdbmLb1st3IQAzxH09+63ff1xS0=
X-Received: by 2002:a17:90b:3d09:b0:2ff:6f88:b04a with SMTP id
 98e67ed59e1d1-305320adb7emr15434423a91.15.1743428738260; Mon, 31 Mar 2025
 06:45:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250310-8ulp_hdmi-v1-1-a2f231e31987@atmark-techno.com>
 <v57uy3gddzcoeg3refyv7h6j3ypx23mobctybt27xzdyqy6bgb@atzdlqlytz3c>
 <Z861gsaGY6bGSisf@atmark-techno.com> <b2qwqacogz5vzfekhk5276owld6isgewu5a2iw3roag3lbtsgm@67vqf54c5tdh>
In-Reply-To: <b2qwqacogz5vzfekhk5276owld6isgewu5a2iw3roag3lbtsgm@67vqf54c5tdh>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 31 Mar 2025 08:45:26 -0500
X-Gm-Features: AQ5f1Jo2z6kzfmKJSOyma8wBydMAEZlyvY8zlwOFHnubdHzs4pQsCeI5AKenTec
Message-ID: <CAHCN7x+WkhPQGLUqJ40SjtmhTXx=Fn2rkqw8NQ=qgaNnpK97zQ@mail.gmail.com>
Subject: Re: [PATCH] phy: freescale: fsl-samsung-hdmi: return closest rate
 instead LUT
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Dominique Martinet <dominique.martinet@atmark-techno.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Frieder Schrempf <frieder.schrempf@kontron.de>, 
	Marco Felsch <m.felsch@pengutronix.de>, Lucas Stach <l.stach@pengutronix.de>, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Makoto Sato <makoto.sato@atmark-techno.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 10, 2025 at 11:12=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> Hello Dominique,
>
> On Mon, Mar 10, 2025 at 06:48:50PM +0900, Dominique Martinet wrote:
> > [...] and I'm sure there are other improvements that could be made at
> > the edges.
>
> One thing that irritated me is the function names. `phy_clk_round_rate`
> sounds too generic. `fsl_samsung_hdmi_phy_clk_round_rate` is long, but
> I'd say would be a better match.

If Dominique won't have time, I can try to clean this up a bit.  I was
not liking the names either, but I was trying to keep them small.
I'll default to this convention more in the future, based on your
feedback.

adam
>
> Best regards
> Uwe
