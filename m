Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB811BF37
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 06:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744265987; cv=none; b=FD4K9c7vpoxlewAFvCX0p6UkdiCeWRkrsbhkCTo1V6iE9kbZGm0nW6yWUskKsDpvVCdFSrh7v1hwKi02EjVWPooNUpgl/SZFCGlBqoFHXKOdL+6W2NLhvukMJMIKWWyOGkqKCNfCUChOcyQqdTl+Yhf2M4B2WN2tKXNZM/p9XtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744265987; c=relaxed/simple;
	bh=fNKcWfeOv5X1UZBWJNkpzhwgnAdoDWDmVg5nRct5t9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a5FoHkyROZsEWLbAavFMVetXuc9l25sR7mwf2aHTy7unwE+ELiZAiBhRuPaW8r1NUBXW+qF0AvwPblTwAZ1NF0B80rsQvytoLNgjYNSHTSmGvelxrBFeE59BATiL07cgXJpKb3cI75PQPx9i3xYWleepz6oNaMOHrToxWs+7Q5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=htEwGSK2; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="htEwGSK2"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso4706405e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 23:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744265984; x=1744870784; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fNKcWfeOv5X1UZBWJNkpzhwgnAdoDWDmVg5nRct5t9Y=;
        b=htEwGSK2vTaIz8z9lllONirib9yEqiD5v/DZnd4q4o9BpuIaC3KgzNXckydokW0lEe
         NAR392W9t4STF0jnCmN52u2421PR1SMbkM15nET3h1l2TJj1nUTvuRSX7gxOW3h5/qP3
         62BgvUgneCIaJpWKDGSNed47+ML9q0wobqdVuZraRw1uChE8LKanoEvMGCBTHmKu9l9H
         xxie6qDQptIb2l1Ad3idobgkwu9niKbRnwLk5QE/W7wpvbhuE9KmsSHnDMoTTUyZ3/39
         iusfvqJk1r4Y06GTcB7C8bR6KWQaVArohb2f9XCLTuErSYPhIs8dTsUncCzfNK4jzHsW
         PMBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744265984; x=1744870784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fNKcWfeOv5X1UZBWJNkpzhwgnAdoDWDmVg5nRct5t9Y=;
        b=b7ilbSIVjUDS0y+MnYxSKmi2Ik/KXRpo/tKcTpiP3wEuGhmqTLT0O4jFIlLrRC6X09
         iLqRhvJjyByp7OpJPyQ+nKgnBhIrXW2w6O5fBL05KenZ/fBjKiIzaMsC29jyfsrfMfkZ
         S9XZlGEmve8wOyG/qLUgbItZ4u3vsL+WSyEqOpUtaKflk2hyouZx8QTwzqNviCrg8TH+
         iEM1MZ97DcnAhGU0nE2IHGUbA5HoW0p0LXGnbge5Z2EwGGd/81K+YMEcHQpijUT15WN0
         B37MXKnWqU676SLHyPltMvy0UblAAjGkiAgLC7D7DjbUPuHN2xrV3QMtE37WaCC+/dwO
         HbsA==
X-Forwarded-Encrypted: i=1; AJvYcCXeqRT9PPiH0ZVYlVAGfYBbzLRyrm065sKkKsbht8T6lh8JeLUH5jsj80xadalhTO0oOdsx9khfV5sLpHg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1LrFkx/n8MG2x85okxibHW9+qDyf6WHL/g4R9Sm9cnJmHRSjk
	+7EQQtXSUS173q7F5XWT4DYDloWfF1gCyt0f3AbUguw7LjjOFE83qy15HqzPoE0=
X-Gm-Gg: ASbGnct1b2zmtSHEMUkP7wZxhvTFu1vzoau3J9u2q8o5p90grHVjnmZ7VkEwgSHTIIa
	9wzZtT9ABFwyGX3gBmhx/wgKzc0p0P87f9Yasq+UJ5+i0urgZEjdMuxOf69POrb3sMGr4lYoZTu
	LtsbWEwYvlQmVRDR+vs1bZVxo3JhWoeqGujhzm13HGVCi/dcSslS2Umc17pnMKU9qE05buPUwss
	lDU4LU0LVrc2ludRZ5hpniHIcgLJ4EO0FcGolNef4lkJjfQQzMMW7GqFEAp5lWGj6Ums/PWZRaT
	sKaNAruyt9pjn03pl4FlcPHEB8jUZ1kKoDsBjOC6ccCrz8rcpX1+2T6d
X-Google-Smtp-Source: AGHT+IETxKgteFp+KK8rObwmu67CyaszSv6hN7I3pcGlN+mzeZYmJ4TDp+koJRpZX2WmH9ySINK8Og==
X-Received: by 2002:a05:600c:b8b:b0:43d:4686:5cfb with SMTP id 5b1f17b1804b1-43f2d9604f3mr15862495e9.27.1744265983907;
        Wed, 09 Apr 2025 23:19:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43f23572bb2sm39720035e9.29.2025.04.09.23.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 23:19:43 -0700 (PDT)
Date: Thu, 10 Apr 2025 09:19:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Siddarth G <siddarthsgml@gmail.com>
Cc: slongerbeam@gmail.com, p.zabel@pengutronix.de, mchehab@kernel.org,
	gregkh@linuxfoundation.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Subject: Re: [PATCH v2] media: imx: Fix NULL pointer dereference
Message-ID: <e4252054-69e0-4f65-bb75-54ba4a24e5d3@stanley.mountain>
References: <20250410050543.6963-1-siddarthsgml@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410050543.6963-1-siddarthsgml@gmail.com>

The same comments apply.

regards,
dan carpenter

