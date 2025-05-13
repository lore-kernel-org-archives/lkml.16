Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9764429CE8
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 17:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747155798; cv=none; b=q1h4Qt07pOTDEcG78MlHhmB0phDxHpshp3ubMz65QCcaUQJ/W5zyAcJrRzGr2zoAjoOK5ASGNW95rwxKKzGpHxZFT4pmyyZtX50pz6j6GY/X7WqssaKJeHgejtoY7aG+mvxa+sc0ExhxrHAJqRD05NpNkX0qBKBcWq8bKvcKIkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747155798; c=relaxed/simple;
	bh=VFsDnDYBrkLeb0pJM2+Q4VNLIuoHpU3l2zV9LB1h8Xc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OqAYwTCFX1iEGJQmlyO52beyW4WNyoopkWpYEnj16k9GizzQSFh2CkTU2OvbnP4IkkGduxA0IYTWSyqeLn4WXB268K+U5Swh6gKIDJ/ZNI08xCFXoRQHKKt3xBENMibWqTw6CZPTzYcJYIvFXqZ0VDxQrj/AfsxvrSsKw3WPdGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dpVTqo+e; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dpVTqo+e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747155795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=i7zh1JRnSPoooaox/WAw3Ac7Mq/UQR9pr7YO9aBTb3g=;
	b=dpVTqo+ew1y46e4EHZe2sw1BPPU0d1eJgKwKJCsM02Peqasx1GSYN/VBgKZf9P/MVkzjE0
	GoM12ln1Aq8aK71WyitOrLu2El5sjOp9iFJb1Tx69BN7QOcugR50NJCgbKW0BMclwmupJC
	CkFjFwwFss5U+oiB7GQ8VbzRLWoZIR8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-83-D8SYkMuIMs6Gv_E2JldWYQ-1; Tue, 13 May 2025 13:03:14 -0400
X-MC-Unique: D8SYkMuIMs6Gv_E2JldWYQ-1
X-Mimecast-MFC-AGG-ID: D8SYkMuIMs6Gv_E2JldWYQ_1747155793
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-442cd12d151so40309315e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 10:03:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747155793; x=1747760593;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i7zh1JRnSPoooaox/WAw3Ac7Mq/UQR9pr7YO9aBTb3g=;
        b=OMtm+cTqPEd8Znqwz+e0zoFGKV+F/voSKwgDCVoCzthQ1CJHDtj7ykl1Wmxww62Mx4
         5DuT+nIZ0jY/xdd2sOXDYRnv/z17lYTesv1Qj2zcHFYOORWEkG7FXIcQGAkCAV3DbKL1
         VnDXCu5l6XnbRrdcR2IbjsENrN+nO80atZg5At9mBkJWExl/W4+NnpXyTduyQzv/ZJNn
         DcE2w2NAToBBtbE7VaSk7HfsYecSNFlhAhKe/PZDn1PIzrj0qQXq+H22161SuGMsSfQn
         ayMXjBhJ84fSGRbmuUrSyFsL2wT+QZBigZqLVKaiTs2+J7P06B/slw+IOp10ZbKzw/d1
         e4lw==
X-Forwarded-Encrypted: i=1; AJvYcCUN3gr2S25yFEP8r0dDGUZh6WRxAraVF6KCXbHt+poKqtY+2cklXWL2x9d/ZgKSR77txB5D7vLO6UCvAAA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUynZ74viaehZnLdl/2jRmzFJ1hQBktC47zcrb9yaSLCYY6Psw
	S9RyYdwZ8mWvo6InqC+gXyTIlquwySZ/xttYN4Tb3f2sapN5tYzJLUGbkrEyTuISKlR9P1rqyNn
	mrds1+PpaBnXwYuKgxvjbOI4I1E89iILhuAC/cAXqMLv7D6gKFgpmbj7YFp0h/w==
X-Gm-Gg: ASbGncuJMTERfRS9I5zygEz4oTDWHa8inm2sP5qfX+oPZ7BWMKQTu4hqTXLqnBShhFi
	M+iVZaXCIYkTAsgEfSCZmqekkX+DSno5hxTfKmcOkTWKdJpLQGAib5nmA8w62QxW9pqdGdMGN/W
	I4X3nZeTaTOrDjdovz7YgWmD2DquU5xvTMdTsDyo3wIZ3uTPupQdNn19QGDA+Ii9cRF9msZfNUD
	UsvDkXrnpvt2bNIggoMXh3VsLNE/0ElVK/ubyPTxz4bGpkpVRtdkCvY3Fdl+bHibtFVh50aaunO
	kL0yfQxvaA7pXQjnlAgJ5Uo1lE124seFBSab1YHcgA==
X-Received: by 2002:a05:600c:3b0a:b0:43d:7a:471f with SMTP id 5b1f17b1804b1-442f210d5e6mr978995e9.18.1747155792865;
        Tue, 13 May 2025 10:03:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZYKr4H3MkirQTc1Q4yocuvC1+AeUoSGIcrnL10kCOG0aAw8W22St9EEKSa4JMsxqubKYiVg==
X-Received: by 2002:a05:600c:3b0a:b0:43d:7a:471f with SMTP id 5b1f17b1804b1-442f210d5e6mr978535e9.18.1747155792407;
        Tue, 13 May 2025 10:03:12 -0700 (PDT)
Received: from [192.168.3.141] (p57a1af41.dip0.t-ipconnect.de. [87.161.175.65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddd2dsm16833742f8f.9.2025.05.13.10.03.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 10:03:11 -0700 (PDT)
Message-ID: <b28a74a6-0875-4977-8f24-31d4f440bcb3@redhat.com>
Date: Tue, 13 May 2025 19:03:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] MAINTAINERS: add mm memory policy section
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Zi Yan <ziy@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250513160007.132378-1-lorenzo.stoakes@oracle.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250513160007.132378-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13.05.25 18:00, Lorenzo Stoakes wrote:
> As part of the ongoing efforts to sub-divide memory management
> maintainership and reviewership, establish a section for memory policy and
> migration and add appropriate maintainers and reviewers.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Thanks again!

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

