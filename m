Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F969433C8;
	Tue, 13 May 2025 18:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747161220; cv=none; b=jEVjQH78AjK4vCGdPIrXQUOi7YEo6ggz6hRA3KCQnN/ptyM4Xt+W1zgZWtv6P3ySD8rO9oLea1TvJrq3azlcrdKYU82gl0HUI4p7/eY576+h9PgKiRBApUwR1TLhmk0WIhrFQ+FxEcFa068JbS530wIs2McOkiWg/h8mmIUKlY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747161220; c=relaxed/simple;
	bh=pCNjvJNNIpDcdyWqKg9PC8JJsReIlWaCZWdgKkbgFMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ktGs5TyD57VTev0blgXsWR13RFxHk1T7B6nvER5pNYiKjpXOqr7H+ZMFqvx1et68DUCCcgqe8MClLkKK+C5BTxAr3UHwNjFtRlq1nNDIGnDJs0Y0IK5zyZFoCmWOX9yYjV+iHQY5vCfx/AUnM6DI/fHCnsj5rnWTRUPh8nWQVGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BOxVvYNJ; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BOxVvYNJ"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ad221e3e5a2so705922266b.1;
        Tue, 13 May 2025 11:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747161217; x=1747766017; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JfDa9t4hEIBTyss+7mzoHYQVAYN390QGITj9KuYaQKs=;
        b=BOxVvYNJNwCTzFCb9dCXea056u1wAdcFVwKLh1VXTiGQlT0jo4LWNe4ASsoarCCx36
         WARiiy1u3GgvmcGuz5DKiWEfT2afVCvM2QWRlfdqJbrB3xsJSTaQ9IAmpCR5vb2h1rqz
         jKvv2XsD8t9bWw3/w3yxnmspfmvDkYKqppKWJxjh7SlsSK72nFwLKxNrOtfiTmOlmvUG
         luLGOxxNWJ+0DOVvBk7TcfLosiaLEnqoJ1/lk5yjIWdlSuor3I68OVMkki/gD8UhCAOG
         Gm5xe2zoBjdTt+9bg31vYJ/hbsylCP4t6TK/HFnxfuJctSOWivNjGGP1F+h9AGm8uZRe
         kBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747161217; x=1747766017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JfDa9t4hEIBTyss+7mzoHYQVAYN390QGITj9KuYaQKs=;
        b=M+H4BS6Wi/SOGJwSMq3WO5GK5LBIoFbFLon2R/a/IOFaYbxLobbOyeABxvf8WdUKSB
         UN75wRothgcjp7UA81HfYYEuvbBnepXsifYKOKjz6dEYytp6c7V+WcshvSiW7OXM3O0i
         yYLy7X+8g3WPIMf+7rwD4VJUYeN/C1G4mzauS2dAHFdnJsmfiDqKqBJl3fW56WsbUXWd
         HfChrAqylQV0fvRtg2/+addvIjBYFclRPm8Kip2tcrYy2hVHtFuKwGiv7m15pZIo3YTd
         CPbaAlg07dCdKXKRUMgM7Oq+24QSmFvQCo5Ah63y5NaKsyaPyBgCm/cnqJPi276wAepV
         Hrsg==
X-Forwarded-Encrypted: i=1; AJvYcCW0FDL71PQ9oqn0IhaFYlJf/cnEwSVPnmx5ADeGUaMULDppP2HnzqS0j7nKLmiwPpkq4oABbza0EbAq@vger.kernel.org, AJvYcCWh6r2P4nEZN7j2aiFRL3rnmMXiB4RFbOupHZF1v423wNz6nnkVncgcoOIr5PoTknmeIjwdQ/FpkIxrL/w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwULQdjTNYpRt+ZN6Oz89mlVIcGVmg6CmDuF2jYIl3O0fz10WdN
	nG4WoMsBFky1VOIZ2BTBqvA1ZI8sBDu4djpVnYmi4h4GlkKBFrg=
X-Gm-Gg: ASbGncskIYg8TVFugyL3h5+7uV80z8sS4RtgnV2NCWOH/LapfTUqeMUqmocM3GEvto6
	pl5vkZ5vrVOv1mnyaRWKvJr+4EVGYVOft2k/fnaNJbzMJntO7w/vTds83Ae40H2nyW+8hIRzsLU
	1/7dViqEZVJoWzbd6YPwuUNKPnfh+PWskDiEo+sYsowS5s7Oa0dBcFiEx9vthjzPiQr6ylmdtyY
	nigv3oL6YoCIGWr7VWyPdrnBWR6sOjtzKcIWbRXzWkqM8ApGSu1acs5q2LczcZsGO3nEOKWJdfB
	YBfrFMPfgd/w8a++B67ytZZu3ioXhaY/U82OqQ==
X-Google-Smtp-Source: AGHT+IE9OrPBNnHUSy6rPAxXm7QZ08ZqjnOSuQwzNArV7PbI3vT0P6NOybGASVf/yDMkUvfSxl5fhw==
X-Received: by 2002:a17:907:6a0f:b0:ad2:1cba:cf84 with SMTP id a640c23a62f3a-ad4f727081emr48477266b.39.1747161216449;
        Tue, 13 May 2025 11:33:36 -0700 (PDT)
Received: from p183 ([46.53.251.33])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad219746730sm828452366b.94.2025.05.13.11.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 11:33:36 -0700 (PDT)
Date: Tue, 13 May 2025 21:33:34 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/9] CodingStyle: make Documentation/CodingStyle into
 symlink
Message-ID: <0e43117a-d92c-4563-ad2d-de6cbd02e986@p183>
References: <20250509203430.3448-1-adobriyan@gmail.com>
 <87frhcsrva.fsf@trenco.lwn.net>
 <77f03295-df5d-4bc0-9a61-5be829969662@p183>
 <20250513041249.GF2023217@ZenIV>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250513041249.GF2023217@ZenIV>

On Tue, May 13, 2025 at 05:12:49AM +0100, Al Viro wrote:
> On Mon, May 12, 2025 at 07:08:53PM +0300, Alexey Dobriyan wrote:
> 
> > I split them like referendum ballots to see where the consensus at and
> > not have big single discussion thread.
> 
> Just in case - consensus would look like a lot of replies in support and not
> simply the lack of replies, right?

Well, it is l-k, so absence of NAKs counts as OK.
