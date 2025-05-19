Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D851A288C19
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 17:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747674678; cv=none; b=LncDSLybWVlCFR22ahdonA5oGkFK43c+yp7IerC1KUBoT9sa0WO+y8n5rny+WAWbdu7wurrlxKNEvn/dEvW5UtHMjDFNLP7IupAPfUYB5XbYVxTcgTxE32bC0hPJFh2DY0wRswQRN9uNw/sAe+NlcfsOsFugTP7TfGGJ2N90Rr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747674678; c=relaxed/simple;
	bh=J9+AOPXxrsjtGniILsGnZjKCgDv3F7K2+yKjpaFrVAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c7rNYxx+b3S3+BNROGtM+7uSaJRrIxFqsVvDL3q+V9tf2DLn54h8smLFz6eEXBoRD7nHmaupwPFIXz7ei15XB2lluHrwLHwCYFeJhSwcaZfcNfzLhqs8h8SGY9swNsozURo5Ga/WQ1NYC5y8gNhlbQ8MQ8XxXB1F1iJq2kaaXEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vA2bxeQ2; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vA2bxeQ2"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3f6eaa017d0so4144446b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747674676; x=1748279476; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J9+AOPXxrsjtGniILsGnZjKCgDv3F7K2+yKjpaFrVAI=;
        b=vA2bxeQ2hxhxrjv579QWNYg9GDXb8fdMYCFA9URc94af113SsbNyv+30o7+SURKiIg
         6zFMajDF17S87QgUndDl5EPnFqFtLptDbgBybksXAt8OkZOS4yxJyGIOMu3/5q56UYQM
         Y0Ed5JQwjbAs3zdh5wwgLSttv+fvHO6whtpDTQVlnGTJHd+lBhlQBXlGdoZDvAn3HkSi
         W0i5Nn9d7Y3mgWCvKFQJ+gNiKCx4dXq024tG+1A+8E4hcCJc8rFOD/sPYYB+ptxCYJgs
         iY3hvRPnn4SVvm1i2y8XpP4GFWdebGDBRv1T1PKYdvdBd7s80J99akTaMByPt5s/79W+
         qAkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747674676; x=1748279476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J9+AOPXxrsjtGniILsGnZjKCgDv3F7K2+yKjpaFrVAI=;
        b=MfsqpQ2SvS7uJ+PgIZEVRJ7Q0Sw9tdHM90bwGXFKeFfZtLHdqspmLIQUz8MDJux3Te
         MteicmCNGjL8qaQX2O6NT9MqFPb1PyyAikT8fm3vz9/irhoXH2zr1s+RYo/EsfVi8DQJ
         0563hKM6SdY3TPiyXHQYTwPPpefZGVoX0xgPwpPuoHD+n5nxOdbJ/ITnogGpIeyzSawM
         pUoxVgBK2Pfv+0zqHKL5NMjGxSSr0E5kdyOox98gbW2NEdh/qcsukOUS9HkmAIDYonYf
         gbN/dpNi6tFlYKrcz/6aQE1gbqhol1KCntRt/SlTKVuMi616vxZQ+VYBbAvpvg7oAS4H
         gssQ==
X-Forwarded-Encrypted: i=1; AJvYcCUApVfHHMMs9fU2muRdS11oDKBLQk2o6CK9rLfOMGN6eXFGS6rc5Pge3frD3K8ItpT5CnXATXHG7RmAU7E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXAZgP56GYVaoEBm9BYtmpOVQ1iDEeZ8HlAWYphGKyMqNYTPod
	trVqpY5EOo0W6LF/nxhaFLcX72lkPOqT/U13mrfL3NgDrJeu+1t8JA4m0qwOYlWtli+4dw0hOuQ
	rsSf7ic4qO6elpWWslWt4QNk5SMUW1ActK87IfUKq
X-Gm-Gg: ASbGncsIamObgg7gpuyIiCrfUML2eBWbC3MXVbb3Off1U16oCKnlBsgT2yA8EvHhZIL
	/q3M4HBpXc9zEetzFLHVWmAaRdMRr8ll7snDvK1rzBYN2rYJS/iJDXlFCj2RGZj8OtfSdeiuLBt
	wkNwik3eoYh/+wojflS50TtWQXeujWUrAxnKfp4G7kpfQ=
X-Google-Smtp-Source: AGHT+IGbc3Cqvl0hgY9PsJO87Lm1XcEa46xCiiwbO5jWDmdGQWmCs6c23IP7AUXSBHo3+nusSu+IzZxGz9BjH90D83k=
X-Received: by 2002:a05:6808:6c91:b0:404:df89:85d9 with SMTP id
 5614622812f47-404df8988e9mr6567361b6e.33.1747674675605; Mon, 19 May 2025
 10:11:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320171559.3423224-1-song@kernel.org> <Z_fhAyzPLNtPf5fG@pathway.suse.cz>
 <CAPhsuW4MAcVpXmZVQauoaYe0o3tDvvZfgmCrYFFyFojYpNiWWg@mail.gmail.com> <aCtfAcg32kbczs-g@J2N7QTR9R3>
In-Reply-To: <aCtfAcg32kbczs-g@J2N7QTR9R3>
From: Dylan Hatch <dylanbhatch@google.com>
Date: Mon, 19 May 2025 10:11:04 -0700
X-Gm-Features: AX0GCFsWLG4-Bb9vmj3DbSo8XE63IQ1V3WuVgVTvtIAVe62z6XsrFewtIVMSBqU
Message-ID: <CADBMgpzPyW+EnB3A1Hr=LQGhuen4pUuJ0QYa44nH0qfQ9TFaSQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] arm64: livepatch: Enable livepatch without sframe
To: Mark Rutland <mark.rutland@arm.com>
Cc: Song Liu <song@kernel.org>, Petr Mladek <pmladek@suse.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-toolchains@vger.kernel.org, live-patching@vger.kernel.org, 
	indu.bhagat@oracle.com, puranjay@kernel.org, wnliu@google.com, 
	irogers@google.com, joe.lawrence@redhat.com, jpoimboe@kernel.org, 
	peterz@infradead.org, roman.gushchin@linux.dev, rostedt@goodmis.org, 
	will@kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> FWIW: I reviewed the patch above ([1]) already but didn't hear anything
> back.

Sorry for the delay on this, last week was busier than expected on my
end. I'm aiming to send the revised patch within the next couple of
days.

On Mon, May 19, 2025 at 9:40=E2=80=AFAM Mark Rutland <mark.rutland@arm.com>=
 wrote:
> I've had a quick look at [1], and IIUC that's a hard prerequisite for
> livepatching, as without it the kernel *will* crash if it attempts a
> late module relocation.
>

This is correct. In both module-patch scenarios (module is loaded
first, or patch is loaded first) the relocations on the livepatch
module occur after it is already RX-only, so a crash is inevitable
with the current relocation code.

Thanks,
Dylan
