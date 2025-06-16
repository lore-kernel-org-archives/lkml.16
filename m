Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C0442A83;
	Mon, 16 Jun 2025 22:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750112230; cv=none; b=eFxxxUCeP/3ggsdhvEhiFRBGhyYqivhimh6icttDAcS2SMg7XjVVyO0JdxLz9aVDEC50Z4g6QHH4B0fz65sDQK3nm1xGn7awvR9YKOU5svDwGv/ztWL8MJBSUNv0WRiB8/vMrFP4QocAs9PFvcbq0QogsysDAJsOE0Wtw+6FL+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750112230; c=relaxed/simple;
	bh=ecdtu9IoLAFC6tSfFm4Ul1T4VV4iYp3PqZ1Bd6n427c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AR9XiyZBBTWkodYP63jd0hBvqX+La9TmViJhBFtUu8SGbM7737ptPXLHPSY9OBSBY5lmLUtAZwHHGDhgd2oVg/hK4s04ool7fwT3PGBDiI6HTAcZ3oNYYYcZAMyjBtRlcQOo63oTqzy7aQkOXecuEP4IKxHlGWvjJLvJn3ihdlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VQDnASwo; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VQDnASwo"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b2f603b0f0dso4764504a12.1;
        Mon, 16 Jun 2025 15:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750112228; x=1750717028; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L5Fh2IblBptlZ3vF3rnRWlEF+hFPfUIR1AemX0HSA00=;
        b=VQDnASwoUUHt0TzvgpE8JBBjiUDtnxvN9uQ1oecUSjbWtqd+s6TXnpULfrR89drqOb
         ENJ3NIYGGh5d2gS1jRU4vbfx5AISS1g1LYvcEdR1DWG/44WsIE4ASoYexx0lpZMkt/YN
         Kxl8tQIwuJN22bV1xO6hKAFiOF0OQ7akfDw0h3D5v5A30RWoT8CC3EBGpYhWM1lqORIm
         lHn0dlN+9hHt+YDQKYtrhkZRx0/c1HsvNck6mB/p8IpUvdqmGTHF6cYSYnvObvmuynJt
         NFgxHuLkq86FMwQn5EFMYilnpfI1IzyVSLmpYw3FJA862e/VSRXpv973Irp/f7uKF5UM
         sfjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750112228; x=1750717028;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L5Fh2IblBptlZ3vF3rnRWlEF+hFPfUIR1AemX0HSA00=;
        b=nXiASCVqHS+2do95ebeBaJ4G2xdGRp1nv5Bucm8IyFriPZP+50vVkjSCBtmsDseXfT
         UxJSZUvy2D7qfNsVezZruhgqyfimQNKeL6vLYBUMdVqTCfQUWJPJ+YE8F92JPipOOhJm
         UrhC8kLL6oPuhzeFHuUlMBi1zWlEfDCVJEh45Cq+bwo6l3AFp+eSmw2D5laImpmlSDBq
         3NBRSfh5dSJNgWD7Uv0gtqtEAFDcL+2OpaqvtXwdK/gKHIwdehCAZID18BQBcXqsfHSy
         aRLf2QZ/tUe1tsF5Y71tMt+vC8j+amV2XEYv8zFmZlzy/pdeR4q675cbqMOjTdeSypM8
         r7hw==
X-Forwarded-Encrypted: i=1; AJvYcCUDrUUOFxsY2Ei/fJjSmAYZ223TZVgwDc9hcH31E7bL8QLazYqXwuU9/zSDHk5YaQYVlmdwkeHbLvjQtw==@vger.kernel.org, AJvYcCWmS30Az18X/22ymzEVHNtd74kngwWv3FVcGnS4EMnBl4VLTAO6EIFRX4qymUau20rlk6ty9/sjmpAHxf/a@vger.kernel.org
X-Gm-Message-State: AOJu0YzTgat1zrE1T4N388tDGtQCmpAgudtdq8UERyLZsO4dEmjo/57A
	95erEzYxFqb51bZnDzIIvTDcIiNO2Oc2IlcKHM8YzJ9X3GszwrdgFmwwAw6yPA==
X-Gm-Gg: ASbGnctfofKj2g3QC8ihbRIZ7IDFq4ZfRUvxmemGpvKgpfdUNQl21dmVMb7zvgXSF3A
	DRJUbjf2pFQzS/lfeghxdL2aMfGISUn5MTN6Oe32ualURH4DMMouGCgSTP74WR6sAR41OjyQOtL
	BrSDi9INw9Rous6qfYHQYsygxRtEMcTdmp07CKsdu/x/GDoiJ8EaKCJqysCB52MUebC1zXmiJGi
	3Nviu/I+zkrHytAZUctD3PKyoIphKwB7KY9vNf3se0JToiCfaFULgsRAIfrhZV868BYZI5zn/zT
	3xwmdcd3kE1H4ynj3wwALfZn0eICLkI8UgPBJL4wu8vGXQwdaItWnnHzRbGtUFi+EJRoMlo0bLo
	7+ijrZ+4KEQ==
X-Google-Smtp-Source: AGHT+IH0R/kwqrtGK7vSfYsjfazrkbGVD0Jb0vrp0a0cSzfE6EUdfWb215kTnNr1aWjA7NvqBBDnog==
X-Received: by 2002:a17:90b:39c5:b0:312:1ac5:c7c7 with SMTP id 98e67ed59e1d1-313f1ca7855mr17965599a91.2.1750112228057;
        Mon, 16 Jun 2025 15:17:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c19d1122sm9229246a91.13.2025.06.16.15.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 15:17:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 16 Jun 2025 15:17:06 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: florin.leotescu@oss.nxp.com
Cc: Jean Delvare <jdelvare@suse.com>,
	Florin Leotescu <florin.leotescu@nxp.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	viorel.suman@nxp.com, carlos.song@nxp.com, daniel.baluta@nxp.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	festevam@gmail.com
Subject: Re: [PATCH 3/4] hwmon: emc2305: Enable PWM polarity and output
 configuration
Message-ID: <57210f02-ab4b-4bcc-87a6-7a41a239b569@roeck-us.net>
References: <20250603113125.3175103-1-florin.leotescu@oss.nxp.com>
 <20250603113125.3175103-4-florin.leotescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603113125.3175103-4-florin.leotescu@oss.nxp.com>

On Tue, Jun 03, 2025 at 02:31:24PM +0300, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> Enable configuration of PWM polarity and PWM output config
> based Device Tree properties.
> 
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>

Applied.

Thanks,
Guenter
