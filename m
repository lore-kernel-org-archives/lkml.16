Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72189248F40;
	Wed, 30 Apr 2025 15:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746027595; cv=none; b=gXDw0OLzwuTZgbIPLQZT2PS+oMMVgrQjfxExU4jzoJ+siQW/CAHkyx4VtRtbNwiFA5NoK8hxELNSEbhjFxK5X8ha1+JdfAi9dk4Upvt04UtVH9TWHtrF+I1KqFfQM55gr449ydzmao1+398CQX9wHNOLr94d3EtJbZEOz83iCeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746027595; c=relaxed/simple;
	bh=7gnwFWZ0cFqEhVbNLmt9Fc9sr/LSelqQoAOWfIU8mOs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KDnJlLIAV0coUirP+Wmk8wr6sis9BmYML0ymx1pR82e8AZM2zas6M3opUZE9dbY8RnagXdem0k4rC6UygAqXRIxCoisUJCHhKZvlBXFSReTNvhSOOfIGt//CnQZw4I9tG+ogGiTVvq5dD9LRjHU5gAhFRZ7ZFb7kLg3hVmB3o2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HKm40ro2; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HKm40ro2"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3913d129c1aso27621f8f.0;
        Wed, 30 Apr 2025 08:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746027591; x=1746632391; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AgReYpbiEfzzRjpl9plzaSPk0WShKygYvywpy8RPSlc=;
        b=HKm40ro2daUbDbkEtRj7TQYQ574q1y4wNqHhx1PDKlfkyn/mS7Dw9p6lj3uTdSFXb1
         x7sTa8/Lzl9KkXmxW/xHSB8iYnHQxcRaWcuHQbcwhTyOOZ9EHI4rA86LVR+2AOfiz+dr
         +HT7cSKhJpLDV38Z+MGTmxqmJq+B2rYfJ7tQQf8agFz/Bkkob/w0MLDzfpGho8vxlbbm
         1Qbe7x3e22Lr1aW0SCSE8w7rX5IsVT1MI113RODizsdJiDJ64toLWMS5SRtaJs+oXSyx
         LRv+5ReZvIpnPOMSJU/XchTur69lGhxJAO1Hu1sg4KgcLRx+KKBSswO3cD2GPAM1Ke9p
         MZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746027591; x=1746632391;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AgReYpbiEfzzRjpl9plzaSPk0WShKygYvywpy8RPSlc=;
        b=MPL7NWc6PonHSQhwr/a0MRB/xSdime4lheH9EAw146p1jwBnV9JjlUmKsp0yXRIkIL
         iAi1iXH7ZiJtNwQETOo2UUVPlDG/OfydDuMSotUKpy4IM0m/XwuZeAQjEruY9yvTLkv7
         2mIGll6+7gxL5CBF1VaKWCOGQzOEuJJgdmjgG+3EG9zjs3soAhZwFVdQeF9xcn0gm5rs
         jBkNB2GGA1swN4BLa3nLUsqUY2HuXD1yeR+lLRiaUC5gcWiXFLvNe0Xj5+WMDyMgzeZe
         GJin1z5Bqs9mAzMuc0rQaMMGc3GMYFAr1mf6e4GTc9StC9fRCTlMbxJ300a3ziR9gQmS
         tfGg==
X-Forwarded-Encrypted: i=1; AJvYcCUU2jXhWot7/fvftzsofhJ84wuTSJ7wkezdHgDLNLYs3DoHXce5wKqWhh+KCltEZAWvKavd3J9BQpkY@vger.kernel.org, AJvYcCWQ7hZLEtu/M0BgKLg0aq77QhB1hu2nwCz+0/1m+RoU9AocriDgc1wVJvakHb/BzpKbzq+jP9hAn6aVgGNf@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwynzl5DTKWdF7Blr7fcxVkAq0yns4G9d3Xk+zfJQ1pgQ+8CeZ
	6RHfjZS+H+npKp80JQsl6zpWPDddww1zMjAB2jomA2k2w2iwAQpc
X-Gm-Gg: ASbGncvNEVIQujDzIPUhjXAFBYa9mE2H3upz1w3b1ICHlTrZvxsGaVWxvMOwPdJoopl
	IeLthacQCNxvkM9sUmVVeEOW/KVJtO5AU/ZY7XNFUA7Yrj6bCASSxXs2AArKh/+Ob3ixaw5FaKI
	CHamtaICFFW12sRzDz6yKqgP04h+vOFI/eIyaszgzrY4r/i0Xu5B0o7mKskzShbu1jmWCMA4BKf
	5i+x2IxeH+Kg5PaKSqFsTMon28IDHdR1WuWoKEdPyPWjiwbnm+uQ4QHgIXcJi1tGqh/iS2yNnHL
	hWbX7IqOvO7rBrjsETYN/gNBCf+nKZ/Or2f2uQBex287g8TRZbox3DqlnVTxCyl0NgavRfQ=
X-Google-Smtp-Source: AGHT+IHcVYNpX6kC+rpllRwGYlEvC7hfE7RUIIVLkUZ5sknWEbkBsoGfPhKSTHjS/hL2h6rPpP2B+A==
X-Received: by 2002:a05:6000:430c:b0:3a0:85e4:2268 with SMTP id ffacd0b85a97d-3a08fb450d8mr3047261f8f.10.1746027590590;
        Wed, 30 Apr 2025 08:39:50 -0700 (PDT)
Received: from giga-mm-3.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2b28732sm28740255e9.37.2025.04.30.08.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 08:39:50 -0700 (PDT)
Message-ID: <9ea234373b18a91c6a2f7a41c441002de1e92e98.camel@gmail.com>
Subject: Re: [PATCH 2/3] clk: sophgo: Add support for newly added precise
 compatible
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Date: Wed, 30 Apr 2025 17:39:52 +0200
In-Reply-To: <20250430020932.307198-3-inochiama@gmail.com>
References: <20250430020932.307198-1-inochiama@gmail.com>
	 <20250430020932.307198-3-inochiama@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Inochi!

On Wed, 2025-04-30 at 10:09 +0800, Inochi Amaoto wrote:
> Add of device id definition for newly added precise compatible.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
> =C2=A0drivers/clk/sophgo/clk-cv1800.c | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/clk/sophgo/clk-cv1800.c b/drivers/clk/sophgo/clk-cv1=
800.c
> index e0c4dc347579..e10221df6385 100644
> --- a/drivers/clk/sophgo/clk-cv1800.c
> +++ b/drivers/clk/sophgo/clk-cv1800.c
> @@ -1519,8 +1519,11 @@ static int cv1800_clk_probe(struct platform_device=
 *pdev)
> =C2=A0
> =C2=A0static const struct of_device_id cv1800_clk_ids[] =3D {
> =C2=A0	{ .compatible =3D "sophgo,cv1800-clk", .data =3D &cv1800_desc },
> +	{ .compatible =3D "sophgo,cv1800b-clk", .data =3D &cv1800_desc },
> =C2=A0	{ .compatible =3D "sophgo,cv1810-clk", .data =3D &cv1810_desc },
> +	{ .compatible =3D "sophgo,cv1812h-clk", .data =3D &cv1800_desc },
                                                           ^
Should it have been "cv1810_desc" instead?

> =C2=A0	{ .compatible =3D "sophgo,sg2000-clk", .data =3D &sg2000_desc },
> +	{ .compatible =3D "sophgo,sg2002-clk", .data =3D &sg2000_desc },
> =C2=A0	{ }
> =C2=A0};
> =C2=A0MODULE_DEVICE_TABLE(of, cv1800_clk_ids);

--=20
Alexander Sverdlin.
