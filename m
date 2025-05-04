Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF9919755B;
	Sun,  4 May 2025 09:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746350448; cv=none; b=IZpdopDGqyoCuHBG6eYK4rm5RVYyTiW956SCPveLqsIsiVzJhTRDInU/5GU8rR7nr8095jfCkAYp9+dJ1G4PU7BP4O3nZgJYvr2EyyKTNVKBKoPwpLWrB+ADyx/SVmphQtzwwspwFQljMcV3g1RaTrdBZ6Ta4yfz9t6gOL/T7oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746350448; c=relaxed/simple;
	bh=bnmIFV/6kiqd/zQ6ubVlJyRXXWhtIoH0Du5Iluybayw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oOdzUC4V+Gs72NKzXRwXwzODkOTeX//GxTyQB09lAibaj6Ml0GxCXo4GFM72C9/nMeQqKdHW97AlWIqTxhaBPlOPLodZ66aQQQfFx3LX1wsCtSuRVdE6wZqIE4aoMgtc+hufBXf1+WF95aUl3sBaSE35tlj1BCwnXykZjBc+FuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VxeqwEtM; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VxeqwEtM"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7396f13b750so4272846b3a.1;
        Sun, 04 May 2025 02:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746350446; x=1746955246; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=97kcTk43dhqp/d864yYFR+fImDIpALIoeTA0RgzUeqU=;
        b=VxeqwEtMxDwIlYB1/+GQ60jpApq3FRaO4LIxJR7tL9oOHc1DbtzojzJybdn0hifc8g
         oS989k0+un5EALgQ7bvohSQOfkqE92xcfP/OzfD/xCjPFFsgyoqXqC9WTnjg1L3CeqsQ
         pHBa77mrAzg/+qh30YwuHBW1UHzhsRMFaSXvOlarGtATlU6OenGk6n5VUIlKn0hm+rxg
         k8VjY4KrfdIhURzuWihU7AzTRJvQFFJvOqkisP5gU8ewuJnI6sjzfXoVN5Ou6mEZtfFe
         ck3aLiw0+IQMU5ljPjsMNhJx0AukfMcrL/DDE5pMB6Dhgj3BDvuaLS+cJOHvgVXjzYwc
         GSrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746350446; x=1746955246;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=97kcTk43dhqp/d864yYFR+fImDIpALIoeTA0RgzUeqU=;
        b=Y0UUZNphtfH1ju0uhD7elgZaf6R7OWe+EOE7VsjFk04vpwnt6+DLJ5s3ctPwRcmn1w
         SygDKP46hMRDM3kR0PvEmmUZJHAn5lDQoPZ8h32CliSTB/vwp1WZ6+qypDgtJwlUPhJe
         RzeuK4H8upmgW2TlWrNV7/D9UbBROEbjYhP9H3muZrzay7FRl820sJxjTdzKj6+B/5ox
         shvUgnKbYQhqyXun/6NG0iS5+Fee+HfzHXHULCXW98DOzo3+9jikvDtyVst3NU6R7YRt
         aOMYpfdvPEssFV71WPuPrJQlsfF5wBT2uA8nkxUkGsxrBtAdg8H+HczGlFbvN7Y3TUYh
         fK1w==
X-Forwarded-Encrypted: i=1; AJvYcCU6LSFI1kvck48Nul9ngsP9J7UPipVvRlr9yXegmglO4uwFVXi8jxwmKdAz3UnoaW5L1bMd+b2OF5E=@vger.kernel.org, AJvYcCVd2xwfk3fATlRaJ8o3nGUTshk5I101wGObKhR2epw7er5x00L8TD0jj6/6+qcjN8okDee6OaHYN5U6eu8=@vger.kernel.org, AJvYcCWBEWBqPQjAdHYACWvAmG1mDIeK1ZHRtSptHF5fUMmLqp/mymJk2VMZPH4K1TI0X6Cseud24e85r+Fr8bZX@vger.kernel.org
X-Gm-Message-State: AOJu0YymFsXIA7SRLi8IV/8GVYVIiAvfmOQc/7vjhHah+olq5PzakPeN
	CpxPqP/aE9dpI3JeTpMBQgsQep/V3A+BGv41yjfCK6CwHCPOJvAG
X-Gm-Gg: ASbGncuoL5qDL2zfmArdep3oKT6tO7MMgO66NhZPTIGP6diSl11tACYBOk7dlCharLb
	4aRDamcoUA3DLoT847QzcopzMUMQ6nnZ0UUhRLtkJAgpTEMwXVByvR83a29y09qFGyrVjGx2Rod
	8R/p18whljwKnRRwJYJZeknNUWfhauVEyo2WzFDRiUcswCn2naYisHjjf/bJ6wXCu2eN+CxzrkI
	3LXGEFiDXZuLRFIu8CxzKyMDIDi9JKj2Nj1RBjuj+06SyiXz7d1JoNuKzl50PpI0SOn8SEOas/u
	2tMb5GWVcVSXNEeHaIbMQ/mA+7s/agpYYd9Vh3R9b6qJdioDid/Kuw==
X-Google-Smtp-Source: AGHT+IFN4aggQ6z9vekN2j5O+RJwx4rkH48qO/oKOQG3MBhx99Yp02pln7uAS+pyXLqSs8olpPVImA==
X-Received: by 2002:a05:6a00:f90:b0:736:eb7e:df39 with SMTP id d2e1a72fcca58-74067443866mr7628909b3a.24.1746350446388;
        Sun, 04 May 2025 02:20:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74059021e07sm4560702b3a.113.2025.05.04.02.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 02:20:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 4 May 2025 02:20:44 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: pkarc <ivanchojara@gmail.com>, Jean Delvare <jdelvare@suse.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (ausus-ec-sensors) add MAXIMUS VI HERO.
Message-ID: <3c3e1ed0-403b-47bf-81b4-4e85192c1ddd@roeck-us.net>
References: <20250503230020.1005801-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250503230020.1005801-1-eugene.shalygin@gmail.com>

On Sun, May 04, 2025 at 01:00:06AM +0200, Eugene Shalygin wrote:
> From: pkarc <ivanchojara@gmail.com>
> 
> Add support for MAXIMUS VI HERO.
> 
> Signed-off-by: pkarc <ivanchojara@gmail.com>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.

Thanks,
Guenter
