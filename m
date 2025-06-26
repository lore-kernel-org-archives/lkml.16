Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE5C1F8AC8
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 11:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750935830; cv=none; b=e1NGukia8My6MGRFeOU//0PSQ77/MNwPb9RuuIBH7CdNAaNJYF+9Uvy1FHbftAK6D1xS16lDh4Yb3J9vWGdVqSoNdXHKutZpFpHPlEIGrGuUPJLNlHKd0ln7VDs74UtEP8UencpfQN8RxQTqK6HBnMalHMF7dsg5FcGXiabqCRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750935830; c=relaxed/simple;
	bh=tuGT8XW8rHBbFXu3KFzBBDY3T/l6VMT1FnYa6Mpkjoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e7fo5CHIPDdVM5fhMsS3VSe8gMTN6e9NtqQDfZOCY6li6rZcWPSy0weMOH8I9iIZDAoArzx/t2ZzdnvFs+fmYU6xn/jkeKA4ujdr6vPmy7EMkH4eDHNPqpgVWfZTUMLBWDKOouZ2kb2QI4dQIAjaWOcP2omTPB+PyywG4rU6otY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eEHn/wCD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eEHn/wCD"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9fvBM018968
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 11:03:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EZwk1pKkeLiyo8jw2Ozdj+04
	ebjECh2JuYWqOTipUaE=; b=eEHn/wCDOprb+hLZaCBpTjpQ4Lc39cdJ3SrQ7tu+
	bvk3xc0MtqKLpTaJUxpqGnpOL+UgWrJ/2O+3aS7t/ZOLTGIu6t1qHhm/O9aT7Yl4
	8T551wjDWq353tIAKkplzcnAq4+AzKsQO4xe48auVRpcsazwxBmxcOoUtGhpG0CN
	+w4i94ZKRjAKkDoKODqcIc7JbyzTCcxLdRXWw8nnQjOkGwBMj7LapQ4EwIZFS1BU
	VQRK+jMnJXQbxOpiOaO31tsCL7ZAWubGUBAAfsnKhI0E9/2SJbw5Ae22s19tkXqF
	WNh+0tFDe02zUt0D6XaVOHMxB0N7wH9QjDlz8+b8aQTUyw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g7tdcyss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 11:03:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c955be751aso121334485a.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 04:03:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750935827; x=1751540627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EZwk1pKkeLiyo8jw2Ozdj+04ebjECh2JuYWqOTipUaE=;
        b=ClN0U3v4bltIJYTuf1oIIseDtbKoFepdgtTlt/DKR/+TiwhqIoE8YNoRNgV2UHm8zY
         DodQzxyY6u1AiTGWKRLRxrjFOIY5A2pViY901iKWgG4vQi9D8RfEjXGyjfPcYIXNq1yN
         jjvAutTU9yO77/iTSvCGu2+uK3qISnhLBzkmJK28h/bkjA29yDQrG1fmWkfsQgH1NL4M
         zfKh/82TNYS2Gws4PcYRKLEUdPtZElwLaxRBEbNp9uzEZx/L7iQEduSeI6F8Bmzkx0s9
         NivYs/UyVcvq30CrMsVtGz+or0L2bV4nQQXQLLHqq1QZQohoKKKmZ2i5Nb7QDNgdwRg1
         icjA==
X-Forwarded-Encrypted: i=1; AJvYcCXSZNntifyB7wX5WgG+pQWL8JrtASNikrvwZl+pWq2sxfslCmZnLT6LEmMkrjzmfv4wIDIU/J9I2bNVGDc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcQDuxr5WhX+XumT3SbG61+aozLP/SMm6FjqmQ8e/sUdUlBc+Q
	Z7rzz4ZpqZVjpfgWPhQQLO3l7AtV1U5dv4NQCSwT8cetRpOLFDmzweniaX7w+1wXr+S34wAQ1Pj
	mZmtSw2mSTmEJ9WZLu0DDJqQRVJlJ23tPP/T6KC5Bq1AlHsKP0NykSEBaJrH15t0ikCA=
X-Gm-Gg: ASbGncsnCOPc0+TprCdqsoWZVX71UH6LiYcrE0X7CRC2RSmxu0gmCfu9cDR+xh7CM7G
	wMCXga6m+PuocZZ3kPmDSlnD7/+56dhp04ad2z0yiTtm+3HYqq2J0bKsOf0TRafF0u7RurHZ127
	rUWfEvxfiS4LjXaQGcpqzsTN0luY4FUuBv84TbjYEqsjHfQlg84DLQ+NkwotxlEdXg73Xr9KHNE
	7JZdXTZJTgBYf0v1vJN1jnpsQLpEE5dUSK7GoCqJheFfaYBM/N4pPCvGXL5MXQq7uyDQh1e0tdW
	DvUAiR3iOMQStJf+gsNN689fP5bFKZUuaWXwg9qQRS6QG56cMceY3DjFiy6HOPTAUzFfEAQ2elD
	PZ/JmGkAW5VaQlw2/McRB+E5HBYaztvXkC6Y=
X-Received: by 2002:a05:620a:568f:b0:7d3:c688:a58c with SMTP id af79cd13be357-7d43ba6f184mr401137185a.6.1750935827250;
        Thu, 26 Jun 2025 04:03:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFj8zoi5S1oYETlxpiEWZ4hcHqwoUim29NF3B+sYbbnhwtnWGNdD7ekpAbc188TtZRy8dUh3g==
X-Received: by 2002:a05:620a:568f:b0:7d3:c688:a58c with SMTP id af79cd13be357-7d43ba6f184mr401133185a.6.1750935826725;
        Thu, 26 Jun 2025 04:03:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2e0c153sm1967091fa.29.2025.06.26.04.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 04:03:45 -0700 (PDT)
Date: Thu, 26 Jun 2025 14:03:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Steev Klimaszewski <steev@kali.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-efi@vger.kernel.org
Subject: Re: [PATCH v4 1/8] efi: efivars: don't crash in
 efivar_set_variable{,_locked} in r/o case
Message-ID: <zw5u5c2itmpxq34d22y5wmtr32d4zsmjj5clf77ryeqs5jgd4v@t3wjfyj43yra>
References: <20250625-more-qseecom-v4-0-aacca9306cee@oss.qualcomm.com>
 <20250625-more-qseecom-v4-1-aacca9306cee@oss.qualcomm.com>
 <aF0bLtnABcGTi0wM@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aF0bLtnABcGTi0wM@hovoldconsulting.com>
X-Authority-Analysis: v=2.4 cv=CPYqXQrD c=1 sm=1 tr=0 ts=685d2914 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8 a=EUspDBNiAAAA:8
 a=CWZieSLx0XMgBVwFOAsA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=xwnAI6pc5liRhupp6brZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDA5MiBTYWx0ZWRfX+COkqfEc+C4W
 ze1lMv07YST04gxg84CtFZGBJYmFuHH7zHgS10c0KNJ1p3YOSF8sWegzMLCnOIEX9Nj8H5JZ/H9
 6L8YnfYn5hGcdA1OUx1tFMyhqc8y04JSS+fGDnvGKcajButsgLylGrzSCmpJ9dmiwjS3La24AR7
 0/FwHT57drnkKQGKGtDlrGGGwncARUfr1wvOur5Ty3nkfcRjMbFPzO9F0y6BSiXOrHHnr0ZPb8K
 bI2IcScfH9Qfgr1c2H0+aey2/9hEA+QAih3BNJbZSxXi3E8D0Ib8rh+2UZ4znUpYhIqcz2CscSk
 ypu95i+u9+atE0JZpTSnw/6u+lEC6doOdsik40ssUGgaFt5aaIKWv6K+LUJvHYrPjUNMWXYfq4o
 pdTGzcB+nMFzHIDljZAVpDKegVxfFd6Dz5EDZIO7nJlejQS6BBIPwWrZx2HNCUBg4loDV2Nm
X-Proofpoint-GUID: 3DYIFVMI1Tg6QSFIyfE2pPQAyS_Yq7fG
X-Proofpoint-ORIG-GUID: 3DYIFVMI1Tg6QSFIyfE2pPQAyS_Yq7fG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_05,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506260092

On Thu, Jun 26, 2025 at 12:04:30PM +0200, Johan Hovold wrote:
> On Wed, Jun 25, 2025 at 01:53:20AM +0300, Dmitry Baryshkov wrote:
> > If efivar implementation doesn't provide write support, then calling
> > efivar_set_variable() (e.g. when PM8xxx RTC driver tries to update the
> > RTC offset) will crash the system. Prevent that by checking that
> > set_variable callback is actually provided and fail with an
> > EFI_WRITE_PROTECTED if it is not.
> > 
> > Fixes: 472831d4c4b2 ("efi: vars: Add thin wrapper around EFI get/set variable interface")
> 
> I don't think a fixes tag is warranted here as it currently appears to
> be expected that the callers check if setvar is supported before calling
> this helper (e.g. by calling efivar_supports_writes() as efivarfs does).

It is not documented as such. So, I think, we'd better not crash the
callers.

> So should perhaps be fixed in the RTC driver if we agree that supporting
> read-only offsets is indeed something we want.
> 
> Are there any other current user that may possibly benefit from
> something like this?

efi-pstore comes to my mind.

> 
> > Reported-by: Johan Hovold <johan@kernel.org>
> > Closes: https://lore.kernel.org/r/aFlps9iUcD42vN4w@hovoldconsulting.com
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/firmware/efi/vars.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/firmware/efi/vars.c b/drivers/firmware/efi/vars.c
> > index 3700e98697676d8e6f04f061f447391503f9abba..11c5f785c09364f61642d82416822cb2e1a027fd 100644
> > --- a/drivers/firmware/efi/vars.c
> > +++ b/drivers/firmware/efi/vars.c
> > @@ -227,6 +227,8 @@ efi_status_t efivar_set_variable_locked(efi_char16_t *name, efi_guid_t *vendor,
> >  	setvar = __efivars->ops->set_variable_nonblocking;
> >  	if (!setvar || !nonblocking)
> >  		 setvar = __efivars->ops->set_variable;
> > +	if (!setvar)
> > +		return EFI_WRITE_PROTECTED;
> >  
> >  	return setvar(name, vendor, attr, data_size, data);
> >  }
> 
> Johan

-- 
With best wishes
Dmitry
