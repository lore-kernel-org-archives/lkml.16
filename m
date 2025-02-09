Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C132414A91
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 06:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739082251; cv=none; b=BO5mX2Hs/FUkb2ZKyNRwGFfJFeoSTpaWFtqJe//ietAVJ29i2VZO1U2tHeolJu0e8qssho0BZNacRZir0VJ9I0RB14cTU1tFTbhAHG0hLeb0wn6o0byC8gogZJZjmAk7Xo55F9QlWYhF1x7fJu12eqwesFZEtGsmMvcU7NoHt+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739082251; c=relaxed/simple;
	bh=aE8Pr7FMgBpzGLwqUQPLB4QILiBDleWz4ZaabRMSO3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dOPgz9VD8SAfggEKAT+ykOxn/VCLw9i6/j1oM32Z1BRfLazDopJYGLocCq0D4IEhnEBg5daImgTuZPBx1iTYazH/EXkHs5RmFvfZtSdZ/0zsETCgvSqiZAF4tMuJt8JIwYr4SdcRfgLoPiRC/2rFKv//UmCzoPUOSwTXa9uBCnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FtUcMwlB; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FtUcMwlB"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5de56ff9851so2683308a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 22:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739082247; x=1739687047; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yTto9Kr8hhs4LG0n8TSGyp+f3yaAmq1VIFKY3P9KHF0=;
        b=FtUcMwlBjGcQm5TpBrrrZSc1mtPEy+KFHo/653m82noS/CzyuNG9SPjdjcJyxelUUe
         h1N+NiIxjF3WH0zlm+nAE50y8HvWYYJDaFAjs4gZqpm5tD1fxktpGT6UOjt2DUZv9w4i
         mQlkmsBGdIG0GqbgJUZQ+hshLkCwikJw9RntesMheXGA9Gw+ACZPxlYG5+JakwOZmvt6
         jRwwPHJQEVDUUPXBs3AQL990P5/0wE3d1s96w8Gy+RWJaDjLZHgB8sVSD6eobH4liCPv
         02hEgh7oDTbArzfU+4PdOSu8wzsa7wPKTKKgpqK+JD7w0WizCeFa35YXaNXJccNzZTFK
         QcoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739082247; x=1739687047;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yTto9Kr8hhs4LG0n8TSGyp+f3yaAmq1VIFKY3P9KHF0=;
        b=Vr11zeYQAPnUeRI3nYRjovIvk22NWQgnvut3J9m1aiy+i3LWJ4e1HWv+DjS+rLN+Yk
         S69tg8WAKt2mtx0ThdQIj6GLaYnZoIgK0VUutuhP9mX7U645vGsjbPqouSuJ/4TdUBkb
         hIOTgnzFWwWji1vXI+OjWuWv0avOrR8VrTyhykkmaEreOn9TNZhCBhfAObFQL5EoUmE6
         Y5lO0sM0lXxz75dS2bMq9fpMCgTSpHKymEyH/DXUvLeXUxOHNDrcbjz5rhM+xqm1YVnM
         1vvl0KXAsmFEq6MBnabGTs+KEdn/IYFH9xMXFeJVm6icAKOmSQxH/wZHDctXqaXxq37l
         Xpzw==
X-Gm-Message-State: AOJu0YwEKJeP9wCWz2lEOr0yVS/3wOUcE9PoqWMwXdL8KyvKxxyxmoUR
	ys5hJ4mjlZB+8I0IX31kxgFujqLuqLMiFppfTruWsoW3xUB/m00L4f/fm15Na8I=
X-Gm-Gg: ASbGncujnpq7jqlFS8oYELIn94l0pCAUbUp07BiLwg2vnBIiig+wuQm5h2uPN8c++Hi
	gOz9TtqMXz4pMEyebBorgYwoJfVAFDAHoQXn/82xvBXs7E/jexjfcTmDSk9vlMYgVv7yzXckqJK
	lgqaMMXJIBbWq4uJuA42P0zw/Igb5adp1bNj+TCSy3oVYUUSkOEkJUeV3+r88Q2gnDVtiEz9Z8j
	UsZgxmbdoAyEJ96OZM+WzAWZqIXS6fCgoi9AKcFnJJ48SOjPCgl9RPdVa7gHR/v3SGrwrQqNmhl
	zj9PaKUpFYcx/2rfsCQX
X-Google-Smtp-Source: AGHT+IES82N8C+fmH6KFZPQ2PcILhvhCYo68TATrCctmduAL8AzzSocttcg6O+pNFOFLcG4GQSgsDw==
X-Received: by 2002:a05:6402:4588:b0:5db:731d:4456 with SMTP id 4fb4d7f45d1cf-5de45085cc7mr10374231a12.28.1739082247149;
        Sat, 08 Feb 2025 22:24:07 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5de63a89b6asm1714510a12.46.2025.02.08.22.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 22:24:06 -0800 (PST)
Date: Sun, 9 Feb 2025 09:24:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-hams@vger.kernel.org, pabeni@redhat.com,
	linux-hardening@vger.kernel.org,
	kernel-hardening@lists.openwall.com
Subject: Re: [PATCH v3] hamradio: baycom: replace strcpy() with strscpy()
Message-ID: <90cb9ac2-2af9-4fc7-b93d-0f36514a76f6@stanley.mountain>
References: <3qo3fbrak7undfgocsi2s74v4uyjbylpdqhie4dohfoh4welfn@joq7up65ug6v>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3qo3fbrak7undfgocsi2s74v4uyjbylpdqhie4dohfoh4welfn@joq7up65ug6v>

On Sat, Feb 08, 2025 at 11:06:21PM -0500, Ethan Carter Edwards wrote:
> The strcpy() function has been deprecated and replaced with strscpy().
> There is an effort to make this change treewide:
> https://github.com/KSPP/linux/issues/88.
> 
> Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
> Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  v3: resend after merge window ends
>  Link to v2: https://lore.kernel.org/lkml/62yrwnnvqtwv4etjeaatms5xwiixirkbm6f7urmijwp7kk7bio@r2ric7eqhsvf/T/#u
>  v2: reduce verbosity
>  Link to v1: https://lore.kernel.org/lkml/bqKL4XKDGLWNih2jsEzZYpBSHG6Ux5mLZfDBIgHckEUxDq4l4pPgQPEXEqKRE7pUwMrXZBVeko9aYr1w_E5h5r_R_YFA46G8dGhV1id7zy4=@ethancedwards.com/

Ah great.  Thanks for remembering.

regards,
dan carpenter

