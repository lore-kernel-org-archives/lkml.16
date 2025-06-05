Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659C7226D09
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 13:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749129053; cv=none; b=V8bT6gB8S1tKr4EkhkLUmfPbceGEetGQHqFL8vfAE+6NcJU8vV00HeCG1ZfMq8ZRFjNf7IlTrLH9ql+PoOe3vJnjIcvSg5PpVs+J1cM67KGJAn1zIkAW5113rRE0hh/TuvKG85IdgGMNyi3gi6MpJnPOft8A4ELE2SuiJnHbmXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749129053; c=relaxed/simple;
	bh=lNhfQTAqbTsru8r+Bj0ZAPYYt9rhG4GCErgMWfLnbw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=syrEnri/QjVL1COv7qGgqbwQEho4WMVlYN97h1JHoo2HWruJw4nn4HwsAWS5GeFiSsKoGlk+VW+2vZHFLPmUpw5RYzh4bnWCMyI012JzKgfX0TE/o/SMtYugtrmcHoUpeXk0tqxNei8HBalyJmq8r3nMkSxA4CW+B47lILS45oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tnXXfc6W; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tnXXfc6W"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-401e77e5443so596841b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 06:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749129050; x=1749733850; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lNhfQTAqbTsru8r+Bj0ZAPYYt9rhG4GCErgMWfLnbw0=;
        b=tnXXfc6WHX25aRQ/3/Im2CpCyx9Sv3BhxkTLY0xQSl+ZnPHbpkIXeBA1AoZurvjoeg
         r7ZoYd/typs0TcrycejMQI3NaY8JIfjVKN+tZ6Jxc+oOURrHLocAMAmY/setSyLoKgRf
         bkwj4MXvlFtmgqZsZHPEZO0HZP2wrvEoyXEXOzfQ+bmrsEsYQeasNaZVK8BayPE5Rzlv
         jUtBLx4d5h1RRGr80K1d8gCqZqnJKfaiP6RgiTUzz6nTJqxmEYONZCctakbt6+0PhX82
         7GeLSuVSw70qa8AcyrrQ9nirCg6XOkNmxtOqrEv5bSMZi+bLQbsM4rX1ds+iOwdrrpI2
         Y4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749129050; x=1749733850;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lNhfQTAqbTsru8r+Bj0ZAPYYt9rhG4GCErgMWfLnbw0=;
        b=sGSUhMIoZvlMSc9AjfXSJLd9f/1AvGN4PFMarOuDwP1KrE6sE3G9aslYHOq+fPRvsY
         UlMuxVrLU1K/qYa9ifzbivD8FK4W1J7UPzNIyHhE4rVSnLT576AJudhtWKJXTMXvpkAZ
         TBx7qYhqdSoxw9o4SLOvqdM099x+qENgqj0lOD11jXRF3u+edo2jK3geZISNGrAnVBHx
         rJDT7wWW4dmXNM/X9eHt98D5BvEJc4vgUSMB8ZcZtKjNzw3tIIdmTRHa4p49WVZnGGki
         dib3haPbuz+EKsFCAl2AV27dAWdsdRfv4o+GN8xJYfXsRDF4AkCogYuuXofc0x1iBQJ3
         McgQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0lyxYQwVShlU/nt6AZJa9c8EWE5iFs6HTKgdJyNrOCQcLbkpfIGr8yaAaqglulxyIaIPTVj5VdVfBn8I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRvg4HhpZZUUrn+PFvTDEky4pAWauWawSSMVBJP9HP5m7ffC1f
	JtxAm/8n/euvk9FbH42YLFy8FMREpOPMFDJFkjYSod8bv7THX5BpA2At/pKOve0xp/2vawt2oEm
	E8D95K3QWqR+XJFE9/6eBXlc9FzHUXGn+zffJRzcx2Q==
X-Gm-Gg: ASbGncvUV+NSsazfavh4lgLKs/vYd1rDhoLxg0FQrBA6D6rGLpxSPMzEvkYCJUL1T9d
	Qb8XLjuplUAF1Gm2e6g1nLeLNN2iV/16T9K9PNMyoATlcGErw/4r2pVP961mBLnY0GqUxBvmQAB
	dVUHYQkiqpFdVET4Ni27zT4Gt5Yx6xgt006CbEGs409W1cOg==
X-Google-Smtp-Source: AGHT+IGvvIIAi7Jeo7wCUNfCk7jSkX+GkLuOK4ORo6xtJdT9aBnzQchoGj+e4GjQ+z6dMP38d8jOt2O6RhX124Z/rG0=
X-Received: by 2002:a05:6808:80b4:b0:406:d4d2:ac06 with SMTP id
 5614622812f47-408f0ebf570mr5092773b6e.9.1749129050369; Thu, 05 Jun 2025
 06:10:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250523-b4-gs101_max77759_fg-v4-0-b49904e35a34@uclouvain.be> <20250523-b4-gs101_max77759_fg-v4-4-b49904e35a34@uclouvain.be>
In-Reply-To: <20250523-b4-gs101_max77759_fg-v4-4-b49904e35a34@uclouvain.be>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 5 Jun 2025 14:10:38 +0100
X-Gm-Features: AX0GCFudWa3xhzs7XGXYYVHqIxskkw2POUeo_WNLoTByWb5TUaRlQJJrMo-9pQw
Message-ID: <CADrjBPq67xtfWNY7GZAa3uJeGs4Svt940hW_X2Xxx3Pb7ZY6uw@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] arm64: defconfig: enable Maxim max1720x driver
To: t.antoine@uclouvain.be
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dimitri Fedrau <dima.fedrau@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

On Fri, 23 May 2025 at 13:52, Thomas Antoine via B4 Relay
<devnull+t.antoine.uclouvain.be@kernel.org> wrote:
>
> From: Thomas Antoine <t.antoine@uclouvain.be>
>
> Enable the Maxim MAX1720x as it is used by the gs101-oriole
> (Google Pixel 6) board.
>
> Signed-off-by: Thomas Antoine <t.antoine@uclouvain.be>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
