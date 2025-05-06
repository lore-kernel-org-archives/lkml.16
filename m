Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5C12836B4;
	Tue,  6 May 2025 15:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746544086; cv=none; b=uICqQew5wFoadg4WnJ5iW69GiUeUlEWypTeXUm+29SYewVgSBUTQ70aqqkclLDSL+x18FwF1Y55+hJWl5cssbyR0F/ZZTKa3FQ+5BecWFc0VFsW5uoOCK+X2nGVZ/S5FeRIztn6iUyJKmtyYeZoWFLFL0rNMPlNDS2xkyPCVn3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746544086; c=relaxed/simple;
	bh=iSlW0krI7TcCaxYbEGHHjPXVtbPo48FK+jfu/eXXjYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q0JaBRFxLQxuK0n11Ma2jRjhb6rajtjVTtnUenLE5awHF36v/pC9bv20X6gqBvxwwuZmW0T3A2255bXFGle8YDszg3QOe9IVKogjUA87jPdJs6wJr0bQBuH1GLbs5JYiTaYx4t5OxDyP450v5+Lu8cq5LmlHTlXcx/LcMnevyck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JLtzaf5X; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JLtzaf5X"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac3b12e8518so978250866b.0;
        Tue, 06 May 2025 08:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746544083; x=1747148883; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iSlW0krI7TcCaxYbEGHHjPXVtbPo48FK+jfu/eXXjYs=;
        b=JLtzaf5X4Hy/B8ZrixRdvJiDxbni3GKBzv+Wqxyu/kCQO5JTOeD6Py++vrQQL+JzX4
         hvSiZ09AhDdvgsEmYhbRROXbqXDypLoG3guJCTZ75Q2Qvk1CkxHGvS+eccf/AZ9WVrzy
         pozlyeoW9krJcibVhMuSNvPvuo3hNJKgArNVv3gyY3yit08DZS8jrU59piCLeKk2egqQ
         hzz1pS2Dz8G+6cNqM6oLWoHkJf2VeEpDVmu/66UaTEAYn1s7GTmZc13C59q0MQsAxaAe
         cVpGCmc4IJYYR1qgm7Mv+5qqEDN84TmuLcgYhdkqRfk3HEDQ1kj4B3o2A+g0CNb/dOwS
         fC+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746544083; x=1747148883;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iSlW0krI7TcCaxYbEGHHjPXVtbPo48FK+jfu/eXXjYs=;
        b=kIorDT2/xv9KXflJhjFiS+TiAbqxAgeRBdm+82G1ZtXChcakLkSSaxiID0AImzwvcz
         sFYK/soYWDk50wsFzzx2gCEbObSdJrifjVRxOz5yt0fVLZfpVxr4pade3C3REf4sZouT
         H/ZygGHRKn+fd5g4pvpz8klnvhItgOtDGN6bygQtBhTB7DShbq+VQJPSidpSfe6LyyXb
         T3YZKUwBBtrFaCCZb7+aCpZKEiUpb/LnUeEnbR1p+M+UwWB616UD50sFrB+o05jlHe7G
         EHO8+Aa/ZU3zlAlCyNwt+eusBeTHZKPB89Xgy3XrsJy/iOIG/pxf6gpk0/OaTX+fuzl1
         w2Xw==
X-Forwarded-Encrypted: i=1; AJvYcCWd77Rt49Mz9iI2iXbFgUYM1Xf+SQ0N2UAqpWYQzWIdCkRoiCVZ50745MLkgYxh3WvqD0PSSTc5DUuu8Iui@vger.kernel.org, AJvYcCXtKETiR35lsbx15uuv6te3g5Jc31k8yMVa+ss/uiTwNxCLZq9Ig1VCVbQQVoj4ZEJpjdKDO1g8UgJa@vger.kernel.org
X-Gm-Message-State: AOJu0YwhTjyi8E7Oik/iB9/hli0oPrULQiA7mPw23tRrOwR3894JO6Dw
	QwJS8Ss3l9mQx9LuEYzMT69SPSFCCpIzLH+0tnTSblZPfo5aIHIW
X-Gm-Gg: ASbGncuzDF9vQ7btELSLs7qK/8xskK5Dt5cVPofFPCEsnrmXzHZmRrrd9Ipa2V1Kijv
	P/5l72bu0P725ZcelqplUn+7Ljgr/NqLeDBRhZWEbuGu9ukvybBTICrSf4cwrZqP+ovfm/69i5m
	vQ3aLylCpny8frO1ZX+EMETELlcDjOdoT9kC39NizLnM3wv7nWaWxyeNdxg9KLpPBEaJeJms4El
	JatM6ggbJr5kejXIjwB8RKgi5y2iuCc02LeMKOt9ZRSwsMSLYcjulXFxmblFNEBMRd62oJWZEvt
	HGK3/5S7YUC1WBdm5SW/Qc1WGhtgsOLqkMKgMbJwIBcOvQljvJNTZ2KxpS/MZioOukB3Yk3BfZ3
	QEOyl
X-Google-Smtp-Source: AGHT+IGfSx+4B/W7FMgVmlZfbM9EEgDK60WM8+WDoV25VvtvVNmkZqOCUufWt6ENzvib+aZKIvX8Jg==
X-Received: by 2002:a17:907:948c:b0:acb:6081:14ec with SMTP id a640c23a62f3a-ad1a4b85d03mr969159666b.61.1746544083138;
        Tue, 06 May 2025 08:08:03 -0700 (PDT)
Received: from standask-GA-A55M-S2HP (lu-nat-113-247.ehs.sk. [188.123.113.247])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189147329sm713691466b.1.2025.05.06.08.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 08:08:02 -0700 (PDT)
Date: Tue, 6 May 2025 17:08:00 +0200
From: Stanislav Jakubek <stano.jakubek@gmail.com>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v8 3/9] ARM: dts: Drop DTS for BCM59056 PMU
Message-ID: <aBol0PuY2H2E7FjV@standask-GA-A55M-S2HP>
References: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
 <20250430-bcm59054-v8-3-e4cf638169a4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-bcm59054-v8-3-e4cf638169a4@gmail.com>

Hi Artur,

maybe you didn't notice, but Florian already applied this patch (in V6):
https://lore.kernel.org/lkml/20250317132922.2698513-1-florian.fainelli@broadcom.com/

Regards,
Stanislav
