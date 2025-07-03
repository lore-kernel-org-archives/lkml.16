Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803342E03FB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 09:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751536032; cv=none; b=fw2N1WHXvbF9tU0GzkhyQz5epR9f2pV32254Wj4LjIRg2tkUG1LqkBI3JYQsve9riKEnR5qVVmWgXLStHfHF0YCGfOb1Y5L4tjTlp5pAPLdy5ww+Nw20F1B1r42U34OkWrN7BZesNpikRuI2C4zhE1bjZmmPpUHiVm74QWKKnvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751536032; c=relaxed/simple;
	bh=vAUqcE9WHLgFLocug0JQgsHfQyTephzjFLwqPNC07jQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jt3z5lkQGjhXgUa5ewyyPyg8gx4WpRRgG3NGVURwuPpVoqw9QxSIO92ngLrjlkIZj1KVLMrWkDgrm7d8JDb4N4IkmXZiU1MOWHzNw5eyQBXtTxvTSIGeXfCJY9qlvjAif3rKbKjTCXdaL3Y8IqAOEEXV8EanjQ+mn2gaK4CSYW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TBdPgt8e; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TBdPgt8e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751536029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RdONWkev/uzh24ec7UGP8PGlZlG60mDJHMOgMeP9f20=;
	b=TBdPgt8ev0KT/H7Q7M0MN7XtypnoOQLOVmWta2qalBaJYeGa+iQr9R/L8vPEYk7qJu9JLv
	+bjXVofNEBWAQ9QWiO0hT32DzR4cJ13LRINqQsMkNV0xgvfPuEwIHC17Rp/gqCs8wa7+u6
	Hqj/HohXtuqOCqlvIVqkhbwZNQ/v43Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-137-VYGpuGyaME61nidEdrfKVQ-1; Thu, 03 Jul 2025 05:47:08 -0400
X-MC-Unique: VYGpuGyaME61nidEdrfKVQ-1
X-Mimecast-MFC-AGG-ID: VYGpuGyaME61nidEdrfKVQ_1751536027
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4536962204aso22108925e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 02:47:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751536027; x=1752140827;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RdONWkev/uzh24ec7UGP8PGlZlG60mDJHMOgMeP9f20=;
        b=n3naGLF7dw1Q3ZkDBlAaPdbUYAzzBinsFU/H3PACi0CJM37UNij4M3MUZ3+PW6iXao
         qMGpJByfOh/MssVVUVHylR4KTfgLigiF3eIpN0mgg/U4IyP+sLfrofshW6y5QeCZvxsb
         QPVwbX+/eT4egLWEbTnCnBlOjeXldjiwduMbngrB3bJJ6YklW4xrFxE0Ph+KacZilVDj
         ikPd1Ngu/zuXw2WZRRDhQLHUusAddl9ZwfxzCKblWIMfYXejakmEzEi/qBMSCuCPI4kB
         F5D3H1uMfGQxhuyFmcydj0TiRba4ZH67thgUMRVpQ/WOh3ySAySEGRO5RNIUVEAX5eMZ
         sQWA==
X-Forwarded-Encrypted: i=1; AJvYcCXBtldhX7kBKF8ryrCldz/P9QSd5xwXZ97REDJclpGAmXLOxPBvicceK4OD+WEevTpDxveQsejb2ZTLfHY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZVMBztPWla+1V/dj1E08ZIy9/1ciMVCbYXrXr6pnt9aDRLkZv
	6mdwQvurtU6xch2oIUNcXsWD7mVr2zvIjh/2nu0sBTczUF5lxI3w6yr81NNBDCTpeVPvlDFZJ9W
	Ap29wJb+l2qFPkXC+9zZRkDMvMVU4Cn/WQ9IRPpK0Q9CTLJuwEpGWy/a2x6fLtG5SFg==
X-Gm-Gg: ASbGncvAQDXCGhy/JswdJhjQzydkPcZfU2+rnvxHQZO29QjQqyd+zAh6IelW3+TygN+
	zG1bk1Ev7VKm55n07f8Cj87OvuHUI4LkuNIl8wCjEZ0mTM4YXA57hF/Kqk7GMGQVsyisOwdNqnX
	sDhIfxHLMlEdlqAHmHVIC7XaBTC3o2fTci778+kwEtw6ln9daqDdx6tEm2zuMPnGH4JNhhrFj4Q
	5bVEpHZFpIuGhEgOKbWzte38Gq2vIs64PKsXlcYecYy/jY1nnAJSRJ/X8xNvjklO6muf/PHGpZg
	73fqJGVzVK8wvk47OO11hbYYk5IlTOsV8uzwQ6BXnbJarjXNGnZSByOvUDK56XqNJjo=
X-Received: by 2002:a05:600c:3f0e:b0:43d:160:cd97 with SMTP id 5b1f17b1804b1-454a3728d1dmr56455935e9.25.1751536026750;
        Thu, 03 Jul 2025 02:47:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTquN2HQ6ykNf+B6aChu4ZLFvBv5XnqVUeKx73fDJCojdl+3JrMQRzkT7i5t5oqAJP5BLuGQ==
X-Received: by 2002:a05:600c:3f0e:b0:43d:160:cd97 with SMTP id 5b1f17b1804b1-454a3728d1dmr56455635e9.25.1751536026306;
        Thu, 03 Jul 2025 02:47:06 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:270a:b10:5fbf:faa5:ef2b:6314? ([2a0d:3344:270a:b10:5fbf:faa5:ef2b:6314])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9989328sm21313015e9.18.2025.07.03.02.47.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 02:47:05 -0700 (PDT)
Message-ID: <509f34f9-5eee-4ba3-bd09-dfd2d47df0bb@redhat.com>
Date: Thu, 3 Jul 2025 11:47:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] selftests: net: fix resource leak in napi_id_helper.c
To: Malaya Kumar Rout <malayarout91@gmail.com>, edumazet@google.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CAE2+fR_eG=eY+N9nE=Eh6Lip4nwWir2dRQq8Z-adOme3JNe06Q@mail.gmail.com>
 <20250630183619.566259-1-malayarout91@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250630183619.566259-1-malayarout91@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/30/25 8:36 PM, Malaya Kumar Rout wrote:
> Resolve minor resource leaks reported by cppcheck in napi_id_helper.c
> 
> cppcheck output before this patch:
> tools/testing/selftests/drivers/net/napi_id_helper.c:37:3: error: Resource leak: server [resourceLeak]
> tools/testing/selftests/drivers/net/napi_id_helper.c:46:3: error: Resource leak: server [resourceLeak]
> tools/testing/selftests/drivers/net/napi_id_helper.c:51:3: error: Resource leak: server [resourceLeak]
> tools/testing/selftests/drivers/net/napi_id_helper.c:59:3: error: Resource leak: server [resourceLeak]
> tools/testing/selftests/drivers/net/napi_id_helper.c:67:3: error: Resource leak: server [resourceLeak]
> tools/testing/selftests/drivers/net/napi_id_helper.c:76:3: error: Resource leak: server [resourceLeak]
> 
> cppcheck output after this patch:
> No resource leaks found
> 
> Signed-off-by: Malaya Kumar Rout <malayarout91@gmail.com>

Lacks fixes tag and a target tree ('net') in the subj prefix, but please
do not resubmit, as there is no resource leak even without this patch as
the kernel will close anyway all the open file descriptor at process exit.

/P

