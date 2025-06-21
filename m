Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C6C148FE6
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 05:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750484562; cv=none; b=m7vpcWKNFnEZSXssh5wL/OfbSG+B1NnRLJW9W+WEss5g48vThabAn2bxN8QTztJAlM5rdupJezQ7kfncLVRg+WiRpLO0UWkhvS6wnRn0LZ2NiLfiC5PnEP59hCwSMSlefKU7WyNzRV0v6Yh+f40V5K8ItQuiuRQpdgFz/AX3gkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750484562; c=relaxed/simple;
	bh=kZ76alpNfjx0iqmuBuZV4rSXr5AfUp+VMirMaSaBLUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sGJmtGxICVre7s6mVhV2pT0aqAH8SLIg+ioDGuD6PI3CQgPaYbJBNf1gStaPoZRjZwGHE1fKw5HgWOFkXdIYCwaraRBkQ6swr+u90ShOq7lxFgDo2XS2fV5/QXAQFUrAW9eakM+GkGOS7KLZ7iz/ow2YMS8sFWHoMQz3hlE5Bt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=bU9qikut; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="bU9qikut"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-606b6dbe316so4878066a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 22:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1750484558; x=1751089358; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q0J4U2X4uoZL4z5Xdo/apV4C7RPYHy+Xt3WOgSG8vVc=;
        b=bU9qikut4U30Lu/4wMCOJJe+Q3rr/HVcyg6UAm69eVZgyttEzXFSzktsIdZ8AioUAn
         is5LMn4Iqw2IupNiTQL2/U7GzoskP+ifRhiPP4Bojn58g4GPjyP4sGoXzwhVDmVNWfCY
         0qpl+DctydHPVlViyhm+K1iuYxdtolmu2PrGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750484558; x=1751089358;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q0J4U2X4uoZL4z5Xdo/apV4C7RPYHy+Xt3WOgSG8vVc=;
        b=I1Uj093a4kc7j8eFNa6oDZZ5A/zePcC6B4DT3AtcrS6bPDa6ToHzWX26cFBE89TcS8
         FJFsRgyvFrAWa4huXS3/44M/MUQUBa6W2AwYUaVfT7geRjJ7ISJqEKDVOPKOd0Liet9j
         WCzV0AsCVatBaaI92B3ynEgiIwqLemzfcoXd+ggIRTRtDR/q0mmFUReCvEKFeJ8foHaB
         BUuRfnkTJ9hsnZt4+TCFHG9ktkViL3XXcEAgtnnhyRlfOJgDRA67U8MYWQ7KE2Kv+XVW
         87nmj40CFbZVswkYANOAptb1triwX6bkQ7NF5SlgBFvMHlbwhG6IZ//CdxKPPG5DCZ5C
         QbNA==
X-Gm-Message-State: AOJu0YyoMgp7rVziUKQ2r+ilCCcdbUkYksk523ltVz6YfYlDue8aUdPF
	ZiIwC3CdTh711kuw7KHSaQlocFsjVqOF6DfJiMPVnz8f9jWwqYnDQcnj72xJPjupMIVX9KM8Vss
	tXY/2
X-Gm-Gg: ASbGncv4sjQ0i0Iou26daEl/wVXPm6X/qZdZUP6NOlG/H0ILO1hFrfffFf42kFjwR4H
	cE7W9+kK8HYDEaA1H0mNEETprFVtq//yufTIebg3WxWWXC0v9E3jamHjla9yj55XkH4u+GGwLPq
	ZFhV6XlYXLbNa7LOQqDK+Wc27caaTd5RLeaCP5jsCy7kUZmNhFXRaLe+Hj90M7bkgmQs9BfVpSu
	C/0Z2rlhlKFUKgzdlDvImUzlL1KNrFcf7hUWE5PrYNDoUbmFeUAW7oIUoMrA+6qBZNhbwuB3l3u
	sMjtSHW4OlMEFBDE2HweBkSPNmSpZcWASbGVI+vYVCQs8+18v6UK6nC60hGEVJ8p2JChDJMWCa4
	zOlIqhmKsjznzfG8HHNKMqqeX57tFB/KP21l4
X-Google-Smtp-Source: AGHT+IHtVzA7hdcMg5ZSJfTDKi+WUWeNoUBBAQ270LRn1xIU3ZX53e/VbSrRo5whgVyRWQatnGn/JQ==
X-Received: by 2002:a05:6402:5c9:b0:607:33ca:ee14 with SMTP id 4fb4d7f45d1cf-60a1d191c86mr4347379a12.29.1750484557884;
        Fri, 20 Jun 2025 22:42:37 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18504effsm2513721a12.9.2025.06.20.22.42.36
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 22:42:36 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-606b6dbe316so4878033a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 22:42:36 -0700 (PDT)
X-Received: by 2002:a05:6402:5c9:b0:607:33ca:ee14 with SMTP id
 4fb4d7f45d1cf-60a1d191c86mr4347332a12.29.1750484556342; Fri, 20 Jun 2025
 22:42:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHk-=wiiqYoM_Qdr3L15BqJUyRi6JjR02HSovwwz+BXy7DdVeA@mail.gmail.com>
 <241b0829-5fec-4d88-866a-ba59e2ca748e@roeck-us.net>
In-Reply-To: <241b0829-5fec-4d88-866a-ba59e2ca748e@roeck-us.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 20 Jun 2025 22:42:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=whDM950+cCgmNH2edB2edCaktdpvBLGjFESAZfYZ3ZpRQ@mail.gmail.com>
X-Gm-Features: Ac12FXwgW6zKc5DnLcvbgQjEEHwAU3jI0-PIjOQkwhlotZzPVsGqpwHZUGtn_QM
Message-ID: <CAHk-=whDM950+cCgmNH2edB2edCaktdpvBLGjFESAZfYZ3ZpRQ@mail.gmail.com>
Subject: Re: Linux 6.16-rc1
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Alexander Usyskin <alexander.usyskin@intel.com>, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Jun 2025 at 18:25, Guenter Roeck <linux@roeck-us.net> wrote:
>
> The test failures are all due to commit 0aa7b390fc40 ("mtd: core: always
> create master device") which breaks mtd partitioning.

Ok, I just merged the pull request that reverted that one.

> One side note: Various qemu machines configured to use Macronix flash chips
> are no longer able to access the chips. This is primarily due to commit
> 947c86e481a0 ("mtd: spi-nor: macronix: Drop the redundant flash info
> fields"). After that change, SFDP support for affected chips is mandatory,
> and qemu does not or not correctly support that. This affects quanta-gsj,
> kudo-bmc, ast2600-evb, and supermicro-x11spi-bmc machines (and possibly
> others).

.. but this issue presumably remains, unless there's been some subtler
indirect fix that I didn't realize.

Miguel, that one came through you too. Comments? I do think that
running things in qemu is likely important for a lot of these things
that don't actually have a ton of hardware that is easily automated...

            Linus
