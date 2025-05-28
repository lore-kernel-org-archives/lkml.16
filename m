Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D905C22069F
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 19:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748461139; cv=none; b=ggcnKlg6DhCGih5Xwd53iwP8uj9iqyUG2o7j4fiPf/F3yCWJBDo4Evx8y9FNCqdaN5+dsZ8up356GhxaIduE/Tqz59hRFIage1y/5EKNgCEDcZ1lnjD3qEUMl0IFyhPbTFDiu2jmjnZooDMryvuP6tKKKEvaDckt6sHWqNPuzUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748461139; c=relaxed/simple;
	bh=qAlgiZE6ubh5iHvoct1giz6jhFlPlq4WJUF0qIjr0bc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=euFA1IG8+wL+h9xJ4qCRtCaYmYP9iR+5dM3/GXQ806fQKE+/WSuFRV7G9eI9jiQXmAQAbUAR2cLy59sz42FPtUEiGT00MFVEwQ9FQxLkoRb7apHDWsK810cDF19aWQVEKF7/SKyiFwNWkANfq3hQjF8vyHIW/eUHHtNwC/OkmXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JGqNr3o3; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JGqNr3o3"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a3673e12c4so114946f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 12:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748461136; x=1749065936; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=plXt1Ax7l5ZZocx/9iEw4j8ASiL+K7iAWJMDAiTUmzM=;
        b=JGqNr3o3MciDVlLczWfQw4vdehz4oTxVTu1idec4utdfYv+QzyVKpX8ZCtTwuajQH+
         2Y1PILGWHd3LIwYfAgH6AuiQj5ZLWjpoa9/KhCUIros5YNuqyS4SqHdal7o4aws46elU
         6FIY4nR03XTKg2KNqZVuzTZetuTtUwFI1U0pYp246xkNHYE2/0IQGZTXdKkF74ynxeoZ
         5Amd67SA0bh3OtC/qowo5/T1VRLPUnyucehgx/FrxgSFozgIfGstVEQoK4T4xypuhlxI
         d6BbFXJk+36eRKq9h/xlwicsGf3L3+/BN+HpmnY+t5keBXexWHqSqJUwWNPa4mRUkkE7
         eUIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748461136; x=1749065936;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=plXt1Ax7l5ZZocx/9iEw4j8ASiL+K7iAWJMDAiTUmzM=;
        b=G5nNcZuD6hC+WcVZxotfmZdOA3cEziQMMyiXSLl+hf+oON0uNhxT9Pj2EsSrRNrP85
         0iQGSNBi2fC2MA5NtGiTZEBlVn8o02NZfsucBGFT91UOtcss0hGFGhM771ZAsIHXbkvg
         OoabBvEu4lWsxzCTWlahgESrYw/9uqnlfKBcA8ce5b3Bc1IWkAfC1kNiG0SXM6rrZWbw
         UJvBp9W8DlK+232CwH1z44ZbuUXXmx93jCtnravdrLAMDWOZ+kHdNeN/38bmnBOqrXLX
         Ar9pufYxgoZ2+zk+5qZ3iLgySZRGzhG2LaeWm8ftHMvccCiRxMBS+f+WCZAZUtK0PdjV
         q0ww==
X-Forwarded-Encrypted: i=1; AJvYcCUUkebLW7WaXh8v1Ny+bwuTXgOTh8raE2uGNGnrtdPH3c8bbcU70R5lQVC07r4dvA19D3i2ElJZBwKUwXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlcxI36U/Kotead8WjrLV3ppvZBk+G2EX/4FH/O5RZTT+DUxXF
	PHZgNzfSGXrRVX5jYEnp7Cv1zxOaPHH5t+TJ21N1hc4KasRz6eBSUQDQ9NM3mhKr6ew=
X-Gm-Gg: ASbGncvY8ueSQK4IQEmhvo2/0manHzbVXt+1Jcc7KF4FPGfVMYslur8XPqST9UVYg7d
	NxTMjnWbc3FGxVZ4f5aKOXGidFKb3SgLeYW0OSw4vs45E9smMZ0MLI5sSRXZ9s5m/Sc1bj9llyo
	LMv57q2eiTgbDCG17UKMlbkR8mmDXIiOqXIltDTP8ECz3xYYJQIQK7n3mFmSkcikcKVH6loPxD5
	ExGu9dQqNbwCvlM4JIIOfh7icgmqbKLhlVKze8mpn0IOTRISOjznH6WvdUpas8VuUxahlHoYxpp
	JN2v4DxquOhIfVdG9+T9Dp3+Dq8UDyUHHPEFn0lOHpzKWuAqo/hG9pM=
X-Google-Smtp-Source: AGHT+IEohOPMzN+pE/FspwUOZyTq3f/DaGNNjqVAcD+QKVM4fgErWjBcDpyCCi/2vxtZ5wPSlADAxA==
X-Received: by 2002:a05:6000:2504:b0:3a4:e387:c0bb with SMTP id ffacd0b85a97d-3a4e387c5afmr8004139f8f.59.1748461136127;
        Wed, 28 May 2025 12:38:56 -0700 (PDT)
Received: from localhost ([41.210.143.146])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a4eacd6e8asm2265146f8f.70.2025.05.28.12.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 12:38:55 -0700 (PDT)
Date: Wed, 28 May 2025 22:38:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bram Vlerick <bram.vlerick@openpixelsystems.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: add invert display parameter
Message-ID: <aDdmSy4lYH6WrMWS@stanley.mountain>
References: <20250528-ili9341-invert-dtb-v1-1-080202809332@openpixelsystems.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528-ili9341-invert-dtb-v1-1-080202809332@openpixelsystems.org>

On Wed, May 28, 2025 at 05:42:30PM +0200, Bram Vlerick wrote:
> Add devicetree parameter to enable or disable the invert feature of the
> ili9341 display
> 

This commit message is so unclear.  The parameter doesn't let you
--and this is a direct quote.  LOL-- "disable the invert feature".  It
would be better to say "Add devicetree parameter to invert the display
on a ili9341 device."

regards,
dan carpenter

