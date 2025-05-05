Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C162515AF6
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 18:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746468457; cv=none; b=nGv8h9C5kvzohZUtW7tdR0wzu+c1jOaiDW1iGrR6TgPEJH6BQ07QPgcIxSlqr8mPS+fnkyCM/mdLiPpZip8mnYVG47HLxIMjXOhzk/ZUJNXMHxzMWBCwsWt/HCI4UFBZcHzuLMFQu6PCQ+KOLAedBVPVYEH9nlaOYMBJA6spbrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746468457; c=relaxed/simple;
	bh=YflIqSONWzWvnPgcJpFDDON/LOz0XMIPgbeLEZ/KtmU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=IIgS3nPAda2yIbGPSSNde+2gBgOJBto+oXIma2sT+UTROX2htV4Bg7dVlmIjnkLkc9W5HIaDPnhgGoTkBSJRLsbF06F1877UkxFMJ2i2s5wFakEdnVv3x0aO7CyosHxOxCMdWjuFmru0Cvc5sJ4j0tbN5INTUSRQlySMX8ZJiEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=simulevski.at; spf=pass smtp.mailfrom=simulevski.at; dkim=pass (2048-bit key) header.d=simulevski.at header.i=@simulevski.at header.b=RVxTvOQi; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=simulevski.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=simulevski.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=simulevski.at header.i=@simulevski.at header.b="RVxTvOQi"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ad1d1f57a01so56434666b.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 11:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=simulevski.at; s=google; t=1746468454; x=1747073254; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YflIqSONWzWvnPgcJpFDDON/LOz0XMIPgbeLEZ/KtmU=;
        b=RVxTvOQiNaqvm/MeAdkgdummGg00RYUKlJp6/NKNiP/JGkqshR5J3lRD4V/xmCCqQj
         uYGYasSBOVPT8jHUOduIdNe/He50zoL8b1eJHqvvc4nPh0IcC+/8qWQi3TmKGhB2/wt4
         azIhpXaHQTIdxm1cCUrqtdp3uzgTf7jjYYwMRi4xvbqAz4UxgBo9HbM/kNPMhOKykA/F
         srpBW59JBmLJmyHUyyK+J3t/yOFjDzj5Z46vYwox60C2BMJzPfjM6eOiyNtJ9oXZz2tX
         CyvUUM9rrq40180bMPVfOuszGi/aSOz880TE7bOEMeM3hKtclQwwZfrFu3np1vpzNqj9
         wH4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746468454; x=1747073254;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YflIqSONWzWvnPgcJpFDDON/LOz0XMIPgbeLEZ/KtmU=;
        b=PNR5UBn34gNndT5g4GYTFew+ak5HTLf8ty0i332q+mcxlNOxQqMA3Gxqc1FmjEVfe/
         /C3nhXyKeBPPPfRip3hhfsadH5beYY6xnXh4KIlPP1m9tnkOjJ6+OUs91hOQZE4ncy6Q
         vxVx1oKyKx23p4zoiIgY/qEvgcyirVfBk6BzmS/NJTZr2O9nWiWJ/kkJc+TcEb7qmgvS
         +bw0oB8+Z6ywb6Oyy45l44b1DdxG+CAVFhg6VxCesRc2Zxnvg19OvlfHKQRqxlepaTYl
         39Zd4nYJczE5UlC99sZsRdr600FYarF0dbpgZokDh9/fA+apV73j7dC7eAF+j6gZZqLX
         h1zA==
X-Forwarded-Encrypted: i=1; AJvYcCUtVu/Vql15t0fW8c4UuquW+0IJfiW5dGtWzTkGA/loFGWGIl2JZlxXpmJnWeb+dnMupHPlnx4Q8zgtR+E=@vger.kernel.org
X-Gm-Message-State: AOJu0YycO0c/AV8GvQssgousJyw8zjjAd83xrEO0AP7AyfEsHCn7GRIF
	I9I3TS642udP+UVC3bKw/G7e6+Jo2L/X6PFDmRWVuln7n0eHS5zeko7AcqcLSp5+HcEC+KPVS/W
	nAzCEDbDSXqOFex3CjTOzXfBUtCyCLwirbtYBcQ==
X-Gm-Gg: ASbGncs+EnupGwvq1TQwVFwA6UMAPGOFUMi69KWpuu90r0dbHH8mLeHJ++fY4r1gKV9
	8VHNDW4OeYWhwo7afy+BSzlIatBKHxfKuCNqW1vNa1o3/nwsXMGscBCcs1YwaZxRqiq2QkVz29W
	UN+CWCNAAfUrX4F/JlchnBFB6uNyBDm7N2si+idIXe4gqM/AzDZqRAH965EbAMuwJo
X-Google-Smtp-Source: AGHT+IHSRPzRWtPKUw1zCPRlWBydXasAt8fgBM0eH5lSar+hmCu4lARhqrRTbC9gibONmU1LyRBAbBqu1K3t2r0V8W8=
X-Received: by 2002:a17:907:c706:b0:ac7:3911:35e6 with SMTP id
 a640c23a62f3a-ad17b868b5bmr1229064766b.58.1746468453986; Mon, 05 May 2025
 11:07:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Ariel Simulevski <ariel@simulevski.at>
Date: Mon, 5 May 2025 20:07:23 +0200
X-Gm-Features: ATxdqUF60hWtQUn2gXgmf4MObMdDa_KyrdeNqYiO9XFngXF8KF3NozcuiLquYcM
Message-ID: <CAMz-Jg-Vz9npxtVqjPXnK_WSDm2zc9_MBsQKTJKVghaSU7fyxg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: tigerlake: Document supported platforms in
 Kconfig help
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: andy@kernel.org, Ariel Simulevski <ariel@simulevski.at>, 
	Guido Trentalancia <guido2022@trentalancia.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andy,

Thanks for the feedback.

Just to confirm: for the Kconfig help text, would you prefer keeping
it strictly to a plain list of supported platforms (e.g. "Supported
platforms: Tiger Lake, Alder Lake-N, Alder Lake-S") with no additional
explanation or context? And only PINCTRL_TIGERLAKE because I think
that the note on PINCTRL_ALDERLAKE is actually quite helpful.

I want to make sure the v2 follows your expectations exactly.

Best,
Ariel
