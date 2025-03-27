Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C9B41C85;
	Thu, 27 Mar 2025 16:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743092115; cv=none; b=ty/gB4eJVCO9WItCZ6KI4E4ov2XZCo3QgP3GSJL7xTDB3zAQpEauz2ppZXVHkOp1FW99N2BgL+2g+djs7jkHYuGqEbSCBrLNNmOlofBxhOcVXcnN9hqBO7rV2c7M26GmuWXBPIznPj+i0D/6PAwBxqvmeWLxJhzLQAvFvzhXm7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743092115; c=relaxed/simple;
	bh=PBjMIPbm34YhMtcHEbuTRJblo1v587ku20drBHEc6xE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aBXfV8pi5ve+b+ao/C8GQTA4EuHc2aQN3cQHBXK/RB+w/AZGayRSUX3HR3vXY5C5mDV/TUQFEsyn+AlcmaM9sFtr6x3Nj/wJUhFUkiHJRNTUCtbsESvSxQUL+zmMDC3MD2XEt41rDDPisdCNpHhFB5BrSUjDaEpRHQwTpHK2reU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dm1Q/8/Q; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dm1Q/8/Q"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3014ae35534so1701317a91.0;
        Thu, 27 Mar 2025 09:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743092113; x=1743696913; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PBjMIPbm34YhMtcHEbuTRJblo1v587ku20drBHEc6xE=;
        b=Dm1Q/8/QWsBU6hU5k9gnpnQMZkx98SMdBsRyKncmC5zPjl945JdNVjOIpDwDy6uUE5
         ooMLo/h+DtaDCAWmbPwn5lOUhiXX/9JOpuCEiQVUQH0oJUhgUJRREN9OhiZmz+Uzy0xa
         4XC2b0UV1Kb0+qql3rdhJu++dJ8VoNQ05kFp6jyk0Q4pQ+NlzlEWTRD7XV1ZmiN6u+Qy
         fSM4+it0q7vR/RE+pDZk5ENWZbm/jt+juyYb4A7kRhjF7wivdkJ89IP+YV+blLsUV5L2
         UUN0fWkxodiBxZNSK1Z+S5Gs/z3Pz2frV6cm4DnVrHkAxaFBbvUPFDZtYn1u9bvjmqVL
         Fgtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743092113; x=1743696913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PBjMIPbm34YhMtcHEbuTRJblo1v587ku20drBHEc6xE=;
        b=kWRWPnuVhdDhpi0egdvAEpVin4wrpLsxJKaDsltVGhGK8n6bATnSqduvsxuoi+mBBX
         y2kW0x9Hf5jXq5oXKCBpQEPaXZ5o9P0KbABlNk0vzm714j7STQJ1TQZIkHO0wA1cTe+G
         o65JPSyKtFLKrb+arA9Kt2hgl6s1rikdF5qX+3D7N5ErNBwnoayh2yLk2Aa3j35Fo6yp
         6/PDTHXEcw1vvKn4paPh/4ABcEIieLjZVlAp3QiPp2jhZ8dt/AsGsj1mXNLd0Xm57Zgc
         N/OvhzDT34Wkx/euy0zvZYBjp9w22ytPFrLt2wsuxdNEVWhoaRDtWFfn3V3pogKv/aDj
         UKlg==
X-Forwarded-Encrypted: i=1; AJvYcCU64HXfXOyK3vVW+tn6Xwf2q2DRVisXMNjmwWkTgsJC5QDuj90ydmaLUGl8xBF8/3QP8FQdvVlcPQ5I@vger.kernel.org, AJvYcCUy4mm0iYbrHPkqZcE6byZ8++mD/V0QufVwxpg9xjaoL2ih3q+5lh3poNZaMDhRlXnQlaSh8aDRkHZcs1Ew@vger.kernel.org
X-Gm-Message-State: AOJu0YzUrhBkshMOc6I7xRHGJ6xii/uNkkv/9lkNLL1l/8mZVe3SlciV
	5sYH4FRT0f38+aiE/l5Lv0AkoQfi0wLiat3GC2YeL5V+JMfjLETFbj/y5rDMAj+UXjOYT+WxoIw
	t7vqerJXcIQxT3dOHFC5qfswGTyY=
X-Gm-Gg: ASbGncuqNN4vqX9pZ2LFnqnaEPOcgQeL7x0wka/fghDQ4xD/k+Xfr+NOFWdKTx3cG/a
	lgoMWL2w5rnW/9gV0uyAU9GqvMvesB4BKbIVvsPRtuHNgesNUh0L8nR4qBKcvQdnHeypCAQ8iqQ
	v4X3I3PJVU0RCx94SuOu9k/ag=
X-Google-Smtp-Source: AGHT+IGxfLnA21DnRIbYYx8S6PoJ4aTz0uiokeIMBWjywJxr9DzgkdlxVh3T7ZtOpKy2EtNnbCJT4rNDAaVAjO4mHv8=
X-Received: by 2002:a17:90b:4c05:b0:2ee:9b09:7d3d with SMTP id
 98e67ed59e1d1-303a81651bcmr5489458a91.19.1743092113156; Thu, 27 Mar 2025
 09:15:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326215214.1706887-1-Frank.Li@nxp.com>
In-Reply-To: <20250326215214.1706887-1-Frank.Li@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 27 Mar 2025 18:16:41 +0200
X-Gm-Features: AQ5f1JqSne5RAICGf_1pTfxM4Me80uo-4iPsnpzylek8szz9S9jRRSHS2H44qaY
Message-ID: <CAEnQRZD+OUSuysUBmReO0kwdZ61oDucXF7nNAuCYArxk0sRUwg@mail.gmail.com>
Subject: Re: [PATCH 1/1] arm64: dts: imx8qm-mek: consolidate reserved-memory
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2025 at 11:52=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:
>
> Move dsp_vdev* to under existed reserved-memory node to consolidate all
> reserved-memory together.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
