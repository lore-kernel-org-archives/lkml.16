Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A19A2080FD
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 15:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743520795; cv=none; b=ScKsug9hQbxQOP/0rinFiQ0ju5VkXULfAe+Pyu3wdzInu5dC4ryhucsTbrZbPrTPQEmF+FntsLa8+HSaBVeSby5/8NF+Dl54nOKxdEkCk9TzTz8zV/9j1QWfD4V+3NMyuHcXIbP7qxxtklsrcdnnCta3ot041hJIgcOKb9vZeqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743520795; c=relaxed/simple;
	bh=9RX2MhL48qiAun01P3LgrVxPQPk3OXe0hAHtALtiNuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fnrd3lDUbrrLcCsoEkS2udE1Go9rjHPN+JS1zaSNW96WHZPNK9V7mdu4uE9JudrZysqxhaB+qZQkE7xaBnIgO/RZChZaS3Z7pXpd0pIprtXpC5BwP4kSQeYnM0s4mj5FL3PkG4lGgqdqwh7rhM0AmIc9XrXJDKD+vHLAT7MpA2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=ZYlBPjXY; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="ZYlBPjXY"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6e8fc176825so45498686d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 08:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1743520792; x=1744125592; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9RX2MhL48qiAun01P3LgrVxPQPk3OXe0hAHtALtiNuk=;
        b=ZYlBPjXYFI1m3N1t1KL+bFTjZFcrJM4vGBtGB6qIz1Fw4LMbc28T69n5XpJgnHvIl0
         T6o+XAVMkY6YiSo6GxiOJc62lgLlSDGaIUFdH6JQpQ4NZF7FL1R814OCsMbXuHlnUS06
         YqSDp0UigPqldJ//Bfqvh3PieOirhtlj6YE/CkdlBeyTE9w6FuaqrPIM8R4M+pKGGhOy
         aw3Kzmb++DT2FVrVt20cGvZxkvqCmocrdNH8bG8qNs+1rowd9Zv1FL00j/ZFk9LjXuIN
         830nTni+H1tmOSWomHJicdiwSKF/V3eLYxLF1ZoW7qo8DQHlau1nIelGhljAE+V9fRUM
         6o0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743520792; x=1744125592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9RX2MhL48qiAun01P3LgrVxPQPk3OXe0hAHtALtiNuk=;
        b=ksvdoS+6WaNEl9Cxn7dLpvldLYy77Q6FiIFVV18RPpp23XI7BEbpUqx0/QiclTwrWm
         SOTNpg7wEAHN6N2yWS3I58JGy/ZmmxlBfhcetCUj6bzClJwF6mYSGbPbebF2C3mU85u+
         T4tCuM5yF+Klk2XiqIdbKJbrnJyp9IhfNCntqjUqfbJmBKanH1G01gXZ5aVta7dn3gaa
         7kbnfWJGX2tZ8PtPdMwk7/Xb/bmioa+gE+C6/eUK1l8uLlA7RlFaaG0qbZohkk76H6k5
         gxyV9bv8UEGsSDPH85tx3AbkUnYNpzgWCJl28bem9Eepu0dpEKZO8x3m6++IPUc6A/iM
         UneA==
X-Forwarded-Encrypted: i=1; AJvYcCVXOXcsptVDye2OxLKV1cqs3WJ8QcP8g/wc8r9DbHVYT1FRBxJy4vN5exhMcHCSZkgIP2SurmCzHkBjkAE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ+QjJDvhOc1Z1nraRx6auwcyJosA1fbJ7CchtNBwF8KBeECwG
	Hy2XykypS4BSTUwk/gygVninWgszw86NaMe4fPTIEz6Ks9k+9nUbZROUpuMp6D8=
X-Gm-Gg: ASbGncvBok/ZuFNI2LHkcltJOgx8aXsH9vbGp4lXwk43NfdFbxsuGyOKGLLwiqg+BIm
	BqMLq/U8Qs7kDci0YHfxKGwsWdYOQH1FaxMtyUXPcbGSTFx8SdIFdEB3iNS+0VsOXSnsPMvpnI8
	x+bfjqdpS/FQTXrFGo34FGg7qpqfDoTEMEMA9Q2G5mqnLCfkIFi2W3h2kaj6ViGaYXmI99d586p
	8lmWO33I6ac/tH6/ZsCHIamHL5qJMXJT78SCnUWOWpT9BQFJK4Y3VpD5eCtlXlJv290sD0FRSR6
	/Pv3288z06yiJKXzLbjzWn8WgHUrz/NUYYhR9KrTxudDXx1ut4EOVQwiSMhnTuIYICwChxL7+In
	AvNUhiR+eep+wRUTjhuG6BkA=
X-Google-Smtp-Source: AGHT+IH3zCk5MmZmXCv7ZuPqcRLbba65JHJK5uzLaCAUKvfGgXjHj0hYugrFbyOE/Zo8jfUORYkHtA==
X-Received: by 2002:ad4:5de8:0:b0:6d3:fa03:23f1 with SMTP id 6a1803df08f44-6eef5d9d049mr52040406d6.13.1743520792422;
        Tue, 01 Apr 2025 08:19:52 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eec965a18dsm63016516d6.55.2025.04.01.08.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 08:19:51 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tzdP5-00000001Lxl-1sHc;
	Tue, 01 Apr 2025 12:19:51 -0300
Date: Tue, 1 Apr 2025 12:19:51 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: akpm@linux-foundation.org, jhubbard@nvidia.com,
	kirill.shutemov@linux.intel.com, tjeznach@rivosinc.com,
	joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
	lihangjing@bytedance.com, xieyongji@bytedance.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH RESEND v2 3/4] iommu/riscv: Introduce IOMMU page table
 lock
Message-ID: <20250401151951.GG186258@ziepe.ca>
References: <20250318035930.11855-1-luxu.kernel@bytedance.com>
 <20250318035930.11855-4-luxu.kernel@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318035930.11855-4-luxu.kernel@bytedance.com>

On Tue, Mar 18, 2025 at 11:59:29AM +0800, Xu Lu wrote:
> Introduce page table lock to address competition issues when modifying
> multiple PTEs, for example, when applying Svnapot. We use fine-grained
> page table locks to minimize lock contention.

This does not seem right, there is no need for locks to manage a cont
bit on the iommu side.

Jason
