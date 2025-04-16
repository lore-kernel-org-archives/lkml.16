Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945982DFA31
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 11:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744801755; cv=none; b=dr+vhr+Wiui830tVGmOyK2c2hiTDLtYNDzalqDFDlK3x5tW6GjocI03DC9qu2lmCkxS8UwyVjaiqhsGs5Wy17NwgPaoYHp5vzJ/i4MPpGMjrlJNWoNNGkSi41IC0FLq6ocy9LBMhqwCpZKVT0Jo4bDJGlBFJ94UcY4TJEOtFTrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744801755; c=relaxed/simple;
	bh=2NNfZxaYCVPH8OmJDA4wDdKw1qepejTj7MXbaNFtNCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RX/Qm3Mk1Ipi9r0VTOM7rhu8bew7RjGjH6D2ywVvpkQ81NjW6RlcK2OECT0LOQL4R2rdoi2RkltflgXtKUkFpy6ZQxiUpO6hJXLmve31Bb8UpsfZQYExdBI96f/bvDBYbQu4Km2rc88R2DQW1AeiKFAnqKg0AQAR25HXqhTqvHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L3LQIOK3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L3LQIOK3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744801752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FvoG0rJ4ZaNqTcODQQWB3PzESs7m7P+r71ByG8VqdYM=;
	b=L3LQIOK3jH/8MTH6SMYR9kS1G5KqG27d7XGl43BjzWVo6xp+JtuIXScg8s5j+MjnSFib56
	JitkihoOP1S1olPhl676pq2M1kI/JZubUfSZpIc5dCaqq7Vtuvoean07iWBQiDbvbaI7JJ
	40UHuYOKr7lo7lH5D1Qd1t41pRvKvzg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-aj4iL5hbNjKlhTRhKrRrog-1; Wed, 16 Apr 2025 07:09:10 -0400
X-MC-Unique: aj4iL5hbNjKlhTRhKrRrog-1
X-Mimecast-MFC-AGG-ID: aj4iL5hbNjKlhTRhKrRrog_1744801749
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d733063cdso53429295e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 04:09:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744801749; x=1745406549;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FvoG0rJ4ZaNqTcODQQWB3PzESs7m7P+r71ByG8VqdYM=;
        b=s1+eScL/FeJI27bn7nAQeTJs9BDtWKiYyAt1yzKgQqwnjCFyxfSZwf0He0r09TwS9Q
         Amy2nGdEQjgyiwfwEruYWZExdbElNG53/b9gNRJrhyb7L5SE1BqNkn8M4gcEMtfFKpuc
         ZNp5pxnTq0uFXd/uhwWFZGbjpdMK5VDhFW/vGzf7b6R/J8EIulMvnCa/0/yLZcHGP39n
         JhsRLDzct+njH7ym9++mvkUwsLU26J4B7vj5cSyRfd0SgI73qrBQ+ZOKcNRhrNcmFu/f
         yw1g07/r/r4zjEEOZgL4waa4CCLUNJN09RhAjBJ7oF5cikn14fvSxLpMCsP4y61avqoe
         sXaw==
X-Forwarded-Encrypted: i=1; AJvYcCUPvCuvXYFoWiCf3VEdw5yRn+qujMu4mWwkbrlc53X34YsEa5FywQV8yzuKD8wThwt8RtpgZPy2RDqWQEo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLr9uuUIp0b53dt5ZJaiDkRgFCoBnbW3gfXI4WRJYKtwx+xmZx
	vppNUtRooiTrxW9qDKw2fZMuCz8khjrwLuGJvbc1tdJLo6KN8uRqtRgKW9JcfkJWKI7D+iIJhtb
	PlbserhSTs80EotvTSYS5eJEvvdlR69cqwgkWx0DHxZJGqItbrFshTEDXKj+URviQLm7pNg==
X-Gm-Gg: ASbGncvzIMu2r0DeCpTy++YhXI+QIVThs8Yls6Yf2GrIjql1w7j5qe5ozbMkN4HtDgV
	V0uXGeJu3IpRGUUoBVaG1NLNIa0tgQWKiEUnSBFqnitijX9ZMfolNgQ74rcxF0AQIZEwrPJ7TVH
	fAovufE06UpdrTN+3EgNbH5Vgsd0ueA9cryhNLOy2HB13op54+fHFhlJYyf1+dSMDmcqGhBwx0z
	QcxkuONLIoQQIl9dJEtG8V0GED/omd0lCZPBqWcZXC6dFsvbLZeIp46OVThdnAcHyExRtNvxxh8
	oZiGVb4Q1wkP/l2h1chKAdltc9gWRfjFEXksHa3aqDIID5IrvOunTeQK9kYdh/pOytcC2YM=
X-Received: by 2002:a05:600c:a418:b0:43d:1824:aadc with SMTP id 5b1f17b1804b1-440601e2fcamr3708755e9.29.1744801749212;
        Wed, 16 Apr 2025 04:09:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGUs3LKsn6pJNsp4U16bAqW+oZK3vljPoxPIhRLorBTR/duEiLDtH5TLFiIZXUSCALv6pv0A==
X-Received: by 2002:a05:600c:a418:b0:43d:1824:aadc with SMTP id 5b1f17b1804b1-440601e2fcamr3708385e9.29.1744801748675;
        Wed, 16 Apr 2025 04:09:08 -0700 (PDT)
Received: from [192.168.1.167] (cpc76484-cwma10-2-0-cust967.7-3.cable.virginm.net. [82.31.203.200])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b53eec3sm17657025e9.34.2025.04.16.04.09.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 04:09:08 -0700 (PDT)
Message-ID: <78895df2-fb5a-4dd9-849e-91930419fac1@redhat.com>
Date: Wed, 16 Apr 2025 12:09:07 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs: gfs: Delete duplicate function generic_update_time
 calls
To: Chaohai Chen <wdhh6@aliyun.com>, agruenba@redhat.com
Cc: gfs2@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250416094240.206847-1-wdhh6@aliyun.com>
Content-Language: en-US
From: Andrew Price <anprice@redhat.com>
In-Reply-To: <20250416094240.206847-1-wdhh6@aliyun.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/04/2025 10:42, Chaohai Chen wrote:
> generic_update_time is called by inode_update_time after
> processing gfs2_update_time function,

This is incorrect. inode_update_time() returns after calling 
gfs2_update_time():

          if (inode->i_op->update_time)
                  return inode->i_op->update_time(inode, flags);
          generic_update_time(inode, flags);

Andy

> gfs2_update_time do not
> need call the generic_update_time again.
> 
> Signed-off-by: Chaohai Chen <wdhh6@aliyun.com>
> ---
>   fs/gfs2/inode.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
> index 6fbbaaad1cd0..05fc363bd6e7 100644
> --- a/fs/gfs2/inode.c
> +++ b/fs/gfs2/inode.c
> @@ -2171,7 +2171,6 @@ static int gfs2_update_time(struct inode *inode, int flags)
>   		if (error)
>   			return error;
>   	}
> -	generic_update_time(inode, flags);
>   	return 0;
>   }
>   

