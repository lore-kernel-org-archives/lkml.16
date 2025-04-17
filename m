Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3435D199E9A;
	Thu, 17 Apr 2025 09:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744880609; cv=none; b=U+5jJMFibudjP8n/XucGnzkDG2pt9PZknjBXbrNqZpIaaEXcIrjafv9n9zSk9N6KG9ezszRu98qC8Htxrj/RcYgMnQoKpFspYyXqlLHQM7g5+UajKgNEQ5MTiT8Wwa6uGlKWw3b9TR1BK3CSRRzs+pKrwcUPK6LM4gkU8rR12pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744880609; c=relaxed/simple;
	bh=AKhbiaGFNz2s5vGu/XO3lm43YKVVOG8RMVknp1zupyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NZyGY6ndh1ntkSXC2czV7Hi4Dr1JxEkCX5J7xbeXoCO0wbd1bBO2q4T5cuO2vQyzThEMZraWlqLQna/SKyWFuNErZ2CL5T5FUCQ413eLvDQyRJ2mL+tPJf8yMjNZDU0LXCHaDUaQ2bbiOQytegBTTHMLPCe+PbUJkavDT2Kr0IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mmvAH2oN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mmvAH2oN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E36CC4CEE4;
	Thu, 17 Apr 2025 09:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744880608;
	bh=AKhbiaGFNz2s5vGu/XO3lm43YKVVOG8RMVknp1zupyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mmvAH2oNnOd3X6U4mdB0Wn4cz4JSygFlJECoydO77lCviIErj1qQz5IVKmS6gIFBm
	 tCu+nNIdyyCGw5yZg9xQEDoaylmkgwzPqRkBGE8WT/r5QiDati8r88gD3dBfD2Flo7
	 O2Au+Gxqdcyvw+2SSeVWhxlVWjud+bCgrDYQOnQc=
Date: Thu, 17 Apr 2025 11:03:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ganesh Kumar Pittala <ganeshkpittala@gmail.com>
Cc: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	hvaibhav.linux@gmail.com, vaibhav.sr@gmail.com,
	mgreer@animalcreek.com, rmfrfs@gmail.com,
	pure.logic@nexus-software.ie
Subject: Re: [PATCH v2 0/4] staging: greybus: cleanup, API migration, and
 refactors
Message-ID: <2025041752-surviving-blandness-229e@gregkh>
References: <20250413073220.15931-1-ganeshkpittala@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250413073220.15931-1-ganeshkpittala@gmail.com>

On Sun, Apr 13, 2025 at 07:32:16AM +0000, Ganesh Kumar Pittala wrote:
> This patch series splits and improves the previously submitted single patch by
> breaking it into four independent, logical changes following kernel submission
> etiquette.
> 
> Link: https://lore.kernel.org/r/d683962c-e8b7-4adc-9902-483976197637@riscstar.com
> Link: https://lore.kernel.org/r/5773d200-1d9d-4d6e-b01e-10d962ee9e8e@quicinc.com
> Link: https://lore.kernel.org/r/4f47df18-e98c-4f23-afde-3fa8e9fd0f86@quicinc.com
> Link: https://lore.kernel.org/r/202504010829.vIzweYue-lkp@intel.com
> Link: https://lore.kernel.org/r/202504011217.iRb2Bbls-lkp@intel.com
> 
> All changes are isolated, reviewed, and tested.

How exactly did you test these?  What hardware was it run on?

thanks,

greg k-h
