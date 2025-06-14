Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF0D2E11C2
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 08:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749888390; cv=none; b=jG8Am9G1H8r/lNUr0uftMbHqUdvmcxUah++fe3jjp4rBmP2qFd+rbkwW6/+tpFJtZsi0mDi+B6pbRUCGWn2PnLm95JgOO7j8hqMiAqha9zsrCixCA6qW5NdLJ4U9ba5X8dDjKJ47KE8Ti61i7EoZ7gWF6US5n9Td/MoS1ILhIMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749888390; c=relaxed/simple;
	bh=90cR8VyQe0A+MrWdIqxdG88p83TgA3ywSv4iQMhlbts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vydyn6j1Z5NHzqUrQ3mx5oyBPhixNmfe/vs1MV4ste98YP7YoncQKRxWmCa2xbFkf7gj8Uf1Cb54yItJ6pg66EDHJ7L5dMq+Wzh/dUvTjVAkqMDjRya+tSOM1XfYbh6HEImRizQc2RwRMKBWhVzYqHSTYJTbWaHbYTk+JjiTO6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gI5sGecV; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gI5sGecV"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-748435ce7cdso2590605b3a.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 01:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749888388; x=1750493188; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=90cR8VyQe0A+MrWdIqxdG88p83TgA3ywSv4iQMhlbts=;
        b=gI5sGecVF4fhyPFI3+3Mq7PPqkXjCbtePgIIoAki/+KXL6fRVLKaKTkTBobXGWtSyH
         ujuZPrkEscxtI23wXuN5BBIopMM+oAbZmWhH/3/dOfp1RYhaXpepWWNy+r9qPnKrj74c
         6/6/ERI0ypavGjMVBhtA0rCNmIRD9UzV8bUzxBgBjG2Ypw+OvOmwldvzGCHt94N7C5Qx
         3W1xMsS7jVBRZzylxTEkqMmOD23O5658mAFwhog1NtnxQ5InWkTN27Feb9rzDPdwzHyP
         YX4SvbzuYwoaUUc2LXbCfATaxbcN3+4NCesJYdp81hYn1UCqL1y0aAScD1/HvVFIc5CS
         a3eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749888388; x=1750493188;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=90cR8VyQe0A+MrWdIqxdG88p83TgA3ywSv4iQMhlbts=;
        b=te87Z8VKZbayHp03whwTsjWAZ5T8ec5vcLSni5t+t2V72fvdLncenF3em2PfPECBXD
         eWWD9E2TsXvs1p+OxcwiOsoezErPj02nGDoQhhJCfDU7gU96eWnZR5MyrBxNeM6m8b+0
         w5UFIsTRLp3zt0dW3zaAnYZUs4AkdZlwX9uhCCwR90n5NiNHOJwMDPywB09o0GcH7P0l
         O8hTem4jM5segA6j4Li5GR5308w0LN350wjx752YAfT5ZvCZ3/+67ZEk5ZbiWuOws7Ki
         fgytCRK6toypc0HBR1ya+x6RSxuwxtJo6QLITKuIUbcfSdV6h7sLkAPJmduUttK7eFvc
         6wxQ==
X-Gm-Message-State: AOJu0YxLsXhtGgyG79TQ7e+CII8IYijBI/kBYFPVb15LFWURw2XxPs4V
	FQHqkP02dQkA/LF1O/LrQXnHMHcgTqPwJUcVB31KAYiaX6CkqpYhhZ3h1Sj5Fs3iqcI=
X-Gm-Gg: ASbGncv1FS1d+q59kaqVDiA8YcWBG8nWkIAZPfU2X5G1+8rfHKPCNDRxeMLHpJldMXQ
	rjtPElZWDxyLuE4udL0j9b5dvrepEEClQYjrq92Jz/KHYG2mIeePL4ENh+oTKa1CJnEPkdRyiSA
	1fj7uX3XzTC4FGrp2t4a08LifnTKGNDOGoRUxPtY1PVhmYLPPZG1Kom19nb8PyuS5wERPXYtzL+
	K6kNGm6uj3YJUXrvHe8+ZXi64k0wwwI1bJNoCMKkMYnYg6F8gQUfHPDjoo5lC3rd1xBtoF2H1VY
	TQG8k8dMqDKR0JlAS8rnKn4n/7N6c0Yt9u1BsfT1kccTGu5G+oC37+sgAqlMr6GRply1pwDN3Ue
	DVZ7SPWb0U87i9SqlqlcIaxY=
X-Google-Smtp-Source: AGHT+IFCRqmndlgOrjzcbrBTAm5j9frGkt27lYmdedTB/NH7C2lKogRebv5hJ0hbfO+/Cv5FAM2v9A==
X-Received: by 2002:a05:6a00:ac9:b0:748:2d1d:f7b7 with SMTP id d2e1a72fcca58-7489cffa98cmr3257697b3a.21.1749888387687;
        Sat, 14 Jun 2025 01:06:27 -0700 (PDT)
Received: from eric-acer (36-225-71-230.dynamic-ip.hinet.net. [36.225.71.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900074cbsm2953093b3a.69.2025.06.14.01.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 01:06:27 -0700 (PDT)
Date: Sat, 14 Jun 2025 16:06:24 +0800
From: Cheng-Yang Chou <yphbchou0911@gmail.com>
To: Tejun Heo <tj@kernel.org>
Cc: linux-kernel@vger.kernel.org, void@manifault.com, arighi@nvidia.com,
	changwoo@igalia.com, jserv@ccns.ncku.edu.tw
Subject: Re: [PATCH 0/4] sched_ext: Standardize preprocessor comment markers
Message-ID: <aE0tgL8tyveRBA7p@eric-acer>
References: <20250611135404.13851-1-yphbchou0911@gmail.com>
 <aEzFXql93thUWWR3@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEzFXql93thUWWR3@slm.duckdns.org>

On Fri, Jun 13, 2025 at 02:42:06PM -1000, Tejun Heo wrote:
> Applied with subject line update. Patch 3 left a stray #else block causing a
> build failure. Will post the updated patch as a reply to the patch. For this
> sort of changes, please at least do build testing.

Thanks for pointing that out and for fixing it.

-chengyang
