Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146542080D0
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 08:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743064835; cv=none; b=eRn9kQ4iylVnF7lK3Y4zDEsnUXn9KMN/dgTLG+Ad0bSTBNjTfLZWFnh9ggY390D7rlRZZCmHqpoDjohU942a3ErHuQpIOkCQJOsixOpUQLIVyzrkNZPJ+EjKlr5d7gfsaNFmigjRkGkvOK4Lzgpm+g99bh5eeFLuEuALZxWvdFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743064835; c=relaxed/simple;
	bh=tX45f4SgJzV0BzxhEgpd0/lEHTr9TcXiXqeGEs6DGTs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cm/PiF2H0o891LXBvQZNBd+NQqrRjjnl9Qo1ogbK4awlkuHENbqzo2j5mfvK4+nREG0x84/0VD9weXcoEmBZu4g6xGJVZRPNvDguy/27kfymvK1cke0oXAscDChv75JGH5GpIjxRGc7203gWtK+aomo4IbbgiUWnoBp/otR6/4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WbhOZPYz; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WbhOZPYz"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-520847ad493so805874e0c.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 01:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743064833; x=1743669633; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=drLMpc31hHP8DJqxvldHizaDERYv7LoBBB4sM1BPDHc=;
        b=WbhOZPYzJBZFpHvI7EN/ARNKhvi87i32PHvu/BTzI4E1jKzQHtDKyGPVEu75Y50B2C
         p7v0sHsEnlcA/6wHireBajjjtkfaUGR7a4/0Ofv7/N1u/h3P6wJ0PqdJugLSBSgGJwo7
         SerLB0E2m9Hd+K88wwhRYsOqsAFhZ2AZH5R/vygL2x0F+cw+QfERQ/g29TIFZPaoTpG5
         hRr1kVEPXiz8SysEjLnsZhgzWZSDsXsYCmqlcg+VH4JZU+wdib/h/QE14oa9BuqaxNET
         GuO3Uu4CADgnFje1B0Ec3qq2VBTFdYfRlyRpOcQt5v692UzQdYRbitRpaBQKwAULMSRS
         XN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743064833; x=1743669633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=drLMpc31hHP8DJqxvldHizaDERYv7LoBBB4sM1BPDHc=;
        b=b4cl+yBZvEFzI2E8W1QpLVr9uzrOYtcWMuctjKTjCS9oJyS4zpcHMz3X2fLioPtq2L
         ltTeQ9INS1y4tFTOG/unRk4v+N9RWg/1RneeQK6l3GsS4cWODMRJa6vjDsmUNhIcZao4
         aRtFAxCzpGggfnaFs4fsAQqIVPCS42X340NhKED+wjLeF3efKA1ZpkpeMRSZH16JW0gP
         yKLM7nfqYeF0/GAE1NVyI7Cj598p2YJDqAJRU55Scquq7k0PTlIV/N0B6t+gxl3ORr47
         4LfQrg6CID00si9zZeaUu2lEl7vdhRsjxE3XzoWNLxDMQwyWsXtMfZ141wEuZk7bmOG9
         hZ4A==
X-Forwarded-Encrypted: i=1; AJvYcCXUsjzZ9qMPHmfZLizbPq5HCG5v1fUihVyOYBoenutmZHnDxukPdm0qxfeHAds3dj1gZTzPDafcKXETHdI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpfT3MfxyDyOQwPIFLmygIxhupRAZq/6hT/8omxUnRjqeUjE4J
	ifwoYVHTCV4opxDzVswphjaf3Ik/a19ztuK0n5olKqUAZNinJ5NTl64+yd0LX9OJXzZ1oV+4MLV
	71uLP7hp+qZw5EDSddmHugZK0u8M06ImSJwUDRw==
X-Gm-Gg: ASbGnctQ9FuciuzwQfg7/yXzGW5i4F6dduqQiK5BkDu/0yKwQcU3wHMO2fGjOBV8gJi
	fag9WgAMADAii4hX34IR0atlBIIUtxkG4v1UGoenW7N0FZH0hPwhzQAoux2Mt7mo9seuAFHnPPW
	faGxD6xGwqJHsA432/30UMnl4SBOma5e/BjUeqa/nAi6nT8Q6h0EQNqa3UblA=
X-Google-Smtp-Source: AGHT+IGOGcjqwfMP9mXiNbxB6MtctF0dET/SKTnUAdsnVBHT+F80EMzrMsZihZOJ8DAzX0n8EDiMCpkMZMySY3I6Ims=
X-Received: by 2002:a05:6122:8c02:b0:520:9688:d1bb with SMTP id
 71dfb90a1353d-526008d082fmr2054719e0c.2.1743064832775; Thu, 27 Mar 2025
 01:40:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+G9fYs4-4y=edxddERXQ_fMsW_nUJU+V0bSMHFDL3St7NiLxQ@mail.gmail.com>
 <b6df035d-74b5-4113-84c3-1a0a18a61e78@stanley.mountain> <Z-LDdPeTsnBi8gAU@macbook.local>
In-Reply-To: <Z-LDdPeTsnBi8gAU@macbook.local>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 27 Mar 2025 14:10:21 +0530
X-Gm-Features: AQ5f1JpOCRetHukvs6jfAS61Q6C2j3250sLzDARLwQB5DraQTDosJm5QyiXZRkA
Message-ID: <CA+G9fYumyaftJ9FaK+74g5iw-v9RV4qDT-SLg1XGk8G7ub2EXA@mail.gmail.com>
Subject: Re: next-20250324: x86_64: BUG: kernel NULL pointer dereference __pci_enable_msi_range
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, PCI <linux-pci@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, Bjorn Helgaas <bhelgaas@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	shivamurthy.shastri@linutronix.de, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 25 Mar 2025 at 20:23, Roger Pau Monn=C3=A9 <roger.pau@citrix.com> w=
rote:
>
> On Tue, Mar 25, 2025 at 04:56:33PM +0300, Dan Carpenter wrote:
> > If I had to guess, I'd say that it was related to Fixes: d9f2164238d8
> > ("PCI/MSI: Convert pci_msi_ignore_mask to per MSI domain flag").  I
> > suspect d->host_data can be NULL.  I could be wrong, but let's add Roge=
r
> > to the CC list just in case.
>
> Indeed, sorry.  There's a patch from Thomas to switch to using
> pci_msi_domain_supports() for fetching the flag, as there's no
> guarantee all call contexts will have an associated msi_domain_info:

Thanks Roger for the clarification.
LKFT started noticing this issue on the Linus Torvalds master branch from
March 26, 2025 at git describe: v6.14-1979-g61af143fbea4

Anders bisected and confirmed that,
  # first bad commit:
     [c3164d2e0d181027da8fc94f8179d8607c3d440f]
     PCI/MSI: Convert pci_msi_ignore_mask to per MSI domain flag

>
> https://lore.kernel.org/xen-devel/87v7rxzct0.ffs@tglx/

Lore report link,
 - https://lore.kernel.org/all/CA+G9fYs4-4y=3DedxddERXQ_fMsW_nUJU+V0bSMHFDL=
3St7NiLxQ@mail.gmail.com/

>
> Regards, Roger.
