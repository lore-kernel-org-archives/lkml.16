Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137F31F3BA9
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745610491; cv=none; b=jKGGNVPyi4cn1xAXR8WM83TEE2M2pCm45sb59ikXKKM7wMrnSsm67nX32Km60yqX4tDJgCST8UbZ3zFKBcPODiW0uIOJK1VddgQp6GZDnN4loXIpBU4UBmp8/rwPNHzHDVZbpI4t1fe8wMQCxiSiDpUowyOr2n9Ru8Wi1EA6GXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745610491; c=relaxed/simple;
	bh=kaVIw/22O1GCmj11mvIUi7tcAyAUdCPPBa6yErxA9LE=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=OHmyTo07HZVdTxulzjxoSy5D/xnQEEXRfxxnuUZIZNWZw05+kjUc59bG+8Pvxs00SK+ZLT5F8mxiSYx3FE63xWkmCemXqVb1fDidm7BYjNVtJy9AbLtP2fHpOI759btbSZn2xM42e7zqYmCsH/nf6DXWT1EiNyzwa7tLGl6Owbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=zaNIB0em; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="zaNIB0em"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39c0dfba946so1918621f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 12:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745610487; x=1746215287; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9MsSm/oC6fggdpvVcy29aPeLr5GjoL3t6EBPNylpw94=;
        b=zaNIB0emmBAYTHZYlCUPNyR/HctjwWcAWNDcqoZipMMNwfBSvSOGhr8U/oJ0u08o09
         3qX7zeGM4xJXIViu1Vq/5SCvAMq9taIimuX3DvT7O9wi/gsPjkCZhYm/M5DS8+3BVwZg
         aoZQWyXBRzZfSrthEElwS6edWu1CIZNcJrZZVVj8FAzy2OTo7NW9o9DRXkkhxaV/9NCX
         FICO7HWBxUvl65Sx2OSGhIiHEpxmX5JgiTy0VYdn4z+NJ+fr9TtIB9dYK7w8dPAB5AHa
         e2yx74oWq/XXSgVzp9ISibSHBp+8ix7ch2Rui684zGgf7J5BErSsMG5F7c/QvVn3exXH
         0beg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745610487; x=1746215287;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9MsSm/oC6fggdpvVcy29aPeLr5GjoL3t6EBPNylpw94=;
        b=Yo74nTksCJDsXoAf0oAYKS1y6OvpVxyp88j6IjHYnXhYnYhYnnz/uPeyLiPsfzqUFx
         oCrcUt1MaDcABJv73i9F4dAK99aVrletXlsZHx99Klhv6sFz2+CNSctGn4Q6UWspxDfi
         NAz3glNSvMSfq4G8bng6KHqKrARFtE7JAHiCxVgFfSxe/7v4rccaD+vcizt57NnTu5tt
         vu6RjmNFMjhKSH5FIj7EtdtDGcojRioGBvxWgz6+Mmkp0bGTMRwwYop5IY30VRzOd8oK
         ZYqxdMJrFxqa+OZhGPAdOML4+IKd8+m0qXbOZgIjIQhckD7rxbacJn9OkKWpPYVFujmB
         fS6w==
X-Forwarded-Encrypted: i=1; AJvYcCW686pDqx+BDTdkTFFHLtB2YNrdkx5dKBvskYilv/eqMGCdeiyb6tfkvT6iZGh5vPt9dyxs9O4KcLfwfqE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2HNvPOmf+jn4dtJwNfpMv3pEXLoFgufceBKP+2igskRybyKYO
	FwZeT/kxBP3cGdDQdwupo9Snn0Se/r6C99VPh4e7eF+pzi0XJ0L8UHoSBhuLIxg=
X-Gm-Gg: ASbGnctKJvdEworb8VM0IcDMMnSGTETLFgn4vkiKtxYGpcyoL4noNMYfuvA8YND1phi
	/c3ZThCKHVytTTJG6M2UH4KdGuJOD1176KN//QGVyg7pLrwKTDpaeeH8AVFuUPRsj5ecdZRT5rj
	V62EuDsx7xOz8rVCXrFSg4H7DlRk8wFPzJ6vYOu0PPyPswNGSKd6Z90S0W+TM2R/vGMp1iuooSU
	meFVXcbZyBXCe/WmpyQzG1hx53Mev+r9yGmCiPBYIFvkUyUUyjLwlMzOq84+ERCImmuIhqdyYiW
	uTi4oUNYXa7u9D9y1AIv5+m6m8e6KlWaUykZd+1lQDhpQwyTriJ21M9yqEl/+BAU2Fg3xPRnFZI
	yI3gL0SvxJ5ilgFaphXBYeSqopmdXQaTtEqKYycjrHb+1WJ+5e45SWMRdBeLWBEA=
X-Google-Smtp-Source: AGHT+IHfsn5wCKhwTa0J8zfuwB8lcJPWgRUEQdZlhyrj1mUqnBM8NKHg90Ct03YfbCjHwLs/15BqRw==
X-Received: by 2002:adf:e5c3:0:b0:39a:c467:a095 with SMTP id ffacd0b85a97d-3a07aa7545emr335807f8f.24.1745610486979;
        Fri, 25 Apr 2025 12:48:06 -0700 (PDT)
Received: from localhost (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2d8154sm66076505e9.30.2025.04.25.12.48.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 12:48:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Apr 2025 21:48:04 +0200
Message-Id: <D9FZ9U3AEXW4.1I12FX3YQ3JPW@fairphone.com>
To: "Ziqi Chen" <quic_ziqichen@quicinc.com>, <quic_cang@quicinc.com>,
 <bvanassche@acm.org>, <mani@kernel.org>, <beanhuo@micron.com>,
 <avri.altman@wdc.com>, <junwoo80.lee@samsung.com>,
 <martin.petersen@oracle.com>, <quic_nguyenb@quicinc.com>,
 <quic_nitirawa@quicinc.com>, <peter.wang@mediatek.com>,
 <quic_rampraka@quicinc.com>
Cc: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Matthias Brugger"
 <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "open list:ARM/Mediatek SoC
 support:Keyword:mediatek" <linux-kernel@vger.kernel.org>, "moderated
 list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support:Keyword:mediatek" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v5 0/8] Support Multi-frequency scale for UFS
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250213080008.2984807-1-quic_ziqichen@quicinc.com>
In-Reply-To: <20250213080008.2984807-1-quic_ziqichen@quicinc.com>

Hi Ziqi,

On Thu Feb 13, 2025 at 9:00 AM CET, Ziqi Chen wrote:
> With OPP V2 enabled, devfreq can scale clocks amongst multiple frequency
> plans. However, the gear speed is only toggled between min and max during
> clock scaling. Enable multi-level gear scaling by mapping clock frequenci=
es
> to gear speeds, so that when devfreq scales clock frequencies we can put
> the UFS link at the appropraite gear speeds accordingly.

I believe this series is causing issues on SM6350:

[    0.859449] ufshcd-qcom 1d84000.ufshc: ufs_qcom_freq_to_gear_speed: Unsu=
pported clock freq : 200000000
[    0.886668] ufshcd-qcom 1d84000.ufshc: UNIPRO clk freq 200 MHz not suppo=
rted
[    0.903791] devfreq 1d84000.ufshc: dvfs failed with (-22) error

That's with this patch, I actually haven't tried without on v6.15-rc3
https://lore.kernel.org/all/20250314-sm6350-ufs-things-v1-2-3600362cc52c@fa=
irphone.com/

I believe the issue appears because core clk and unipro clk rates don't
match on this platform, so this 200 MHz for GCC_UFS_PHY_AXI_CLK is not a
valid unipro clock rate, but for GCC_UFS_PHY_UNIPRO_CORE_CLK it's
specified to 150 MHz in the opp table.

Regards
Luca

>
> This series has been tested on below platforms -
> sm8550 mtp + UFS3.1
> SM8650 MTP + UFS3.1
> SM8750 MTP + UFS4.0
