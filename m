Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9F112F5A5
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 19:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748807371; cv=none; b=W/CLIUH5SlA88vZbxcXU8vBV3MtgzxS0AzgQN7VxSzYblwcYpmV2vdji9h8polWiBtYSJ7hak+hU3xrcHQGggHRocXyUfGML1tpbhhM0BbA9kGszBO1eik0rK4XGMN185zIGC/0xIwF8WcEiToyRwl8jq5RLJBwF5+Ato8+tc64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748807371; c=relaxed/simple;
	bh=OA6gnjPmGrHTq6uMjAd4+9GuNtdx+SupMKZyX9oyrQU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uiFv/0oc/x7R7lg5dZW8k8jQDMPDztvAMzHQuhWWopRgDPYAPmh91PFHUi3xhZM79Mq4Zp8D/MAN0ywkS+dSjUSkjBXbm0f84y1FB1V1WJZjQKZcL5KmKjrtT5vETtYG7EexlYIb3LAqU7I25mYNP4S8ln6Ywu4qIo+82bR2MB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=x877uQBK; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="x877uQBK"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2357c61cda7so125245ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 12:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748807369; x=1749412169; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OA6gnjPmGrHTq6uMjAd4+9GuNtdx+SupMKZyX9oyrQU=;
        b=x877uQBKt6Z89z/I7xaEt0rKdGbBrlP7i9Ge8lnBJpz/pmxxoSmKjMz0mOZOd77Tfu
         dtg9McayivDTDhygj/57mB6WregKQsdTYPGTn0zlcuOuPMjwWqd6q8pSVsUq3mFcXEwo
         7Pkw1M1ls2XK2OHAjoF0qp/IzCBOIraFjklF/azMmjy0GE7uVO84B3gvZPmGyKfnmlk5
         KiGj7rC7jX76AZXg+8j7EIJg3RJjTYVIN9RBmjACJtJX0Y5TgskkfrjSHTDMkSqzKgPr
         k3wN8xw7PKrjdq2vF0nh+IiiJWDtYMs9kvHkSydf+WXUDz6v2inpXXhir02SN88cn4of
         yK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748807369; x=1749412169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OA6gnjPmGrHTq6uMjAd4+9GuNtdx+SupMKZyX9oyrQU=;
        b=D0zRKsxg4kz9QiG1n6umRp4C71HI1GDnVTR+vSoZfYFsrChxMsXZzCYFT/JDyFsCAR
         PTrN7oucpQ4gAgz49k7roP3YrV+oziDJlt9FIMrVaAYYRYfuHKvdA0p0SjdalaAxakYZ
         NlcPrkGSzbzhhfu+zixG2SBqJho1C5/rHLhbhSZB2onY1hRARH8hybWtAA5Qk/XvskXl
         4zl/cHtyXl8yzn+yh0qVJdOHQ76IgW3DkCu4cWnR8+9VfvrNHK1gDoclCL/Tp/LMf8Qa
         ODfC4k3zen4oDYCaCWtvBUQPo5Bll5V8vjGJhBHH2nFRRWNNIaBG/g/pRgJqEuQaAtrm
         DMCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDnB2O3Tmkd4nGtGplqh88qqS6MwzkoXHIbzf9I8u1mVCVCcjm5cfR0lFk8yxwHwj7hRGnpijd1Cd6d1I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyK1OkBlKbfPFdjOxi9IPjtgoN66yz6WLXpc1lfQmgimeM1Cfj4
	t8YQ6RQdJATwizxGGiK9fzq86fpbmGnL/2ZOZbKKdMgtFpSpinYKv/KcFBX/3QlkoJVLXsz7xsw
	NyxQDwVBWmoI/MfP0fNH/aTOYvusa8lRTK3uX6M8T
X-Gm-Gg: ASbGncs0oHKGnwZNu1XQSlsmEo55jfE40Wf0VLRdhnxkuqp0tlRutMAPN9jvhTV5jDo
	ytiZTgYiCzC4Z1lPJAWtpJYOYU5vLvXo4XBRBGsmpdTw3Yz7OCc19bJKmW8meObFJc9JW1NtDEy
	xAG8O75ocO/eJPBWO9uudnVnK3m3O6ncpdtAFyIc5wpJLu
X-Google-Smtp-Source: AGHT+IGuKYuACePHASwBc1caQn32lBjaqHshQBYH/h8PHU3WssUdv4MSjw2rLAjB+qZQfYRgGCCIAw3qrXEIS+kGKHg=
X-Received: by 2002:a17:902:f651:b0:234:a734:4ab9 with SMTP id
 d9443c01a7336-235568f2761mr2930795ad.20.1748807369084; Sun, 01 Jun 2025
 12:49:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250601193428.3388418-1-alok.a.tiwari@oracle.com>
In-Reply-To: <20250601193428.3388418-1-alok.a.tiwari@oracle.com>
From: Mina Almasry <almasrymina@google.com>
Date: Sun, 1 Jun 2025 12:49:15 -0700
X-Gm-Features: AX0GCFsq2stzgpUbglrlQlKkYoMupX3j2X7PTQqh_PILem3fYMMDPTQUNWueH7k
Message-ID: <CAHS8izOqWWdsEheAFSwOtzPM98ZudP7gKZMECWUhcU1NCLnwHA@mail.gmail.com>
Subject: Re: [PATCH] gve: add missing NULL check for gve_alloc_pending_packet()
 in TX DQO
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: bcf@google.com, joshwash@google.com, willemb@google.com, 
	pkaligineedi@google.com, pabeni@redhat.com, kuba@kernel.org, 
	jeroendb@google.com, hramamurthy@google.com, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, darren.kenny@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 1, 2025 at 12:34=E2=80=AFPM Alok Tiwari <alok.a.tiwari@oracle.c=
om> wrote:
>
> gve_alloc_pending_packet() can return NULL, but gve_tx_add_skb_dqo()
> did not check for this case before dereferencing the returned pointer.
>
> Add a missing NULL check to prevent a potential NULL pointer
> dereference when allocation fails.
>
> This improves robustness in low-memory scenarios.
>
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>

Patch itself looks good to me, but if you can, please designate it to
the net tree by prefixing the patch with `[PATCH net v2]` as mentioned
in our docs:

https://docs.kernel.org/process/maintainer-netdev.html

Also, if possible, add `Fixes: commit a57e5de476be ("gve: DQO: Add TX
path")` to give it a chance to get picked up by stable trees.

With that:

Reviewed-by: Mina Almasry <almasrymina@google.com>

--=20
Thanks,
Mina
