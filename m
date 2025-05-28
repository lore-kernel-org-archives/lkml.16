Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80F1221F15
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 23:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748474645; cv=none; b=Zpu4SHn45xq9rj3HX9U75SCdLvym+rOLW4nQEdemD6qjvIClWqH2VfPXEm3nTLjvYzwmgl5k2YAmO9gEYnQUJMkrduGpq1b6CjINZ41mHaACC5EZH9GHNpo4s0nk0YqgQBPuwuyNvLRje2t2cDLBeJOPutB2JjhdQBkKYKULGoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748474645; c=relaxed/simple;
	bh=BY6dFa5k/P0tKoxhYLdQqm3+SlrYCY9k4tsnrB7ah5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BgnrZ/v5Vx2g7GeowfJpd+LYyY5qYU7L/vauBqQKmLbDAb47guSm5doURsE5Aht9/wZLjyhhPDU7INembqn9P7mzRgvNC4k8iYU8i21YWg2ntqFimyBGNtzVJKPyt8tUEa1U7u0+8GMJBJTSzfvUdRUq6S2iLw2qECN8PcvMKaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YBaEFim2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YBaEFim2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748474643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NL8V5upuEYKS7My4G1ky5sPL2jdPACQefsgMNdleTf0=;
	b=YBaEFim2xLpLfFe01QnY7xQyV1CAPZeAgyx36bV/qjsKndeOIZcf+DkebrC8C6/lHU0Q64
	0A98WICrH2HLfRL9ScdAHBFil+5wHEMyI0r1vwrikP46sWpeGA59naW8qzSHbVgyanou/K
	FF9HTegfXkdfHjibvj7s2uq29OHVLK4=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-347-SLz8uVVrOP6Rs6_unWzxuw-1; Wed, 28 May 2025 19:24:01 -0400
X-MC-Unique: SLz8uVVrOP6Rs6_unWzxuw-1
X-Mimecast-MFC-AGG-ID: SLz8uVVrOP6Rs6_unWzxuw_1748474641
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5e28d0cc0so41759785a.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 16:24:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748474641; x=1749079441;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NL8V5upuEYKS7My4G1ky5sPL2jdPACQefsgMNdleTf0=;
        b=XMLkZqKcCL8wscabkvoHzMedSBbu3/LALD4Rz9F2EMvgRhCmNT022yrbM1Cy4ZJ54F
         TNRPlu1ifZMLagbKT8XxZjUFeG5257ZhoiGadGm+G967bcL48GJCo8tEgmaBmrOrMY0q
         qjeSQvT1K26fuUzAweMkj/BjC6Q7tLCiazQVa13JkgWD/Hd2PXz6tV+1SsYP6EOq0bP0
         USb/O9AYnmDMRhzMQBpSHcdAy7b9JWC+1R0QTRHD/OIk6UAkYn6yIAPH8nTuSGXzPaVk
         E6nhsT3H7r7gbXVD94psyqK3HC88fM5EJkbkFtBHSpXC0GMicI5N5WqYuCEE4c+QXwXA
         zgcw==
X-Forwarded-Encrypted: i=1; AJvYcCWlpKutGCIvQdI1o6V53rsmPqK95Vphr5Idny68e6RnlqtBlzjQJ4fdXSKDkUlV+QEMsRXYNp3a9ArWc3k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOIysI2bI3XAbG5P32LD3aEWcIK+43LmTTO5hMDHMGZ0VlC7aj
	kScsehqNRt85Go/jGbExBnwNJNNGFYsA4/Ue+70FWIUt2+B6pYv/olGu5bNtnaEx3b04dfqupSi
	DcwDYK4GShz5+sg3ln4tQPxRE3yz//Q8IKIgCHUreegPqvnMsYSwH0T6tfJHR/4YpPQ==
X-Gm-Gg: ASbGnctomKHNunnmZHRDGnsB1N6dWQoGDx1PSpWl6fmuB9V4918Ac1OrL5nE4v/xlwi
	uBzGlN1vQ+8f8LYbAFcTrb192gPSYfd5QJkulULNKPYbGT1zfdJR+01DDcqPvcE4i6sUAlScWWl
	ILXMh2U3ue8Yrjl60bG1E1POgHCPIk7zEyEaQV9gfJVj2l79PtUSZVz0xdK5yvqRAQtOD8cQQ0n
	lnOItYwmSw+tI/c6acEwrQM3dmoLvYcCwGuh7war2S9CHc310WoyMtqD9RnFp+8/pJOAnNYJUDt
	dkIf7BZja0wvxf9EI+O5frtqp7aG9AwNF00=
X-Received: by 2002:a05:620a:4046:b0:7c5:3cf6:7838 with SMTP id af79cd13be357-7cfcac2a902mr664849785a.49.1748474641438;
        Wed, 28 May 2025 16:24:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGD4C2L/pXxMI3Udf7OOd16ifJeVVzoLPeYQqx/Fm28waYypOeikdv0j6zbEKCG0HmQslyYYA==
X-Received: by 2002:a05:620a:4046:b0:7c5:3cf6:7838 with SMTP id af79cd13be357-7cfcac2a902mr664847085a.49.1748474641151;
        Wed, 28 May 2025 16:24:01 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a0f8ce6sm14105985a.37.2025.05.28.16.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 16:24:00 -0700 (PDT)
Date: Wed, 28 May 2025 19:23:59 -0400
From: Brian Masney <bmasney@redhat.com>
To: sboyd@kernel.org
Cc: mturquette@baylibre.com, mripard@kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: preserve original rate when a sibling clk
 changes it's rate
Message-ID: <aDebD9V0sAoH2NJa@x1>
References: <20250520192846.9614-1-bmasney@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520192846.9614-1-bmasney@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Tue, May 20, 2025 at 03:28:44PM -0400, Brian Masney wrote:
> Here's a patch that helps to preserve the original clk rate on sibling
> clks when the parent has it's rate changed. More details are on the
> patch.
> 
> This series needs to be applied on top of my clk kunit tests that
> document some issues that need to be fixed in the clk core:
> https://lore.kernel.org/lkml/20250407131258.70638-1-bmasney@redhat.com/
> This series fixes an issue in the clk core so that two of my kunit
> tests can be enabled.

I posted a v2 of this series with a new title for the cover letter. This
combines my v1 kunit series referenced above since I made a few changes
to the tests.

https://lore.kernel.org/lkml/20250528-clk-wip-v2-v2-0-0d2c2f220442@redhat.com/T/#t

Brian

