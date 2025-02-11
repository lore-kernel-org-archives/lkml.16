Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9E81F192E;
	Tue, 11 Feb 2025 13:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739281200; cv=none; b=baHEvTsKlafnHEe1v8j0KLxtHEHEO3RZy9CocpxQWL14pFtUgXi6Xr4JG7faG7XertQ8QfGQLa5GgAuUYeZhGBaBZfA87jBAE+7Y8qnXLKrv8DuyiJECPd4xW/7kzhAYdAzekKX8zkjteuTB17cQzc3FJxhGwF1ekuA3E7GuPSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739281200; c=relaxed/simple;
	bh=X/z5RLepAXNmUbTyzCdnYvNom6vcH+olkPKA1YQBd6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D+ZTTYCn76Glv1NlnrHENx+LQ5LURC0VusTIxR+FAvgl1M1NmrrJHMmV6k5jAW//5SoCRaUXte3C4zAgO4zcx8FQmvWsN+irlfn5NNOI2cn9azeACd0wlJ3TMuCh+9pTY6Qjzfk79aj7H2yrGwdoNpmkKomh5S974aJzLuvo8ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gi7flhMZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gi7flhMZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57321C4CEDD;
	Tue, 11 Feb 2025 13:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739281200;
	bh=X/z5RLepAXNmUbTyzCdnYvNom6vcH+olkPKA1YQBd6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gi7flhMZcezO26pgkPU7P3MQXiUzFVUKKni0EjG+hA6whzNDwmNDDIiRU5njEyBfE
	 sJ/AoUcchyziuDrdMRWznfZGnA5X+QGc3Ts2dgbyt+CHxtqEWbF0UjyEOqu8ASGm5F
	 ShAUHFGfTmS2y5pRsVSyRXJwETVB5ix1duQKQD4vaD02SOm74lsJgEe3JWUavgjE82
	 BgVOnE5veQ6F2JdnoO52Wz9xbJtIi2OwcFpCIe9zfxOXCDRq5jDTdmb7bou+99HO3m
	 gNjYuIDZIGNfwfQKpu0c86mi3dZRpD1tj8f6kInMZ4HynGBzx+CX8hBKoyoF2AvMIJ
	 q/ikq9ZcycIag==
Date: Tue, 11 Feb 2025 13:39:55 +0000
From: Lee Jones <lee@kernel.org>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, thomas.petazzoni@bootlin.com,
	blake.vermeer@keysight.com, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 2/2] mfd: cgbc: add a hwmon cell
Message-ID: <20250211133955.GR1868108@google.com>
References: <20250203-congatec-board-controller-hwmon-v4-0-ff6c76a4662c@bootlin.com>
 <20250203-congatec-board-controller-hwmon-v4-2-ff6c76a4662c@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250203-congatec-board-controller-hwmon-v4-2-ff6c76a4662c@bootlin.com>

If you resubmit this set, please capitalise the first char in the
subject line after the driver identifiers.

> The Board Controller has some internal sensors.
> Add a hwmon cell for the cgbc-hwmon driver which adds support for
> temperature, voltage, current and fan sensors.

Generally fine.

Line-breaking just for a new sentence is an odd choice though.

> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
> ---
>  drivers/mfd/cgbc-core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mfd/cgbc-core.c b/drivers/mfd/cgbc-core.c
> index 85283c8dde25..0460e4e3f3c5 100644
> --- a/drivers/mfd/cgbc-core.c
> +++ b/drivers/mfd/cgbc-core.c
> @@ -236,6 +236,7 @@ static struct mfd_cell cgbc_devs[] = {
>  	{ .name = "cgbc-gpio"	},
>  	{ .name = "cgbc-i2c", .id = 1 },
>  	{ .name = "cgbc-i2c", .id = 2 },
> +	{ .name = "cgbc-hwmon"	},
>  };
>  
>  static int cgbc_map(struct cgbc_device_data *cgbc)
> 
> -- 
> 2.39.5
> 

-- 
Lee Jones [李琼斯]
