Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5010279358
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 10:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748426930; cv=none; b=bdBk4yG2HISrGnYJ1Kl8uL68c+iy5o9t5q/hgvYaTVzEzw0te08/nqt2PkqLqhP1uvMOaEr5TbHAmobjI10etjzW2AV0l474HlTht58aQ6ADbbJ5rKoa3p6O1bVOMBTnRwzmaAY1MqYUCz6nxtntDQM/zhkVpkr0g3R1jk5Uri8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748426930; c=relaxed/simple;
	bh=K6LuZnoG9l9tErcwlPRRYLNk1X769nTvgY4Ttx/vpuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eZCmi19l9iCDqZ3dTVunnbaSy/rW9Zt2bnVti9c2MLqP3RVgeO4icvllgjHJR/2Ag0T5uIWc7XtwV8/WPWUAe0OqxEaLXzvUQLndA0kbfwNPoPKSdp6ZzBC7jpHRcyXwY9lQ6OPSNb6BLleRv0kMqdb4gjE6LXGMIgH4mlfUFOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y68g+cv/; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y68g+cv/"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-44b1ff82597so38097655e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 03:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748426925; x=1749031725; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LXZzj7zT/aoC0USaD96wdCURxHjN4LGV2uTI7X0jaRg=;
        b=Y68g+cv/1zFSGOXRf9CGyDnipoEnK+T3uTvJ8Mi1Kx8YHEFJSRDeyagR2rAxnOj36o
         6KAxFfv+iJaqfDHu0ktYzz9MBpgMmqwIiCAnmiFKnDKgW2g6CHlfSmIMfQSuVH2iG70K
         AeM5Z2aCs4sFwb5p7ZYbxESJ7IrRarZYw8+srv85YNKzBOIfrlIT0EOLcivsA5Rr8xY4
         ooapPIFcnPyWNDHCBDpGyOgaiB+V4/4cKuwD9JdxnALuLGBlKMQCxy3ulSsE6NjLWUlf
         PvKKDZRDIc70khOla1u0cBpSmlsbJQdFS6QQat3vA+/nI2rJOHrYd5IvsBZemNKbP0Sk
         A+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748426925; x=1749031725;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LXZzj7zT/aoC0USaD96wdCURxHjN4LGV2uTI7X0jaRg=;
        b=tBBcH2nR/O3JDhhnjVxvuOtBvWFigeABwuvcKqpJDI7Hcrwz83f78kDLXBg8kIIohW
         wriFrje6WGZl29uY5JzRKivSVTUrtGL1TOvdf9kIJvMREQzqkFimggOXwjf4S53cfOlf
         BtQSrm6BMSZ9zAUOnFu+Hs7dXCJ0IZ/R6e2I0mNIZ2OWTAim1lx5ta+xA0QD/i90bTzt
         tyW5ezypYe4JR0B/Aud1AsAJxs+Ox/oBr/nu0l0bgBFaR05D6Femr52HV7EtRvRcUESP
         0ALZr3kegRfESlbREYZcQSmMlt8wAocqUqed6EKUZ+7aGx7+46m0QtmUI0evb0P/SE9t
         yCYw==
X-Forwarded-Encrypted: i=1; AJvYcCVmaE0ygf5EaDFF0cMvqY7cSo8mumAYQO5gYPI4MRTuf3soTqNW5eUe/xXJpp58dZEPQ1XO7HMfT/NqLjw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGKgyorDD+9o2K6ANFjt+jnhFmmZs6VEkAKYBg1Oi3FlTYKXVy
	1tPGMc0dfAIVY2NeQ3ow639vLk02N8pGUCGWhG9ZjOrr+4cNaDn6aLzWTfvpB1k2BNI=
X-Gm-Gg: ASbGncvxQ+gr3VauaEmwzL62sE2o63oGSOG1SVM845UIlrRUY62kmKtMrRJLw+SkPZ8
	AKRksqQGUREoj7cvVaafZQKChpnwHDIy3P6j/0O1vn0QyZYhSvUo7PTjCiDG5uSgW4+1k61hYvE
	iUpnaBx4pX/j5jMIoD0lg4f7oYvYEu+Xb8asOyWGgn/x6KHgkL4B1AjdpgFgznnpY7bpl0691oM
	VC4Ch3g/u25ExvM4tQgVeP53k0Bhl11TwS504TL629MMoEvw/hSCS1qby1kcZNEzArGshvBohkz
	ZWynF1zsIDtfWMvvBT0T21yF/W4/bySuqXcrQc9cB3q58wPFjkqPx2rI
X-Google-Smtp-Source: AGHT+IH1cqD8JfGDs8gNDNG0gb2rXylng5BHr1nRy86mzCRj9b/g68TecwmVmLDn832A+JGk0SdlRA==
X-Received: by 2002:a05:600c:648a:b0:43e:a7c9:8d2b with SMTP id 5b1f17b1804b1-44c92f21e1fmr126046605e9.24.1748426924877;
        Wed, 28 May 2025 03:08:44 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4500e1d3c94sm16176005e9.28.2025.05.28.03.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:08:44 -0700 (PDT)
Date: Wed, 28 May 2025 13:08:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shawn Hua <shawnhuasz@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com,
	pkshih@realtek.com, akpm@linux-foundation.org,
	yixuanhuashawn@berkeley.edu
Subject: Re: [PATCH] staging: rtl8723bs: fix checkpatch issues in
 rtw_pwrctrl.c
Message-ID: <aDbgqBKV-bIJXDjN@stanley.mountain>
References: <20250528091914.2963-1-yixuanhuashawn@berkeley.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250528091914.2963-1-yixuanhuashawn@berkeley.edu>

On Wed, May 28, 2025 at 05:19:14PM +0800, Shawn Hua wrote:
> This patch addresses several style issues in rtw_pwrctrl.c, as reported by checkpat
> ch.pl. I’ve fixed most warnings and errors, but left CamelCase and one type of CHECK unresolved.
> 
> I’m new to kernel development and submitting this for learning purposes. Please let me know if this type of patch is still helpful, or if it should be reworked or dropped.

Emails and patches should line wrap at 74 characters.

> 
> Best regards,
> Shawn Hua
> -----

Don't start your patch with an email, we don't want that in the git log.

> This patch fixes ~80 checkpatch.pl style issues, including spacing, indentation, and alignment.
> 
> Remaining issues:
> - CamelCase warnings were left unchanged to avoid breaking interface consistency across related files.
> - One CHECK regarding alignment with open parenthesis could not be resolved despite several attempts.

Don't list the things you haven't done.

> 
> No functional changes were made.
> 

This does too many things at once.  Also start with the latest code.
Some of these are already fixed.

regards,
dan carpenter

