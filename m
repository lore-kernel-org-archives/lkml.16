Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A583420127B
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 10:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745316591; cv=none; b=Sbw7c6kjuznmtCci8iN2RkDxfv7DFsw3DlBo380rEbR0rSy+3HXfsQnoZJw35oVpcktVB2JNooL8PKHvhghNGGZvYuBl68gqukikjOPSPp/AVwarX7XTup8l13pydntbCWuLogKzr9rNTYsveGcZY/FbtfGSrmOL204s2kkZH8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745316591; c=relaxed/simple;
	bh=gJ51U3OqINc8COkxIxukVEYOMtp81jpnzGm7X1OCfvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lDom+iWlETcn6XgU2ZO5z2H+5COh+XZmygGwHWE/WC7AXpgxes9MJY1IUxNeFROXj+Fm1vaCqmbNnvVmQfxvk9xNeNfiW/x1p/FL6/sGPD57Y6gTi0G26Wt5QdCJ+ZidecVQcNgwX8PGIXwDliHFjyVX8yWr6I29aAGsxjL+fr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zmgkONSZ; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zmgkONSZ"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39c1efc457bso2977696f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 03:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745316588; x=1745921388; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dp1ZZcaQjMA4BnCcS6OmQTLRZmI/Eud1+9lMtliZJGM=;
        b=zmgkONSZM1kY/CQ6n4fXRH2iMXVs98zqQcBa9XplNh0MDuSZStpWNZa56A1OapjMb3
         9idb0Pk8xscrePdddUq4+5f5j/nK5mGr2UqUuAowGboPlgdmpzYNkZBlhPmObrXyF0x1
         EFFzWxWwaNcvSHB5R3Fff6SBZLoOLkaP/+pRz5yPHjDlNBuC084OPd09P/6OGtc4H3Qp
         jX99bsB83Cu5IxpaMvh3koFscSWROKNx5OOyhtAEG2lO/CpOI9MkFh4z9PDx+s79glBZ
         ecdPiEKzKEAyRu5ngJ3Mdp0nFxTtj3+IaJ7ArsnIhsfMRDsU9anFr51GnLVrONwH4Bfz
         YwEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745316588; x=1745921388;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dp1ZZcaQjMA4BnCcS6OmQTLRZmI/Eud1+9lMtliZJGM=;
        b=ZlLrcZNcHLF9XWKHNPHZ1wYdUimJBU52z4foPSLzNpyFnKuwFaHqo1XK+DNC2cyy83
         nlGK+WZvVoqmqe8gHV5EI1uRjsEEldwCMgJyPRV76J1wqCQVRuMz0lfnrGnA1xl47tTC
         n+RcWa7JM9i6lJhnpi0vjl1AarjUdDRZ/hDBuf+DIyFrg5Or/k9uITyV5zmB1spnxfu6
         49XBnkPLzPDMXLSw0A42NVPsqITvzliFqj6q0zA6ozxx88pXrsRiqxMaIb4u8ZRWqvKV
         G6e2GytgpPLf8O5DbuSsaChzrB7l8hx2B8mwLQ7xjZunm4eEirRUu3vfdKb8jZ5R4IuY
         3Mrw==
X-Forwarded-Encrypted: i=1; AJvYcCVFSqx3XO+PELpG8nW04JW9P9xaFB7/dxtA6MwWsymfyFKj9BzWoWI63yjVNC5ksR/VoD5Z4gJkiygIoAc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyevQHV2UKbH7S8PVOFJeNZWGGHsVfp+Cct45txt17p+jJ27oQ
	O3fLhU9qpB53NN0lnGfT6b84QRnRHBLw3UHWZIEGmlsV/T8E7hgPIuVCJ2JvHjI=
X-Gm-Gg: ASbGncsEvKwNGdHs66TFF8UILE96yrNR1rnRZHI0aACPu4/21XtFRGdCajZQ3SaDXok
	eWY823cTqCQq01vGMKxcvnWHQbRyiS63YCMc40JwC9yItKaLj3caThGNefiRhwbeEC1pEq0nOh6
	hXWDUnL7jnwsKw/8YTk/iFFj0fvRTMWzp6BaFD5xATCFt4OtBrd1obl6BurUOjGjtRvM/5yfYDY
	4VaIWmL9lKma1RyseVIYsS2XgZVI+ZmXHHbTP1VgU8lhceR4fsU54lyGU2rUARanpwsZCiTiP0f
	Nz6gwHV6iVf2pYC/tKLC9wb7MVbG1i0B08E6clPenakffGxRLB28Z6ef
X-Google-Smtp-Source: AGHT+IEmHLJOQlOcSRcmVdEtr0KqjHjjJr7duO4pcXYqbZwwqR76CD1k4A3+rfbNuIehIKutY/tmZA==
X-Received: by 2002:a5d:59ac:0:b0:39c:1404:312f with SMTP id ffacd0b85a97d-39efba2cb94mr11712313f8f.1.1745316587993;
        Tue, 22 Apr 2025 03:09:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39efa43ce2esm14951548f8f.57.2025.04.22.03.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 03:09:47 -0700 (PDT)
Date: Tue, 22 Apr 2025 13:09:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Cc: gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, Michael.Hennerich@analog.com,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v3 0/3] Fix and refactor output disable logic
Message-ID: <72fd8919-8413-45f4-94fe-277719192536@stanley.mountain>
References: <20250420175419.889544-1-gshahrouzi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250420175419.889544-1-gshahrouzi@gmail.com>

On Sun, Apr 20, 2025 at 01:54:16PM -0400, Gabriel Shahrouzi wrote:
> Patch 1 includes the initial fix.
> 
> Patch 2 refactors the code to use the out_altvoltage_powerdown ABI.
> 
> Patch 3 adds small improvements by minimizing the size of types and
> doing a redundancy check.
> 
> Not sure whether to include a read function for powerdown as well since
> all the other attributes only had write permissions. I can also do this
> for the other attributes to help modernize the driver.
> 
> Changes in v3:
> 	- Include version log in cover letter.

Please don't resend patches the same day.  Give us a chance to review
it otherwise it gets split across multiple threads.

regards,
dan carpenter

