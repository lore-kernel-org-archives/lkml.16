Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B3D20E310
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 11:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743076655; cv=none; b=X9SRjhP7B5O/aOCHmgeG5OcZvu8mXzgXuxtbrBP/ChF36gG1gjS8fpWlHgSsGCaaVXRLpkaq/hbk9tw4pgAw2RQoyvfR9jbsOpMueRlyyNgzRA9IkmCWP6nBI4h3hEvOK2w0V880VTJL6bEU2J9ZTLT2i/qXNPZOE9r4hgDVzMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743076655; c=relaxed/simple;
	bh=AL7gJ87a2UA6E+40BaZ+E4mdcf+6HZXsmDjrJ7tBF8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jA61VGeeWoQ+G2vwrxN1Pw4rOPI3ojtoZ/38ud5klWERVVlCLY0zmezAfXi6+cqp4gPOTWDRBY5QP8tg37KR3duh/oo4MATwlaQVpid1fqIgopbe6YZ76gDT+Ev9I7Rhcs1898IWmzLaDoCPop1RHO8gNyVdz2zVezBZh0+Epdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=KdUG0aH3; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="KdUG0aH3"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c5aecec8f3so159060885a.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 04:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1743076652; x=1743681452; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xpSvo5VpDe+5C3l3q6WN5wiD27fFfcYVq0S4jyx0P6k=;
        b=KdUG0aH36qKf4ZKce21gUhCKT3ZUf2WNoOC0rZa2gRbutluZ0jCSFAmnnC+61A2sd0
         Njdrt1Nj2fXg43CLfCF44LW9ef95MhDEJWEEmBMehuOBXiRYdTiM30rWbtrMY/aWEGLd
         rYjBgTZlgpvZjm8HkNrGAcL/EbG9VgKscRinhah3bTwjaG8M50uvOVXNokIPSnt+2lkx
         mhlCuyeeTnoP/Xsk0vjebjmQA7seF6lSHIkFYpP3gnAknC14p/N9vvbD+gURC8OIj2bA
         LqbmNtn1g9Wn3vq/xXgwbUBfBwXSqyhktBciKekra4S/rYXgxaWVSGCpYbJtPZPWTipD
         /eJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743076652; x=1743681452;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xpSvo5VpDe+5C3l3q6WN5wiD27fFfcYVq0S4jyx0P6k=;
        b=f9RdQ66yJz/GYPx8kMvJXrV7uF0rcWemZt1WRj4cobEdGbYwc0e3j2XEy7Tghg1g2w
         ejT368052mwGvdxIOmEbc32J8lYtS/UniA+B6WvJ12iT8dSNsuHTqgcPUP5uSDBXNgP/
         VrhyOFxKPID1vpG3hHSCcZGmNdPYQU6RVgDREu/xhcrFnpdM8ClsFB7ICgLSs1rh4iO2
         dDzYErKHK8+VxFuDsQVYJxCTjYJsokKrcHvEWVdtJ/MBChqITbUsWtxaV1pYUSUgwQ8v
         EK4svPICNa/P5+TOfhW7JExNoh/IzrmeKgmVE2DHmg/O5uVXbqYiV2ZN3I3/fh0tXH+R
         G4jQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgO6Q0OyBzNziDU5T3P6UYKxNnPpTqS7zxYEbqu5BIG6k/purG8GesrtE+lC0Auzcgo1HO8cXuIVpEe3s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTg/8AT8n8BTUR2md0ODAO66AHU9BIomHFNiZ8YzW+A+1gAfPG
	90N7NHUNNnisZ+LRak0+FQSx46s3zo4NYDZm9mZwOLOh+SQZ2jTdZ/pDzydEXio=
X-Gm-Gg: ASbGncvF52YGgMQ5VlVHpQT0qtlYiyTdWoLdfRLu7inSxhnv+c+x7fsZMU6xms0WxHY
	tTRQ/pU3YNO9X+DWJxpYA8Q1+4PLPxArtPJRUuQPpjNXio+8AXK3S9LszBa/RhIq8gs1FSdGy5Y
	/YcqgPkxd4SfkNPNCTiOV6usa2VSi/oyES2pkxBG+Kjf4duSDIxBB2SOcVb3ZgQt1N+w3hB6LrK
	HA9c4qLU+VFzjzmyIPKn3wBv+23fL7rATyThoNZlbuOr3qs43JFusCgc3pkr3pOV36BNsEEDGk5
	V2fmrrK2ZXxFnteK2E9NgbYWvXkKQVsJPGWkraI=
X-Google-Smtp-Source: AGHT+IHXYc+blwEc+1Jk6K0qq58ubOvP6uoSjfLzJ99a9D1oWzuzwHQ5UPYlNMHK61Rbx4L/GoX0BA==
X-Received: by 2002:a05:6214:19e1:b0:6e8:90eb:e591 with SMTP id 6a1803df08f44-6ed238b72cdmr40938446d6.24.1743076652436;
        Thu, 27 Mar 2025 04:57:32 -0700 (PDT)
Received: from [172.20.6.96] ([99.209.85.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eb3f0003c6sm79108206d6.120.2025.03.27.04.57.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 04:57:31 -0700 (PDT)
Message-ID: <2853aff5-9056-4950-a796-d3e19a0f0c5d@kernel.dk>
Date: Thu, 27 Mar 2025 05:57:30 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mtip32xx: Remove unnecessary PCI function calls
To: Philipp Stanner <phasta@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>,
 David Lechner <dlechner@baylibre.com>, Philipp Stanner
 <pstanner@redhat.com>, Damien Le Moal <dlemoal@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Yang Yingliang <yangyingliang@huawei.com>, Zijun Hu
 <quic_zijuhu@quicinc.com>, Hannes Reinecke <hare@suse.de>,
 Al Viro <viro@zeniv.linux.org.uk>, Li Zetao <lizetao1@huawei.com>,
 Anuj Gupta <anuj20.g@samsung.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org
References: <20250327110707.20025-2-phasta@kernel.org>
 <20250327110707.20025-3-phasta@kernel.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250327110707.20025-3-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/27/25 5:07 AM, Philipp Stanner wrote:
> pcim_iounmap_regions() is deprecated. Moreover, it is not necessary to
> call it in the driver's remove() function or if probe() fails, since it
> does cleanup automatically on driver detach.
> 
> Remove all calls to pcim_iounmap_regions().

Acked-by: Jens Axboe <axboe@kernel.dk>

-- 
Jens Axboe

