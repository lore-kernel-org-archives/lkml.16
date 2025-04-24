Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC23519CD16
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 07:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745478167; cv=none; b=HSS0kYy6qZaA0zr55y7ZZN5+faH/kEdxsq4zOtm4CK8eXSQYzeKcht+d6efN+z1S38aClUj1mQ0Yo3sI6gDIv5WC/ZDGy9vzWlVJ3J5JbQWqN9JLFmNhbDuEFjZWFFC2eD8zI4maluADSNkgvb93Cxa/67MzYmSrD6CrLwlNRis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745478167; c=relaxed/simple;
	bh=CsVdIY8q46bTxLPbuwJ8cUP2eUiwXdsgC6RMjJcwonY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B9NbXVpuYrpqLhhrMCXE0A4QT6V3UWf7ojFf8KcVKwKVHnk64VL7x9Tyn6ISvolmB7wwlKe0N/93xU9T7HuoMaglJnimBi3fV/CAtayLXu/Su4OXofavr+JV/Qqzh3rrZVVXpVKTIIl2CVfrN844VsyKaAfdlL99wyyGnpZQl2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PbFclHgN; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PbFclHgN"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac345bd8e13so98025866b.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 00:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745478164; x=1746082964; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=atZ0zH+QTHFPwFIGyoJZTZ335IopbqtcRNNIDzNruC4=;
        b=PbFclHgNjB6RXMecnfIP+Z73qquzU3VIwvxcMjTs4FsrIcbOh/LblRF3NUS4LZfc5y
         ZpCZ8iSj72X1+S7rKtKjYOgzEwam5ASSq7FmFQsu6+NEUUwFI3PDrHuua6eXGQ1eENHH
         +gUZzwTVtO4p4o8zLhYjoXOqoCTIZjdwq43dKKMkroVaj5O7OTlYMIiWPClNx9icGA/O
         6M8yEnilRKLdmNngmnbBLtndXiezGTt++7R6Yf9ACl4E41Uq90JqzIU/pNtYPgrLHSUd
         3DH5g+7z9OR2JE8v1AsfAXbLN5xHzWveov22VvaN38zQrDfdX6aZNyzEC6IK+/wLUwPR
         s2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745478164; x=1746082964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=atZ0zH+QTHFPwFIGyoJZTZ335IopbqtcRNNIDzNruC4=;
        b=Y7f9TWF5ULsim8+pQnSJuyrU5je/5uzvVHkclw50SVkWRirwxIUolZ+Hmjfibtd4ny
         bYdG8YY6karHitMt/mJQFil1Fn+7CL+ZN1uIGV6GSfm5GjVCKgUuCVU/F/3E7ZzeHUmn
         PxQ4DxZ9iUtMuSzKBe4I+57x8RfmL1wvLizREEulQAnGeqHmsUj65nOAJDrjaYqsiTk+
         ME1jSY2NGPMrTzBs7KDoGAKiTQriNl3/Jf1hpi37xC9PGJFcgQrR9hvo7vK9f+AlSoX2
         gvZg7jVww1QI/pv65TTlA48VKRMMo0LjOMo1fZHQj77QwXGK0lzxveWY9P9EgNFpHbFO
         uCOA==
X-Forwarded-Encrypted: i=1; AJvYcCVq85zIVMw5lR6AnfBVHkDRpHdF1/AKPYCCNepf6nWIvz1NfMeGnT/qMnHnVMhqoRrmZRZGD/6rw6IzxWk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr4k6LKoW040G+nKnnS68BpfhBJWwPNXEfGSJWb5YsbDjIOiBe
	4ExUxaDNxIG4LxVx7KnzsnMd0KRlQ+xoyJ245bQ5ldccQz/gwnvThjNlyyD7CSwFnTlpfgED3xp
	t
X-Gm-Gg: ASbGncs39DG2tGfG7Nu0JuxAXMX72POqm6MivAGagyw5lnGxKO9t8WdPJ3rNl5soOfR
	kMorlfWQxBAyjuKv6/oZFyuAt3ekEt6DIaQj+M9okD/HSNfgHPmMWCZ9Z9qXn7JHRHhBrx7tSf7
	qITaVHjpx4Vwp3osS9blEMqU+YS0hRSSrdCN/2i9BPRqjB5i0Rnwp2ban+H/lgaAtzdtQhpQggX
	AocCXRZMPxwG/expRaC6hFMRo2rdzW7Ui81C1Vtgf8+KtA/T/rA7jE485JvrKKtSO4TObnx4H1q
	J6t4evOQKcUbtEI5VVpBJqoOjw6BP2rUCUYFgA==
X-Google-Smtp-Source: AGHT+IHRRXGrXUDu3+rG3nESpdOVayw7JgdtjaocMACREgykhsz0BZozqMiy2x1NiHc65DNK79egqw==
X-Received: by 2002:a17:907:97c1:b0:ac7:95b5:f5d1 with SMTP id a640c23a62f3a-ace57494ecemr146858866b.42.1745478163982;
        Thu, 24 Apr 2025 00:02:43 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace598f6b97sm57765866b.75.2025.04.24.00.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 00:02:43 -0700 (PDT)
Date: Thu, 24 Apr 2025 10:02:40 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org, patches@lists.linux.dev,
	torvalds@linux-foundation.org, akpm@linux-foundation.org,
	linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
	lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
	f.fainelli@gmail.com, sudipm.mukherjee@gmail.com,
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org,
	hargar@microsoft.com, broonie@kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Marek Vasut <marex@denx.de>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: [PATCH] rpmsg: qcom_smd: Fix uninitialized return variable in
 __qcom_smd_send()
Message-ID: <aAniEGwKKRUieo5G@linaro.org>
References: <CA+G9fYs+z4-aCriaGHnrU=5A14cQskg=TMxzQ5MKxvjq_zCX6g@mail.gmail.com>
 <aAkhvV0nSbrsef1P@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAkhvV0nSbrsef1P@stanley.mountain>

On 25-04-23 20:22:05, Dan Carpenter wrote:
> The "ret" variable isn't initialized if we don't enter the loop.  For
> example,  if "channel->state" is not SMD_CHANNEL_OPENED.
> 
> Fixes: 33e3820dda88 ("rpmsg: smd: Use spinlock in tx path")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
