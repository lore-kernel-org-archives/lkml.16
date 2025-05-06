Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF9F27FD61
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 05:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746510561; cv=none; b=HQc4cKPjvEUAPFN0Zd+cyiLyoJJJVX8cg1EqomyC0AWzfIx/t3zLCPzKGBOLMV86UHPRhNsH09a0puEsTIXR3V5MnxXMZHlPp8nCcdFJptcV0eciOonOTn+/HEBiBwJ5wSGnM+2llPaz64d9m0ycIhhzf3D4qPxlvHZfZMSWckQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746510561; c=relaxed/simple;
	bh=lthuNe7tw5ZqdJOqbZ9IJt0SeCYYGcz7hyE+08AeCw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Emu8h/bwtn3tEd6cOrDvJbyoPp3te5LwpZGaBJnsqouxvWFrPc7LKT6NDf2Mz1XzUT8zr7XEKcoM0lyGj/LIqPWUX/Gfb1n2NSTjHNfiaaHyndR273XXYs62XYsk+Ci12h7CaegzQUYvGbIZrvDpdUY6Qjx1QNQy2S2H8b4FG6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=caoFKOqB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="caoFKOqB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746510558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ef8W+vMYwBS9RnWnXRE7fKcNBov/mCBwOP6v8SZB5sY=;
	b=caoFKOqBYICCMtdVfV8qvr+VQ2RY9LoMFVwLiH9n/rsUNh2Xq38fXbmxX/M7cu2EAznl7K
	YiIDr5vlf/CDXYD0d6lD6tFVisoRftRWbkT4rTP/2JHuxJ9HX+tZ3YrYc8GQOZEcEgU4Xr
	c1tjjOF2n2Q4ZguAZnBxNe6/jJm/Kf0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-63-KDeYyDfQNRafeLfXFymNcw-1; Tue,
 06 May 2025 01:49:13 -0400
X-MC-Unique: KDeYyDfQNRafeLfXFymNcw-1
X-Mimecast-MFC-AGG-ID: KDeYyDfQNRafeLfXFymNcw_1746510549
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ADDE31800EC9;
	Tue,  6 May 2025 05:49:08 +0000 (UTC)
Received: from localhost (unknown [10.72.112.8])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 729071956094;
	Tue,  6 May 2025 05:49:05 +0000 (UTC)
Date: Tue, 6 May 2025 13:49:01 +0800
From: Baoquan He <bhe@redhat.com>
To: steven chen <chenste@linux.microsoft.com>
Cc: zohar@linux.ibm.com, stefanb@linux.ibm.com,
	roberto.sassu@huaweicloud.com, roberto.sassu@huawei.com,
	eric.snowberg@oracle.com, ebiederm@xmission.com,
	paul@paul-moore.com, code@tyhicks.com, bauermann@kolabnow.com,
	linux-integrity@vger.kernel.org, kexec@lists.infradead.org,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	madvenka@linux.microsoft.com, nramas@linux.microsoft.com,
	James.Bottomley@hansenpartnership.com, vgoyal@redhat.com,
	dyoung@redhat.com
Subject: Re: [PATCH v13 0/9] ima: kexec: measure events between kexec load
 and execute
Message-ID: <aBmizZATrxhXbWyE@MiWiFi-R3L-srv>
References: <20250421222516.9830-1-chenste@linux.microsoft.com>
 <aApMnEl1Xzarmimn@fedora>
 <7337e27f-cc54-4c51-91d8-11d875baee49@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7337e27f-cc54-4c51-91d8-11d875baee49@linux.microsoft.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

On 05/02/25 at 09:25am, steven chen wrote:
> On 4/24/2025 7:37 AM, Baoquan He wrote:
> > Hi Steven,
> > 
> > Could you test below code and post a formal patch to not copy
> > measurement list buffer to kdump kernel? Below log is just for your
> > reference, please feel free to modify or rephrase.
> > 
> > ===
> > Kdump kernel doesn't need IMA to do integrity measurement.
> > Hence the measurement list in 1st kernel doesn't need to be copied to
> > kdump kenrel.
> > 
> > Here skip allocating buffer for measurement list copying if loading
> > kdump kernel. Then there won't be the later handling related to
> > ima_kexec_buffer.
> > ===
> > 
> > diff --git a/security/integrity/ima/ima_kexec.c b/security/integrity/ima/ima_kexec.c
> > index 38cb2500f4c3..7362f68f2d8b 100644
> > --- a/security/integrity/ima/ima_kexec.c
> > +++ b/security/integrity/ima/ima_kexec.c
> > @@ -146,6 +146,9 @@ void ima_add_kexec_buffer(struct kimage *image)
> >   	void *kexec_buffer = NULL;
> >   	int ret;
> > +	if (image->type == KEXEC_TYPE_CRASH)
> > +		return;
> > +
> >   	/*
> >   	 * Reserve extra memory for measurements added during kexec.
> >   	 */
> > 
> Hi Baoquan,
> 
> I tested the kernel with above change. Normal soft reboot works fine.
> 
> I will post the patch for review.

Just come back from Labor Day public holiday. I went through the code
flow, the code should be fine. I will test it by checking the setup_data
if IMA data is excluded in kdump case.

