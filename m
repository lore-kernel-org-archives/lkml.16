Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B3A239E6A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750676048; cv=none; b=cQ1XJpAY7vvNpjOgtP3ip/L4901VQ1bykNSHvvc3WkW1K+Qgp10rbqoADwAZ778VId0IiNVZHAa/xZRfVNzi2oCV+ej/ZF1oUpYwbQs9eoazwrB4ivuWYGDucQ3rm91Ltg1++5/agiOXxud24gF+HExvp8Qk5C9p859d+kj7ExA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750676048; c=relaxed/simple;
	bh=6+8xlbDr5fN7mQXnhtSPaxgdIgk2eut1FkccnDGgG+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QSGal6R/oYREtLFbAx1HZydaej1vBcRO1kOhbbyrM8G4cn8TcVwcpLd9qiVzoZMomMLgreQQqESaJTQWO7js3u0HCl5oj+Vgx/0kXqEAU5aRlE4wSJ1gAAz3aw12UDLayongsYJvm44avBjq447YpWCEM8+hTOhgnGRMgO8CUhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qdS3vpI8; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qdS3vpI8"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-73a5c41a71aso2623429a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 03:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750676045; x=1751280845; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DWSVsYHNwP8rg4rURoGYOq5yv5GD0eHOKkQLtMDF/j0=;
        b=qdS3vpI8n2E9o3wy532L6Yw13OPCnVMFyN7cpLIW0cloDz/SqGWq8BogOfDnbc4dRf
         GKJf0yYk7vEjkxBukBbw6sMBDNhP4yn8PO2ztGTCTNR3Df1TGnlTvwGU2s3yPKIfS+je
         TUj30i0B0vhLx6DaU6v5o5NRcMpHLsXdpmWloqbBBlR9WLML0cAv9YuKsNeeDu7Z2wl+
         0dIMbtbr6TbHEwXV+SwmzPf6PYNO5kNTVhU0CNUeioqqYhUS6rqZgngsyKJaQWzsRNRW
         PI8iwKXSlAK2GfnvdwZEEkBbdtHCG1Jcg0IqJzLn+64Ct3StsqTU/NriL9pbPxva1CJv
         EggQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750676045; x=1751280845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWSVsYHNwP8rg4rURoGYOq5yv5GD0eHOKkQLtMDF/j0=;
        b=GDmBCOvPe0YaR/CS4sb9+QCT0pRdoSlECz0IsZf/nmaKlGP++9hkQftlsH6qNgNIPD
         NVESSUEfzYxVpR6Sz+cOM766JWUfcHNUooz5/JIJlXe1YjJWbZcv1+6tb1VVKIca0B9B
         XWAXMNY0UGR/VM73xezG/9YfFVWTQHqV5hK8/ZemqHX036Gz0ypDyI+1ErAXPCeTQCEw
         l9nCU7qWGHtKmZ1xq9L46+qcywaYjCNj4cwMPwOK6EpUmL4+CpmqML8R5ur17EtLzsyD
         5qqRUAiexiEGKpx2KP1LdtVE11YfWX5yuuDujaMVsR6/xi8Caq651/3GZ0KaPMAd6sL7
         PNhg==
X-Forwarded-Encrypted: i=1; AJvYcCU8hbHSt3I3uJ/C58Mlv6oIhV4VxOeraiK9a+0mnZfY+wT/OgtgAvPmqrIiF0r+HPzwJ97NvTLvcjT0HHY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRIyfBRrnh+wtmt/CLbD6OWTu4pjSrlFMAoorbNJdr6Gz0YMtX
	T1UUZhz2HYmJHUaYknYaa4PtaIdrv8p1GZ2XF0RJNM/LI8WjrmQGYaESEy1IWOOsoHA=
X-Gm-Gg: ASbGnctiKy1N32f0Y57zOt9tkeQRP90sNAf776WjqWKlN/qRIoFknYZAWLzHQgkSyl+
	KJPir3fCX8GqPqnOv5vlRHZ92+IlxQycYJzQzF87o3aFKL1CJOk2AMSV6pXSl1Bt6yej8zCiKWN
	RFy28xDhUYP4AMZytnc6ApxwTbmKcJP+KtVt76U/nNPcehBVQyed7Ne7v8w5YAo/unNpEkESFIM
	IunPGqXo+XjDbNsjF96Vw2Nsu3VTNR2Ly9w8IhIP7kELTkmCRvmxAFJ6YvRr6tgnygHLuNcR7mg
	qYkT06M+IPvVsh6V2IiQupwWXGZqczj6u9DhnZKgr44NRQqjwryVkeDwJRG6wOFHhJux
X-Google-Smtp-Source: AGHT+IFMT0KF7HhSx9nvzdNTb6lPuAF/rdvKkBwDB409hsxV/5/mAe+Pc8GJzAaje7GdXO2+8edZ+g==
X-Received: by 2002:a05:6830:919:b0:73a:96e5:198a with SMTP id 46e09a7af769-73a96e5a731mr9613005a34.8.1750676045191;
        Mon, 23 Jun 2025 03:54:05 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:608c:e09c:db47:348])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a90aee8ecsm1407624a34.10.2025.06.23.03.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 03:54:04 -0700 (PDT)
Date: Mon, 23 Jun 2025 13:54:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kisub Choe <kisub.choe.0x1@gmail.com>
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: replace msleep(1)
Message-ID: <efa56904-eabf-4493-b064-652d02839c6b@suswa.mountain>
References: <aFdAEM6GnCudvqMV@zinc>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFdAEM6GnCudvqMV@zinc>

On Sun, Jun 22, 2025 at 08:28:16AM +0900, Kisub Choe wrote:
> changed msleep to usleep_range to
> 
> Adhere to Linux kernel coding style.
> Reported by checkpatch:
> 
> WARNING: msleep < 20ms can sleep for up to 20ms;
> see function description of msleep().
> 
> Signed-off-by: Kisub Choe <kisub.choe.0x1@gmail.com>

This type of change needs to be tested before it can be merged.

regards,
dan carpenter

