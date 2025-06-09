Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4F4220F43
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 22:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749507187; cv=none; b=FmE7oQMvRL+bw7MR8hoU9C7o6IjAegcoYOO0lUHgtZINBsKX4CrnkFYkcMMBdKKpWaJu9QFml7nxOtDu7m8kxyU0PCQ8d2bVgrV/Jap0JCAw6yEyqcG/Yitlgf740ld39b1XMFXv4whB+L/7sGvkIMoDBsC7RNo+l1QUtPSQJe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749507187; c=relaxed/simple;
	bh=VXXxkbnNgdRRyoozij7mqZ/QWwrqGWmsrl4NthqT96M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f7vi0cXbuLSYAMp+RID3i3oWKTs7/IRrdDO4mapJ+ox6kqtYyLvNZyJzjKhaAL0t7+7DMb51VjK8PV10xyUWz/gszmapPASiMWAmjrWySr2PzlLZIXRZZPZZERu9Awb6Cr/ayK+qJ6FZMHR4Q9uZSmA1pc2wZTnXcPWzZ2YxuCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B+N/RyZ5; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B+N/RyZ5"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2348ac8e0b4so18565ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 15:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749507185; x=1750111985; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UHg0wNvqKT3APd6+AuwNT/baU0QPXa/i9UgHGbxzSbA=;
        b=B+N/RyZ5Uq0Bm+1r4hREmkjP+m4g4+jfaHOxpK2CpaOqosMbEdZOfplcSqc77dRQJ2
         6BEUTvLjCywjgEyrS/jdnV2j468V1lbuausXi92vMf6Sho83l00/tQOr+mSPNM+5O0GI
         biT5shlxSB8jD0ef7BgOajCtn3h7Qqt97oIyQ8AKfaCohilL6yzkOIEjoym7vzASKjWZ
         OMegc3WvcbBGhP/nQrgXxU5jih1dclMoIILMjR8f85gYWqsPkTmAG5eZBbYcL0gz5OEy
         7VKK2Cq+CBn0BQ+2vYUDQSYaxM1X58jxe/Xju/9rErCeUzyx9XemTF6oP+Bv7lsFhByi
         Ttbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749507185; x=1750111985;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UHg0wNvqKT3APd6+AuwNT/baU0QPXa/i9UgHGbxzSbA=;
        b=NYDznHI/sURRSofI3yeskAYV1Y7EsbKBNjlH8Ezy2MsG/nE71/W8vEYGzoV2H/NHnX
         /SZRr5iq7XhS6QXFJ8ltkxXZJhTyFxDaeTuxJBguELJCP/OQ6J7t3YfUB758e4UoA1xl
         8Cur6xAJerQVek70PFlunqlS161rNh1AtaS5Si+D4Gq1ja4e2Z6RvLVcU7cl1Zefd6U/
         GVCCMw1WmQEJFZjFd2vERwEUutAGespe4bFXgOwEmt2gVc9fren/8vCmj38W4PlmLYCW
         hxHlon5lpGuv9nLsvanwYsW2fLro2/ZZAbT8ve4CIu6Hl59pNosTDmxwBqoVjA9roMX6
         Ba4w==
X-Forwarded-Encrypted: i=1; AJvYcCWPIzMWNft0sT0k4PjFI9E3DTiXd3mjMJXbhwgbBnod5lTBDptcpvn1U8rS9d0f93KWP08jnTogtJ3bRtc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfQYz52o9tvG/LmXf4PiV38b5Jy409PmPLPWd+L5TnX+fcWeyT
	BSCD63iY7TWGjfRK5ynSadxDbh8untnz3xR0S3BiofJSyoLqSC0MTCcqtkmVjOKE3Q==
X-Gm-Gg: ASbGncvXamZRUpujDk65+JI6zAsyqWVMLV7VWoG2p2pDePokqUBA6sdYD2S448elY+d
	Gq8rWai5NfexfL/nndWHKBmZlVUXS4cBqTOXCWF1oHOrxfSiZ3JINbVl+TUr4l8HZIHyZQOJ01Y
	mP6MFJpJRUd2DqYyUpLZ1HkeV8mc/OXqDBxA09GL7nzQHGL2cCNIcXBZtUdQIZKmANQi0FeWB+o
	pxaaoELGKoyga2Dfnk6c7SYaNv+4qujryufPR2hSCjwOEDO+n6+7oIF0HSTa9xLbYLiIITk1JNe
	cYLaFh/5OsiytlH2KIZ8zJXPYdnHOocMDPyOhuxI59sCRzXBJH4Nii1/osyCygwImPtW7jnCEV+
	2HOcki6fOgqdizHiiAzHUEr9Lw3dj/6ya4Pp22FOpW7M=
X-Google-Smtp-Source: AGHT+IHD8aijVhr7ZJQC34MbeFp7LpXYs0kbLW0dUhVholO8EmoQewaEViVvVyXoYlTBPFUbCzJrzw==
X-Received: by 2002:a17:902:dac3:b0:223:ff93:322f with SMTP id d9443c01a7336-23611fcc9a7mr6385345ad.2.1749507185045;
        Mon, 09 Jun 2025 15:13:05 -0700 (PDT)
Received: from google.com (187.137.203.35.bc.googleusercontent.com. [35.203.137.187])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0f2ee1sm6391945b3a.175.2025.06.09.15.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 15:13:04 -0700 (PDT)
Date: Mon, 9 Jun 2025 22:13:00 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
	Daniel Gomez <da.gomez@samsung.com>, linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] module: Avoid unnecessary return value
 initialization in move_module()
Message-ID: <20250609221300.GB1439779@google.com>
References: <20250607161823.409691-1-petr.pavlu@suse.com>
 <20250607161823.409691-3-petr.pavlu@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250607161823.409691-3-petr.pavlu@suse.com>

On Sat, Jun 07, 2025 at 06:16:28PM +0200, Petr Pavlu wrote:
> All error conditions in move_module() set the return value by updating the
> ret variable. Therefore, it is not necessary to the initialize the variable
> when declaring it.
> 
> Remove the unnecessary initialization.
> 
> Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
> ---
>  kernel/module/main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/module/main.c b/kernel/module/main.c
> index 322b38c0a782..06511607075c 100644
> --- a/kernel/module/main.c
> +++ b/kernel/module/main.c
> @@ -2615,7 +2615,7 @@ static int move_module(struct module *mod, struct load_info *info)
>  {
>  	int i;
>  	enum mod_mem_type t;
> -	int ret = -ENOMEM;
> +	int ret;
>  	bool codetag_section_found = false;
>  
>  	for_each_mod_mem_type(type) {

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
