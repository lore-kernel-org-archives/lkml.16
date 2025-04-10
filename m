Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73198204C2C;
	Thu, 10 Apr 2025 20:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744315453; cv=none; b=aoKxoFq69emLtCs+cOzSXUmthqLNE+wfVNq6m+mFTpg6YqKb5jLNnzVfsZ1Fy6HFe3UjS8wPRHbf59H/w9VOnObvlydRImcZrhvgl3r6BvUjpfUrEVZLN+7CerFPIR+lG/zysI3lY/eOSXYgT1a1SKmI1SA5tn5VpkLowJi6GGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744315453; c=relaxed/simple;
	bh=qVFTzSs8m8/JdOY2MSSqAb2TnfoOm90LtGGHmpPAkPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NLAAkGNS4Z5Yz2aohEmC82cPUpqQ6gi66LTDbppdQ9UfPs1HFV8OObKeiUSiR1W4aBU44mafRLxjuQEpNPQp8skcj2DdjHD8vch9Wc0EteftkJDsZ0/DsiXyTVkzpBZh2ZTF2iOtYPmgFs344vnGHZWoFU/nzktCjbwXP2hL+Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k3CXiQm4; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k3CXiQm4"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-af589091049so903923a12.1;
        Thu, 10 Apr 2025 13:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744315449; x=1744920249; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+BPKKwTgw638zeDPa9t4YN31D0zKBuMnDnaMDeC0Pfo=;
        b=k3CXiQm4Pm7ZLkIQncCosFnb6jHF4zvCZQVMwWvdgsaU6pl9DVcZq/8qmtOb8RjnoW
         oXWkXvR6ZAOcm9rTRI/YuxZy/1NMPQtaAtJakBasOwL76WICwGNL8/ykgCwhUYEfR62S
         ezjlyiXMxbH5J/RUwpLc0g+JquUKBygOLMrf+khUMOOAUdEgaobZSyg7e/gLeKilN1CK
         IMUKzuYuTFR4qPyMJyNCQjd+llyKyE4vUB2NYz9FZn2L7PpdQSKf+Ukyj44G/DNFHqjs
         tk+g0E6JNy1jWagaW4HfSPx9vPimi6k9fMnn+LPlwzMMPKfPI80Wk8hm0+wfKVNnWgeK
         eBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744315449; x=1744920249;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+BPKKwTgw638zeDPa9t4YN31D0zKBuMnDnaMDeC0Pfo=;
        b=gD0w3MiegniY6fcuOn5jnbN5FetqqwSEjNFYuFJ2v8sWIZTpY4Cba6MaPVKqAta/KH
         Xxhl+NbTaL8sPF2ygBEckzl8xbCryp1cpdNj08nC3FhAulFiAad9RqVH0vGYW52ZJsc0
         EXOFGY8PWwmrYOF79jpApw8mDr9wyamyMHAne/ZJQzQKOWku3EVG9Gj7UafQTubSTEMC
         yWfIDfEvKyVtJhYnhRgyb9Dr9dA/RjbUbKCdcrUZa5YQDwx3SUJ5IVj3e1Aq/7Jr/qT4
         xJbGhmhOE+RMp4WhgLZL6AZyBwn5AKxott91w32NxzdjQWa57TFMnvJ3H41yaXcYapYZ
         u5sQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxyWpAbX98GZSYdhIpLfTfsO+nJL6ShO1zmWD1VOqeqtomFndCpoPPo15LRpgSgb+X2BtEX3VJfXpcH5DK@vger.kernel.org, AJvYcCWdxwj995cyyEXrElqsAQWEaJPPr+zs6iCWMSp5vIobSsGzKv3E3lF6JbJoTpLmfvN/1CmAYCE6XmzjTg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3QG+MpdonkJFNiZykC9pN/w0JeqxRGDrKaorOIkyOoSikVEgk
	UsLkJVWaFCqBSZdo5G6mP6wXbDpzUGo1Nolt/UTkLC08Z35Sd+5m
X-Gm-Gg: ASbGnctYAhENd3GUD7jZjTy0us2c2LtbRUBqHJgMXz9OzNtmSDa6HcJMm59asQaFjEj
	j0Nxz7orDXAX5N/6vwPfbdOnBiEIYxjPi/LYHVDejZBeMX0IHgkFfdpnxHYrpSoj8R26y8aN0AI
	HJOm1hH3qaEOgL3O9tfjfI2H7ZkP6syXsGelJreWFCE4z6I1wrRG3IWrC4llhgYktYvkcgf2Uek
	6KuJRHNd1o9k+eH4jB02a8AqyLGNKk08qQmmc5PEV335qF1PxxMzYAFTsKTJaDVMuOOEWyn2CXF
	eEd3AhNKl9iGVDWU9XVttgqMtx6vSQ2TlAvdSdoTjglm0dtwGRTvDA==
X-Google-Smtp-Source: AGHT+IG9hWkQzbKUylOmpVq+IvEgROMzWpmbJbm3bKw6AAas7f3lnBn/i2pnRIweuQkjh/eQw7mn8A==
X-Received: by 2002:a17:90b:6ce:b0:2fe:b470:dde4 with SMTP id 98e67ed59e1d1-30823670b3dmr427427a91.12.1744315449463;
        Thu, 10 Apr 2025 13:04:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8c62dsm35028245ad.95.2025.04.10.13.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 13:04:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 10 Apr 2025 13:04:08 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Purva Yeshi <purvayeshi550@gmail.com>
Cc: Luca Tettamanti <kronos.it@gmail.com>, Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: asus_atk0110: NULL buf.pointer after free
Message-ID: <bba9ff87-90de-4eae-99d1-647ee413d480@roeck-us.net>
References: <20250410183450.15514-1-purvayeshi550@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410183450.15514-1-purvayeshi550@gmail.com>

On Fri, Apr 11, 2025 at 12:04:50AM +0530, Purva Yeshi wrote:
> Fix Smatch-detected issue:
> drivers/hwmon/asus_atk0110.c:987 atk_enumerate_old_hwmon() error:
> double free of 'buf.pointer' (line 966)
> drivers/hwmon/asus_atk0110.c:1008 atk_enumerate_old_hwmon() error:
> double free of 'buf.pointer' (line 987)
> 
> Smatch warns about double free of 'buf.pointer'.
> This happens because the same buffer struct is reused multiple times
> without resetting the pointer after free. Set buf.pointer = NULL
> after each ACPI_FREE to prevent possible use-after-free bugs.
> 
> Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
> ---
>  drivers/hwmon/asus_atk0110.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/hwmon/asus_atk0110.c b/drivers/hwmon/asus_atk0110.c
> index c80350e499e9..83ee7f25bb8e 100644
> --- a/drivers/hwmon/asus_atk0110.c
> +++ b/drivers/hwmon/asus_atk0110.c
> @@ -964,6 +964,7 @@ static int atk_enumerate_old_hwmon(struct atk_data *data)
>  			count++;
>  	}
>  	ACPI_FREE(buf.pointer);
> +	buf.pointer = NULL;
>  
>  	/* Temperatures */
>  	buf.length = ACPI_ALLOCATE_BUFFER;
> @@ -985,6 +986,7 @@ static int atk_enumerate_old_hwmon(struct atk_data *data)
>  			count++;
>  	}
>  	ACPI_FREE(buf.pointer);
> +	buf.pointer = NULL;
>  
>  	/* Fans */
>  	buf.length = ACPI_ALLOCATE_BUFFER;

buf.length is set to ACPI_ALLOCATE_BUFFER to trigger buffer
allocation in acpi_evaluate_object_typed(). The old content of
buf.pointer is irrelevant (and not initialized to start with
in the first call). The problem you describe does not exist.

Guenter

> @@ -1006,6 +1008,7 @@ static int atk_enumerate_old_hwmon(struct atk_data *data)
>  			count++;
>  	}
>  	ACPI_FREE(buf.pointer);
> +	buf.pointer = NULL;
>  
>  	return count;
>  }
> -- 
> 2.34.1
> 
> 
