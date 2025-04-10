Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A807E214A7B;
	Thu, 10 Apr 2025 23:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744327070; cv=none; b=A6bdvsS22kbnfYg6BpwtuwRaR6DYyN54WjQvTABKoYMOyUnYKxmdkkNFUMkTIZyDUf4mQs2vvImIOi2ZHWMP19TQ7dVackHSGXHp/sP2zM+GL9fgXWk494NQoFN9N4Unpygsn4XGJAIPYyBbyHqn9pVkV3kBv2g9uLmwCD7WLaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744327070; c=relaxed/simple;
	bh=uztB+MDOU0RGFVZzDviWa4gZaYZ2koUpXTwc8FTnqgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c28ImztLCzshJmbQKlQPynDfMFO8r6w+jAgENVW59ZGnggbXkN0w6F+Uege5PF1diC8jkGljL+znSz+DDPCNXqKDNf4xXtcDV/kj5XNRbYkOJ8gr9MMVqzylm3rq3ZJ1WvpNIqt/mgM6cXd6aVnwLCa+lSPwZpXLzOTk2IBlidk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HvPrbX1Y; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HvPrbX1Y"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-227914acd20so20834515ad.1;
        Thu, 10 Apr 2025 16:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744327068; x=1744931868; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fyf4TgpkX4MStq3RqTtnEMUPD3RgQ9TMqI53eV6/HhE=;
        b=HvPrbX1Y2LLWTLQgugfKv/cFsW0V5cqtg34BmxRVFUg2+tyLI/eCXROIqCOocEhbgC
         M2+dK6NGIxidV+3//gjWKzSksin/noOl8LvYwp0LIO2yn3VHdgtywI6VReCOPXr2PdKK
         eRZTy9yklC8REgyrtAuFPYfjrzIeJQXivSYYPqB2pR8vUr486/xvGiUrTg13hx4l3XEu
         q4zfFpcsQJYkmotmBcI4XVjOS2Sz76I0DgZ/HgqHq+oTKF5qjYAtighv7CsEGknKvSAN
         NToCwkaYkdVYe1ghFShhwA5o9QFVOzhM3kvH2ZDQyd49PHR8zoS8hfKQlKWDREJCY+9w
         SBgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744327068; x=1744931868;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fyf4TgpkX4MStq3RqTtnEMUPD3RgQ9TMqI53eV6/HhE=;
        b=YcwLK1b5zVt6cRD21xW0vJLKA4D1xt6CwJjkg4rKHZGc5itKcRdmAGGTVBa7D8OPb3
         IiY6ux25vAPdPmtONVB7Wy5FU2D/ioW37J4b8mOsT860XxmB2iWO97NUVSV5ksY62yMw
         2+4eTP3n8Vww1O7RU1Q2yhR40kZmYd94oFSDgHm9A6awMt0QB2idVtqBAYRLXNyMx1fO
         a0DZ9dzcFg2+BXqArh6FdAMGm2sGgUtkbokY/pJIHJPunrK8WLNCiah1BhKmq8dKC01/
         jtJHawhEdwyNtTQOtc44FbJh43AFlUIjhAaa5zOQu6Xx413QdkFCR/Ax9mTDTCzo5+OE
         P6yw==
X-Forwarded-Encrypted: i=1; AJvYcCVRDFVj1T5A21IN72Y1pP3U6R3fYcq2x2Syt897ROTzSBlKtiZIQSW/Xx2CnlWULzuD5TKcjbIzkDf6jw==@vger.kernel.org, AJvYcCWDG7OR8zQRPVFCZbfxEr8VnUrpPITSVsRNs+B74w3ftmqzNduIEkItJxvflwcArFI6/NBA5l8GlDNTY2Nt@vger.kernel.org
X-Gm-Message-State: AOJu0YzkYtEiS5ZYjIl7C2KO0STfCCN0nlkaq+5dl2GxdOOXYjK90/s4
	VFeFzTFm7KefEjbXdhi0MtWYFPPnmVgxWPhxok1tvAORvCVfZlC+FyxVpw==
X-Gm-Gg: ASbGncsgydVdf1esiyPtzngwrZO6Cd2te4JE5FdrEI4ZWGQNiYQ08OjQ36oLk6i5mxE
	cRVuYqBN9D9jMOVLeq4ZijVMlE0+V9jCWepzj2UjmqgPqFoPt2m76IxQ+/68FkJOEdorwY4tzcj
	xvJRR6G0WZdnvZZstukp3QQkmGJrDq9jQyIYxgreuijkkWd+C4kCZqpY379JM2qNO/kRWm4u/IY
	oM10bfcPMJZRZkh9lg2nJX44C9lTdogj+5EuMRZPsBktpfCcoe4VhcmPmsDJEVu+e5YXIToSw3T
	lY5MpsA1LMuHpKrA1sQiZBJZWNLdNlGkmbwgOiGrVhEGYOuO8WWPQ0MxLX3Bramm
X-Google-Smtp-Source: AGHT+IHdvfzpB2pJRSPGICFUmkMg5g39Eg3WbDvPweDV+Zhr+DgPTB8VdRJpz8jRBEdJkYpRCSa+ew==
X-Received: by 2002:a17:903:1b0b:b0:215:a303:24e9 with SMTP id d9443c01a7336-22bea0253b4mr11572175ad.3.1744327067787;
        Thu, 10 Apr 2025 16:17:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b62873sm36600655ad.31.2025.04.10.16.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 16:17:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 10 Apr 2025 16:17:46 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: John Keeping <jkeeping@inmusicbrands.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (pwm-fan) disable threaded interrupts
Message-ID: <50061382-1d1f-4712-9056-f9733b4588e4@roeck-us.net>
References: <20250410180357.2258822-1-jkeeping@inmusicbrands.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410180357.2258822-1-jkeeping@inmusicbrands.com>

On Thu, Apr 10, 2025 at 07:03:57PM +0100, John Keeping wrote:
> The interrupt handler here just increments an atomic counter, jumping to
> a threaded handler risks missing tachometer pulses and is likely to be
> more expensive than the simple atomic increment.
> 
> Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>

Applied.

Thanks,
Guenter
