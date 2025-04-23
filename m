Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B0854670
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 01:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745372660; cv=none; b=qyBC959HMhvXr8awO7uJbT7QPin81m76F1mBN61jqYQ0xQ/fPQfFapvTUm1i/ZWDzs26eT6WgAJp/UHiiR9tVky9gYLD0HkxvOsAgrYhBclW/jN3GTiFidxyr8gTaozfVys3BNYa7bOd1aD7Ktgw13o5Jjqqje8iI2JEM1bYZYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745372660; c=relaxed/simple;
	bh=k7xhLka69j7sTzhJDUUiZMNXk9ru9y9Wyn49mdryqfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nhtZHTrQlsKo4pz4of+2HW2Cv5bqdlR/VVm4wR7fjgASpbXQJ1mJA7EN1Wfz9i5lL0k7RXFJij5njG8XxfmxNmG1g9j2rV3PIYdK5gDI3V6hdPhqlZJYXG+32iDkYN8WgmzMeQyuZpg8lsWbigFAUBqFBwAT7zvPWOu0ct1y/mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=PLbjG1Ev; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="PLbjG1Ev"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7399838db7fso561968b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 18:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1745372658; x=1745977458; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kbEA40JiWe2vQnJH+i6oSJcxA4t53eWL9N2doPzGsO4=;
        b=PLbjG1EvSqSgQEeKktpHkHjWqhhvtaHSIVU6ido9rZttrIJUyWQmr5JTQf+YK1dR9/
         aatYZaphJnzeDAeSKphzoAe1fxoOmWzEMgZDAjyatvO33EJiRk4ee6kPwvEKdQFD1Rgu
         5ZDKDupSSPRmrNS18yHIC+ue6UchQECRbWK5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745372658; x=1745977458;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kbEA40JiWe2vQnJH+i6oSJcxA4t53eWL9N2doPzGsO4=;
        b=r63GjdyVfjjQvHEnupSwFDSpIit8/VjMGod5jm7VE6I3YACn0LV0D0kd8VgkYnaUpZ
         /AVGrbWgQr2FKqO7QBHg3AK6zQE7fPQ/J1AC5kx/0Y4KMyEXghG1Jnk8Ul0jfWeFvqfL
         OlfWP5hWyBWqa+7yFfToU87debr4v+UMZmJwEbRIE9AaWafCbs9wZTYap1/Fy9wBM9pr
         ofz0EBQ0Xk960fsxZ5F7f0hy+oJRM+EyRtknq3RiRPFUpapOIuwBGWHV2BJcrgU6VLOI
         LIQpQ1TKLZxGHBN1QTBOyel5i/+wc0k7EITUHayHt5eB+gpFY0IeWT1IAqCKMi4oVwpd
         x2nQ==
X-Forwarded-Encrypted: i=1; AJvYcCUje3FeylWQS4s/eXdljgPrfPs4JAv0+sRF2Yg+Iifif4Q/2Xme7/nV3yJyeR80fB7mcrUfL5Zp5Sd25x8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDFF4i2AW8aedma/R7bAicOskONIXy3ktwm304AKWkDuXMw+IM
	vNJfE05RugSvDX6Ngxl73haPpFgt1JhUEDjgRfSYLDo8MWSOFdhIFdJ06BL6+/E=
X-Gm-Gg: ASbGncsYh3trbUqksvIELnQbtlW+8Z/tpm4brYy7EYITCBtvD/+MJlYltkgr5O+tJof
	ikC4qCvQLHE0ex09fHYYRm42/Vj4tDH5CX2h7maHOXM1sfMHHAnC85+tqJrb1vJdDepEFj3Q4Gy
	eLUfsHrZCQduWRuimfbSKI88vxpOBhpZv6s45NFlt2Ep/e3kqGH5+gHCNpMolxmtqqzLlYh2dqx
	wdcaz/BlmkL863GvXMHNU0oi9wXNzlyl2Nqj/KeR27BOnPmQ+mVcQNsleUaxkx7pLzbX0KlEIEx
	UO91XHJqdbC+7x8Fz0nVEVGTA0y0tqxIxh6+gbESPLHJKYaZXlJNLJQ1PyQa/fPyhC1R3z3QYVx
	IMh48pWk=
X-Google-Smtp-Source: AGHT+IFva546HHvH4CG42JDJiYADC+hOqNU2QGJEhgjEEKXmiz8fBGmZo6uhAfd4IeYT66Mzc5QfLQ==
X-Received: by 2002:a05:6a00:244e:b0:736:5969:2b6f with SMTP id d2e1a72fcca58-73e135a5f1fmr1603978b3a.6.1745372658539;
        Tue, 22 Apr 2025 18:44:18 -0700 (PDT)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaaf4c2sm9322873b3a.152.2025.04.22.18.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 18:44:18 -0700 (PDT)
Date: Tue, 22 Apr 2025 18:44:14 -0700
From: Joe Damato <jdamato@fastly.com>
To: Harshitha Ramamurthy <hramamurthy@google.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, jeroendb@google.com,
	andrew+netdev@lunn.ch, willemb@google.com, ziweixiao@google.com,
	pkaligineedi@google.com, yyd@google.com, joshwash@google.com,
	shailend@google.com, linux@treblig.org, thostet@google.com,
	jfraker@google.com, horms@kernel.org, linux-kernel@vger.kernel.org,
	Jeff Rogers <jefrogers@google.com>
Subject: Re: [PATCH net-next 2/6] gve: Add adminq command to report nic
 timestamp
Message-ID: <aAhF7tvKPwvcZ5h1@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Harshitha Ramamurthy <hramamurthy@google.com>,
	netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, jeroendb@google.com,
	andrew+netdev@lunn.ch, willemb@google.com, ziweixiao@google.com,
	pkaligineedi@google.com, yyd@google.com, joshwash@google.com,
	shailend@google.com, linux@treblig.org, thostet@google.com,
	jfraker@google.com, horms@kernel.org, linux-kernel@vger.kernel.org,
	Jeff Rogers <jefrogers@google.com>
References: <20250418221254.112433-1-hramamurthy@google.com>
 <20250418221254.112433-3-hramamurthy@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418221254.112433-3-hramamurthy@google.com>

On Fri, Apr 18, 2025 at 10:12:50PM +0000, Harshitha Ramamurthy wrote:
> From: John Fraker <jfraker@google.com>
> 
> This patch adds an adminq command to read NIC's hardware clock. The
> driver allocates dma memory and passes that dma memory address to the
> device. The device then writes the clock to the given address.
> 
> Co-developed-by: Jeff Rogers <jefrogers@google.com>
> Signed-off-by: Jeff Rogers <jefrogers@google.com>
> Co-developed-by: Ziwei Xiao <ziweixiao@google.com>
> Signed-off-by: Ziwei Xiao <ziweixiao@google.com>
> Reviewed-by: Willem de Bruijn <willemb@google.com>
> Signed-off-by: John Fraker <jfraker@google.com>
> Signed-off-by: Harshitha Ramamurthy <hramamurthy@google.com>
> ---
>  drivers/net/ethernet/google/gve/gve.h         |  1 +
>  drivers/net/ethernet/google/gve/gve_adminq.c  | 20 +++++++++++++++++++
>  drivers/net/ethernet/google/gve/gve_adminq.h  | 17 ++++++++++++++++
>  drivers/net/ethernet/google/gve/gve_ethtool.c |  3 ++-
>  4 files changed, 40 insertions(+), 1 deletion(-)

Reviewed-by: Joe Damato <jdamato@fastly.com>
