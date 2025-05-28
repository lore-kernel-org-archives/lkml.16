Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B8C22A7FE
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 12:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748436121; cv=none; b=F+uBudugQ6catOC3Ql2XLEWphWf68brsPJdkmsbeT/9RTHOewElojVMzZsHhJnTp2MoN0QYP65gjE8faQK6KDsm7JFabgB9FogoVHlzXjil3f1HbKL8WVB0J1sPDvwYLvpKsYwuTDe9usxg9+o9NwYOxbT3nD+nFGryWnQo1Qmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748436121; c=relaxed/simple;
	bh=e+jFQtVLztT7fy8i+vQ3FDEM65+gupHcYCuDEGeztok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p4oYrx0YDz/QFBIRfXXqdhIbVEsfWZIZzyjb4+6NxZGHiZrejZez39gJCh7dT5/j4zzGmxSL49i0rrQVTUv7UAaKWyxVBQRBpBnqAK8Yhf7S9bPGHp5Cln5rY2rYbcJwdsyGnFLh6XIb98Zk8RamVfTvmfGwb+fIxIS9RtwG19M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eFvIem2H; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eFvIem2H"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5fbfdf7d353so5897245a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 05:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748436118; x=1749040918; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fcybqgDD5oDZApETTyhThYIrRhfcS6l0d/FaIxiSIYI=;
        b=eFvIem2HHTv9kwy6miqKaejKjdIoD2byd5u5t34tj8JoSodlVDoeFpnsP7sUiIoaBV
         4C7LF0prR3K23yPd5DUqY6P9IvsdFBuuQUsDHN7A5yde9OM3otf3l9h+2smPmR03Jtno
         4Xa6cy9cJhiVDO0ZHhFhLpGb67DIukfeJ31m8yE+tZAAt1QyyRRvH+8KExLfIQAdJ/v6
         xgjB161fld57KZJZFpaoF0Fu+d/waPkpfeSxKW4MRY53Zv1Rw+JgLgEADQW2b6sZ91xg
         5mKavAFcgq/YpJu+UF9ZnN+GIQmyxVFbMrFy6a8UxMSQOKK9dz0A4Liwrzcj/WiogkHT
         AMwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748436118; x=1749040918;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fcybqgDD5oDZApETTyhThYIrRhfcS6l0d/FaIxiSIYI=;
        b=GIFLW3DaHpVrC8HOqnir+mRpEhi9PzLgVZVxfVzl9T5hOfU4plQLYBTRZj6LU3Fx+8
         KcTQdXymVYHoLmet84iSO9Xar6zuTROz+OQHxbPV8QWqBZn0u7HuJfDSfvxcQQVOzy7q
         bm5LCayfb6uUOYacC979dfk9fcx2yj5SKLw1xL4y7OLKVHl5q8i6HsYUsWUrVR4N+Cz0
         6e7AnkfWJKj/Pd6oP5Hmef1uNydCu7Lw61ulqavy9bEuLXkbvAE+wdDWB4mVBYYm89L1
         0Gi5n584rk/5dasc1ED7KvQVH6ua9pVWAY/kvo55Iouf3wG31kpGXhL6RUm9BqFy/p4k
         KS/w==
X-Forwarded-Encrypted: i=1; AJvYcCXUf5MH9EhXQ3klm8NmJzf5w8C4oA/rSONCKTlR3ok0/FJ5HNmhvc7Wy1l+r4sWtwHugr4Sig0euc/MXaA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeaQq+NrAduKQ5UWFcXooPvwBFmeUWCpaT9ZEEiATqwk0g9Fb9
	GYIv4x20VP9QzjM//cjmpB79GA/7K9jQftGb5Al23ehU+r25wyfG8PbT
X-Gm-Gg: ASbGncun1FYf8BNvaGS0XTHGTbCDEm+nN0x3I2UANG4zejWj05u+HNHocDHmf+0U4Hc
	xOH7DP0n6twBAUMi7AXUa1rxvMTK9fdP3lcWtXkefWaNL4vfB+pw82B86os4/af0uVuNtXoEBC6
	w9clmbprn0krSnf88RNrgh7hqyIdRpi63DnTxxKsjLaLOIouRMVA2eHcMb243llEXPw+awRtDVF
	2vvhWdpgLT0E//Z8HTGF1ijny+3JYYmBK0ZMyapgbY/7QGCc9TpYRPzWL3BpTu/quas/ziHa32V
	F28XnM/yRBLqW9rCzXY/73QZWskwbwV398UUk5cBR3e54FAEua0KCfJDGF43ouiJESbb6qxtg90
	W1qnO/Zt1u8ZvFk1oyVVjRIKp1S/Smxzqa/AbaIOQK1j73xQjYhM=
X-Google-Smtp-Source: AGHT+IE3Rw4thyp1GWN412ZEdK69IMZD5DtxtrS1IfAeV52JV9OhYNh3EcnK3Cxlv7eNgKS/ZDA8kw==
X-Received: by 2002:a17:906:d7e8:b0:ad8:9b24:9d16 with SMTP id a640c23a62f3a-ad89b249d8emr334723566b.6.1748436117922;
        Wed, 28 May 2025 05:41:57 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad8a1b48b06sm100900566b.154.2025.05.28.05.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 05:41:57 -0700 (PDT)
Date: Wed, 28 May 2025 14:41:56 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: Doug Anderson <dianders@chromium.org>, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, 
	dri-devel@lists.freedesktop.org, tomi.valkeinen@ideasonboard.com, max.krummenacher@toradex.com, 
	jonas@kwiboo.se, jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	kieran.bingham+renesas@ideasonboard.com, linux-kernel@vger.kernel.org, max.oss.09@gmail.com, 
	devarsht@ti.com, dmitry.baryshkov@oss.qualcomm.com, ernest.vanhoecke@toradex.com
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort
 connector type
Message-ID: <7256zmyip7iaenbrcfvggnrsh7qvg7tcbfgr7htywpxqkhnggp@2jlfcqn7oaxb>
References: <20250508115433.449102-1-j-choudhary@ti.com>
 <mwh35anw57d6nvre3sguetzq3miu4kd43rokegvul7fk266lys@5h2euthpk7vq>
 <CAD=FV=U7XJZg4Vh4xMKEiAuaJHNA1H11SiD19KLBazPmMEVduw@mail.gmail.com>
 <0936a042-8ebe-42f7-b3eb-a4606120cc47@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0936a042-8ebe-42f7-b3eb-a4606120cc47@ti.com>

Hi Jayesh,

On Wed, May 28, 2025 at 05:48:56PM +0530, Jayesh Choudhary wrote:
> As per the bindings, I see that we should have "no-hpd" property in
> the device description for platforms with bad HPD or disconnected HPD.
> 
> Then we can read it in ti_sn65dsi86_probe() before resume call and use
> it as a conditional instead.
> Since I do not have any "bad HPD signal" board, I would need some
> help validating this on such boards from Ernest.

This sounds like a good approach to me, during my investigation I also
thought the "no-hpd" property should enter into the story.

I will gladly help with testing and will add a jumper to my board so I
can turn it into a bad/good HPD signal board.

Thanks for the efforts and kind regards,
Ernest
