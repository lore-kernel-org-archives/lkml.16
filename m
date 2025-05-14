Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22EB21B9FC
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747211678; cv=none; b=nrHRmPY5/YXTA18qtlSmAX9mMOloSfp9Hrkeb6ekTjkgd/U2264KWPnlZwRdpNCoUjaG/AphJGtN6RpxBkx3xCGep8vWTKQx8XTrdFnR2nuF1S2bCOf2ApGV5UfnFZDuty3vpYF/q8NyFUtp1h+3N2NEOeHYyY1FTjxwwLOlDKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747211678; c=relaxed/simple;
	bh=DSWauo+U3o9231cQ5RDfCfsPrf+JknAFg22x5w5WXXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fOI5QlRpXrP4swxqzQhxIpdB3xVctq7xodrCgKFT24OVlD/Td0NRwyoT/n3rSwIhVCkiQPunWxSdoxs2kR8gYaKFjMaLbTI+rw2zVovA8nMGTO65ScLPZ3UglQA1fw2FN8GEqwdfSHTYN9lcpFB4B/QkKWdOA8qTWnBWYVyiksc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D2BhP+AC; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D2BhP+AC"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a0b9c371d8so5489691f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 01:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747211675; x=1747816475; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Lpk15JvnYp3a2l2oLG5xWFRwRjCqy1khehzteRsCvek=;
        b=D2BhP+AC1Kl6+Jzut7RbxJR5gbAiSm3QfPVP1nedhbndS+Xveu3Jxlb00lLHsk6tjB
         4UA8ivJC7807dJagm4/FD6SmId+GXLcwqWVAnyv6+4F+RRCr5wziekosOVHMlJTWfpW3
         AYhy951VPeWQcgiLPeOZq2CHhg/f4aN2vhFOlvLYzAyDJrvSYeUQ+OTbVaz1MHgx3PUj
         dkygIhrVMqVVWaCcwUWZZjeNngJNBp0w5gE0yLembeDPyWworRtiHD1nnSf7SKlzbB7G
         /EsBayeKxYpOQklo4COa/izwbVPy0JGNp56WPfc61O+2FMxaOp7L5/hODIWYIre9gKM/
         ybqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747211675; x=1747816475;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lpk15JvnYp3a2l2oLG5xWFRwRjCqy1khehzteRsCvek=;
        b=mQuePm5s7jKOt/9v1MjQs83odkQLE10NOIN6GJr3r4KDoSEKg8kSxTdpSDq/IAGLDT
         WgJhZJ6axZj8GEkTXuEf/VuZDkbNW3jd5hszbMbikzacY/X81wqB6qjupoVDH+DWMWw+
         NSg9VtMgma0xOOZucQHBJsvzYjl+TQMHOSxJALpSr/Kn9+X0pXkHfCfBEjT3nNJB77JT
         SSi3n5tz2IPgNuvy/mKmwxLp64j+HQTsIoh7LBy5ZLzYS5gYNLoKhNgWKh8gdpsCr33Q
         hDmHE8BzwkZGKF8hrzPqzPXP9hnD95o7imkDW35fywyc8sjTmn3AYDy0ZtIl9ztx8kx+
         +L1g==
X-Forwarded-Encrypted: i=1; AJvYcCW0Y3wirvwSMCqibvY57oA0rrJB0tLp/2YDi94nvLao5Fzmew7np3nk95r1yx9nX+H71mmAojzsrdVJCuw=@vger.kernel.org
X-Gm-Message-State: AOJu0YypVTP5IAJJFdvrg2mAWrwgi1tVBKgaHSMnq98uYwMuwppjRr5i
	Q91jSsSx3hlkzo12SAVuiNIgU1X0f4g+VrDmvvDl26p1ZX1tn+fnRWDLUVmmRyY=
X-Gm-Gg: ASbGncsxmZ4Beca6qtJjTJOpyP7C6BWqzNn9rPcR9AiQLAWnMverSvWp4LZEoEcippy
	wuSDnaOt4C+VLP27hhv1Q7ajxQGMMGeDUK3/ZoHhnzU9JCbf6ZQwVMYFD5CvkCHNDdIFD3i/icZ
	EGdqeOYqGgjRnNQ3XwltbeUUQrq/10XHw8774nxFMp/RflKpefD69ha8tG7r8FYXxU03xQgPeom
	/jSeP0u9M8ZvlAWh0yJyJxQiA/jw28+j8HQBgra2raIvzFW2P98mf1UMUsQqTX0Ft1LpEHoPmWF
	yRX63dFwjkWQzQjv6XbxPKskzfZANUCvNTVxtJptJHfNHgDesQCe0AqVPvSk/jimIB4TKxDzVF4
	sAicaQxeu2ARYeQ==
X-Google-Smtp-Source: AGHT+IF4qjjU+HY8IfZOPpCU5WcWafIwqSU4OR3ehg6IR33UyrDws9inQGF3IDNUyKOx0epG8/Qluw==
X-Received: by 2002:a5d:5889:0:b0:3a0:88e4:3d2f with SMTP id ffacd0b85a97d-3a34968f999mr1902249f8f.5.1747211675277;
        Wed, 14 May 2025 01:34:35 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecb46sm19060940f8f.30.2025.05.14.01.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 01:34:34 -0700 (PDT)
Date: Wed, 14 May 2025 10:34:32 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Cc: ALOK TIWARI <alok.a.tiwari@oracle.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] thermal: Add support for Airoha EN7581 thermal
 sensor
Message-ID: <aCRVmDk54EX2L20J@mai.linaro.org>
References: <20250510172509.2547273-1-ansuelsmth@gmail.com>
 <20250510172509.2547273-2-ansuelsmth@gmail.com>
 <084240c5-48aa-406a-9bbe-2f349f9c2509@oracle.com>
 <CA+_ehUy+WSzRre+64KxeJKtOb_Et8HO=oMV+fNrGF5HHLzh3MA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+_ehUy+WSzRre+64KxeJKtOb_Et8HO=oMV+fNrGF5HHLzh3MA@mail.gmail.com>

[ ... ]

> 
> Thanks a lot for the spelling check. I can send a follow-up or resend this...
> 
> Don't know what Daniel prefers.

Whatever you want, a patch on top or a v8

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
