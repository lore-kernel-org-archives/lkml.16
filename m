Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD34205AD7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 09:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743585861; cv=none; b=gx+LFyUtXn/f30IhYPeqRU/utFLKUi3BOENm3S/mtJEN22KXyg2z4eaKx3dDhhbnR3ZK2jfrpPSq+Haj4NgmE9Nr+yzidnlU/RBB6xGVmNllcMot3+Zjdgmrsh/Nwyh4MCwnHkV2PJp2c6Ye5SI+QMcumxvo2CY6kRlYJxS+NAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743585861; c=relaxed/simple;
	bh=Rl/Qf4SUmk2urImNh86E9uj8E/MvEVph2O9udL2ugf0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WWNssLNprBVJ8XKawFPmrSvBhuJYcsBkXDCOT6/VrX48ajsrch80PicVZjgBYOh3HeHCCq+VXK/o/o7UPBwdLbFBUKIK9+4NHqz65Tj1/IO1KfVZpNd1iVM6rOH8pHaG4ZPmU4Mi+CR+AUo2g7qOfNZk66DKDl+4PbcXnTtJmZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EM3xpAyC; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EM3xpAyC"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54acc04516fso6174854e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 02:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743585856; x=1744190656; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rl/Qf4SUmk2urImNh86E9uj8E/MvEVph2O9udL2ugf0=;
        b=EM3xpAyCZ4uyb/ZQVKyb0kD9kfJ2x2uKaLzycB3JP7nK4l40HUdiCLKAPniNq9TzVk
         CSo3uhnd0kr99eeX3q/TWiEAVxQhH9RHE6yBEbh2d+xjtxGo5VDoUgou588ZHuliSb4W
         S451Lzxqj3CJzCA5c7KO5RDneIO1RbILywZ+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743585856; x=1744190656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rl/Qf4SUmk2urImNh86E9uj8E/MvEVph2O9udL2ugf0=;
        b=CKoSH6Ogvgpmw8AEzKO+61iIFsiozvxAfmGhTTgYbCDlqSTN3hckdCnMEJXnLE8QMd
         TSF7esJW4p+uZAreo+HYYScxFDWcOKwPcSDr+bZ4r/3ID60uG6M54bpiQn/Z6yJRl51l
         RMeJmYJj13arTFX11owX0sJ2OtDTFBQuW3AsxgmmMmxoPkvqmv9YYW/dVf01PGqextcw
         LS1xBBbn8D/NNUI3mFqDEfofQI0oMmnZ20O9GuEvghTXm725SzK7VYTUwo9psMA0AMtm
         IR+cql4/oi4OKNL5jkT63aKu+7DT62cLUcfLQPX2oSPkWN+AtcSPYl6Ci7mJVQM9CKDg
         /m7A==
X-Forwarded-Encrypted: i=1; AJvYcCXB5EkZ7zE5ft0/8t6ni2siOO8YG6cUu8UBbeOKpLB1i0P9+bYjNeaTw+SGVUsz7CC8JBFJI4J5Mn/Xlro=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqclvHX532A1Ni2FWgmluKQLhCLSbgawQD/Gnx2ndfBkcBW1KK
	okX04YErfXkQ/u24T6nIfAndcDQP0rapNwKii0YrvL9U4Dnun5QcpKJUtml0jKV8KqudWgdy/pW
	q05cVYTmNB6yVJtdJkPn60mQmbwj9Ds5HYRzh
X-Gm-Gg: ASbGncv5Qy+EWGd+ZagDw3jvW6mUqXtQUGlSdfttS/TiOoTg3p9aYPVi166lqpad6N0
	OApUhoDVEQb6lzdEVjNSyrfzODzB6uwfwhO9gHZhuWDCcjOmxnm5+pb4a21ZvpCBLMxB2vCxXjx
	RDW328sld4bS185rkAZLFsaU/LY8e35w/llvnYMBtI0FwrDss114q0
X-Google-Smtp-Source: AGHT+IGw+YGuv8ErLPgxlPKM2b09XhB/ltk6uSyNLvkfiPfwDz8v+Y/E4L1VGtq26j3qk9kLU4E2MeK3y1Gu6VR/5FA=
X-Received: by 2002:a05:6512:2341:b0:545:8a1:536e with SMTP id
 2adb3069b0e04-54b10dba30emr3831169e87.6.1743585856527; Wed, 02 Apr 2025
 02:24:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402090615.25871-1-angelogioacchino.delregno@collabora.com> <20250402090615.25871-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250402090615.25871-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 2 Apr 2025 17:24:05 +0800
X-Gm-Features: AQ5f1JoCbqqAMlKuOxFWbpG8BuhCzvYJb5XMq2RSYRHsot0By3jXZZ1xVJeT03U
Message-ID: <CAGXv+5GuUm0LMphTMvV-A9zebOfyb1sAG+QyQ0jhrF7TV5M48w@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] arm64: dts: mediatek: mt8195: Reparent vdec1/2 and
 venc1 power domains
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, weiyi.lu@mediatek.com, 
	tinghan.shen@mediatek.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 5:11=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> By hardware, the first and second core of the video decoder IP
> need the VDEC_SOC to be powered up in order to be able to be
> accessed (both internally, by firmware, and externally, by the
> kernel).
> Similarly, for the video encoder IP, the second core needs the
> first core to be powered up in order to be accessible.
>
> Fix that by reparenting the VDEC1/2 power domains to be children
> of VDEC0 (VDEC_SOC), and the VENC1 to be a child of VENC0.
>
> Fixes: 2b515194bf0c ("arm64: dts: mt8195: Add power domains controller")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Changes look correct. Would need MediaTek to confirm whether the power
domain hierarchy matches what is claimed here.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
