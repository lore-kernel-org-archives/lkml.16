Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDFE2DFF08
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 15:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750175906; cv=none; b=RdmCL94onlH9a/Pk3ix/zk7j0bx8UmzzngNMg5QbAPKTVkY/c9QT1wb3oq9EfBUTZ9gLpKxPX8doZv/z4A93/VrtnhlXkEnLWPjKJ6/PoyH7mZrn+mp2hkJmz6jB0LzbqAghM79/01/kEvUr5S22zXr2+nIZp2xvIVb/mVxNMak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750175906; c=relaxed/simple;
	bh=hqAmW2+tkDQoBFUTnquUpaKj3CzkKyd3cuJ8lhWF2fM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aXUJ/+1uOT6yUIAPMx2X5CLek+4N2dA3itk7w0YPE5Mdj0AKl4hmPY6iWknScDZk3I4IrnwYWF25c3CH6U/BUP8CzwWMRz6xkjnIf9CLD+XHyyTHDT+p2Lud3RUwXZxitUJ/eYFCeqjWT8BnBYKajcpUGpim7FwpLqNHzq1sIfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=QHHvi1J8; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="QHHvi1J8"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7d0a0bcd3f3so660377885a.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1750175903; x=1750780703; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5QVoUfdHdJ48HnCFe+0ux01ldLUN4WiVyX0euOzInBM=;
        b=QHHvi1J8WlnjQCQmVzs1Q2bgXI50wYIJ2CtBxydw8JsbD2ts9AXgc/bdVoJ1TVEIVX
         9lx6/E46+fUhvJu3Jqllird2ffekFWg9Ox5KbViSZ22TmRLDXMMQfRsyr3DpBplxp+Mj
         0M36uTcDlFFiNSbPMIm8pM0b3SmJCEcOZFr9Ngrsa6eeYARa2A8q2IcnRpmjGAvawmKQ
         pa/YTqUVjmq9ihME9jyLyiHJsjv+TKrapuutLSCoS/+hm9oxVLD0kBA8B0O6YR+zWeLR
         l4Lncys2xnlQwmJ+rDkKl2UJj46gIkqJY7BobN8mWiImd251XRqJ4eGvcmBXFlUDF1ML
         6Tew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750175903; x=1750780703;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5QVoUfdHdJ48HnCFe+0ux01ldLUN4WiVyX0euOzInBM=;
        b=s4kzcn4Ucw9lxPi1G717WBErKDGK8GB9KOfufqD1JSuYbBwfiBoy1zMWUeJJyhaFhH
         w4TmJYOOMWgW9M7HsspFl2BlFRWnPx25tCB3x0aawYunvg2bweLCjkN731D9ixFcBaZB
         7+O/Yln0Y+j91t9Gdu1YnYcHjm91QUJ3hPbuU1TIY3zJUT0iwWKO0MOzsBLiEx+d6SVH
         g9Q/T4g6pU8T2UW7nljVGu99SQqxky0AHxYAk/4qvu9jox5KMpqK8z5gD3cJgXgShoFM
         Q9g90RWId8M02zagZe2NSh/CC8uvQEv73nUBn970JQ20Q5SzmlnJhL+7lAtrsPZ/awlg
         HI6Q==
X-Forwarded-Encrypted: i=1; AJvYcCV9lSPHEE7yjDe6B8XMuZnIbWlW1catCcdHIXsvHOwNtHfHhUth/zwHJXMrOagaccgcBq6ujTSzApoh8vA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgNkvhK0GsKq9emg2pPCe1qD280xjaO9VvmWx5sqapdMj5u67o
	zTFNBVJtpHM1JrQ40y3xpnaA4aPPnSWsenGTsq0HPUvKBQPmUznmlnARlCd9bxl4ghQ=
X-Gm-Gg: ASbGncv87e5RjKdVkOm/6uo5yYyFkFNk3twX2drM0u073smMciI5KBcBXKK7AOAKRNt
	yIxIHp+0zGT1fttZFvDLMtS+L2tDO5cHfiq83mPC6wmS6Q5h19Q4l0nJcUk6y+V3ZuaYJz5VuKB
	jUYEYOu0qKMHimMEwAxdmCvbTTTEc7nXQUhowencQqWyBZmjXB9Oxh3WpKpMbV2PV/8f7BLriSv
	GDjX/Xw84cded0ZqvNW3yjOm40AyIPvgMbTSDpc75B1frmtBplcTabVevqatdUEXqTBz1NiXlTq
	69y0w0lFd71msZAbjtA7wQ6NG7dDLnS6XBy8mnsSOaL7VcUszS4lVXOYOJULFdR+5QP05U7hEg/
	n5w7HPto3y3xGuWEKHb/4QmA4CC3Vi+aAJyHhtw==
X-Google-Smtp-Source: AGHT+IGQBUFbF+tPc3zGviUG0wR17BWPg+rb3PkSRtQpO74uvfm4fcaKBtbG84+832ByxCugbO/j+w==
X-Received: by 2002:a05:620a:44c5:b0:7d3:d14a:38aa with SMTP id af79cd13be357-7d3e07649b8mr472642785a.16.1750175903195;
        Tue, 17 Jun 2025 08:58:23 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8e0535csm664773285a.41.2025.06.17.08.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 08:58:22 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uRYha-00000006Wgi-0qrY;
	Tue, 17 Jun 2025 12:58:22 -0300
Date: Tue, 17 Jun 2025 12:58:22 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	nicolas.dufresne@collabora.com, p.zabel@pengutronix.de,
	mchehab@kernel.org, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH 5/5] media: verisilicon: Flush IOMMU before decoding a
 frame
Message-ID: <20250617155822.GE1376515@ziepe.ca>
References: <20250616145607.116639-1-benjamin.gaignard@collabora.com>
 <20250616145607.116639-6-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616145607.116639-6-benjamin.gaignard@collabora.com>

On Mon, Jun 16, 2025 at 04:55:53PM +0200, Benjamin Gaignard wrote:
> Flush the IOMMU mapping before decoding a frame to ensure that all memory
> translations are properly applied.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  drivers/media/platform/verisilicon/hantro_drv.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)

This is a really big red flag.

iommu translations are supposed to be controlled by the iommu driver
and should be flushed as part of the iommu map/unmap flows. It should
never be necessary to do something like this.

Jason
