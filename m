Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CA41FECAD
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 08:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745482628; cv=none; b=qNH1bX/447aa43Pc4Rt81ZiNE9y6ontZMcsdbEcKJnSIjtQI9zv0gTiRWpWdt8/6prvJhuewS5ZFmbPlVqa1rrpL6enaDRqjrDr6Td9X+5rtl0nEI0XTqtBcfOdX2n1p9VA1MFUJJO04fH0daddlOvccc4KuwUNZnMJCPbiRH4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745482628; c=relaxed/simple;
	bh=tCBB8K25JGhM+mn5jGtTjV/244O0BJiptRpGApfmNSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Huaq9AEbaOl+Tt8+6yRnTFcGB0UfsRD5t+DoMzSoQb3AhHFkEr1EYV4/jykWS0jvuL5sm1givWggZqzI1QoyIP4Ig49FQAv5wLoZ2TnOByG68e3nWxYxgtcLlKCPHESkYZaaNadYoZldg2ChdbNf5sWB4ONgnjglgnQMVgTdBA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nIOF6gnD; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nIOF6gnD"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso4277485e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 01:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745482625; x=1746087425; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YRbOCKrrFBIZ3jZyyG05RqF1SR0lNefT8YMVIkBkgS4=;
        b=nIOF6gnDK9Wdt3fBztbsQsvNWrqr/RVqX9MYGgT9E7kHsVLWV8zoF8nIkzN05vVrHW
         Bmgnh8wbHghCsvBt+VVvX49Uw4zfqRDktIvUYpsdxMkgacuHNB0MKpjWW0r3O/2KFEMo
         jGxYFaTeZyi/VTOKfp2SLv289XLURMS1mAVqR9MIYmCnbCjpU8+2V4+/CpWWy67qg/L7
         ZZnTo39wx249BuJ6MywsEc7QQ8TRpCQztnQjXbw5PmYSUwV3CekOWr++ygS7jDOj17GI
         mTSUgd2/d4oNI4SEOvr+spDz49yMJQBkjwQxDIGFnX9f4hNHrD7gb/woX/fcPNw7t9iE
         ew9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745482625; x=1746087425;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YRbOCKrrFBIZ3jZyyG05RqF1SR0lNefT8YMVIkBkgS4=;
        b=YKzughlulBD47VlAnH/tOuMpXkNHGeV734BJ2tbXs0ehq8HHx6v9rTZLtVKgTDxu9C
         UpCvSmjyk2G64Y7nAxJxqD8fkRC5EpBkeiQX1J7DT71y3SUNGY+AnuTKdQnp8MIgjaob
         kbrnIrQEceqhY/rYnGFcDXkYt9GEZiXEhxYuVYD0KV6t6B6JpSWEpw9c4JtSQA6kQNY3
         biiBQikP3nirfdfpqbyNejifVtvVik79VMxm3g4ockVAhHyksMayyuXjVxo6MFux6kWR
         dgP1ixJZKvpg0p8z/ofzwX6JSVWwFlxX1fQFOwiqCvVfue/W1qCW7EwmFcwwwlqyHIW/
         vITA==
X-Forwarded-Encrypted: i=1; AJvYcCWO2+FCYsTUOO5UUtRUOW/VvG7cV8wLJg70eDNmTSghFMZTnf5DiRpduSXR483tN8ZkRhKCaT5ZRyvHbXw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe4v2PhJXRAI05CI6SST5qoS6JCrJBAdzvtglL89rXLN7wy+zc
	96YnwAv+DLRwagUsRf5Bm3jMRSehtMYtseUU0ZQF+FDjHpxKTYkuqO+RwSGsIkA=
X-Gm-Gg: ASbGnctxtp8wVNo7D/LZHpUNpVWLZc2HYIfw03O0Q23+TxjRQMbyO/Olhi584cZzrc2
	RHN8HbVq6HIL/lRBOeiiNF1hUPB1IGVxE0iqddH+Qc96jcpMk4RoXmlw/e5ecJ4vX562yqfYcu1
	MwAgp/vrstdkKvNIPW+iremGBnSTRbJ78XJFKEFkSzirfZluxPC5QamFbsT0Fh48LJRJcW4oUAk
	BO1QVnpRCSdYITmMgEoKPNbguV0n9VPdFedWMO9mqCbR7qSnjfTY7/8AQc4GXd9mHvxo85DYgJq
	UX8K2qzzFyy+gN3MGxVLwVu3c2lIJsHWFMEWHeKUorfY3Q==
X-Google-Smtp-Source: AGHT+IH+vG5N7xRDRcvZ7d+c45ak+CN7lqXE3ITFqjAXGYQ64HfliwlpPSE551o3YtBO58tWWSiR+A==
X-Received: by 2002:a05:600c:1c8e:b0:434:fa55:eb56 with SMTP id 5b1f17b1804b1-4409bd075b8mr12522345e9.7.1745482625231;
        Thu, 24 Apr 2025 01:17:05 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4409d29bf7csm11107535e9.4.2025.04.24.01.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:17:04 -0700 (PDT)
Date: Thu, 24 Apr 2025 11:17:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: cve@kernel.org, linux-kernel@vger.kernel.org,
	linux-cve-announce@vger.kernel.org,
	Simon Horman <simon.horman@corigine.com>,
	Dan Carpenter <error27@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: CVE-2024-49995: tipc: guard against string buffer overrun
Message-ID: <1cc70ad0-4fa7-422f-ade4-b19a19ce3b61@stanley.mountain>
References: <2024102138-CVE-2024-49995-ec59@gregkh>
 <1eb55d16-071a-4e86-9038-31c9bb3f23ed@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1eb55d16-071a-4e86-9038-31c9bb3f23ed@oracle.com>

On Thu, Apr 24, 2025 at 11:41:01AM +0530, Harshit Mogalapalli wrote:
> Hi,
> 
> On 21/10/24 23:33, Greg Kroah-Hartman wrote:
> > Description
> > ===========
> > 
> > In the Linux kernel, the following vulnerability has been resolved:
> > 
> > tipc: guard against string buffer overrun
> > 
> > Smatch reports that copying media_name and if_name to name_parts may
> > overwrite the destination.
> > 
> >   .../bearer.c:166 bearer_name_validate() error: strcpy() 'media_name' too large for 'name_parts->media_name' (32 vs 16)
> >   .../bearer.c:167 bearer_name_validate() error: strcpy() 'if_name' too large for 'name_parts->if_name' (1010102 vs 16)
> > 
> > This does seem to be the case so guard against this possibility by using
> > strscpy() and failing if truncation occurs.
> > 
> > Introduced by commit b97bf3fd8f6a ("[TIPC] Initial merge")
> > 
> > Compile tested only.
> > 
> > The Linux kernel CVE team has assigned CVE-2024-49995 to this issue.
> > 
> > 
> 
> Looking at the fix commit with more lines around the fix:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6555a2a9212be6983d2319d65276484f7c5f431a&context=30
> 
> 
>  	/* validate component parts of bearer name */
>  	if ((media_len <= 1) || (media_len > TIPC_MAX_MEDIA_NAME) ||
>  	    (if_len <= 1) || (if_len > TIPC_MAX_IF_NAME))
>  		return 0;
> 
>  	/* return bearer name components, if necessary */
>  	if (name_parts) {
> -		strcpy(name_parts->media_name, media_name);
> -		strcpy(name_parts->if_name, if_name);
> +		if (strscpy(name_parts->media_name, media_name,
> +			    TIPC_MAX_MEDIA_NAME) < 0)
> +			return 0;
> +		if (strscpy(name_parts->if_name, if_name,
> +			    TIPC_MAX_IF_NAME) < 0)
> +			return 0;
>  	}
>  	return 1;
> 
> 
> 
> both media_len and if_len have validation checks above the if(name_parts)
> check. So I think this patch just silences the static checker warnings.
> 
> Simon/Dan , could you please help confirming that ?

Correct.  The "validate component parts of bearer name" checks are
sufficient.  This will not affect runtime.

regards,
dan carpenter

