Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA73201269;
	Thu, 19 Jun 2025 16:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750351881; cv=none; b=iYmaaSkgYT279aWu3sXcKEptXnuNsMbwx1Zg91+e7SY3kphKcFahf/etXbM1ivGAoGVImtkprSASq2HSs6qi9qhP5MdRUEBEld/h7nx3+Z0biTrawgkl4A8LMmSeRcZ69zJ666poP6ENDtYj79osOs2TrQkCkK5CLSPiBA3st9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750351881; c=relaxed/simple;
	bh=RM0Mjk8bYCBo2Yc8z9uWxE5C4u3frma1Kq1U/5aN4EQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T+v0AouMoe30SfwX9cfiawSpPRrV2AQABxsfKnet8oZTmehzMrgqhmZk+QUfYssZZcewQpOHrNiXFo6Z00lXbAkJCJ4UWWjCVpu7A1PsFKwSkaz/DH83+ctTFbIfC1W4WJdLBmk9PWYGdHG1+pt9Zs8GbR+/+JBuc9iUHL/d21s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HnI5rWXb; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HnI5rWXb"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-23636167afeso9774465ad.3;
        Thu, 19 Jun 2025 09:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750351879; x=1750956679; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jmnv5cP3oQqRhPxYaKn3W5dFHRZevjSzcip+b6HwYw4=;
        b=HnI5rWXbmqHhUqFlLUpEmlx63xwt2Z3537dZJZ6tI1KXVFLoElyqkW63oWg+srQYg/
         bJRGIkKcGK0pNYrlL03MupHnh+5L9dvCO5d5FuITjT9OmNIe2ZhAOUkB0NhWkzQm6pwO
         UZ0xZvrAxV6KKmwiGvb+mlTLJGdBOHe7DQdhk2O17dZQoxAVxJH8bk1l14MeJnQSkMim
         z1HSQsaIcpKqIWykRRk7tM+t20FGl1GA0YxCca6QE8XcOF5cgSDFKdm1ycXxE2tXUdAM
         jPRk6nNP8JaAAzUrySXbX71pCGpLjP7SyPH2xVdd2ygNoN/L3TttE4dj8S+E1bj6n8mO
         SFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750351879; x=1750956679;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jmnv5cP3oQqRhPxYaKn3W5dFHRZevjSzcip+b6HwYw4=;
        b=V3egN21AiR0UJLUvS+PKQ/y/LkN0G3P/+eF4HN6+3ydmvD6/I9hghjWmpyJUMtE5i5
         bCZuoB0miD2wl8wDSAtm7HU0y7oeMcl0Qbctgyb2+XBfaY9X+7A9/SzRhi3GynA1B+/j
         BF1yzUPc+bZnnKJSpt/rx3p6EX24zyo8uvh5IKAZVTi6/ZEGCh5OQFhskeWvHqkGODXD
         mpjkaEPdX0JqYIcKEG7phau6x6GWaZE9lykwgBXb0ze4hLwEhTOCt/+bqPRIaKZ8ll1t
         f/isuRlNEhhB5IKfhgchngXfGrPvOlCHiJxCiv1ib4FU+/FzmA6Gh3qq4iqpWrQAxf3h
         lg4g==
X-Forwarded-Encrypted: i=1; AJvYcCXL5l5UbeX2CEI6waxBQ5JpMjl0c7oqGbNC8EEHvMCiIBFVvqOVlYFNx3nC/8qnZ7dzUZcsyWk7G/V9Hp8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqtgX+r6XjJb4BHEVcV1K07sN3AfgtsODMNU02ZktFRfClSqur
	SMW1VssAXmbnoBTtiTNwaJcyBJK7kffK6yXqQg61T8M2R2WJLoGzMNgE
X-Gm-Gg: ASbGncuvZN2nTYmZ9GN1cluHnRp/iT9TIVVEmSugg1P0JySodLORr2TN3k3gdsNwInF
	iqyB+MohIuB8KXz4O3l+kIsJE0Y1/uhfSaX5tW/7IdTnE+y7s9RXaT2NtDFNEmxfdz9mRYixSvW
	xsRwumYviQoA9EVwgPMMOW+dD9ORt5OTrgkzT8ni+DvcuU0S6O0ZLTdd6xdyOCPxLYdoL5AX2tY
	8hqiPHVat1ZSX1lCZ+kG+3YpqKLX4xV/F1h/20KQ8tfGR7X02QltjL9K3vGUFN9fzSO9WGxt+BL
	ztghRkLqLjwDrCe62N6p8dzUJYLj9b1aAs6CaS7HgkzKN67eLMICn+peTxPwHpXIHygaJRoZqOQ
	=
X-Google-Smtp-Source: AGHT+IHUvbvS8YmPbmobytBtwxKkvYC2HspZUfeKctdiW1aoctoZJ6ByDeqtc/6MlBe9aCYm58lkLw==
X-Received: by 2002:a17:902:f683:b0:232:59b:58fe with SMTP id d9443c01a7336-2366b3169f9mr340353835ad.1.1750351879358;
        Thu, 19 Jun 2025 09:51:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d75413cfsm384545ad.253.2025.06.19.09.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 09:51:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 19 Jun 2025 09:51:17 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Marius Zachmann <mail@mariuszachmann.de>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	jdelvare@suse.com,
	syzbot+3bbbade4e1a7ab45ca3b@syzkaller.appspotmail.com
Subject: Re: [PATCH] hwmon: (corsair-cpro) Validate the size of the received
 input buffer
Message-ID: <ffdbf2c2-81a2-4165-b37f-f89a0f90afd0@roeck-us.net>
References: <20250619132817.39764-5-mail@mariuszachmann.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619132817.39764-5-mail@mariuszachmann.de>

On Thu, Jun 19, 2025 at 03:27:47PM +0200, Marius Zachmann wrote:
> Add buffer_recv_size to store the size of the received bytes.
> Validate buffer_recv_size in send_usb_cmd().
> 
> Reported-by: syzbot+3bbbade4e1a7ab45ca3b@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/linux-hwmon/61233ba1-e5ad-4d7a-ba31-3b5d0adcffcc@roeck-us.net
> Fixes: 40c3a4454225 ("hwmon: add Corsair Commander Pro driver")
> Signed-off-by: Marius Zachmann <mail@mariuszachmann.de>

Applied.

Thanks,
Guenter
