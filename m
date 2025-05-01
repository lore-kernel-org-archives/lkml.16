Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF27EC5
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 11:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746098396; cv=none; b=M8cdfRw1Jo7pjrTR2CP9iUNWwJKeKWTGYzAPZln9Bz1NP47j2vN15FQ2039g0bisjqL7PXal15ZgFpmX17XesEnSosSVefIfPj2V0zC4VbyWMtbnhMxAKKnAmUZFEKm0tHckzoZTXM4CwVo5v65I2haHcO7EKx/3m8EofRzDaJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746098396; c=relaxed/simple;
	bh=VWrPNBfHhg9wD68gOl+G+XtNQrLgb/BS81MyvDrmVkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K9MKmTrrFCLAoc2hyLasgnVY3Oh5Fb9oEEFlemqIEna2DU2uleK+XMBt5GDd+J/BjXr+i2Onp7nO7Av5l3d35ilozGK9uh8fQ1rq8utlolPZXNTN1SeXzLWcCQlX1RLwgsu4W4oz/+SGH8XzzBylDUpbUtC2faN4bf74hCWFcOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VVWj9gL+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VVWj9gL+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B816C4CEE3;
	Thu,  1 May 2025 11:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746098396;
	bh=VWrPNBfHhg9wD68gOl+G+XtNQrLgb/BS81MyvDrmVkg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VVWj9gL+oi75yY2yMuZJvAw0bsu2XGPDYyOEnCVO8NBWt4x2vi1zxnd18xDxyWE19
	 7VC+a0cZxFxWjX1jXe4V+nTP7eC3zHIfunWZJsHxSE2KVHdsKavoqp8Ux4NeoiqQLT
	 rHMnU04RqYbp3SR5I45E6IZpzTYHebj3/2lp7V2TOcaImbA7r1xWcMcpY9sdeyaT7y
	 ngY8HPVu6S7olz5I8UVbh3GUFw32wH7EVzXwTsZ2CFApVciU0JEmxF2dJMfxCsOlF3
	 37ntf/2tlyNUy+aNXDxb7+GApfSHXWkF2o8vk0emx1LXboIfu3jWRKxkbKjaMkaxyx
	 UVCm2iYs8H0dg==
Date: Thu, 1 May 2025 12:19:52 +0100
From: Lee Jones <lee@kernel.org>
To: "Colin King (gmail)" <colin.i.king@gmail.com>
Cc: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: mfd: adp5585: add support for key events
Message-ID: <20250501111952.GG1567507@google.com>
References: <7a6d0a8a-aa14-488e-9072-0bbafaa84e5e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7a6d0a8a-aa14-488e-9072-0bbafaa84e5e@gmail.com>

On Thu, 01 May 2025, Colin King (gmail) wrote:

> Hi,
> 
> I noticed that there is an issue with the naming of device tree property in
> the commit:
> 
> commit f674cea99d03199a4fc9a96c68149b8804053f80
> Author: Nuno Sá <nuno.sa@analog.com>
> Date:   Tue Apr 15 15:49:26 2025 +0100
> 
>     mfd: adp5585: add support for key events
> 
> 
> There is a property named "rst-passtrough-enable", should that be in fact
> "rst-passthrough-enable"? (an h is missing)

Why not send a patch like you usually do?

-- 
Lee Jones [李琼斯]
