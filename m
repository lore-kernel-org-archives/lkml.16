Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766D1234964
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 07:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738915045; cv=none; b=FpnrAULNbS6I1FfDvUwhNfjEc2+3R6fIc9MtpCuqj8s+GuC1zmDoyd83s2MSw01FVMOMx3PBhcBZZ1w66J/+XdOrBgHYjrJQfTJs01un21Fen+izYCuDpWKDCfKjQwlb+NVzHkLDrs96RV/+/JvZOv6cuypfBqLqoCUKbu2HXxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738915045; c=relaxed/simple;
	bh=8qaqi45CtlefvXTwxkpy5VtpLKk/WKypfpbmm8x7m6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XQB/+j4+rONPzKIJPVpg1MKQdiq0SEZ5oFdNATlW5jn8Vpjh1HvlGvGFbzYvAh4vPp3uwafqS9oQfDt0+yFmYQNNF2XaZIahlFlPpR/arFynrVW3z29micpa2+8QIHaeww5IdLTSyurZZATnjlkEr2e4bztPvIl2EfPzI8Lz+BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QHS/RuJl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QHS/RuJl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738915042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+E4tyOIaMD9iTV+vxsPHkI9fcl7y9d2AE2AY86e0L5A=;
	b=QHS/RuJlvpn+tuEr3ZdHyOt/d626DCcvPc9rf50o2MxqQTuOnDv9tUIkCS6SPml+C0uKja
	jL6xtEaITNdmFYdM8IhxQfKkj4WWebBEVOT4mnY63IIQR9COi4HoC9LewaT1Xs18qT1nkP
	vqUNsDR9jeD1r8X7hyHh+q9r2qePxdA=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-6EbCzLYzNcqrDTEGSx2ibw-1; Fri, 07 Feb 2025 02:57:20 -0500
X-MC-Unique: 6EbCzLYzNcqrDTEGSx2ibw-1
X-Mimecast-MFC-AGG-ID: 6EbCzLYzNcqrDTEGSx2ibw
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2f9fbe02121so3823218a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 23:57:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738915040; x=1739519840;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+E4tyOIaMD9iTV+vxsPHkI9fcl7y9d2AE2AY86e0L5A=;
        b=cFbzNh1qRZpDFs4wjrWazqcvyYaaDM1SXUQ/meIBqd/RGqoLTtacwaMGZQRLWPR61Z
         ImmtRpoaghqzp8Btunie6Bqx0Zk24bLcg9f+/3m7oClkmYCogt3nNwt2SqBieTYYtj75
         aejSynBI15xBsfmmu5CGxI5APItCdQ+fWa/jzSn1IefMhgr44ut8ubokYbxJepOGpaCV
         yY+d0jbOGYnrvqVUr3X8Yfty7/9n0F6HGhu8ECWVzCctPNN9HGfivDRkiq37ooNpDsaF
         BUwlOMnL69KVOC5kmZ+iwEWGSAHdcuAWzk/g8s5ket/UNRv+vXN9LfdT4bIbWxCresJ/
         M9Vw==
X-Forwarded-Encrypted: i=1; AJvYcCWgvvye7SJrpXO1rblnZM7uOZh/hx0fUDgr0D1KnL2FcfHBALmWjDHRI1b1JO1BfeCliW8kHxeS4knIXBU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yza1G31KcZGGMJRLS9rrqf3KXSZgJ7aA1l4amHPfGMNWH7cS+M7
	Xs5aGP7ln2K6OUMDZyKz40wfMTaPk8jcPTVx9svVc/GtT6Do1cm0H7juUUJ1FDoZD2sxXBh50vJ
	FVYTJ+O7TEgprkojO6Dh186xVzvpnFtiv6PaEhzAs6V024nEpcpsg0063Q5USgA==
X-Gm-Gg: ASbGncuODMyXxAKj6RMzSFoaQjGJZ5dmuuRpaTUXKrMpFs/3z4dIQLlGTZ7pIlS0DaP
	7WN3YTEkKFEWCBEQNc+9a11dlKKJRV1GWsNinvFN1aCG3HMS50+0tn+gG1fFXCwIaREJprCeFnN
	wGEOw8rlJPLOI9pN0BoDzL6vJUQaIIYZV/8Xhmf5H9axOkJOQc4H9zxm0N37h5iIIbC5mNN3IPi
	sS5pDJPzHDK/lAxt7B07tOg55Upk1pjExytg7PZ4cGm9lNQhcyTESEvqrwKzyRGAF4wcxfb
X-Received: by 2002:a05:6a00:999:b0:725:ea30:aafc with SMTP id d2e1a72fcca58-7305d42551emr3689015b3a.5.1738915039679;
        Thu, 06 Feb 2025 23:57:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFlCduPvZoT2kdtGUGIf3M+qw7MXxQrIVbDVUudc4+qEcL6XKQWqM8w4dZu6STeAHsFx4TyuQ==
X-Received: by 2002:a05:6a00:999:b0:725:ea30:aafc with SMTP id d2e1a72fcca58-7305d42551emr3688992b3a.5.1738915039282;
        Thu, 06 Feb 2025 23:57:19 -0800 (PST)
Received: from localhost ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048a9d4a0sm2490403b3a.15.2025.02.06.23.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 23:57:18 -0800 (PST)
Date: Fri, 7 Feb 2025 15:57:05 +0800
From: Coiby Xu <coxu@redhat.com>
To: Baoquan He <bhe@redhat.com>
Cc: kexec@lists.infradead.org, Ondrej Kozina <okozina@redhat.com>, 
	Milan Broz <gmazyland@gmail.com>, Thomas Staudt <tstaudt@de.ibm.com>, 
	Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>, Kairui Song <ryncsn@gmail.com>, 
	Jan Pazdziora <jpazdziora@redhat.com>, Pingfan Liu <kernelfans@gmail.com>, 
	Dave Young <dyoung@redhat.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Dave Hansen <dave.hansen@intel.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v7 0/7] Support kdump with LUKS encryption by reusing
 LUKS volume keys
Message-ID: <36wuxuweax7e5p3q7nqrgh64m3c5xbizvanxdzkkrsuarhejws@tmjheoas6stx>
References: <20250116065825.1041558-1-coxu@redhat.com>
 <Z6V3e3yPQyhaRBCN@fedora>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Z6V3e3yPQyhaRBCN@fedora>

On Fri, Feb 07, 2025 at 11:01:15AM +0800, Baoquan He wrote:
>Hi Coiby,

Hi Baoquan,

>
>On 01/16/25 at 02:58pm, Coiby Xu wrote:
>> LUKS is the standard for Linux disk encryption, widely adopted by users,
>> and in some cases, such as Confidential VMs, it is a requirement. With
>> kdump enabled, when the first kernel crashes, the system can boot into
>> the kdump/crash kernel to dump the memory image (i.e., /proc/vmcore)
>> to a specified target. However, there are two challenges when dumping
>> vmcore to a LUKS-encrypted device:
>
>This v7 series looks good to me, other than Randy's concern. Do you plan
>to repost to update the document?

Thanks for reviewing the patch set! I'll send a new version which will
apply Randy's suggestions!

>
>Thanks
>Baoquan
>

-- 
Best regards,
Coiby

