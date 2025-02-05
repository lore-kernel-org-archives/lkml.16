Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EB421E087
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 05:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738735032; cv=none; b=fpMzWoTVMl8Trtb/MjOFNS42LyYnVUIOj3ZJ6KgMAy8alivbVqMWyglyvRXRsDiITwVeQ0+g2i3QQT1BMetTh0CcEPbqbSG/NIC7WVHVHZdU+9gfHFhuY+V3L6FpY1iaYiDJ5ltqXA68zPN/1MutO+b6beHG/r5BOpPxxKIBTek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738735032; c=relaxed/simple;
	bh=JmHHk6b4grLsldkwDlWYnMxUVEDLxRUNdHIBTOJGm1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HEBazOr7abDgmOMShNe/iyK1irEjDNfI49lbkWz39m/Qc4g0bFrgyQlufdJtZbeiltY2D8LXlZdRMx4G9tyAmLAfqfWdBgYFGmRmFVPOsEjmjw5fd4ysMRVlb4Gw0JRzPwZmCAIhjuDXySYtbNlsQJy12grJhsOyYUOUl9KGg5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pC5M+suT; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pC5M+suT"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-436281c8a38so44790765e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 21:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738735029; x=1739339829; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0Wf//K+zDvjEZ0lCO7qefASJpOtz5W/b6I3djUeQy/I=;
        b=pC5M+suTcIA4wArAYKc63FiqYlRbXFs55ACie2XOftBTqhwGDl1A0MlQC1fB5Ikk81
         KbLuPfBNeCg7qwVxo4ckBt1yzgpsft/VJaLgbUQot5UzEiAe/ee2bK55EuhfYR1xruiE
         DuVtrtPQnZnLS99Qi4u/Y443t/T2RrEs2803g+Pjgrne+Fl1LF9o7jZr6N3CpgZlLeC3
         nEBKuKoCIdHGz3B8FmDnxuOBdqi6+UvOPFVPhxT01pi+JoAP+srNQZMSJWn0m1Fa3dyV
         3xbA90Hq5mQQbdZgOLtLKuoyAmXtnX8jl8/0XtfnZ9bwqAhQt9vaxfTNUH0OFYcmsfZT
         pBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738735029; x=1739339829;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Wf//K+zDvjEZ0lCO7qefASJpOtz5W/b6I3djUeQy/I=;
        b=RSW1JJYkEVwp2Q2h2TtYl2SajxgoB5RKhWNMWAQHIq7kk5dqM0dpmKa+HXxF84uucG
         sTcisVYqmEyB67bOvxlI8kYSAHEvKk0jSS57V0QmhdBS5q3MeyT9Mr4/drt82QHrR8WC
         nKbL6BPW1Ayqahudxdyt3TAadEVkfOCkXcHOl86XfOhFQe5G3sJj6Xt6vx+qT7+FgHzt
         eKlVENdORDdqSm1cpO6QE8nttY/RSwoxNgt+TsH6QalUy1+S3YUM7aBnERcrwxnbukgQ
         qFWjRa0w/gITcWdAbnjat572xsdAuKmuppLWNFKDcppBfCQDRgilbuv4UDvJRIHvI+Q0
         4ncA==
X-Forwarded-Encrypted: i=1; AJvYcCXDnDbFDT1ycMcYT/iIEKbX0+APvjRlgj7EmYGo43CdM0iwNLHr3WBwwUJ+CDQj9KkDvb0YvohN6QboNtE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ1ZLlE23MlWxzrN5MtlVUEChLJpNe74KCQhxVAdepihIX7xvl
	ZHs17BYUALVdYCGOp3AbN+v3MYRFt3XUrhJzCqhvvyxveqaMpvGqZnLX1qcrmzU=
X-Gm-Gg: ASbGncsAE7u885Xs9ErW751dWtqNx5D5aV7bFdtpvE5mmQ4P4N79JBWV0z329NHC5Uu
	yT6a3zsdJDWu+et1dketThzudyWLzpfAo4HJ3nDjpkLh42DiFIJUd0oCg3LfHaHMyNjsy2+e7wC
	Zj4mZTgoOoCCLlxIya4vckNosJMP4Jg92q9t9TFADUg2iJV2WzyQUe6pSdOtDbd1NgC8HxZWkC4
	bZ/d1c/DSdIIGjVa84hsmH0cepnPltpqKDvwPjPZyEFLMLjyTorwjnMor2IegNHQOBBs1NlIZZI
	viBQd82ClysU+ziMr3Gb
X-Google-Smtp-Source: AGHT+IEzl0+icrJdfMURnyk6DnvesW8whXjv5guwsjmV0E/xmX8GtuyZJ6P1LmUsWNrvnv90m7c5jg==
X-Received: by 2002:adf:f810:0:b0:38d:b1ea:506a with SMTP id ffacd0b85a97d-38db488dea7mr777074f8f.28.1738735029283;
        Tue, 04 Feb 2025 21:57:09 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38c5c102bdbsm17526023f8f.28.2025.02.04.21.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 21:57:08 -0800 (PST)
Date: Wed, 5 Feb 2025 08:57:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ian To <onlyian4981@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] staging: rtl8723bs: remove unnecessary parentheses
Message-ID: <3f548286-a32c-43d7-8e8b-6812a3fb9214@stanley.mountain>
References: <cover.1738720049.git.onlyian4981@gmail.com>
 <d0b70310eb6b2dfdf062ba865362cd2640cb93e0.1738720049.git.onlyian4981@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0b70310eb6b2dfdf062ba865362cd2640cb93e0.1738720049.git.onlyian4981@gmail.com>

On Tue, Feb 04, 2025 at 05:50:16PM -0800, Ian To wrote:
> @@ -492,14 +494,14 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
>  	/* If we didn't find a match, then get a new network slot to initialize
>  	 * with this beacon's information */
>  	if (!target_find) {
> -		if (list_empty(&pmlmepriv->free_bss_pool.queue)) {
> +		if (list_empty & pmlmepriv->free_bss_pool.queue) {

Nope.

regards,
dan carpetner


