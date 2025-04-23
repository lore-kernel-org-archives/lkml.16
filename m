Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE81627933E;
	Wed, 23 Apr 2025 14:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745418129; cv=none; b=OHJhx+ryscbtaHrSCR3EpG2YA40gB+uMrLlXY84wAj4MLPz1HgW/8WwCT6uDi1jDG08cEg6Zs4aueZyQc7etbcB2KDQQsQlqd5rM/CYBphogAGj/KGKadQOYFzg4gUSVlRgywqKaTM1qtGcZMcQ8014YKOtXrhhCEANhnMErp+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745418129; c=relaxed/simple;
	bh=//O3n+s9WI8q0sdpVZ2aoBDgxil1mFFynwAFUCbgHks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uWBqZ9m//PDZCIPLp/0e61qACOozrQdGq82McdzElMLs36sc7xzgx90YCsQMSeGLuH3QhrzAeZbfY1uQ9AxwtPrxbltyXi+/mONrtF4ZLTxNDRmLVeG7NWEBHJ153ddbFCuNFc8oB1K0MhNjSOjJJgzlWTTsgExKwhumEX+W6Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ExipBvwa; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ExipBvwa"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-736aa9d0f2aso8085207b3a.0;
        Wed, 23 Apr 2025 07:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745418127; x=1746022927; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XIw0UYaFvMMI2u1I6TqeCLwaIYg00Cip+Y0futxgzOE=;
        b=ExipBvwaQO86VTDPpDhCQVexiwiQyR1De8jwCpx5qyRQVZkpAipDVxMf76cwhOb+Lk
         5XUwTrberN+DZK8f+oz/hbQmsPHHDv+fAp0nQFGgw2qESBY4gSWWA1S8ILbvuDJLCSD4
         6tnmphxlZVzm2vaMSbF4ZvhOnWQqCiqYQy8Jtt0stpNPIZU0BDtabOg/bJWWbEntnsrq
         /FD73G9BwvQrqON/s4PgjLrmKqRhv5d/pZvGcbtCihGXrJnTVsjqmpiCZehKT53b6bNT
         7H/VWEe8+Qx9TQruTVuVkyVyBhcZRHtGgna8iZVznK+TKom77PnqvUuOpzjlgkDPeeZp
         p0Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745418127; x=1746022927;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XIw0UYaFvMMI2u1I6TqeCLwaIYg00Cip+Y0futxgzOE=;
        b=T2FlAU2iXVtIeiT8OnjANkuTxaD40HYuyUCm4XZ/E3L6zSWTBGPmXSvLpTgTwXPbEm
         3Jp8UZ5qPiR+L5tuiwD6XNqUYEEKpHugBlhgvO7iif7O3tywziYgCFJs3d7LxryGMq8h
         eaRzY6hIEvVR8IF2F41eHBR4eD/Mu+dPD3QG9abRAIr3nNez3Nx3LwdS9gqYueUHCDT+
         hXQE69dbNrFW3ljosyBPJtblbq7WeaCDdYzPcRvwq246uG0+o4B2lIgdKrRp8I4DWFAS
         pSe/LAHIWyPBlqV6C4T0c8XxIHXzS0h/eNfTY0BzZJb2uKHGXY0zKJnlXuqx4S5M2HE6
         Isew==
X-Forwarded-Encrypted: i=1; AJvYcCW2sNuaZyEgZJCV9UU7Fkx3c4Ts7aNxgGpMwNwugapDOI8ahmyNsc5N6Roo1puqjr6LH8LDHIWoIextnlZD@vger.kernel.org, AJvYcCWIsSNI9uE2o5iP4FAbfj/J5Fffoxl9bDXiC6wJvAHK+K+FltEJN/z5Cs8+lHhqYHTRpaRUByl9Qssrj3w=@vger.kernel.org, AJvYcCX+IkVW0i/0bMwBV0oCwZQHdLI0UswiLcWB/Z5NgL/DC4WTFc6y2IMxme3AZKyfWX7Zn/nIURbJXbA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuI53sCeRqGRQD+2VaGjz9du10GeGyeASpwq1RqISzO6wUUyIf
	P7JvmstoI4QzXLWNDvH/lNizIuf/hZ2uliSq6gAGjdz8ZTUDAMgW
X-Gm-Gg: ASbGnctCizykK87Aq9ZUba0P+zpqAmyZ1JWNn9q1ViCg9RVZAd3QBh5oG2DKJrIt4e3
	C7TN0XnYD07YmY+ZfVxKfogYzlQE17I+2Ck0xQM8gTzuHNy9IQ1Y9wVotstavbYA9igeLcmPToz
	ZXv5QMBX5J37wNiKVomDPDxdYuAT2Xvvca83yqRm5aIOV5vJn2tO9Zs01bLdd5ruRyacUBSAdBe
	l5LcGGjRVKcyiCC7IcqdLE07mebnS4lopUyQrAGfCPrDsR2UpBG5vtxeHt1pOStmhFYi4DNpuC6
	XP1CcpyZaDsgTGPB6qedXPaM6LG2K/Uz9DaWYdC7FjKdmRyeU3KDdWPPiSTMKPss
X-Google-Smtp-Source: AGHT+IF+BiqgzYIG4OfEgb+CSUaVFjx8yLxRJNukPfrnDRIHv5Yupej8qhzJ1BIbOiwneadSKVxqPA==
X-Received: by 2002:a05:6a21:900e:b0:1f5:a577:dd10 with SMTP id adf61e73a8af0-203cbd24088mr33055873637.36.1745418126920;
        Wed, 23 Apr 2025 07:22:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaea91asm10624167b3a.167.2025.04.23.07.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 07:22:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 23 Apr 2025 07:22:05 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] hwmon: (max77705) add initial support
Message-ID: <343ba416-fa76-49c3-8ac7-4c4e2d449bb1@roeck-us.net>
References: <20250423-initial-support-for-max77705-sensors-v6-1-ff379e1b06c5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423-initial-support-for-max77705-sensors-v6-1-ff379e1b06c5@gmail.com>

On Wed, Apr 23, 2025 at 07:54:36AM +0300, Dzmitry Sankouski wrote:
> Add support for max77705 hwmon. Includes charger input, system bus, and
> vbyp measurements.
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---

Applied.

Thanks,
Guenter
