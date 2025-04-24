Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E032192FD
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 20:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745526905; cv=none; b=HkEHLNgwyTlhuXICUjg72k03K482WVWqnGDOT5we32ISauZwMNj2921J4KHMjO5eUjGSePrjN3/I2pT0p2J/4kLY2j7YmlWZpeAislRgSrtpLf/N2qCv/jrJz6cTG0LWt/coZxdu6VXSZEdY74dg2oMAPu6aIo6NABUWLv1xZt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745526905; c=relaxed/simple;
	bh=jSjC9SfPANCOzria7D2lHrHooCWI4xM4A3WfCVt7AT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qm5zPpZxNaagtFzubDHPZ5IYrCjrM9EJa+bW7vZQjYH5v+buBbUtG8r3mIK4AGd9dOjQwWTFHfiAgVJvQDmHe9HNs4wpTId3Z3aU9kxP/0cKoR4rwK17nmsgTSGXVXmldaW3RoKEIINZB9DSPhsnyX0T6bLCDtciBEO6SXkUXQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NTnf67x9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NTnf67x9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745526902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xnfOuiokG8UriFtp6o5bPUjeosoHbQjbxkbjx1qQm9M=;
	b=NTnf67x9bomAx/p785KXW5l6Hvkhtk9FRXZR7l1zHgoj2xwi9ob/iO5ZKuxSQEuzeFXj7r
	vgTJBN6OYFWXpv8NnL/s8s/6rpEdyBWCcEhNdyhftBD6H6wMojAy7jnpeUD/rvRIpQLDGF
	Q6RGhnWjwKGstjrk9w7rIwU9LNoJTLE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-3FjkM-q4NkaVZRlIANUNzQ-1; Thu, 24 Apr 2025 16:35:00 -0400
X-MC-Unique: 3FjkM-q4NkaVZRlIANUNzQ-1
X-Mimecast-MFC-AGG-ID: 3FjkM-q4NkaVZRlIANUNzQ_1745526900
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43ceb011ea5so8959925e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 13:35:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745526899; x=1746131699;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xnfOuiokG8UriFtp6o5bPUjeosoHbQjbxkbjx1qQm9M=;
        b=Kpd9GyuICWA3pdYo0vtQed1y1qzmYwpCfFd6zxbpbus3qbKo305lVnSzqH7ZV0iNKB
         DR5t22yhZLuLnoC0q/1m7+L9LVDBIBElIihZjVJNF546BK2zCr5qiszgYZbTz7ESF2E6
         lpzB+FS7JvJPv8194DVqPiJJRG5UGxbqnQaxDGH8jBVKUV9XQTsWsI6JNzyWei1I0eVG
         6b9dsYaAu1ARG4qE+J1XLVEKKnZPsp8BPeigBputd0afy993g1K4z3qDlkWp8ILhML0p
         lrOytxNZSSJpkUi4ErDThfqXa9AHzUQYDn0BaC99oBI4si5+cn8wvpzZcBlz0VNTXOWM
         fgIw==
X-Forwarded-Encrypted: i=1; AJvYcCWe2rqaEE7gidXQYuYRzh6NDLdc5fUdrdEz4W6Z/8ofZ+Yts3ijaFWQjS8IdxKy3mOlwk1UD0jS6F/Rffs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7xoWvhBLs7zHcT0ugp80S+RnwfyQ398pMiGa3jwoFes+Y9cOk
	HP6ipOpjN05zrnqAmc6KXjngHljUVlr++6txT6a8oe70gPb9B1bXbNpxVWcNea8LjRKAydaHfGC
	rlVhBpkm2UtugTcagB3uOARy4gn/S0ffI18UUWJN2hagxabYaWbP1lMgxmXkWrg==
X-Gm-Gg: ASbGnctBL9Y4h4RnWw63s9xtQdpN1cvbP0gaRZwetyePaCoJ7kcXEqty4hm3P+OUCZQ
	VV24o5d/xwN4rd/rlYoCS/sBkhAXNez/hUfAZQhorfZyyRDA5ZvK9Bq6EYK7ov8Hs/d3et+V1E2
	rlthjvYRol36baIVydGIDqFsScoRyhzW9zczwSvGWdQqLtA77vUgELOY8J8tWdHz/NHtU/sO8dT
	NN+DdOaB/Hd8kB2YnoAB8ZY0ONYlvlYHv1p677ODihUXqcFi2O8kE3Y2HzOvBMsY2sEMcaYyPwx
	6b6s3ib/JisbvdxBJifbSfyhvDhwiU3yeMeH6cB7ue62ySIZaxuaNZPzZYpUQLXV4x8DhW5/Q/d
	dTVSPFZmOiitEUrCFI4RaN3oRi3K5IGhBajVD
X-Received: by 2002:a05:6000:2905:b0:391:3028:c779 with SMTP id ffacd0b85a97d-3a072bb3d29mr578502f8f.45.1745526899661;
        Thu, 24 Apr 2025 13:34:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+GQahLpkXHKCgEIIQXZDPLJngQYHw2SgAkytx5e2BTqGshAsthJzlU+O5eV4uktqgky5e2g==
X-Received: by 2002:a05:6000:2905:b0:391:3028:c779 with SMTP id ffacd0b85a97d-3a072bb3d29mr578489f8f.45.1745526899275;
        Thu, 24 Apr 2025 13:34:59 -0700 (PDT)
Received: from ?IPV6:2003:cb:c74e:ff00:f734:227:6936:cdab? (p200300cbc74eff00f73402276936cdab.dip0.t-ipconnect.de. [2003:cb:c74e:ff00:f734:227:6936:cdab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5da0dsm252905f8f.88.2025.04.24.13.34.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 13:34:58 -0700 (PDT)
Message-ID: <390f3d5e-8da6-4286-b8a9-72eabcc3abd5@redhat.com>
Date: Thu, 24 Apr 2025 22:34:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] prtcl: introduce PR_MTE_STORE_ONLY
To: Yeoreum Yun <yeoreum.yun@arm.com>, catalin.marinas@arm.com,
 will@kernel.org, broonie@kernel.org, anshuman.khandual@arm.com,
 joey.gouly@arm.com, maz@kernel.org, oliver.upton@linux.dev,
 frederic@kernel.org, james.morse@arm.com,
 hardevsinh.palaniya@siliconsignals.io, shameerali.kolothum.thodi@huawei.com,
 huangxiaojia2@huawei.com, mark.rutland@arm.com, samuel.holland@sifive.com,
 palmer@rivosinc.com, charlie@rivosinc.com, thiago.bauermann@linaro.org,
 bgray@linux.ibm.com, tglx@linutronix.de, puranjay@kernel.org,
 yang@os.amperecomputing.com, mbenes@suse.cz, joel.granados@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 nd@arm.com
References: <20250410080723.953525-1-yeoreum.yun@arm.com>
 <20250410080723.953525-3-yeoreum.yun@arm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250410080723.953525-3-yeoreum.yun@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10.04.25 10:07, Yeoreum Yun wrote:
> PR_MTE_STORE_ONLY is used to restrict the MTE tag check for store
> opeartion only.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>   include/uapi/linux/prctl.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
> index 15c18ef4eb11..83ac566251d8 100644
> --- a/include/uapi/linux/prctl.h
> +++ b/include/uapi/linux/prctl.h
> @@ -244,6 +244,8 @@ struct prctl_mm_map {
>   # define PR_MTE_TAG_MASK		(0xffffUL << PR_MTE_TAG_SHIFT)
>   /* Unused; kept only for source compatibility */
>   # define PR_MTE_TCF_SHIFT		1
> +/* MTE tag check store only */
> +# define PR_MTE_STORE_ONLY		(1UL << 19)

That is the next available bit after PR_MTE_TAG_MASK, correct?

Would we want to leave some space to grow PR_MTE_TAG_MASK in the future 
(could that happen?)?

-- 
Cheers,

David / dhildenb

