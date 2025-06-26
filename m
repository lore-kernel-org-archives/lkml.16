Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490BC1D5170
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 18:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750961112; cv=none; b=ofO3nDb66+eHFuAe0+/F/rRYTHcwj0S148upf3BdTWrilmy4ik8dnxo6C5Tt+XLqGUeesPzfxnCSAIRIwuaoUNqg6das6wzHH/qJgABgTdsB8kUYaF9xQOkYHwlQqNQ2bKulzqVoRKQrb6mNj0IcXvXLpokfc6629vgD+T3ibjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750961112; c=relaxed/simple;
	bh=KaT6NFipBaP+7uuCJdfAzl9+3V9on+Bs/E7nEI3V674=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PRr+I1NYHqWkPU5I7mf+WrfpARdoPjiB5uG92L7iQJbqJ2bLmN0qKAf2Y1X3f1hdp96uofWoeAhOh123aTHvTB1EsMehDZ6sbqLTDEIhO2V2rHFFaFAaDTxa1ySkHQkS0cRZT7gzOxZRU1TivmbcIrrSg9X1SXi97pXN4q4Bu+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=He6Wjpwj; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="He6Wjpwj"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-40791b6969bso937416b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 11:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750961108; x=1751565908; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2jdIp3t/JcnvNgV/EvawInKAMJ+vsXxeF/1Rq9fXb34=;
        b=He6WjpwjTmx2Wu6zSo+tO7GQ776ElNtRtih3OV2DqD3WUZjSXs3W4VNr0JUZiCiTF8
         8ZdYj9hGOxwtZ9PpFfZz0qkkQD63//CI9+7iTrjkT6plOf/rZVmu8TROHdoVSKPHn84i
         j+E++rV/7JFLMZCmMS4OW8B7aoFY79RQ27EedBBkJ4GGAHrq7ppe7a5trdC0oN8vZyY8
         BqvOXMR2YKTr1uHEJCu20XD6ukm4Z/nq1U3AuG4OiTtXF/tF8pLMGQRXsj4KhIjreXcu
         TrrlGFwQA7SDsE3dw2w2vcmvtIHAJupS+ot5VknBGgZ1eQi0g/P4OUp/4L1fVqf7fVlE
         c++w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750961108; x=1751565908;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2jdIp3t/JcnvNgV/EvawInKAMJ+vsXxeF/1Rq9fXb34=;
        b=sB3GLs/h/l7AreMFO4cgOqaf2qpdxkShcI/hk1ockvFUeVeHBgg1UQMpSoD3OhgqFY
         e74SLi30xAqmHisDdo2g+/nA1gEpToQ2vKdaSUk/yUgdEN2fSSbpotH4oVxM4z8qjuVU
         CNhTI7pOrx0Xc1kyxSnLEbu6avwqeM6RiUJqKAJg7OO8KtUZ/DS8wdVJdO7REnHfN65R
         13UI2FTM4NlrVcvErxRsOKs4WXt47Sf5EIXr+lc0W26TKXL408+3y41lyfCPC6poDuB8
         UZC6OmFDEcEmy9kxDGvbrXZQYvUPsKbkS001qlVbcfMDA7wKH7Glkd4X6loXNtDuGO5K
         0I0A==
X-Forwarded-Encrypted: i=1; AJvYcCWn+1RgLbaePiQS+Gu/U3ZLwJOYsJP3o8xvAfC1b1AhsCV8XZZD1Z3J90rIkzJreHR0b0bHHmqN3KbrhO0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe55103U1CTct89qbj2O+cYDIuzVW0X2pOIOt3Dx0mnGroVyo+
	39UdRvV8HZEWZnnqC/WkXcllj0fMcl5NzSG+3E5SF7tam6VJOkzFVGUeC0Oqo9y78hk=
X-Gm-Gg: ASbGncs/Yp6CJRES8xn9j3yE5E+y75mRsN0WbvUzVJs5NvhIjBOyxL58Eg+jnB3kCIK
	sChXKL3A9Z50395SQ5b4aiRu0Hp4Uuv+OVw2KudKfjdR7sL6d6+U80NWEAh/RG/Hu1ASRYUkMPV
	x2uz5ue2IO958NvVed54hAgwOFZlVTd+fTCXq9h/Pd3nulvxmG8HW48j5pZEYU2flWMVjplBxRP
	ISpBXNFJ0VB6jj+Bf+rbPDJYfjmRz1sXih1Jez50mKviIXk6EW6x3JHhBeFa3bCNDzg3EDjgMzd
	F+6Fzr+U2R0dUmgmC7gasq7B1jzvFnYRTGz9Pi7BEZmQIVVObmLe5GOKbj1N93+AGngL
X-Google-Smtp-Source: AGHT+IEL45qBZ2uXaEhapcM+NgWFI00UFnRWP4NW8+AeUpc2hiUpniAGVTq3f++FmGqy7GeXB2NfPQ==
X-Received: by 2002:a05:6808:17a4:b0:406:7186:5100 with SMTP id 5614622812f47-40b33e18292mr142490b6e.22.1750961108418;
        Thu, 26 Jun 2025 11:05:08 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:154:5a01:d5a1:16d6])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b32438b5bsm49071b6e.44.2025.06.26.11.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 11:05:08 -0700 (PDT)
Date: Thu, 26 Jun 2025 21:05:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Pratibimba Khadka <pratibimbakhadka@gmail.com>
Cc: mchehab@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	"open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" <linux-media@vger.kernel.org>,
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: av7110: Replace msleep() with usleep_range() in
 tuner function
Message-ID: <4520c798-9372-4aa8-b6cc-f919b0c2dc59@suswa.mountain>
References: <20250626160853.8772-1-pratibimbakhadka@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626160853.8772-1-pratibimbakhadka@gmail.com>

On Thu, Jun 26, 2025 at 09:53:50PM +0545, Pratibimba Khadka wrote:
> Replace msleep(10) with usleep_range(10000, 12000) in the PLL lock
> waiting loop of nexusca_stv0297_tuner_set_params().
> 
> usleep_range() is preferred over msleep() for short delays (< 20ms) as
> it provides better accuracy and allows the scheduler flexibility for
> power management optimizations. The 10-12ms range maintains the same
> timing behavior while giving the kernel scheduler room to optimize.
> 
> This change improves timing precision during the PLL lock detection
> phase without affecting the overall functionality of the tuner
> configuration process.
> 
> Signed-off-by: Pratibimba Khadka <pratibimbakhadka@gmail.com>

Sorry, these msleep() need to be tested on real hardware for us to
accept them.

regards,
dan carpenter

