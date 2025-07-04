Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6564A1F561D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 05:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751606573; cv=none; b=cDrjACKnSDeoC0wXNAc3ywEdKIAjPGY/40p9xjbVhoU5yRnESl5ywa/94lDy49ZNLhNflmql/0oKlLDdPKpKe0foMz6XgCwBGy4LO0lLkGm1yu+sDiJ68clUaW+M9bx7tSmIdmkLP6PebYCYM9MYptsDn5MfiUdAaCfP9692AwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751606573; c=relaxed/simple;
	bh=+boJThdlKqfmBwvZYrrLLbALloBXGFMiCi1pxJTUDuI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=igpuzOXXhmdctF7siNyabkdWjKRPmD19ujVlMK2Ce0IMFfofwYD6NQ6N5YP/63ZQ5cr/QiV5Bzg+KBiPtouSiSsmRocLOSJalFTF2VGfJXwED9z4A7rBE9mBzvTJ/g3SFTeIna1DBalGn2F6xIMJjsbG7NtgjP9QW1yyjjGIoDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q87PzcII; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q87PzcII"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4a752944794so6396071cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 22:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751606571; x=1752211371; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dtn7MCRvr7mqmOBEdvHKnoAnHvjzH2ABPSrAJ9kWfz4=;
        b=Q87PzcIIJq/gke9eGm36RjknSc4VI7gMIPLveXDP4ifuoQyhaN1S/YXa/DOE5b1Hwi
         fRkGGHEm885dSoOaLRd3qLwT6wMrtDnbggprFTfQrwKeVDKM9nS8Exnq7bFmxsHRkc6l
         pcHmik8i9BlrIe98/ez8r80xtgk4vN5y6wofiwUvPKHEw/rFmE/7mwQji3KcgjWeAeXg
         N/HbjiwDNtbifbqIxD7Tze+J83TxCKUwAMiTikJNxRSq05qwgeYbZ5SqvTn5NzOHljjn
         4WmHdQRKanr9CfI8VDxGsAdE9R8NakGwkCupu27jxQchBH1ZoPpsaaC4aKvGQ9pnwnE5
         MO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751606571; x=1752211371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dtn7MCRvr7mqmOBEdvHKnoAnHvjzH2ABPSrAJ9kWfz4=;
        b=waFaiKFbzvKiHzDzGu3tPkrbz2Ire7RL56jwg3cMqWddf80zCwjICEbvincBV94mSd
         MvKLQ7kDxSJUmyoHoyCcAIxP36yh5bRmWjZiDzkpHrUUg25yNbQd4KZdHDVtxzAho6hf
         AY4UlpQfGkfgYZtooxsuwdfULLv+/XdO+yAmFbGsSrlPMyOgv5bMFS35tPEYUfDmJhNn
         Jx3pLvBDB+9uvxEMA7D4jzbdiDhRSqoghq/Jrd/iSLWo3XjMkS2yafmgrW4F9qlxgJmO
         Pv1MVRls/p0O7HA2eabXRM4H5PWkEdQ9jNL4tNbuhAImkbhBmc4IrZhl1f35Q9CG1sMU
         1x2A==
X-Forwarded-Encrypted: i=1; AJvYcCWvZaO3Fx5eSB1UFXxkxkbYjGyzqwV0vcEDOaEbgfZU/CZIXGjKz2I9hckdLPeIZ/onLx+TZ10kCbwzHwc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxoDdJai2xmzEi9uCBpnU34zej/X75nhXXa3r+VVHmuFG9N/th
	P6B/k3VxPamYKEBxHknryCVbtAwqcBSzQ8nkGEQj2aTW7MftxqCOdyMtev7V7vjX6J0FzBny/2B
	qOFnJacjoHxfydWMK8VgafNX+efWDSpmWOFz67nXS
X-Gm-Gg: ASbGncspfzs5QYmtCzcPkAJr4bxPMWrLD9nCiMItzljis3SLnN3MKXvRtu3jZPUeRWG
	kCQKWkZgCyunFCoc93FjiRFDVqFyyXuteM2tG8jk8laI/HIq4rzNh+zenNNweQXq7Eo4l2F5p8l
	F2aRp2S+7ueN6ytSN2NxJNoYUP7X44U1N9PJS8kM86GK2g6nTzDVC04l6xxAKidh6VDPbbO2N36
	I8/Bw==
X-Google-Smtp-Source: AGHT+IGHtApTLA1ZaaThYHX7g2bKOX+Vh9u6B7P2Xq7//vcIZtv+7HVCyoZ99whqFjsqvU74dbndyqaBWJPNbaUz6yw=
X-Received: by 2002:ac8:5e07:0:b0:4a7:ba7:1a2d with SMTP id
 d75a77b69052e-4a996404a7fmr23356041cf.4.1751606570989; Thu, 03 Jul 2025
 22:22:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_5CB8EAEE13F1E94F2203F0C7@qq.com>
In-Reply-To: <tencent_5CB8EAEE13F1E94F2203F0C7@qq.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 3 Jul 2025 22:22:39 -0700
X-Gm-Features: Ac12FXz8pyNISWhkmxKk8VHE4NRewQ2YjBUGeo2x92wPPJSmOxZos9HtErFZIRk
Message-ID: <CANn89iL2jGPyPhha3J8y_FV_31tGHJ4mQSSvyewcPh4dzbOVKg@mail.gmail.com>
Subject: Re: [BUG] Possible Null-Pointer-Dereference Vulnerability in
 udp_gro_receive_segment Function
To: =?UTF-8?B?6YK55oe/?= <21302010073@m.fudan.edu.cn>
Cc: davem <davem@davemloft.net>, dsahern <dsahern@kernel.org>, kuba <kuba@kernel.org>, 
	pabeni <pabeni@redhat.com>, netdev <netdev@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 3, 2025 at 8:20=E2=80=AFPM =E9=82=B9=E6=87=BF <21302010073@m.fu=
dan.edu.cn> wrote:
>
> Our team recently developed a null-pointer-dereference vulnerability dete=
ction tool, and we have employed it to scan the Linux Kernel (version 6.9.6=
). After manual review, we found some potentially vulnerable code snippets =
which may have null-pointer-dereference bugs. Therefore, we would appreciat=
e your expert insight to confirm whether these vulnerabilities could indeed=
 pose a risk to the system.
>
> Vulnerability Description:
>
> File: /net/ipv4/udp_offload.c
>
> In the function udp_gro_receive_segment, the variable uh is assigned via:=
 struct udphdr *uh =3D udp_gro_udphdr(skb); However, udp_gro_udphdr() inter=
nally calls skb_gro_header(), which may fall back to skb_gro_header_slow() =
and potentially return NULL. If that happens, uh will be NULL, and the subs=
equent dereference: if (!uh->check) { may lead to a null pointer dereferenc=
e (NPD).
>
> Proposed Fix:
>
> To prevent the potential null-pointer dereference, we suggest adding a NU=
LL check before attempting to dereference.
>
> Request for Review:
>
> We would appreciate your expert insight to confirm whether this vulnerabi=
lity indeed poses a risk to the system, and if the proposed fix is appropri=
ate.
>
> Thank you for your time and consideration.


Callers of  udp_gro_receive_segment() (via udp_gro_receive()) are
udp4_gro_receive() and udp6_gro_receive()

They both bail out if udp_gro_udphdr() return NULL.

If the first call to udp_gro_udphdr() does not return NULL, another
call to udp_gro_udphdr() will return the same value.

I might miss something, but I think your tool has a false positive.

Can you double check ?

Thank you.
