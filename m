Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04DF1465A5
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 10:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750071129; cv=none; b=GyO6H1sIY6KkD9kkVeBV4X2cAz575z66l50AVz3NDazAcXw7pWjONfy/+y19lvJco9E0jsFu1b9eMs/QydbiboAXnhBNSyXBzQhzJbF/jz9gEvywFS1I8+ttmZJ7sxjggglWZJlr93znW2IXro8FqOZJij9UhT3BxvkqGtYVMqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750071129; c=relaxed/simple;
	bh=cjkJxuPMui4jkjC09WVtKlLhCNFsX/rnpNIYDU9Q5fk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PZuLT7qrE4JzFeSxsJK4nUjzPWFRF8dZFTubKkHVZs4gD/Tt6gVeYnJ2Vyx7W3OYIKQwHC4hqkmv9JEeBYpyjvuWlfXcOZuPg6pOspOU21+JWckypphZSs+Jg8kPQZVsAy5GNyLpemJH34Gh6OIcMLkFxCXF5xeArXdoy2GS1n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=epyiHMIp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="epyiHMIp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750071126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+o5eMEqZMwZxbrg8YFtxTBAmIjbLtJHeOSiM43t1dn8=;
	b=epyiHMIpizWfg6hnaVEBufKR6aiAgLaHanp/Q9yED5BytGxMPXz3nlLjWv+CX+d+BeFn7v
	tEh9+/O2Je4Qc4iJLJI21/0ZMaOH6gxWhFYrQ1Xp372Z8+3lL6k3GszGI82IGB3/oud3oS
	bAzPTxmGLJQtxOJ5uPDvHrCHH/oy7ec=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-347-dxmjray7PYmx3XVQeisR4A-1; Mon, 16 Jun 2025 06:52:05 -0400
X-MC-Unique: dxmjray7PYmx3XVQeisR4A-1
X-Mimecast-MFC-AGG-ID: dxmjray7PYmx3XVQeisR4A_1750071124
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-60728151592so5064360a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 03:52:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750071124; x=1750675924;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+o5eMEqZMwZxbrg8YFtxTBAmIjbLtJHeOSiM43t1dn8=;
        b=d3AkPw37xLXsZ+GvKuicuOvdqNe2TphDpBrqtEsmtrbmB0Mzd101JkeDHHcM0/IRZE
         d3q1JnM9SxevgcgTBB8hwy7Q/NDXEErpg5fha++KHHV+moctPmPkbwfrkSFbKJJIROS3
         E7HuujtKOnmkpyqDfSeDQLyNafDOqb/ClJmmHwym4oaDEP7PXTis3h1Qzqmo5SOBsdak
         fJkBt9wcyY6kP7brAna7n47pQD1/vnyE0+Q9o0K68u2OkojXVXI6n4UsQDtlbtog2FTp
         HiqDFJSHJdl4yS1jjjPgmEToATfgK1OKNG8joM3WIjF6SurH1J+mxjd6zWRI2Qn52PSS
         Cxsg==
X-Forwarded-Encrypted: i=1; AJvYcCUxvka04vSHYswGupu0hwUePY5izBHRREuatumXcMw1hi5+QUcxZ5Cu8G2YOp4AdESEds8NGOjK2dlYpZI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjM+l/OrJNGPNZ8z0GAKHgQk9z++1KYNJz7VktJw4CM4TQzHPu
	FhBZlqdZ5u58NrOXkmlSMd93IbPa2vIZgLAVFM4gNkus/Lr9TCTAGq88YTjpjfTnlAjYvF0vy2F
	7gex81NwUdhuu2t+gpau7Bhfq1mjnvxAF/tMbzc2R+LfTqHo8G//PBAeAcd7maX1Zug==
X-Gm-Gg: ASbGncuOH2niV/cwAw481LZHnhb5RWEgRA42Ltj+whdw7xlGSQLo4odRQddaGxCbnFg
	UoKr+Mhsk5KvXpY2QfQ5rkFIUED1N7etBPIFo0T/zZvLZAkQUM/EBM/62OmdKqIN+NoL35NK8SZ
	jtzo8U1dzlBGZs4YXXs31uYoyqFUHGHMygBHMqEtyZNHEDMKUBtPMSlZbCor8jdKNWo4LctIihe
	cMvy0x2iYZAPeJi/LA4Vlk6Ok/3fbPQBfoncDo3yoecG0fAlDhbm8pdlrx1fRAue/PwXSKt8HE2
	W8jcL1Ckyq03sfuu+B2R2nPKvQ==
X-Received: by 2002:a17:907:3d45:b0:ad8:91e4:a937 with SMTP id a640c23a62f3a-adfad6d19a6mr836614466b.57.1750071124106;
        Mon, 16 Jun 2025 03:52:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7HLYhQJ7eTatysdcSoH1vfusGYgDB/y93y32VdP9A9H9s80XOZ7HRoWyTA2AVQRVNepQlbg==
X-Received: by 2002:a17:907:3d45:b0:ad8:91e4:a937 with SMTP id a640c23a62f3a-adfad6d19a6mr836612366b.57.1750071123714;
        Mon, 16 Jun 2025 03:52:03 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec8159e24sm633506566b.34.2025.06.16.03.52.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 03:52:02 -0700 (PDT)
Message-ID: <33493c2a-c499-4191-a1a5-3194ce2d76e6@redhat.com>
Date: Mon, 16 Jun 2025 12:52:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8723bs: remove return from void function
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250615123758.41869-1-straube.linux@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250615123758.41869-1-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 15-Jun-25 14:37, Michael Straube wrote:
> Remove exit label and return statement from a void function.
> After the exit label no cleanup is done, so it is safe to remove it
> and return early in the only place where the label is used.
> This simplifies the code and clears a checkpatch warning.
> 
> WARNING: void function return statements are not generally useful
> 
> Signed-off-by: Michael Straube <straube.linux@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans


> ---
>  drivers/staging/rtl8723bs/os_dep/os_intfs.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> index 0248dff8f2aa..3cbfc305ede3 100644
> --- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> +++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> @@ -1112,7 +1112,7 @@ void rtw_suspend_common(struct adapter *padapter)
>  
>  	if ((!padapter->bup) || (padapter->bDriverStopped) || (padapter->bSurpriseRemoved)) {
>  		pdbgpriv->dbg_suspend_error_cnt++;
> -		goto exit;
> +		return;
>  	}
>  	rtw_ps_deny(padapter, PS_DENY_SUSPEND);
>  
> @@ -1134,10 +1134,6 @@ void rtw_suspend_common(struct adapter *padapter)
>  
>  	netdev_dbg(padapter->pnetdev, "rtw suspend success in %d ms\n",
>  		   jiffies_to_msecs(jiffies - start_time));
> -
> -exit:
> -
> -	return;
>  }
>  
>  static int rtw_resume_process_normal(struct adapter *padapter)

