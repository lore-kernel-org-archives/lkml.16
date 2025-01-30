Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E893181ACA;
	Thu, 30 Jan 2025 05:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738214150; cv=none; b=W8dXszMAWqjTeCho1iLVf0hgfJfmRMZiDt5q56ZZjTI33JIx+HA+0qI94tdjKFbG4UAMawutXl54HENADpNhPHV0ll4iH3bSNPGugc6mjlxTC05Hjv4b9pJ1rVi2bLsf5K+C7z6a2SoMRsvOGY62dzlczSWYsOvv2hRoiIsrAok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738214150; c=relaxed/simple;
	bh=SE/KwL0j+ef0TUqsyHNsBolEqe0zfL5aNoFxWAY2zt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fzTPonZCmWkqVEmbDchQqOe5FINj0fUpg/W7oOkojHh9gm7dpI26sQFKe4wfc7j3qUtvdsnAg/0HWjWZrm788Lc9XfAP17mnpK7BBzlkwd8iM3kjndVMJctwcYIq79xttAuk6OMUv17JdUUcwhPPmRzhgKJHz4i8WAYoQnI5JmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KjQ55SdQ; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KjQ55SdQ"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-216634dd574so3991845ad.2;
        Wed, 29 Jan 2025 21:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738214148; x=1738818948; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EyZOrDgca8ymdV1Sbyt/NSpuKO9GaZuP+6NDaC04/a0=;
        b=KjQ55SdQb2MnBPlB/F8MaYWJGNDMPq8tU7e8bAerIv5vexQhn8Jm0bzxsy89k5It36
         RgNpFO1OkDOtNm3rl284QccLcyk6WQi4kotkypeXLPOFC8g4Rrg+VPwkLHCr3fvDJ+m/
         UFZ3lNcIdMbXbL0kK1eM/Y53vPyLUJRKFOoLbSDZclUU9LqNv9oQ1Lb5f9OcoSnyAcd4
         eilOsfmN69DbOQrbnzwc2T9mMY97YuMIcLCrejErfaN8BEZBbuQrewXCJF5BBSMASTAb
         XdEISg+0xx3KtYw5xdzVv9c7f2BT6bnrOAU/wiubq25FNeAqr5qMmVNhRJiBMLaJHX/Q
         zyHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738214148; x=1738818948;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EyZOrDgca8ymdV1Sbyt/NSpuKO9GaZuP+6NDaC04/a0=;
        b=ITmOLnAwXmOeYtG5YqzP/9JLc08vvaTpeJok4R+5sgrcmt0rlpIw1EidZyu17LP03Q
         c0UT7QDV1wMZP49ffL8AWSMeramY7jyxpDpcq7EDU2bdVoO2LzKjTfGiga+ntLHjji7D
         2ZAg26r/ZOggqtDo7gSXYiG7RZpkyNPV5HzS5RZ3iKKCG885I8TGkUS+hdmwuax1tsTp
         wRJ5b71b2Kxw9j8/cZ4w/6WNdsQuc1xLTftjRrSgQB9T1Sa1E/nREajqSE0jls1pHLGR
         CiEX11glF8NZlUOnTENTp+rKsTgjdHxDR/5Zim6woGGNJTVgzU5zUKsMjEd+vBAKJkUe
         DL1w==
X-Forwarded-Encrypted: i=1; AJvYcCUeUlwoWSWvCy7Dq3sFCK8IAhGBkUuZnBkoC6pw/kROy88OnqxNfEQd7o6wYG043SKokCIcj1xxHDiCsA==@vger.kernel.org, AJvYcCXQUZxjaayWshRmRZA4c5SMCl+qVBnTh+6Tr56/N7TJPi5b6tyX58dsaMZHS6fU5VHQncwBh+VUf23ZTSmo@vger.kernel.org
X-Gm-Message-State: AOJu0YyqRV5eCOO9TpPUya/Vl7B2QXRwJRUYcNKf+x1p+CcuXsFDVM/R
	BJgU8Z++ati9/1ykFQc65d8SI9qG/6CSqVJrypEwR5YjhL0wgYnx
X-Gm-Gg: ASbGncvGxznphxC+66soOGQzpu2O0ciFer6PYEiIkuWik7yeeb56SshfNU0mfXUTiZJ
	afLLGl/Fcd6l4v/dUvIX60MqW7J2Ka3kQ49JO79U3q9YeswuAGxU0uUhDhN1/h347tsYzLnAzvt
	j+oBUz39KfYVGD5zFHI8I/g1pekueBQzYAA9uoRMGUyyUfZ+IDp7r682XK5E9OXl6ivOFbrhtzl
	0wtrbCYs13hpVr5UD3rTfuiLViRCqZkYLOiomAMqsKd7qyl8V5xMimwM6xtsuZTh9zI2SaMIo3c
	c9OI4J/OQ7Ozw8dRaH3Fv8rXLtZ3
X-Google-Smtp-Source: AGHT+IEL0ls6gcLy3zfOoWxfpZPRmkyOpzMU3WCR1lUIdfs6a6adc5+9EGnCchG+sBcdUU/kfAN0og==
X-Received: by 2002:a05:6a21:7894:b0:1e1:a716:316a with SMTP id adf61e73a8af0-1ed7a4c0ad4mr7781617637.10.1738214148088;
        Wed, 29 Jan 2025 21:15:48 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ce6dfsm446293b3a.154.2025.01.29.21.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 21:15:47 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 29 Jan 2025 21:15:46 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Atharva Tiwari <evepolonium@gmail.com>
Cc: Aun-Ali Zaidi <admin@kodeit.net>, Henrik Rydberg <rydberg@bitmath.org>,
	Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v5] hwmon: Add T2 Mac fan control support in applesmc
 driver
Message-ID: <a77c0e83-8be0-4ad6-9900-a5e9d63c1323@roeck-us.net>
References: <20250120183343.3494-1-evepolonium@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120183343.3494-1-evepolonium@gmail.com>

On Tue, Jan 21, 2025 at 12:03:37AM +0530, Atharva Tiwari wrote:
> This patch adds support for fan control on T2 Macs in the applesmc driver.
> It introduces functions to handle floating-point fan speed values
> (which are required by t2 chips).
> The fan speed reading and writing are updated to
> support both integer and floating-point values.
> The fan manual control is also updated to handle T2 Mac-specific keys.
> 
> Guenter Roeck asked "Does this limit still apply?"
> so yes the limit still applies.
> 

I just learned that this series originates from [1], that it should
not be submitted on its own, and, worse, that it does not add T2 support
without other patches which have not been submitted.

As such, NACK for this patch. Please discuss with the t2 project if and
when the series should be submitted into the upstream kernel.

Guenter
