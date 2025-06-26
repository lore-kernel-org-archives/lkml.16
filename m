Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F4E21CA18;
	Thu, 26 Jun 2025 12:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750942286; cv=none; b=qQqZ/olr+5DHpOmna6Tf/mm/QCb1dFvfCvlAixK5IxLjlobtg1OIK+7CNmNw071aaeIztpE9LcCXSjqT+XF/6IeUf4S/nnA2F3aLTkEMVcd9jIPFu6aqFHQtmGDFd/zBs3QecPTKsfvjgH1JLnhA0zuEHkv+ew47CBWrwDXjVmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750942286; c=relaxed/simple;
	bh=jBOE1VMy3aiNmMAuqSezLi2vpU4eQvqAQi8D31wgqI0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I56mkh0d+xSB4d9tq/mOaTKB+XN264DppY4/fTj0d1D8nf/RXTEH2yvAoQK5Fu5vKeURB54RJrz7SEdw7UUu7HvU1W/7KKlY7vtBgbtO6GGwpJE+sNj0paOIT6CtkhVDLhpFoMDDeSJymM0rgg5lRPc611VzK8uv4lfP+MDxW4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b+FsOS0H; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b+FsOS0H"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-32b3b250621so8632491fa.2;
        Thu, 26 Jun 2025 05:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750942282; x=1751547082; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jBOE1VMy3aiNmMAuqSezLi2vpU4eQvqAQi8D31wgqI0=;
        b=b+FsOS0HMSuxyAbvboVb0TLyhOhwhNrNMozy9ejtMG/7FyxNsKOGxxWrkvqNrGS7zw
         EtT3OxjfVSSfh2tcDd/TiY7qSuPlZIwCOS2ZsW2oRB97SgWiutoG0M/TuNOfeS87HqPQ
         Af1bVVPpOLlqkJALo1F1lKnxnczYOpQoS4dtInFvOETzZS4VyztmmbPq2mX6KBRKHHdF
         kX/wrp9SJiMt9IAvxDWqJazWJeeNwPh0tbyU4jrQ/XvJZ7rfRoCS4u9oQMq/7E6wRxyE
         m7BJC/ZpzhrjDDzY0JAyeJqdSrhd1G9eM8LjTUlsmfcrVdB/8XpVoPesl9Kksc7rHe6M
         Ct7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750942282; x=1751547082;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jBOE1VMy3aiNmMAuqSezLi2vpU4eQvqAQi8D31wgqI0=;
        b=kexbRQ3tSaSL+lvLJwpjGSowEVGw/RAanLFVGaxH5kJyVOq8eXUExAIw/r32U7k8y3
         UOLwe/i+m7sbQJXsraN+gQM5We34cefNEuie8gaLRGkqKXZoPRhXtewIyffBcgF4OOn4
         Dt6tpO/YLs8kGcvwFBqNC+tuTcy9UeJZDkWRjY++CG66tL2dWZd7Nr1zR/lO6koSz2ld
         /9JjKiWP1qEkBMjp1pan/SNwiAfDCLN5Hh+uxCPgfy8eEwrJhWkrsPyo8hfEDWvs89sg
         /T6UYEv8rOT+JVaLrm50grjtm4wZNwTFxCCJSUnDyUxkkkJpm97XbiIww8XQ+kYZiBA4
         Ngcw==
X-Forwarded-Encrypted: i=1; AJvYcCUdfFfHCh5vKbsJ0va5z95ML0VQ5c4RR7k+gztDLLG1+uG6lGS+D1VbaW+4LlY/JSk/ZXUgZVIJe5Ev2i4=@vger.kernel.org, AJvYcCUhyaoWF0ad3oJGvatAEaVmPyv7BQsUcjeYJMcb0aoIF7mv7YsfDxKkPOK9b14fp8pHFbEbNgWgsn/xvKM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCE9ng1fq1qmossTmZu0xB6xXjEfAjV5Yn6yxGfBQmAj0zu3ZD
	xQZSroGsXR2WvJosJyBlx25bfqu1mQ1twie6V8CWX8KgwpYgwFbXHsYnB9jXX13W+XfbePjSIvJ
	ZLA68jfu+B9DuDz7KtasDcHfr8v4Nd8Y=
X-Gm-Gg: ASbGncs52b66RhDj32aI4pb9A9rCrrb3PGGUDPltIFt0m6mJr2lb97jTnblp3clM7SK
	ZpTquYfxQmp3n0Yzn/B3ypL5hu6dBDlmFFLqrCQ2TGjqcA9BrRtcezINX6eSN+s1qs7ZGcOewmp
	16fnShmn6xj8q9r21vKZHAMqS+IX1cEGa47K/UY7trJPzElHjtE+N3kQSiONcOVZPmjiDPsl2NE
	mQ=
X-Google-Smtp-Source: AGHT+IFZWx1CExsFcYzkKgRSn6PT1OrKOu0ar4lCr3LZ6482v+JvAxgEUxMROKMeUYASoC6jLk7aMuv0twPWR9b66d4=
X-Received: by 2002:a05:6512:6c2:b0:553:ad28:210a with SMTP id
 2adb3069b0e04-554fdfba1a4mr2378510e87.51.1750942282202; Thu, 26 Jun 2025
 05:51:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250626115218.141874-1-arun@arunraghavan.net>
 <CAOMZO5BgsU0ijdoaZs5e=qwb2PYZsEnx_RxfgQ+dosL8hPRKyA@mail.gmail.com> <fe9956b2-4d71-4a57-ab70-6ff64c4525cf@app.fastmail.com>
In-Reply-To: <fe9956b2-4d71-4a57-ab70-6ff64c4525cf@app.fastmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 26 Jun 2025 09:51:10 -0300
X-Gm-Features: Ac12FXwpQlqZH1FACB-cLvSeHDIWlKkvSrVU00W6rjN53m_7T8RNmlcxPGqQphA
Message-ID: <CAOMZO5AN1gH398AFS_F2G_nwR2-hJjJx-x0_Zy_VtmK3uet_uA@mail.gmail.com>
Subject: Re: [PATCH v3] ASoC: fsl_sai: Force a software reset when starting in
 consumer mode
To: Arun Raghavan <arun@arunraghavan.net>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Pieterjan Camerlynck <p.camerlynck@televic.com>, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	Arun Raghavan <arun@asymptotic.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025 at 9:28=E2=80=AFAM Arun Raghavan <arun@arunraghavan.ne=
t> wrote:

> Sure! Will send in a v4 with both of these.
>
> The commit that added the initial fix (3e3f8bd56955 ("ASoC: fsl_sai: fix
> no frame clk in master mode")) refers to an errata, but I could find
> anything in a couple of imx8* errata I checked.
>
> I was wondering if there's any public documentation of this that I can
> refer (and link) to?

I'm not aware of any public errata for this issue.
