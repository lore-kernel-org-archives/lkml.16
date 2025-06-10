Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D69265CAF;
	Tue, 10 Jun 2025 20:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749588756; cv=none; b=PkSXqpzlMsW/XBvfXBfYX7VMn7tFLmY/Ufp7ujvMYrjwT+8frI6m9hMx90mxElanAoPMjq2ZZycHozZzn4FL6eMHUvUC8UmjWRYAfcrFwBxk7t0pg164eXT0j2l9h9/FBAaNjyk/2O2dZJBQEqh5fQA4AMzYt7/rwIzXZL0yXFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749588756; c=relaxed/simple;
	bh=N763iZbfwAJQbjkDRom82zHox2+OgmkLsu9JE8B7k+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UErmTAgHhVzbnXrMvKMsdF4XmgHKw70PgecLIBgHO9KXsLMsnNRt5ZheA54AW+yVEefoXZX3Kf4bOowpu7stPFfbkZTCEF9/Q0Fua19C07XuUb2PJV6yaJIHxgAcgrGJ9U2o6kzAq+1IZOzee1BGx+OFMXZ2cSGUthmJgC4ldEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TDteJcJm; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TDteJcJm"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7406c6dd2b1so256990b3a.0;
        Tue, 10 Jun 2025 13:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749588755; x=1750193555; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lE9yaZP7m2IrYlE/IaMtVOw2rD5v2vU2kav7ruBWl0k=;
        b=TDteJcJmPNGo9U8YstQZKeikyN4BL9ncDAqlRRJ5uyIscQN+DexKn1tdEaIgR2iFCD
         YmJXdOWeHAzda6SXehDoGghSelHvqPLYLyyI+zeepjjHoxj5sAMWMm9jR+Um+efg/RC/
         rPGWKjkX+lWUI1HD51LxFM/Zcp+tlnRZ4ng/pHQM4XP0WvWR8OSbklRWqCTQ9nVCW8ZM
         9iRrVS+ETLS3Uy1FyQGBxQxxaLsPbWqkL3TnigLzN3Ow0oGzf/lNjvFtHLebN+/DoOiA
         qw8k8Ew36p1JthFPPvLw8a4NseTZVDf6umuGJA6SasTsYtVo2QBdFqWqmAhT9q7umKP6
         yogA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749588755; x=1750193555;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lE9yaZP7m2IrYlE/IaMtVOw2rD5v2vU2kav7ruBWl0k=;
        b=baE3zwjZHp+ea828ZHkMVKirWXSs1+0Zyb5aSIEl6gGTuaQE5aJTJgcegw2Euzx6Hl
         OsgxvfDrDscJ+d8oTYWZq0mtoJTInhnyGD4MynvdV5Rsk2pPPjO09ufIPJZH4svr95Up
         +4VbVW8W4G/tLmgPLOSGHn1P02XP0N06bnzwec2Jsx+yBCbMnaz7IckRFvLIB7XCFCiT
         DNynv8hX2pmB4fcLNV+smeLYVQJbDqdMYTDooPQqt3nmeZC/AxoC9G355B6OOhcc2irJ
         otNjIa1oqt8zNy9Mbbeu+gCC0ZLJwUSRAX8zr73phw8rEQJwz+R+dWng/wHx/L2l/0xy
         sz0g==
X-Forwarded-Encrypted: i=1; AJvYcCWgxqbat5kGM4c4sMZVj59/9q6Z7VSajatQfLzV6WQwhYZUW77bd13fU7YkUvfGwlZAXb3nLOzUHElnOg==@vger.kernel.org, AJvYcCXUjvT0SeQZAUumc1FkiJsGuC4FFiaPaNW6Szg9GFqf2BMPlBTFsPP21FLrkuXSYWpvK/b4B94nf0KwhdPG@vger.kernel.org
X-Gm-Message-State: AOJu0YymckJyM0qCX2iaaehNoPpDbnhIMuK8+ZL7kkequa/T4KItjtmO
	K9sNLP10TjUtg7tAfZilj+EickEKnuxIAKDkczhd/w0x4ms4DtJSj/pG
X-Gm-Gg: ASbGnctupfW/wh5jEuysK6px2Zs3eVkUv5LhDM7G0s+nngQeCxIEcQvCGplMqTa31r5
	I6amqskhiHSQhEDkpPJnVQK1meQqMbNCXRiK/LZH2kCKZ0HLTfRtNmZ8igaYmptHAw5anUXpqU+
	Y2q+ZkLi3Ec/81YDodMDT+VAbNrkDEGQKsYX/v40LmJexqv9NGu2ZsDGnH/BVpj+n28HnwGoobO
	7NrTmZ3gg5tZAovVPzHMdcW0ZMZHvY7kRJpQ4BiXGU5oJO4s452QtfjOVyA2gvwjmApD6OQrkzT
	/fcKZsjznUyuidT1+yjaoUXXO9ejXefeT+BKerESyDneRi7Occi0aMgjkknBUGV3HUfrFpLRTe8
	=
X-Google-Smtp-Source: AGHT+IES+OJxDL4EfEYgAs/0gyh3pwXO1ZRiA9IclKpJpgSIAy/ySAcCmY6ks2+e5T6Rh2YZxSOoHA==
X-Received: by 2002:a05:6a20:3d19:b0:21f:56d0:65dc with SMTP id adf61e73a8af0-21f86f27b8emr966321637.13.1749588754714;
        Tue, 10 Jun 2025 13:52:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482af7abebsm7861513b3a.47.2025.06.10.13.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 13:52:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 10 Jun 2025 13:52:33 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Eddie James <eajames@linux.vnet.ibm.com>,
	Arnd Bergmann <arnd@arndb.de>, Al Viro <viro@zeniv.linux.org.uk>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: occ: fix unaligned accesses
Message-ID: <6eb501b7-501a-4e55-b340-88c387c1078c@roeck-us.net>
References: <20250610092553.2641094-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610092553.2641094-1-arnd@kernel.org>

On Tue, Jun 10, 2025 at 11:25:49AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Passing a pointer to an unaligned integer as a function argument is
> undefined behavior:
> 
> drivers/hwmon/occ/common.c:492:27: warning: taking address of packed member 'accumulator' of class or structure 'power_sensor_2' may result in an unaligned pointer value [-Waddress-of-packed-member]
>   492 |   val = occ_get_powr_avg(&power->accumulator,
>       |                           ^~~~~~~~~~~~~~~~~~
> drivers/hwmon/occ/common.c:493:13: warning: taking address of packed member 'update_tag' of class or structure 'power_sensor_2' may result in an unaligned pointer value [-Waddress-of-packed-member]
>   493 |            &power->update_tag);
>       |             ^~~~~~~~~~~~~~~~~
> 
> Move the get_unaligned() calls out of the function and pass these
> through argument registers instead.
> 
> Fixes: c10e753d43eb ("hwmon (occ): Add sensor types and versions")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied.

Thanks,
Guenter
