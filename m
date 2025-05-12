Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6240418BBBB;
	Mon, 12 May 2025 16:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747067923; cv=none; b=j+BHZyy4zw7P95i4HIxYfoFo7FjGqH5fE8UpVY+cUa/TFX1YLfMOMflMJ0B5XFHIMUvuCPrPFW9CAsumo0v9BJTFs7rqh/LPaDa1M34MDSmsQ/glloJpt/XmdC3Vz9Qz+mcYxVq1uua49aJjTQy8m4286ZwRA1xOhnfH8ti1jVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747067923; c=relaxed/simple;
	bh=CIOtdu/IvMkLPBA3/to9NrXGt5ja3IJHu0x1zv4Q6Ic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X5l2r/qpwbM7J4ltH3dNaDDXuu0awvy2wMHxgZiouTQPpdF6wd8P+arp+T1SXipmtGvWGO5hCkHVky4d+dv9PP4tj+SMRv/Wdmfk7lJMoJYa3NuI8/zAGS2pFVd8+DuIJy1dEPLDn81XHu0lFd0ffMkJOcOYVtHUG6L3X8Wk3UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bdcY4f1M; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bdcY4f1M"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso1438768b3a.0;
        Mon, 12 May 2025 09:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747067920; x=1747672720; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RIpnjWRJt7q90APexuDR2vW0P5kZLkNgW+BoGqmUkW4=;
        b=bdcY4f1M0ru3KozjNH2iyHja+JFJGo/24aRx7sEUZHty8PB7FOr8fewKKP7GVGSsYR
         ihgunumw120KG+4ZHNJ5cDKQunzLPKdrDac9cI4srfwaf0wyuoc8SolW88fjyr4S/t1W
         O7sPkSMFaMd71YbWzu8buPgAQ3XQseVpA53N8Vo4PrzVwnxwEixG+ziyvFnXsqRbrgBq
         Pm/SBLUXQgCyuuF0og6m+hCq+IT6Xzg6xW5YE+Dm3X+kXq8Aquo4dUndk1HJ9t6qpWU7
         inhZPvgkWHXjkDetkwJu0PfIUh5+i8p6nJTJmpY70Wo5IREt1GIdtWfJQ+FuNIvEaZ6C
         vGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747067920; x=1747672720;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RIpnjWRJt7q90APexuDR2vW0P5kZLkNgW+BoGqmUkW4=;
        b=L0gfZWo7yyUq9ca61/pjkiUjhBj0lb1/qfwDVHm7UoleXk8PndghCbgGo3S2rJEdxC
         qxex5PL3NcWi4N/Xmtl7t9LFiwIjlqPm36+r5eysrSo971QgZihgCaNR6OrDQHrA0JwG
         GfLV28Pn3DKniJsp4Hk/sl44ZCEgGlgDa1mAja3mvH9hbSXZpMr4I5m4vDDSjrVx0l6L
         6Jxg0qp/Iwkp2q6KqAr4B2tPXQHaXVqPYpPyF5iYgVRXmeMSv4y5Q1+tywOrgF1gQu/L
         NuC4D9bNAXn9eURRh9ZVJhMn5LuNePPsSfMeRWOae35vv3v7+k5jY/tV+xctwqMAoOP6
         jbcw==
X-Forwarded-Encrypted: i=1; AJvYcCVj1K8RQ9JWFhlabapGO754vwM6f4y4KVmjBke7GwhPphWJzdtVtRcDqc1eBMIyL2N4KFxTMXmGwv1Tsg==@vger.kernel.org, AJvYcCXtEZA8fJ1odfHXFSOwVVvmwlgKKJU8WV6WkTlLDvIhx9mZkZ+fRldTmc/U8vzi6zv3kgBtepbES+26eFLH@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc6qsp35jsEnpmn781YO0jo6mvgQCAgmuId+GUuHEhnVcLYpNw
	/HdMC9XC/4RcUoqDlZSGknhwirYjpUlRLrb0Vu+CRI3NOZoA8pzN
X-Gm-Gg: ASbGncseFm5ukWesS0BiaSxZljJOCjzAojJIjB0vqtSg6ecsO8veqNtYUPPtccT7uZw
	Vf6EaKNzei1FgyVktD0DVqDv87Z17GjrnodG5Vp9JolsQzA9fvB8OTsoU/ZmBXD+W4caedq6qkB
	i7Dpvwqmy4JaBrP8SIhmnv59lYzb9HQhjxVEBFcKWVNsTn6OB1wTbKqv2zT6Akc4qqQB5vz0fL8
	1z5RpIPJu40mIHZy2dpivf2mzpycPHyEh/sIoXzr0zWa7JfM/t2C1lVQIR/jfvrf9G5O6Zc1b0d
	e/qKl/vNP1/nA81U5y6nGATJN7hpqvvpsOG2fha97u0um4JAGL7zYP+7JEEvjP0u
X-Google-Smtp-Source: AGHT+IFE1+jMqkzYHryOh0pPi/hhYh35D7tu3zwEi1tFlpu4Zh5T86LwR/18p7jFuRnBgG/MFunjFg==
X-Received: by 2002:a05:6a00:410e:b0:740:5977:7efd with SMTP id d2e1a72fcca58-7423bf8a975mr16945353b3a.13.1747067920461;
        Mon, 12 May 2025 09:38:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237703f2asm6236690b3a.35.2025.05.12.09.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 09:38:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 12 May 2025 09:38:39 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Wenliang Yan <wenliang202407@163.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, derek.lin@silergycorp.com,
	miguel.lee@silergycorp.com, chris.ho@silergycorp.com,
	eason.liao@silergycorp.com
Subject: Re: [PATCH v7 2/4] hwmon:(ina238)Add support for SQ52206
Message-ID: <7156ed82-d2df-455f-b92b-f177e79c99b3@roeck-us.net>
References: <20250506053741.4837-1-wenliang202407@163.com>
 <20250506053741.4837-3-wenliang202407@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506053741.4837-3-wenliang202407@163.com>

On Tue, May 06, 2025 at 01:37:39AM -0400, Wenliang Yan wrote:
> Add support for SQ52206 to the Ina238 driver. Add registers,
> increase compatibility, add compatibility programs for
> multiple chips.
> 
> Signed-off-by: Wenliang Yan <wenliang202407@163.com>

Applied.

Thanks,
Guenter
