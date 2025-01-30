Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4261DDE9
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 14:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738246610; cv=none; b=Aq580yjuPab0dCHQHTLQZRi+3SfkDWA3z0k2EvQjsYtHnZp23Ybv+QN3rPwoxsI2tB8m02sISzpKpDnchX5bN+TQOgi0/jFNWYuQdQTEpg8qRoAPgKmDYJK7ny8qo0I0Ho1fWxKTZs3shLsN25L4OtI5WZbvDwF7YfP8cdk5xMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738246610; c=relaxed/simple;
	bh=eKFtaSi1HdST9VVRKgENgSCnuaaTdZ8+rnXRb1CzOrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jRcoOG2u+JF1bnrq7omRN1s5AiCQ+FVaFtJT2HnxFImLqQWyqWc032CFNGuLEnOuAk6+b7JEbIYFV6ZcKp8ZrLrA9+oAYyK+f5dFVswMDRKHsvtVHvuQchiI6ZRKqhuwgoANugGdcAsAoO+/yGPezMY6bdfGaszF5I2OJ0tObtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=MsIkWBNy; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="MsIkWBNy"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6d92e457230so7959446d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 06:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1738246608; x=1738851408; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dANM8Zs9s576kPdyfPzTz1kKsCDxnvejE2CxJSYcFDo=;
        b=MsIkWBNykBjqnUpJlH+uF2Y8AVA8zAweiu7G8vvuH5N/Or3ra5TFmOetF+humoyGQM
         IQu7f/uJY5j0wm91AZADSf8hdmLEklNA2vKTuT2KDAG+tH8+PYwZOzjXQTVefDtxtFhL
         1ujXis/OOojP4oZMlkvNCYeVfbbBr6Bc3RUluSYj7FkwD6Mr4omIgvbqscXELUcMdWyT
         Yf6ZHonKRkAMku6iMsRvw8MxErgpakq5dnhjNJx930wkDRBrWxMTR8UOat2O1FDzCJal
         xMZCxmSevVqBhgUVhWiQZeAXRuTeqKdMoTU8yzR0RZdM+H+IJ5PdNJXSGvzSYcIS96Vi
         BB9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738246608; x=1738851408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dANM8Zs9s576kPdyfPzTz1kKsCDxnvejE2CxJSYcFDo=;
        b=O5n0ovsq7KiwM0lKdnWVDgngZRVVfajzsoUFXkkW6ay47GLDA3ZQnBy2DtDjzBpFn/
         gZ//eDVTyAaW/QGhH8qKcbH7B0TUCZbpi/JsjeKOgny3a2oNxNQEShgyODvwysLRnMLa
         6teXU82s9hT0sSjcSUsZcfCh+Gu8XLMJx0dFCxz/0CPUCE8fK0y5qmO06zvhnCMypJBS
         q3N3N7+jJ9Gc45NVXFEvyQBHmvBRL8iqelA8+HzPlXzAY3VAX9/+EL+/WbAk7os/G3CE
         cBkmbWVrm3+mlmm7/D5+ojDSj6LO80PLz/xJ3imThMeAVNRsPMZRgDn6GvutO5Fa5hMb
         Xv3w==
X-Forwarded-Encrypted: i=1; AJvYcCV9cdbkEJjMbj+SB0S6B0gZP3TjT5suejakNrlK1kpeHDt0EZ3DU92m5xvH6xloFMxmPOXsozdAj7zUO8A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuQGuaHnF0oNxhz6uK99otiFBPazCTbaQwUfGOgtPz/Vkmo0Pe
	RLyPurLfdFWZS7LTUpS8kWxxdV6K+HaE0vfJBiOHmNMzp9GYgmPtcEC29d0BERWibK0yU30aLEH
	E
X-Gm-Gg: ASbGncsHjaxNEnhYVJrH7/yqj4R4sTusd/XBdlvKy9BSg5qp8/kVh8NiN1T3uA/02OW
	ZydwBAiqxVDd9zdI25TWaAPfZj3Bkgr96vKo/KmGFIEZ4hrhCPfvb2TcX3w+wiDzhcVPhOtr9e+
	KcUa56NoHyO2TaoMa/De+pKAjRUEpH8cbeZdI2Sn5odzQxSwoMONlfbbS/kK2zWfTi9KwWrcwsZ
	t+cMXObrHhZ92a/8shxmBKK9mPFbd8djI5H9t8XFU3rRvvyCzd0O0DQjIBQwMtwQhbfjNx0+mh2
	7H+GLsW4rUXAhNeBbXrtgm90bkkgRWMp/BqlMilxas1/bM2+qJLAyWNLYrwEvDGi
X-Google-Smtp-Source: AGHT+IHHBHiH5Qa9dCXahKb1sFmoeQt6qg2bkg8fltQLMSNrrtwlCR66jinyVsJRAPaY2qDwMvtwEQ==
X-Received: by 2002:a05:6214:248e:b0:6d8:a9dc:5a65 with SMTP id 6a1803df08f44-6e243c98d55mr111873236d6.45.1738246608197;
        Thu, 30 Jan 2025 06:16:48 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e254814405sm6609706d6.40.2025.01.30.06.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 06:16:46 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tdVLa-00000009dOr-1GlW;
	Thu, 30 Jan 2025 10:16:46 -0400
Date: Thu, 30 Jan 2025 10:16:46 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	"open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] iommu: Fix a spelling error
Message-ID: <20250130141646.GI2120662@ziepe.ca>
References: <20250128190522.70800-1-eahariha@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128190522.70800-1-eahariha@linux.microsoft.com>

On Tue, Jan 28, 2025 at 07:05:21PM +0000, Easwar Hariharan wrote:
> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> ---
>  drivers/iommu/iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
