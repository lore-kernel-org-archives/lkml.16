Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02B721C9F5
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 04:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750305751; cv=none; b=Rze63eRmVBKR2K65CMXIileQWTCIhybga6V2M1ayZtukx4mIn6tCjWLwYbXbU0Mw4O0eIh07jaI7bFKjHdaNqq2PaadQ62VNGec4BfXNf8HA03bhLhd+4T86Q1bz794somqeF/qLPLDnl7hWYGPlrjFsKvW60wSOT7BB/ZF3SKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750305751; c=relaxed/simple;
	bh=LaJ/3fV7CFGu3CbSmkDL7tY02vgNOmg6uh+G6uKUqnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rqNk0jhFIRtzVIBQhZRUg5mZ849J1cbQfO7Dta72GR0KMwUW8HFiqLkJfGX17oFQ+wHm31nKFHgvU+gT5a5uajCc9LbXLJwkqal/EhFA+GbPsz0fPTWyTuuqseaXlZOQ+TovtoNnoPSMC4ZCyt1zlrpf2NknIB/+5JjE5K2NeUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RILbZXGe; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RILbZXGe"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-408e0986303so227175b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 21:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750305749; x=1750910549; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=njiJJqXLQl7ToyJarnPfJqmhTUdls24Ce3R5x39b7qM=;
        b=RILbZXGeMYPSY6nwvbc0SKrf/CQ38luxf2wqhJ1Crz0/I/b9qXRmjq6wILiQdIdy5p
         OgrCrZ16aP/4vgcs8Btjbd5wADgDLExDY1ezGwZeVeDrweJ0v0FvCwwft8LFZVnqaD5r
         xzbKnaLj4wd46+xuKME1UCJ3escSvR7Jhq7B8sG6QYbMSZZsyiZbQUQaFAw+67Nb2eJI
         fYBtS0pKUxlp23Qro2q6sY3Eu1QxjVmf56pC9uWr0z9KI6lvYqxb+NQT88d9j270Pr0H
         barg46KWNPpw1LeLUsOnE2humV5zfIx85oqKjMymp/NgkE7WJUm/NysIxeZotphsj2IH
         pzww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750305749; x=1750910549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=njiJJqXLQl7ToyJarnPfJqmhTUdls24Ce3R5x39b7qM=;
        b=vk+A9OjR0GMQQyGBBaKtcPvwgA7vYwOOAQzAzcOFhp0d2obLayuxc/cRwYCRtZmyq3
         v4eI9E8WgVPXe32l3Xn737a5hA4L5Vh9JzI2Ra8Zs28FClNdhwHApk3Q2BSIqMHqlPqr
         dhslwlvHDI2OiRjuGSqdN6Sv0ZbALuZP5lw34vzq5VOtO0DMflroB4Ek7fNTEeMQjwEv
         q7vE58M09215DMsCXBhfXVRVAXctOftNQCYCuLhl6dfRiL8hx0U32hWaONuxipEYV7q9
         9WnbOPr6X6WPw9Mgx0ApNJ7fnWEeBB9BlqUF+A0Ke8qdAo293Ab9hOT2cB92Lz2FPmzv
         Ygdg==
X-Forwarded-Encrypted: i=1; AJvYcCVLjmPwN0/ijlTg1uszak2WmqDdSxsOePYowLqZNpE8gACxryr6kMOD/+OqcbjeA4TA5I4lxf8nwi/ctFs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVd0teyMHMX5bjdQlECeZY/f3ILONomIQm5qt1c2f3vEU0hBOW
	Rw1WOn5/+q+saGhE7VGexTPb/lljg1rg/bUIJPOvHwKntsdbdlOZSDbMbhm6YUx22yw=
X-Gm-Gg: ASbGnctzpqkGkmVxKmLVsJamBqx1zvrsNV5rBXC+o39oqvkZiC9odkNAz9tiNOHFHIb
	t2OU4pWDgIwdWGl2PvIrEiKAnRbqyWrXUTFEnu6v3kFvMpF+FUhRdTyVAXpZHKy9n8TOynfdLDR
	dUnmO/1evzONMnHq6EGtZD7khch1ufGRIlF1LGvlgcXp9hon5EOWkywk/VA0wVteFTibm27nH1y
	dw7m+SY/yFuQl8E9ObcgAk8+jXYJQigZsUI9+xnEBepSkkxzvyv9eNorF3QRRoFrJ6h/KDdvDxs
	S1ilcWjHt4U20LVTqyG12YZXU/jNkHXkkk2d/1n1LWiw9m/sTclL6YLgzE6qb5ayfa7dNy2Nge4
	4SL9w
X-Google-Smtp-Source: AGHT+IFrMLP1wAqb88mfVUA87rWeoXsHDnuf13mLTgj804lspyaw0rxCLmor6QPmX9UAyusbltiEtw==
X-Received: by 2002:a05:6808:5090:b0:3fe:bc96:b82d with SMTP id 5614622812f47-40a7c1da57fmr12386485b6e.36.1750305748810;
        Wed, 18 Jun 2025 21:02:28 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:f083:6e52:f970:dc01])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a740b281esm2631384b6e.8.2025.06.18.21.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 21:02:28 -0700 (PDT)
Date: Thu, 19 Jun 2025 07:02:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Marc Herbert <marc.herbert@linux.intel.com>
Cc: Dan Williams <dan.j.williams@intel.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>, Benjamin.Cheatham@amd.com,
	Jonathan.Cameron@huawei.com, dakr@kernel.org,
	linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org, rafael.j.wysocki@intel.com,
	rafael@kernel.org, sudeep.holla@arm.com,
	Kees Cook <kees@kernel.org>
Subject: Re: [PATCH] driver core: faux: fix Undefined Behavior in
 faux_device_destroy()
Message-ID: <d478fbca-e98d-4a16-9298-01dcaa8bb008@suswa.mountain>
References: <2025061313-theater-surrender-944c@gregkh>
 <20250614105037.1441029-1-ojeda@kernel.org>
 <2025061446-wriggle-modulator-f7f3@gregkh>
 <a3a08e5d-bfea-4569-8d13-ed0a42d81b2a@linux.intel.com>
 <2025061546-exile-baggage-c231@gregkh>
 <bcd3848d-54dd-453e-b0b5-91cb72160645@linux.intel.com>
 <6853586e9d366_1f9e10087@dwillia2-xfh.jf.intel.com.notmuch>
 <206ebae8-4e2d-4e04-8872-fa3a56b3e398@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <206ebae8-4e2d-4e04-8872-fa3a56b3e398@linux.intel.com>

On Wed, Jun 18, 2025 at 08:33:27PM -0700, Marc Herbert wrote:
> > But, again, this is a totally different thing from what the patch does.
> > The faux_device_destroy() code is not doing a dereference, it's doing
> > pointer math.
> 
> pointer math is what we _want_ the code to do. But if that relies on
> some undefined behavior(s) then the bets are off again. Check
> https://stackoverflow.com/questions/26906621/does-struct-name-null-b-cause-undefined-behaviour-in-c11
> where offsetof() is a suggested alternative.

The answers talk about "But the value of a null pointer constant is not
defined as 0." which is some trivia that had heard before.  Probably
I heard it in the context of someone saying that we should check
"if (p == NULL)" instead of "if (!p)"...

regards,
dan carpenter
