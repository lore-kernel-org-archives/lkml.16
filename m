Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7536418A6C1
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 22:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744583110; cv=none; b=Mdqze+wEUFBWTOo8PuYZDv8iey9arFnDR6oNMIAGJhxDNQVChkT5wDuZfvqxsruJmMVvIww9PSaEVuDmz5iWBEcBByE3zqdflU/ax5BX3KyOMgAwCqT2Kk6t7KSWzxpIatx+fhENLqOGhGbntgpj8zp+Lhs5N7Xxccy5FUSKlI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744583110; c=relaxed/simple;
	bh=Gizu1aFLHyQdngFQKElR0rxLH/XIqmsalVTV+uU1JO8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jEwl9N4P/AiJK72k6lhjwf2OHebZ+q/jrLlXqgxJlUoSoh3xeu8/a3CTSMSS100dGGMHGC2xnlGIFtXfh+EqSns/xlXTC0Ba0UwuhaCSuEJl/h0Yz9QS8ejPfYajQDUsdFRM1phu6uoM88OM5Fc4gK9x+H7xD6/nG+eAGUkp25g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso39131995e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 15:25:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744583107; x=1745187907;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ejC5tJyZ0xM0rvuE/Sg8ufgATqtMOj49Roier3KM3zU=;
        b=O/Hpu6fSEA3rsIJ+Sf6OKSsObIcTONTYMlGvd2tzf9QkzbMXffu9XcPVyrMXxtnTMX
         YEhjO9CD6Ho8hVqW39Mg5UzKnqEog1aEzO2OHky6JoCvRWmzV1GBMujn8Q0QhVnfD1Qq
         WhTnuVHC2Ug8VoNx9EICt/EKT+WARnuHReEm41KSv0zCN+Jn2dAtqAx9axQwlnqaXCx+
         h8BxnCcywJtb8dKwJAv3PAMGUwH4Jozo+UlSSY+J4NpeIZNJV03Mx0dMUSfjYti5TCJd
         JK+vw0LgtiNqs0zsF7D/XEfpxyToufHPQ9Kc+F4U5FhIV689BrDWWT1/LcTEwcAbSW1b
         uIYA==
X-Forwarded-Encrypted: i=1; AJvYcCWTvbPuqaoBmqsfZ3aNpILxlEvMrHarTEHCfk1JH3yYET30SRED6xBrumgxp/vWL4sIXqYTOyM7tgrdtxQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzA6HD4KxGNxiBD+t7bTakOEAeKfVxWHhix5lPgb+qZDz537/os
	6boc8dKPKE0/LFE1oGNeog+5Uo+zCN2XElsuv4yAMLEVIFRHEMSA
X-Gm-Gg: ASbGncvzAh9cCauWh+wTOCfOkN8hVI4AdolcI4h5gDt2iNT61bsu4qr8PxKqVNFwdH6
	QcJerP11hCvOBhXTNC+NuWdyU04/pTXOb4oR4c0F1275qseRfOGiPKSpUkd2vcerBHC22LL1Y9+
	wuAMv8lkSPZqahoaajhy+Kfr1WeBF4PDmZ3o2EbJaoWtm7BGcTW81gKhPlZPqrBipmzkWheNGGO
	j02xfRW9sk611I3Zzl7v5IT1TEyJLYty0GA34DqUA4IS+/xVjVaNpfVcim2tMUAeIOIExak0sER
	nbhtwCQ0TkucABXtJJJFeWjhuC56h8YW5xhGeRcQbapSADUD6AFz9W6z1p+M5ucj2gd7le8k
X-Google-Smtp-Source: AGHT+IFDa6oa8AKbuuOybOyorIXpYHtApbZ1c2qleFIk+2Nys1atNtJtxj4H+ggw6Kswx7zqNVvGXA==
X-Received: by 2002:a05:600c:3b86:b0:43d:db5:7b21 with SMTP id 5b1f17b1804b1-43f3a9b4865mr71187775e9.28.1744583106456;
        Sun, 13 Apr 2025 15:25:06 -0700 (PDT)
Received: from [10.10.9.121] (u-1j-178-175-199.4bone.mynet.it. [178.175.199.47])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f23572d43sm153797975e9.31.2025.04.13.15.25.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Apr 2025 15:25:06 -0700 (PDT)
Message-ID: <2d9257c7-de3e-42ea-a947-25e394146f57@grimberg.me>
Date: Mon, 14 Apr 2025 01:25:05 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvme-tcp: wait socket wmem to drain in queue stop
To: Michael Liang <mliang@purestorage.com>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>
Cc: Mohamed Khalfella <mkhalfella@purestorage.com>,
 Randy Jennings <randyj@purestorage.com>, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250405054848.3773471-1-mliang@purestorage.com>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20250405054848.3773471-1-mliang@purestorage.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 05/04/2025 8:48, Michael Liang wrote:
> This patch addresses a data corruption issue observed in nvme-tcp during
> testing.
>
> Issue description:
> In an NVMe native multipath setup, when an I/O timeout occurs, all inflight
> I/Os are canceled almost immediately after the kernel socket is shut down.
> These canceled I/Os are reported as host path errors, triggering a failover
> that succeeds on a different path.
>
> However, at this point, the original I/O may still be outstanding in the
> host's network transmission path (e.g., the NIC’s TX queue). From the
> user-space app's perspective, the buffer associated with the I/O is considered
> completed since they're acked on the different path and may be reused for new
> I/O requests.
>
> Because nvme-tcp enables zero-copy by default in the transmission path,
> this can lead to corrupted data being sent to the original target, ultimately
> causing data corruption.

This is unexpected.

1. before retrying the command, the host shuts down the socket.
2. the host sets sk_lingerime to 0, which means that
as soon as the socket is shutdown - the packet should not be able to 
transmit again
on the socket, zero-copy or not. Perhaps there is something not handled 
correctly
with linger=0? perhaps you should try with linger=<some-timeout> ?
