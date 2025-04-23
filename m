Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2681885B4
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 22:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745446482; cv=none; b=WDMbVnSMpHjk4BbAkouJJTCtMq7FRzuAm8tRiq3HRGVe13737Op9r+r4Jb6nN4u9Da0mIaqV2ws6mzadLhvrMjt1E5omYUwKye3fNm7a/eFIZzjjCDrfndDHqCNoE14HlmL8Wo6SYHcDeVcO4JtmJqHZ7eaLoTvEatqWsmkyAkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745446482; c=relaxed/simple;
	bh=LWuADTgrS1pSWRwHKJ+tLGSK/D21jutRBFucPMZcr2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q9cAvwVZRST3untTU6f5RkYQXpnOQ3mI1j4i7KZ1qlfZpad5zaaQpzDA5f7shyd8EG7bAZhaMXT59qot8HAqag9aiUMbObfjqCbc0IEBNVTz7jSSGDMxNhEA+HIYz6N3rP0NLi/2k2D5wmCtKeo8TD2vShQDRLZq9bFx4bjYpQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DLluPbFx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DLluPbFx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745446479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X+SVN4y1JKQSP55HTLXPO4iRpA3jkVvTn+JT+tIaCQk=;
	b=DLluPbFx5HxNHhQ9nGAZYPNFh8w27KaMAmTALcwTi7uFSfHzC8rK2Qv5MDYAUCqc0TbKTm
	fRpDWrwYbpg9jCwxHY5eajXv7a4NVPgYnIHyz4OYk6qUQkPykfB0WwX9nKxPd0kx2of+U/
	IlJEbuKMzn8f9ZYdZ83y+dAVI5XKmE8=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-21-1MCwXPx6PYW6Ni2JQtQ3rQ-1; Wed, 23 Apr 2025 18:14:38 -0400
X-MC-Unique: 1MCwXPx6PYW6Ni2JQtQ3rQ-1
X-Mimecast-MFC-AGG-ID: 1MCwXPx6PYW6Ni2JQtQ3rQ_1745446477
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-476664bffbeso5273171cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 15:14:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745446477; x=1746051277;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X+SVN4y1JKQSP55HTLXPO4iRpA3jkVvTn+JT+tIaCQk=;
        b=impaZvTw5Ddm5R2aOW33+QmWETTnMRj6Jna4TtRDTc+U8T64axq4tbW3k91dN3OyVW
         QZyzx07g3PI0+t1s1v9JBrVg3m2JxosWM3C7s789sXVLca3+9fuXCO682l+JW3x2xMNk
         eK5acGh5Al7uTPH/IfSgRXcT/dLvhuCUc22Eu+AI0XoJVQlRBp57r00BCy5lYP1xla7q
         JGCg/ZuzhLPWWhpsAVx0GlCfXpCeOj5Jn4ZaFfkKfEthA8clpHAR3blmQ4OlsoptdPyP
         N6YUcGttapJujBAvbwNtPFyUcEgXTQFrqITsteXHNLJVB4n0Sx3TpN5cp7KcxL2OePq0
         kmpA==
X-Forwarded-Encrypted: i=1; AJvYcCVSNIQ5O2uA+xi/FMIyIOg+8kQUVwkv5NO81d8XSPHkKT8LThuzU/1WpBH1ovhTTx7kHtCyGzv8JIDK+z8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPNTjnWKawYfcCXGaFiaqxo6TuWiLCDY8m5qK4/ta4dTRuBMjP
	GyOrMplTno/ycWE/McvRgFp609XLMenHlYMkMcIhYm0UanF3V1fIu65kGoWzPX7yfgbaQV/UcL1
	tWAOqkFzhfuFiAofQX3edyMBN2CEV4MKlMDBHIx0yfTyGWGTm6gthkIEw94PtoS3lf443UQ==
X-Gm-Gg: ASbGncuHxQ+qidnBbr1nAvf/n3jqBTA7hG0gk6v+NkENwhACXktNxIUSfs1CQRgsgbi
	fa9Xq8aIshWGRJ/YO+YIz95TOKwO4DNMLfpsSmphUd4R3kaCCasD3wQ/ZjSzhcb7pVF6ul/GTzK
	R87K3+fsfyk6s5foREhVqC2XGZN2Yxffr8qkR4q/cAkyMo/00+Tl160l/fZLrJRoe4McLrxc2DN
	vPOt4fsRNsiLaE39C8mx26MUt6QR1oTJcUFM2PnQS6mf4l1xvwMMRcEp+gZtNkgl4yW/Sc73azy
	2Hc=
X-Received: by 2002:ac8:7d96:0:b0:477:d00:b46f with SMTP id d75a77b69052e-47eb52b3fdemr2212331cf.43.1745446477113;
        Wed, 23 Apr 2025 15:14:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQUt9OkSCwidgJV/Cvb/1qDknNRPIdRwt+RzGozQl9XpNN2HI+ThdD0/kcioZXw7xqh3K5DA==
X-Received: by 2002:ac8:7d96:0:b0:477:d00:b46f with SMTP id d75a77b69052e-47eb52b3fdemr2212111cf.43.1745446476829;
        Wed, 23 Apr 2025 15:14:36 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47e9efda31fsm1710991cf.18.2025.04.23.15.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 15:14:36 -0700 (PDT)
Date: Wed, 23 Apr 2025 18:14:32 -0400
From: Peter Xu <peterx@redhat.com>
To: Marty Kareem <MartyKareem@outlook.com>
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"shuah@kernel.org" <shuah@kernel.org>
Subject: Re: [PATCH v2] mm/selftest: Fix race condition in userfaultfd
 dynamic address allocation
Message-ID: <aAlmSDSF9E23z8Qa@x1.local>
References: <Z9rQU64AAnrGlATV@x1.local>
 <LV3P220MB1815E7BF036FFA1B1D19D38BBAA02@LV3P220MB1815.NAMP220.PROD.OUTLOOK.COM>
 <LV3P220MB1815EE1BD144C6613F164511BABC2@LV3P220MB1815.NAMP220.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <LV3P220MB1815EE1BD144C6613F164511BABC2@LV3P220MB1815.NAMP220.PROD.OUTLOOK.COM>

On Thu, Apr 17, 2025 at 06:18:55PM +0000, Marty Kareem wrote:
> Hello,

Hi,

Apologies on the late response.  I was on a very long leave, and your email
by accident arrived right after I left.

> 
> I'm writing to follow up on the patch I submitted regarding improved dynamic address allocation in userfaultfd tests. The patch aims to prevent race conditions by keeping temporary PROT_NONE reservations active until they can be atomically replaced with MAP_FIXED mappings.
> 
> I sent the patch through git send and I was wondering if you've had a chance to review this submission and if you have any feedback or questions about the implementation. As mentioned in the original submission, this approach makes the tests more reliable, especially when running in parallel, with minimal performance impact.
> 
> Thank you for your time. I look forward to hearing from you.

Your patch v2 doesn't look like to apply to akpm's branches.  Are you sure
you generated on top of a correct base commit?

Meanwhile, please consider sending it separately instead of replying to
your other versions.  You can send a fresh new v3.

Thanks,

-- 
Peter Xu

