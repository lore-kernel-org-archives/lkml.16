Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4152E11A4;
	Sun, 15 Jun 2025 23:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750028670; cv=none; b=K2/v8+7RqDhhgq7KYtV5LhhwQbxuX76CdiLtdfx9USOQFP1H0vAV1xrfKpKDY9GLRF/UkMKE7xhTE/Zx2ZmzFRrIK8x3Z5Dcrdm3wKUkL1513gYk72CTchXiTCAypr+fArAkL7D5aw1N+FEWvTBYLaeH7gr2UEwmYWpGW6d7S8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750028670; c=relaxed/simple;
	bh=MUzV4QvgL/T0hZ5LuphwlOKq9ko09iUKupOWDLLwFdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uafPeHMfauOp6jE8vA4K2MAszUArEiqcjRe68vuLdSlPhTFAy5E/1ynM2LxlxZYQN5LXmoo9DPSRU+k/MNxUyO1hdiMyyhWuHq3nxVltyCX2XY3Cd481wqa3lMWHgzjUaLCDymE7ULMP1/uXMU62rsjgkOSOq0S+FVKTlNCdg4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XECMpmN9; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XECMpmN9"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2351227b098so30713195ad.2;
        Sun, 15 Jun 2025 16:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750028668; x=1750633468; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O1UYljVVIvdRNWnZ6ZSoJ3bvuQPajx5wqRHKGCv/vWE=;
        b=XECMpmN9L8IUmGn53V3HZuSbmnqLxdZWelytwuivVWfaFweYa7qMtM9OwbZyDrxURB
         fcMNAbMXS1CpMx+qJ1FZRiNtjDBqKpvFo6GbgvXULLy6hm4h5vxmgdfuq0u+Fh4hr8Ve
         ggS5qq520nTM/FoBYNMYiDm/7xRMUo2gcF3bsTNaDWT2xCke95Bw4q84HHXAXzZvbvgt
         spOeFyvkT+S6YgnesijSVvVuT7gtlnnfbqsdzaevRalyeCGdXdEMIMem6QPrBOSoKJCy
         OKZ85pdzSKv6JsogDAZCVnG2uturmAuTaUQdbLEnxg3euVD9idubAMS4AHfGUyxYHfn7
         QHXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750028668; x=1750633468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O1UYljVVIvdRNWnZ6ZSoJ3bvuQPajx5wqRHKGCv/vWE=;
        b=YTXseAQu/WVTH5y8XW4E/iLtN7HEKBpX6nNVbcVMQ2Pwst+xB/ce4OP/C+shHvwSdI
         aqnD19bHSLwN22xjHR35zOfz9ecrpME352C0G7ZUeaaqSzjYgpe+zk9Jxki9GPeC3KmC
         mPMS7e01+JVRILwftdAwfkVUDFG5V2xkZEExNbDOVBa1DF0c3pYgiC7fbh5zUX+oZDxi
         hsrhSE0t2MzeZ8jZ77xUNh0XkUWIrdGKoF9fBhzS9KFlZoR2xIvARxCTmebQNgmQqwEJ
         kcFLCl8SrXL3Wbcv90smdOm6KKDzZqIA/PRDxuvo4nJhGz+u9eX5FooZqDXL7q8gCNvU
         Iqrw==
X-Forwarded-Encrypted: i=1; AJvYcCVP9hnahZJ3tjRwLyqCGN40q3d5bPePuwLDYtGqloAM9N41sJu4tIEsPERAprqx03hrxTmERdiLsUecNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoTcHZULFiD13JvIpX7alJ0U1e97Vf0b+qRXLNjVNJF1tY6CTP
	Z35njec/pOTBpnHogOz04y1xfjqCS1bMH99UcInj1taIf/bGDi8rMWbj
X-Gm-Gg: ASbGncsY3WA2A3fGsHdKRq68HLVUd7wAE9RqNBZrs1KsiPJ6awhD5E94KexGyRykX4j
	cWcI9TTOP3YENmYxZ5GOmLRNK8ILYKcTRfioEzigHN2UZM52ndoSvMwmYtiGQRINMa+S3/za1n7
	rkCBZ8sUTqMUsja0CFDie+g+9+ktPXwdjPxhGgOq8GhEMSFuRXsPg5SLAMZZel11icNapDSRiV6
	HAErKsAliGiQ/JbTZF2ZKl0K6BA+zrjaLb9mFx9rDlNdjjY6R6TQXpWCa6P2XW1ebR7vjr+j3BI
	f4a5jFe7O+OJTSq2SRgNInPfohT9lXjvx46sqVN9k4CQtiIwOy9vfvzBzlVNtQj53xUIHhZa3u4
	=
X-Google-Smtp-Source: AGHT+IEidJw/8Vsty7+T08Mhq9L0wQHa3hDZzNZli1mr6LvhwcMJ9N0P7xbO/SBYUtO1pD6fck6tNw==
X-Received: by 2002:a17:903:440f:b0:235:60e:3704 with SMTP id d9443c01a7336-2366b32ccafmr113498215ad.12.1750028668356;
        Sun, 15 Jun 2025 16:04:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365deb4e27sm48987565ad.176.2025.06.15.16.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 16:04:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 15 Jun 2025 16:04:26 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Qiushi Wu <qiushi@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, jdelvare@suse.com,
	linux-hwmon@vger.kernel.org, zohar@linux.ibm.com, qiushi.wu@ibm.com
Subject: Re: [PATCH v2] hwmon: ibmaem: match return type of
 wait_for_completion_timeout
Message-ID: <d02c8830-3db4-4200-8df3-a2de48b19f73@roeck-us.net>
References: <20250613182413.1426367-1-qiushi@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613182413.1426367-1-qiushi@linux.ibm.com>

On Fri, Jun 13, 2025 at 02:24:13PM -0400, Qiushi Wu wrote:
> Return type of wait_for_completion_timeout is unsigned long not int.
> Check its return value inline instead of introducing a throw-away
> variable.
> 
> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
> Signed-off-by: Qiushi Wu <qiushi@linux.ibm.com>

Applied.

Thanks,
Guenter
