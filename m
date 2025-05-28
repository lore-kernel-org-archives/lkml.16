Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6124E286880
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 18:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748457153; cv=none; b=STuzLdjSVR7EDyHuG+sQaVOwhslyOn3zP8qh0UY40nbRZpPK9JWmvYSJjq16cHyrt/8gtAfqAGVz2yPAB2ZfmYQAzqOM+MKJjKsdQoZDN0H9sf+E/an7BH7uez4dalVv8SoaC/bzeLTim63vCifRFZCpD4353nUFopxZLoBfWyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748457153; c=relaxed/simple;
	bh=boyL95hUBCZDIgAKwsOxvCQrcsFMOD06ow6l9kom5z0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tp7Gj67jJCYiqL/eg/q+yfJGA1FINe0GMM0PPeXtTceJNR/NAJpUaQVSwphf6EIDgYh1lEwWRUOCZr+fDClqX6m3rhh+vNQHLFCwxuhVAlCuS3OVE8wKg2WrM5xuXyT5+crDot4GlVxYPYDytP5dgivZdHGQIN2xGfgG1HnjpFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3TAyPiLS; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3TAyPiLS"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c922734cc2so19484185a.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 11:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748457151; x=1749061951; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0NGTzYMC2G2yNr8MqPcsRm4OyQAyOvCBgCRC7moKcIA=;
        b=3TAyPiLSY3kyl2SgzZkx2uLb8gp+61VdzbYo0DmRt1cMd1hVKn/Dv986W/+eNSwd9l
         F23ReAGw6nLFNa5gC6LDbbubtsfoIp2FjtNzmo2GkmJyGwHgdU1KlsWBWoVSAWxNNvvP
         ApcLH8rbQBOoP0XFwVF7alNNmLBqzW9IQSrTMWSvyRycWzaV0xQSnTMofMx8XeSGVqLz
         DKSeiC1PfHUTZewKwut++8T3SazDZXsHSvnzyh7UWDvKbzbJ44ECCIfxNJYnH1Q2mlU5
         j1vj06ULk4nq8J2GNZjXvf+bAHnohDi/F3q2KA12khSh03GJ/bavKjUu/4JbiU7OvfoQ
         S7mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748457151; x=1749061951;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0NGTzYMC2G2yNr8MqPcsRm4OyQAyOvCBgCRC7moKcIA=;
        b=MZwEBTocDzE0H7ZYdO0I17escKk8FwVeeKkhn4FiubK+9qj6jZyY4/pyvA/OzzaQhM
         AKN7SEJmpsByrrtRl7WpsJMQ8qIq1Xu+Ywf6G5WT3Rt7CG13k5RSjM8R+OctsibwVDkH
         /L9MxFXoYG7US/du71o0wU//WiVORopWxJmtcEnbUdU+1DAQh8kDCZsdCrE2z3VfdMwr
         F+ETClYce9nNacWp+ygHM2uMcNCADgm9OXMReCGeyWoHDevxS1Oqb95sNwxHgJam2auN
         5p752nbH+FaO2x7hR5sBBMTz/E/7kF8tH6wCPH6a+cVzWbtLEhg5NMO3UWe3B41H7TV7
         PpHg==
X-Forwarded-Encrypted: i=1; AJvYcCUI90Vm5m+e1Gnd4EReEsj/A2fcMf9JUNDbi3BujQ4Gbl/nUjMiwbHIgSQuToOmQZoMU/DDkeHrFGij8F0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj5Jil7/05GGypGsLE3DXows6FV3P5LYeaau3GRS1MtPJ4kWTs
	uDvDilRS3GDPRagbBq+mN6mNjRVFj6wJMgS99qk8TXCKYgKNy05IMKAx3q4rDyNiut4gXDv1G+U
	xvVeYVlGBO44fspNDMdfK+SLjxHdu20MnCeR7mvoT
X-Gm-Gg: ASbGncsJ1hwKPU8MjPPxxAb58t99TibuLDEXJgVLs6lplmFoUZxx2clAUhm6TwvRWmn
	URezVUM1czHcU622yfcyRDTuXnM6MjfOIJH5ctG5HQldWojVDh/KgfnnNZEuP5nc+ExFDFhe7sM
	07MqtY6efJbUenSfg1UatTO17TqI/534Xsb0EmmMn61Z59NrTwCJs6AvvFgo7ZGznY7fEVF8D5
X-Google-Smtp-Source: AGHT+IExjLW+OCGUhyxB4Yj2HCQdswSJI1K1nORrngON2Q1ifDySpWD7ARMRv/RfZaNcmXfycQASxLW8zdGbiWFQIMU=
X-Received: by 2002:a05:620a:190c:b0:7ce:eab8:7c77 with SMTP id
 af79cd13be357-7d09879c863mr89879785a.16.1748457150880; Wed, 28 May 2025
 11:32:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528174426.3318110-1-dtokazaki@google.com> <a0bf24c6-58da-42e7-b686-03a893b38ecb@sirena.org.uk>
In-Reply-To: <a0bf24c6-58da-42e7-b686-03a893b38ecb@sirena.org.uk>
From: Daniel Okazaki <dtokazaki@google.com>
Date: Wed, 28 May 2025 11:32:19 -0700
X-Gm-Features: AX0GCFsIvW1B8OF9VcWbdG8SdgyKuzexjZNYqZSwytZ6BMidZ9l57KoXhMWZKQE
Message-ID: <CAOC4094v+MyrWgbkDJZ5KJhzuTmmgAuS-XacbFt5jHK3aYtOrg@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] userspace-consumer: adding is_shared flag
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Zev Weiss <zev@bewilderbeest.net>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> What is the use case here?
The request is for a regulator to be controlled by two different
subsystems. One is a userspace HAL and the other is
a kernel driver.

Alternatively I could expose sysfs nodes in the kernel driver
for the HAL layer to connect to, but it would add coupling
between userspace and the kernel driver that might not
otherwise be necessary. The userspace regulator driver
would add some abstraction between the actual hardware
and the sysfs interface.


On Wed, May 28, 2025 at 11:16=E2=80=AFAM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Wed, May 28, 2025 at 05:44:23PM +0000, Daniel Okazaki wrote:
>
> > Currently this userspace regulator driver requires exclusive control
> > of the regulator to operate. This patch adds an optional flag to
> > remove that constraint, and allow the regulator to be shared by other
> > modules. This allows for userspace to share control over a regulator
> > with kernel space.
>
> What is the use case here?  This is a debug tool intended mainly for
> when you're developing a regulator driver and have something like a
> development board with no consumers at all.
