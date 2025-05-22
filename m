Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFE978F24
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 07:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747898550; cv=none; b=nt9Sj+RDXx64OaDcb11uEaX8N2LRdI9y+HKZ2OgZ96jMwulXEkRywrbgQH1CcKXiTLY2iZK09EKTQFTPOlLW1lK7QYXYBySCApFI+AmwoqGhQ9fV3e7auJQcuRVDOoOmu+pbWBNKd2KxRPgMAYOTgHBLCOnRXPHQn7DpofWYlPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747898550; c=relaxed/simple;
	bh=HunEHTYE3cSZTuUsAgx8yjTKBhORspedHL0uTDo5bhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kqCRw8HLMROq0/WHgvN5SxfGCaEZrxux5LlKLfcCfrFzA6NFM2GItE68JeT7bCwnnXXvrHltn3g6QXC4nl1yqZ5cyM4OtnujFHfVkB0SWc8XvulQSnG9H50/9Bpj89Ebb0bF+yweB6w2zjv8154mWTOmzY9Kq2lo2jaKRDgz0KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J5GYN14z; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J5GYN14z"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2321c38a948so53036955ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 00:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747898548; x=1748503348; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0FfnlbKUuYkszpwzUgwL6UeZTYGqOSljOnLXHv7G8Jw=;
        b=J5GYN14zhs7qQR4druXnzj0MSVxM1EDhqpfNtjonRJxSC12bRF64LvV52i+h+6IdS5
         fzhUr3WdHRP0RuwqNR3irfAzC4c/NhOnT2wO5/zd2BeMcHYZQQtI93ZN8EQjDrrxPb7g
         Rxy6/VulbQM/RUD3SmOWo4MzLC69H6dTk5MKxUs/SaQRMVS7QIu7vwVOmPXTVW4fteSI
         PQe3oNd8LOY0oR1r4sj5dyk/Ei/a4GZPLMtp28JFRBkyRUvv5NDqZE5LU4NQWU1X8lE0
         4GssBGbflQ3GGs6tGNN8qlT0JHyj5/ocBU9Zx3VPDcuqSUIJFRyplI3BOly+EeI9X9eb
         pD3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747898548; x=1748503348;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0FfnlbKUuYkszpwzUgwL6UeZTYGqOSljOnLXHv7G8Jw=;
        b=MvuXazNq40b1t+sc1iLtrZlXrDvm0y52ydJyPP7GRet4oRokgRB5UWr30qqqo9VYhG
         YbUMABxzipsbimqdrikE+BHJNI2pIvhj9yX0L8i2286qkbJg0DtoUrmltJS1WJTw7xLH
         SvxpKXWS23wjUwdtr496c7YW5jt9LA1x5iFSorgQoWasu3Hx2DO0RqDdFpDcgA6NRAZu
         N4RBFizjtm+g4lzbRReMNM4z6sRAZLCwWxIVPAaw0B/wQlXS0fePSGw5LUJj1mxzRWLp
         dmuKSHRQHM5drbw8MbOVLq3M/GnMwOE5qdlowxYVDRFit6tcX00BioqfMqKssjAGrDe1
         74/g==
X-Forwarded-Encrypted: i=1; AJvYcCUmKiRbuBj/U1/uNJ2UyVne6G8w0yVM6FrEimdlh0a6hpLUcdS43K9FCUXVt+48SrUntPy6LpUm9StyO2c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7MTqb5Bame4RLfHecG4HPWXDF293JqnR+0hfN0CWUbYlaMZW+
	3e2NXicWSxvb4dGlLWXq6sdy0M6WMCcMYREjc4YAvNorz63abWqZeNGl
X-Gm-Gg: ASbGncuh+WnKOaYRP/Fb6j09sPny59CAX/Rsh7Dc7o4ihNxnHKZoR1Nj3gaZ3QA+zgg
	mOBUO4cnXwQ2S1rIcujGQJpKRqfsAvLxF2PRTj1DrYjO0Ub2AgUoLQrVmV4UhyKK4bdwxX0IduI
	hOPuHyJN73MkrAYb6EkPQH6Z2xP31cwQEjXqzmO8eUaqiNSrWsl1zDH5fSniGEbwGTfyeVrS9ql
	g2g7S590gT+/E1CHk2RgT9fsOaUNZcbbI6qf29AUfajpl5wNNZJ4tDVmAXCAlZc+yC8QAcmbAuh
	DQ/4iK8Hq/UdKfaPvWMpfHaEAI/sSMBszyRLO2Z6qFgbbnjtbdEwye7N+KkeGfdwMDn9RkQSKxM
	j2Gl2wv7yA+CkNA==
X-Google-Smtp-Source: AGHT+IED0B4oRIBlAS3ZvbYdlU/FQR4hT1cK7dpgSdaG/Y2OsDEwUfMm+XniVmcaK9aU3Pzngq2rsQ==
X-Received: by 2002:a17:903:46d0:b0:21f:f3d:d533 with SMTP id d9443c01a7336-231de351537mr294721515ad.2.1747898548249;
        Thu, 22 May 2025 00:22:28 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebcd45sm102865165ad.210.2025.05.22.00.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 00:22:27 -0700 (PDT)
Date: Thu, 22 May 2025 15:22:24 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Matthew Sakai <msakai@redhat.com>
Cc: dm-devel@lists.linux.dev, linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw
Subject: Re: Potential heapify performance issue in dm-vdo
Message-ID: <aC7QsLCPEt9nm5Pd@visitorckw-System-Product-Name>
References: <aC3riPZ6GV/dlr7Y@visitorckw-System-Product-Name>
 <9501613e-e8e5-4734-aa2f-ca3a3e4ca990@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9501613e-e8e5-4734-aa2f-ca3a3e4ca990@redhat.com>

On Wed, May 21, 2025 at 02:57:26PM -0400, Matthew Sakai wrote:
> 
> 
> On 5/21/25 11:04 AM, Kuan-Wei Chiu wrote:
> > Hi Matthew,
> > 
> > Recently noticed that the current heapify method in min_heap.h may
> > degrade performance when the heap contains many compare-equal elements,
> > compared to the previous version.
> > 
> > In detail, the new heapify reduces the number of comparisons by about
> > 50% when all elements are distinct. However, when all elements are
> > equal, the comparison count can degrade from O(1) to O(log n).
> > 
> > I don't have enough domain knowledge of dm-vdo, so I'd like to ask
> > whether it uses heaps with many compare-equal elements. If so, I'll
> > work on fixing the issue.
> > 
> > Regards,
> > Kuan-Wei
> 
> Hi Kuan-Wei,
> 
> dm-vdo uses heapify for two different operations, but in both cases we
> define heap elements that can never be equal to each other. So I think this
> is not an issue for dm-vdo. (We have not noticed any issues with this in our
> regular testing, either.)
>
Thanks for confirming that dm-vdo won't encounter this issue.

We observed a regression in bcache caused by this behavior, and Coly
was concerned that dm-vdo might be affected in a similar way.
Fortunately, that doesn't seem to be the case.

Regards,
Kuan-Wei
