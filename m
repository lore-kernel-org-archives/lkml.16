Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F21274B21
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 16:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750782663; cv=none; b=n9d666876KfdoLC8WJ6ksOdyUz+ub2NWgDOiRw+tA2yvX0xuNsxgiYI/PlwNcbj8bo0vwZn01C62TbO3Uc/c8Fj/w1OPFNk3mtGMDiZqVQk/LC1u+ky8zR9mEv0RmQKrskuict58Vqhfv0PIVgeGTWt+OMrcVdB7K/dhgiAc6Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750782663; c=relaxed/simple;
	bh=QcvjBdtjzx4el21ou2AyjFk3PoVeXVF0t0TqhAXdQAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m4m+ToIWGp9m9bx5REy4mKjNKOMXK5JBpWcd4ohpFekvN0pPICRGZRhV+uvgMdgyAbyJW6Wwp1bje/WzqUcwQldp5EGeSlaj4IAGTFw9bm9gSs+m12zij5+RJL+tLhhQaeAZdw7EAsUveLgvTYWRWMU7c50AEdOHOd07oVkHL+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SsG3HCXj; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SsG3HCXj"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-72c172f1de1so3561427a34.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 09:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750782660; x=1751387460; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xauWGZibla3a88RvY6yarAsOrTLbYeOTyPsrWKTduDk=;
        b=SsG3HCXjT86W2z+kyYtR7KnyLvzyrEQiKMcrLmW8aWzE+86Fz6qU5yIBFJkgHckvCF
         aNDx78E9wslGgIaRLZclnj1AYcsaibfpisdhzQppVGM3NKItmdLkdRX2dl0uJFTaivdb
         4qAQZBWZW+38PZkey/MXgWJkMZcvB8hmRw7xYlqdkIcYmJ3R2p6cuhha8m5JKOUZvSIc
         xVquArpvN4jXW3AeOYtm9LP8RM4/VpvwJTvLm+1G1gR613ypw0vFFxBhnu1UFsjnxdpv
         WjaewyPG5LYJpyhDuKj3D+mcTdVdUBrsfAGl+Qdy2HrpqA6Zg2LeP3tL5oJvzbQEGyQC
         kyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750782660; x=1751387460;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xauWGZibla3a88RvY6yarAsOrTLbYeOTyPsrWKTduDk=;
        b=uOIW3I2l2SpqL5ut3BI0G5PtxuafgxiVd1LrnuLYfVX0zZrgyQL7o9m2rJYb5wSUKv
         Fv505MmqYfaVHdJv27A4mhN1HRvOOk416rM632BWaqEFXMacAd0CexHl6ohX51v6zOcd
         tLQz188jT2OjVFxJEg/k3YfQwoiaAXffvwmykO/yy3G7j8qsn7aplZZSSxdu/Q7HLDX8
         lEafwXPjeujtzntEYRurCbcmYonJRx/f7kYxVrkWW9IarF0URPM+Z77Sfy+N9LCSwSzZ
         I+saHRb1cd+ABzAYgVif2DOLXPgGRyKC0lSY+3ZDVWGB8jvfBYHdZzuQOlCzSs2j1Bgh
         wGtg==
X-Forwarded-Encrypted: i=1; AJvYcCX2OyNzp6Ja+5XLU9SGpS94lZq1JpOmf4OD3TnQkUekUZ97sFVpZzdguu/oU0FqfDzebOsY0dMlhSzkjJk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw28Qvt8MCm24OB6nEsBYVQA81SYRxijl2OPPsz4ePvV5lsbaOc
	w5FOomVJOFupyZ4gQMpAfSi9iv48jqI8LA1ZdH9oFxS0UEPHEBYAVdIqZs9qWFa08dRJMSWRE8I
	oh1eq
X-Gm-Gg: ASbGnctdF5paWoKgFNHJajAy1Y9tZb+UQx5/EkW/iNqI9aY2I4mFeDB3gkTZTxAxtCo
	oOPzjp0Yo5k9uQZPuHnCVGVIhO8nKwWvYuUefnwez3CgUQyMme8SQV81w3Cbn0JrS5vGpZbHNRL
	d8A9/KUidiw9IK5M6yXfUjyn3juR1r5Dj5ioySTOBKVYhsELTV/s6EgwV6/FD6z8eOrQ61WomF0
	GlxEwbblHadg6T7Mq3p1KA0aD+if7K1LF+umuHSv0RlD2J91RL5S0oY+tlOwa01W0CfgLNfaiWh
	aRIQa4agSO6ZkOFVtTm9ahk46b3FjseS1a6LLmCKAM//0CkIdq6xKEFM39+505TaBHJHTjfhtm1
	rA3MY
X-Google-Smtp-Source: AGHT+IGcNnn1LPrlnNqMBw8pIeYo2YoTiOvJeFOaf225KGbqOfzpC8jSGqoDPVjT+4qvrB73k5LY2g==
X-Received: by 2002:a05:6870:2b14:b0:29e:5dfd:1e17 with SMTP id 586e51a60fabf-2eeee5773e2mr12099997fac.23.1750782660133;
        Tue, 24 Jun 2025 09:31:00 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:22c9:dcd3:f442:dd1d])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ee664c3cb9sm2167708fac.6.2025.06.24.09.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 09:30:59 -0700 (PDT)
Date: Tue, 24 Jun 2025 19:30:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2] staging: media: atomisp: remove debug sysfs
 attributes active_bo and free_bo
Message-ID: <cef03d37-715c-47a8-81d4-0872d505c39b@suswa.mountain>
References: <20250624144943.39297-1-abdelrahmanfekry375@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624144943.39297-1-abdelrahmanfekry375@gmail.com>

On Tue, Jun 24, 2025 at 05:49:43PM +0300, Abdelrahman Fekry wrote:
>  int hmm_init(void)
>  {
>  	int ret;
> @@ -130,14 +48,6 @@ int hmm_init(void)
>  	 */
>  	dummy_ptr = hmm_alloc(1);
>  
> -	if (!ret) {
> -		ret = sysfs_create_group(&atomisp_dev->kobj,
> -					 atomisp_attribute_group);
> -		if (ret)
> -			dev_err(atomisp_dev,
> -				"%s Failed to create sysfs\n", __func__);
> -	}
> -
>  	return ret;


It's really unclear how this "return ret;" is supposed to work.  Was
that part of the sysfs_create_group()?

>  }
>  
> @@ -145,7 +55,7 @@ void hmm_cleanup(void)
>  {
>  	if (dummy_ptr == mmgr_EXCEPTION)
>  		return;
> -	sysfs_remove_group(&atomisp_dev->kobj, atomisp_attribute_group);
> +
>  

You've introduced two blank lines in a row here.  (checkpatch.pl -f
will complain).

regards,
dan carpenter

>  	/* free dummy memory first */
>  	hmm_free(dummy_ptr);
> -- 
> 2.25.1
> 
