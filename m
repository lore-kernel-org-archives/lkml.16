Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3D1211C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 06:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748844050; cv=none; b=Gdd8/vNclT3TlWfXpjUpX1GGgSOg+RIYT5hZWYkUaJJFDc2cD/Rm0advikffAboVdezaSLqTTFixP5xJiAbDPdoVDrpgYoN4altoNaXEkHkZWdaA8hRcay3kDuWBZEk1tZQOpts+9rUHJuSLAAXUjFnV0WUGbewo4IPuz3eYOwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748844050; c=relaxed/simple;
	bh=ZUltAtR07i40pgJXXbIJlpOQg4mwbvuinwqOenRNbWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mV8WNkksCRQy3cY6ebBO56GK4GNUIP2RhD/D35m1r7WFdXie3D6jwQe5CN4aiuYsnJ3XJB4UN0oZlcUVngVcqIahRsgdmaCDXBwtsRrdwWxF1JMhPh1FJJVP6VrnPqVeFu8rc/E2bxdVBVKbZsYmRtJmJNidl2WHAlSqXXP2Vl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sOQWyciZ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sOQWyciZ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-451d7b50815so6035775e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 23:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748844047; x=1749448847; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZUltAtR07i40pgJXXbIJlpOQg4mwbvuinwqOenRNbWI=;
        b=sOQWyciZ8grIcXcUrds+EUs6tcrVZo4L6HkQLieR5FD9ZOYhcY0y46Nq43K3FIWnu/
         qKu/Jr2ccQM2FjDbDLRk3hpg+6m/QlGb3r4tda4Jh69mB8WaA0jM9UqROJGGdBViRO9H
         CS0HqS/y8tJ9ek98il/Si8fyax2NI4TUhdSo2uuKf9FF9yeD50jjaVBdBw4wb25TzmCi
         TVgYe74l+Ispdi69DjA9CLBdOZpXR6zuHiTGN9+byYEyzEQv0iK76kbhZZtw6mhGeyoz
         bps9w/bou3Hw7dPP9p3ZJasIOOn7/Q2OStHGExHcdLHQUMC+qiKr4dXzmXhuOCsfmuPP
         BVcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748844047; x=1749448847;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZUltAtR07i40pgJXXbIJlpOQg4mwbvuinwqOenRNbWI=;
        b=VQG1ztGgM4d/ec+pY2DaDdxpdhxlzZ2aWPg0ZHUNrm0K2WPrLI2ufpw4J68E36HcHJ
         Xzxlw8wRqIkfTwMrNCBH6At1QXhiX/HLj+8pFUAAPhEWl3nzpMFQqwz8yFrMRBMS0wrq
         Se8lEegGd053kMP4Si2189Q+WGYkruyi+AnexFvhS9HhPM1goJgsH1rNV2vXs9X2S705
         Yhe+zd6otk4Qs/RKZTVUsVTFox4IGkgORCgQlkvHHLkkJHsgls/c4JdmnobNA1QvigZm
         9gS/zN5A/3j/w2e5ErxUOUy8sgU3Yt3XCtShxaka/DeN1vS4KJ4DlQQq07qCTmv5OR3t
         08MA==
X-Forwarded-Encrypted: i=1; AJvYcCU5q2lEPXZE1w3QjMr3jz4Pcw/IERjzauk5rVZpvoVGJBUStBL06wOmN4uFpvpv9MisUKsYzejQFi6s9+4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOj+caHqNLzBNLsHFze2clH7Gi4fJvw7XDvvajlZXZE8Soap93
	dGguxatUC5pRn6tri84p1ehQGPsi7C/VQIqrCgHMpj2INgxxE5UaFIOuLJ8dG292Hew=
X-Gm-Gg: ASbGncs/U8g9aD4y8iNOdZhXWb6PlLA6hu7Rri9kFC2grWBn+VKCowf+O8Lo+1b7Rev
	Vwrwcs3meprDJYEjRRfb+GlVEe2A+bHlywCmGyFfB4iYkqRA8lZneAvNn+pKeHfMHlZ4okcK+QK
	qnoq52MUhABvQMzILppVeTTsyYwU3JndBEPt7Ww6Mo4+BM2wH83x+VC+Fo9eCVP37SRxJ7oGtzH
	LjqpZWqnzMo/XB5LW5vRVn+MG++3ZLlG7sxG+ZBwmGp+zifmliNp+Kyx2rs9jw/hRZP9m6aeonS
	wdkDtd0AmZ2RxqonanZlAH3PS5Y1r3ZrMFxnF52j+NGxEq6JK/eQVp7cL/3QM1F2SQ==
X-Google-Smtp-Source: AGHT+IE4Zr9Qtixv+/C3Qb+X/JxHGQ71ImNqXM3WL3OQKOC8eCLWpkHvUD/xQmb3j6c5zEB7cL/nTQ==
X-Received: by 2002:a05:6000:310f:b0:3a4:f7df:7564 with SMTP id ffacd0b85a97d-3a4f896ec04mr8654673f8f.0.1748844046754;
        Sun, 01 Jun 2025 23:00:46 -0700 (PDT)
Received: from localhost ([41.210.143.146])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a4efe740bbsm13691263f8f.54.2025.06.01.23.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 23:00:46 -0700 (PDT)
Date: Mon, 2 Jun 2025 09:00:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Nam Cao <namcao@linutronix.de>
Cc: Donny Turizo <donnyturizo13@gmail.com>, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8] staging: rtl8723bs: rename _Read_EEPROM and other
 functions to snake_case
Message-ID: <aD0-Cmc089r4tLLH@stanley.mountain>
References: <20250527004327.3627-1-donnyturizo13@gmail.com>
 <20250528211533.DIM_zxnE@linutronix.de>
 <20250528213139.QHPG7Pf1@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528213139.QHPG7Pf1@linutronix.de>

You invested a lot of time into reviewing this patch...

On Wed, May 28, 2025 at 11:31:39PM +0200, Nam Cao wrote:
> Please mention any dependency in your patch.

Yep.

> But I suggest waiting for the
> dependency patch to be applied first, before you resend this one.

We're not going to apply that first patch.

regards,
dan carpenter

