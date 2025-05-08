Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB0F29A1
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 00:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746664132; cv=none; b=OY1JmzU+/BMSwN2KW+B+yE9bigBvaIHzSdC+LFq/5EfXGhve+HRQqWlfSy83weZYm+vtAAl0df1T1DJdhX7lH4u3wOnSkOtzSJloha7phBh1w1/m6SQWx4+2D+0jp8VqH01vIj2x+TRiJrqORw1Ekucb1JlWSAN5nbQQo4vXyRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746664132; c=relaxed/simple;
	bh=Y07RstIIdvctXcvte/3/DiHgKlO8xbZ2zrIyQ+Rhzc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sGANkZGTdUhRgriOKdSsYEoFuavkjUfc+oL/u0dFVaFfhyUSBvBHdtPt+g7H4ltAnuHr7woWLb1jPGzyEGv1ZkEbzgngr5MFnChOagBbyXBioaIrxoh/T/AuUJ9Bbi2hsHa5BzsxEmwO+dmBnPPYv1Y3RVNkFwMfZV481E5Y/7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=IzuUtQV2; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="IzuUtQV2"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b03bc416962so235863a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 17:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1746664130; x=1747268930; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rS+U0/mqHWG5lfLT69s9lUlVJUsqGvVjuXAMIKBkTLc=;
        b=IzuUtQV2D+KvusyTsCg0RRjiH0oymygHK5REhctS2DwK04dlM2Fgx+XBSygC2sv40x
         egW/f9gQncUtse0uXP94engJshUcOm1rmPf8CDr0LUkPFoZXI7ewTFAxXiYU85fIGpw9
         BfhKeyi0Vax7IkttGLb4Gd9QUwgCw5rlZb6sEUZrCq3NomImz3Nlq56syCLLetTgcaJk
         lmB93oYOjBd9lN4VF95G4HzD27nRwzs8PGFNnfmatHDkCYNW4GDb/vDfoTUQXSwWScbw
         t1KGn3hq73SqhQHmeeDt0K7Zgn/TnFYTvSmVfVIKwUWixzP6Ym8NWYHustxsueoflREm
         0w6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746664130; x=1747268930;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rS+U0/mqHWG5lfLT69s9lUlVJUsqGvVjuXAMIKBkTLc=;
        b=NgbKWL5dfErF8ShLhIpOuHfZbkrMKH0UlbubB+qcwVtNSR7639LvG58OMlOmqraxCz
         jn5CdZ4LClQZ6TJxlib0olOzmuRggfW3M71pOEsqvpQqJGszOtA+sUSxE6Z4h9FBfeal
         lXCBa0VZGfXoQCLWBb/qWvxRqdXCsYFdDNfbeE6UCiNYU+yNgdc3jlp68naS3ibhBKTV
         mLl1e8tf4bEmLFZi9RYce0oG2WgYs/L5lQGnkMu4UOhpyhCfx8VGJydGabPVg7qTdAeX
         6nXSxVtH9+JlaIQBuFrjFmGkJltV5EnNwm+gD5ildNe3W8MuCs4GDHFxk7s9Ky9qTKdG
         9APg==
X-Forwarded-Encrypted: i=1; AJvYcCVrioGjBjqs7XsHR0wHJVFNSXrNi6hEETKfF1THDlP2D/ErRGU5VhE4DPShnGznpLg03g/+43WjcUuUtHs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzrhw/TJq46qS6/1G9xxGwQhRKqlnoF2i0WbuaaUv9zHlXvVoc
	PAgcMKJJtLX6TGFPU29yRxfYgxapddKoQhUt9nfjRn6aiAGBijZ11dXCNWXBuv8=
X-Gm-Gg: ASbGncsgpHVESlmQ/NGdRcVOaeBgL01JvMMqI9zcNODs7YlvKdDxN8WpKUySrQ/eEcn
	DHOqncV2RUjasovRutdpYLP/9jAAFWNNq2bcuxUg/hbq4Yr6nUQMneg8ZtYz08IcKp3RHLblX26
	F9G6mndHhw492X67PtUi5wkl+9j6v7DTlNjfN0lx1STSfNrlWoO4ol0lcxMg3XuBNRTZUN0FiyS
	Moe+48Qey5p2WQwqUE27VIYrq0krAG9rLtzpwaqSNQ51Fzh2tGW6271X3G9A3YB9z1+SOcpNJe4
	GJ4bry0vgvjanJXTTCld9BggQG/U2Yp6giePkUxXmRhN/V0=
X-Google-Smtp-Source: AGHT+IFq0W9eeoSq5bUfXHKxOZPIOOgjmxfCPv6cQ0U1CNtWqAfBDIHNsC+ZooZnSpv7K8wTVnRshg==
X-Received: by 2002:a17:90b:4c88:b0:2ff:796b:4d05 with SMTP id 98e67ed59e1d1-30aac19c279mr8525757a91.11.1746664129934;
        Wed, 07 May 2025 17:28:49 -0700 (PDT)
Received: from x1 (97-120-122-6.ptld.qwest.net. [97.120.122.6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30ad474a05bsm900814a91.2.2025.05.07.17.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 17:28:49 -0700 (PDT)
Date: Wed, 7 May 2025 17:28:47 -0700
From: Drew Fustini <drew@pdp7.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: Add thead clk tree to linux-next
Message-ID: <aBv6v5mVX3ofsRyG@x1>
References: <aBvsGRZqbz11HPwM@x1>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBvsGRZqbz11HPwM@x1>

On Wed, May 07, 2025 at 04:26:17PM -0700, Drew Fustini wrote:
> Hi Stephen,
> 
> I'm the maintainer of T-Head SoCs like the TH1520 and I've just created
> new branches for T-Head clk patches. Please add these to linux-next:
> 
> thead-clk-fixes git https://github.com/pdp7/linux.git#thead-clk-fixes
> thead-clk for-next git https://github.com/pdp7/linux.git#thead-clk-for-next

Apologies for typo 'thead-clk for-next'. Please use this:

thead-clk-fixes git https://github.com/pdp7/linux.git#thead-clk-fixes
thead-clk-for-next git https://github.com/pdp7/linux.git#thead-clk-for-next

Thanks,
Drew
