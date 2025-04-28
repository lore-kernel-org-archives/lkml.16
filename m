Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2625A2973C6
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 19:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745869308; cv=none; b=uOBNQ0MiYBsfKhzPaffQUJBrVmHO4WiDSSVeiLUkMKHY79KK4juV2uyAUKGE/L9Jc8UkA2pZyVMQNPbdqYzwzQo3dRgJGoGNPUjS5QYbfyuunWPgZGep2n37NUPGKs24DFjbdlz2M89ri0U7O0LKP0q6YlQcnjjUXEOMiuAooA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745869308; c=relaxed/simple;
	bh=JeckHEUn56lxhx/JeZk3X5FAY9Hs/2MjpqvnQWPIiOE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oiWl0ia0cooKfMpS9svZF71H8emPuYuUyMf/ur83fjlSg0iQpvQpbui2qqbQ1412+gI1GG7qsTkhV9zfhYKbkPz3BeLULr3ksuzDRwAef+2NZrRjow3cWBDcr+bE0dqoz/5Y1sZuXMCwQfpXj//DL2TM/dM+7VAatHeTTsS0Pec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jrzmA0zh; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jrzmA0zh"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2295d78b45cso75148165ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 12:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745869306; x=1746474106; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=szgTioJsMCpJAf0JkGsBcR042mpB6et0Qv7R7d7oAVM=;
        b=jrzmA0zhiEUVHRtNYUOxDM5MRw6O5kq1H0uIYXNLnOg/X7c4tdn7CBVgEPgwyGQgJJ
         vJIptGfwOFDya4UmYEL8uc4xtpHbEsHk9F/rxBs9+i2W3hWiUvifbd74zEIDkZWxrc2Q
         hVOdUWrVN1ieIQUXpaGj9IH5cLt80RWU7e405YlTF/araLTx8FE4vuishe9ONoPhXWmf
         XxLoHSW7P6sU2lKXnfXTTbk+kzE284FT1W6QNZaDKJ/s6ShMzOAL46+TruNkyg2RFtrd
         3LH3j+fANyeFfMTgSMIdJsRkPQ4ELxLP1bYyUlSOgj+yfLn4bFt7awNVUeqLRncH1kVx
         wlxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745869306; x=1746474106;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=szgTioJsMCpJAf0JkGsBcR042mpB6et0Qv7R7d7oAVM=;
        b=vLYWVmTL5CO4N9o/cgfSC2/xuZ1Rjje/uIDDHhFdr6EsRzHmluJgBHJSFJKyOY8OLo
         NYG8oZI+hUgqg0Mw9qXknTzXbKzpItLwAo38/V6h6TygXTYsefOLhDMCitt56uGxRhPH
         hTYd2LqAwNveF2QKQ3TqErKO3h9VZJUFtKajibD7WcuaASeJKCrhmxnVAR1Bn+wj439W
         omLmAZgRTh1uxA5+q9xz1CR6rZK9QkLD+iMHXwZYjovJZ71slhu7Aa+Dzf++NzGffZGb
         Q2Uo7ztL0eN32Uuz2u4EpPd/UiSKXUUsDYEXkO2qbTnxp18L+hU2WPoRUtqfwMOwNJiI
         RLmw==
X-Forwarded-Encrypted: i=1; AJvYcCUtOeM4pjCSm3fBcbjWcILoBPXfFIKU1BKNwAc9OhflEmfLpGNHp7iLCx6j5h/gASB0TaRi4qZuigNseg8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyik/Vj3Su9iPWYWyvdBl7h28YZZbEPAuZQtbxNx7+PDT9lbNjy
	5hUzHMsq2Pv5Eu3b6i2HdlWYM5oncYoViu7nXhCLB+ce5e1a3Nbv
X-Gm-Gg: ASbGncvI/oYLDRzI5sxmkYKCn5fOUhcqn5G5PGb2fgx7FM1TGwi30hJ/G4gvjC+qV/d
	qqh3UYB5+rKb0uVpb9DeFEpbF6VnxC895z40he0f5z5old6US2F7sjUzhdinrIi+cp6tIWLT6Sm
	4rVKM4HuqE6NEm/kqs9cgP5pdwrIfeBXXd5k3k1HQAM1fYRytKVdl97uIJP3S2eQv8CcRwzms2L
	/hnd4YDPOHja9hRjK1LebJUoIeNm4i3md/qL2dRyvut6JPsejXTpkmkWzjTJL3lv80qwBAB4LBE
	NI5LqF9vU0NAe8GqbJ07OB+kGv2Lt104Mnth
X-Google-Smtp-Source: AGHT+IG/k51DQMoBhv43GE6TRB56HYf3mUYWakyP4YW89QbcTvA7Voqi58AhMczTM7rEO3qRPyKHog==
X-Received: by 2002:a17:902:e5cd:b0:21f:71b4:d2aa with SMTP id d9443c01a7336-22dc69f83d4mr138894495ad.5.1745869306263;
        Mon, 28 Apr 2025 12:41:46 -0700 (PDT)
Received: from debian ([2607:fb90:37e2:c851:8e4d:2d6e:a358:8db0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5216ba5sm87294185ad.222.2025.04.28.12.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 12:41:45 -0700 (PDT)
From: Fan Ni <nifan.cxl@gmail.com>
X-Google-Original-From: Fan Ni <fan.ni@samsung.com>
Date: Mon, 28 Apr 2025 12:41:41 -0700
To: Andrew Morton <akpm@linux-foundation.org>
Cc: nifan.cxl@gmail.com, muchun.song@linux.dev, willy@infradead.org,
	mcgrof@kernel.org, a.manzanares@samsung.com, dave@stgolabs.net,
	david@redhat.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] mm/hugetlb: Let unmap_hugepage_range() and
Message-ID: <aA_Z9R-vffyuwNyV@debian>
References: <20250428171608.21111-3-nifan.cxl@gmail.com>
 <20250428123143.2b644354975c2b89e5ae51c6@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428123143.2b644354975c2b89e5ae51c6@linux-foundation.org>

On Mon, Apr 28, 2025 at 12:31:43PM -0700, Andrew Morton wrote:
> On Mon, 28 Apr 2025 10:11:43 -0700 nifan.cxl@gmail.com wrote:
> 
> > Subject: [PATCH v3 0/4] mm/hugetlb: Let unmap_hugepage_range() and
> 
> What was intended here?

Since I have changes in each patch in this series, I thought it may be
better to have a cover letter to summarize all the changes in one place.

Should I just mention the changes in each patch separately?

Fan

