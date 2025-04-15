Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9042798FA
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 07:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744703160; cv=none; b=sG1qFfcUT2RSruiBQESUoOpxOHPzMgRJ0Y6DL+YOyZb1AmtptDpcphovt7mkW5se2zXt1H44R7+69xePxmuU3G8Y8dQsChyiheT3qKc2Tay6C0y4nTRn0oEsrVbP1Ivm2BnZ9rz4E4yqOeAXgbecUEEO2/gkLfR/VorNrkM4qOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744703160; c=relaxed/simple;
	bh=M+gAob39nS5ihi78nDHJOLc9y+ZJq108PESH1zUJ2uU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NR79PWD/k6IE0jfjxktt7Ysag2X49J+MIbT4jRpO/6B1+1jEhq719uraGPSuuU6QAOVxZRLwjv33o53PPJezPinXBN3lQzPYTQEywONfGrmoUqK7ZNwbte72VsWtXjWOiWJ9rNfAtI2H0SvrxK+7WqiC6Io+m+/6DlnaJtIEsMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RZDqylIl; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RZDqylIl"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54b0d638e86so6095605e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 00:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744703156; x=1745307956; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M+gAob39nS5ihi78nDHJOLc9y+ZJq108PESH1zUJ2uU=;
        b=RZDqylIlZXJoUVTaghOc1+OwiEUCyMTIrA9r43a42X8hrVy0+aIontnsAB2jUIG14X
         WiA6pSri7TdnG8NtAbUK6Q/yS9MOquNBkYL5VOfcAORnz1gv0WaCHddcf/8sPQWYnd/H
         Cut7DCyb6i2HinLXitaI4StYo6bo24MEc5nPfQfz+ofKvV9E9cY8vdr4lxBmx1pTrR5G
         ACGU8YWTqgO3Ah8GMLm71KyM6cqtCWWvCorr7rbBVBWLXyJya9LDEGqUTWRdGT7n1EyR
         Gcu+H8IDd6M2Hg3iw1D2X4Qf13lf3Sx/FAA1OGAFjmsq7YJki+gFL1pemgFUdH5qBClj
         +H4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744703156; x=1745307956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M+gAob39nS5ihi78nDHJOLc9y+ZJq108PESH1zUJ2uU=;
        b=tfyEaTMORBYjgLIa85Yzfb58dYxyiZeO9EdhhiM56QDWiIo7HzGpt37A3+OYqHqdI+
         IH9O/OKViveCQLb6975hqPwJGGTllB8Ps3WN+VWR/+lIId/3SfS3N2yPDEvlPmcLOQ0A
         Uq9SDBHg3KaV54RwSby3uhznhzlf5MdULk38s7A+Ko22qeVJX6r7O4is+Kbhxu70X5J/
         33vfWsiAah1Fa11bZFFE+BgUMPv6NGBd6nwNL2T0acgjH1hpsx30jmZUrqB6gRLbDF/3
         sk8SigozZFz2D0cDJrYFlXRfQQNCsT6v4AUknrQmR+UIX845sOzLMBXNpYcdQ4cdSntV
         s2DA==
X-Forwarded-Encrypted: i=1; AJvYcCUcHatYDiT3x0i37N30IvGeVdkfW7DzCwsuDIKPHgFyRf3/So4E37s6eIYo2esCyjKWlQPlqqnNqko6L1Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRNlri1p9TWataCDGEdMODMLapH6pIJ12Pn1f63ZPe4CCfXMyI
	o7mS0ZFwTculvvgOeWbtcqw2s7Am+l6KTpm3lttskvJ4u7GmoiSCBnUXH6fz6iSgwLJJW1yR1nm
	2voPGf42RZnQfe/M/t2M13H9k/8GN0uXa9C/owQ==
X-Gm-Gg: ASbGncsaha4wW+FCKTOn7Ipi4ghsHTTLds/jekMhKEmd09DgqF+9BsTp5p295wybfx8
	Xf4Dza3ZiqcMOoKmhURuRC7hogT1Ueqg5O+aPRtbf3l/9xC7Yz1mkm1PDjHm/T4nBHT/EUVlFFo
	7EK6IFdHce1Ign0KUaPsBTEw==
X-Google-Smtp-Source: AGHT+IFwAAfaAAzhBH2j7GeY25vZiQ/zwPAChqOV+UPITlwOewIZwKKaiN+msHLAb3VJXQqUL+3/Bv4el3h6PxyLHRE=
X-Received: by 2002:a2e:ab0c:0:b0:30b:edfc:5d8a with SMTP id
 38308e7fff4ca-31049509fd6mr47883131fa.0.1744703156150; Tue, 15 Apr 2025
 00:45:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250329024533.5279-1-ot_chhao.chang@mediatek.com>
In-Reply-To: <20250329024533.5279-1-ot_chhao.chang@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 09:45:45 +0200
X-Gm-Features: ATxdqUH5lAyNEtt8NGqYFFPuzudR5N372Pir1OcHVfPuTb8kB94RThH28hJgscw
Message-ID: <CACRpkdajcn9XCy1L=EKEodTQRnaWqe3zdD4+dmt7rBoKS_n=Bw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: Fix the invalid conditions
To: Hao Chang <ot_chhao.chang@mediatek.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, Axe Yang <axe.yang@mediatek.com>, 
	Qingliang Li <qingliang.li@mediatek.com>, Hanks Chen <hanks.chen@mediatek.com>, 
	Chunhui Li <chunhui.li@mediatek.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 29, 2025 at 3:45=E2=80=AFAM Hao Chang <ot_chhao.chang@mediatek.=
com> wrote:

> The variable count_reg_names is defined as an int type and cannot be
> directly compared to an unsigned int. To resolve this issue,
> first verify the correctness of count_reg_names.
>
> https://lore.kernel.org/all/5ae93d42e4c4e70fb33bf35dcc37caebf324c8d3.came=
l@mediatek.com/T/
> Signed-off-by: Hao Chang <ot_chhao.chang@mediatek.com>
> Signed-off-by: Qingliang Li <qingliang.li@mediatek.com>

Patch applied as nonurgent fix.

Yours,
Linus Walleij
