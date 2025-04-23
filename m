Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A9B28468E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 16:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745426037; cv=none; b=s1hhhbCL7Eyt5Ffg919hn5bk53OMq8JVtO/YjHhpf8pWvJt1ydw+YHcvaCZBK//7gH9kbhxi9qhDjePXfWjWRaphpK3bqltDqjgwnUHqiTROSKYR7ySmhpYpL6xr3sB8Giv0TAZQ2uXB7GRMrDCXBk1xTQZJra9XcTGhwka1AaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745426037; c=relaxed/simple;
	bh=gLkrQieopHW+FJ7kdxKuJoCxNzN9q1pf7XZqJP/rXJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EqRnDBeYXrDTSXM8RslWDoPVv+i+c3zBnDHPUcALOOdHxJBkjOOwdrfJsWpd93KwMQZ3324YlM0U27KHBO13qAwQ7Z7xIhG1YuFfdUMvP1KJ2Nd7+dFJj0SqPS1WoJfqzZmMuTdHmZFFmnzc0wJ/To3W8zvgPTR5vElNeygAHXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Q8Y4OnPV; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Q8Y4OnPV"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c9376c4dbaso9429785a.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 09:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1745426033; x=1746030833; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bCNtGsQ5GiTaIBuJArPjLavQ92rjl64A1xom0cF912I=;
        b=Q8Y4OnPVmQzjpEF1Wfu2y72HlfSp8TpnmhHxWrLTRVWpfuUdlcAK0O1vuiZMxrLjkg
         4I/iX/pNpYQuU9Y0UxbEnIT+bDpEOQVvxd3seS7JjKzrsjMbrrhpRam4Wic3wgyUOGik
         mk+T+4OjRoPFUrSeK7xErD8qVuTqZwFRcs13vcRL3J9hU0wbIvUHpGbxJbLcmb1ZY9Ss
         43hG2ssunwGao8LN70up8rRK5KC2FAVPWELeFF1E6rDph9FIzeV+BTOXjNwXl4rLOk6D
         l99Rw6XNT35qVAhaA9JZidbg/uN97nspYhhZExklyDeVoEVoUsRc/kO76TP419adZc5+
         13gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745426033; x=1746030833;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bCNtGsQ5GiTaIBuJArPjLavQ92rjl64A1xom0cF912I=;
        b=iPTpayPzE59bOMwiDbm54tJ02/DQgn+Ja4F8tcTtEcpls7+hASzAy2yi3AeJ0hdTjI
         cXVArmZhO2IV+vseJwTlireqnW5rNpWQobxVdBi7gq9XlV9XnOauXnT8HaQj1RpYqjsO
         ZGVV0jVRtVzIO6B2OdGYQ6g0gZo3fCSXMv2hrlQKdKjyuP8z6f6Zl6um7wJRATCzWJVV
         9LM8xE61vDjPUa+l8b0Vd3xpWhQ1wJL5Czl7e0Tn30VxUSwG+S9d5gCvr56n+2bd8K+t
         jlC6DCUnDYYoxnndGJVCrXxV8RsIh+7Roe0MG/zqmgoMYSFispggfnaMudJYMtWXspYR
         uqfw==
X-Forwarded-Encrypted: i=1; AJvYcCXBXNDr5zJLJcBfv+ayaDLexXZnhouXDisQT45707YjphwYUaCMUjrDJPuRnV9hgJks+bG5i64ykL40Z1w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyraqCkd1z1W4Cbsq5QHpf6hNCTN981x2BlNLEHukoYnR24yHqC
	5thjnKZmSWkzymOo42uv/rFuyWZoS7y7iGm/QpztLiytgTv2zCGTRrY/Fo9hQwM=
X-Gm-Gg: ASbGncvRrm8xT6M0qELCRyjMvha/iDlJm/ADfH5KMXCQbKbX/3uk+tdj8HBynGkrhKh
	blyC+Eq78C4iIkJMwxFLEGmJHQfjzQaYzND7vnzi2pWXELyae10YVv/9Z+8tw/XEHExzs038rax
	yU1HhrwU1AeCkoG6AW8xq86Gvoa60xjf3UtIqkgZgI58nfGffiER2syEbWbmvFUYrZMAZ70BVjc
	fhiRRdk1tOKFaDJSxXADUYgxP1PlGPVaeLACxx/i9C439CbmqEw3DaujzP6G80hY582J5mWQadl
	PRNMxHZMW3R9kQ7dGiNAg2lrnXEd85+HoczGs7Yf7H0oPmwxt3EmAraSPpEJV1fov4rAtEi6Aij
	q3Jr4bbDZi/HCYnBAIIrJXbGmS0SJgSYiaA==
X-Google-Smtp-Source: AGHT+IEXXa/SP1vcBYCngnvdcxcDUG3M7rtCWaP8VHBCa5k1RUmFf/E+UnlXZTp1S7EeoNVsSxUnVw==
X-Received: by 2002:a05:620a:d86:b0:7c7:a536:66d1 with SMTP id af79cd13be357-7c94d813726mr525145285a.6.1745426032758;
        Wed, 23 Apr 2025 09:33:52 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925b6e10dsm697314785a.108.2025.04.23.09.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 09:33:52 -0700 (PDT)
Date: Wed, 23 Apr 2025 12:33:50 -0400
From: Gregory Price <gourry@gourry.net>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Rakie Kim <rakie.kim@sk.com>, Andrew Morton <akpm@linux-foundation.org>,
	Honggyu Kim <honggyu.kim@sk.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] mm/mempolicy: Fix error code in sysfs_wi_node_add()
Message-ID: <aAkWbsmFW2dbRwhk@gourry-fedora-PF4VCD3F>
References: <aAij2oUCP1zmcoPv@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAij2oUCP1zmcoPv@stanley.mountain>

On Wed, Apr 23, 2025 at 11:24:58AM +0300, Dan Carpenter wrote:
> Return -EEXIST if the node already exists.  Don't return success.
> 
> Fixes: 1bf270ac1b0a ("mm/mempolicy: support memory hotplug in weighted interleave")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> Potentially returning success was intentional?  This is from static
> analysis and I can't be totally sure.

I think this was intentional to allow hotplug callbacks to continue
executing.  I will let the SK folks who wrote the patch confirm/deny.

If it is intentional, then we need to add a comment here to explain.

~Gregory

> 
>  mm/mempolicy.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> index f43951668c41..0538a994440a 100644
> --- a/mm/mempolicy.c
> +++ b/mm/mempolicy.c
> @@ -3539,7 +3539,7 @@ static const struct kobj_type wi_ktype = {
>  
>  static int sysfs_wi_node_add(int nid)
>  {
> -	int ret = 0;
> +	int ret;
>  	char *name;
>  	struct iw_node_attr *new_attr;
>  
> @@ -3569,6 +3569,7 @@ static int sysfs_wi_node_add(int nid)
>  	if (wi_group->nattrs[nid]) {
>  		mutex_unlock(&wi_group->kobj_lock);
>  		pr_info("node%d already exists\n", nid);
> +		ret = -EEXIST;
>  		goto out;
>  	}
>  
> -- 
> 2.47.2
> 
