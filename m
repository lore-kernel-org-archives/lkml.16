Received: from mail-il1-f229.google.com (mail-il1-f229.google.com [209.85.166.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B0B1E8325
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 19:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743622463; cv=none; b=KSSw0+71LvR3nRz5pa2S8i6UVvMQGWJ9Iwhjmc3BbUX/XNIFitbsjGKilEy0vKOyiqP70hXagvgoW7T40V96MlzlE37jMkAiHPV9wl7sZ6kEIMoVF/dq3NRqCcSW2tG57uj/iA/y3cIl0Avd6yThSAZNc7P+LlVwzZAXFp64DWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743622463; c=relaxed/simple;
	bh=lV/SwxkHMDeoIBtMKdT8vjsBHGJhbLBdcHJ4C+0jMMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZokIYlnT/elEkYiiolsBnoMY7TAZzhnEfOa1JqiN41OwbJ8L9OpgKRUmI0nTLl+/MslXha0LuFxrnYTXrDJGBmPWHlLN103Fk+iD+Gc4VHyeyn6TBOyz7GhC7BITem3JtgoNiA8JPMsIP+s/dHQphGGdQdPDyA0hqd1tkBVWkZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=JfTtlCRv; arc=none smtp.client-ip=209.85.166.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="JfTtlCRv"
Received: by mail-il1-f229.google.com with SMTP id e9e14a558f8ab-3d6d162e516so1781895ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 12:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1743622461; x=1744227261; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RaIhuSmEG2G5gRImcsA2An6Xyo4MZv5/cYCExcMzv5I=;
        b=JfTtlCRvLM+P92rFUbnlT6JHjq9Pcc503XyB0KT4YmnhdWISk1L7p7b9UIghw93Lwn
         rgOCeOBsqinFAlCrJAXkxUrd8sa+mfoz3+bCVr+pXJekHN4Ge/ol5f2DegQbVUwyJg2Q
         344btZlxS6fTFQIeUz+yCDC+8sDGMoZ4xaJaPDXbHfBAUP2bOWE7H/lWCTyuoU2pIO1r
         aeYiGbNGd1yDdOc3bHboKeVDrBu4kboKvu54rcJzA46OvEwpS1jwPt4m1lEF5pxx5p6t
         XDzYA0udK5cSAvt6hG5mzyBPJu/34xUhDXfGryY/2akRZ46LH4UVU8PwL2v93+3kGWc1
         cZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743622461; x=1744227261;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RaIhuSmEG2G5gRImcsA2An6Xyo4MZv5/cYCExcMzv5I=;
        b=uzMJVvgc9/93vQFAUGp+lD/gAyOhz/3i8RxhOFRR93Xpy0IxwBXcV9DStN5wjXowAW
         j7Nblz/aJYyZHB54NmuDBehBFlZ7SFz7M0TCsvtTgvmRclyOoIxRKr5f8flYYfMMM2s7
         Ek2MaWVMBC6AQ4F6Rib0A+1Fn+YlTshi1clmirgW73OIbu/2uL5jCJqXYuJKKk3AgcYx
         orBowV6DgbHoo8YhvNaKTD0QDEm7KrnU8GZHb5gRnqIQwF971zPffF5QyELgIA3huITc
         LlgTBPlM9jUhokuQT4i3EFwgCrSEg7R5JQWies23+fGm8abSGYM8tsz4l6M+XHWV3Lni
         35WA==
X-Forwarded-Encrypted: i=1; AJvYcCVWBkFJBNTyeZ5qaiI1ZCLqc2vi0qqu3ZxcjBxdhgolmAAxWpBg8Z7R7NPhuhw9R5PM7HyxHPwSej2cDHo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLfLuTkRnuEx1K8PnsrXusMJTkzKXdilGMqekRxigEgqpw0JR8
	gw9qi03zzMWVQdqlPHZwFTH45bsPDIZCNWF2lFaFQRbzqNkL/PLa8+HH5wRlAjKI53mJ0nG8sZy
	7f1dYqM3+JEu/c11pmOWj1K9qbff9Bs6r
X-Gm-Gg: ASbGncvG5y6gArKo20oc3cJ4rwHInMXDrjc6xqbUe4ra1XLHI8Df9L/8aGtPUWpRn6c
	7cpnorxbYTT1E9zFCOZf8Ku/0eCW+2nHk6u8+8Dtvw9JpRb2un+x9hixSLDOQwgGb3jDtmKCdNk
	pgEjZbJDXf5j6/44BfraCZtp74LAgAVC6OGXEbHVRZ/WVyY0oXZ7PpqkQ7DhbsdDmE09Ev2jKo9
	eX0A7wU8tGAsebA1ZuLgVTF2tUh6ShAXolSbX1tEXV/pMZxVSNQoW2XeV0d9Hd5Hw3Klirksdl4
	e6L0SjtadcyJuev49KT+H/AZdlCl3I3PtucEUHqSa22QApG6+g==
X-Google-Smtp-Source: AGHT+IFsAD207aygo+0nztSrAWlExKIbT6EOMKflxaoI+jAMbF2RFZ0fWIRVrELjJbRzWc4ygH65qwEhvjnZ
X-Received: by 2002:a05:6e02:17ca:b0:3d0:4a82:3f43 with SMTP id e9e14a558f8ab-3d6d547edfbmr43005475ab.5.1743622460924;
        Wed, 02 Apr 2025 12:34:20 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.128])
        by smtp-relay.gmail.com with ESMTPS id e9e14a558f8ab-3d5d5a6d972sm9687095ab.28.2025.04.02.12.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 12:34:20 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [IPv6:2620:125:9007:640:7:70:36:0])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 3ACB0340186;
	Wed,  2 Apr 2025 13:34:20 -0600 (MDT)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id 2CA73E4031B; Wed,  2 Apr 2025 13:34:20 -0600 (MDT)
Date: Wed, 2 Apr 2025 13:34:20 -0600
From: Uday Shankar <ushankar@purestorage.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Ming Lei <ming.lei@redhat.com>, Shuah Khan <shuah@kernel.org>,
	linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] ublk: fixes for selftests
Message-ID: <Z+2RPI1GC9NoE/w4@dev-ushankar.dev.purestorage.com>
References: <20250401-ublk_selftests-v1-0-98129c9bc8bb@purestorage.com>
 <174359956539.20480.17105268115889494986.b4-ty@kernel.dk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174359956539.20480.17105268115889494986.b4-ty@kernel.dk>

On Wed, Apr 02, 2025 at 07:12:45AM -0600, Jens Axboe wrote:
> 
> On Tue, 01 Apr 2025 14:49:07 -0600, Uday Shankar wrote:
> > Fix a couple of issues I saw when developing selftests for ublk. These
> > patches are split out from the following series:
> > 
> > https://lore.kernel.org/linux-block/20250325-ublk_timeout-v1-0-262f0121a7bd@purestorage.com/T/#t
> > 
> > 
> 
> Applied, thanks!
> 
> [1/2] selftests: ublk: kublk: use ioctl-encoded opcodes
>       (no commit info)
> [2/2] selftests: ublk: kublk: fix an error log line
>       (no commit info)

Jens, MAINTAINERS parsing didn't add you to this email - I had to do it
manually. Do we need to add you somewhere so you get a copy of all ublk
patches (since you maintain its tree)?

