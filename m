Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1352288C6
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 09:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748942447; cv=none; b=FLBwBtDoA32KMlBwCA4/TzxzhLjma7SsZFpPScZ4+d5DuhAu3hWMSaSJx80Ercr5Y4rdFCk1IqXEijVoMVoeU5SOYFRx5rczxLFf/BAZLY1YPmyg1/l4uBgqZYsGKAo6WqdXDiyQAJljs/G73ZO1aUkBD15VxTEYdrEMQCVxfQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748942447; c=relaxed/simple;
	bh=i1YYfpoPUa9MGClbFHU+kGlrGfo7z3f9Eob81ijhiJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XCnDkvxG4ewjWtOQVZ292GBtKWD+7r+LRm9vxbcyus95j/x5yjZJGWSAB4T2/fmCdP18TRRc5c9ZIqa3bHQFUk57gLrq2Zot0VpbJZXEYqtoUP/3o8wu45uinaTrYW0rNvAR2CBJv7D52PAQXQ1MlRrn1aYUylgKjsbFuVTcI/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=twL+5Jhj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="twL+5Jhj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91670C4CEED;
	Tue,  3 Jun 2025 09:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748942444;
	bh=i1YYfpoPUa9MGClbFHU+kGlrGfo7z3f9Eob81ijhiJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=twL+5Jhj3VFzhl1919C+1E5F1CU1o7wp61+DjI9l5WuOmvY3BeXgj24KoQSv+SqvG
	 ndmtei2W+1EXjwFW7il+k9CTDLxeawvUI2jg8EWaQXZf+MuaP19TCiUpLUO9AC0Qni
	 hmE/J6eYudGp8GXIvdPz7Q1EuvcYZHn7omcc/T+Q=
Date: Tue, 3 Jun 2025 09:50:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Agarwal, Nikhil" <nikhil.agarwal@amd.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	"Gupta, Nipun" <Nipun.Gupta@amd.com>
Subject: Re: [PATCH v3 0/5] cdx: Minor cleanups
Message-ID: <2025060351-ambiance-angles-cdd4@gregkh>
References: <20250502-cdx-clean-v3-0-6aaa5b369fc5@linaro.org>
 <BL1PR12MB53333E728D0A5837E453ED629D892@BL1PR12MB5333.namprd12.prod.outlook.com>
 <5c43b201-68ed-4d6f-8595-bd3df203e81f@linaro.org>
 <BL1PR12MB53335655AF9C3B4216CF1B729D6DA@BL1PR12MB5333.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL1PR12MB53335655AF9C3B4216CF1B729D6DA@BL1PR12MB5333.namprd12.prod.outlook.com>

On Tue, Jun 03, 2025 at 07:33:31AM +0000, Agarwal, Nikhil wrote:
> > -----Original Message-----
> > From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Sent: Friday, May 23, 2025 12:01 AM
> > To: Agarwal, Nikhil <nikhil.agarwal@amd.com>; Gupta, Nipun
> > <Nipun.Gupta@amd.com>; Greg KH <gregkh@linuxfoundation.org>
> > Cc: linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v3 0/5] cdx: Minor cleanups
> > 
> > On 06/05/2025 12:59, Agarwal, Nikhil wrote:
> > >> Changes in v3:
> > >> - Drop maintainer's update, on Greg's request
> > >> - Link to v2: https://lore.kernel.org/r/20250430-cdx-clean-v2-0-
> > >> 7dbfda9364a9@linaro.org
> > >>
> > >> Changes in v2:
> > >> - Patch #1: Add HAS_DMA dependency
> > >> - Patch #5: New patch, split from previous
> > >> - Link to v1: https://lore.kernel.org/r/20250425-cdx-clean-v1-0-
> > >> ea2002dd400d@linaro.org
> > >>
> > >> Few simple cleanups for CDX drivers.
> > >>
> > >> Best regards,
> > >> Krzysztof
> > >>
> > >> ---
> > >> Krzysztof Kozlowski (5):
> > >>       cdx: Enable compile testing
> > >>       cdx: controller: Simplify with dev_err_probe()
> > >>       cdx: controller: Drop useless probe success message
> > >>       cdx: controller: Do not open-code module_platform_driver()
> > >>       cdx: controller: Drop unneeded driver.pm NULL assignment
> > >>
> > >
> > > For series
> > > Acked-by: Nikhil Agarwal <nikhil.agarwal@amd.com>
> > 
> > This was sent 20 days ago, got acked and still did not reach linux-next.
> > Are there any more comments? What is happening here with cdx and this patchset?
> > 
> 
> Greg, could you please apply this series on your next tree?
> 

After -rc1 is out.

thanks,

greg k-h
