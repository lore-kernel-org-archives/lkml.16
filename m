Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792B627468
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 09:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749202709; cv=none; b=LluaJreec/sAHpUBE8brJtYKm5vViV3i2aLmah698uTnsu/zRw35vqAi7pNx+xMN4aj2QC9YAu5pxl8Uy7h56ooBN+tFqUO1A+oscAiiYqvVh2CHYG9ZSXCS7GkMMADbm5Q4a8/dn06EiWSEYgSQoUoTg8Hk72MThe/vyAnLWWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749202709; c=relaxed/simple;
	bh=jZh8jvo3lyT78zBIAuub14qMFwnpBif3VNd4GueNpac=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=E+/bqGmMXrMkKr94DxNz5j6lmDu9TwEtN9hfu/tYGoaqe2akT4P3WcuK4u539Ml0VPVpBe9wCc4Nmvd2y34qbNoRyI249ecA9QUVUFyzRQx3oUJ2NhqxqWoDmhTAYmojA//20f3nkz4PqGQ2qYqphqS/o4it1NG0i2Z9aW9yZd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-313-PRaEmDnkPzqmcmHodWQZtA-1; Fri, 06 Jun 2025 05:38:24 -0400
X-MC-Unique: PRaEmDnkPzqmcmHodWQZtA-1
X-Mimecast-MFC-AGG-ID: PRaEmDnkPzqmcmHodWQZtA_1749202703
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4eb9c80deso912010f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 02:38:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749202703; x=1749807503;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=26Ry3YWNg+Xx3lprVa5lk9OAapvgIQNkgZHWX4BPEr0=;
        b=oct3kKUKRbvswxajZfF042lpt7XfwRnsPHTnO8zmYEl+KCQb33zW7Ct9FfbQCFYDFH
         MYgVR2KyzYBDgb8pQrOryfZHB2FSyNyJsgMJbmkcvCAdpJVWtph/CbAgw123QugcRIhP
         K326suBar9cw4Y0Eb5v2OH2IAzOeXAkYtyYKYuCRXI47+5G6JREkwU06wWbQz+SaNYGE
         JXokT563AxHmefLkel4O5QbqyuB4jkz7I0wx1L7RVN6+hZZUp2G1H2zha5EF1djczdvR
         agTdhMlUM51CwR2cB5V+bY0CSEG0me3Q1GyrmJJWbiw97YnnEJI4xSFBYGrRj/B1tTr4
         vAwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhofjs+BPOkNU5jXEvvreJUYfGAHnSmmI4MAyi/fAWDgiAdQBGSVGFr9DoW8k3vRRuHez0MqRY4fT0E+s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHr/nH6vhUyezHrSM41AcVNvDAwtFe2n7nnq6XDTkuGx2+tWDX
	7R2B9ilR4tfUKPugnCCNfaR3Ju9bDM1CAP3+aBRJmSuIDxAej/CYqQlx1a8uAli2jtY1Egv9qxr
	p+j6K1XrQJK2lMMzfVFm/BxIm5JrGeZcTVUpdNAVcVP/S91RxMpsyjc6TSlhcqH7h1w==
X-Gm-Gg: ASbGncvpYB++aV5iSR2hjrXMIt++3bwknbC9G7rbVIJfE2LWx4eL4N04zsl/pvMBqzW
	hL5SxIP2YaqlBiDUsCHvJiHQdSU/B0pDmmdMAwuyyAqWs7WPucIdNSsooJPo8kUZtEsiOrLMxnN
	V922zxe3Lnk8ixNdoFqaVcyewp6ZGwAQMeABIPc1L43TzNTbIaJCQ06imyS0kFnPc3cEBh25WvV
	kO6Z1AW3O/E4k6FW51J4vVhOA525KJ0xPLfWYPNQHplO3RNRlzM8q6vdRmqvyJw8gePTgu9r1zG
	rO7GEaXJw5Ctg2+U3w7/YQYw9TFzS6+xazORDPfeUbBqY67iJ7AjKj6cGp4R6+7Ki8OtsVsXE8R
	hSiGr
X-Received: by 2002:a05:6000:240b:b0:3a4:f8fa:9c94 with SMTP id ffacd0b85a97d-3a531caa070mr2442146f8f.13.1749202703117;
        Fri, 06 Jun 2025 02:38:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2hgVVQ9Gk7GHogece0bM9/ZswNLeykZTGpNB8vcSGMUSbHrTwRCq1omPf2ID9eCFShi5YvA==
X-Received: by 2002:a05:6000:240b:b0:3a4:f8fa:9c94 with SMTP id ffacd0b85a97d-3a531caa070mr2442120f8f.13.1749202702694;
        Fri, 06 Jun 2025 02:38:22 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e056122sm15416265e9.6.2025.06.06.02.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 02:38:22 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Lukas Bulwahn <lbulwahn@redhat.com>, Sudeep Holla
 <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, Ulf
 Hansson <ulf.hansson@linaro.org>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas
 Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] pmdomain: arm: scmi_pm_domain: remove code clutter
In-Reply-To: <20250606090802.597504-1-lukas.bulwahn@redhat.com>
References: <20250606090802.597504-1-lukas.bulwahn@redhat.com>
Date: Fri, 06 Jun 2025 11:38:19 +0200
Message-ID: <8734cddxbo.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Lukas Bulwahn <lbulwahn@redhat.com> writes:

> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>
> There is no need to introduce the boolean power_on to select the constant
> value for state. Simply pass the value for state as argument. Just remove
> this code clutter.
>
> No functional change.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

