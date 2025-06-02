Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607911EB9F3
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 09:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748858178; cv=none; b=DYOmneeLB+ntI9QGZR512QMZPOup3eKlXloiwuLbFiL/EcbL0FviWZrhGstx/f51xFBp12PbeGhr5p2EHYxSokjEzJLTDI7C55eMU6175ycWvbbQG5XLEMguTeG+1LDa7e9u6q1jxy88KjXg+3sRNGRfTdjtt1DGFWBTasTlYIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748858178; c=relaxed/simple;
	bh=I5fhIcX9R5LzAmpupA2doeAUw0q6Egg1zDl0/wS0r10=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f0kNdHwIG9wcH3bRnOr9G9oc0DynqKnuGdMvntrbzGZgmlDWMt61b/rl+sJXQXOsAagr1zLOufQ55N6rcfeHdXrjyAF0cBySod17F6QHtvQE2lbbXqLBvP8Z8Hv73T8wbPpurv0qLqNdll+b5/Av7IrOazoeTEIUB8f+A6HjfFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tJS4Ixnh; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tJS4Ixnh"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7d20451c016so56895385a.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 02:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748858176; x=1749462976; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I5fhIcX9R5LzAmpupA2doeAUw0q6Egg1zDl0/wS0r10=;
        b=tJS4IxnhZVLPuRCSlcvZ5MsISx3ym21vfQ2Z6wl9Etaxg5vBWnbEnXNt8fZndy74hn
         6lNuvxmQHSvnXvjmiOHzdN4ibvrhpx2a3vleg447HY9vAy1xLEM2jTAofB7VIfOm604o
         lq/s7cFhqnfIUaACw43RW4wWU3rohWnmC0ALFPwveCyAMEf01lopOqyepppxvvzmVkQn
         7tY3LwUDfvowBisLLwEHsdcf+c9yb/fuVzYHnjhbyFN6aXK0VfKsE/DI1wO2dBOPQ4OK
         8bPepC5IdQv5849Vj+8K4qRfyBfHjHW2fBlJdppNDXLzQQU7ArzIrG7cTIqRLV2NBc0g
         MNYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748858176; x=1749462976;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I5fhIcX9R5LzAmpupA2doeAUw0q6Egg1zDl0/wS0r10=;
        b=UF7XtMZQ6dD8IEiAo/Snzj8Bo+9wJXQ0/qbAw+GFGhKMJWA1j2vMnr5JiBMxaGif8/
         /VG06OnayVAfx9mOpYGnf8HZItWecmvt4/pEkglmUcJGAVMkjp+RodOYJrxvIVbsBLt+
         vXmJETouONZhtr3nyIwQjuro5jCb4+yLlf6zyHWqOUeEticYTfol4jKBRnA2kJvQi60R
         kYFJQUj4exu4NyP9z6gNr+2F5umgCT64VxPeuvEERhMUo7F1vwrMeTdNmo/B4v6xTHVu
         /7JucwwhdPF+WlacG3T1cS8lZbyl/I9vT/w2CuOftjyvYSddPooQwHn6bG7JInwbBNCh
         xiWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUz7ZqJ7CIPz5EfNFA6/ZP8cKLF124YoNZqEolqu0yGn28+YJxyUFhxvYnqUhSYwXB/lhprUGbxZQqdafk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2YX2ZLpkW4YVIlEtqyDTpY+XKOzTMzMWAgHxo4Qgp1wrDTBEu
	OEej0Up9J8ezwL1KD2l1YEfbh54/maZn7AmSi8RxaNgxQJ4ONk0Oqn60y3wq3dwB/Y8wUUE8hDJ
	hUtURXDH2xfHmWglT+VRdYxRetzr8eSCKmmomF4jC
X-Gm-Gg: ASbGncuTaG0Zjl7YsjbN88dfe2s9ZGx4J8TcvuHOFMCF8em+ZPwAMnaVrVQqhMjJpe5
	5ecfJhvVQ9CvbrBlZ55zvrh4CpZ7K2VmAbgQ3mAcVdtC+bIHoNpMddP6oDmtRlfTMo5wMlpMSqJ
	jGKUOiLh9sG7v/kfaj9/ATTw1S/aLPMNuMy5CrYf7RqYrYBRb7ACWp
X-Google-Smtp-Source: AGHT+IGmwhaOBW7VbwSOv1WMBKd6SlJI+wIxiB0zoKBYNRY6n8byD9lTOYsYwTbeAUBOkAF9KY/tvnaFVR/Hn7bYeIU=
X-Received: by 2002:ac8:5391:0:b0:4a5:912a:7c64 with SMTP id
 d75a77b69052e-4a5912a7c9dmr19160701cf.30.1748858175900; Mon, 02 Jun 2025
 02:56:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250601193428.3388418-1-alok.a.tiwari@oracle.com>
 <CAHS8izOqWWdsEheAFSwOtzPM98ZudP7gKZMECWUhcU1NCLnwHA@mail.gmail.com>
 <cc05cbf5-0b59-4442-9585-9658d67f9059@oracle.com> <bf4f1e06-f692-43bf-9261-30585a1427d7@oracle.com>
In-Reply-To: <bf4f1e06-f692-43bf-9261-30585a1427d7@oracle.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 2 Jun 2025 02:56:04 -0700
X-Gm-Features: AX0GCFvShUBo8WbtS-wLZUcQnyH6CFG5ESUmItrjErL_sH8T6UjJdi1uunrIFUE
Message-ID: <CANn89iJS9UNvotxXx7f920-OnxLnJ2CjWSUtvaioOMqGKNJdRg@mail.gmail.com>
Subject: Re: [PATCH] gve: add missing NULL check for gve_alloc_pending_packet()
 in TX DQO
To: ALOK TIWARI <alok.a.tiwari@oracle.com>
Cc: Mina Almasry <almasrymina@google.com>, bcf@google.com, joshwash@google.com, 
	willemb@google.com, pkaligineedi@google.com, pabeni@redhat.com, 
	kuba@kernel.org, jeroendb@google.com, hramamurthy@google.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, darren.kenny@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 2, 2025 at 1:50=E2=80=AFAM ALOK TIWARI <alok.a.tiwari@oracle.co=
m> wrote:
>
> Hi Mina,
>
> On 02-06-2025 01:21, ALOK TIWARI wrote:
> > Patch itself looks good to me, but if you can, please designate it to
> > the net tree by prefixing the patch with `[PATCH net v2]` as mentioned
> > in our docs:
> >
> > https://urldefense.com/v3/__https://docs.kernel.org/process/maintainer-
> > netdev.html__;!!ACWV5N9M2RV99hQ!JPpnRT9itx84rhzAaeGelVD-
> > bnJR8vFksx2OjGzAKZWf_A6o8hEY0CUMMUO_NuSStcCyBGnvhoJAJlADszR4D_aj$
> >
> > Also, if possible, add `Fixes: commit a57e5de476be ("gve: DQO: Add TX
> > path")` to give it a chance to get picked up by stable trees.
>
> I believe commit a6fb8d5a8b69 is a more natural and appropriate
> candidate for the Fixes tag compared to a57e5de476be
> What=E2=80=99s your take on this, Mina?

Mina is right. Bug was added back in 2021.

Fixes: a57e5de476be ("gve: DQO: Add TX path")
