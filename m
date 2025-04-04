Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03EC187872
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 06:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743748179; cv=none; b=TYSw0WpzfBB/dB0Za9CW5wnQmpIqHfH7Ly0ijS+WtYyjWOWwhYOt+mIdmAlB2OgJQWCA69qmxGPuWgqkCiyw1bTAudlrGCa9rVEAbRE8lDFxaZFR3Lfc/GMmcwDPN4h5EF5sIKnGnT9raIIOsa0ogVtG7UZLWwaHkmglxAGeKtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743748179; c=relaxed/simple;
	bh=SirHiF0IzPjZrZLGCDlILOP2R6w38LMKKr5VoTsgbco=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E2Ebq5d0bO1OFhBmrP6uU/XTkkWILYmhStIfd7uv2+fY8G5OoaUU6o7AGq7Ji6Esuu2Mz7P69aEcyy9jMl4sN5OX7nQI5g90zlZMqojxH4rwDqJ6upMnBGEHewzeHNnKWiIkVGP83jd8gTopcp0UH3YwJgykby5+kdPWZoNPiAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AZox5IS2; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AZox5IS2"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-549967c72bcso1900745e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 23:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743748175; x=1744352975; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o1bUxbwUrscVvhWMbUtW0PCBTE67Kf9+FciR2yrY+9w=;
        b=AZox5IS2mbpyYdwhW1MwLCo+NqZsknf2opD5+8InmYUmRxQlVePgLLcKpsE9QJxfXq
         xgqNleGVOm6JOUPAOFwMgxEThRUgHJcuYgQ/TVo4Ic5TBwOJRaxF7jVq0L66WadYJkhP
         9WpYpottJw92PDT2Aa4FDaZuvDUmrTsclrPsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743748175; x=1744352975;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o1bUxbwUrscVvhWMbUtW0PCBTE67Kf9+FciR2yrY+9w=;
        b=NRR/+dA5U08rWTF6yw/1yhwxhH52+wUxqXLStShF6CqXZDoXtLENb+KuPrQ0cvx8gr
         +EmpzgoUNkY5ZX8EFUhFZQS2cFCBmNKxvC0iGCUi14qpZkOtZkqjWllS5R9MCQAktSS8
         7u3ES7TLcDJGzjPQJEqhCE729+7P56qhGZSPHW5Iziyu3gpAq0hqz0+QpTF4UmiIvu2V
         /IlCD4Q7FAwGKAHMAohz6dbIRKGgIK5nB71TkE/bSwKEBb5cplN/eERQBywfCqioZhD0
         emwaeTAeAsW4ukNfq29/fL8lNIfmyYkm7dut+NAS5Y0cEWRNCZY25pTdHO4ditoom8ZD
         dRgg==
X-Forwarded-Encrypted: i=1; AJvYcCUE9eKvzfTnACuCNGtyxKaN9P8OaUMh96619txbYj+0YedTEjtOeyLyDr7Oy3nrwjq0j0ChT/YVr56SWZA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyutphHVfXryH5YtuEkQvNZWyORQL0z1pb7tjGXXdD5n6+QcZQN
	Qdpf2LCKXQtREeST2jcRqktQ7hPqWnKMsyC0jRG4o25B4GK6VgUwmlZ8sokW0vTtcvLs0vIcBXY
	=
X-Gm-Gg: ASbGncvCODZKcKSIOla6+LLZCTIM43ZB4/s1GTVkWnPbNMUPt4qHw3BwQPsAalgoCw8
	+BJb5WPLf71Tbdvo5SufU0fSx2v7vsTGpNxzIf4egkKj2QktvwxRvjlLIwYhRjLzqpNDFenyB72
	97KZYn7/OR138HcqwlqZPVqWvfq583lor5twkNZXl635GDuBER9+XktzYUaAh/cxn8i5fs7ZdiM
	JWeQeMWGwyjmse37t/X7KO3guLpvAqGH+4eM7iP8oyYWGFcRIu+NuwZ5U7DRdbkoI0OB2utcb6g
	xt1HVJB+TQfvAlGgFWCRmWnOk1Odex1JHIdFBcJNHLRCpHPPtmyHbjKwyDRnMr1CtUssgpj0euh
	fJJxkvOg=
X-Google-Smtp-Source: AGHT+IFE3WVcYsN4Tne7lMzUp6vQRaWGg/2kV1GUvOAb1fHQ91/fAAeb6CcXseQfEM5IBoBEbNW0Bw==
X-Received: by 2002:a05:6512:3ba4:b0:545:f69:1d10 with SMTP id 2adb3069b0e04-54c232c45d9mr389056e87.8.1743748175485;
        Thu, 03 Apr 2025 23:29:35 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e500c67sm358613e87.0.2025.04.03.23.29.33
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 23:29:34 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so1810248e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 23:29:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVDV0YlbwykMRnOqqumZxW3A/WRZzWauheS1Rlf4aOVHLMw+xlZFJ52642cK8adfImkoftk90FZ5C1imyE=@vger.kernel.org
X-Received: by 2002:a05:6512:2250:b0:54b:e9b:db23 with SMTP id
 2adb3069b0e04-54c233752e4mr316232e87.37.1743748173535; Thu, 03 Apr 2025
 23:29:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225-spx-v1-1-e935b27eb80d@chromium.org> <CANiDSCtfcMBMj3=_gWrMd3P1Bt19uZaWs1TYQ+ZPHo5amPi+TA@mail.gmail.com>
 <2025040417-aspire-relenting-5462@gregkh>
In-Reply-To: <2025040417-aspire-relenting-5462@gregkh>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 4 Apr 2025 08:29:21 +0200
X-Gmail-Original-Message-ID: <CANiDSCvqhzBq73=A+MWLQoTfLEDL-T07srmnyZuSHYsnv06oRg@mail.gmail.com>
X-Gm-Features: AQ5f1JrTe1ukOWMwD9SqlEcIy1Hss_PGvTbCOL5bfkOCWHBOE1j_Vv8ZxNY2CHc
Message-ID: <CANiDSCvqhzBq73=A+MWLQoTfLEDL-T07srmnyZuSHYsnv06oRg@mail.gmail.com>
Subject: Re: [PATCH] scripts/spdxcheck: Limit the scope of git.Repo
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-spdx@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Apr 2025 at 08:22, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Apr 03, 2025 at 11:34:14PM +0200, Ricardo Ribalda wrote:
> > Friendly ping
>
> Empty pings provide no context at all :(

Do you mean that I'd rather left the whole patch as context, or that I
should provide a reason for the ping?

Let me try again:

Is there any change needed for
https://lore.kernel.org/linux-spdx/2025040417-aspire-relenting-5462@gregkh/T/#t

that was sent for review over a month ago?

Regards!


-- 
Ricardo Ribalda
