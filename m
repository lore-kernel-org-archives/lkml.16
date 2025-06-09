Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7530919EEC2;
	Mon,  9 Jun 2025 21:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749503970; cv=none; b=JI89b26Obor0wgbWSfrhIv7emFHCwy3UuLGjPw7QrEYwbD/X5moYwcoBV7e2nRpG6VMgUU12BmylUjX4X8Aocg2RJhGWjeXWejSv0Tdd3EVXrLbX45J1s/AedI7PZNw5T2WTbaedZkKqZ7ZF1Wqnf1aUIYn+3RRHLaYGwV67Kdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749503970; c=relaxed/simple;
	bh=x64TgVXEOrKhCAA8Q+LNTF2fqNnZxkiVOcb395AX85c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P7smND7qzjiHHc4iJuGXM4facNLO+TWA+NBv9l+xbzH19/eMpC3t2vco45CSv50L1LUJJbAroc6OmfvQZqoMgD0CQkAQ7qqyxDP6Ih7lEjfpFbKR+bnej8v5hoYGkFYXI9YwP+ct0UNV9860HUKk+I6JyUoSWXw5MmJ7BD0BGxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IVlgP6UB; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IVlgP6UB"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-312e747d2d8so4133816a91.0;
        Mon, 09 Jun 2025 14:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749503964; x=1750108764; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zI31dEC4mkNsuAEjV8kYLOz0S1P8/9VIxbXknfxECwk=;
        b=IVlgP6UBu3wVtdKq7/XFFqkfxC+xJgbfntBo80eatKOMw4vrhfU4I4Ipjr3o0r2cFz
         5o/zulRb88Ojmol4n+Rsf93vBF2teqy6//QUwBTP4dex9ImA6dPAIAlATh77BVugaFuh
         zmnib7oYUOIxsZxrmf4A42rB4kMtYQP9g3uWL+10YSqYtxLz8sgyE8Sf7zpxq6vzLR/F
         Ajz2P6qM5F9SxWCJVuuopc7vtWSz5OYwx/X5ZHY7XAltwN0nO7PfrLQgKac9kSHV2VK0
         IsiHbcAB7vFpu/CinwM9RnrUfe8lktxW0Wimpf0PZZr75F1eCKURQv0QDFJDRhC2T2tf
         aW0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749503964; x=1750108764;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zI31dEC4mkNsuAEjV8kYLOz0S1P8/9VIxbXknfxECwk=;
        b=JkfJ+DvHH5IwlM7BHnBaqWhuYm/KWDGXgFw+jFln3tM8HPiSdFkozjWUElgZAzhhtj
         F+gk1RmPNBxQAnoog8GQpYUz+z0S3EchdViPMW6f3JLHKsikhKj9+1UdGKs6zmPTXeet
         tDpmLMJSS4BfLrLuIZs9w2IYBcRLxHVM/HvnRonh0t44YHvj25dvrIb3FHNgaif8Y7AW
         EtiRiEseUde6oTg/Un+7vbNXlIzBUcFN6Nb2fa+vKeoFz03khZjALj94CVVoYFPAF1qg
         J1slDoelTvarq3lVmRhUEWIW2xRdrjmqfglhyc6mEvIxXEA72m9Ozy+trhkqU3eOeCPT
         HvEw==
X-Forwarded-Encrypted: i=1; AJvYcCUh0MhQQv2mRZzEWYUCc5sdaFmPM0PXt/PPxfJfxnD28rd0DPfFf9WF/kYvTPXkBvNh5XTouGUMgZIqLcuO@vger.kernel.org, AJvYcCVJHHDlGGQc8Mh987GEkB+bRQTfC7t0/AypmfHTvIxCE+DWOf33N2UYla6tNWjrCf9sPquB/LMluNX9jKg=@vger.kernel.org, AJvYcCWszSuYmbvRAtbcqXcrAolv4owzleOFDFlxEPCCQnjhrMNzV6NDJ+OvXrF1sM+bdzVZv4Slj8UAxDY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw26EYRoyrFig9WZWUCo+R4eZgrrzCC/GqTSMNmMxiZm2edwo5k
	3VzikgACNdm0IMnnAt02N66X+mN0vIfN7jUFVh5TNGYwxPDygsPFyMI1
X-Gm-Gg: ASbGncvcAqYzd5rb0Ql86X422TXwhhN/EjUaBkxOzC9ppSspXpUT+mwtUGpm0gUKNEN
	VeEFwWQH0mK779EPvLGG1sbc7tW2a6gw6CTeT/+Sbnc69RY23P3Xt6eP6MFBDJFXBbym1h3eMtF
	/vMHF2QRfzoBmSv1sOt/vZqKMYRyp//TfW01mcwpWwHOxNUlct/T1EHFXDAmpw2FyJYCo3ukSml
	sjsjm4SSrSSxSGUysuQTB2wTv/fWeAdPwXcTaIYFB4bQV7aVbdX1/L4cJSdmabcGMHmcJsuNtMN
	lXdKKZ3l8GwqtL869gnZfwZ1Pcs6ZNTVRhizPgAE7Q7u04ojm47Rsxfka/1LJEVOP7lDxdS0Kcs
	=
X-Google-Smtp-Source: AGHT+IHX3Y30IjuDnUdCsu22PBCat70fUKLIyLzs2FeCzPdGY/Kl1l+0mfTzdQYtOCUKo1txIzTTrQ==
X-Received: by 2002:a17:90b:582e:b0:311:a5ab:3d47 with SMTP id 98e67ed59e1d1-3139dfc339fmr1402796a91.1.1749503963765;
        Mon, 09 Jun 2025 14:19:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3134b5a1d06sm6684888a91.17.2025.06.09.14.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 14:19:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 9 Jun 2025 14:19:22 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Roy Seitz <royseitz@bluewin.ch>, Jean Delvare <jdelvare@suse.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add support for ROG STRIX
 Z490-F GAMING
Message-ID: <c069dbcd-9127-4ae6-9976-edc836c7b3ee@roeck-us.net>
References: <20250529090222.154696-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529090222.154696-1-eugene.shalygin@gmail.com>

On Thu, May 29, 2025 at 11:01:41AM +0200, Eugene Shalygin wrote:
> From: Roy Seitz <royseitz@bluewin.ch>
> 
> This adds support for the ROG STRIX Z490-F GAMING board.
> 
> Signed-off-by: Roy Seitz <royseitz@bluewin.ch>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.

Thanks,
Guenter
