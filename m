Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7811520AF7B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 15:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743521778; cv=none; b=iupql2MG7HnWytS68KTuOHhdyXZLDPCTsPuo4FuIzi0edh8+nO2bv4rTI1aCrzc/UhoQLvFXPBhYlY2mbu+uCEcn8HfTSV8BVuHKy6xlYLbJEIp2Yp93jen5daYhUaFU/N6UsTPbvs8d9Nsrrl06MWzdI4kqVQws2uQCTFbpQEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743521778; c=relaxed/simple;
	bh=WjBgEYRtDf+VXzdcMzZI5eDklNvn6/aE6Z39PTjvRE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZdWWNozBbXygzFda/AKq6/wrAgm3dKYIoqrot3v69L1st8/ZReryRSPj2P4BkYTdcHun+xp0ZAKtsJENFNpHCmoVpAbHjvqLDWqH0QQ1PABCFKaJ+nRkXDJqcaV7WP0AiAPUXeV6LKSQLqBWFoVd6K7B3SmwIcNZn5zbzolN3Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=m3AUBxx3; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="m3AUBxx3"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c56321b22cso529194585a.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 08:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1743521774; x=1744126574; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WjBgEYRtDf+VXzdcMzZI5eDklNvn6/aE6Z39PTjvRE8=;
        b=m3AUBxx3xhRDmxtypLM4Pt54pD7o/KygxmczlsZH9r98bh7nljPrapMxgz3x8DxeOg
         z4k10ulbzkffTBYiEGEL/FL9mg63VEG4uJlwdJeWBDUkysZAY0bxadyqOrulZzuSnbqK
         0A/kYbYZoDqvZG36C9XlQ4VxVcBUnt0lKueY7/mmAidCSmEG4xrsQZbiKoIt3bem+HZq
         H79/1SGoBMhSCVZYyWHkXf4RFTU6RwgIbd8gGIrfpU9y5N7073mQrmWhAcQtB3jPJT+F
         82VdDRTZZWF6yWcppe0gRD4MucCkwjuhFCSA+daUx4KyrL7kQf1OOWAuZyELEV2s3ytO
         fMEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743521774; x=1744126574;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WjBgEYRtDf+VXzdcMzZI5eDklNvn6/aE6Z39PTjvRE8=;
        b=SjIheWVf/CyayhdT54vrJOEpEvCbmOVHe31Xue130hgFjxZ/wr1Bus+USeMcVTJE0b
         y+nrnVUCs/zJkHOtyFeyL9qnTClAfLGYUuoGg0isxNuAPjuNYunSMUu0dZSgby5+QWx0
         QCcXqidQ3c4znjjfFm57sQtw1iBNVHM0LWqsPUJ8ZJfpepPP4VauwuHTYhJlbGfcphXL
         XsDknIiMAXP6V4JdX6bCNUSTjPMIBmZ8VSGwLSeCuk2ZhodC2zhRGR2qN6iGteioqf2V
         0D94RCKFXGuNWrwWwzVMWyzj42hARzxAcrNkQVPeSJ1iPe/T6PoVIgE/Xj0Ln33dp9KB
         74ng==
X-Forwarded-Encrypted: i=1; AJvYcCVZkFwoxSp/llOSekIdZEb80ZrbHb0cRLJGkFqbTiHBiWNi8ng8h2fp3J8vCcYfAcraerbtcgKgd+hun5U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOPA5tA3sCKMeFwbM4OBbAqWmS7XnjmajwbNWxCoIKtxoanmYn
	43g8GCRaX1PTS+9ugG2Yzz5zQhv4skzBeLssW6zGMCDhbXD8riE8+UIyVUHbtjs=
X-Gm-Gg: ASbGnctWoqk+ODW+DqPCDrGE8ed+xoRkzJ3AbOpc7S64Q3lLY+0G1CIOJf26nUTyk5f
	r8A6nN+rGyL3ZnQmXfsLfaFwWd8AhjUWFZqSBLtNZKbDOVUeK+ijMQRxN+BVMJdtxtIOa8gxuko
	Vd1rsqhOtPJqfwK3JcN7B02g3JyPwjq/rI6Effvw+2HnrQVuvvefXSbpSYjvmLG8Dm9fM06yfb+
	zfp1Udo/j+/ggp28u/JrtAQPwNRCSR5QXr7qU34E83ovE28ryiUetkMdGVxJd/EnO//27UweZXW
	3BvBOshK1K2YLVk4i7jfbNLw5cBxvP3WqKhbENnsRDSVNYtfNYjkcZljapjQJYGac2jcDtJb1Bc
	16Jer3DWCrANmswwYVeNSOVMbewAQ2RjXtA==
X-Google-Smtp-Source: AGHT+IEZcbbkp6FMant09E2KObVJvCKVBbin+tpe470FPzBoJeASmhbh4JQZP0IGWuOjBWsuWH+nzQ==
X-Received: by 2002:a05:620a:44c2:b0:7be:73f6:9e86 with SMTP id af79cd13be357-7c762a3f294mr49012785a.20.1743521774336;
        Tue, 01 Apr 2025 08:36:14 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5f7684ff6sm668661585a.33.2025.04.01.08.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 08:36:13 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tzdev-00000001M65-1n6W;
	Tue, 01 Apr 2025 12:36:13 -0300
Date: Tue, 1 Apr 2025 12:36:13 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Patrisious Haddad <phaddad@nvidia.com>
Cc: Mark Bloch <mbloch@nvidia.com>, Arnd Bergmann <arnd@kernel.org>,
	Leon Romanovsky <leon@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Tariq Toukan <tariqt@nvidia.com>, Jakub Kicinski <kuba@kernel.org>,
	Moshe Shemesh <moshe@nvidia.com>, linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RDMA/mlx5: hide unused code
Message-ID: <20250401153613.GH186258@ziepe.ca>
References: <20250328131022.452068-1-arnd@kernel.org>
 <20250328131513.GB20836@ziepe.ca>
 <a754f37e-d9ea-4fba-820e-cc56204d954f@nvidia.com>
 <84bf60b7-2d7e-4549-8e81-bc35efeef069@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84bf60b7-2d7e-4549-8e81-bc35efeef069@nvidia.com>

On Tue, Apr 01, 2025 at 06:20:09PM +0300, Patrisious Haddad wrote:

> > > #ifdefing away half the file seems ugly.
> agreed, which is why I think mark bloch suggestion makes more sense, do you
> think it is okay ? or you think there is issues with it ?

I think you should split the file so we get the proper level of code
elimination.

But Mark's is small and sane enough to fix the build problems.

Jason
