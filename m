Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B42118E03A
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 17:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738947760; cv=none; b=KYSN/YHzfc8Pq1qQhDFrJED9vbXabivATbOta6JJDE87tgunwjfL6qaGdrpdlzbffPZfN0e6iy7LWZ7OW3qq0KMLrnPT/o/UG6/BlB1Yka2toCYS3kjnb63ptPiKO3/aVvaWu1RH+xEaFyOL9X2vb8kj+BibPcc/qXYoBC8bTOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738947760; c=relaxed/simple;
	bh=M+O9C18J9TDsrtn9ygBQi2moURCD+M5fRkIKJLNmNxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GZhQXmC6qgUkUDxFSBFGSpjawIVXDtuXflTNonWuLg5AsD+RwLrt8ZO2A4rOb/2TdfkxsQpwlCVUTOW2Polwt7FlVHrAfZ9MuWOgfvQOKCl7PKjsPvBHwhaZp/sJb2eX+Nm8V+dq533XuOyZNKoFra6bOvMfiyc+HbX81LCfNZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=blt/I/5X; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="blt/I/5X"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21c2f1b610dso57677685ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 09:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738947759; x=1739552559; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rywibxB4P0UxOm27bdG2YMzPN91p4Wq7QrOrZT5kceE=;
        b=blt/I/5X1OGUlyUvFAZKvF25NIe2vjiox/Egu+TipkSlES00Lv6pDpLnKjeRYjaszN
         sYCb3dselH7FljbEgaMpGVD6Q+lw9bAkZyG/6Z8/V3MtZUljS7vqKXzsR6Njs6O5Gsqm
         vo6NQa1c9ztY4kHphRMIGVl3FddO3LiB2cbIwmugraJN1DoXx67G5U8rvbxwPJtgkJRh
         Zm/HfkDgup4e62ki6IRUS8zgeAxysrZnMZccsXLNmK7P60lFE6qUP0gNa91opM+z/jLN
         0BaLkxGtLbfd7BrOihnOtJ2dnSFvtM0JJfuGJvDAWHH9fzav3YxkK6XnZ0fF7fWeB62s
         S2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738947759; x=1739552559;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rywibxB4P0UxOm27bdG2YMzPN91p4Wq7QrOrZT5kceE=;
        b=Ul7T3NubcFCkYfMHHxNnRfYeANM4mx5DMu4sn1/gRk1A2Y8huBZuQb8lDdeSNOIGE5
         8ThapyfUCvHd0un1IeJ+/Vn8K/nckmvbL/eJxBUd19Blf6Dx7YbkDAUyNfXuDQfeccyG
         Ud25x1WHQ30vGe3Y7f2q4vqfwufUjIV4A69tz570icXcG9khetUyTHz6U+yE5HFUwLXH
         /iJir8JJ6QvL3t23OXPhqBURZSC9iZHPfvZBYVFTSlvur3Dig5cpRLOn2Mk8/WX//zYs
         yW5A1TuzLRR8Pv+vh1DrHkFuSykWe6dspyKXJkQ2fuCb1Ynr69961sFV48D4xDIgKWMM
         W+1Q==
X-Forwarded-Encrypted: i=1; AJvYcCW+uuve/in+iklMPooZgyofFIpPH+UE1s6hIAXw08qEZARkOefynp5hU3Z6yBmcE1h3g1U9A/pf7fRcc6Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzN260NZZjT3ceKGMAgUYj9OumZy948Etz5clQywoVNXjfyprCC
	QCOcfqX1qzNU3Hnyjxz1DaXULrbcSIHbFaemzSjZ/mco6DdQZvYtMtg6TeJh5Q==
X-Gm-Gg: ASbGncsWn5wW5J51PRy1yu04t058JNZum/m3dUaeT/5kkRwLVCzjtbgkJ+ZASAM8UQt
	IjS/YH+mFRxmHp0iE0y6AItTXylH4mmUeq0o0RagQUuaoof2f/JM5i6EIqNKqqWijC7uTblxEW/
	AM4C91RoQCwhs1/frYhlQtYAcogxPffjNcO0pp5P0lo38hp/+JWVMhyO/6PNTyxNNvufaPqrwqy
	y8rj/fIsRalq0acXnDFWO86gqawPohusRkT4wO3bY3uSXEo6MqpezBKFBauI017JWkvbKifV9FR
	PHcYU0tFmHFnH6nQk/0K0EeUvg==
X-Google-Smtp-Source: AGHT+IF+5sAnHX5mqvTlJ9cr8EhXaxBIvoy2AbYyW6DPwIIxGnNU6p8DQD6XKoRE3E/2PxieJLgHVg==
X-Received: by 2002:a17:902:da87:b0:21f:3abc:b9e8 with SMTP id d9443c01a7336-21f4e7c6aa8mr55271435ad.43.1738947758661;
        Fri, 07 Feb 2025 09:02:38 -0800 (PST)
Received: from thinkpad ([120.60.76.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f365616ecsm33083075ad.100.2025.02.07.09.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 09:02:38 -0800 (PST)
Date: Fri, 7 Feb 2025 22:32:31 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: "K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	"open list:Hyper-V/Azure CORE AND DRIVERS" <linux-hyperv@vger.kernel.org>,
	"open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS" <linux-pci@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] PCI: hv: Correct a comment
Message-ID: <20250207170231.kpwk2z2xoqr3czqy@thinkpad>
References: <20250128190141.69220-1-eahariha@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250128190141.69220-1-eahariha@linux.microsoft.com>

On Tue, Jan 28, 2025 at 07:01:40PM +0000, Easwar Hariharan wrote:

Even though the patch description is not needed here, it is a good practice to
add one (even if it duplicates the subject).

- Mani

> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> ---
>  drivers/pci/controller/pci-hyperv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pci-hyperv.c b/drivers/pci/controller/pci-hyperv.c
> index 6084b38bdda17..3ae3a8a79dcf0 100644
> --- a/drivers/pci/controller/pci-hyperv.c
> +++ b/drivers/pci/controller/pci-hyperv.c
> @@ -1356,7 +1356,7 @@ static struct pci_ops hv_pcifront_ops = {
>   *
>   * If the PF driver wishes to initiate communication, it can "invalidate" one or
>   * more of the first 64 blocks.  This invalidation is delivered via a callback
> - * supplied by the VF driver by this driver.
> + * supplied to the VF driver by this driver.
>   *
>   * No protocol is implied, except that supplied by the PF and VF drivers.
>   */
> -- 
> 2.43.0
> 

-- 
மணிவண்ணன் சதாசிவம்
