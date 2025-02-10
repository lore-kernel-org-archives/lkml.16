Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC561C3C0B
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 09:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739179229; cv=none; b=HBG1i518BnudN2IgDmcjid0TudH/fbPORsB6x3zLwBcb/jYcG8K0J4z6sSmmtAoAvmvfdJlkJPYBSnGdR+j/z8ACt8kKq97zut3qlG3YNw0v00nVh0GDB2kmYeTmNX6I8ziFLJwaCEp2hw7UWsOKSpzaX2FLaRgPRMli77oeSP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739179229; c=relaxed/simple;
	bh=PT02zREhwXUaI7oSUo68634yGkEnv5WqHiUuJQRNAyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xpeb1doMFjKFz8CShRSTHsnNz+zrOVDIIwbF85XaiGwqTuO3rkNRmkCTSRTiVcqLKlpv4OZISposjCpDMIMRiyUdnbEw8gvzu065CDfqDBC5ZZ4gH5hw7LF2mq+4a2Uj3Kt5NzlnJR0JmEL8YLT/uj/dHUrK76YQEiA7xqt+dPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eG3KHlZ5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eG3KHlZ5"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 519MLdPo020855
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 09:20:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lzMoqxxC4iIRXsH/yWCzH8jT
	RNEGRUBbLR7vl8C1qf0=; b=eG3KHlZ59ulPo2rRN5AeX7X5b9VgGkmySmTZ93jm
	PAnd+mpJ6aFsa5BpbSFl5ooelx1OOohMFGnBNfCKXgklHWH0vEgNY57C28ygz7k6
	G0g40nMQGjPgBzBWladHPynvXTHSlUqMIt1L0CkuxyMt63Z3GpuxBVoifAw+Cc4n
	bxMuP+286GMpEFkX8GQqmLM6d0M0NUn9a56gXT7vA6NCpT7yCQZa6ArMtrIqeqrq
	BpSWPoBFI//Fh8zcHp8R4QylH7LGCsWeGfnt4PIOjJn1a9a1dYDQGD0rpfLXpwgz
	BK425E1nr2SbmqYwI2vgYU57yROJJficA8KtHHo1wrwI7g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0f73v2s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 09:20:25 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-21f444af89fso55961215ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 01:20:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739179224; x=1739784024;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lzMoqxxC4iIRXsH/yWCzH8jTRNEGRUBbLR7vl8C1qf0=;
        b=hBkEPe2vQzaJUyFv44cvEMnDWpQ1KZ4TWBHK898ZLlHwxIBZvfTyf1OdPZ9ejOcniL
         zQcE/p8IPFRF4WpcCIbw6p623i0HSldoqmEQAzODPacThWoM+hiilxo1vBpoWAl+KKSJ
         HTZQD47vKjZmrO9H4sDtQy7UjcA5ZBXda8TQBbXS5zisLcErUTvBTxTBVi+Lz5v0YeFG
         /cz/nqEBFK0WH9aG9cETUuLz4AGxMeW4icyct2kzbQonPsDshYfFI+x/WEwwRi3ZfPYw
         WwsEVtN2qweeXvUuH/yP6OXQkiPtqGpKG+UFaGq7Ey+D/ZU78eoYnqfn9HHjPZcq8+Ld
         s1oA==
X-Forwarded-Encrypted: i=1; AJvYcCXIJmuPprG0ej6bRQsgQvCkAATtfEAzLJcxlVaYUDOUbwKy0eS9GlWXFEkD9CU7eDVWiSdk+l+UgY5gbiE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYPbLy8sRAwkXSCIx+b8PTXzlJFJgBJWx9Ax1EpxNd614WubUv
	hJLkFrYFxDWUAJvMqJCXscuz7xJXNRVaa9CjWnjoMN7Y7PQ69DF4nlha7HFFHFlnmkPg8go4A+J
	9gt50JEJ3elDyd2iaDtczQPxe2Q6LBIHsX2I/EB9bvP4mOP6KamIso0/KSMFjz6g=
X-Gm-Gg: ASbGnctypGTtWlCBho0X9i+VO6ES9uN7b2XQrXN0yow6VJV+6B2fkDqIU+KEksUXQFQ
	Zbt0PU9YB6GVNHMp5pGR9XkBYGEPUdSV8ycP24CLScaXw7kXKK1OytWcPjbjSmSoBlnTbcX2NiO
	RWxsSG0x1kK0LwmQ/UWsamerlN7cOGt6snpsjsXBA9Ju6GS/E1n2P06PPPp/oNOsFqoK1abL+XZ
	/qY7mLRdSaEat88NFxDcLIqT52orxtQYNB5e8oYqdS8im9OowkgDfuJKlr7bo1MlYrSopvD0F2i
	AYJJJbd4pQENcMP4JQwWYFVlO9Ek6gPV
X-Received: by 2002:a17:902:fc84:b0:21f:8320:f409 with SMTP id d9443c01a7336-21f8320f454mr80737975ad.21.1739179224003;
        Mon, 10 Feb 2025 01:20:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZHKAzKZvTW6bB8BRzfsWOsXkmuCrb/IWIeRi+vf2G14R+RdaAzW0RqOhh/yDhzr0WLFQZDA==
X-Received: by 2002:a17:902:fc84:b0:21f:8320:f409 with SMTP id d9443c01a7336-21f8320f454mr80737625ad.21.1739179223593;
        Mon, 10 Feb 2025 01:20:23 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f368bb4bdsm72679345ad.235.2025.02.10.01.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 01:20:23 -0800 (PST)
Date: Mon, 10 Feb 2025 14:50:18 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Saranya R <quic_sarar@quicinc.com>, Johan Hovold <johan@kernel.org>,
        Frank Oltmanns <frank@oltmanns.dev>
Subject: Re: [PATCH v2] soc: qcom: pdr: Fix the potential deadlock
Message-ID: <Z6nE0kxF2ipItB2r@hu-mojha-hyd.qualcomm.com>
References: <20250129155544.1864854-1-mukesh.ojha@oss.qualcomm.com>
 <nqsuml3jcblwkp6mcriiekfiz5wlxjypooiygvgd5fjtmfnvdc@zfoaolcjecpl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nqsuml3jcblwkp6mcriiekfiz5wlxjypooiygvgd5fjtmfnvdc@zfoaolcjecpl>
X-Proofpoint-GUID: NDIQ9crGLgSBFASSaQ6IVeQyVTc8B5wQ
X-Proofpoint-ORIG-GUID: NDIQ9crGLgSBFASSaQ6IVeQyVTc8B5wQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_04,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 impostorscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100078

On Thu, Feb 06, 2025 at 04:13:25PM -0600, Bjorn Andersson wrote:

> On Wed, Jan 29, 2025 at 09:25:44PM +0530, Mukesh Ojha wrote:
> > When some client process A call pdr_add_lookup() to add the look up for
> > the service and does schedule locator work, later a process B got a new
> > server packet indicating locator is up and call pdr_locator_new_server()
> > which eventually sets pdr->locator_init_complete to true which process A
> > sees and takes list lock and queries domain list but it will timeout due
> > to deadlock as the response will queued to the same qmi->wq and it is
> > ordered workqueue and process B is not able to complete new server
> > request work due to deadlock on list lock.
> > 
> >        Process A                        Process B
> > 
> >                                      process_scheduled_works()
> > pdr_add_lookup()                      qmi_data_ready_work()
> >  process_scheduled_works()             pdr_locator_new_server()
> >                                          pdr->locator_init_complete=true;
> >    pdr_locator_work()
> >     mutex_lock(&pdr->list_lock);
> > 
> >      pdr_locate_service()                  mutex_lock(&pdr->list_lock);
> > 
> >       pdr_get_domain_list()
> >        pr_err("PDR: %s get domain list
> >                txn wait failed: %d\n",
> >                req->service_name,
> >                ret);
> > 
> > Fix it by removing the unnecessary list iteration as the list iteration
> > is already being done inside locator work, so avoid it here and just
> > call schedule_work() here.
> > 
> 
> I came to the same patch while looking into the issue related to
> in-kernel pd-mapper reported here:
> https://lore.kernel.org/lkml/Zqet8iInnDhnxkT9@hovoldconsulting.com/
> 
> So:
> Reviewed-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> Tested-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Thanks.,

> 
> > Fixes: fbe639b44a82 ("soc: qcom: Introduce Protection Domain Restart helpers")
> > CC: stable@vger.kernel.org
> > Signed-off-by: Saranya R <quic_sarar@quicinc.com>
> 
> Can we please use full names?

I have informed her about this and she wants the same name to be mentioned here as well.
> 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> Unfortunately I can't merge this; Saranya's S-o-b comes first which
> implies that she authored the patch, but you're listed as author.

I will correct it.

-Mukesh

> 
> Regards,
> Bjorn
> 
> > ---
> > Changes in v2:
> >  - Added Fixes tag,
> > 
> >  drivers/soc/qcom/pdr_interface.c | 8 +-------
> >  1 file changed, 1 insertion(+), 7 deletions(-)
> > 
> > diff --git a/drivers/soc/qcom/pdr_interface.c b/drivers/soc/qcom/pdr_interface.c
> > index 328b6153b2be..71be378d2e43 100644
> > --- a/drivers/soc/qcom/pdr_interface.c
> > +++ b/drivers/soc/qcom/pdr_interface.c
> > @@ -75,7 +75,6 @@ static int pdr_locator_new_server(struct qmi_handle *qmi,
> >  {
> >  	struct pdr_handle *pdr = container_of(qmi, struct pdr_handle,
> >  					      locator_hdl);
> > -	struct pdr_service *pds;
> >  
> >  	mutex_lock(&pdr->lock);
> >  	/* Create a local client port for QMI communication */
> > @@ -87,12 +86,7 @@ static int pdr_locator_new_server(struct qmi_handle *qmi,
> >  	mutex_unlock(&pdr->lock);
> >  
> >  	/* Service pending lookup requests */
> > -	mutex_lock(&pdr->list_lock);
> > -	list_for_each_entry(pds, &pdr->lookups, node) {
> > -		if (pds->need_locator_lookup)
> > -			schedule_work(&pdr->locator_work);
> > -	}
> > -	mutex_unlock(&pdr->list_lock);
> > +	schedule_work(&pdr->locator_work);
> >  
> >  	return 0;
> >  }
> > -- 
> > 2.34.1
> > 
