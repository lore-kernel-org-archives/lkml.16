Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732462517AA
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 21:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750800675; cv=none; b=V5viSZhUvAbUhDHn9WlUOkPmoYOKebefYgT6mhjAlOMzM3lfse7RhkMCQqf9fHDz0juPTtOnJ2IuPyaPysp/AXi8z0A9ntZhqM/L2klAawvr0S1RQguAZu28n9j+oHfty9xMLFha8gcLJbeJnLK+dxO4jxA3c+8LVpkmkwQvcIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750800675; c=relaxed/simple;
	bh=iWJFa+CoIH1aRFa5s3weT2eEIVY61koUp8gTnMer7bQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fHTV0RaxAYR11aSrWKXZOp1LAzWlKhZjm8MViS/7V74Va0+3JdZ16lI9BI0BjAthODu8J5CATFIxhojJRQZpGv/TlsGs/f0SFcLPbtJ5+kcRq5C0Tdjyea69v8FbFWyK+MWeJaPVCH9C3vrGKtDWUcAfChuTCg24dQAFg4YeY3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bym0BXNQ; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bym0BXNQ"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7387f21daadso186161a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750800672; x=1751405472; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XAGh8Jym7W9mO0APdl/bJnVSnx4qhJSlcOpA2Gqe/Y0=;
        b=bym0BXNQpXGMLBHLocUm0zqvfsOFYbXxOVJfwZYNWvv25LS50GAbkKY9YD1GZv5y67
         /KxVjZukDlVe/XJYpefFoZBQXoeBjMphVftQf35EiT0PMcsSwrdnP6whh4pFUKmDGmcY
         stB0Aj7BNZBtIhzWSJhWwICuiO5LPVDLPyQXkFXQYd8NVM/+iTxWSupykXF1ewdWLKT7
         A7HGEoojCRNmw3bH0POY4ei+XjxTkNsh4XNgSuUoBVRs4xgtVHDVaD7c3WsCChKTPVGA
         VxmpHEft0uoLlQBpbPAc0FKuJIoEUtUTxX/s4l7v1f4QU034rsqL6D5dv71B1yQsCN/P
         qkCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750800672; x=1751405472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XAGh8Jym7W9mO0APdl/bJnVSnx4qhJSlcOpA2Gqe/Y0=;
        b=usK+wTBOBqQNI9NPKQt/juYgeKE0bRwBSfe82IoIyPM4Bx5C61BLHikCS+creKp9PM
         3rUIhvOCJE2k5sI+j4nYORhgZmzgIlFwsTuPRpSu8U/or3ir3l6svCnRfLlybxkko5/F
         0hAoZWz+1+ucCdp+MF4avk8TZ3JXsw6U0y3N4L3IF3NZxWvBgc1zdlUGtry7yrCCV9TA
         iO2NfslZM3OxdxKmG9i8BNp0mx9PAQl/voz7aYtzNxpEb+wZzg1rS61jylWgq2M4aUuS
         ZZ+69575AY7ASXKHXXJaaxt+nwFSWJxIi/t/+BVU3ID/wkYbBYEiL2R0nPwy2HnaNSga
         Q6EQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6PI1iinL+1mToJihUd4xWWtNsj+zr5lWpyudO6ZnbpTCtBHP0rWXtvbsvJZw41Pl0XkTO73o6ICoSvNE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkw3qPjcP23AXAaD5sqLdS0/VX9826THwDVPrn3W+B+RITgJgq
	eRXSIP7/oo6nd7AJdhLAqqUSFgeZTrSTSc9mr4pRA+UjC/FGUer97TbOneJlBeI1B7I=
X-Gm-Gg: ASbGnctScnFRMI5HbfjVnGLqw0vQe3/PDSTekA/AME4EjJf9WFf8i4+1OcnpITCFZSt
	eRsYipYQ9XhP3aesTImYzowDIwcsreArQDuuj5X1nvonXOZMBve90IGf9f74Z2D6K7xUici4NeQ
	FWoQ5Vw6QeVxrDaM5SpixFz6T6uZ2uJY0pZuXjvpdjK4GHpI87NG33ril2QWVhotoPKmnXTqGiY
	6+5Q4ykAOm+LfaQkgqCiFgQa1v5Fx0G63C6HFR1kyq6h+KqxoJtjSqw5/dnsy5DG4Ij4XznkSPA
	PepfYv/8CLkCgyNHQmbA6WMnn+Zik8RdzeWfLXsUtmlJMLkWkAiuPId1FbYYjUL0HbmZew==
X-Google-Smtp-Source: AGHT+IGmNlfw6NmkG1PAAGja8E356NKpTSGC2pBqHIlxBkBODoIakpD5CgLpL86zGjAuJM9IDxTukg==
X-Received: by 2002:a05:6871:607:b0:2ef:88fa:e0c3 with SMTP id 586e51a60fabf-2ef95cf0d15mr3262805fac.13.1750800672473;
        Tue, 24 Jun 2025 14:31:12 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:22c9:dcd3:f442:dd1d])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6115b68edc8sm1449545eaf.7.2025.06.24.14.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 14:31:11 -0700 (PDT)
Date: Wed, 25 Jun 2025 00:31:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	James Morse <james.morse@arm.com>, Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>, Ira Weiny <ira.weiny@intel.com>,
	linux-acpi@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] ACPI: APEI: EINJ: Fix check and iounmap of
 uninitialized pointer p
Message-ID: <31b6548f-8ff7-4bc5-8a2c-78a5a9d5eb40@suswa.mountain>
References: <20250624202937.523013-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624202937.523013-1-colin.i.king@gmail.com>

On Tue, Jun 24, 2025 at 09:29:37PM +0100, Colin Ian King wrote:
> In the case where a request_mem_region call fails and pointer r is null
> the error exit path via label 'out' will check for a non-null pointer
> p and try to iounmap it. However, pointer p has not been assigned a
> value at this point, so it may potentially contain any garbage value.
> Fix this by ensuring pointer p is initialized to NULL.
> 
> Fixes: 1a35c88302a3 ("ACPI: APEI: EINJ: Fix kernel test sparse warnings")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---

Good catch.  Apparently this isn't in my allyesconfig.  It's weird the
zero day bot didn't catch this either.

regards,
dan carpenter

