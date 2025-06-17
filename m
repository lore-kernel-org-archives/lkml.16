Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01572EF9A7
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 20:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750190626; cv=none; b=YvLpDRZnYYe56SHHCU5Jt+/QnBM2XFWyGTtiMvo2sMegDp/WyXFTpjRYg4KpzbXRg8pXCQyZd9Ju+rszmznLy0SKIPAgs3/NSqMHsBtpOaZuKg/OFQyAgvqaDwelEcVF1XA/7CbNjNCZKt38zOF6bTmwYHSeVnQ+VFpNarzq1zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750190626; c=relaxed/simple;
	bh=+SZWp0yWZXIEP9hozJgVkbTK7MVZxQPu1JyEvegG34Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BFMrCO1HwZF/9OS7LhRKXiRh5EnO1bzUxpE4HlQBBOmFV4Xe8d7yMSfjmUT9D0eRSPDZofHwtqPbL5+nQUDGmLiLJQfOcf7cFn7SxnKfMIDt6hNFYCyIbOJuaModBALAx5oYEgrVBAOWaZ2hM7gmPNeNyd/a8YtDkn3KcOB8j88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Av2mQ+76; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Av2mQ+76"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750190623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8324I6pJOAdXJVtS3tvokmcUAhG9rUL2oHwZTNfmFm8=;
	b=Av2mQ+76fEKrmvGOdJtNY9fPkCCD0LJs9+GS5px9DNWJL+KlC4msRbJ/o4V12vZZgCMVhi
	nthBku+06OigrlvOjUtQYsepaNyslKwdHDaP+FP+Xb4mXJU/e8+cTVVDQ/4nMIBiVmiBiw
	xOHapuGtVHOWqKi9BNP9Rpb1EbSnIbU=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-669-YFz9OF5bNQWgpDOTETEz4w-1; Tue, 17 Jun 2025 16:03:42 -0400
X-MC-Unique: YFz9OF5bNQWgpDOTETEz4w-1
X-Mimecast-MFC-AGG-ID: YFz9OF5bNQWgpDOTETEz4w_1750190622
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d22790afd2so960130985a.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 13:03:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750190622; x=1750795422;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8324I6pJOAdXJVtS3tvokmcUAhG9rUL2oHwZTNfmFm8=;
        b=VG480uc9PCBzxB5y/Cw9SkeaHnORRTyOQ7aaOMMSuSbnEvKyHObrd0q2zY+feE8r1K
         9hkez3gm4C032leCjDZK+s1jNu5hsI8kBMBODlA5L/D0/2895BSc6lUKl3wSBEKUB9wT
         FEe4U3gt8EvZxoGWhKKao6X7Xgw/tYd3zI7MHtpODpsaTXPRhdQqTsLk+snoHVTj9v3I
         rpmqoRuQiQdbseahYC7//KKtKeDbzqwgpPNOXwQBcw+vmreeyxWCJP3012HU9XrY4rGe
         Y4iB5Ex6yUt52Xjoqr2T7lpxh9/Nu7D8eJHSx4K9hcro1PCZvBGcJ3gOcFfoWa2/NXBa
         pDgg==
X-Forwarded-Encrypted: i=1; AJvYcCUwtz0ZzVqNaXPUCOK7IcOaMo5yIr/mJVG2w1opJHOSNjM980RWUsQi4KcJKAD8GFXu/A49lToWddizQlo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPhvkpspQaopPn9z5P9/3IUlhXQDpxuhu1ECH9Nr3eaxoW/2x3
	hPJdrAd4p3YC9q8wkEKwwNKlkmew6KJ++Tan0nh7mlNv9CKEN8unD9TUv0c80N0F8pEYZsjFHRZ
	L2XjiRiTxqA4MHMVbjBobSrqDYsfZ6gxRQJA32nOIKmTpqtXV0n6qZMWjzsCpAMcYqQ==
X-Gm-Gg: ASbGncvQMlu+8VwRfoAld9jUbtXgc1163tofGj2x1yXm1O4+E4ZgYfua4FboYSivu29
	/fxvHLW/kPTa7KGAjQe7w/5ZokFqYiEUuz1Kj1Uhh1p4Jr4nHgJIEdAjEOeVRJOJ7FJUgYNnnkG
	QGjCoMwAJRz5HmADcZXmLWOkcqA8s1wYH1bgbwL+shpCcdsBtt6Xsv45ruRzQr/zt+gvRbo9t2e
	eANtSPzJ6zO99+n11yy8kbAWH+eHB/wmYbG6CCXbYEUU4TcBOJBuRv66rXKmMPdpnrcRum6Z638
	67qvSlbNgna6BttboF9t7owhnEoriU2B3pVLcEklz8zPBA==
X-Received: by 2002:a05:620a:25d1:b0:7c5:cd94:adc with SMTP id af79cd13be357-7d3c6c1f5e7mr1993680285a.21.1750190621780;
        Tue, 17 Jun 2025 13:03:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0hO0kmJUNiG8VP+Z83zSUCQkaNcGSMd2Z9D69EwCHqPR9pgESyvh8M5fvF1+LPf7+Mr6DWw==
X-Received: by 2002:a05:620a:25d1:b0:7c5:cd94:adc with SMTP id af79cd13be357-7d3c6c1f5e7mr1993675285a.21.1750190621341;
        Tue, 17 Jun 2025 13:03:41 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8e28623sm687342985a.51.2025.06.17.13.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 13:03:40 -0700 (PDT)
Date: Tue, 17 Jun 2025 16:03:38 -0400
From: Brian Masney <bmasney@redhat.com>
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, linux@armlinux.org.uk,
	linux-clk@vger.kernel.org, devarsht@ti.com,
	linux-kernel@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH] clk: Add clk_determine_rate function call
Message-ID: <aFHKGvHlXP-cdC7d@x1>
References: <20250616103527.509999-1-j-choudhary@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616103527.509999-1-j-choudhary@ti.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Mon, Jun 16, 2025 at 04:05:27PM +0530, Jayesh Choudhary wrote:
> Add a function to determine if a particular rate can be set for a clock
> with its argument being the clock and the desired rate so that it could
> be exposed to other peripherals.
> For example, the display controllers typically has to perform multiple
> checks for supported display resolutions including those related to
> clock rates. The controller has to check this way before it actually
> enables the clock and has to do it multiple times (typically for each
> mode), and therefore using the clk_set_rate when its not needed, does
> not make sense.
> 
> The driver does have "__clk_determine_rate()" but this cannot be used
> by other subsystems because of the function arguments used.
> "clk_hw" is not accessible to other peripherals due to clk and clk_core
> structure definition in driver instead of include file, so we cannot use
> already exisiting "__clk_determine_rate()" in other drivers.
> 
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>

Do you have a link to how this will be used within the DRM subsystem? If
not, could you post a new series to include the user of this new API so
that we can see specifically how it will be used.

Thanks,

Brian

