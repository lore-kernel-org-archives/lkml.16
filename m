Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBEB218EBF
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 23:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748389613; cv=none; b=h7Q3DDocsLRCJ9wK9HUSuNOLb0jh9WNjZyn/bMUExSrdLuxB0A5vvdvAycS5b0HQdL3Lns0C68SoQ6irQZpkWkapDmYMb9f2tCu72V6SG2ScsP6dYzNja9hPeUqUaWAIm6XIfuOhHLQcLCw/pNQyDvmUgEzTXhjt3EpCY15Y3gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748389613; c=relaxed/simple;
	bh=WKcX2GjjarLw7YZjkROB1mJZ0w5M0D7LiFn1aBDa1zo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g9DqFRHBILH3xp25J/qvTIhVDw5jUs2GyhIm6E3cGAxtBCvItK0gNwY4Pgi1JLUD7dMzSU95UxiVKcvaD9qmBVL/pM0PNwzTWcjPvXuBwIhqfaDafwyyo8c+eNK6uIKd6ebMMVT+XqjVQGrYZnW5jEYpS6lziPNF0vdy4dSzh6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vJyGp2LD; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vJyGp2LD"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2349068ebc7so101535ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 16:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748389612; x=1748994412; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VghbsdFVO3iyQV5woos45bPNqNZDe5XkDtH9YacJi2g=;
        b=vJyGp2LDoULMeslodgMCkKrXBBhbaxCLTxtFxjoe/bA9Zv/8yvYAQuPm8122PiDnIF
         wdylvL3No06kOxZRvdZbozV03i8RrkMlZJURJlPRyL/xDhfZp8i7POMzhzo//sA6F49v
         xWwQBHhiB3TV5l+qwnmKtF0+DCxEA0BX+NCJ3zZtAGbgNrFTuiCz/Ch5z0ZrxU4U0i1W
         9smqRENtm+EZ11COm9ReRwPvil17pCBXGc+7bmLomWUW20rT8BEokvjN7ECe4gcqiKaM
         SgHD10ETdOYTu6ljXNXrhhWFqPb55k9vNUjkPiIZ1wh/FSBJOEV5u9Qs0el/k1sRT3qL
         WvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748389612; x=1748994412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VghbsdFVO3iyQV5woos45bPNqNZDe5XkDtH9YacJi2g=;
        b=WINMlmE8Hy2DFVQP5gvT8pNHPOZ0daAvzDLmEAKmsoOQPATh7dqFqf0jBIhrRD4oIx
         3P7v6MJImgQXabUpW+UWo1QcP51wz14MfShwINUacpbjUlq/1zeBC0We2LTFqUy4X2FE
         yJhElSq3oatSzzal5mxihP61wUUP4bPLRmmR+bpnmTdpp1z8S7qMUGjJKVm/902hxHcP
         Qgn5+yh19Eu1qHN2L/+lR7KS7DO4c8KQ6GBGUbZsJPwSramQ40QHDfYCGIMFy0DC/nEA
         BX4RS3cuc+TQEPTO7Kx96FLTuLhiVIYfHgbRl1mRb0Nmu9gUcoz4pUYgJFwE83ON/sCG
         Tpbw==
X-Forwarded-Encrypted: i=1; AJvYcCUIyyIAJaooZwTPfW9fOvlkDHFML9QFKOSXtZcOudKpQRazOe/vwEMToqtUe27Z6JsQ7wrRRrDq2AtVn1I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZpOo0DxmK8QiC1Qmqe6FtXimCddSThOfe2sloJ8otKx7hHm16
	hIb8o/TpGbKYlOwVk4iZsCBUxXDuqdJdBN2p5pZIpjK/0bMUN80gb5SDEzhYHLI7bAbv9LJDUB3
	J86CsyElKp3kvId2YLIjw0paLHDtZZllkbEimjWlM
X-Gm-Gg: ASbGncs0S4/WjhlSJV9lbgPl2fiRhEbBy2gW41e5GnLZIw+tfeMiB59OUVE9J2lRtsc
	I/1mqA0Dy1S7amSmb0fiRnejRzQrA6oj6C2+R/Yk2n5V/SIipylGVARh7S2VkgGToHlRWKjtRBZ
	yqaLfkKRxZ71NUqxn+hbW7uunevBY2y2N79+QgSytNdfUXk0i14hICo2tMJv9E6rDoSWvPMcH2V
	8KlUk1BKe21
X-Google-Smtp-Source: AGHT+IFhVvQBS2s72jadYmZiV/4h4fh2gLaYB8UmxGcpXTK6Oa8dyDrO/A8UAzbuwGSFKflOIeEMssY6jTFGnCAgx0U=
X-Received: by 2002:a17:902:cf12:b0:231:f3a3:17c6 with SMTP id
 d9443c01a7336-234c55ab59fmr1383225ad.20.1748389611470; Tue, 27 May 2025
 16:46:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527130830.1812903-1-alok.a.tiwari@oracle.com>
In-Reply-To: <20250527130830.1812903-1-alok.a.tiwari@oracle.com>
From: Harshitha Ramamurthy <hramamurthy@google.com>
Date: Tue, 27 May 2025 16:46:39 -0700
X-Gm-Features: AX0GCFvYovlr20SM8ijf0L9FsoJRDmqYdfr78B7dTpS3CyYkJAMfh-_9uNOXneM
Message-ID: <CAEAWyHfES0EepFr7Bm+BO6KXw1rNy9_7zv+Jk+rJadkGvdYgqg@mail.gmail.com>
Subject: Re: [PATCH] gve: Fix RX_BUFFERS_POSTED stat to report per-queue fill_cnt
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: ziweixiao@google.com, joshwash@google.com, willemb@google.com, 
	pkaligineedi@google.com, pabeni@redhat.com, kuba@kernel.org, 
	jeroendb@google.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	darren.kenny@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 6:08=E2=80=AFAM Alok Tiwari <alok.a.tiwari@oracle.c=
om> wrote:
>
> Previously, the RX_BUFFERS_POSTED stat incorrectly reported the
> fill_cnt from RX queue 0 for all queues, resulting in inaccurate
> per-queue statistics.
> Fix this by correctly indexing priv->rx[idx].fill_cnt for each RX queue.
>
> Fixes: 24aeb56f2d38 ("gve: Add Gvnic stats AQ command and ethtool show/se=
t-priv-flags.")
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> ---
>  drivers/net/ethernet/google/gve/gve_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch looks okay, but it needs to be prefixed with [PATCH net] since
it's a fix.

Thanks,
Harshitha
>
> diff --git a/drivers/net/ethernet/google/gve/gve_main.c b/drivers/net/eth=
ernet/google/gve/gve_main.c
> index c3791cf23c87..d561d45021a5 100644
> --- a/drivers/net/ethernet/google/gve/gve_main.c
> +++ b/drivers/net/ethernet/google/gve/gve_main.c
> @@ -2153,7 +2153,7 @@ void gve_handle_report_stats(struct gve_priv *priv)
>                         };
>                         stats[stats_idx++] =3D (struct stats) {
>                                 .stat_name =3D cpu_to_be32(RX_BUFFERS_POS=
TED),
> -                               .value =3D cpu_to_be64(priv->rx[0].fill_c=
nt),
> +                               .value =3D cpu_to_be64(priv->rx[idx].fill=
_cnt),
>                                 .queue_id =3D cpu_to_be32(idx),
>                         };
>                 }
> --
> 2.47.1
>
