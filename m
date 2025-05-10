Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C85E1DF72E;
	Sat, 10 May 2025 06:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746858038; cv=none; b=lmNRLH9S4Xu87SLwVMdfyouvgf0KgKSm5Fw/kWqH8mr9XnNbPK0BHOOgTfoM41Aj+frH6RG9CD6OjHSsTXseWFQsyz83RqymlncUZsovnu3Dq7ryObOdeeWJcX6go00dodBm+jbG9WpST3VsEhZTHNSlXDcsj5dxJfSHRj+c3/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746858038; c=relaxed/simple;
	bh=iIExRZiJBfdG7VevrxthdG91Gpw1V1SQESA3Dw8uNCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D0DCo7wSRbLUX38/JJj+eDmxWGcp2IFfBy7F0Q9n/T6F8Mvel2LQYFvxpDYhmWBsTgPr+3FA40jWujZwHb0fT6f6YNv6MSnJbTABvW2IwpWdPMwo5i2EXYaczzsT8YfBrBHMuBPjYvUNc15yrzCq+KWJBFQbCBPjCdHLfWlscxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MJGuuBCA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MJGuuBCA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 345DBC4CEE2;
	Sat, 10 May 2025 06:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746858037;
	bh=iIExRZiJBfdG7VevrxthdG91Gpw1V1SQESA3Dw8uNCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MJGuuBCADR5H3CbYPWKhZSgyFQg5vm1VBCM6Aii0bXVZbvs98AksviONVbCajDQto
	 y6SjTjTRtRObrU6oS6iaiy2zE2gnruOYTB21rK/nKzfa2irU+FWctXiOWOTB6JIiJk
	 EDsO6N3bb50QUCDc4yz5XZMxTk/UYy6itlbcjl80=
Date: Sat, 10 May 2025 08:18:53 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/9] CodingStyle: mention "typedef struct S {} S;" if
 typedef is used
Message-ID: <2025051041-hardness-effects-89f0@gregkh>
References: <20250509203430.3448-1-adobriyan@gmail.com>
 <20250509203430.3448-4-adobriyan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509203430.3448-4-adobriyan@gmail.com>

On Fri, May 09, 2025 at 11:34:25PM +0300, Alexey Dobriyan wrote:
> Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
> ---
>  Documentation/process/coding-style.rst | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

We can't take patches without any changelog text, sorry.
