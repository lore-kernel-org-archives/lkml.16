Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54ECD21B9E2
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 09:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747386150; cv=none; b=O/UIzfT2W0xPtvwutpkUh+izZmDSy7Odd8JiA4KM/gaid1zhStSogkVQHJSjSbMvMUGVGapSAHlHTMzxvY+aWMVbcIYQRJRJ1fhGEwmo7Qk441qNK51TTkvD5DPQ4UCm47p0ABqh6jL6FTxCepNcT9CLcAciqW3WfnZay+t/gMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747386150; c=relaxed/simple;
	bh=ToaiqUQC7wPPT5md+Z2ox6pr7GllCWLM1JPpGSY8rRQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KtU7tqWl0hS8yxrQvWsfU7YrgKeQB8WXfZNSEbNGZePMPCGAGtX8xgqoGE9SSXX/jKxE2vjhILfj+j46P8IXpfRSIdTu+RmCNXP/aD5XOmTNY8rN9P9xREVGxyipZmV0ujxYl60/hZV47U/E7MBo0LDsSBE9LgJGOkRY70mO8Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0CfjQ+CV; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0CfjQ+CV"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-47ae894e9b7so35383571cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 02:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747386148; x=1747990948; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=in60ugGemjVltqB0vsq8GkvN3HfzICH3JQbCmYrTXHA=;
        b=0CfjQ+CVeZIrR3erYCAkt48d9ZGpgJ/5566vyjp7Ki2o6DWgyrw6zSOSFT/tdv3DqT
         XBHfN4QSXYiF3fna8nRYuhc3S83KlMbpIkhfuMxEBk4JcALsUlqaYNvPWzqEVbdNkdcF
         nH3Eo6wI0BTXxyC6cww4h785FP0qqeL4E1A3vlpOeLceQtpfwjtSVc7QQ2O0bbr4mlri
         bwq4KZDWLg3wFPzDHlpSnY87Dd2i1/lEfr4P8hxaYwsjOx0biXCwc9dIbxLTnxHJMGZl
         //2vtFL9ozypqt64uoKkzhnZMdpcL90IbJDyzb3jLMEUG1lU1vdYrEIc6WZ+rZSSZ96D
         NiUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747386148; x=1747990948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=in60ugGemjVltqB0vsq8GkvN3HfzICH3JQbCmYrTXHA=;
        b=xAFhc3Lg7oi3q7dF/Ke6CQ/Vuk8DuiTXrx/T6+njoHCtnnOGHvshuxBdofGsqCDCKY
         ehygg9hiO+/HlcLJ5hfUVIU/4qYNPBpAG+Swpf/jGkVk7OnIAY+b729KVia6tlfuRP8o
         wH5LDBXI4blCd1wad4+G3aWgHuJTSA64MZ+TrnatdvM0jZpa/gNVdnicJOONAeHUzDFQ
         s87JtFO5LLkximkUeq4GNciiIMFCSAAqmTkT+2p9Ktc7Wjymf7+U/Ge1s5ZY0062YGDI
         Iv3V76fEYHFq06HSPZagxUX/hRKQZTxPBgLadSwU43f6p0qd1eqTa9xpxUrLrNaWnoHt
         Yk/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXeSB9jRIMfQZI8UJg97VHezAO1s2EtKxJmJw/6xZAbfEWnO4s51yBR17lmcl7k71pVIJEQQGBwK5p5Iqs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6HR1rG/kKs9L7LKkV5ar984wECGNkrUHzbAlXvqg5kbgVLDSE
	fKT0Te+fOl02KYRu2jw8DDROpbX2YJCUpIPkaqlsjB5xa2dSII9BVKto58YA9tQoHvvkfvSwZ9j
	sKJeIZKpCxDDBdGy7q5k/nycyteriX/0zdYzQjQTn
X-Gm-Gg: ASbGncveZC5GqSzs2mvQNPTpj1aDwoAzKKaDrDv8dFSXwTwBeGV1aQc/GncGF/QtJhx
	NZ7FRB4GB61hhLdNJK+ijvzZPy/gOp04ZaXKFZ5TL9NyVOogcyNqiNUNfBe901LvL8bD0FlA7Jf
	e4wMJJJT05okXCwyhmpCS8ZbHAVMKFmIPTpz+uWrllDw==
X-Google-Smtp-Source: AGHT+IFKFpZ4mx7Ab6FBiCu2VumXKtdpAlGDqqg8Aj8q1gzbtDvdx2Ql++WSEromWm41RhpIINOkMLSPD9lHuaS6/qU=
X-Received: by 2002:a05:622a:986:b0:48d:7c95:4878 with SMTP id
 d75a77b69052e-494b07f782bmr30946581cf.29.1747386147888; Fri, 16 May 2025
 02:02:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509104755.46464-1-ayberkdemir@gmail.com> <20250516084334.2463-1-ayberkdemir@gmail.com>
In-Reply-To: <20250516084334.2463-1-ayberkdemir@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 16 May 2025 02:02:16 -0700
X-Gm-Features: AX0GCFvBaGcVFtA7dJExvGgGKSE3KqWHsolC66wfst2hICjQRgoMunWZPUzYXDk
Message-ID: <CANn89iJ9iAP0GXk_qmzu+2MjWHi_NDOjG1QdLAiY1YSj+RjZQw@mail.gmail.com>
Subject: Re: [PATCH net v4] net: axienet: safely drop oversized RX frames
To: Can Ayberk Demir <ayberkdemir@gmail.com>
Cc: netdev@vger.kernel.org, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Michal Simek <michal.simek@amd.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Suraj Gupta <suraj.gupta2@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 1:44=E2=80=AFAM Can Ayberk Demir <ayberkdemir@gmail=
.com> wrote:
>
> From: Can Ayberk DEMIR <ayberkdemir@gmail.com>
>
> In AXI Ethernet (axienet) driver, receiving an Ethernet frame larger
> than the allocated skb buffer may cause memory corruption or kernel panic=
,
> especially when the interface MTU is small and a jumbo frame is received.
>
> This bug was discovered during testing on a Kria K26 platform. When an
> oversized frame is received and `skb_put()` is called without checking
> the tailroom, the following kernel panic occurs:
>
>   skb_panic+0x58/0x5c
>   skb_put+0x90/0xb0
>   axienet_rx_poll+0x130/0x4ec
>   ...
>   Kernel panic - not syncing: Oops - BUG: Fatal exception in interrupt
>
> Fixes: 8a3b7a252dca ("drivers/net/ethernet/xilinx: added Xilinx AXI Ether=
net driver")
>
> Signed-off-by: Can Ayberk DEMIR <ayberkdemir@gmail.com>
> Tested-by: Suraj Gupta <suraj.gupta2@amd.com>
> ---
> Changes in v4:
> - Moved Fixes: tag before SOB as requested
> - Added Tested-by tag from Suraj Gupta
>
> Changes in v3:
> - Fixed 'ndev' undeclared error =E2=86=92 replaced with 'lp->ndev'
> - Added rx_dropped++ for statistics
> - Added Fixes: tag
>
> Changes in v2:
> - This patch addresses style issues pointed out in v1.
> ---
>  .../net/ethernet/xilinx/xilinx_axienet_main.c | 47 +++++++++++--------
>  1 file changed, 28 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/=
net/ethernet/xilinx/xilinx_axienet_main.c
> index 1b7a653c1f4e..7a12132e2b7c 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> @@ -1223,28 +1223,37 @@ static int axienet_rx_poll(struct napi_struct *na=
pi, int budget)
>                         dma_unmap_single(lp->dev, phys, lp->max_frm_size,
>                                          DMA_FROM_DEVICE);
>
> -                       skb_put(skb, length);
> -                       skb->protocol =3D eth_type_trans(skb, lp->ndev);
> -                       /*skb_checksum_none_assert(skb);*/
> -                       skb->ip_summed =3D CHECKSUM_NONE;
> -
> -                       /* if we're doing Rx csum offload, set it up */
> -                       if (lp->features & XAE_FEATURE_FULL_RX_CSUM) {
> -                               csumstatus =3D (cur_p->app2 &
> -                                             XAE_FULL_CSUM_STATUS_MASK) =
>> 3;
> -                               if (csumstatus =3D=3D XAE_IP_TCP_CSUM_VAL=
IDATED ||
> -                                   csumstatus =3D=3D XAE_IP_UDP_CSUM_VAL=
IDATED) {
> -                                       skb->ip_summed =3D CHECKSUM_UNNEC=
ESSARY;
> +                       if (unlikely(length > skb_tailroom(skb))) {

If really the NIC copied more data than allowed, we already have
corruption of kernel memory.

Dropping the packet here has undetermined behavior.

If the NIC only reports the big length but has not performed any DMA,
then the skb can be recycled.
No point freeing it, and re-allocate a new one.
