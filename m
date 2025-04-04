Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087821A76AE
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 10:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743762616; cv=none; b=TS2iJ1PaqN63ke/VFn/BnTHfzcoH1St1q9hl2+43ZdaK1OCJupc+1i9LobZeSfwuWV2ZGROpS1yP4NaYh2UfhALIJ4jge1JbP+92YWCTq2QFrOw4/14OqgX/w7SfDAwIhFXCK1Y/PxovDNvnLAq3xbuIKhZtfh3IU5m7hNcK7GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743762616; c=relaxed/simple;
	bh=Jnm3SNeDPY10Q0mQMbLx+uVmDQAAO8BKaaZ3pKCNKOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QCVEtZj4Cr2XOVEE4acCv8iJaL6BXq8i9xfTwWLllRTlP1rbURSji7F0Z1B0hUEafNhAXi5d7h+Isv9yW+DtqG4Sqc/TMp6sdMYP/hJ+vlPGG516Ye7mEa7lKsQc4VimspodRJ+wRXIRIYaXbCo4RHCXPaxNenj5LQ4FPZI/bks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b=W/TyADkh; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b="W/TyADkh"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cfe574976so12803525e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 03:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1743762612; x=1744367412; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CMK7AiVAmQ13rPWb5TPToJIdxeUpbsGyWlsCzKZ+U4M=;
        b=W/TyADkh1PKTEAZP/tORYyjZRsaLnf6RJMpnmlefDK7DxkFfHVOR9IwHCxtV4ZOIjO
         0e79qfkZIZxP5AaGu1+OFZIQbSFDNVtjpEE3WlnuMxZGn+rSlzDqxwSMhlXB3dIrL8M2
         D95uDpG4bZkCRDHcHnSLzYhsj1mRXZGMHvon9h6dpG3oAEll2iOvy5DjPdUvs2bfGjTP
         KSdlSXqT4T6Oe2eVM76hT4U/PjtNgti+1RuqRj+zpw8deGpIwOq0sgynS7bVoZqqlvTZ
         s4JoOS39nt+9PHFDMCHyVyNoD/OCD1zF5QqKG/Ff2izwdmqbi6VQDurlUMVim/TCH5y8
         DHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743762612; x=1744367412;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CMK7AiVAmQ13rPWb5TPToJIdxeUpbsGyWlsCzKZ+U4M=;
        b=D3KiE4ymn1rnmVaqhz4UAZXh5YHZ5oWu8lWK3h6fzWjX0nf826KeESHiCu6ZK7KC1f
         BwPTFjruBa3+aSO1ULFHjeQIi+EC3Ye9bvwJGp8kIW8+0+2YMRV5aaK716GS/2tBEnou
         wNi3ZvBcAMh79UaFqj3qNE1gwGaaJmOPKgpH16daIzGbBIPhC6LSlY8HZA2pMolk2ZVM
         0oQeo0UmB5j0MlEz+4VgrzfoQe4FoDaeGnKFdFjpBupbIQcrTH9Y0CnRLOi1mzPk+3xq
         OGOyRgVu0MRdxa8ed4J7+EhdF/Xw1RplA/h/qUC+rcv+ASNSQS9jBIKnvXFvjqf3rQm0
         +Skw==
X-Forwarded-Encrypted: i=1; AJvYcCWcWgq/7xryGuuTIUNnHTXcPtPafptiUPE+PrRTx8Z9LlLfoOuXRmmCFzEOFmAfzH7f4XZt0FiLvT0gY3g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9POUAmGVpgGCAHlaPWVygH7YFHT7ZwFp+uOfs7ZJ71MQhtI8c
	CDxvSx3rlCRJBk4RhJeUaDLg20O0GoPjwXNZXk245gOWfYdnbmOiD9g6M1FhZjo=
X-Gm-Gg: ASbGnctXFOou1eGBI2RMIp+AbPwZPXJ+SIT07ophSwY8q4NLF392zet6NDQmnxdJ4AU
	dyjlJR5eztE6L+FHrE1LHUcYvb3hX0CgbIagE59uRd07YWD9Jc4ISBYUa4QP5wn8A7exWKMGNbJ
	r1YvKSWpUpW5P2WqLvQm5iV89NQdLl2O8jFyTPE1T+FWLT8IbQbe0Fiv+l+N3Q6JqS10lop7gEU
	BuI8hSxTai3DKWFOLCE7P4SaF6Dil3ycyBod5StfVz5EVUOluAydS6QUf60YXmHTNqLdU6I+SgF
	pIRMgdf4SWEoPbZdUpwgoHF113QK3yfZbu3sY90Zz2f1ApZfZGp9X+UAkkAmrulZjQaqgXew9Nl
	0
X-Google-Smtp-Source: AGHT+IHDcuoBi0zXRLBGMhr23rvc5D92TbkiRjVw3vqzvuPIUT8bKi7xRmZ7MxsqaFITZlX/YgKMJA==
X-Received: by 2002:a05:600c:1384:b0:43c:e9f7:d6a3 with SMTP id 5b1f17b1804b1-43ecf85f526mr22847775e9.13.1743762612015;
        Fri, 04 Apr 2025 03:30:12 -0700 (PDT)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a727bsm3984418f8f.27.2025.04.04.03.30.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 03:30:11 -0700 (PDT)
Message-ID: <d5d28034-66be-4ec5-8e79-a5b61bd24a6d@blackwall.org>
Date: Fri, 4 Apr 2025 13:30:10 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v2 net-next 1/3] net: bridge: mcast: Add offload failed
 mdb flag
To: Joseph Huang <Joseph.Huang@garmin.com>, netdev@vger.kernel.org
Cc: Joseph Huang <joseph.huang.2024@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Roopa Prabhu <roopa@nvidia.com>, Simon Horman <horms@kernel.org>,
 linux-kernel@vger.kernel.org, bridge@lists.linux.dev
References: <20250403234412.1531714-1-Joseph.Huang@garmin.com>
 <20250403234412.1531714-2-Joseph.Huang@garmin.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20250403234412.1531714-2-Joseph.Huang@garmin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/4/25 02:44, Joseph Huang wrote:
> Add MDB_FLAGS_OFFLOAD_FAILED and MDB_PG_FLAGS_OFFLOAD_FAILED to indicate
> that an attempt to offload the MDB entry to switchdev has failed.
> 
> Signed-off-by: Joseph Huang <Joseph.Huang@garmin.com>
> ---
>  include/uapi/linux/if_bridge.h |  9 +++++----
>  net/bridge/br_mdb.c            |  2 ++
>  net/bridge/br_private.h        | 20 +++++++++++++++-----
>  net/bridge/br_switchdev.c      |  7 ++-----
>  4 files changed, 24 insertions(+), 14 deletions(-)
> 

Acked-by: Nikolay Aleksandrov <razor@blackwall.org>
