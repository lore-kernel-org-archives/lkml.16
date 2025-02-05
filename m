Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB561DF242
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 18:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738781130; cv=none; b=M5g95im3nN4F0MQVXC8MH1GcH+aGjRmZyYfAqWj2o1tT17xW06WEKn4A0kxs+mfZj9v4hjFWzGSlWEfCU7WxfAxMDclTHz3JgbFw6GueN4N+PGkLtnm8WwYs9NyHWolrWrfEDbT7g2/EDsl7l9bhUurSbTOsr6AXgXLM4RCYvJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738781130; c=relaxed/simple;
	bh=duRGei77+6JkU/l7E0NUD7f1ZCHALVsuWhb9OE8peXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Npcds71ECJlh4uuifIMQk19f9wuIjo6TRXQNnE3aRTwWCcxaXevsOmtHZurSSPFPRVOSV+Tp/RSlS8dSsdhWFNr9Vw42Rvy2SVr0nrCmvZG27rTckmZp6/cQJ05iFT8yk99oIK8hEAwivAlNqLA2lJynqq1jQVE1aPzNl5G/fpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UHs+q6rh; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UHs+q6rh"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21f169e9595so2249965ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 10:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738781128; x=1739385928; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NoV8q92+4IwQN8DWWpMIaoB7nakPJQnyq+BT2KQhxtQ=;
        b=UHs+q6rhFYvynGa/cBWebR6fbJGq9F3OKh/cbLyiIZ2oSjkRXJZjNbmoAaqBpdjAZh
         IzWPnYzOFAeJXlJBfYkDDQ+d615Gi6m7+YjjR2D1GkSJ9ALzDiEN4lnPYN83/cO701Zs
         SHDv7tMJCLmNgzGPeHicT3O+ZLs+b3iAVdjmDyxUH+P8IQT9DIyeU8Hol5CpNdpTwt+C
         McU2uIGMoZkqNB3Y+LG2RL4QObGxDt1iQzz3QBUzWJcjLNqdl7vi9mObgboZb2YOgYn/
         NLxr4wCc5LkO6WDBTa+sxtshRALn+E8XHO4RzZF6/OQBm9IVSPaLZJZ47+Wtxlu0Z8Df
         xh5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738781128; x=1739385928;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NoV8q92+4IwQN8DWWpMIaoB7nakPJQnyq+BT2KQhxtQ=;
        b=doL278bvFpyOToLAtoSivmFUwUBnLyF54gPqIszzOYv9F/2Q5mjrFLryhoKSIq980X
         n1sLKhGhXIYVEDYeAD/x1zfoPyqGnQyXin9BOHmQjR/zkmq1wgjae+h9QQUyLkBIQqub
         TheMpo3kVF/t1DJYX1TM9CCpgjAbhSRMyAr50Q+wHpaUeYWnY2m8I/vWw9skdtqhoHd1
         XfLTOj0W3xSvPaJRPmDcyVULx1IrafPVCNk+8NYXODKWobWOT9fgZ5QVkrDY24DzSm2K
         e9l4jbk30rYivSE5cD59NGqKbVLJcs3Gh9ZHzd35JHDoRY7hm6+6y03yUK/cNF06z03T
         eqZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbMaR+BNPAQXitzmw6SwjMEczbTj2zBKXc2MfKUCRNV7gSa1v4AbN55KWWpeMP0gRw/mZKCh/qm8WDUvM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZaQj6mCmR/jTpoWVXhV9IchUC+9pgssTx00rC6L+OKrOf3KBT
	MfLJqvO09MLDOCxH5OwJJWUqpOm3Hn3QlykyCsJ0zttVja8Wm1JTv6Z2yw==
X-Gm-Gg: ASbGncvEHiMYw4EcKQ//D9Do4emLRLzrtIF1AKuhwHGHREfLna9tRYG8ENCA81b1QCi
	u+kS6QM4OeAIBWpyeXO799DDmQNc36H4rDakVCvBVLPFa0QKyNTeHiw86CTdGFuzt16TMZp2UC4
	mYDZorxuBVR5N9ocGEl/CtxOz1WwrB5uZL9nZ3EtBaJ+cqNxG4Y4ghhdZH7VOcKJyOcpTLDhMJm
	qUzarXhBt1+DRFMi3I3Wl3RiNdw/VIZgoP6aVqLw6obBRzy/jps0NxjgjAhu22xCJuWkL7rrhGQ
	UIs8VPT1WNSWt4otERWRjODftk2T
X-Google-Smtp-Source: AGHT+IGtMqc21nm91isveviDDWTUNo2AmR6GqQk/VnTAW+ODHKM7r4I5NsaVW9caTvsKBLce/1xJLQ==
X-Received: by 2002:a17:902:ec92:b0:215:854c:a71a with SMTP id d9443c01a7336-21f17edc7d7mr58175535ad.34.1738781127870;
        Wed, 05 Feb 2025 10:45:27 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31f836csm118137645ad.93.2025.02.05.10.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 10:45:27 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 5 Feb 2025 10:45:26 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: michael.hennerich@analog.com, lgirdwood@gmail.com, broonie@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] regulator: ad5398: change enable bit name to
 improve readibility
Message-ID: <bf646a72-1695-4305-be7e-a64ce9d32523@roeck-us.net>
References: <20250128173143.959600-1-isaac.scott@ideasonboard.com>
 <20250128173143.959600-2-isaac.scott@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128173143.959600-2-isaac.scott@ideasonboard.com>

On Tue, Jan 28, 2025 at 05:31:41PM +0000, Isaac Scott wrote:
> The mask name AD5398_CURRENT_EN_MASK is misleading, as it implies that
> setting bit 16 of the AD5398 enables current flow. In fact, setting this
> bit prevents current flow, due to this bit being a software power down
> control. This bit is referred to as "soft power down" in the datasheet.
> As such, change the name of the bit and modify its use in the driver to
> make the regulator more intuitively usable.
> 
> (When calling ad5398_enable, current will start flowing, and vice
> versa).
> 
> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> ---
[ ... ]
>  
> -#define AD5398_CURRENT_EN_MASK	0x8000
> +#define AD5398_SW_POWER_DOWN	BIT(16)

0x8000 is BIT(15).

Guenter
