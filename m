Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D055221574;
	Wed, 28 May 2025 22:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748471112; cv=none; b=Kit9SVk/PKm9MFcdyN7OQKezB2eRHhq7wu4NMZnu8UZEgY/RIGBYoHXXFj8fDt33G8p4nzDA1egYNgFsUva1WWZex5jKldgodmIhxe6TtduhvyjYkaeXpNttJLvegYebEqnB9/eagCOunfTITUzlx23PXIB/YjN6N4+ckcvWbhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748471112; c=relaxed/simple;
	bh=NeXatPkVOJSPTjPkImsLQK/s5cx3CnEYMpHmeUmLOm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XaQkfDk6v2nssgnu9JPd6UQYK6pBqgKkgNwtlD3TDY1/y58VlcvlpXqjvn/THCHOXfUJ2eGs40ZQpk9OHUaICDkH/QyeMjc45DpCJJg7YkYsxlovHcdEVHfeiep8Kd+qMTCYWJp2xxNU9zb1TiKqw8eCCed9TS1V7M/eO+a2nSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eY8zGJ4U; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eY8zGJ4U"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7d0997d3ac7so19311685a.2;
        Wed, 28 May 2025 15:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748471110; x=1749075910; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NeXatPkVOJSPTjPkImsLQK/s5cx3CnEYMpHmeUmLOm0=;
        b=eY8zGJ4UziTxJRinyHHybROKfbUmYMF/BWLHOA4q5yC3BJEz4msj7kXgO935UE5gih
         1a48M2j8Ca/avRhbXKsPtQhjdHEjNVp03UMB8zH6qF1jZ9xcigRphL9g8CZ0OJT9TfsY
         rbHu2+chqbdmi65brjKjccB5xZp/QK4b5VK++j0C2hSEwuG8QAkzExjj1CJwRZIvjkVE
         V8V2z9ScajoKFPnTK8Q6zZH59pRhDpdKD1rJcAlc8ejj9wnuCCWRYU5VlYHmxifWkk9q
         jmDfSZzBSCUE3kX4WBebLu0O3DrERqjsLuRjYPYWzqHsZNftc/EtsgIacWnmaoBiSSke
         9gJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748471110; x=1749075910;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NeXatPkVOJSPTjPkImsLQK/s5cx3CnEYMpHmeUmLOm0=;
        b=iZ06WhJw4vq/vHc0Wdsg9zdZhH3eABQ8fuA7L6XDPQbQl5I97A77p1b1+jgcyuHSgV
         h2wXCMRQ6bWFSxv5F5T6H240mqZpTiuChKfddJ+AIiWNr52l7DZaf8jf2aJyhoKmpxrg
         90+/n60nUPZD5Ngg6wsZfJKtSDx85igJK0DQrtSLJpflhRFcO8XmUvlrcMDU3U82Cuj/
         dtutXpp7cW3QCOpX7sNF+G8r7/ZyOBCJiT/enO2CPKx1mmVCsO0P7APncDLUfhoisDqm
         PMrMcU6B1A3N0WTysmvnvKYIRWmcJUXxiMfQCukFzKlReG8XGHzUu8UMyenoprKASyhI
         G94A==
X-Forwarded-Encrypted: i=1; AJvYcCU3uCXU7s/XgtZYwFEEhLVcD5rfFHHdzCAobPgkIq7k+z1v+P5JPg7XG1+04t0wsArgogwvNXmznAsdyPs=@vger.kernel.org, AJvYcCXYKd4AfoCC0l7F6jHUnmS8p/jfJD/hXlcqoybMGdrAMNrdGIYnPr0K9Fha5JWD29p9/ZLAKn89XRCbIh6nDSk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ2NEsmQVFSjIGOzRIarsT9kTqmqUbPySQmCf5Htek5eRm0FU6
	OpFfZWqzadUAuIsw5CDe+15FeMvC0dQpsbNDryXXNzlIw4UsWYuytCq7
X-Gm-Gg: ASbGnctC8NCVEmj1hhIyRPktEKc9TmP+xk9SlWEQojdIuiYilZcv9fGFxZ6K3izogVH
	xwM1bXhiYyIUqjq6YiFlMd8CSwxVupuaSvEfvwqVbLyEu0qfou+gKfCLlZE3JOiFXW8NvsVr+fr
	A8W7Y5nM0byfffKzdpqZXOr+HauhkblnLeYh0Ew7sRvfbcsBfrLFO/vb855nA4hBLhl8y8IRLTf
	viBna6zUT74We1y38n/mtLD7NzhbadoCf9WBrAw9ufvIxMRp5xFkekgvbWXOij32lRBWdWaJYwn
	MiTY5lGMRK2IpVlvY3N3swKKSxYHFYEiq/51Wvd91cAH
X-Google-Smtp-Source: AGHT+IEJUBSsIaWe6phGuCUnqOqW9W60o2oxc8R894FCnR3z1Jh268Di5dKJ5+u2nneQJ3fPgG+X4Q==
X-Received: by 2002:a05:620a:4543:b0:7c9:6707:b466 with SMTP id af79cd13be357-7ceecba453emr2478084085a.11.1748471110392;
        Wed, 28 May 2025 15:25:10 -0700 (PDT)
Received: from arch-box ([2607:fea8:54de:2200::dd7])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a0f8df7sm8548785a.36.2025.05.28.15.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 15:25:09 -0700 (PDT)
Date: Wed, 28 May 2025 18:25:07 -0400
From: Albin Babu Varghese <albinbabuvarghese20@gmail.com>
To: ojeda@kernel.org
Cc: alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust/list: replace unwrap() with ? in doctest examples
Message-ID: <aDeNQ7zpfDrYAsyU@arch-box>
References: <20250527204928.5117-1-albinbabuvarghese20@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527204928.5117-1-albinbabuvarghese20@gmail.com>

Thank you Alice and Danilo for reviewing the patch.

---
Cheers,
Albin
