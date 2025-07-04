Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05602FCFE8
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 13:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751637069; cv=none; b=iNdtS4+kwSRe8tD24R2CVrDmkrNEXzKk86uWafvUuiKwAg2SPcApOC+0NU8yN7u6eBSfTlZo4ytf+o0Edw5eU+dMgpbW4YEyB5P8fdyIyJHVBa/AaQmPpc9UA3waqRfL1t2KoPjL3nmmTV0DB8shxLZGWskJsobc9c9dPpxsWrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751637069; c=relaxed/simple;
	bh=+UyVNx3d2xsOsv3hlWbLcO0faItygFtG1VFebtg95qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H5gyX93ztPXu+x04ayiaQKZOImTgOxi8cNnNNxaKoWDiqnDplvVIYImgv8odLTS+wulaZEFcuTnLLSOILhYz7tf6OSOofgjN9N9Au4UTk/hj+qoVuLrlwEqn7etz7o6zISYE5PkV2CjqeNEX0l1wnoMd4CO60omraGKvWKiq/5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=cfLsj6No; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="cfLsj6No"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7d3efcb9bd6so95395185a.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 06:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1751637067; x=1752241867; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uYQz0SJHD/yO65tyydxbBaxqDOlxtpBqpW8dxJVOqUU=;
        b=cfLsj6NoyhBIdaTL8glE5jE7X5IquV8u7ZkxhSFgovpE1s6lfhOrV60Ysc7Xm4knQT
         9lUFcJ6K5EOS8Yf50AKEMCbGl0IUqMdvrtNuWB9qhjplZ1mRqcCrpzpXjJ/E8ifc1bvc
         mOAfhsI+lP1aFb0Dsp9JOgsAjKZQaLkS/GqYo/70nhSQBzyvkluCFQ7rz8GOML99P0M0
         e4Ry9bOlcJ/a+bcWDfFOVSAL/zMY54g2+a5AWlPppcgDPXFOkV5bYvJUB7fkcFvg5uXc
         ZeJUakWfV+rLNoBxmUhJydw7xkwl7rDbdmFhVZHAG1pstiw35CyriCe73S36UqK8PD22
         CRJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751637067; x=1752241867;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uYQz0SJHD/yO65tyydxbBaxqDOlxtpBqpW8dxJVOqUU=;
        b=pov6VYMiSsYR/EtLrIyNDqz7Omh1yS0t+1jwpZiK2fw33SMEGeeF+7AVVTf8P0WB+b
         73S77mmCBSDeGtkVGhEmmg1Sw0BzetwJNJtIDYzeHdRF2negGzOG/HHxnhXj3HrbqMuN
         jzpU4nUfTXTV6+BN0vrdlZHP8PsYWY+O4n1V6x3bARizQuxfDAcQxC7WHu+EgkCaN9Z+
         5e6SYER0Zl2PElwTxbX/HUZjloFGhlFsBSYDJAo5ma8MJ6OKXZi2VOouUvzC8fmm4eA2
         xrILN/l7CIey0UE9xYFEt13DQ6HGmAVfOj21vVrXZiKNPRIpGmicParpg67NRFbg62qM
         SxbA==
X-Forwarded-Encrypted: i=1; AJvYcCX0zre1iZWH/83Oqh2VeC8/YDOk/hRBOYjC03ZbD9u4f47ppRtKyc6kQ8Klu8aXuV0MkRGMEAUEnlOTBgM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJbrwtNfwp/wK/3/sQqUeQfTmQZjMCxULQ5wYiSmXcAxWfpa3w
	eTsHpcWO72bIu43g8ie3NUSkm4wvy4PocE4nYtEzLJSGPl+bF2DbZTtZgn5WoxvJ+w==
X-Gm-Gg: ASbGnctJlFdXazV4TEMMXUgGPdRdUANPOGf7Q8HNYwcmloEOOQtYIMGm5wZxfJsEe2r
	AR3eDJ6a9gAKA2UjbT8XNbCjaZ3MI9ketwLKA5AHIuNjXsTZy4Jk6+XRkK9IrifKEB0msTacWhk
	JzT3vl6E2H1cnQmBwM5GD/Mg2Wx2S92i1qRcIdaZ/TKzAN9s4Kkx/PmdF0xkIWYQ0LTxerSrI9v
	N79oCYnRNXurl0i7XZQ8NMmvKR0TVMC7tmVEd241zJXGcSVNozwqL9QaFqmwXr2if30IfJ31ikx
	d9mxenwM958tNvmx0tj3xym5I2lSDFhJpct9F7Vj2SinqYo4riHbdlcKJHgkAPM=
X-Google-Smtp-Source: AGHT+IGPrA4k9Zr2z8tw+Z35KFW9UzX5+1J5nLqm7+nyYdjjQoYkcLFbaNyTIqAXeMIcMfmr1ExyVw==
X-Received: by 2002:a05:620a:198f:b0:7d0:a1b1:cb0c with SMTP id af79cd13be357-7d5ddb7ada5mr262663285a.29.1751637066601;
        Fri, 04 Jul 2025 06:51:06 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::4179])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5ac60sm12583176d6.97.2025.07.04.06.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 06:51:06 -0700 (PDT)
Date: Fri, 4 Jul 2025 09:51:03 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: ezequiel@vanguardiasur.com.ar, mchehab@kernel.org,
	laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
	gregkh@linuxfoundation.org, mingo@kernel.org, tglx@linutronix.de,
	andriy.shevchenko@linux.intel.com, viro@zeniv.linux.org.uk,
	thomas.weissschuh@linutronix.de, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v5 1/3] usb: core: add dma-noncoherent buffer alloc and
 free API
Message-ID: <afb549d1-a7d8-47ee-83af-76faedbb55a0@rowland.harvard.edu>
References: <20250704095751.73765-1-xu.yang_2@nxp.com>
 <20250704095751.73765-2-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704095751.73765-2-xu.yang_2@nxp.com>

On Fri, Jul 04, 2025 at 05:57:49PM +0800, Xu Yang wrote:
> This will add usb_alloc_noncoherent() and usb_free_noncoherent()
> functions to support alloc and free buffer in a dma-noncoherent way.
> 
> To explicit manage the memory ownership for the kernel and device,
> this will also add usb_dma_noncoherent_sync_for_cpu/device() functions
> and call it at proper time.  The management requires the user save
> sg_table returned by usb_alloc_noncoherent() to urb->sgt.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>
