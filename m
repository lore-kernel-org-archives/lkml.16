Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69450218E99
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 08:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751878604; cv=none; b=gzH6CE4aYX7V3db0j8Kd46/uQLES9oFf0asw03RM9GGYwPby67w36xAX6CZBAWAqoc/mVa5BtALc6OlydAfy43BxgVTuGGrfqyN9QfCVvIM9dH43EVCBs/QmTFzat6eMMgXyvu6rDX6GwUD0Y3E7CKLxq5cr73COdLKrw+VjpDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751878604; c=relaxed/simple;
	bh=iEBG2BEB+4++NdmPSsljo6ZDbAMgpxt5MNGltsMo79o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bpju99K1OcBtRQWhwfPfHUZUWmRgEINQDg2YiK7e5paQbQeh39ZB9Gngi9WN/JoM7N13v0whFUwH24ezio8tAYF3HjYUOFtA6M0JtFru1TJcdxaLvhhwEGKlSzGtpVo/B1oeLzf6iQASVl4c05s3DdDxoR6Mq2sF0uAXGqXovD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OvnvMYX9; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OvnvMYX9"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4a43afb04a7so19973941cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 01:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751878601; x=1752483401; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iEBG2BEB+4++NdmPSsljo6ZDbAMgpxt5MNGltsMo79o=;
        b=OvnvMYX9NI7F4jdOw+2cR48Jgf66vLOXC2kRva5KAC7BoItetnhd0F70+EukMx3VxC
         w9iS0YjUUEbvXwg/zt1+/2S+4e093BwaIbJvxDjhWwwOGeHuRHRLPBlP0RJUX8a3dNhH
         Fk05O6I3jsae5b2c806xJWz8e4QhVh8VF8n1/bjtWyfpOPuqYFKWDiApf90EY2vcYHXA
         MbJ9eQxv0ML1qzhQav2qN7/PMqoCyWbr/zIr3aIl32xK4LOM7Ncg21iMBJXSu/hNTxfh
         IN3HwvRmpL8UB3eNl/LbTWxUbW2CooTS3tRqNvgkyZitT3Cms7N0azrEpPT52pyWWn1w
         py5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751878601; x=1752483401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iEBG2BEB+4++NdmPSsljo6ZDbAMgpxt5MNGltsMo79o=;
        b=eUdfMW/ryqEoO7MhsMVnrAelAMnr2weQbnHSsnT7dvlnP5KOwV3woVqHeW7UfQMPCx
         62EC4ESAA5qcDCRjp99xpcFEa/fC6XN/RSeNJG/tGmAV+xOmdCCrfrzDs2ZVTFfgTTLU
         OY1HSajvsU1JPnx+NjiNv5nVvsCK8zKFTZ0ddgsCFaSVB6NIlBE9qh1sv1ypFe+v5jDe
         4px323RVGPSQyPtKrlHG01/Td9ODvQ4fyHgFbxUs06dBvjOtXelfaeQanfYI6bJJpTRn
         Jl31sg7PUIjrp+Um8uyS/frpHo8ilCXVym47tF951k8uLfU5f6WeTy5Gw/Ig0WY4gc5X
         njNA==
X-Forwarded-Encrypted: i=1; AJvYcCXbotrjzSureSBT03C3NO8kr8r/9yN5WM1+xoNEsbkg+69sYQ72xf3mMJUnS09Q9C/3kpzbI0T6p2pRdBE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLSpOT5Y4fX8WsjRs1z5gmwupIOt5rfedbhwzeH32JM7XZUD1P
	Hj0J0AxZ7sxI6C+dEcOGCRYQI2ZpbNHleiG6wub6OJP9UpP6ZgEYz4bYvlmpJQof4+DQULXEeo8
	H5BbvnaF2mbQvAvctkKy5c+uCL+t/D+ij/rrrSpDs
X-Gm-Gg: ASbGncsQgGeB6HOvhwzcx7B+p6MXw6/2HBtQvpGxduMoejo+TT2HbhPqwMTUs4hPFuQ
	IrramjzNC+IhYQ6txY/kIREsLaUete6ZFgq1y1QXM6QeRNDdO/Th0i8zyaM7iJLwYm2ip7gdr7q
	FHEKG1WS3COXrYQmooT7+QrAn98qcsdSvW9HNj5b4nOg==
X-Google-Smtp-Source: AGHT+IFbzUAR3AySOZHQnI850gnAOGSVbPTznUZQO+5GoyFC+wzpGVkSnFFUye/b0rqpA9VjDDYLKPqKJM/0yjpIgMQ=
X-Received: by 2002:a05:622a:5a8d:b0:4a8:182f:3514 with SMTP id
 d75a77b69052e-4a998887abemr208128351cf.49.1751878601008; Mon, 07 Jul 2025
 01:56:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250707081629.10344-1-luyun_611@163.com>
In-Reply-To: <20250707081629.10344-1-luyun_611@163.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 7 Jul 2025 01:56:30 -0700
X-Gm-Features: Ac12FXxsVtFZYPSQQ8yOqY-Y4CGMr7OVeyACAvTT4OXgLrXgDJmzFwLGe1Exgfo
Message-ID: <CANn89iKZRpJVduH0WZ57pqRaEma-HB2ymi9P9Q7aK-f7Q8r5XA@mail.gmail.com>
Subject: Re: [PATCH] af_packet: fix soft lockup issue caused by tpacket_snd()
To: Yun Lu <luyun_611@163.com>
Cc: willemdebruijn.kernel@gmail.com, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 7, 2025 at 1:16=E2=80=AFAM Yun Lu <luyun_611@163.com> wrote:
>
> From: Yun Lu <luyun@kylinos.cn>
>
> When MSG_DONTWAIT is not set, the tpacket_snd operation will wait for
> pending_refcnt to decrement to zero before returning. The pending_refcnt
> is decremented by 1 when the skb->destructor function is called,
> indicating that the skb has been successfully sent and needs to be
> destroyed.
>
> If an error occurs during this process, the tpacket_snd() function will
> exit and return error, but pending_refcnt may not yet have decremented to
> zero. Assuming the next send operation is executed immediately, but there
> are no available frames to be sent in tx_ring (i.e., packet_current_frame
> returns NULL), and skb is also NULL, the function will not execute
> wait_for_completion_interruptible_timeout() to yield the CPU. Instead, it
> will enter a do-while loop, waiting for pending_refcnt to be zero. Even
> if the previous skb has completed transmission, the skb->destructor
> function can only be invoked in the ksoftirqd thread (assuming NAPI
> threading is enabled). When both the ksoftirqd thread and the tpacket_snd
> operation happen to run on the same CPU, and the CPU trapped in the
> do-while loop without yielding, the ksoftirqd thread will not get
> scheduled to run. As a result, pending_refcnt will never be reduced to
> zero, and the do-while loop cannot exit, eventually leading to a CPU soft
> lockup issue.
>
> In fact, as long as pending_refcnt is not zero, even if skb is NULL,
> wait_for_completion_interruptible_timeout() should be executed to yield
> the CPU, allowing the ksoftirqd thread to be scheduled. Therefore, the
> execution condition of this function should be modified to check if
> pending_refcnt is not zero.
>
> Signed-off-by: Yun Lu <luyun@kylinos.cn>

I think you forgot a Fixes: tag.

Also it seems the soft lockup could happen if MSG_DONTWAIT is set ?
