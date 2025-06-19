Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B16A2192F1;
	Thu, 19 Jun 2025 09:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750325231; cv=none; b=hpnMv/v5MrhRhiy0r68Vuzm5gv77HrD42sdhGDxXPCQE4L+jKhCL76sGq/9C5UbSS21iGxKcZLiNjo4mirnXnfiXh3xmgkxoQe5rVJUXcevINzLsy4i/oh+QMxwdKDLbDNXRdQ/MMziVVf9pvjcPuDN8c/dkhO+sootwzdT+RGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750325231; c=relaxed/simple;
	bh=N21FbHvipasWaNaOMFrhU+ILDx4F/l9NuvW7ZbcD9tQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c66Ha739mjnC/llrmdu/k1hTCJXMcI1voTmzj05onnUJcuehYZHsFmb7MYU9RSAflt9NWLWLxNtIRVDNL6sU8YjE9d7nl7gAsxWGI1RieX8w66LdCtGMdpLXSPcCeCcowDVEK9MAEjtmnPsKiTxUIoM7gasnF0ndRtFRynL4+OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bBEqsLl+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bBEqsLl+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3132C4CEEF;
	Thu, 19 Jun 2025 09:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750325230;
	bh=N21FbHvipasWaNaOMFrhU+ILDx4F/l9NuvW7ZbcD9tQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bBEqsLl+YW0WhktBCjb/1RzlXm222PgrZSTkiecJzArxE9PKfEaQGvBTrFkwJ5eiL
	 9ffejem3n7uC6ICIxPnTfJtB/63ZrDzIi7ojQs9RMu0gxcMM+eY6m13T3yueHTFsAk
	 W/K5DGMKfcWbWMmmD7FLd+BgzTU6AoQ/UCVj+h6M=
Date: Thu, 19 Jun 2025 11:27:07 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Guan-Yu Lin <guanyulin@google.com>
Cc: mathias.nyman@intel.com, gargaditya08@live.com, kekrby@gmail.com,
	jeff.johnson@oss.qualcomm.com, quic_zijuhu@quicinc.com,
	andriy.shevchenko@linux.intel.com, ben@decadent.org.uk,
	broonie@kernel.org, quic_wcheng@quicinc.com,
	krzysztof.kozlowski@linaro.org, sumit.garg@kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v14 0/4] Support system sleep with offloaded usb transfers
Message-ID: <2025061957-daylong-legal-fed1@gregkh>
References: <20250604082449.2029156-1-guanyulin@google.com>
 <2025060407-geologic-excuse-9ca5@gregkh>
 <CAOuDEK1471toXVEiNySQtmrRTSPwzo840Q2d5pw9M4fCOfsgTg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOuDEK1471toXVEiNySQtmrRTSPwzo840Q2d5pw9M4fCOfsgTg@mail.gmail.com>

On Wed, Jun 04, 2025 at 08:32:00PM +0800, Guan-Yu Lin wrote:
> On Wed, Jun 4, 2025 at 6:56 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Wed, Jun 04, 2025 at 08:23:06AM +0000, Guan-Yu Lin wrote:
> >
> > Is there a reason you aren't cc:ing the developers from a "big android
> > device company" that is currently testing and finding problems with this
> > patchset in their device testing?  I will require their signed-off-by or
> > tested-by in order to even consider accepting this patch series based on
> > the issues they seem to be finding with it in an
> > internal-company-bug-reporting-platform that I seem to be also copied
> > on.
> >
> > thanks,
> >
> > greg k-h
> 
> I'm not sure if the company wants to reveal its testing right now
> since the company raised the problem with the internal system. Hence,
> we still use the internal system to communicate with them. We
> understand that "signed-off-by"/"tested-by" tags are required to merge
> the code, so we'll keep working closely with multiple companies to
> achieve this.

Great, please do so for the next version you post.

thanks,

greg k-h
