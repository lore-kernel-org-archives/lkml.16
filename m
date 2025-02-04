Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CEF20AF69
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 10:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738666564; cv=none; b=Rywm2/oQ6YpEH3831K8BEJeO9aSXkWTjZmveK9COQC3+C+Ntl/t07Zk+gCjsF6NZiY1L7r8Zqm2Nx6rXElf8sRabhgTbsymqwdcjeusJV1IjmIqiXWCHHHZlUSpa8qeSHWAqkHiB3g7JntUeLXr9HT+4jpjeCKqhhKlgroW4L6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738666564; c=relaxed/simple;
	bh=4beXukFVHQs5nCd6JCJWPrisRK6PKYiJfHKwE1xknk4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=njw7we060gZQZAFoUApksz8RfF5WTEDUsWVUstmB8VddpT53W0Pqq4pF9PxF2TQkG5F0ar/U7tcOZMqRkVaPwrucBLvLIAnlMPYNyn8k+oj4Q3es/jgGZL2RwjfvAshDSXFb7JwdgmPxL/OsJLasMw148e1h/VsUS/es6SNcznk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J45efOV2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J45efOV2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738666562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4beXukFVHQs5nCd6JCJWPrisRK6PKYiJfHKwE1xknk4=;
	b=J45efOV2yB10gJHZmgAX/gyK39kiWyyT/lh6zJxLCxx41GfpkVdMGd7SF57WD3FkilFRRt
	UvIk3KWLlh9MDn4lEum8uVHDz5YKufeNI4kUTE0UH2eNRuc3541GgzngnhOCtIvEQJ5MV5
	YbOV4JvKqLILngWoiQr8/rt4rZENWtg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-170-iyCdmSUbNOCtMSU_4pYNaA-1; Tue, 04 Feb 2025 05:56:00 -0500
X-MC-Unique: iyCdmSUbNOCtMSU_4pYNaA-1
X-Mimecast-MFC-AGG-ID: iyCdmSUbNOCtMSU_4pYNaA
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-438e180821aso28289765e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 02:56:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738666559; x=1739271359;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4beXukFVHQs5nCd6JCJWPrisRK6PKYiJfHKwE1xknk4=;
        b=jat6Bw8kHdHDgP33kdQm5XdVo3kHOsH1ZGKXqLhq4nr+tjRmF3WPB6NwDx7V3WlYVa
         8VlYQe2m3LSE2uftswpwsYmTbXKyo2mjDVZYtBu4lz2t1WUCXvVTFAdtOLZlMHX/A/oH
         vl5HrGmsa7kw3Nl54TdMBsryoagV24XobUa/gco7sYy46wtcBAXtdvaZTCU0TmTI9kwW
         BaXW65oI1/0VLrvTSDSTAdEGUM61072nWAR5B517Djn5L4VCCAuoV5ZqqFkV4vEMogmu
         ZWdfy4yCoDTV+5/fg+yy2MlYi2xnjdlOsoVvTpAJnjcdo5OSeFNgPnCFxQ0eZuqwpUtL
         ydKA==
X-Gm-Message-State: AOJu0Ywir6Hn8KuJFePJe9P7oQb6pvbrgeZtjmGSymWPXEXAcLV3VTIf
	m8+gv6MB4yUiuNCHsWdpPxev3qw1lfFHA6fFgUP1FPzmruzkqgaufeNrFvRwb9BR88wqF0oqFfE
	52yP3LCVoGiPeqiJ/cCNdhNjCL8Wy4nxFgnztu+gMTsD5NqHR+C3sOGORjwvMhg==
X-Gm-Gg: ASbGncuRHEglOzJ+4UhwqQCnATdiOWaNUH235VNd12kHrjKgomD8Ngoz5KVXg9v06tg
	s3CO6l2kARF6ylOw3DVoSs2p7o/UNmCeSh9hiB52M2sATnodD/zOMaW+fdxDKo6C0l9mWPYez+P
	WY2aLMLSBH3vLcoMHXO+HfJ89IKv3JFoL7uNDoLHE0Kgrondbp7/UcECdGXm/XMZw7QibDf1Dtr
	LGFNUoHxr4R1k5eT9qcmjajDXZejJGy/ajenlxxEC/99ZhviAdj/Ty5hrZdanjofNYnV6gvWT69
	th4YTqEwXpFHZUASkFEXTfrYYrHAYk1CQtU=
X-Received: by 2002:a05:600c:a04:b0:436:e3ea:4447 with SMTP id 5b1f17b1804b1-438dc436a08mr231815215e9.30.1738666558936;
        Tue, 04 Feb 2025 02:55:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEPKWXjdX96lQCIbHeahFyYNkKOqGVKxcOxbbsF5GMJwC3hZR+QmB4vaH/E0IBr/11HWe+7+Q==
X-Received: by 2002:a05:600c:a04:b0:436:e3ea:4447 with SMTP id 5b1f17b1804b1-438dc436a08mr231815125e9.30.1738666558603;
        Tue, 04 Feb 2025 02:55:58 -0800 (PST)
Received: from [192.168.88.253] (146-241-41-201.dyn.eolo.it. [146.241.41.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc26cefsm220335895e9.13.2025.02.04.02.55.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 02:55:58 -0800 (PST)
Message-ID: <835481c6-0ac1-47a7-84b2-fa5a135186c2@redhat.com>
Date: Tue, 4 Feb 2025 11:55:57 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 02/10] net: pktgen: enable 'param=value'
 parsing
To: Peter Seiderer <ps.report@gmx.net>, netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Nam Cao <namcao@linutronix.de>, Thomas Gleixner <tglx@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>,
 Artem Chernyshev <artem.chernyshev@red-soft.ru>
References: <20250203170201.1661703-1-ps.report@gmx.net>
 <20250203170201.1661703-3-ps.report@gmx.net>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250203170201.1661703-3-ps.report@gmx.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/3/25 6:01 PM, Peter Seiderer wrote:
> Enable additional to 'parm value' the 'param=value' parsing

It could be language bias on my side, by I find the above statement hard
to parse. Could you please rephrase it?

IMHO something alike:

"""
Enable more flexible parameters syntax, allowing "param=value" in
addition to the already supported "param value" pattern.
"""

Thanks,

Paolo

