Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688E71509BF
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 06:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738218203; cv=none; b=DNRU9piXScXio70HBVyngOe10ws+NvUdeNphDU4bWEjr9BxrTHazHwOTUiKFe9zuDCRsUEZHSerJAWXzSdjKtdPGWkdISLkTDj0RwTARVOjjEmOCWKfK6jgXck91em0KoWQnmGXvYQc3EfPKwlHrMc53EawGX8APZcGxqaKi3OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738218203; c=relaxed/simple;
	bh=G2kowd7hqmezPOY8+BqMZm1IdO6UCuJaE23GWarr+sM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D0/gwkY6S6jkgj+TvvMtmNDCbdaT80lbsiCZcyOVGwDu0Cfi4GeL8R7igObgELmQoeSK77FHwHj2CyTGa2ULKoBNJQz/G+SQAEiEnnIRd16r4jxn5D89yxBkWixSZRKJytyFYIGh5DzBap5EKUelm+aEHLYRg7tRRBKi2EFpQLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A3jpLpvK; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A3jpLpvK"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so4482535e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 22:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738218200; x=1738823000; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YFJSv3KcxO1VvnZ6+6jaqsugVtVSQkL6Yvtf1V03Z/Y=;
        b=A3jpLpvKpVgtGDLY0mCqrzi2UkpbA5a9QDjZi+GGKeJ1WpEp0QNsrH4/E3e6Y27DOm
         bmK1sxTpgOiEJpgYhq6nxSLIYlVHH0x4r3HRASclsN0L/t/CO371EWWEZk3TzmwlhlJ3
         mH97Vn4aewq4YTwTImUjZtkIEvI9b8Kob3KLX673EiUg9dSEZ19BJCCfHGTw5xNK66/f
         CqnjNBmxLCtcNtn03XwVQCWIf4Rq4mp/fLin/APH30DDvq8a+K340xbQfFX95JEZJG64
         FjIjhKUb++LiOLO01Cdk9JNykGlejnciAAKJi+JfESfXsaUgSnW7VOAn6MlB0/IzidwE
         ZKrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738218200; x=1738823000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YFJSv3KcxO1VvnZ6+6jaqsugVtVSQkL6Yvtf1V03Z/Y=;
        b=tT72xEBgQyhKCrndG/VK/DG55qYBA24djukJOdVkguJ8bPSPZoTk582/81alO0HPKv
         tNTQkhqKLH7AVddEJxTO/OiWNcFRToDmt7sSiyTeD1pIxB/JNZCnJHKnQANXrgaZEcEL
         9F8eFBixrvJ1einwERlOoxdEDvZwGMvCIyCMdK0QlQJFl6267GQTcm0fUiSkComlaWC0
         Hz7LZShoOu7Mh8YLOkdG3d2MZ3qWBf5OfUQxNq+4YxMsauItR+f8LnufOEJUic1UwD7L
         Jo/KiKnMNWjKr7oz/YlH+3UkR1duVtinS1UL9k5YjzAc71b5WV74iG6WiCqsrt9m2iFJ
         dHzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWM7882yxXo8nsi9wU+gAPiZx98g7uq94++oIAPw8ZQ2HMAWeJUlrVYFckkBHz1Th/SI3CMbEuM47GdqI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVxJKZtTGvsX5OFgH2MtojjVNeNKhUaqF+wkwe/U+IkoDV+m3L
	afHX1rW5T9uazXw3dd4R1ClRGiW6ayuffkROdE6hVSKzkgBdi3hYcssylLS4UIg=
X-Gm-Gg: ASbGncvpxZPpkkrijQJ45yB7u5+tSp5o/JKDt19u8Fv/AxBxELmiWskne3SynATMXw3
	sRQvtK7+Xu91QYIy20eUj3yLqGFnyjshyKjxQtyBt/SZnQSYwrp7CJgn53uVM/5EErUEj7KCdlv
	klnzBKF5wyxGKLyU1iNjX/3mQu/MP6JWTS7/9zb/oNmxvVtRVFiCNFhmNA8LXH9NrzbYsbNa7oE
	Dpwdvmor3H7THyTiiS0taKmujjXNz8Y3dRNpTTy1LNqhJyCwQOnRirp4Q13sv5RpBrLacpk+PF4
	0PAQPZ9y9M+pQI7xkvWj
X-Google-Smtp-Source: AGHT+IH/m4duPhbnZDGM9j7qzQFtkclBdAlrjtJmdXn08GWPDaO+PkGQ2IQYePEgjkJRgqobq8KN3A==
X-Received: by 2002:a05:600c:470c:b0:434:fddf:5bfa with SMTP id 5b1f17b1804b1-438dc3bb395mr52760795e9.2.1738218199634;
        Wed, 29 Jan 2025 22:23:19 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc2e384sm48025585e9.19.2025.01.29.22.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 22:23:19 -0800 (PST)
Date: Thu, 30 Jan 2025 09:23:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2][next] container_of: add container_first() macro
Message-ID: <ca7ecc46-5bfd-48f7-9011-1b3fa48153a3@stanley.mountain>
References: <Z5m76U5zh34WbeQY@kspp>
 <2025012955-hypnotic-patronize-8931@gregkh>
 <f6e24dfa-450e-4de6-87a6-6fcf7d83888d@embeddedor.com>
 <2025012921-dense-unplanted-952b@gregkh>
 <06aa1194-a7aa-4a5a-adb8-f6cd447d35d9@stanley.mountain>
 <2025012951-plenty-clang-1e2b@gregkh>
 <3979f87d-b7d7-48bb-b6ab-cd8165dbc3cc@stanley.mountain>
 <2025012940-hardhat-usual-fbc6@gregkh>
 <7f165e66-a0ff-48e2-a3f3-d5405a66c867@embeddedor.com>
 <2025013030-unleaded-answering-165d@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025013030-unleaded-answering-165d@gregkh>

On Thu, Jan 30, 2025 at 07:14:01AM +0100, Greg KH wrote:
> > Anyways, so far so good.  For some reason I was under the impression
> > that you two guys wanted the container_first() macro.
> 
> I don't :)

Greg, container_first() is like peeing in the shower.  Once you try it
you'll never go back.  :P  Anyway, it's not really related to the work
you're doing here so don't worry about it.

regards,
dan carpenter

