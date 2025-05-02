Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A1D137C37
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 05:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746163064; cv=none; b=cJ5ReQ0Njp/IgcnTLR4FUaudWYU0Pz1SXIF8z2S1nFeyVTG9eDMyPJ2peSKrJnQGpKf/KjkbhS5vtMfGbYyKLVF9oJnS5Mjp6t72L6kkQYr5zCDELRyLdddlSOj4/CkIHzkn5qneXIhu7OQEDZIB4ZXInWcltZIIKVlk104PQI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746163064; c=relaxed/simple;
	bh=Tn0Na7X3gzYJqXuQE25AJK/YZhEKlFsKU73wzI8Jb5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YBNTB1OwWjiKbF1vxHdEG5AwQWjOcc4ISHHY0tPl7x5epKJrEdSeG2aaZdfqzU/03jIHRx54JRaJH0UZl9x+ccCeLdx4I/SeMnYqrtNLv2O+6PiA4pefgvBE1ePZ5xlyFViOg5y2Y1YjY0Vhp9f+uUgguMOzRsyW4sLktyIID/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SW5QYz6V; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SW5QYz6V"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-224191d92e4so17037365ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 22:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746163062; x=1746767862; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xnngx+crBMNjpxjPvIvBmDP5Ck45rikGrRu1GyUpDTQ=;
        b=SW5QYz6VIwWAQUfprBjVsKIHcpx4/ckn3CMas+V3CxYV3dtQFLGpljiJqJ+LXrap+L
         7nfm4h/lQP2hzVUxQ6+A0XqDz0fEhsLPPH44/fCQds0LdC3JYsTo3X3EJITNuLm1WLtk
         t75D7Y47TU48cPsJlbslKmqp4vGwDIVaVUom+WP1YGntlm3aj2uhyI4FmpFDef2Z6vla
         DSJw99XYFVrR5PVmAyinzYitcdkVOiYr3Dv60H/pri8bF6bOSYeTII8+bjZ/Eh6SPFQ+
         UZ9tfE7XKASCNQty6C75ziS8lw5Oese4NGkeLHaI74Xp5B28Zz4WBVKrmZIoi/wt4yrV
         t+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746163062; x=1746767862;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xnngx+crBMNjpxjPvIvBmDP5Ck45rikGrRu1GyUpDTQ=;
        b=UV2HK7LN/5TkrL5jT13yA19+Tro9bWj9/AeEeC9kXw8dZI2s8rttW7iU5g7prz20B0
         zgiBOPM+Ix8dSG8sXf92dJwiwcE+fVpL3ZO4YZXaG0FYWQ5bD2J8aAr1Ncei+ejQh7Pt
         4T48N/eUa4ShfYA9Sk2OUdbL1fNNLJ1IMKYzAhzSyS8mjnw6UFMrlvnsaAS1SydIjX9O
         59/d1ZbKsp/IrahWXCbA8SFEf9JGwVVUKNR34poJz/qjQbukwvcU0DgsfbvUpKjnh/NP
         +1st1B4rPHlPjiFoic90epzceWXXvXRB2v8DkYgEAqLgDA27A46eIhiSaCcKAmTNDl9Y
         h62w==
X-Forwarded-Encrypted: i=1; AJvYcCX5pi2bU6Ro1sQGBCCR7GIw3Uh1iBljJ+s0wSxHdWTj4lttk25Y8WqQVlnQIAOY6mcsnK+JSLU6zlkfkeE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNBLAclzBSgdoc+RWxzTUxLY77UjJPZqVyM3M+xyJ+8C6SFsWb
	8nZTUegm7fAr5uXdR/CCnjPpcuq2xZpcT4IaSsXjG5IVheBZRRSaJq7+7drMP+A=
X-Gm-Gg: ASbGnctZH3MiEkJBzUuADFd0Ed63UuyTJ2cQ4emMkIZmv++8rD642/Lv+M6n69PgkAm
	Y6MAdjIA+s1679pYGfMvZ+DI94azuBCdyxiyKAbTUeo9SUabRYZzRzJDaWUBVWTUXX28Vbf1i8F
	wfmlrq1xZs8JAj3Wn29aTXKkeqYbRlbBrEt9WpRSjt9XxGPR0lzBcMb32Iy7eyzLUzFctBRVyWN
	bJAimM1bnuS1gT3wsGVhKX+P3lMlJLDFbd9em20JLENt5fZxHaH0fNbnY3E8QXgFe0fhfEfEA4X
	p+/fahIJ6duCcwC9H2DChqrUnY+juRXerGOFgOCf5Q==
X-Google-Smtp-Source: AGHT+IH0IRvfkSM8mpH4viXHOvhnL42FJ9fjj9CjAMUg3CpBdjiOxPHs0LObz/jU2wlHtEdIsfH6Ew==
X-Received: by 2002:a17:903:2405:b0:224:584:6eef with SMTP id d9443c01a7336-22e1038286bmr29293335ad.41.1746163062625;
        Thu, 01 May 2025 22:17:42 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e10942d07sm5463145ad.259.2025.05.01.22.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 22:17:42 -0700 (PDT)
Date: Fri, 2 May 2025 10:47:39 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andreas Hindborg <a.hindborg@kernel.org>,
	Tamir Duberstein <tamird@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the rust-xarray tree
Message-ID: <20250502051739.d5ge6ajr2utwn4av@vireshk-i7>
References: <20250430202315.62bb1c1b@canb.auug.org.au>
 <2xUHqc3nyQdHW2SNbAQvQwy1mR4qz-vdR0UF8fVwFvm-rDtaJmhOUqJJvNWkneTh1XD58UlvoBT3umKbMjNlYw==@protonmail.internalid>
 <20250430104234.dmwnn5ih232kfk4z@vireshk-i7>
 <87selo1xdh.fsf@kernel.org>
 <CAKohponC_E9Ah4wXNNg0YVSo0UuRn+hNq+hxjrccbjeNKWH6Rw@mail.gmail.com>
 <20250501221958.00788306@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501221958.00788306@canb.auug.org.au>

On 01-05-25, 22:19, Stephen Rothwell wrote:
> Tags like "Acked-by" etc in the commit message will change the SHA.

I misunderstood what he meant earlier, Of course SHA will change with
this.

-- 
viresh
