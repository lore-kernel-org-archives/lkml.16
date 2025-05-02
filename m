Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B13221FB8
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 07:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746169841; cv=none; b=RgjHipi4frUyorlLX90Ij+npXgaD+pwLTLy1KxOsyaOB4Tvhv4EFB+Eaf0rLkOvFGkfn58e2EZ2mri20XWhU/Puq99SD7kOD5Hcd1b0ZD0Q74OOufl0TNWeNdtRfu+/qTS/+luMAeB7TwZ/aV9F6Thcz18ESW7D1GaryVIXfGss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746169841; c=relaxed/simple;
	bh=NOKG86xB+yiOqLT5qbBkeKjZjQudUxm/RQ7ECo4ZOts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=db7kZarapkOfIK5l2FasmgnMLXSKsF3SqjotrOMgeI4Nlk4cb6u1XoC+ZgCELTYId1nSwYLCong1UrZR0RR3JfEQf0PAo3MbEc/Iy4XTHJFCmAcBJJD9BFGsZ/n8a6cfLD2HmEX73lE66pojaUCo5jvhnPRtv0z02ySv/nkEeQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j1CPYNUe; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j1CPYNUe"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43ed8d32a95so14094035e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 00:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746169837; x=1746774637; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U06ss2HdcwirNeiqMijvgDAm/dg/vsq1Q1L1rApoCb0=;
        b=j1CPYNUeaFrevX+Y+5ItBuZOVeknLeLGq4+dJP5cqpfPTlY2Dn+FFqd/fqNhHdyJh3
         nw+0qu4/P9Cp05SgjqSTMoC0QFVgEuaNodVoGZFQtYBeVrbPoZ9DTB/GT6oYzfp0Hp4S
         q3qDqQV6sazxwm+kxTP/rAxaBm+17kpj0Je/tQxKOzKxcIlzAMZWR3wKrODrwcS7lViD
         AjTNMb2r0/zx3wqI10YfEwaFGaTg9wMy7Hrow1LnJXSQA4k5HfI7nJY6Jb0NI6RnRw5i
         RklfuYYIvuKVdtump5NbCJe5ayM+gJ1fbKD4qQwfW9SOLSFHDK/r+S8o+gkBz6rR2B5P
         JZiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746169837; x=1746774637;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U06ss2HdcwirNeiqMijvgDAm/dg/vsq1Q1L1rApoCb0=;
        b=Kh2CFhUSOkC5HzYu/gZDoFIuTa+fzRB9y+nrVTg1oO9Ankwm9ChzozT6vJG6jN2GAc
         bcsROA/TnywAaRT6wvxoN1wKKEI1xxN27VJiD89VY1pnsizrrR31sV783oO2ttanYF6d
         fGRVCH6zpLrJtQQsgMx1C8lqeexV5tHHKRO2O/BhHcPSneIGmmw2nGS81KOzHpXXN+F4
         70eeOSuUMK265P5JIvpaNVDkRX8qv8HXgRMDwCsYp0sbmHW+yneqQAd/VQWNixEJS5j4
         wO0WeCElag5w+5qCQ5Jl2msmODHgJu0BvrF0je6C+PiTmBry5A/teDDMA9P0r4o4AcbF
         It3w==
X-Forwarded-Encrypted: i=1; AJvYcCXuGIPkpFljyRyFSi/mExved2ZDdl1xim8TWgpmuphPznVYkde+Terx7SrgBDMqtBjiAn8MfCTTzlg6i1g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlpA26Y54gjDZY25+OctJYfXiSFisDxzPfhS1ywcyQ+2OCXt5m
	CxtE1DQt6P0JR49Efj16NcHiaBXXOZ4m3NKypA82ajKb1lBABr+U1N4wYXmn5Us=
X-Gm-Gg: ASbGncv2YCgpmMrAkNg2G05lUXtxmUuQ87Bvv5ylggK05T2CoPFJHNI5CocNNQUYo7P
	vXbhXkICjdn0+if52vgblm/bifwQmp4lsJoJ41DybkRYljOXHK3B7KpnFhVYrX8j7vPAdsmKfx3
	YN0xD1M7MTRYEJVAcYMOY3JRQDP+2bVdGScClZ/7wRFnnUck14mK2kQqQYigYBgTeiHcg6rIbnj
	yT/ShNMeVAr418m7XyjlniYLoD0biyzI/6lQDr/4nwQfCq7uu253qwql9nN7AzLD1OoO0hMNfqH
	y/3OTgaXf5vyu9MrCC9sFJgSJkI98+Urj8B31VQnDv7Glg==
X-Google-Smtp-Source: AGHT+IHtNfp9BE0awULIWqLBT0upZss91Y/YU3Wv6VlCY1VbHPu43hU9YAJA4Xe2Y6q9r/3mhLUIjA==
X-Received: by 2002:a05:600c:4710:b0:43c:fa24:8721 with SMTP id 5b1f17b1804b1-441bbeda9d2mr12759135e9.17.1746169837547;
        Fri, 02 May 2025 00:10:37 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a099ae7cc6sm1328988f8f.55.2025.05.02.00.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 00:10:36 -0700 (PDT)
Date: Fri, 2 May 2025 10:10:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Honggyu Kim <honggyu.kim@sk.com>
Cc: Rakie Kim <rakie.kim@sk.com>, kernel_team@skhynix.com,
	Andrew Morton <akpm@linux-foundation.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Gregory Price <gourry@gourry.net>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] mm/mempolicy: Fix error code in sysfs_wi_node_add()
Message-ID: <aBRv6RmQf7vNZQMJ@stanley.mountain>
References: <aAij2oUCP1zmcoPv@stanley.mountain>
 <9837bbe0-d494-43bb-8e92-8cbf47a32b68@sk.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9837bbe0-d494-43bb-8e92-8cbf47a32b68@sk.com>

On Fri, May 02, 2025 at 03:46:21PM +0900, Honggyu Kim wrote:
> Hi Dan,
> 
> On 4/23/2025 5:24 PM, Dan Carpenter wrote:
> > Return -EEXIST if the node already exists.  Don't return success.
> > 
> > Fixes: 1bf270ac1b0a ("mm/mempolicy: support memory hotplug in weighted interleave")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > Potentially returning success was intentional?  This is from static
> > analysis and I can't be totally sure.
> > 
> >   mm/mempolicy.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> > index f43951668c41..0538a994440a 100644
> > --- a/mm/mempolicy.c
> > +++ b/mm/mempolicy.c
> > @@ -3539,7 +3539,7 @@ static const struct kobj_type wi_ktype = {
> >   static int sysfs_wi_node_add(int nid)
> >   {
> > -	int ret = 0;
> > +	int ret;
> >   	char *name;
> >   	struct iw_node_attr *new_attr;
> > @@ -3569,6 +3569,7 @@ static int sysfs_wi_node_add(int nid)
> >   	if (wi_group->nattrs[nid]) {
> >   		mutex_unlock(&wi_group->kobj_lock);
> >   		pr_info("node%d already exists\n", nid);
> > +		ret = -EEXIST;
> 
> Returning -EEXIST here looks good to me, but could you remove the above pr_info
> as well?  I mean the following change is needed.
> 
> -		pr_info("node%d already exists\n", nid)
> +		ret = -EEXIST;
> 
> We don't need the above pr_info here because we delegate a warning message to
> its caller wi_node_notifier().
> 
> This can close another warning report below.
> https://lore.kernel.org/all/202505020458.yLHRAaW9-lkp@intel.com
> 
> If you apply my suggestion then please add
> 
> 	Reviewed-by: Honggyu Kim <honggyu.kim@sk.com>
> 

Rakie Kim was pretty confident that returning 0 was intentional.  Btw,
Smatch considers it intentional if the "ret = 0;" is within 5
lines of the goto.  Or we could add a comment, which wouldn't silence
the warning but it would help people reading the code.

regards,
dan carpenter

