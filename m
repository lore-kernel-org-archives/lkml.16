Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30D3211A28
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 23:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750893518; cv=none; b=DxVKrwhYlo7zxgkZAGe0GN+RvcbADRYIr7s//AiSwJm5jSuChu/qEiwDoZ/U56Z2MtxoEIk+7OrMRfuYaQwICfwCRP+X1xb8acXRCPElC5mnq09zyP2Dp2HmfSGjXsiZZWEoMqSEPp481cNuGf6GNEjmXbSWV8Hjj1ZBHuHACGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750893518; c=relaxed/simple;
	bh=o7nWOpB8g4zXrKnObOSxdMpT/uFNKTEpAMgxA33hsCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=svyrS4mWr1dbcK4KI0Hyt3aEk+lceNQkP9M4sTRE/IoaHdJdHa6u6Xd6xq8N6lx8pd3DLDk9cIoXnP3Sx5lm1qg6DtN4T7prQXuCZ4IztRGz8anlJiL/SDapr+eHca00ff511RTXaRf/4n2sQXlEsuT7iCJXhOrhGVI6KHtC8aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B9da6tqT; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B9da6tqT"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-401c43671ecso274589b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750893515; x=1751498315; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L3sVHvu6rqtfwSzthUoBWhxdxzvIuGv3z4vvAxvJak0=;
        b=B9da6tqTxZKgCi76jYrsE3NbCHbppkVYsBHEgRgO6HZB1G2Aw1jwIHjNv61b8VdOpx
         35fwFuwr3OdY1rwKlZj9uAhBYM3OltPHVGSnLGdqxeiHevkqH+liVoTg36RnEIfgaGGk
         MDE4sGotloFu8XLGpb+YGu2xCzsVMsskCSOgLcG3uAIttsWk6DHavIbBgPM07X7who7A
         5Z19xQ4lNhxdkhM7GHDqjlPE3fdjhMU+ZCPaJsl20RXcYj8Ptx8rWwxsWLmN6mwCnHS5
         6qjUpZb/X7gj4qpRdN+9wmsTc9ouT3t+JcEl+OssCGeTu74oEVnVw6x1RsZu3dJR1MeP
         CjxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750893515; x=1751498315;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3sVHvu6rqtfwSzthUoBWhxdxzvIuGv3z4vvAxvJak0=;
        b=jnDo44+fNhUojBedWIuBIkMoNuN5N2kC82A/y9ZlekXLf0Hxt4fl3oTX4tTFhiIK8w
         kaBM3rqkCo+N92pimAHXusjpoIPp6KXeokqm3HSfF2+kOhew90Qgv9H2Hp8Fuwp/RtSY
         qGWpf5ZrfHfFgBPFIhKMm55XNQIig9cMP+gw6XvNnoVEWpfUOR69Mmd2kNWRneSoD888
         uCFM44g0IcJY4QqyQ07236RvRoS/b/9GZvYilq9dN8xWnWX6+1Y/eFVKhOr7fiWE4ECf
         bkR9hakBYVUaG98W1//wC/muaV/4AfG32CPTrhscTrC4sRUR34+v4SkhUluWO2AILWSZ
         6Y6A==
X-Forwarded-Encrypted: i=1; AJvYcCXmCewOmo/2LXo57hDzbvoTol7uxhNB/hP+4SAG+tvg8Ed1tYYICidVb2W5kQGLN9nhwH63oBNdrWhkpRI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRTkt3/02wqT8MqyybR2UtC8vw+qqLaAnp9J88DWeX2xzC6avG
	zDx+ZuuUIB7Q3V58cjB85uUfuIl4fW70+SgXyJTViLU3hNI4Il/zjLi38ug5WGW0VNc=
X-Gm-Gg: ASbGncvsoDtdqiHt1Hf9eRifhPZLK16ewrFTjYKI97eHCN/n582psVfI/O5V8Ggz+Qs
	ZuQbhiVzH9KEq4IDh7U2qHmFxkvYXijMHnKNzfkslAqEzI46iRtmk5pdMnbuL2QMf9heUopOGvu
	wOagsoweibqWfz60DrdkT8Gs8IhuqZ2ghSg4SHFFJkbiecTQApeXhDc8///h2ehpvEc4PkBOZEG
	fD0cFwAnx08ITikHb4rWt9cv8GL0wUGKaOyLwpFr7hk1oCwp555/86m4cTJMaD4JLh5FUAboEcW
	Oqr1zkhR7APgmClTfJWsnTVvdCEkUlGXkas3V/djjBXpXBXlonk8c8uSWrZraLCgwN4=
X-Google-Smtp-Source: AGHT+IGUSOTDcMhyXVdEI7yCPybwKm55wAWpHQBu02wApjRIvEjewZ0uBQq+qXkoDQPhGY+OUVDZ7w==
X-Received: by 2002:a05:6808:178c:b0:406:8a86:6475 with SMTP id 5614622812f47-40b1c98ee06mr1362483b6e.19.1750893514886;
        Wed, 25 Jun 2025 16:18:34 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:3ee4:904:206f:ad8])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a90cc3dc8sm2386202a34.67.2025.06.25.16.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 16:18:34 -0700 (PDT)
Date: Thu, 26 Jun 2025 02:18:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Marc Herbert <marc.herbert@linux.intel.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, gregkh@linuxfoundation.org,
	Benjamin.Cheatham@amd.com, Jonathan.Cameron@huawei.com,
	dakr@kernel.org, dan.j.williams@intel.com,
	linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org, rafael.j.wysocki@intel.com,
	rafael@kernel.org, sudeep.holla@arm.com,
	Kees Cook <kees@kernel.org>
Subject: Re: [PATCH] driver core: faux: fix Undefined Behavior in
 faux_device_destroy()
Message-ID: <fee97bfc-aebf-47e2-8764-e998cf9a9eb3@suswa.mountain>
References: <2025061313-theater-surrender-944c@gregkh>
 <20250614105037.1441029-1-ojeda@kernel.org>
 <685c13c5.050a0220.38a39d.dcf8@mx.google.com>
 <daa7eb83-7413-4b6e-a241-84d306db0d43@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <daa7eb83-7413-4b6e-a241-84d306db0d43@linux.intel.com>

On Wed, Jun 25, 2025 at 03:30:47PM -0700, Marc Herbert wrote:
> 
> 
> On 2025-06-25 08:20, Dan Carpenter wrote:
> > On Sat, Jun 14, 2025 at 12:50:37PM +0200, Miguel Ojeda wrote:
> >> On Fri, 13 Jun 2025 20:33:42 -0400 Greg KH <gregkh@linuxfoundation.org> wrote:
> >>>
> >>> Great writeup, but as Miguel says, this isn't needed at all, the kernel
> >>> relies on the compiler to be sane :)
> >>
> >> We may still want to clean them up, e.g. for tooling -- Kees/Dan: do we?
> >> e.g. I see a similar case with discussion at:
> >>
> >>     https://lore.kernel.org/lkml/3f1e7aaa-501a-44f1-8122-28e9efa0a33c@web.de/
> >>
> >> Which in the end was picked up as commit 2df2c0caaecf ("fbdev: au1100fb:
> >> Move a variable assignment behind a null pointer check").
> > 
> > Putting the declarations at the top was always just a style preference.
> 
> No, "const" and variable scopes are not just "style", please do a
> bit of research. For instance...
> 

No, I meant it was a style issue for *us* as kernel developers.  It
wasn't like kernel developers had not heard that c99 let you put
variable declarations randomly all over the place.  We knew about it
and hated it.  We only changed the rules because of __cleanup magic.

regards,
dan carpenter

