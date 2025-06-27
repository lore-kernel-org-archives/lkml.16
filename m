Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EF518E750
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 06:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751007170; cv=none; b=SkFYEGzsaLMXTro3O9m50jWf6Xqbf6vrPuDYyRghx0237+BIUcL3SGKT0dIgZTeSseeK+40XBYFcfAqJuvzKg6jO3z6dDIJ8capd6dHiRDy+Q/QoOa5IA3diS/TTOrZG0ASTClxMuVVLXM6ETg0xSyQsYU/0qvzx9eazU+XQY/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751007170; c=relaxed/simple;
	bh=al0hP3jK7BMgOXJbds9j4gsxtWUZxEhNq2cDmR5SwyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IzqX901u30/ygRt541ccRZnS/h/gMpIQyP+AjeIybxxRd+L4sfVRAr4/kQPQIUZ2LOIeUSjYeDK+HmMlvewRoScBvvD6KzRA3Yw+tmZaM1WL5bx/AzzxYx4Q0osYZyqJ03mMGpjum/VDCeKL2P0Z7VyW+eStGR+HHCCL+/HPZfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dPa+h1+Q; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dPa+h1+Q"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4a5851764e1so34946451cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751007168; x=1751611968; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=al0hP3jK7BMgOXJbds9j4gsxtWUZxEhNq2cDmR5SwyY=;
        b=dPa+h1+QsfN7xxLBAz0q6UcNVIdTNmc33ID8l5BtjywOaFfiAPgmig3K3HLpPK8TeZ
         P+e0OGSC8LfJHL5hScEBMuthwKSJDBEHmCVj0muSN0c+AKNEl8dBWGF+yLNgar40bAPg
         PC4bPU+SxnjsaU5qiH+z93cXWAGkZznZfsV+mzI2o4VGxhe0kfwyvpScEgT0Ll6rV/xc
         yk509wd9mq1pt8e2tGdKl1t1rCPZrZQLlkBy/JSo6q2t+SsaA9MvBa+ap0QT3Ex04DwS
         Z22xeitTC3XXLZ+UNkiqrYBD8VGLAR594KnMdWajJjqU355XWw+1yArgO4j1K/La1RiF
         V06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751007168; x=1751611968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=al0hP3jK7BMgOXJbds9j4gsxtWUZxEhNq2cDmR5SwyY=;
        b=sOk8F8gttS7VtQ16AFwN7qrgx8rBZMzoMPIAewwmIzOVhWnt51s6w2mumW7U3/pxF/
         QduBd/fPMf7PV3e0wG+5Do0Tuk+GUDkdsU6VmW2eZt+cC5p9UfiSkSXfG2Fs9muKpoo0
         536840gTxKLON7vL1iIFeJLfqhTtTmPwVonrYIaXK61PYNJGfjWMTYj0bXdyMOTrPkL+
         kzBmGgjpxKHr/WdM4dboiIUV5pMKtKaeASbflxKB8+N06YeNr4Vr4RnFe9mVXAH+v9sJ
         9T0v0Uw+akKnahIxuZJpGg5YGL4B2nxwGYri+5Fnis5twP6+/exHmelzxk6GMR6YAD4Q
         Glcg==
X-Forwarded-Encrypted: i=1; AJvYcCWt3qxgTPxEHcyO2VZdtFYFXeRhobTBe94l4xgwmMAAE5N0kWWW/CNC8ycw4M6QfQFHFK7KfgNaB2/Mr/I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxqlAwimkuyM+9Skr4yy+Kd4PZY3RZhHVQMR4VBAuiMe4moese
	Kb0ToZ5aehHW9ZAjjJAkCwAIqsLc8TtG5ve2IyukEbHo7qsS26qpzVEgECbAL+W51TTfh9kv1n9
	7RIkZDq2ZmprB1Ls0RYbRz7U+TAhjFAHas/RS5P5eYzszkvKO2GRM7aKV6wI=
X-Gm-Gg: ASbGncuuj4ribrSwq12dJpmiKvFUdnXl2ScV9fj2K2oUB3SSuOXj3XNv7RF3EEeMOcq
	ERizfPvo7YwJ5+oIVe4zr8uhb28whSmoJg87QmT64alo+NDuyNziDehdeJ8ALSJ3PIT9TYVeWjO
	Q2W1CpORR0JVJo8xhmwLs8yKV4sfemP8OoIcA/wRR5DfBJYJXRO3c9
X-Google-Smtp-Source: AGHT+IEPBqWT/GV01Fy00IJ77bWCUdtJK/GlNaGd/pKF+Z/UsurcBd54QfHuDJmPQ+IFuYw4TsscuIy8eVOU5/Hm7c0=
X-Received: by 2002:ac8:5f0d:0:b0:4a3:5ba8:4978 with SMTP id
 d75a77b69052e-4a7fca45d98mr40468011cf.21.1751006669534; Thu, 26 Jun 2025
 23:44:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625034021.3650359-1-dqfext@gmail.com> <20250625034021.3650359-2-dqfext@gmail.com>
 <aF1z52+rpNyIKk0O@debian> <CALW65jasGOz_EKHPhKPNQf3i0Sxr1DQyBWBeXm=bbKRdDusAKg@mail.gmail.com>
In-Reply-To: <CALW65jasGOz_EKHPhKPNQf3i0Sxr1DQyBWBeXm=bbKRdDusAKg@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 26 Jun 2025 23:44:18 -0700
X-Gm-Features: Ac12FXw8B5uCF1YYGK-NP__GnNnDRKGjEfGKypkayVaYnKX9pkP04LmQrIHb8dk
Message-ID: <CANn89i+GO3jSDs94SaqvC8FvO9uv4Jyn_Q0W752QcvRSPLnzcQ@mail.gmail.com>
Subject: Re: [PATCH net-next 1/3] ppp: convert rlock to rwlock to improve RX concurrency
To: Qingfang Deng <dqfext@gmail.com>
Cc: Guillaume Nault <gnault@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-ppp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025 at 9:00=E2=80=AFPM Qingfang Deng <dqfext@gmail.com> wr=
ote:
>
> On Fri, Jun 27, 2025 at 12:23=E2=80=AFAM Guillaume Nault <gnault@redhat.c=
om> wrote:
> > That doesn't look right. Several PPP Rx features are stateful
> > (multilink, compression, etc.) and the current implementations
> > currently don't take any precaution when updating the shared states.
> >
> > For example, see how bsd_decompress() (in bsd_comp.c) updates db->*
> > fields all over the place. This db variable comes from ppp->rc_state,
> > which is passed as parameter of the ppp->rcomp->decompress() call in
> > ppp_decompress_frame().
> >
> > I think a lot of work would be needed before we could allow
> > ppp_do_recv() to run concurrently on the same struct ppp.
>
> Right. I think we can grab a write lock where it updates struct ppp.

tldr: network maintainers do not want rwlock back.

If you really care about concurrency, do not use rwlock, because it is
more expensive than a spinlock and very problematic.

Instead use RCU for readers, and spinlock for the parts needing exclusion.

Adding rwlock in network fast path is almost always a very bad choice.

Take a look at commit 0daf07e527095e6 for gory details.
