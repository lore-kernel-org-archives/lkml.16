Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10D2524F
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 18:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743359449; cv=none; b=u4VJNXjImaGz08Mp1/Vijf1ePblxOZLHhWvBLAyOK15SJrZQQTx7DaNdlSNBDYksIPgrpQcHY1UxFDJzlatp+6OZLCeb+fJedHmv3f+VFXweu23n9upV7N2PlonhYG6bSEnhDFzXiZ2J0BtvuTEK/Xb6mP2txbtvOEr5nKC7Lws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743359449; c=relaxed/simple;
	bh=lhcvAX8CaDt8XtEADBPMZjuyxEMGevoTI6GLUZT4Ujc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WPZ0MH8njsnwYN3zv2yS23Uf0yaaGGaTok/thf13t3aXTB+UMbzDI4kDnn+B5mgLTv/5/+URN1Cczh8q06tNMOIjK9S7DY9mjW4Wl347ulKoB7TttuvoRdcy3awiJrMyX0lJMJxlGbSDkUfOgUKLNdW+S6rSFsmQ9yWjJNJbjwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UENbP/do; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UENbP/do"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D3E9C4CEDD;
	Sun, 30 Mar 2025 18:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743359449;
	bh=lhcvAX8CaDt8XtEADBPMZjuyxEMGevoTI6GLUZT4Ujc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UENbP/doI05PPiSrGqdc1oEq6+nQQdoc+bE7qKBunfB5tQe3HQK/k0uS1GcJNfIbQ
	 bdfU1B7CpnXBhgZNtfe9eT9xEPZMq9uPsjT+WGZCmHWmCbzX2l7r7fGG79qzaROPEW
	 h4TTmAb5WZ7ovfyTDkseO2uJD98X4fwB9i0aHo0s=
Date: Sun, 30 Mar 2025 20:30:46 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/13] nvmem: patches (set 1) for 6.15
Message-ID: <2025033053-bloated-blanching-773e@gregkh>
References: <20250309145703.12974-1-srinivas.kandagatla@linaro.org>
 <c064ac7c-00c0-4d52-9dfa-35941ae37b81@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c064ac7c-00c0-4d52-9dfa-35941ae37b81@linaro.org>

On Tue, Mar 25, 2025 at 11:31:38AM +0000, Srinivas Kandagatla wrote:
> Hi Greg,
> 
> Just want to ping you incase these patches fell through the cracks.
> 
> Normally you pick nvmem series much earlier.
> 
> Pl, let me know if there is anything that I can do to help.

Crap, I missed these, so sorry about that.  Are these also in linux-next
from your development tree?  If so, I can suck them in next week and get
them to Linus for -rc1.

Again, my fault, sorry, I blame conference travel :(

greg k-h
