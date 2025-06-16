Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C7A267721
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 15:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750089006; cv=none; b=OPZL0JFPSyCGGQhceLzJ5j3TT9lwMWMhqrUyIM7Thz9RYvsNh2/2PtoFbftwPXONTIuJnawRWQYZwHw3BR5EvgrHhythIQ+bWzYAZpQP7gqTo58g8pk4423ChmMeo9Oalhh8r2wEtm9UggNGQBMpXGB0HonzhH/e2jIS8XDfCd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750089006; c=relaxed/simple;
	bh=qob5NJ8G5c6QzGmBfprP/lA7j97XJ9zNuEiloSsBDvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lvyKdEdMvvcEn3HzofvA77obah3i08jXcUSRi4YQfxe52OjyOPSQlb23ZuDJE7C7MovroPseC4lgpUcIKeRlkIn7HqqF63HWCTK6NWhfovbIZYZJcMpi3igFq+dpK9510QXBqI9WgmnxeVfEXX71KokopebHR+j1cTnnNio8ai8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b=FkEL7YfA; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b="FkEL7YfA"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-450cfb79177so28755295e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 08:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20230601.gappssmtp.com; s=20230601; t=1750089003; x=1750693803; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+HG07yhDdt92251lTiG8gm/91c+HEf0mdiuFjonzF6Y=;
        b=FkEL7YfAb9m+0CijchWGHD1+f93zOBfmNtpruELi6g5lE5Qq8SORF/+GLUYR0tVhdB
         tWjE4IawaQjOrCJmwxVJIRrF0Nf7vyZrUmpOTmX0kPto28y/kbOuRwt74AR7JKXqJgbV
         H4mclPjAJDXReqqoktoVDlNaKKVZjkhr5+Wjyo/GhfS6XBYndMWkKz8JU/A3QiO6t1PM
         /yl9wOEQTfCEwOTFnLPIpKGGIc6w8Jn8c6DEttCmiBTD+i2nxz0ETILGQJDFFMYHbX0b
         +Yz17pjKFsCacEzttZNzIw460mekcWbXGej2kp4LeTkXW3fGufdfjevEYaBU8RGW06ke
         FM9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750089003; x=1750693803;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+HG07yhDdt92251lTiG8gm/91c+HEf0mdiuFjonzF6Y=;
        b=AMEoYMmnvv8kz0ukWFGhGXg2rNF57SjhGTayQ1QjSkgMnbFcmA/9g3LRM7t9/8OSvb
         bnJpFL4hj1zts1N3eagWnbE/eKiJsbFayVLKocm+gFkbUYaJRpmCTgcqOaIfGsl/1VZV
         Kvvc23p14enyDJeRkZE5mZaxbRIcJyIKYM44X5uuwuPZVBb/v+83Wh9cB1WLEzLXWv9n
         nBG5vp3go7IRHb0dlkHuxP7E87spcMtvKky47mlbpWx4B7BqlcGRUI6jUB18g02c2JI8
         9WY9Xuh2mkb72FBj8Zd778ZlZ8Gs1TNR9xnRMdcQ6WivdIt0YsiZ8GJCBMSx0NEhQNFv
         G+xA==
X-Forwarded-Encrypted: i=1; AJvYcCUSmmSUXxFquMJLoCdske/6zJ8n+EGli0ta503J6/42ofVCVpPjN9nmIXeQ0Pc8VraMzjWYdLAO57RlLUs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdJpY94z7duuULMhMFljdal6s8Ct2nUytEtu1jC1OjD5tmKWko
	Cidk4VzTDObuzW4cQ+ad7ksD85gOMjN1tE/ta3QnI1/N4tAIubT/1dkYnxC8gwaa0sE=
X-Gm-Gg: ASbGncsedRDEgGJwxtY1+XBal80GdpoRDPQpZUalkNo/Pl7SVsaC8PqvHWP7KF60B38
	J/NanODc1ntNVLERXYsPwR0M8XMXUfsYXd8frI2w5lyQUswxwyjA7ErLeXb629DRyzcS9FdsVSi
	o25tSGFLBkblHi5+p0d+2Sb7NTJ7zWJYLDifF+HctH8XY60Dwc6uHwdZ1b/RD3XDWani5MHJFZv
	t+bywepEbsGtRqW4LqxJaHNGWUFnoH4FNjD8AlPE9/1MN4p8bd/Dd0/++qhIfek1AeR0tyYEOmf
	1UuiitrQR7iiXjc54jreh6TAgonGtMw7hPJ5b3zMNCMElb3h7f+5K35QCxlGpkorXds=
X-Google-Smtp-Source: AGHT+IH0ZJ7gpp+bLXTmZH0utmqDobsB3MfjlLY8LYiad1AFTLXWZpdDhWNjYJrUzP1yR5mvXiTn3w==
X-Received: by 2002:a05:600c:1f94:b0:450:d019:263 with SMTP id 5b1f17b1804b1-4533cad3c9cmr103710705e9.18.1750089002809;
        Mon, 16 Jun 2025 08:50:02 -0700 (PDT)
Received: from MacBook-Air.local ([5.100.243.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b70d77sm11543216f8f.94.2025.06.16.08.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 08:50:02 -0700 (PDT)
Date: Mon, 16 Jun 2025 18:49:59 +0300
From: Joe Damato <joe@dama.to>
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: pabeni@redhat.com, kuba@kernel.org, jeroendb@google.com,
	hramamurthy@google.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, netdev@vger.kernel.org, almasrymina@google.com,
	bcf@google.com, linux-kernel@vger.kernel.org, ziweixiao@google.com,
	joshwash@google.com, willemb@google.com, pkaligineedi@google.com
Subject: Re: [PATCH 1/2] gve: Fix various typos and improve code comments
Message-ID: <aFA9J6-6Kj3LcQL8@MacBook-Air.local>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Alok Tiwari <alok.a.tiwari@oracle.com>, pabeni@redhat.com,
	kuba@kernel.org, jeroendb@google.com, hramamurthy@google.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	netdev@vger.kernel.org, almasrymina@google.com, bcf@google.com,
	linux-kernel@vger.kernel.org, ziweixiao@google.com,
	joshwash@google.com, willemb@google.com, pkaligineedi@google.com
References: <20250616054504.1644770-1-alok.a.tiwari@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616054504.1644770-1-alok.a.tiwari@oracle.com>

On Sun, Jun 15, 2025 at 10:45:00PM -0700, Alok Tiwari wrote:
> - Correct spelling and improves the clarity of comments
>    "confiugration" -> "configuration"
>    "spilt" -> "split"
>    "It if is 0" -> "If it is 0"
>    "DQ" -> "DQO" (correct abbreviation)
> - Clarify BIT(0) flag usage in gve_get_priv_flags()
> - Replaced hardcoded array size with GVE_NUM_PTYPES
>   for clarity and maintainability.

Subject line should target the tree ("net-next") and it's helpful to include
the base-commit (git format-patch --base=auto). Since this series is two
patches you should probably include a short cover letter.

That said, the changes seem reasonable so when you resubmit you can add my:

Reviewed-by: Joe Damato <joe@dama.to>
