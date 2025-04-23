Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F522701D4
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745444851; cv=none; b=iP1BfjI/pyf3/5GlYeC+ukIj+JvZNuEnbCKCBxFE3h2cMxg+/9VMVUt/5qJQGVId9VMaGYArW9r6kM6ZXixEiO95wRDIVPkQf+tHzfzot7ZZ1sNXyCGw7re7fe/DR0dEou7ZhA1I/QtMIuf2oGyrMa9Gf1F8IcA8FOyo5RkaBIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745444851; c=relaxed/simple;
	bh=mEGCy53t42KKgmv0y028TCxT495IH1sISPS60xkZX68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JcYXtinyxsyGNSw0PJ9yaINoiiW7G42csJteG1v4H/0SJYTzsT37SeEqFQk3v4x03PWOasbIkRYoP6ZW4epdx8BXBR6miNZgLuNHVGh0imubV+Yl5yEPeb2WB6ju73pRd9De5XBDOFJqYMISYOHOgL2b6jWyq9A0BhufnPqutBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mib4WNxC; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mib4WNxC"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-525b44ec88aso174774e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 14:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745444848; x=1746049648; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4sHVWUSVyu7qyPR+9bG43YKEKJ9PTMaIdTn4+x+dWuk=;
        b=Mib4WNxCkTaebRZ9dssPnB+E4jNO8dy2FLPAYPcpgb6f5mmw/uSTjPKZMBCeJfX/db
         wWIo1BGod7MfcKynxSDvnA7vTLnE+zBfBrmR9a7cuKvTluD/PrgF+wvkhQ9NrNZu3XiI
         U4ElTXbDAAFIgPxEtFJgEcWv81jaiaUFUpm532cZSY9txAGs5AeyMfLdG+ObZj0oaR1B
         dUiw9Ls8MhME0dzVUaMCRI0c6RNSmTIqJaTUmcdIQ/qQpWhUDmfhdZkW57LsGE8oJojk
         k+h8GLn+TV+1OzW3M69maJxHI4PZ35aWWkAxYn4hNL/IgC/rCsb4UHy6ALs34LINSPe/
         KKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745444848; x=1746049648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4sHVWUSVyu7qyPR+9bG43YKEKJ9PTMaIdTn4+x+dWuk=;
        b=L9saCwZPhanyrQwxKj671x+4eHwiiXT+amknKxNUDVfcDlDJeAB24NNFIRmXkPJr8f
         c7bTVp2ir4qZIObft6VYonoewBIKmI1/aRjr7BqjIr3k46pc5t84Qs9+DgMM4mTZZOE5
         hmx5kHPYOMzEs0d/eqrGcV5+0JJsVbq5IakkRvRI9IIhZF5Ot5hfZm+Un5xKGyYTEGL8
         CB1p6rBaymukvoWaS17+dqKP1kcXUnycOd3Pd6bkCwTKelzU7bT7ftHE6IHqdjfVPQA7
         s+0fWuPausYh3x3q7RUVsopQjdy3F5mjjSFzxTKxG+qtXVwxjrfwkP1863AjEMWPTI6J
         Pdng==
X-Forwarded-Encrypted: i=1; AJvYcCUpLCQrNVb4TTKpY6ToU53vvl0MGXzRQFywoBsVHHGyWlBLiDfoe4WPrIPIVcZbWMqkkTvBP0UujaiXFsM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmrAO3xdFnxcUCg8JdXiudYsMV6s+vB3vISDIH9TiCq1syHO2X
	LFeqtnUmoki5HeVwVN6rTGMxrpHyvlJuijCm1sHsvlO9mvQ8kv08CauGTFlacQKyfPm2+NKpwLN
	tzU80bTyrtWK+N85oU6x2upNFZ80=
X-Gm-Gg: ASbGncujhXvFyKj1lyMJ8WymCQvN5xAlP4PLwrPO8SKl7uxIap1m+C2UfnXzYFcqrET
	4A25QpoINOAgHc7wlNISXJOnVo/q69eWss+yFMth6Cz+OsY1/ePWVWI5bX+G9rjFKqQ0vffbkk6
	67flo0AF2UT+nWj8qAoYCmtY1E+1i8IIDh8qBMIVgGI1W6zX3a8IK0
X-Google-Smtp-Source: AGHT+IF1Iw5t9hIYip1CYltVWmdYJ9subH9iIWt8HpCybfCDBINIFXFCY1WqE4CgkdnqUxg4T6q0MF7Lmw2+cM/mRaQ=
X-Received: by 2002:a05:6122:180f:b0:520:64ea:c479 with SMTP id
 71dfb90a1353d-52a783e4749mr321968e0c.10.1745444848135; Wed, 23 Apr 2025
 14:47:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423060621.632581-1-alistair.francis@wdc.com> <ed993f55-bdfc-4376-951d-9af4a4f461a9@suse.de>
In-Reply-To: <ed993f55-bdfc-4376-951d-9af4a4f461a9@suse.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 24 Apr 2025 07:47:02 +1000
X-Gm-Features: ATxdqUH2fZjFHI9UHeN90ujII4BDW5G2U9I0iPmpwtdIW_mJw1I3eq2hy3v057o
Message-ID: <CAKmqyKOBOCV=mU0BRdZu2vPzx-+3fkp7qJXiTXF7dPM35eXguw@mail.gmail.com>
Subject: Re: [PATCH] nvmet-tcp: don't restore null sk_state_change
To: Hannes Reinecke <hare@suse.de>
Cc: hch@lst.de, sagi@grimberg.me, kch@nvidia.com, 
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
	csander@purestorage.com, shinichiro.kawasaki@wdc.com, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 4:21=E2=80=AFPM Hannes Reinecke <hare@suse.de> wrot=
e:
>
> On 4/23/25 08:06, Alistair Francis wrote:
> > queue->state_change is set as part of nvmet_tcp_set_queue_sock(), but i=
f
> > the TCP connection isn't established when nvmet_tcp_set_queue_sock() is
> > called then queue->state_change isn't set and sock->sk->sk_state_change
> > isn't replaced.
> >
> > As such we don't need to restore sock->sk->sk_state_change if
> > queue->state_change is NULL.
> >
> Good catch!
>
> [ .. ]
>
> > Resolves: https://lore.kernel.org/linux-nvme/5hdonndzoqa265oq3bj6iarwtf=
k5dewxxjtbjvn5uqnwclpwt6@a2n6w3taxxex/
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> > We could also remove the `sock->sk->sk_state !=3D TCP_ESTABLISHED` chec=
k
> > in nvmet_tcp_set_queue_sock() if that's prefered.
> >
> Please do.
> We cannot influence what the network stack did, so if there ever were a
> modification which caused the ->state_change callback _not_ to be set
> the whole issue pops up again.

If queue->state_change isn't set for any other reason this patch
should also work, but I'll remove the `sock->sk->sk_state !=3D
TCP_ESTABLISHED` check as well

Alistair

>
> Cheers,
>
> Hannes
> --
> Dr. Hannes Reinecke                  Kernel Storage Architect
> hare@suse.de                                +49 911 74053 688
> SUSE Software Solutions GmbH, Frankenstr. 146, 90461 N=C3=BCrnberg
> HRB 36809 (AG N=C3=BCrnberg), GF: I. Totev, A. McDonald, W. Knoblich
