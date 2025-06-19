Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFB921B199
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 02:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750301506; cv=none; b=lvNuykmO3+s6MGp1Czsp8xkY8+W6aL6C/cdJJk1hECmRRiSi/V+Tj6ADOMCas5TEGMDI0ZbmtdsBF62d/5dsPZlNtu7uDjd1If2sjP2Ba1ivB0IgWJ2OnMuClI7CoPwFTAKbXh5T1OjIJvA7fuT2yLB0ddkjV02/LBorHV23gxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750301506; c=relaxed/simple;
	bh=qvcnjQ+PsLVyZlnagd7L2hmtb5NKeyi4bcowbj1uSr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XxO8g50N979B4XuLaJwc43tUxQvbwyhvO/BpNhhYVE4fGqBvNJ6mC9l0tkC/bsgWG1sMP4wVCNzfYcgWAOaitTl2ZgDS4S6uBgMZddmgvmNTebUCxrfz20OVAVeoGOqTAJM57RR0xru4jpSpOOxilJ6wW7OQGh5fNS+KgfvfU6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FBTkXp/x; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FBTkXp/x"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2363e973db1so2072095ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 19:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750301504; x=1750906304; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7luqjWXmKm6yGrwAC00VgJVZYDbCcThLXju7FcsbCbY=;
        b=FBTkXp/xKgT4e75go+uyF6RGALpKo6bvq3plNHlipN9mwIlp5x/nw0W96j+uH6oLVY
         AnXDNbV5G2ulrJPwCAeuulqhXhkD8Lju8N0nsrflyJd7Z6j22lK+WTlLBERlnuV44bGa
         7rrRraBTTg9Y1xhG23joexpJB/94j2FXXKvyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750301504; x=1750906304;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7luqjWXmKm6yGrwAC00VgJVZYDbCcThLXju7FcsbCbY=;
        b=NgfdoKg0XIRAnpUf/fXNDUJ6qatHizEkuldi7LfGo+P/1C/WUhlFcbuYxsG7dviZYt
         0tDMIbFqU6Lk2nAlrG4j2gR6irlhNLeQgJGQuPM1F6iZcIFbio0gbpl/SuI/EzR1YiK9
         Fyt/LQipJjxHzsOCs5dNfRSvk0S11hi2DhRrRCJvdQFggV1q+Zll7ufsTjWEY8hTkCts
         ZKzkECBy8VmmkOh+2D1OrU8DQkSTTEH3O4+dhHbKSed0WirYqiK2o3m+JoWMYLjiArXl
         CaL2S8yHESAN3b3F2GQ0Fo2xSV4/90dt3KMaDGVQEaqr1h9LoDLk8mHPhaSg6cm3E6Jy
         +wQg==
X-Forwarded-Encrypted: i=1; AJvYcCV6JQU4U3dBbb9EHmXMd8/a1crQhxDgCrHsuJW+CuNyFG9W3yev7N1/W9l5SHkDbJfN2QECqXx5FsOPmHA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq7ZFJ7AMc53acOir8O87JdRVKUInOLBkgN+6wZj2K0bSo1wr4
	gG1PtgfBVk9WG3LqSUuAT2/Qg+zDCpAWWIGwrLm62gwWSG2Hrlfdz0lJcbXyvMbKqw==
X-Gm-Gg: ASbGncuXk7X9BoL0JP0FV2m/9aMBFYoSZ8YXIFlRuiaWfRwYyH/nBdPtTFTlRwTI2bn
	1/kMmCd5RlbFgdn/dwpsl6QGYf+dXf2d35zwb9ezxUjxFzNoFEZsNI2OmngQSi7+W+7QP7fE/1R
	w1qyDWZRN5dcrxmbccHcaZw3Rt8j/n4P8ynYOnsD9IYWga926j1WMoAK9uQExaZxOrxyXSxQtro
	Yz482vxXBe1RcySIL8I0BH80FrLYHRc35k2YvSPLwWYCP0gjD0YY6yk4korxzlEzs7Rrqn+S9Gz
	6YbSfPtSelIIKE+KyhbQBgitF7Sn4SvXy80A5sIXxxoce/axnBduSUjuPdZ+Ebvo+JfTCwdjCdm
	f
X-Google-Smtp-Source: AGHT+IFbHqtRYblyKHnCUtjgxnbRWDa5q4RtTfoWxbt7Wol5AkAW2zsNXJDuDuPYnhNGYHTrb9+cAw==
X-Received: by 2002:a17:902:ce89:b0:235:f059:17de with SMTP id d9443c01a7336-237cbf8d549mr27843375ad.15.1750301504470;
        Wed, 18 Jun 2025 19:51:44 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:7cb6:ce70:9b77:ed3b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365e0d22absm109007455ad.255.2025.06.18.19.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 19:51:44 -0700 (PDT)
Date: Thu, 19 Jun 2025 11:51:38 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Tomasz Figa <tfiga@chromium.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCHv2 2/2] fuse: use freezable wait in fuse_get_req()
Message-ID: <aofjrqztimch5235rl2hy5y4u7imtqyqihexpejse7uilesrb5@w262yuqijncl>
References: <20250610045321.4030262-1-senozhatsky@chromium.org>
 <20250610045321.4030262-2-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610045321.4030262-2-senozhatsky@chromium.org>

On (25/06/10 13:52), Sergey Senozhatsky wrote:
> Use freezable wait in fuse_get_req() so that it won't block
> the system from entering suspend:
> 
>  Freezing user space processes failed after 20.009 seconds
>  Call trace:
>   __switch_to+0xcc/0x168
>   schedule+0x57c/0x1138
>   fuse_get_req+0xd0/0x2b0
>   fuse_simple_request+0x120/0x620
>   fuse_getxattr+0xe4/0x158
>   fuse_xattr_get+0x2c/0x48
>   __vfs_getxattr+0x160/0x1d8
>   get_vfs_caps_from_disk+0x74/0x1a8
>   __audit_inode+0x244/0x4d8
>   user_path_at_empty+0x2e0/0x390
>   __arm64_sys_faccessat+0xdc/0x260
> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>

Miklos, are you fine with this?
