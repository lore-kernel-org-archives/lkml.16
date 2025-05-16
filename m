Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C59230993
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 09:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747389091; cv=none; b=C63RlN26eLoHHfeFGCQZ/dcYc3iTyJkiT9z7vqwK9BniZUQCR73FWaZVPREoFIJ1h0KcF9RfCzP+chysQ+rmHVC7df4GTSuqq6PCIaKgXKR4Mn7OUCP+tP0uv9ZmMIpigXtVmaopgwls+cPdEYwM7EwVih/G7AwrqQMjcd/wqy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747389091; c=relaxed/simple;
	bh=Gu7DAGMs8OXfRA48FowN/UWaHhjAtaoqoSWWO1d8+38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N5b7AGIR7j+ryxCgUlgNYURsuiiyIIzZ8lf+WoO5SkCf3ldzv969tBzxHWO1bt6ZGIxRzWt3KvzsT/XzuGXPsUr6F9z649mExyhh2jk0nTXoY5BUdQLImFFiR9lhAAV1+NDprbXHFcOwGyq6HVVij14Waxc4eQM5UavXWRNAdeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bG8rGGBD; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bG8rGGBD"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a20257c815so1708656f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 02:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747389088; x=1747993888; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K+LSjGf6EFBKwBFrJfQr9p/yrXwMirkG4Tk2TYuSNm8=;
        b=bG8rGGBDMdaeJyNYPs+qloZuy7giCL/oGewlhi6Uj4MumlpdoQaFakEoj4vyMRI3gL
         xKmAp2mbelpuILfNzzQlYQECZA77ppQ3ZEjKBDqc6s3y+vCXXEsePrQRT6UZfR2tTMSW
         eGI8xuz0d0KPX83UwH98XfdOM836QX8DzAN9i2lQW5yJ4nu1mH5YcGBD6QwGDzzbe9P/
         ziWIfQcikUNu45QpT0tmbedBjpKudVrBZ7b39yAlWCdLtcU+UXZbGRblIheUXRVYMxc8
         qo80X5EpoIz7pp72+CNfEDEbkuvzrwO6ITWTqHBGP4fi5nx5MceJCK2WchU2lc1X+ulw
         IMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747389088; x=1747993888;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K+LSjGf6EFBKwBFrJfQr9p/yrXwMirkG4Tk2TYuSNm8=;
        b=ET3MvO9AOm49iUQZrR3ED+3iI00/8XF0E6YUKRerQZAsLvy6Cq/94B2mKtGsDrS8Iw
         Z17jjJYCyVUDAWbADmvuE8t7ljnkSO5f3TmtJRY7LFp9N+KXYFubBC25CNVK+EUQNa9/
         4syxDfq7mKf6ePt4SnDanw7QsZJTG5LQ80EB/jJhR4toyZp9EfCxkmBO+e/O7blPUT4I
         Ccw8b9GvFmNUsv+oKthan3U4yfgnHH0NYT62cSjymFdOSgZx/1fEKjq9if/7klaD5Mx9
         KeORHMl6eJhwm31h+cEJqAX9nGvkz1/U0yh3bJGWeVc/6n4GBkK8vcqRDuJ5vS87I+xW
         aJOg==
X-Forwarded-Encrypted: i=1; AJvYcCUZKAxkqfumcXwVrbqYiVD59Z3ALud6SRFXWIyMDSvSTt8yioZRcCg2nXfPm+fUYOjMRtLtgG6Ir20L9ok=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuFq6fLlxsNTKfitYi1gnEvGrFsR1IRE1oRCpZ7h+pjwde/F/Q
	BzlbvaakL+n8XH0ysq0jj79ArYTDRd/ABcG++6kNqQljRB1YNBb0RjvPhrEFtiGh8IWsI9jWSQE
	SjwGvs9U=
X-Gm-Gg: ASbGncug+8sNOhYR0AE5sfMtgHhmGgcc6Xy9td9dtm375M2aYgoj/0GR00xygkuCyKe
	Xnf3Ha9r6mgI+bQy21z8REPnYQOvnTum6bPXW7zGLw5fBPWm4rp6xXeJu8xWyIOLbzl6zWXVmle
	z4cQUn59m2GvslLlRL5Y/xL5Ii36tyTPyLIWVm1hXVy34qHgQHHV0EUDFHY+xYDlLId7wTyIohp
	UsAIIz0ylKUct0fE9oyU2wOdnrbncAv6t040RA8/bSKd6uHnvn9F8lUgghbqXHu6zmFqIqdeaNh
	oXknRnM3NovbLpJeI1slioCaV9j/TTdYq32qTvxlE0PsvMasiAHEqhSW0axXkyjLH4v/5idDU2g
	GjOLTqQ==
X-Google-Smtp-Source: AGHT+IH9+6rQReRUQJWSytxZ+G1uwpsTux1xN8YauxmBEa6K79wk8JHtL9Rbuks70p9JG0WQ3FWzJA==
X-Received: by 2002:a05:6000:4382:b0:3a3:5bf8:3732 with SMTP id ffacd0b85a97d-3a35fe961d2mr1450354f8f.35.1747389087844;
        Fri, 16 May 2025 02:51:27 -0700 (PDT)
Received: from localhost (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3951854sm97778635e9.24.2025.05.16.02.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 02:51:27 -0700 (PDT)
Date: Fri, 16 May 2025 12:51:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ozgur Kara <ozgur@goosey.org>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Tanav Chinthapatla <tanavc01@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix spacing around '+' in rtw_cmd.c
Message-ID: <4fa93b15-2552-4585-ae60-dbbc2dcfdca3@suswa.mountain>
References: <CAPGyJDMv-N3HkdV4znQg=_i2owE2sbnRhzFem_Uv_15GjADBFQ@mail.gmail.com>
 <2025051301-projector-earlobe-9542@gregkh>
 <01100196d6a80a2b-a3be3f40-ed8b-4bf4-b2e3-daa37f8fd19f-000000@eu-north-1.amazonses.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01100196d6a80a2b-a3be3f40-ed8b-4bf4-b2e3-daa37f8fd19f-000000@eu-north-1.amazonses.com>

You'll need to resend.  Here is a guide.

https://nickdesaulniers.github.io/blog/2017/05/16/submitting-your-first-patch-to-the-linux-kernel-and-responding-to-feedback/

regards,
dan carpenter

