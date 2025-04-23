Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0871A1F4171;
	Wed, 23 Apr 2025 07:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745392038; cv=none; b=QXrHVrLm+TjfyBhcd5zek9t63NEpRzpDtU0bCGje4dXQt8OUhTnT0P2y++Rvn5A24mBu7OHxFMPbwG+5jDGvfcEKkJ+CVkMSWb5nU9hcRWZNBcOudPJytb3RYh9fQYKBAz5oOg+WHXZSQw275KhdRSNvkImpVjCE5tp+huNO8v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745392038; c=relaxed/simple;
	bh=Y64F0U7KWuYK1kXpeIHLmfq4guhCfutwjSgFxWVl6vY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jlG/aGhMy//w47v62HMG1nYqbCbjOu5n+0erzDe8hHMO2egmZqDVbLtGhOP+16Y+wuTgZdYJcC0klL7Zx9nvuR3vouPBCDlCmCjIVM2/u/45tf5Qv4coilve+QFCqwqCfHiwl51uG4bF7Lla6/nvShAvVRN46PfZ1ituqnOmNc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pkccJikV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pkccJikV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2561DC4CEE2;
	Wed, 23 Apr 2025 07:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745392037;
	bh=Y64F0U7KWuYK1kXpeIHLmfq4guhCfutwjSgFxWVl6vY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pkccJikVMi2RsiAGy1rym3L4tXkApasnsR4BG3MvdEr0NYMe1o08KWWEsYApKXgUe
	 4LQ0YDNExvcY5eqb/+FQ2WMf1cRkFXZ8uuo+V2FpNS2T3bzSu7iZxhAYTu6T1rYnrK
	 FbBdN0qJjqbo3R1814bLHZhjgN/FXeLyibds/6Us=
Date: Wed, 23 Apr 2025 09:05:38 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Nadav Tasher <tashernadav@gmail.com>
Cc: cve@kernel.org, linux-cve-announce@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: CVE-2025-22032: wifi: mt76: mt7921: fix kernel panic due to null
 pointer dereference
Message-ID: <2025042316-silk-brunette-213b@gregkh>
References: <2025041657-CVE-2025-22032-1c05@gregkh>
 <20250422221047.406011-1-tashernadav@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422221047.406011-1-tashernadav@gmail.com>

On Wed, Apr 23, 2025 at 01:10:47AM +0300, Nadav Tasher wrote:
> I believe this issue also affects older versions of Linux,
> as can be observed in the following GitHub issue:
> https://github.com/openwrt/mt76/issues/966

So what commit id caused the problem that was fixed here?

thanks,

greg k-h
