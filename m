Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4132329A33E
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 18:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748026724; cv=none; b=iCN7aBlAPfbsx5vmrZcQ5SQL8w42CVftpCyZnQeUUPlEXp8F9pSSHGJDaapAJNNKi8Lt8znNtnSz3B2p3bOG/kB6btQ0vunkwacs5yDY7QOb0DJgfP+xKHr1pxexITAyHC5jn/qxFogPSvryFeh5lsxome/XKgxKX1k9/9QX1yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748026724; c=relaxed/simple;
	bh=LPX11ulev6vsiZzUTJlFx9XAlmtcK4qqUesuzNzoNS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GBAjjSkzo6bJGyv0IB9+CbIlEHOahXDZZFDpXzyCQgpgqIA3/7MGOnI3BjQxGwHU1EDm8GL4j3ioMPoVJhNNzC7qKpsj5+2zfWSUMaMtrMM8jfPwx7AsYygsjEbK1oKPAyFd6U2yQDhCSSYml0GniFqgu9EvIS2ebKTR9Jz/rrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=QOM9uUV0; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="QOM9uUV0"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3dc978d5265so1148665ab.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 11:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1748026721; x=1748631521; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j9H9/06xSR/EO0urvzhakeUTOG7Si+ArWVJ43pvHHEg=;
        b=QOM9uUV0WD6CeftzAAzSAKvQq0AIicTQCFjBmWcx4Sf+gPalBml8w+AgauJlZQX03Z
         2iJ68gYGsEdOjyeQ1zsvYTxLcxBWSNSpdfRjIIBedIMBeEko0h6NWCVDxuwAys3rFGgk
         AGTh6dxiQpQDGPLZhYBnZk/QeiakHx5VZQ+vg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748026721; x=1748631521;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j9H9/06xSR/EO0urvzhakeUTOG7Si+ArWVJ43pvHHEg=;
        b=usL25qIIDTUYLwKrcO31r4+uk0JupSznn6WvKYZID6qADwT6i2Hn2FguDNKeG4+Wyl
         F6QsphEwDFwky4NLXmt9Vw2aECEPDxVRRUDn1wZGLeITJRKLIazbcwRDwAElHbX0OMLx
         NLhB3va9Qn69rmHILXNN0E81l+8uDrUe8NmvAPu1VHCqZdZyJhhLwVuLiv9WR1K1sFdy
         C79NP/eyFUPZagJxGtiznMugL2J2n6OAfouiJVwqIj8hed4oi2tVtXWcCYtjTDGliOqU
         4XZxAtufskcnvrNTF7j7x3U05v/9NKVAB1qP3/FGRe5tnSXTETxBfMK6Es48oUIswxVG
         Zd6A==
X-Forwarded-Encrypted: i=1; AJvYcCVsGVsQuCG81v8WdaP7H8VD2A1Vlnbuj8CtrYMXBulxR3tlyWnyQjyFvqbP1aq2USfVLHpZco3DpTwLJH0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+e+hOH8sfrL7l3NpM/CRwmNynmhOfgTMtnYV9W4A0PymWR4Xa
	tfb8MRfJf3swoj6fnC/xmRJtOWRLXMmZLLCJL5OHO8Ln9PIQIv8kD7sjx4Pxxdrs8Q==
X-Gm-Gg: ASbGncvbB7qb4WGBFH5ejnMtADyR+8OZpFHhMJuSvMB8xZw6fJVUiKttAu4rZhAtTXw
	9JCERgn9RsFVVjQMk4rVU8avWfXHv5NRDm4Q8XTkdxDVJwRc9GbjxFkAq7VQP2oDctRNEBKUhkg
	yLZvP0XV1g/y5RJnZQo5BtgX5Xp1rJN2KL4W1vCla8iFaigVPehKeUcOXJOu+MbLccnB4YAPVo9
	ZFb7BQOU3A46jjx265BKfd/TOqKE+2/WMK2DSziV+vyLj9pUpL9dirqWftexx1pWxVVXqv7T6h4
	ignFY5is/dJqmHEBLnNQd7QX+yDlmtSmKC+mnjpVljjkCq1FMz/4jc1WjCa6ibGPxdwYmEnI/d8
	Pqi87b6EkHw==
X-Google-Smtp-Source: AGHT+IGg84kIi0IDmJ6WLUU9PxQzn/IS+LAqvSr+ETXvi6WXzqyA+Lt8CEs5YfPUjKQBchbbqZ6n2g==
X-Received: by 2002:a05:6e02:3802:b0:3dc:90fc:282d with SMTP id e9e14a558f8ab-3dc9b6e5684mr2325875ab.16.1748026721187;
        Fri, 23 May 2025 11:58:41 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-4fbcc48c8c1sm3769482173.90.2025.05.23.11.58.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 11:58:40 -0700 (PDT)
Message-ID: <a47ceee1-6530-4f3d-971e-450069ede557@ieee.org>
Date: Fri, 23 May 2025 13:58:38 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: net: qcom,ipa: document qcm2290
 compatible
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Wojciech Slenska <wojciech.slenska@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20241220073540.37631-1-wojciech.slenska@gmail.com>
 <20241220073540.37631-2-wojciech.slenska@gmail.com>
 <7d33eed7-92ba-4cbb-89b0-9b7e894f1c94@oss.qualcomm.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <7d33eed7-92ba-4cbb-89b0-9b7e894f1c94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/20/24 7:25 AM, Konrad Dybcio wrote:
> On 20.12.2024 8:35 AM, Wojciech Slenska wrote:
>> Document that ipa on qcm2290 uses version 4.2, the same
>> as sc7180.
>>
>> Signed-off-by: Wojciech Slenska <wojciech.slenska@gmail.com>
>> ---
> 
> FWIW this needs some more work on the Linux side, the IPA driver
> currently hardcodes a reference to IMEM, which has a different
> base between these two SoCs.

Everything currently assumes the IPA version dictates many things.
That works, so far.  But a lot of these fixed/hard-coded definitions
(per version) could be changed for specific implementations--they
just haven't needed to be.

> The IMEM region doesn't seem to be used as of current, but things
> will explode the second it is.
> 
> A long overdue update would be to make the IPA driver consume
> a syscon/memory-region-like property pointing to IMEM (or a slice
> of it, maybe Alex knows what it was supposed to be used for).

Yes, we talked about this last year, or the year before.

Konrad's patches to put this in DT is the right solution.
It doesn't matter that it's six months later.  I really
appreciate the improvement.

					-Alex

> 
> Konrad

