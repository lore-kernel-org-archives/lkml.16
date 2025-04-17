Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888D12517A7
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 14:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744901554; cv=none; b=OpMYD+5mvr1yLPjPRUQNtuqkJFK55fzwiUAVWsR8JJnX6TMCmtJw7D3WnQCr00KqG5l0F9U0gsR2bCrMjX5pG+pywzxvqgPPgRVZNXGG2pLeS4YvvklTc1ZvdVlw7ohycnL8eM3W6THNqyBZ+pe59r7m1fcgIvS2NvZkQhGkem4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744901554; c=relaxed/simple;
	bh=C0ii3df6urNS96a7DeEXtF7upeoeedD2PihrrtmFsI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S41b5ko/N4hYJzij3mEzCzUjDW+THECQuwIlM3/VLKE59yeZADaW12oH+1cTJh/DsgB3DVX8L0d2Slnm0FF9c2FTIhw/fFyVr0zZz1cim9f3uBBF98a3hJWZmVzQO6BhQMuWBRaRpSHK7CsaS1RXGmziQ9T83gq7gNxVc27Qgi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=HTOV9jk8; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="HTOV9jk8"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4774d68c670so12277351cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1744901551; x=1745506351; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cNdlL3P+kB6sb+uZFj+Sde9hgZanWGCpbxTUw3Vgows=;
        b=HTOV9jk8mMaieAnUrzOEvJKeHfaESJ+Hw9RUtomS1Q8g3KU34xFrO08/BqyE55fegy
         IwTWsvsDOSDABBpv4gCixQinLOMAA5B+zrwCw8/jOauyToycwLRrCvm5rnKodgR/PSaJ
         iWnXuBeaEP9BUC9oE5SbY1U/nGIq3i913KW/X4cbJ7mYV3HNKk0ICS8pBAD7x3hzV6Ar
         xc7i/YSOdYsVXaF7YzR4xlSSamAtz5f2u6+xoeebNyg3ueOGdEhA2NEvrwUJbkCoLMER
         4ODwme264l0BCym33Qr35pWzHcmCi3g/zQYrK0aghOWbfPC1UeEeMNYU9bmqnIFaV/Up
         mz7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744901551; x=1745506351;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cNdlL3P+kB6sb+uZFj+Sde9hgZanWGCpbxTUw3Vgows=;
        b=rm/MJ5AUaivnpBbpJcC00tf3jX5JLncbFBnDzOJOh8QW5jUr5xXYoIxbbfTiZ3uW2B
         0Ez1rEMLandHPH06V1uuvYfT92I0G6cqgWb0GV8W9q8M52OZeG+uk38VAaXzgX7Gsg5O
         8y11fk8CMY6JMPxOTQ7sUuaCqks4WrkpZwOeHqZDfjk/ffrJ0BckvlaGpNerSKzXolEx
         xotCiP6UK07gjDe6f+KcIyHplaXxX2QnpQt7c/75arnB4YtdVJT8P9mAhWd+kwn00m1w
         h4JjLZBLZTIfv8tCeggslMCBxHANgWTrY4tLozZKRP13HTTZ06hGbSBC7W+OLqQ1Syk9
         6r9g==
X-Forwarded-Encrypted: i=1; AJvYcCUmylsZ6aSURKLWW29ERLAGK+RyDLVLUURe2MbikMl2L2Xc5RI713UQSuUJlZunGtxaQ88gh90yyDEdCKo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvGw62UU8DzZ/nkfPR2mfPTX3j6e3e6gk5YHWABlN204qPd70t
	tsm6U5ciirxcmx30+NAhX/4EBtmUIXxod8ZVw6jELf19j8soz1vWf1mM0JKbqxY=
X-Gm-Gg: ASbGnctVvE4sqOpuE+MyD4OSIIow1dQnqvqSEIPwTtczpptLn/EZ6jdWtPLgOJhX8v6
	jXihdYs+88VaKatvX46RHCnSHDEoCMk1KvP4nHxeKKwYeURjszzUY26gEaNEIWzUw/pkrbU4wdT
	7IPkti0/eWAcMlzftwLX6XYPCEqR6JliwbInhTeb+APVP9CvxovUqC6VudNAwLfp7faMsWPydJH
	aG611Day5bFbqZyN+rF+xPvvpXFgan7YhB/soKOk71+5vnFstohB3Z15X0qbTZ8/mHHR4U/HpaL
	eUrfQYkkY9Gn6JmXlK33dWWlnFCTsU5uYYaspNo=
X-Google-Smtp-Source: AGHT+IFoM28HUMMSsl9CsOqS/2wRZ/w4+IJS7bMDbtZm7rzCvcmmOo+0hBtEKG+MS4hlQt+J9+2Pfw==
X-Received: by 2002:a05:6214:410e:b0:6e8:f17e:e00d with SMTP id 6a1803df08f44-6f2b2f426d1mr89621206d6.14.1744901551363;
        Thu, 17 Apr 2025 07:52:31 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f0de98224asm127756826d6.65.2025.04.17.07.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 07:52:30 -0700 (PDT)
Date: Thu, 17 Apr 2025 10:52:29 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: mhocko@kernel.org, roman.gushchin@linux.dev, shakeel.butt@linux.dev,
	muchun.song@linux.dev, akpm@linux-foundation.org,
	david@fromorbit.com, zhengqi.arch@bytedance.com,
	yosry.ahmed@linux.dev, nphamcs@gmail.com, chengming.zhou@linux.dev,
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
	linux-mm@kvack.org, hamzamahfooz@linux.microsoft.com,
	apais@linux.microsoft.com
Subject: Re: [PATCH RFC 03/28] mm: workingset: use folio_lruvec() in
 workingset_refault()
Message-ID: <20250417145229.GF780688@cmpxchg.org>
References: <20250415024532.26632-1-songmuchun@bytedance.com>
 <20250415024532.26632-4-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415024532.26632-4-songmuchun@bytedance.com>

On Tue, Apr 15, 2025 at 10:45:07AM +0800, Muchun Song wrote:
> Use folio_lruvec() to simplify the code.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
