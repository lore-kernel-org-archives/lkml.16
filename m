Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E2E2475F2
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 22:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749679564; cv=none; b=Fpf9MHh1oW0D8YZTh+lPEI92EIdJesZ9dktmoABI+gH50GqvLFdKMy1INLgjoYMFzeDqmkLzOaIK3iXOVVea2kkeMpfc3MkQmZH9iIU5mmCvKlJ/eFleBvfbNyLYUkEveruW3X61W1Z0SYrscHy5spB3BYf+8psb+RmmlJc/ej0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749679564; c=relaxed/simple;
	bh=lJcNb+m+LrHIPtdT6t16yrrQCjtNIkMPamXEoDgkxPk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KR2YZ3X06OBI8qDTsIYDsceGCiCqoXN2YgPTtJqpw0GTdwSYQ4FP4Ttu/MAgFUlDkodw6qbjNtAc/TxcV8GYExPQTOveqyiQpm3rs6VgIM5rHbTjXcdKhPX83hV5n+8Ris0Woe1hNcRxULoJbjbtRKBtOGcHqoDJWVT1Wxugz70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qnfSWhNE; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qnfSWhNE"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4a5ac8fae12so142711cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749679561; x=1750284361; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r6v+Lx00PogSpTLtqb8OpINwiWwlsYccfvqmwc9X17g=;
        b=qnfSWhNEmnLo+96JaUmmKyqsLdGqWhy8YxkJqM2/p5rBgf2gomvE5Qbq+d10VBUAWY
         cKVvqyMFEZ2lixu7OLK0bfANSBJ59cn2jXdxA2tLPaQkT4NMSLkGNvGT8MhlyR5Dr5LT
         os9DykNyOMtxJDA6qbwukURoS8qtn9rS/RnfNrY/WdlBLBYMw1TELBiQN+x1/Ko2RzNT
         c02IN2+VgykqwhHDK4kF01Nu7BfLlxK3FHxQw0RZRt+6z50gUSAXKDTPlPGzMA0yySnK
         TlH7oZdEliBuEZRtC8yVBGDJ8wGbWwpm6e878mmiUyoBA8p71PrM8DIopTJv0npCwAJ2
         Vcpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749679561; x=1750284361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r6v+Lx00PogSpTLtqb8OpINwiWwlsYccfvqmwc9X17g=;
        b=qqLKxozbF95Nse9ppQguv+xoZuESSLlmXSy+eRBzWKAxaVBcQByzp5M5N2u/2HufQN
         iTbkUuxsd/ETaTeFMBEIc1w+nrSSADSwY9K35k9cBva3XcYlwcYSbJwAatapKR5P8qPB
         L0fuf4xv2TazcdU8YYJCRfCwBuOAQ3Myt/oW6Cah+kAqvoICJV8VdvB5czK5cFaUfiPr
         su2hHabr3p6iuHApniM3zAM1YnfRySDPAPmyjpU5ec6UaHpHg6e8d4kb2gZhFfsmJYj2
         qU6on9b09naFN5kYGuv/hKbNMm1W2o7Q+607aqfkm7/J8l2JlHUEP5S9FutZkY9qSLfk
         0TVA==
X-Forwarded-Encrypted: i=1; AJvYcCWaYCSeLz5GwpDswnS3D0S5duhRe9S4IM8C8UTD+sgK+Q/v89OB273n6azYiJcBkN22czqZUOlfHNz2YPk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJUHpkwyHA459LD2oEIoOOh7VJtB9f302LJrccxt2sKpjFcjPr
	Fwv+SfwAOAIR8UMrs7xHci20HJZAYin3V6y5XeJdkL+lkpGtmCSLdmiGm9tjQw0qd5o1sNyuW3X
	9JJAfp+/5LrYoC2cAkpE/IDhkNu68C5LV3ec9YMmP
X-Gm-Gg: ASbGnctl7UM0wypFtgYLGyl4C9AnL14LoYMw8cHukIMDXUR8aPfMzMzCXFXqnd0RsI6
	FtQeAikpIu2BYtjwmtTJQ77CDZb8WjIy3RPgekHkuYkvmNJAes0IExBYsSMtxuk0FYOH1icUD7I
	jW93b7x4+vS+aqqWJwPT6qvnh6u5i/qGB1EFD5lLwhW5rh5g+dISU0K5Cxg0tIfLpVUeUHFGBJx
	g==
X-Google-Smtp-Source: AGHT+IEBY/UkjQXV1lMnORLfnY9FIZMyMUT3D+2LVLKUtBU9gMCFpZwOtsADD3cHrQ41s2NITvc+hR4EZITi3Ul7ziw=
X-Received: by 2002:a05:622a:1882:b0:494:b4dd:bee9 with SMTP id
 d75a77b69052e-4a7243a7933mr859111cf.24.1749679561232; Wed, 11 Jun 2025
 15:06:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609184029.2634345-1-hramamurthy@google.com> <20250610182348.03069023@kernel.org>
In-Reply-To: <20250610182348.03069023@kernel.org>
From: Ziwei Xiao <ziweixiao@google.com>
Date: Wed, 11 Jun 2025 15:05:50 -0700
X-Gm-Features: AX0GCFuYF3MGPH4TMlK1EsMcjlLsjn5eZWHe_VzolC7pfg4XYeyAOBeZ_oIJfVw
Message-ID: <CAG-FcCNg5BWcqTBcMA+WYHqFdG-htnYXDuXZ=S+QuwhugZ6fyA@mail.gmail.com>
Subject: Re: [PATCH net-next v4 0/8] gve: Add Rx HW timestamping support
To: Jakub Kicinski <kuba@kernel.org>
Cc: Harshitha Ramamurthy <hramamurthy@google.com>, netdev@vger.kernel.org, davem@davemloft.net, 
	edumazet@google.com, pabeni@redhat.com, jeroendb@google.com, 
	andrew+netdev@lunn.ch, willemb@google.com, pkaligineedi@google.com, 
	yyd@google.com, joshwash@google.com, shailend@google.com, linux@treblig.org, 
	thostet@google.com, jfraker@google.com, richardcochran@gmail.com, 
	jdamato@fastly.com, vadim.fedorenko@linux.dev, horms@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 6:23=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Mon,  9 Jun 2025 18:40:21 +0000 Harshitha Ramamurthy wrote:
> > This patch series add the support of Rx HW timestamping, which sends
> > adminq commands periodically to the device for clock synchronization wi=
th
> > the nic.
>
> IIUC:
>  - the driver will only register the PHC if timestamping is enabled
>    (and unregister it when disabled),
I checked around the other drivers and it looked like they would
register the PHC when initializing the driver and keep it alive until
destroying the driver. I can change it to be that way on V5.
>  - there is no way to read the PHC from user space other than via
>    packet timestamps,
The ability to read the PHC from user space will be added in the
future patch series when adding the actual PTP support. For this
patch, it's adding the initial ptp to utilize the ptp_schedule_worker
to read the NIC clock as suggested in the previous review comments.
>  - the ethtool API does not report which PHC is associated with the
>    NIC, presumably because the PHC is useless to the user space.
>
Thanks for pointing it out. I can add the phc_index info into the
gve_get_ts_info on V5.
> Do I understand that correctly? It's pretty unusual. Why not let user
> read the clock?
>
> Why unregister the PHC? I understand that you may want to cancel
> the quite aggressive timestamp refresh work, but why kill the whole
> clock... Perhaps ptp_cancel_worker_sync() didn't exist when you wrote
> this code?
Will utilize ptp_cancel_worker_sync instead of unregistering the PHC
every time on V5.
