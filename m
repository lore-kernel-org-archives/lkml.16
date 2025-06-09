Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FBB20AF98;
	Mon,  9 Jun 2025 16:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749487279; cv=none; b=ZVov2fy5XVjp7R3WJUTpgnZduGvaoHN49USMxsVCaWwt9f14PA1gwqt+A8Be/AqBpk/3O3J/ttbe/fYQRtjLorzMffk0+mcvotHmykc0IOv7saMwKPFWbsM7lfImd5szdrQQecFa/KF+o7U/3E10iq+dHzTv1dB2XuCw1++muKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749487279; c=relaxed/simple;
	bh=SS1ghkgByas5aSVYoAcXnpxd4fVUVMPVtRUUyrprOiI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=P1luQJGtUtNgQIanbZQg6ByTkBqeT/HAvnZPSQR5eGG97XgKFHHW+yj7Rocz2J8c5nR/E6ERhhcVppcb+WogpBG03S0WmXOJfg3LqDLzKey/bBvdnTumZ84mMkfw2aDELCfgujDJ4yZDwSUqLjZZj38iztx9g4Hz8mMYW8FxSx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lA5kVkqv; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lA5kVkqv"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a53ee6fcd5so1132214f8f.1;
        Mon, 09 Jun 2025 09:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749487276; x=1750092076; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SS1ghkgByas5aSVYoAcXnpxd4fVUVMPVtRUUyrprOiI=;
        b=lA5kVkqvlIbySggiq+ED51UlA16kACtrn5EVLUQlerOCq0tagHYpD6bmxCWxg9V0d+
         stXbKDHTfqHG3nsVaa8b7ikYjC1MbHI9oVqwScqwLwpp6P6rXlFObx60vHRmGlbvSSje
         6RhhxttXGA6achL451mfRRQri2AFNVIQpkvwFsnCfOVWWPxppjhAzFt07x1ygN2K8fwn
         LMOwutY3syvIpet19ct8p23UQBa4GDa3wB+2ql72bc8M9uNJP1zHTTEKmuQ+3jZfadtn
         nROw46yHLEda5d2jN0TvP9MR87UZkY5/z1ezOKUxgQ1cpAfQJFRt18w8XNsMmfA967Zg
         vZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749487276; x=1750092076;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SS1ghkgByas5aSVYoAcXnpxd4fVUVMPVtRUUyrprOiI=;
        b=hpLpXIRDYOg8U3JSTaa4QybEYirDR5KiU4wFhxqUirQQICd41xjVKaZs61DKawBE+5
         qvQ1ioYEzW82i7CMWz2tmRJdgykUzc1rHpBUiDlYKoniJP0EreUItH8e9aap4uYw3TVW
         9u2GDeIAtezVCgd9e2At/sDdufG+50fvgT5z4XBeHwm2zbi20Oy4QgVqvcWFkXXvZiA1
         SiXFo1YxwhJgeCsXuanBDLclcqretY4EbDO11kRRzg94pCuu+4r350jwCH/IukFYwEyU
         Q7N3o1kIlvEhnexaSFvneRlOZU/UeEKSE6nBViucMDD1ZN1WlBoS1R7zWosTsNTpM2s9
         CfrA==
X-Forwarded-Encrypted: i=1; AJvYcCWw7xY661L6uF2HnVdM8Vu6YtwR+MmJvqGSXIKmjKvE9Zv2LOw5UeCSRL4fMrXWbVmST+7ztMVwqTyd@vger.kernel.org, AJvYcCXj54LNRI/4DkczSCkdVamk0dv+YTruWc8SGqdEbTDd3mfCRQ2awm77Y838bLw0UkdrE+wAfx8/1yEegRsH@vger.kernel.org
X-Gm-Message-State: AOJu0YwVuy3uMyiHMMXkctEC4AqtSSyYTNwHpW+yAhXN1OGAjDGdfyeH
	SmCsCc7NIzJQcHtZ79WOiZXhkC8ve77w0bkTYM57aLGJj4q+UIGbE0qI
X-Gm-Gg: ASbGnct8Msd925cPxG7Q68dwAAPQ8B/8WNZYpXZ4u7Hu3LWj9NKaYb/ilEGIr99SkcS
	uoFLiiAmGQP8lg7X1UR2YHqVYNkNEefaD0yt+2/1VO5RiuhB9TrkAoGF5PTL5CY+qhvNRtm2TBr
	NtN4iIoZAeq9kZIwfVh0OibwzdBpUykzabXwiXZPFWMwNOC4PPs5I0ZlZkjrOeh/2eXkxhX0O42
	I7N0NoVws4LPat5RToaWtyJPvZhw7XMGkGinw/glZX6MzKd3sevNB8gCLjMc+ZU1/c6nVLFbN/C
	RBdqqfy1iGtiRYnCdm0qL+T1SNtdiqTzgKaU37p2HIEathag6zd0VENq9QM3PCmfwEQsgNPjjqH
	Jvlh2eXPmdh89UeLU
X-Google-Smtp-Source: AGHT+IE2ObE00bmXtNKeLj6UQ2w2+eAieeGAdLJ0M/xXCi/xaTy8JC6h8IF0f4vMWbYgt2AIXHQI2Q==
X-Received: by 2002:a05:6000:220d:b0:3a4:f744:e013 with SMTP id ffacd0b85a97d-3a531cb8521mr9854409f8f.30.1749487276093;
        Mon, 09 Jun 2025 09:41:16 -0700 (PDT)
Received: from giga-mm-5.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45209bc6d50sm115775715e9.5.2025.06.09.09.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 09:41:15 -0700 (PDT)
Message-ID: <5a738b35e388f7c339b94e792a79d0d1b93d0345.camel@gmail.com>
Subject: Re: [PATCH v2 4/4] riscv: dts: sophgo: add reset configuration for
 Sophgo CV1800 series SoC
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, Philipp Zabel
 <p.zabel@pengutronix.de>,  Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Chen
 Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt	 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti	 <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, Thomas
 Bonnefille	 <thomas.bonnefille@bootlin.com>, Ze Huang <huangze@whut.edu.cn>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Longbin Li <looong.bin@gmail.com>
Date: Mon, 09 Jun 2025 18:41:16 +0200
In-Reply-To: <20250608232214.771855-5-inochiama@gmail.com>
References: <20250608232214.771855-1-inochiama@gmail.com>
	 <20250608232214.771855-5-inochiama@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-06-09 at 07:22 +0800, Inochi Amaoto wrote:
> Add known reset configuration for existed device.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> =C2=A0arch/riscv/boot/dts/sophgo/cv180x.dtsi | 18 ++++++++++++++++++
> =C2=A01 file changed, 18 insertions(+)

--=20
Alexander Sverdlin.
