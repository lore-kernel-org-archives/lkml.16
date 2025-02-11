Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0511E5018
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 18:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739299462; cv=none; b=IPDVuKCCNbvm7LkbC2eowlQrLuiEdmINzqtUe9WMRTd4+HaHRLFKee8gtsaVa1hjAs84GmAcE4vzAYQqUsIFOG+W5P3rEtHWQY9c4nCnqvURNufQVtC+k5GixQ+JmCOtet69w1UbgErR+txhv4FVYynqjHBeSAi3X3LqrDgfsbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739299462; c=relaxed/simple;
	bh=aNBVYs6gWcIWcEXKD9wTdtnkHQES7h/5kg6EHssraeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gCBplITFswUc66jgAqKoo9zMokhdFB6L58f6/VVppPsASnwIJJDGZlRW2y9hfpyTR4/BjuWaEE2o0sXAWvqb2JnZ2Eu4ymgUpsOQiVwIHoaGacCmxOsP9gsPeuSjsQuRXKZSbPTyTrociS3hbPspSleNWSMTSRVb8w4Iqn7Gc/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VHc2af37; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VHc2af37"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6f74b78df93so53199017b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 10:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739299460; x=1739904260; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MkyLFsydGPzhoytbDgApYNBvCgBU06CVs2EpR9pi1xU=;
        b=VHc2af37FerMU/jHNb0LFHnFbnlDydIGluX1i8RR/NEjWs4k4xLevJEbYOpzMBfMqh
         IfY8fQPhtzADC3arJHpFDZB9+r69GFZ83WmC5o4xXVFMNKN9RQvCpHaYJxh9L/7vg9LI
         Amxe+c0gsYEzIl9QfvNAtc7saFsof/p6Tf/mttIj5cs8qBFCK7ZgK+fwtTzSCRcsa+Xj
         qCWRTLgHyCz7fZlljZQDdMGoA+8/XlZLjsbKRCzU8VP4kVopUuqeuei1AlcpEvqaq/kC
         lXU0MRSE2SevIDaGy67U4M3FprjDKRVtf3N42NtTYliFuG44iT2k8CuZTvxyoMNb1ccd
         m9GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739299460; x=1739904260;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MkyLFsydGPzhoytbDgApYNBvCgBU06CVs2EpR9pi1xU=;
        b=n57bp27kxK3x3eF8rhHNEk01Heaewy+cIl/AiJFMZpz9sr5HRH8937lBdIsflKJac1
         ovOLZF9OiE2R40f85ms9lW7zBFy1IlAOVRJ/X2DGZDyotYGEppSYrzVX/EGHhgrlRhCX
         XOMVpLx5t/KhZU5m5g5wWIa4fccqH2xnNo6v0WtD+AyWmblV6sxCVO4pm0DHYnEYP1la
         09Ei4LKG1ErKA7b19NaKJyqWFxAvYcQw26/iNd3YI898S6eBx3T+aUXnxCLshVtsd8T3
         tT+BR1Z4ek++C5mRGtSIA6L/8LxhiNrUHw6iECXPY94L20ZcmVVoKZPRfERl0YjpOUxA
         1FcA==
X-Forwarded-Encrypted: i=1; AJvYcCWtR8DWVhZZ0r0FLG3f7eE1DcozdIPPFHTbRD5us+HdnLdRJW0bUNP9sYBd/M2Mu7/1iCzz4NtESoYOG/A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwILfX2CtElwHY86+ZkGvVhVftodd9gmO3MBg4Q8EhoDwfB4xPa
	QMIcCqspaEJnZWmb8ijh+tZWxLpt2i28kjqb7h243PtpZf1B8TiK
X-Gm-Gg: ASbGncstyXTFHYBfu6y/XYZdz6jqZZIbAemIUFYK1Jva7Z8196hMIbiQ5iccxSBuUkD
	vgr9AK5Yt3SdLoqhhWoXZTqo7Gsr1rJ8kGeKT3L61cuAfQ5lX8KzHupAeubS8nNkzf1DmhhJicC
	tqjuzZ/jqPSFLNusfFEhOEm4zu0NgUHriJuzTEvzCEJRfIcNt3kMFPN0Fx/B391dG19bqhWVJqD
	sjs8q9svTW+6fUNbbWF74A7y3e0BFQYrImhn1x1NHfyHrQ1BxdYU8z2CMeB89sDBLT+tnl5WFhS
	Z8fMmrjf5h7wsrw6Udka4p59qxT6bPjdA8x1ETK9zSU+LuakKt8=
X-Google-Smtp-Source: AGHT+IEFtEXAc6LSBdY3GgxlLMCxQLTUaYICE+X/hnCjyOtzv4sOS75nucxqB8UvDT5qPB8FoMXg0g==
X-Received: by 2002:a05:690c:4513:b0:6ef:e390:1d4a with SMTP id 00721157ae682-6fb1f1a9e9amr10548037b3.11.1739299460034;
        Tue, 11 Feb 2025 10:44:20 -0800 (PST)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f99fd1d5d8sm22523017b3.39.2025.02.11.10.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 10:44:19 -0800 (PST)
Date: Tue, 11 Feb 2025 13:44:18 -0500
From: Yury Norov <yury.norov@gmail.com>
To: I Hsin Cheng <richard120310@gmail.com>
Cc: anshuman.khandual@arm.com, arnd@arndb.de, linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw, skhan@linuxfoundation.org
Subject: Re: [PATCH 1/2] uapi: Refactor __GENMASK() for speed-up
Message-ID: <Z6uaW9XzaKjSrWYC@thinkpad>
References: <20250211162412.477655-1-richard120310@gmail.com>
 <20250211162412.477655-2-richard120310@gmail.com>
 <Z6uZZPpQ9YYfrL-I@thinkpad>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6uZZPpQ9YYfrL-I@thinkpad>

On Tue, Feb 11, 2025 at 01:39:34PM -0500, Yury Norov wrote:
> On Wed, Feb 12, 2025 at 12:24:11AM +0800, I Hsin Cheng wrote:
> > The calculation of "((~_UL(0)) - (_UL(1) << (l)) + 1)" is to generate a
> > bitmask with "l" trailing zeroes, which is equivalent to
> > "(~_UL(0) << (l))".
> 
> I used to think that GENMASK() is a compile-time macro. __GENMASK() is
> not, but it has very limited usage through the kernel, all in the uapi.
>  
> > Refactor the calculation so the number of arithmetic instruction will be
> > reduced from 3 to 1.
> 
> I'd like to look at it! Please share disassembly.
> 
> > Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> > ---
> > Test is done to show the speed-up we can get from reducing the number of
> > instruction. The test machine runs with 6.9.0-0-generic kernel on x86_64
> > architecture with processor AMD Ryzen 7 5700X3D 8-Core Processor.
> 
> So you CC arm maintainers and provide tests against x86_64. Are your
> improvements consistent for arm, power and other arches?
> 
> Can you run bloat-o-meter against your change?

Ah, sorry, overlooked you bloat-o-meter results in cover letter.
Anyways, can you provide it for each patch individually?
