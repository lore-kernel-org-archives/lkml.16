Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FD01A317E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 02:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745981998; cv=none; b=pIEReF3dVP0Mmga5RCnjtVegafu0GdOzdwr89AGqmIaF3+rChWSynIDHhTNngU9nRgFlC3HPsgDTFg3826ru2RDBTiSQY8VpE0SGwpF1wjMV3exXcX28nSh5kniXIXdiM5eQBDHdV+p5LxOVIRH2OTfb6387pp3kdcDRRIUQs98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745981998; c=relaxed/simple;
	bh=GHQkc3FXloqlNAuYTzeb0ZL6MOxgugaK43eAMibLWeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ai8jpOGuXKIhsMoaHUECdvY2KrBLCJzj+oriPr1Ph4zlGjm4o3eegx3Mb1FNOHXWhGclM7ZjQbSF1FIQ0wCRKVIHESbzK3zK68E78zJU3pX9p19mns9Ye1YimmAJUgwfVsMUWTeUnfI+u0IFqdzKjK2fcrnZ3ZNa6R+aJyD8+sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZOQpPFt/; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZOQpPFt/"
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-ac6ed4ab410so1062425366b.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 19:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745981994; x=1746586794; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pG6I5vWSFedJSkBxsNAzdBugXyUbw1kRyptLvd0MY2k=;
        b=ZOQpPFt/oMzzUEEooKejV5PCwi6hNtlyMn/Nl/+6rmChUSc6jRD1dbwsfKxaZWzTTL
         deLUIz6SBLGzP7UW+BUjiQMlDr4yy6j70yBLmzkFV9YMWVN+Tp9RJf6zszzbBmxI8cMJ
         XM3BmVimYaRAc9zWSnfyKecKwiULS3mnPh6OpxGpCXC/uT+faJQJnLQznp0KsOpAus32
         mqtMA9FSwaz7A4tbJnPYRNRs7A6i/gwuK0zNoZy1rUTDP4/2l4nS+ZiqOyXt9TVairFs
         GJDEe2c/TsawLpjtOa1TcV3idFNkt0I47yUQ9XcHZqPYicNqXOSeLlLmtk+eidARlciI
         HeGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745981994; x=1746586794;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pG6I5vWSFedJSkBxsNAzdBugXyUbw1kRyptLvd0MY2k=;
        b=pQHReZOj6X5uTN2aHpAyrVoZSHJOIwrlJL+HbSiTyvZV1Onsk9+qP6V96ZaE+wJWaj
         6HtAnrEvnenzA29j9/3468BQZaY5cQ+oL6TivNCur0eu0lYHOdQ/KnojGubVditmhO+X
         Dzzbagr+pzFdgIrZU3lAjGTm4ch+EAm27G5KFevMcWhZJLQ31CneToHs8PBGen/BkoIc
         ObKgwbGAhCn87werCk+RMfflT3cQ0qH5l502q1jGXTjKJpSg9GHmKZQHchtAyfmbf+hu
         ergmDOcxMFEKZWTgzoYQ10HXl+bZSnlv8ukUfEYwdsDEAn6FNvqhHUgwoaDQtADsq+Su
         htuw==
X-Forwarded-Encrypted: i=1; AJvYcCUP8aOzHlDr/VQXrIYBYEb2nW25+6aUo6tAC7PmZd0iF7ZqP/vH4Dj+e6hV2fyj9Gnb0NaepFiu7YEirDA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRibzSLv+y7njKHy1WYDZe3kPKrX6FTFptEs1Zo7xt4ccTeg4Y
	ik/H5tgVMUV0LQmkv5PK/zdv5KkbBXEmpFw92QKeOrMIzjBBnuIUUvGub0gNdXs=
X-Gm-Gg: ASbGnctJ1wbspmjOZMOVPTGj+cyxFJxXDpo9hjjx9qXDjjr6ltxcdwA1EH1N+P/1Yu5
	MChJNU4XlkWDNfCpa0k6i06iJTOIQnVJBqExmpasbxTp9XWr2PwniYylObhKYIGNsIJzpl3dJa8
	/kQVHQYhd0RhYk+Kq4K350G9JaXWPGlEtNpvcHTgkEsLR6X11u3wXu5xQ+sYPC024ePAktvOADu
	T9sUMTZTU/Thd3xeEcwCzpDs6GigLA5SIdPVL036FHhuG3i4bBdZ1nJ2MxeJgfymM+kqciNSeWk
	iXqDzu5R0tugUG+hbkIFLBIgsRSD57T4NXZr7QN4/S3EKq5q/Y78lZCmCauq19VOGQ==
X-Google-Smtp-Source: AGHT+IH2cNTkQBzyqfuqh97tDzMgDA/fmKHw+4HpNwa25q5IavYcAeKgdHYsqOCmKNZQVXcjThwZng==
X-Received: by 2002:a17:907:3f1f:b0:acb:4de7:14d8 with SMTP id a640c23a62f3a-acee21a69b6mr84838666b.14.1745981994039;
        Tue, 29 Apr 2025 19:59:54 -0700 (PDT)
Received: from u94a (27-240-163-208.adsl.fetnet.net. [27.240.163.208])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6edb1580sm875529266b.175.2025.04.29.19.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 19:59:53 -0700 (PDT)
Date: Wed, 30 Apr 2025 10:59:40 +0800
From: Shung-Hsi Yu <shung-hsi.yu@suse.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, akpm@linux-foundation.org, 
	linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, 
	lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com, f.fainelli@gmail.com, 
	sudipm.mukherjee@gmail.com, srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org, 
	hargar@microsoft.com, broonie@kernel.org
Subject: Re: [PATCH 6.12 000/280] 6.12.26-rc1 review
Message-ID: <dbif2hqcfe6oz2zziy5e2anzdvi7swbrb3xqcmdxobmj3fczrn@le5rlwynle6y>
References: <20250429161115.008747050@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429161115.008747050@linuxfoundation.org>

On Tue, Apr 29, 2025 at 06:39:01PM +0200, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.12.26 release.
> There are 280 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.

test_progs, test_progs-no_alu32, test_progs-cpuv4, test_maps,
test_verifier in BPF selftests all passes (with 82303a059aab
cherry-picked from bpf tree to deal with sockmap_ktls failure, it will
be sent to stable once it made its way to Linus' tree).

Link: https://github.com/shunghsiyu/libbpf/actions/runs/14738691393/job/41371100896
Tested-by: Shung-Hsi Yu <shung-hsi.yu@suse.com>

...
