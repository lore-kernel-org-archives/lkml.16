Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119191E1041;
	Mon, 21 Apr 2025 18:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745259920; cv=none; b=g5Wmqgxea7n5vB1A1Hq5MMgK8J6zK8x8bQwzQOK272/0CP+HlCGr2vh7joiGTKhxu+IgHKHZY9Xo2c16VgFP1TYQhSwbiiEeaRnNda9Heh5SObGTvGC/m1n8qJPQIp035TSX+I+YP4wJIvjzYEKV6wxCZDsfO2Z9QtG+WhoqUYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745259920; c=relaxed/simple;
	bh=twNH0S4pyQylEiqFPX1s507CySCI37q2nkD137RMcic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mflGgdmyvqJVavFhQwh3I9rpermlHW6TdpHMO1wCRVqd5DGxOyOWm5F9UfYs21GsvoVwFWgi+fgHI6GnqM03w2ptKZpR6BHgp7E8xVHFGtJxDsfp/5EiEO6iA7TNLcUCQwhyrzMKt5FqYD5i3BfeOf/IVw/dGrsscgcG9S7JE3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ePpSrZlo; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ePpSrZlo"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2255003f4c6so47913435ad.0;
        Mon, 21 Apr 2025 11:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745259918; x=1745864718; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kZ7lhE0zceQBiDbb/+v2JkUT6Jl1uZ4guW4PrMbfZ9Q=;
        b=ePpSrZloEQAHYu75wJpbjTY9ArrC3Ch4gNk09kntusYiNdYue/SseP4zwCSYmqBVVj
         BD37DsiiaG15b4fYnBFIw3erWy6Wj95AM67YBEBCYmFkvL7l0r8chmun4fIvdf45nF8/
         iD0lWiHqEMSgWhvJvGkHFctSklrbYxI6Trj489qwPyxb259kK9p6WSL1l4y3hx6nNI5V
         pa4ZAMHlSBv1WoQBw2Gfy4TBXWE/LdG5ZM6ceh4AlIz5xbDOpYIDaIPztBfpkuVRHDJQ
         b2CtxeFZRP78jtOfFsTMCZmZlSYDK7x2xNM5TRb9rLgKiHdbz+HdGre0uKXFhAX1xoqq
         G//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745259918; x=1745864718;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kZ7lhE0zceQBiDbb/+v2JkUT6Jl1uZ4guW4PrMbfZ9Q=;
        b=HO9c7CLmBz0HIIrSK3lss3hvA2Du8TNs5OElnySb5unIyc6Gy63k8oFHOn5rR2axR3
         Ufjc1zj+vUJ6aQPfehoN7xk581OfE0sjdWbkdqiGzF/CguWDLK0livKJjUJJEc95tcjf
         ipEtvaoUYDdVBbKN44BK1LuglcHQ4v/6CcPPBdoHn6xluwnUsl3JoP0QyjwDMxKdmqAi
         DV+Fzf/wpFdWEd+kpVW1KZjnk+18yrnZIthCOWyuk/M9tLAjC5scqd2Gvh08fxu1erBy
         iTcGrBscEtLAqcwi00d6hy6hzbofQtraId523H8NrsueTdVQ4wZ2P3c/Dc6BRmyAlswF
         BzHA==
X-Forwarded-Encrypted: i=1; AJvYcCU3mWPBcyJA5b7f8fXmIaxqud9rGibj1BYxi+YSnWpQlMmdAOBiJp6nWEbjoyVGBracMbozHvsdozACs5o6@vger.kernel.org, AJvYcCUAp67ZIZRRRtp3HaqUM/+R85FTY3sMDlnNWXd6NpJy+mXincJS2zXkrmhoyP1OaQ+VZ0o7ltQzp8REyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMYkK3ulVGkCQTD86oR3PfY4HkZITGd9dHtxPD43YnTjV8CZqX
	10X9bhV6taDmdRcUlBrFmQsRrx/sbTo0nqfcPT1+91esRmWcY1ie
X-Gm-Gg: ASbGncvoWvQRCSekFr7c+0mvGTfAR6/rQfBn9rowps9kKa8ssBS3mHJXwrcq9YXxKuG
	vGrJxLZLuL6z3H1czyJFkspHWYgugG8MVD/XNV1dACa8s/WCA2OyDUUhaxOKctuIdFHbE64vGjL
	3YaHx/lp0PvjCS5fAKsfgE+8f2oZLdfNNk+v/TOzvE7XRKr4twB27Di6I+NlXNKmAQ4yK5X7uTr
	OOmEvd8FRyMHavuJrR7MBq4/buR/1k2umz19/kkWZ+6Ohd+3kl1MdB1ZmeFBiK/9N+ZagW9raVc
	YfkE9DMRb94++y7qrqIo/e9ZhvJ1yWExNosW0WVdbwYMmm6nrZDT6w==
X-Google-Smtp-Source: AGHT+IE99OTnC4BIIEAJtKyh6nGdbIRkB2pMTx7d+sQADO9twzgO0gDZ1AcUaQ2/0ukYHywL0m1DUw==
X-Received: by 2002:a17:902:d491:b0:221:78a1:27fb with SMTP id d9443c01a7336-22c5356dc2fmr171408555ad.11.1745259918289;
        Mon, 21 Apr 2025 11:25:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50fe20b0sm68859305ad.243.2025.04.21.11.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 11:25:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 21 Apr 2025 11:25:16 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Armin Wolf <W_Armin@gmx.de>
Cc: pali@kernel.org, jdelvare@suse.com, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (dell-smm) Add the Dell OptiPlex 7050 to the DMI
 whitelist
Message-ID: <e7ea6f37-37fe-403a-8abf-23e40fa24689@roeck-us.net>
References: <20250420223334.12920-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250420223334.12920-1-W_Armin@gmx.de>

On Mon, Apr 21, 2025 at 12:33:34AM +0200, Armin Wolf wrote:
> A user reported that the driver works on the OptiPlex 7050. Add this
> machine to the DMI whitelist.
> 
> Closes: https://github.com/Wer-Wolf/i8kutils/issues/12
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> Acked-by: Pali Rohár <pali@kernel.org>

Applied.

Thanks,
Guenter
