Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637D11A2389
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 20:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745441223; cv=none; b=bRxVW4LovCSBHb7Pqed/UdLeuy2CrHmfMZwtrM4aFPtYtWvOIGqFwrshrKo5gaxs/cnShm3k937u+EsrCy9Kc82Ia7d6hy+a1enXRQ5LbzypOtyMLTXRvwNbAZoWLDlVTQpIWE0bimo/KAn9RMtkazyckVmtmGPQ/7ZJCsfB41E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745441223; c=relaxed/simple;
	bh=snhV2XiNpG4U8XzST8X2IiBFztNuEg7ofnejtq0sGFA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MttVntIkIzAZ5GgWDiC6KNChMMbOVxPbKq0nx9C8r6XSunVTB3Ks7hmr9wWiHv0e32kuBBoEZAuB0zarv4g0vJSL+dCgNdhpVcVlz4x/vHOkywNJRkMDhMHKk7zcoDuMFe9ZOCR2mzeeDX0D4Wmc5A0waKQazAKF7MpheQy5AD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QTdCQmA6; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QTdCQmA6"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43ef83a6bfaso6095e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745441219; x=1746046019; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EFkS/yyfa25uyiibdv8tLizNMHglHTEPA9b7aVCxr88=;
        b=QTdCQmA6gPv5PbQRZk8hIpPeRjR+gv7Vehhb125d+mrcOFBbYNW/NuP9Wp9dxvoFha
         ctw72j0tY0kKcCFwVKQifwYaksLGmg47KogCgClsk/1DfZxEnaLKRghFzgMsQc9oesAb
         2fnDm6JOu6gettKrb+JADv7EropPNYoX4mg6HFCPPdZ70Dz73edWHKKV12s7fPe9ss2C
         xahWfoc/mSuekrdLRQ45uZFkMFecGfo+EOQG8XdlLP1yRtZ3mRdd2MS2rInThXQm4NEU
         X+NoV1ajjYetfK63/9LDvlUAhdQgzrElD5uEW9tL2ajk+G2JooHEGSYBsOGuDWsXKXdE
         UIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745441219; x=1746046019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EFkS/yyfa25uyiibdv8tLizNMHglHTEPA9b7aVCxr88=;
        b=try3WktPzF9nziUA+XlSQZkFB3+Je8Gpwt80zu5ixzlu3V66Kd+x4CHtgLdJYORHSn
         eDOmrKS0dBlcrqj/4y17ErISorXXBp9XBVhVZsVhZA/Ef5XZMjXj2dHdTezbowaqxij9
         /qIHf9tFMvz6QZg9wNgXuqi3a8KJCts4lBmSDUTaP8nsUZhmBS0N85oGvR3JR8PldybQ
         yz1qz0rCzDVnUmFXqRloPNPkFbVPwr5g6W0J0eEEpuk/66YP0/TXA7ucLDaxiB5RxK/0
         RSW+aX6n35thu0RWXRdvUCNP5BvxkGvZZX5ggWx0GEfXa0B5fUgb/8yP+DIDojGbzmmf
         zmig==
X-Forwarded-Encrypted: i=1; AJvYcCUWO2hoz7tPIgY4ji2ZQeh1GqC0MjXwHrC5k/9+Jg4agFHAkBCY66zgfplkXgrhhFDJ09Gt3b5+Yv8wpgU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwh02mQoymFmcw0IuGpc8FfRALVSk6Be+/QTYNB/lQmH20sM9d
	OlahpW0vggxw85eHN0chkp7/c/VwP+zf4kEISYfl3dUZ+pbCIe10lazC4NJQkEsNUpntnXsp6vQ
	uqJRCFh0xmCoAJNouuiD4zfBIGYfs4AXX0FOn
X-Gm-Gg: ASbGncv2aDt6A/S3MAHcerZv0eDQ72VXYVXsVfyJaadaRsPTL416BkNbv5oP9PJsAke
	tL4/lSobbbLDJUECUw+CZMAwd1X5V8kIIhF1mwPJgZNYzW+UKpdrHVL9yc+7eb90gJwl0ZKarjO
	RbEVc5w4ywQOi4wk8vWeOzYG5f2mtMXQhaa1R1h7PQ8ZVcahAFnpOI
X-Google-Smtp-Source: AGHT+IGEAejb+q0eYprUhrjih1DfSbXp5RpbqXJTJQJ5gPUdM0VLt77TTPHPCf9I9+WeRUkPGH/szPwHF5TaK/eZhZ0=
X-Received: by 2002:a05:600c:1c29:b0:43d:169e:4d75 with SMTP id
 5b1f17b1804b1-4409bca45afmr122455e9.1.1745441219476; Wed, 23 Apr 2025
 13:46:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250418221254.112433-1-hramamurthy@google.com> <d3e40052-0d23-4f9e-87b1-4b71164cfa13@linux.dev>
In-Reply-To: <d3e40052-0d23-4f9e-87b1-4b71164cfa13@linux.dev>
From: Ziwei Xiao <ziweixiao@google.com>
Date: Wed, 23 Apr 2025 13:46:47 -0700
X-Gm-Features: ATxdqUF7GLWp2UyqWvifI0Ek-kzWh0WRuL_TLzs86Rr0wZt9m6nYIFIt3D6I-pI
Message-ID: <CAG-FcCN-a_v33_d_+qLSqVy+heACB5JcXtiBXP63Q1DyZU+5vw@mail.gmail.com>
Subject: Re: [PATCH net-next 0/6] gve: Add Rx HW timestamping support
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: Harshitha Ramamurthy <hramamurthy@google.com>, netdev@vger.kernel.org, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, jeroendb@google.com, 
	andrew+netdev@lunn.ch, willemb@google.com, pkaligineedi@google.com, 
	yyd@google.com, joshwash@google.com, shailend@google.com, linux@treblig.org, 
	thostet@google.com, jfraker@google.com, horms@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 3:13=E2=80=AFAM Vadim Fedorenko
<vadim.fedorenko@linux.dev> wrote:
>
> On 18/04/2025 23:12, Harshitha Ramamurthy wrote:
> > From: Ziwei Xiao <ziweixiao@google.com>
> >
> > This patch series add the support of Rx HW timestamping, which sends
> > adminq commands periodically to the device for clock synchronization wi=
th
> > the nic.
>
> It looks more like other PHC devices, but no PTP clock is exported. Do
> you plan to implement TX HW timestamps for this device later?
> Is it possible to use timecounter to provide proper PTP device on top of
> GVE?
Yes, the TX HW timestamps and PTP device work is undergoing. Those
would be sent out in separate patch series when they are ready.
>
> >
> > John Fraker (5):
> >    gve: Add device option for nic clock synchronization
> >    gve: Add adminq command to report nic timestamp.
> >    gve: Add rx hardware timestamp expansion
> >    gve: Add support for SIOC[GS]HWTSTAMP IOCTLs
> >    gve: Advertise support for rx hardware timestamping
> >
> > Kevin Yang (1):
> >    gve: Add initial gve_clock
> >
> >   drivers/net/ethernet/google/gve/Makefile      |   2 +-
> >   drivers/net/ethernet/google/gve/gve.h         |  14 +++
> >   drivers/net/ethernet/google/gve/gve_adminq.c  |  51 ++++++++-
> >   drivers/net/ethernet/google/gve/gve_adminq.h  |  26 +++++
> >   drivers/net/ethernet/google/gve/gve_clock.c   | 103 +++++++++++++++++=
+
> >   .../net/ethernet/google/gve/gve_desc_dqo.h    |   3 +-
> >   drivers/net/ethernet/google/gve/gve_ethtool.c |  23 +++-
> >   drivers/net/ethernet/google/gve/gve_main.c    |  47 ++++++++
> >   drivers/net/ethernet/google/gve/gve_rx_dqo.c  |  26 +++++
> >   9 files changed, 290 insertions(+), 5 deletions(-)
> >   create mode 100644 drivers/net/ethernet/google/gve/gve_clock.c
> >
>
