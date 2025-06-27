Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB40026C393
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 08:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751014275; cv=none; b=q5FpNl7P8DcgoZfkNmkwfSObW3SV82xIT0Ik+xgSd03Smbeq6k/d3rzw8ZOkeHXev659XYLs2QF/FBAkZpqKvq2tuk8pvQv4pXZfBnaIxkCCnRztT3ZUk4XEfCzTXouktyAUETCaXDo76k+oySZ/z98YbzghxT0g4W62yTieOC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751014275; c=relaxed/simple;
	bh=lMIsRDkxKlW2sITXvPt1YCZorjg8GdjUNuUGIzNXHKc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UUJo+RBG72wSQDX2vSlFlNHWvO+v2psKcgfpDUOqJEWCLrb+MzJC3sit+gvloXdY3GO9PInLqLZF3kLFtR5BUTqtsYGx1gSdkpaNowIj6mznWQCMdKw/LAlNdogZdABVcvmLYeya0/6yjPu3m2vog4A+H89MrCUc2BPIYJ4DN24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FgmfI8ib; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FgmfI8ib"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751014272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9S5BIwJWhZ7aWoIrg/4Qmnz4yYjjaSexucJJwI2/7U4=;
	b=FgmfI8ibtGhz3/hlAkyv8/DciBe2Q4l9lqXdLlTrpu/jqGQFl7d9TDEbwHADiW5fpbdIVn
	t0lZN7RtNZivWBrjDE6oQdzgzfTcZTzsxJdhyOB7kDNzn+5ar7svrwoKAnxm3sZXQffda1
	zY8XzFQE5UwPkcTzgqzeoeOUwy2427k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-341-N3LDsnuDP6Gxah7R_nsGTg-1; Fri, 27 Jun 2025 04:51:11 -0400
X-MC-Unique: N3LDsnuDP6Gxah7R_nsGTg-1
X-Mimecast-MFC-AGG-ID: N3LDsnuDP6Gxah7R_nsGTg_1751014270
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450d6768d4dso10839555e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 01:51:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751014270; x=1751619070;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9S5BIwJWhZ7aWoIrg/4Qmnz4yYjjaSexucJJwI2/7U4=;
        b=nT2nt6y9BdX7FtuoBfehNGftM99+3p8nIYy38CpfSws/5kYJvc+M/8iCS1y5cwR9eS
         SXFZjFWiWu8S4YABz/8UyOU7rk9LT/9bcaMYI2yu9GWeNIagVWQtmvN1Y/HObcoIvP5h
         gERQkBORqfGxyhFhwbw2alvJQH9zcG9b1vQOTr7JfzpmbhwbfhY5zdk6IbkZ0RhXy5oi
         CqJ9GO5oHg0jml/8NlVI0dO4Gt/BAwCXvw36ohWCJ53pDlYUmTYBXbNsaswXyB5C9kaA
         LbrPwxe7/qbA7CivSdiY3zvpG69t0md6jfS6VZfkz/MAziKSpaQvSx78JcSqLw1YlINK
         nF+A==
X-Forwarded-Encrypted: i=1; AJvYcCWskQpqtHYSh+Oi4Mv3fgicO/sW7D1+4wCdjwJWLXOAc2pbDfOEVJWNaeDEYF5SXS8hUdmX/lueCGKmNM4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzL9Lso30cFWKaA9i1j/TGAAEFRn83Klhl7v4wVUwpoKJGZOLKA
	fprpy8nLDbcZgYnyOc8zDG1+nAwUnf+qrOhpwZ9Xg1hwf5JoTyAFo/mO2ZbsvB7RXdkv0DmzZw/
	CAwLsE1L5ylg64e5PbAZfdTmcrl9gFpDMtNE/ZErZu6oQnn3HrPQIQXuM3TBC5RgM/g==
X-Gm-Gg: ASbGncsM4H4NKBH9276h5y8dsmlxFaJ0LSv8c4lEYa+tdfclM77ma+LY54mT5oikmiw
	BntQ/M4dRzJ+aLySk9ZGTLbNAwQ+GyAJxfysPT/LnFRJ9xA1YPZ/C0nUmnVQr9YGNIPbRrdd0sh
	kz+cBfG1lu+ow/Qils/zdc00mOqpebiDp9d88JDqV9W/4BRDrVkVSkl7UG12b1rWcSGuQeltfPz
	eYV2ISe65HJqR3hIWU4jSfWihWcqiYxUEu0L0lvKzmwEk4yosEJ3brzHOU4Ki8QEeKhwBtlVILQ
	EIzJNslo4/zashEEZ+jDgfN4hPiKmSiCMym1RoCcUtBl9CCjDD0A9NTd9uQwXwni6jXc0VsGef6
	2xprx
X-Received: by 2002:a05:600c:c111:b0:441:b3eb:570a with SMTP id 5b1f17b1804b1-4538f21d22cmr20152315e9.2.1751014269712;
        Fri, 27 Jun 2025 01:51:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXokL65QImWUWdVGNsBSXoLoc72EgugzTSJPGmsScrWsNWL3lNb3wxJPDeprEOScHkjECCNA==
X-Received: by 2002:a05:600c:c111:b0:441:b3eb:570a with SMTP id 5b1f17b1804b1-4538f21d22cmr20151975e9.2.1751014269256;
        Fri, 27 Jun 2025 01:51:09 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823c42e1sm73481915e9.37.2025.06.27.01.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 01:51:08 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 2/2] firmware: sysfb: Don't use "proxy" headers
In-Reply-To: <20250626172039.329052-3-andriy.shevchenko@linux.intel.com>
References: <20250626172039.329052-1-andriy.shevchenko@linux.intel.com>
 <20250626172039.329052-3-andriy.shevchenko@linux.intel.com>
Date: Fri, 27 Jun 2025 10:51:07 +0200
Message-ID: <87frfld0uc.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:

> Update header inclusions to follow IWYU (Include What You Use)
> principle.
>
> Note that kernel.h is discouraged to be included as it's written
> at the top of that file.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

