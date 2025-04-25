Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC3526296
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 14:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745591429; cv=none; b=K/OYadCBIbPpWA+eSms7WQRsFGC1FEuNpfNrh3BBLAQfrBSq3Dxezn0fQlyS1Uoi4eu5ijQnoykDBZX26jjq7oHE0aXJnw4J2ltdq80uSnKXaw2zxpnBcVScje58L6yXSOFz4MyCTUUhm9UXRGPEptg1B5TIl1yV/n6xmisc+go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745591429; c=relaxed/simple;
	bh=tbbWX6HQudcj6WllaqRV4e2ZqySM05yb5u5Fj7YkR2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mjjB0HZFcePerk0gURRoGWItMgUB/FIFLhknbZOfx/Mid0LWG+D+7BS1zE8YtJda/pR8Y1bqCRofKhbOt97bLMLKp686DM28NNVdzfIq2s6iFu5iReVUrRWvCc87jbZ9y9bCzs0Na5SVSSIazlW8xaTS+m42wQg9fZ6KvqaNa24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RxOyhFHH; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RxOyhFHH"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-acb615228a4so586892266b.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 07:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745591425; x=1746196225; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j74g0URpy2yWvecE4j67oIUdAbRXvhX28LV7KaTwwlo=;
        b=RxOyhFHHySLNjORdLYc6UfcdIpClx2swY6+xTSzICrPogGFlZH77oUnpHUVsHkx5bL
         pYc4PFtgMZVBHkd52DSN2siVAkFZDv45h9MHwfcJKRewD1THfJZvGDKwogJeeGizRcxX
         QkyKII/kKL27RGC9FhapcZe8LjjeeehrgaUAHCD9OsHIB4LeiriBkYO56dXmgCXf8Y3T
         FyyiS1qoN4pPivLRTXCy2gdxyqfmrNmvLQB7aqP8okQFtYXSLknYDnG3wFltBSh2y867
         nWmRWpA1rPPrIjBUuIAzg7qafd/c/IqZUwKzinqqlu7btCmZ5iWxbKC0AsviMSBis4aF
         Z8/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745591425; x=1746196225;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j74g0URpy2yWvecE4j67oIUdAbRXvhX28LV7KaTwwlo=;
        b=k9hv3B6dKuz/JTGJr9sQqCJlRr0cNILeE/I7B2bopb+CpmPu36zlsvFmTAxFRembIg
         K2wDjpAb+vX4r+ErmCHZtyJC6LOlm/jbG7IloCe9qaeM/V7jAy8jIB26tHFrqGumUcd2
         NVF15yFoC1P0KFgW37FSwawh8WDs7ZYAkfqC8T/B59adzouikAq/VkOiqqO70hcSyDHN
         ep1dwKYdcS2o7uGU3eCRAh3AtMbCNLgn9yUBQU4VSZu2GHoFJFzv1XRP8WhxuAB71N6i
         uzwfxyAi631sUWERVRV5d8588ReU+01N6lDH11w6M1MFU2v0jqpFAKMvqS7WQumEYJq4
         pKrw==
X-Forwarded-Encrypted: i=1; AJvYcCUcdSjYbjvuxPkOb3UqbnTeJBILPly8Zx/xE6DKOIx8gV1Y0cOI3yjeOTik3kgYtoOtK7z/lgTIUg3HDy4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyV/GqZzOiaiAtiXXSqWTh/ogrpE3cFJ+7DNffaEdHjY2tVA5hr
	cJq6BXGSn2Ef7m/cGRVjGwUEBGPAH5dMS9LY9efgRmk70HgP+BmVY7Ylt4QDj7k=
X-Gm-Gg: ASbGnctSUEH3x0eb9t67CyWYYpCqFF6R59819TSVn+a2Ez4Bymmv0LZl3bgJeO2Bj4m
	AQsJXUvuCkW4PAiyiB0LYIHyo6pwoCVUE/ymuFvU73cJN3Lv3pckY/1vkVsdxGtFYObbS3AKrsR
	cHErRDSm+2GKZKNiDeiIkOW9zEnQWGkJxkjeK2yNimcNQ0QF+qyHCilPKOzkSO7sGKyK46gP7Ay
	Ox0s/gF2TYCyFVrEWlex/C8gHVzr5liNXvbvq6oFcclHFoC2NPP8eOy/5RH6xGJspyBksXc45ze
	djPBTw7ircXMoCpgtrPO5sHUJmlgM1V3qd1uRlX9nO2Zqbuj6GIABA==
X-Google-Smtp-Source: AGHT+IGDm9pL00HKU1hLSaiCp/68Y35OaNOhMktC6eooWXoNrwjpnl1XGdDL2ZIbCvWzDzDf7s8gLw==
X-Received: by 2002:a17:907:1c98:b0:aca:aeb4:938e with SMTP id a640c23a62f3a-ace733d15ebmr228127466b.8.1745591422471;
        Fri, 25 Apr 2025 07:30:22 -0700 (PDT)
Received: from localhost (109-81-85-148.rct.o2.cz. [109.81.85.148])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ace6ecfa375sm143163866b.121.2025.04.25.07.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 07:30:22 -0700 (PDT)
Date: Fri, 25 Apr 2025 16:30:21 +0200
From: Michal Hocko <mhocko@suse.com>
To: xu xin <xu.xin.sc@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>, xu.xin16@zte.com.cn,
	david@redhat.com, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	wang.yaxin@zte.com.cn, yang.yang29@zte.com.cn
Subject: Re: [PATCH RESEND 1/6] memcontrol: rename mem_cgroup_scan_tasks()
Message-ID: <aAucfUFeqHBaHfKs@tiehlicka>
References: <20250422191407770210-193JBD0Fgeu5zqE2K@zte.com.cn>
 <20250422111919.3231273-1-xu.xin16@zte.com.cn>
 <20250422162952.19be32aa8cead5854a7699a8@linux-foundation.org>
 <aAjbb1fBR-tq1h93@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAjbb1fBR-tq1h93@casper.infradead.org>

On Wed 23-04-25 13:22:07, Matthew Wilcox wrote:
> On Tue, Apr 22, 2025 at 04:29:52PM -0700, Andrew Morton wrote:
> > Patchset looks nice to me, thanks.  I'll await reviewer feedback before
> > proceeding.
> 
> I thought we had a policy against adding new features to memcg-v1?
> Certainly adding the feature to memcg-v2 would be a requirement before
> it could be added to v1.

Completely agreed! Is there any reason why v2 was not the first choice?
-- 
Michal Hocko
SUSE Labs
