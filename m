Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E562798F2
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 15:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748359120; cv=none; b=oc/QZxUWjfD3CdQle081j2UgT9t9NvlgUr59xtyjnzVSExUD8Z/w3aJN4qZGGOgHTDr/9u+8Xj9xM1tnwjfpjLxfT6wfKODvo4D/LTpcaDI7ePwUkOmMvfwSrB9Y0+fHGXv6ERfRLOaFpfGhSgr5+RutAWEXg+/C9Z6OlVI3nUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748359120; c=relaxed/simple;
	bh=UYxFwhfCV0mRJ8Qf2TGLSMPUPlU8LUhgbE8aF8e8iyI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b6LE8IxM4/1lrAKIUubvNTitnBn57JustIvcIed43P0fjJH7vrFugPSVz37T+JRYGh6YPAoOSv4U8vVKbrNTge2YTfRX2RJOz/BNkreB6YOxhtzBB/tWqxZo/CJfkDLhiUJPL27l1RH1WyT1u5BSznLNcoO8WMGA+v6q1dyR6Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=KtQwLnEM; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="KtQwLnEM"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-60497d07279so4615841a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 08:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1748359115; x=1748963915; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BNs+drqM+tbx/YmxGlhQUB14xSbG1YCeAq/RZY6LbOY=;
        b=KtQwLnEMRV/0NCF0sgQ962YIhNR/rxCwmm86jJiy+UNxH5eKomapCxxKwTznWYh4OI
         b0Nwqvfy6RzGbf+VlpkSNQFc5UPGB0KsyR8qMEclm2hssiAUAEa9pptTfJfpVK5ICCt7
         u95E+V1o7VbMzw6t1YuyQfeExyt6kSsrTNIzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748359115; x=1748963915;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BNs+drqM+tbx/YmxGlhQUB14xSbG1YCeAq/RZY6LbOY=;
        b=D3F6w6+DM7aVXwXjyZnkoM2k+5Jdq+cpPhl/nofDTbNqRCTGpwmHTYuhn8eYarpWFk
         oay7mAdE6Ds+xOe2pIoRbVS9MOdvH+RkB8ikwq+eaXwwGFF3Q+H9xvdvgNSgp6G1JXJb
         1lPxHGFu/YyDGOVYVcQLxe0/6IoPbzvrrXtLZ+6HIwIIh74XZylNuGQX8WEo6Kpt7lez
         E42iRuqp7j5fwJ2d25dOhyS/zOIgxHCGk55bwSW4q/5E+EZFLkkDXCxzXqVF6BCEb6jE
         60H1VILEjNGU6HCXed9pnkhWlaSySuVN6rZNbw5a2cckg6g0OufR+HEwCRLQBznOU5z7
         moCg==
X-Gm-Message-State: AOJu0YxT/dNf3lHmzWDOimAf+J6QPWI/ZfXAQTnPMywbk6dl7ddhN9sk
	cZawFfjkEjr/W9CAv4qrA8yi1VY7spRYeB9+oP6py5y7v5x7CQnhN1OaLhP0mlu37RFPp9LRc0G
	eZaBSMGo=
X-Gm-Gg: ASbGncuiQhK77VmFYonkASLsjuuGxjo5inyLJSfd6JA2KmEOrc3VEqzNOKrg1Ky9mLj
	/2cAEV0PIKwn7B7u2YRFWfhMwKdEhA6Zu7m2QWK8x8fKfpVRo398iP+JakmUx93COU2Qb343S/E
	KW0Oh6lIEH9z61UicQr2/xysvPf2ra78FebNziuwfcuTnvGTEll4ifHD5xNY53NZeG5EOL63lJb
	+KtdTOcmwUer1bPeFvsF/Ai6SIKjaTnff0QD2lV4MIXOA5/YXto3NlJ4ppzZU1r3WYIfbBQ2hc6
	XZHgp5npGxtJeN2fUoKX/6Zsx0Tf7/i22PHUhKqSlQg5SBABUbZKE7/CWB+5U3Hzu+04EFQ+prE
	aeIJGSjJTaFm+ThPjMJLE9Mgrnw==
X-Google-Smtp-Source: AGHT+IHAhjJlKk2wIODpvPyA78KAtu32xKSb2GDx47IreJ73Yzn6EZ6zmeTJsa3DgSvmC67q0N0yAg==
X-Received: by 2002:a17:907:25c7:b0:ad2:2a2f:7064 with SMTP id a640c23a62f3a-ad85b070c3amr1389061466b.25.1748359115080;
        Tue, 27 May 2025 08:18:35 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad8977b36a9sm48209966b.70.2025.05.27.08.18.34
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 08:18:34 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ad5394be625so647225266b.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 08:18:34 -0700 (PDT)
X-Received: by 2002:a17:907:6d0e:b0:ad5:bf77:f894 with SMTP id
 a640c23a62f3a-ad85b03f27emr1230842466b.18.1748359113747; Tue, 27 May 2025
 08:18:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <174820637262.238682.1985899398053030312.tglx@xen13> <174820637979.238682.4349646136552270664.tglx@xen13>
In-Reply-To: <174820637979.238682.4349646136552270664.tglx@xen13>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 27 May 2025 08:18:17 -0700
X-Gmail-Original-Message-ID: <CAHk-=wishzzcmRY8EY_qjD4T4i+W_sX2HWyKfo7dcEwPUSSoew@mail.gmail.com>
X-Gm-Features: AX0GCFvBPU4ezgS4T7paF1a_Y6hfiSqXTtUsknigGze7D5XTwVN3UISFyulb_bM
Message-ID: <CAHk-=wishzzcmRY8EY_qjD4T4i+W_sX2HWyKfo7dcEwPUSSoew@mail.gmail.com>
Subject: Re: [GIT pull] irq/msi for v6.16-rc1
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 25 May 2025 at 13:53, Thomas Gleixner <tglx@linutronix.de> wrote:
>
>     With this update the code is correct by design and implementation.

You have reached that unattainable state of code nirvana.

Congratulations.

               Linus
