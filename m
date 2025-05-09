Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC44292080
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 13:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746798440; cv=none; b=fHq5tXUeffLizGNJJDNdPMGA94MLcv7rKle3oCLpy62rk+Way3ViHnls0EwZh5jbTeDwElw7TmzOBrX9561ZJ2upCtONeTx//0etcX+f+J60E2nAEcFgJ07ymBMafr2dZfhmlY/5omIIc1XfSD9q7DGqzaPHGym/av3AsrIveL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746798440; c=relaxed/simple;
	bh=19/dP4VfkNEVe2LcoQ05RVZZNWswiSYWxvRpKa/npjA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jnC0wyQir+lGj1oj4i9VjdrpbM+B6XAKNSS+e2b914B7F3pED+DOsuxisth3nn1oloS870EzEl6iw6PGrCuAYKwe19Xy0IYoTthz9NG5E5OMCnvvDEtgF2ZFGm4xDvfNSkMxG4RelHoaMcwSr7aZHDg0kOql+PyiOrBWmIEwyXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xFMde+FP; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xFMde+FP"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22fa47f295dso143995ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 06:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746798437; x=1747403237; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=urYmpWFWl6CDsuhCCFO1tExwtSh9HbDy0YPdVsGqs7Y=;
        b=xFMde+FPZRex76Yg8IfxXTmc+hvU8sKeUVDXluDPyA+9Tg62fTJpofQcOsS3x4sCR7
         rEcBOLzZc70UX7OKLnFgf7H+MTZXw23ntHG0xAmyOaNeznI6AqRIHtJNgjrNdlVDD+sv
         wI8EC6wAosfPaBwyRQROyRhXMhKxQ2JP1nMvUfiBZD69nKJSbkeNP761IHlsErNmIhKi
         4fofqgsJcn3tujLg+Rw6QJrtgFhyUi4UF7AZlEzzfs69wnG2bcptHT7hBZ50NB1NyiWj
         NMe4QWFuftRjTt35EPrUOqAWb6BS4PikM3LwsBNHlqT6qdxmyPiSQYZhNy7Llq4zcOGH
         I/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746798437; x=1747403237;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=urYmpWFWl6CDsuhCCFO1tExwtSh9HbDy0YPdVsGqs7Y=;
        b=VrdVyIF/0sp8u+cEFVM73s+m6Gor5yny3qONpLpNJmeXHV2seOrpBck55CzfkQlM2e
         okPm94nUXT28S2wtUggHhparP2h+hxggnW4pNbFZBmYfh+ErWUKMpY87/U9i+iAG9/7X
         l2w/HVFePRlgGQNR9LhHLKtRJwXAqlQE4LP4mv/LzfmnDA7qNem4+OuVbHS57mssGYa1
         +7Ja9IT5AzrZ+RxhYSVzdymz4wRGODbvEFJ52N8DJJvZKCK9YD1XlwMCaEvRGxpH/Q8x
         WOkuqadu2PQrn0irR0cKa8ZW65Cyz+bykOZ+Cnq7cjR9n+6e1ec5TJTfCg6av9PLKv6X
         Q/vg==
X-Forwarded-Encrypted: i=1; AJvYcCVQ0ldgUEqai7b+HnqSfXNtXcFbWA7eTR3i/T2lJjPdTYz3V7ocjyPayo1f/sTnJUZarwvXwLWbkpI6eaE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZAtCaaNm+dNMcnS6bdN3m01WIffYLBeUAkqWzxMbMzn5R+64N
	twvM/bJGHoSYWK1/e293a4ze+bKp/3XHYtpmt4HZr/w8xnYd2bEtxUPBaBcjvVu5MgmApYYQrs1
	pxnRue8Rf8/S7uL3yZsksmnKPRFdu6abAA6wc
X-Gm-Gg: ASbGnct0X3+0xf91J23TQui+j4zxax4JYBRCJJmZx0TDiLyneF5IHg27KBO2bWIv6Lj
	+k4wyeGKrUrTPNCquBtDeQL4WWoQgfy3ZqWtTMpbo0oIwvZTE6PpDLBMNjkw6v8gI2Qyrj2nbPW
	hKZPNu2PCj3UWTPsll2v0yKYQ=
X-Google-Smtp-Source: AGHT+IFGki/GalQf4cuGdwsycPmdJYmOtIwwXz5djtoG4uzjXnLPSM+HE+TjHYTL4SSNm4jusi/2k1FCXOfBGZvzZfo=
X-Received: by 2002:a17:903:2f8f:b0:21d:dca4:21ac with SMTP id
 d9443c01a7336-22fca880a59mr2792035ad.6.1746798436384; Fri, 09 May 2025
 06:47:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509115126.63190-1-byungchul@sk.com> <20250509115126.63190-18-byungchul@sk.com>
In-Reply-To: <20250509115126.63190-18-byungchul@sk.com>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 9 May 2025 06:47:03 -0700
X-Gm-Features: ATxdqUENBVO5b237iXl1zx5MBh5FOCktoOh4mLpWuXNPgspC-UYrNQ0QGPP7tZQ
Message-ID: <CAHS8izPC9bcdb4-Urw7-1zhYaJzM1cAUJzXPpJp30hgLiwr0_Q@mail.gmail.com>
Subject: Re: [RFC 17/19] netmem: remove __netmem_get_pp()
To: Byungchul Park <byungchul@sk.com>
Cc: willy@infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, kernel_team@skhynix.com, kuba@kernel.org, 
	ilias.apalodimas@linaro.org, harry.yoo@oracle.com, hawk@kernel.org, 
	akpm@linux-foundation.org, ast@kernel.org, daniel@iogearbox.net, 
	davem@davemloft.net, john.fastabend@gmail.com, andrew+netdev@lunn.ch, 
	edumazet@google.com, pabeni@redhat.com, vishal.moola@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 4:51=E2=80=AFAM Byungchul Park <byungchul@sk.com> wr=
ote:
>
> There are no users of __netmem_get_pp().  Remove it.
>
> Signed-off-by: Byungchul Park <byungchul@sk.com>

Reviewed-by: Mina Almasry <almasrymina@google.com>

--=20
Thanks,
Mina
