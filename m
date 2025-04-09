Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194331C3BEB
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 17:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744221175; cv=none; b=Y4XuTTSyCI7gl6WgD0ZbFqY84UKaXbUdZNaxkLBebUu2wTNbmol1uz8ikdo6KNI2M0NIvXRxWcsZDf3nRE4NXnf0HM+hgbLJZq3Mz6jHvgrPnXCf+u8O8dVcYU4MWvwK+vYZ/MU2BX0j1LlnLTbzy1+Y+HMRw/JKjeAkM0O/Wd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744221175; c=relaxed/simple;
	bh=xxz5KqATeXvK0rPshTPqd/LzAl4MBvLp2I5+wyXay+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xm5Kp30oiKc/mo43SwTHNLYxA3E5A+OLRbSlfALKou7opbb02d4vFiFzu3Ks1t96XJFatj+jN/EV9yYlSQwpEmjuDkGecvCfATJC8aM9qmgPCzIGa/i5xwXTE49Mj9jlRoTNRXF8sVBdTKrxh+1YxREcPmdb4HG/G8jrQoXvzes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=AkH9dClS; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="AkH9dClS"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-306bf444ba2so3640880a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 10:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744221173; x=1744825973; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AOSlYEtzUARQCpLt8Pf7yETuTbwsnbf1Vd4MCQ3wcqE=;
        b=AkH9dClSfsAxyza89BoVgL5cGU0BKyEgDu1/k5rmrjANUFlUvhhh7LSMbWYH6ad67A
         9Yk4qk31oWCYJ102slskRD2yUgp/IQAex2RTSXnREIjnSk43KB4ndC+G9dCOqCskq3Nm
         vwQYZfwlFFEr+Q5BM4WBf7uC0KHQ/4E4/pRjGb4NGRt9b0WU6AJV4US5F1BTeDfQ3UE9
         4Gl0gjp0TRhp9MfxBT1KsTfDo3x8EF8Fg4LZWvVJgXlqh259Yv6bjjDDvCILzWQIlyY+
         BFD3Y//D8tCbu2WMb9pwYb54FIb8hy/P3bqJsyzwZeUPlyxEF0LEomAfQxLXE6j6s9Dy
         KEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744221173; x=1744825973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AOSlYEtzUARQCpLt8Pf7yETuTbwsnbf1Vd4MCQ3wcqE=;
        b=ZB/6QNXd70eedHSqSiYIKhcdJG7/qFk+ReH1k53tthJwwsmYZ4SLGCwMKc4ZYYncUC
         v7mO/44OJz8OcA1jdGd6g0U2Ao7pfmub1w0ZV5nZ7vVsOSkYuQ2WGdXtwyiG9V+DBka8
         DImj65sjel4rCngqN9LhQ4+hUysVMnrXZFH2GhouLrZ8FMLE2KvfwoSrN5qVjZak5Bwg
         v4lttcFU9Y0tqy+OHadS41uZ+vJphwGK7jPSkCgc/eRuXdwUbxpsJAYlE3bo295Ky6Gk
         5V198VsA86zfc/Oj9rmVQHpDPD4ECRRNlnxINMwHvqZJwxsWBYP879aeFy/ybyn7KhiJ
         XN6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVXYS1CsiOVIbql0paXqxmCJk2kQFUisF0pbyfXfpnyc26u7Vcn3J3uATAm+zG2PLK5AVUhMGjkJdXtRSs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLhpputPgh0Rd9EDq5Lw2A4jVMCTTRxiWdS3CLmja99x7rE050
	2QpxWEENDwoyov8jlaqGsQHp3TpOhGRll1mKmKwJ/9qMQRPpH5kvsp7cQX74WA==
X-Gm-Gg: ASbGncush9BZTRZgcmJb2BxRnDqZZrIa9FhE8Y3RQ7b/D0q7nTmHXy/F4QYbWGziXzD
	cqaIebezDgh3hdRiCKuecMo5s+wQpnFTPg7yNyUSqgmJrgdj4PVBYrBeN5hBvCygFDt+K3UcMts
	q3pc0Yj95aRzQoL/8VlQv2s0qfpRWU41Fnl+A9PW5VXrfMCMcs6SPr/u2IxgSIlpD/zfz0xiQha
	lCF2fVUvH6lTHCLOiU+I5/hsM9WmZnKVsUiGeru082wpiXu2p04y94vWbm9LOdq1T6SqIBGQOUP
	+xjKMCTqcryvAIVer1nbSPm8AC5ijCpocaJvkc+QTwYhvY9JH9MhQV65Nm5jU+DxzpAOUCmPNe9
	JAirRIQ==
X-Google-Smtp-Source: AGHT+IGdLmkkp9tpjERm9n8TBOHAnBJqup1C5boiLMSKzNsOMaTJmy7hjzGOka/L9KC5316Ew1+GRQ==
X-Received: by 2002:a17:90b:2d0d:b0:2ef:67c2:4030 with SMTP id 98e67ed59e1d1-306dbc29805mr5321752a91.27.1744221173370;
        Wed, 09 Apr 2025 10:52:53 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df4011dbsm1938065a91.46.2025.04.09.10.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 10:52:53 -0700 (PDT)
Date: Wed, 9 Apr 2025 17:52:51 +0000
From: Michael Rubin <matchstick@neverthere.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, dpenkler@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 01/18] staging: gpib: struct typing for gpib_interface
Message-ID: <Z_az87Yx-NJvGASJ@tiamat>
References: <20250408222504.186992-1-matchstick@neverthere.org>
 <20250408222504.186992-2-matchstick@neverthere.org>
 <804eaa0e-e1ce-4ee2-8ad4-f56bedd6d14f@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <804eaa0e-e1ce-4ee2-8ad4-f56bedd6d14f@stanley.mountain>

On Wed, Apr 09, 2025 at 11:26:41AM +0300, Dan Carpenter wrote:
> On Tue, Apr 08, 2025 at 10:24:47PM +0000, Michael Rubin wrote:
> > Using Linux code style for gpib_interface struct in .h to allow drivers to
> > migrate.
> > 
> > Adhering to Linux code style.
> > 
> > In general, a pointer, or a struct that has elements that can reasonably be
> > directly accessed should never be a typedef.
> > 
> > Reported by CheckPatch
> > 
> > WARNING: do not add new typedefs
> > 
> 
> This commit message is quite long but it's totally unrelated to what the
> patch does.
> 
> This commit message should just say "Having the word "_struct" in the
> name of the struct doesn't add any information so rename struct
> gpib_interface_struct to struct gpib_interface."

Thank you for the input. New commit marked v2 sent to the list.

Michael Rubin
