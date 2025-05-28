Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79B722F775
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 23:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748474586; cv=none; b=WBGUj6eQ1BcdARnnkSQCn2bqZWD8IX7IRj6y97Xq8IqWGLdx7Da5dXfGc4whXepDzEfIhqZhI9qm12LEJmkfb+hc7McKCt/Rh6j9MtGGaEdb3OzJ4zilhC274SLO2y3nLEXLgZU4wyVlysolkvKVyItmUwqdMPYVmQyZYNYJ3Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748474586; c=relaxed/simple;
	bh=p3cS7ziZxA7eWl6AkFDcQeO1xTNZ1j8LYv7CxtgwRMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sygQ4n00s2b1IAHuca01FPhGI9lPw/Fgdokv+YnPm+3ahXu1HzME5hwxuloZ32YCzeEyLFSUmMbs97K8ySCJK/gL/9Wwh98+NGv9rCAvEZuk+jF3i6TrNTAlPO/9VGCHuP+K9hT6RCsih3ArqW/Vg4uQBUWy70UXR/g5AxDreec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Kt+j9N6H; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Kt+j9N6H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748474583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p3cS7ziZxA7eWl6AkFDcQeO1xTNZ1j8LYv7CxtgwRMQ=;
	b=Kt+j9N6HQt17GTPGaOHkbojNdJCh70XdH95zE/QEDRtFHl6Nn6fYHj6Rp5erNHe8Yu5hC4
	2Am6UjutlJ/p6ckvC1U1dXpicBKUmLN4JM7P7CXkXhV/uYbW+zUcVwyKBDkZCqlZsJYyU3
	EQW4ihWuE34STqOb/3GU4OcVKwKfsAs=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-64-AeuF1KvANw25_B7tRFL08w-1; Wed, 28 May 2025 19:23:02 -0400
X-MC-Unique: AeuF1KvANw25_B7tRFL08w-1
X-Mimecast-MFC-AGG-ID: AeuF1KvANw25_B7tRFL08w_1748474582
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4769a1db721so6555341cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 16:23:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748474582; x=1749079382;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p3cS7ziZxA7eWl6AkFDcQeO1xTNZ1j8LYv7CxtgwRMQ=;
        b=DbMo8k2aNCWipeZ0OlxaBw7cAuKcRsWUvPRMXVEiNEerOa4qDWkflN3izfXQyDpBjH
         q5RfnxUM+Y/u072RXUZpoZqOJUTfRc0fSWqUFJh55oT7U9Tq5VnawBmm+jJbn+r+kFBe
         C8cOLEiIKYVcJRfodXfmOS8irjLdrpjbNGve9xCfG28kkYRdtcuiwiGQ+tc24hNddQ/L
         dXIB1oqDMSoWijKFaqbEeTWiZ0e9JkFH5yiiIu6dCjhSRdjUpfmtkqGx4iRbIBBqMlpc
         /bOAAAc9NWxpXN2pB8pjVAqPQh+ck3K5MdsFwD2RBG+Q9ukMOHt1FCTzaSXxoqP3hyo8
         Mxew==
X-Forwarded-Encrypted: i=1; AJvYcCXwP7EF4cfJi46O1S7hK6y+pLuAe+c22+Gu8Kwzc5SegYGJ5at+xMBb1VUyHkK7C/fckA+NtyAltRzIKlQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqrIblNXeoHKwLEaBIlnYzFMC321kMJrvinxXkEsv8+61vtHxs
	KyoOUotCRAloQZUa08jzGpxctVFytzEmy6e8dschikbhyUQJg/DEob4ezShdByhTVdAnufyCqEX
	DjYqPyhBLi/HklL2qu2jFgh5jGp6mhbUMWxCC/f5peh9N/ol1Sx8uhdt9tsUpnM/4Gw==
X-Gm-Gg: ASbGncvHpXQDiIkr9Q+O1dFMQblXhdjSi2e/kJGq5wPmSZ1u2sP1/tkZfWlh8LsQv1N
	NUzhTMIE9UMDgWEoY71JUMTvwU9BP9Plk1iwXf3EW+f6R2CM59WRoFT5LOW7NO5/KhvTOsOA0nx
	vpOVWWwfuFnVqHh/1MSW6UzG1difSZ1beevXkQ63AAMKpSL7MaNt7Ob75UR9QHMAgwh6n/0/ru4
	lKrCcbPp4Nw9BzuNVudm1SEt/MLWZgZxrBNicxftCEw3FjvooRSJKFsPWV5xuK70eQxOMV/dDZl
	jo+TeYG29DNpsb0H00+PE0X70w545Aq9T5k=
X-Received: by 2002:a05:622a:2591:b0:4a4:2c46:26a2 with SMTP id d75a77b69052e-4a42c46272dmr39923381cf.10.1748474581672;
        Wed, 28 May 2025 16:23:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxmHZfkjn5NZQNvu2eOxIy27NyirRpd6v7QkpaRHIVY/chEiuLRUJUD1UiqdL0oTpISgUIjQ==
X-Received: by 2002:a05:622a:2591:b0:4a4:2c46:26a2 with SMTP id d75a77b69052e-4a42c46272dmr39923091cf.10.1748474581307;
        Wed, 28 May 2025 16:23:01 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a435a37204sm886781cf.60.2025.05.28.16.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 16:23:00 -0700 (PDT)
Date: Wed, 28 May 2025 19:22:59 -0400
From: Brian Masney <bmasney@redhat.com>
To: sboyd@kernel.org, mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	mripard@redhat.com
Subject: Re: [PATCH 0/8] clk: test: add tests for inconsistencies and
 limitations in the framework
Message-ID: <aDea0w0hWl6yBVGa@x1>
References: <20250407131258.70638-1-bmasney@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407131258.70638-1-bmasney@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Mon, Apr 07, 2025 at 09:12:50AM -0400, Brian Masney wrote:
> Here's a series that introduces some clock provider kunit tests. These
> tests are centered around inconsistencies and limitations in the clock
> framework that may lead to some clocks unknowingly changing rates during
> a rate change of their siblings.

I posted a v2 of this series with a new title for the cover letter. This
combines another series related to fixing an issue in the clk core.

https://lore.kernel.org/lkml/20250528-clk-wip-v2-v2-0-0d2c2f220442@redhat.com/T/#t

Brian

