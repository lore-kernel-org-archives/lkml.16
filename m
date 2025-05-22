Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5157280B
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 00:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747873586; cv=none; b=QikyCGecboNUxMwWI4IAdtGawTkkp78Yltw1s51r5HckxWp2nS6fjaAPyvTn8pHpvDPT8lwTiYYtWqJ7edJVBEjZ2XOhZ0FKdFj5E6yYuAfdEJr5b5oE4wnBtfUE7l05UWFos1tIyglsBB++XJht4Q+g8i4luch+6WURrkco6Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747873586; c=relaxed/simple;
	bh=JZPENgY3sVCVlU+QpbzM62kARNFrclbyuo2cl98TSys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r4VQt4fHKTPZE/pNeGLzgn01e7yNIgWdqLyNiPV6OVdlqFBQZ/E73e3v86i5VMU/Oc4Kmtrmd3QrfvlWIRQttP4pR3v7WdkwLhqegB/QZWaf0+s8EBGHYUwEMcf0L0ojBmnWdZ7b7Uvevsez9S0SAWUXi/4cB3S9IH7Lyl8Wa30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=C6uM+GGO; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="C6uM+GGO"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3081fe5987eso6158925a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 17:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747873583; x=1748478383; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZnnxNDzGLL4EAgaeooXIkTZkz8tsZCrpLmChoMSiaWo=;
        b=C6uM+GGO+x/TpDXqN1YT7X1HwVT3AGBbbXs5AkM1cWovF4cHfYEVpf711PQY4z7zkg
         5tIFO4dAZVrGkOaYQdmjvr20eXCPO0eNmxAzO8VyJcO3R8bE7q1d3FEfk9VKfWWUASL+
         BqptgFWpmf7r861n6f0UXIiWUE2L/int+otxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747873583; x=1748478383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZnnxNDzGLL4EAgaeooXIkTZkz8tsZCrpLmChoMSiaWo=;
        b=Pi/izCH1YXz3w0acbES+rLRjAwEXdeU0NnnP3dnBV/TFMqXAo22aytkt7/Sr3UTo7E
         cwsy4hs9FL8dH1BWglThZX0Tdg8nGi/EheGmiBKJWLfoZizae7VPyz9DR2cjj/LiqkF7
         cKiwof+sJkWbvIILqgVB1wk5jqr/LWBc5JzTyvG2ujmJWe1ARnHlZxo7kHF060wgq2vl
         P9HK/BI5LcNzZ7dvOZZPIkHwmk+SV9IdGW1KsXC8llFG+V2zkZLKWMq7d+MpfJsAOgiU
         DN8aBI53eQc+1xHOnrQ/3i/ezfi4wljCwrouUAGkPio4rP0h3WR45FJI88zd5ZdNgliK
         LhlA==
X-Forwarded-Encrypted: i=1; AJvYcCXthcRNGomltjRyOz5ZuiJWUZiWAbEXZkg6ujma/ws8IvJ5z9O0LuYfLKAQtD6nVPSedWYWsWOXcc22quA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzL9CAj1vhHiHzLY4zf6AYg5rV7Qp6HLRAUzlgh2+j17vYLgTV
	AmfE7TMpdzyAOhMfIoe3wRFvHYZp9qRIgsQSI0PtZVg55gFCCITYEJ172Gs1CRoqM8Pz1cwzU7Z
	Qr24=
X-Gm-Gg: ASbGncubaHPp+RaQMNfT724Y9m6S9lYjG247HTsqkcArSEjb6H41toW8cX2sCpoLZRN
	cP76KqsvBdVOwI9zuIKhI1WvArMYVoRg6mkozRNV6HqdCDA9gOB40PBTE+9DU1r5/SyNwDC3q7n
	2ZOqv7GNOp/4d2u0aRSwvq3R/I2ao6+3fwly82rNlSQxH5AEN/NjvUid6iQ73lDEFwEgD4KJgSa
	DAY3wZkhzeG8VZGUrvvGNFOOrYqFq4swBkTw3AGj+Q448edwrq4kPj4IcSkvlsSrlxyeZiya13u
	vnssAy2AlY9PtYDNflzhgoz9unV/8xKSY/FJXO8TxBiT72U5OIeP9eB19WmHzCjEsaqGpGw+erE
	qcu3oY/sa7BweNWfHFjM=
X-Google-Smtp-Source: AGHT+IGkMHuiaK4bH0CCw27Za09GxRs8d1FrQajco41sQ6XjdLeYqz22XbYmqC1wnA92cFEouCrvIA==
X-Received: by 2002:a17:90b:52c8:b0:30e:382f:8b86 with SMTP id 98e67ed59e1d1-30e8312dc73mr38050809a91.15.1747873582699;
        Wed, 21 May 2025 17:26:22 -0700 (PDT)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com. [209.85.210.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365b2dcfsm4616636a91.1.2025.05.21.17.26.19
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 17:26:19 -0700 (PDT)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-742c9563fd9so3769083b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 17:26:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVFEE6ZagpJefVXuDpzD9xGROerlXazGYRLu+/H1aAmh2IfZXi66g/wrNrOavhtc0XnSTPrk0NuuWJlbcw=@vger.kernel.org
X-Received: by 2002:a17:902:f551:b0:227:eb61:34b8 with SMTP id
 d9443c01a7336-231de31b3e6mr330148535ad.25.1747873578766; Wed, 21 May 2025
 17:26:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521093743.1057466-1-yelangyan@huaqin.corp-partner.google.com>
In-Reply-To: <20250521093743.1057466-1-yelangyan@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 21 May 2025 17:26:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Ue1Ls5uHa=G1DyHR8=CotX6uBv0F+i3G+Q_xpmjvntrw@mail.gmail.com>
X-Gm-Features: AX0GCFvCX0RHV3nzaytu3yvrAd4FCZixts9UYZ5fQgUj79qJmywvYBLYC03hDjA
Message-ID: <CAD=FV=Ue1Ls5uHa=G1DyHR8=CotX6uBv0F+i3G+Q_xpmjvntrw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add KDC KD116N3730A05
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, May 21, 2025 at 2:37=E2=80=AFAM Langyan Ye
<yelangyan@huaqin.corp-partner.google.com> wrote:
>
> Add support for the KDC KD116N3730A05, pleace the EDID here for
> subsequent reference.
>
> 00 ff ff ff ff ff ff 00 2c 83 20 12 00 00 00 00
> 30 22 01 04 95 1a 0e 78 03 3a 75 9b 5d 5b 96 28
> 19 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 09 1e 56 dc 50 00 28 30 30 20
> 36 00 00 90 10 00 00 1a 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 fe
> 00 4b 44 31 31 36 4e 33 37 33 30 41 30 35 00 e2
>
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[1/1] drm/panel-edp: Add KDC KD116N3730A05
      commit: a3436f63aa4f93b043a970cc72a196a501191ecc
