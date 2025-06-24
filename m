Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB412343CF
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 18:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750789892; cv=none; b=CgQiJpCfuouaDpCQq6JnU2KSq0jDe5olEwB9Ea7NXw8tqutrqYKF5yL1YHbmFx3Jw6PBD5SKGphzYRDPQgIgNiPl/86T3krkDmWaPgaX2LhBsYJ1aYlG5FQCJXsWNmmeRpXKisYNoqvnBIJje2VQYrlMr+q0UEHQAfb3BzeKKmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750789892; c=relaxed/simple;
	bh=oxggGxlEAxQEG8dw/1WSvlADiepky9mdW9MNmieccOM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s3SGIGaV93FTztMig4Arbeqk9UU9NM0zZNKnHcLsA1jbRNsd4gzF0+J7m31MLCPbBnAAYg2T9ZORzxQaxdzGNZz1iwtSVCo1Y+io8QSo1E/SY2RDSLFGeFwgZ9hddURIGUYrDZmoE0hmWlCVBDAU9FoZyk2Ultm4NK7NS2Cs2J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=frN3BPTD; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="frN3BPTD"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a4fea34e07so435107f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 11:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1750789889; x=1751394689; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6wcG9j8VdN/npPwgyr0htyxSJI9SVIjp3ma+CA4lJZY=;
        b=frN3BPTDIdQzrJIYBwis8zfSQMoyLD4EMPu/S6n7IBWNYVWI7rppG0w6NnjxKAagin
         pG+IFvzB3MiwhZgXdjQ2W3e+oMYDMfoUCs67iH47CDwS2sZcNLmNiV1qX5vD3sUeXdpr
         IJJVqmxR9tb22c8BoJj7UudPDSjJtzMKTUJZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750789889; x=1751394689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6wcG9j8VdN/npPwgyr0htyxSJI9SVIjp3ma+CA4lJZY=;
        b=WHUkE+iCW+5Q74lJIG1TkkEC1ku0z15QVz+VUXqdfPMz+7RUULPQPJAWDz0m9AKThL
         zULdjivIFWtn5RsuIl2R3ysoypPHoyUmOSU1BBYPPpXLpJeWfRcQJ2j+RMpJBoqT3bgM
         wDso3bBpn1UYXX2QYBqtW1cJ9Q8F1cGo5u2GeqQMiRFfulN9VapsICDvag8+Ee00ye0o
         64OALU5oX8V9XeLdXP6qofRByzXPttSNIDa+5FJjw0DnwSOpOJmz6xWeBp70YIp3u/Iu
         DiP2pb2gj5qrvPPGuUcjo7GDEQOMgY5N3h9f2tRL3G1Eqcwx5jW2sgaHfgqdoSc9XQub
         ILrw==
X-Forwarded-Encrypted: i=1; AJvYcCV0rDCPzZjACRb2i7bhpbM/34kFFsysMijrSoPMSFiyF+Z8Lwie8URprVdFNOIAt+sSd/s9fZRsHC6YwBU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcSMgqoL7n4CYthQMuFSrrU561g/Y0QbxSceXp8gSyHzChGo7v
	YduVPZLQnqtSTJnia9oZDU58TdfYCH0MmOI0dlvPvxzIi4pQaAGVl2NnFbF3qEGvdh352WNUSVX
	JXlzRj4f3mOCFjWUUm/KPJBEvD9ozXOIDL5Rtb3Cc
X-Gm-Gg: ASbGncsa04Ii5JE3rc62j8VMaYNxK4pksHYRXpZilYypbn3nYak74NzSO4eBhYZCzLU
	J/UtZIN6AWNPgr77AKtdl5ZS7K7X2ytSViXVJplRyrh6SoqpYUqJ6zND/175VSC2BmBi34enBJ8
	k0Ifn1G70RxGxarTKt9BLfZDaDAsWLJRd9xa1oHyv6GqVA
X-Google-Smtp-Source: AGHT+IHlsJf8+bi5OMmeyYd45t8XxJc7w9Vdsy57udvF0huW0fRWNhgY20XQo1TYvMIZI/PAdLdm921J3sfinlX3PFU=
X-Received: by 2002:a05:6000:2f83:b0:3a5:2d42:aa25 with SMTP id
 ffacd0b85a97d-3a6ec4d3cd3mr776826f8f.50.1750789889090; Tue, 24 Jun 2025
 11:31:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aFl7jpCNzscumuN2@debian.debian> <633986ae-75c4-44fa-96f8-2dde00e17530@kernel.org>
 <CACKFLik8Ve4=eUV=TJMkwkScLN0H80TtiqPUwtuDqNEji+StSQ@mail.gmail.com>
In-Reply-To: <CACKFLik8Ve4=eUV=TJMkwkScLN0H80TtiqPUwtuDqNEji+StSQ@mail.gmail.com>
From: Andy Gospodarek <andrew.gospodarek@broadcom.com>
Date: Tue, 24 Jun 2025 14:31:18 -0400
X-Gm-Features: Ac12FXzy1JNsBli5zeDTmdvBa1itDipHFkLbZK-3c1TY40dRr2V_CjtW_YzgdDY
Message-ID: <CACDg6nWEAKWU3s1x+NRU28BcXHK0=yFkAAU4MMkSTgEA9g592w@mail.gmail.com>
Subject: Re: [PATCH net] bnxt: properly flush XDP redirect lists
To: Michael Chan <michael.chan@broadcom.com>
Cc: Jesper Dangaard Brouer <hawk@kernel.org>, Yan Zhai <yan@cloudflare.com>, netdev@vger.kernel.org, 
	Pavan Chebbi <pavan.chebbi@broadcom.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	kernel-team@cloudflare.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 2:00=E2=80=AFPM Michael Chan <michael.chan@broadcom=
.com> wrote:
>
> On Mon, Jun 23, 2025 at 10:59=E2=80=AFPM Jesper Dangaard Brouer <hawk@ker=
nel.org> wrote:
> >
> > On 23/06/2025 18.06, Yan Zhai wrote:
> > > We encountered following crash when testing a XDP_REDIRECT feature
> > > in production:
> > >
> > [...]
> > >
> > (To Andy + Michael:)
> > The initial bug was introduced in [1] commit a7559bc8c17c ("bnxt:
> > support transmit and free of aggregation buffers") in bnxt_rx_xdp()
> > where case XDP_TX zeros the *event, that also carries the XDP-redirect
> > indication.
> > I'm wondering if the driver should not reset the *event value?
> > (all other drive code paths doesn't)
>
> Resetting *event was only correct before XDP_REDIRECT support was added.
>
> >
> >
> > > We can stably reproduce this crash by returning XDP_TX
> > > and XDP_REDIRECT randomly for incoming packets in a naive XDP program=
.
> > > Properly propagate the XDP_REDIRECT events back fixes the crash.
>
> Thanks for the patch.  The fix is similar to edc0140cc3b7 ("bnxt_en:
> Flush XDP for bnxt_poll_nitroa0()'s NAPI")
>
> Somehow the fix was only applied to one chip's poll function and not
> the other chips' poll functions.

Odd that we missed this back then.  Thanks for the fix for all other device=
s.

> Reviewed-by: Michael Chan <michael.chan@broadcom.com>
Reviewed-by: Andy Gospodarek <gospo@broadcom.com>
