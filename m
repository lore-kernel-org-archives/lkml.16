Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642C01B6CF1
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 08:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743408381; cv=none; b=l3/jdT9sLwKnnwn7f907RXjMH3XW4fuJNWFXBEb3Dsoot/7yB6Mii1UMlSeORUrXdsByN8AowHP6W25zbiwRin3Kpo9fAhweTPns4nU/Koea39O3CebKEKQmluQFBugQW+Z0MohR4VohNaGsPUs8ul4+5H0wvN8sArocGB7Yffk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743408381; c=relaxed/simple;
	bh=ZfJC0SeKdJDQbt1YZCchBbUcg7nBqFPWQB9hQRz76Os=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PX+e7yGvJKnGrMOf3WkhP73+QpPAgvHK8PwfkdxSoDi73osp6sCOXF0XTNOSUrgWJaOIf0nMEhWQ0no6ukcRpQ3/qfvoXHdY6WyZTHyXgfrrxa92qRzojTxYdY2/cQH8mf4b9/dx+GZ2z4ds+utfyrEkBQnkaG80yKXHVXQEhbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nYW7ZXwr; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nYW7ZXwr"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so28767565e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 01:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743408377; x=1744013177; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dem/AHZR7qF3cH79b+8VdRbhMuCiw79+oYYuDn1nDoI=;
        b=nYW7ZXwrLX1j6ndkWjLKlFmTOP8IFtRO1aRj9OhlprisCFwJQtJ3RKPln49b6Mmp95
         Y8nVE9GXzmYUdcO77/7AF5MHvhE4CELpr9VsVXZbK60CKet1wQGbykgDrFtiBr4SD1n8
         que9RNF7Oz8U3oL3GrTN/j0U6yTYUgBxC9EYs9sAUeoTN+sDAtMCzmAqIvKbSvt3y3C2
         y+YsIHuNJ14uqwHNrPa13jBfA02VwS13F4dlCaUkaGzbUBkeGIJ1el/YzMAJqxftHNzd
         rDWmFcZYwkJsux5d+ROGmo6ACx2FeB6/+Ks4q5BrFeUuV1yfXsffACZGuXbp8wSbeFzw
         dM3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743408377; x=1744013177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dem/AHZR7qF3cH79b+8VdRbhMuCiw79+oYYuDn1nDoI=;
        b=FlP78M6y3L+wcZ2OdTbHQljRX9RIdUnH0nS+tIrKCARVK1hA4eS3+CXlAR4EkcnhkO
         QfkiU3z+N3miQzd0SFKYMicURFSSmUbSKCtt9rRxu+22mPUQEomA9N/cWpkvvPP5Sd1H
         uO408FiH0eg1MHF8cBMK+T+0JYDgxjixfqKCr2pOWEWBHY2HFfM69tfikAmoRPrlTJpq
         zjvoG3Q4gT5dEZPNwB63oTunq7iLlpkc73zDVGNkiy1geNKvGxQaxbD91NJi9OOsOVnR
         so0UeVu0yTvjTbEm24ZHjM1TzEfLCPVpv6s3q3PElp0lXBRDE9I1LRO2md9+/gXBMtu0
         PzaA==
X-Forwarded-Encrypted: i=1; AJvYcCU4z+SnFpDkaEyBauvbsV9upyRbN5iddd6EVBZPqH4GLMeY5nPNU7Ib18ucU7zN/o0NOn7X8zM+Z8T97jM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjCVGPbnHimf3v09T8jbxL34ZiWRiqv3GHcu/pdNmIbGjr5Z3d
	3pw7fhxAlyRV1oEI0RJqZfvgu0Z8FSuWErb2a/kanrjOIJBh8Q6LCOtdtXqSydU=
X-Gm-Gg: ASbGnctf8tie5kxOrk+xZYmFK3d/6retqgtoEMk43GjwIyL4zacOs2qpkWFvb8ntvTb
	jGy5uVjQUBMiBBOv/Z+aryVE3rfhXd28eQBPC/tSrGigHKAkzn8VQYG5yGSSENU1umdNNhAfbq0
	X7nGvD92079QrC6+QAdVLvgfdwR0xxsau+N3EJ9Q8Hh4pAaECkbg4z4bHxlSj79uah7q/+1j5mD
	nTP+rYKkXd1FqlmmzwfNiNFUvSxk/HmWiKSL0W2lBynZ0R2xZamVF+RGZF7fyp2Ak+v2263xk67
	KTgf+bjNFWMf1A892v8DA28AtgckOAnnlGGObaE5cNCGNCRuvw==
X-Google-Smtp-Source: AGHT+IH4vJ/KqgunlkK1ej1cXacAghtjETA+BJXj8kGxSrm8d1nKUfuPzSv/zW4Kld1su7UgbTv4Jw==
X-Received: by 2002:a05:600c:4f0d:b0:43c:f597:d589 with SMTP id 5b1f17b1804b1-43db62b5b62mr61296165e9.27.1743408376550;
        Mon, 31 Mar 2025 01:06:16 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d8fba3ef1sm117879915e9.2.2025.03.31.01.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 01:06:16 -0700 (PDT)
Date: Mon, 31 Mar 2025 11:06:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: David Gow <davidgow@google.com>
Cc: Alessandro Carminati <acarmina@redhat.com>,
	linux-kselftest@vger.kernel.org, Kees Cook <keescook@chromium.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	Ville Syrjala <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>, Guenter Roeck <linux@roeck-us.net>,
	Alessandro Carminati <alessandro.carminati@gmail.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: [PATCH] kunit: fixes backtrace suppression test module
 description
Message-ID: <8e4dcf64-898c-4334-8124-598964089f4a@stanley.mountain>
References: <20250329150529.331215-1-acarmina@redhat.com>
 <CABVgOS=s-NgS1tPOOPDstuVfTmsW9H0kP8nEQmtfFiubQeyvWw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABVgOS=s-NgS1tPOOPDstuVfTmsW9H0kP8nEQmtfFiubQeyvWw@mail.gmail.com>

On Sun, Mar 30, 2025 at 01:11:59PM +0800, David Gow wrote:
> On Sat, 29 Mar 2025 at 23:06, Alessandro Carminati <acarmina@redhat.com> wrote:
> >
> > Adds module description to the backtrace suppression test
> >
> > Fixes:  ("19f3496") kunit: add test cases for backtrace warning suppression
> >
> > Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
> > ---
> 
> The "Fixes" tag here should be immediately before the Signed-off-by
> line, without a newline. Also, ideally the format should be something
> like:
> Fixes: d03d078df162 ("kunit: add test cases for backtrace warning suppression")
> 

Yeah.  Everyone should configure the default hash length to 12.

git config set --global core.abbrev 12

I generate my fixes tags like so:

#!/bin/bash

git log -1 --format='Fixes: %h ("%s")' $*

regards,
dan carpenter

