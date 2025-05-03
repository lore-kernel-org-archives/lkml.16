Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39601F150F;
	Sat,  3 May 2025 12:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746274481; cv=none; b=U2icZw0q5kiFBbFODMe2gQklMBctWylLUvaECvstxpD1rPIBui6go8L0S++ySE/YR3qHcYpXRQyVlXJk/A7sFFjN8zvOfFXniK9Qx39gSo7M4LmtgM+bEuNhZ+odHqFAOjbmtEnzYOJBt8Yf7DmGyWRnStJw+cEzBBFweBOkSs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746274481; c=relaxed/simple;
	bh=9uTjUya+3Bs+pjYCsEAe4MWGqBJe6e7zeLMfjhlslDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LJM0BFivQZmfb6QVXTM2LZ51MOHFzjo5bqub+dR7l8nW0DVPAkSPhJ79R+Cm5g+A8SbnxNHVZpuZdK97VyLA/TNf3fzU1xSPA6hw/7PYMw5F+HDOJPaIcJfM6uziXt6M/prWEXI1MadgUnXOuv0oO4CmQB63p8Ur04KKZMpoxns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YVEIjXMH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YVEIjXMH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA875C4CEE3;
	Sat,  3 May 2025 12:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746274481;
	bh=9uTjUya+3Bs+pjYCsEAe4MWGqBJe6e7zeLMfjhlslDk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YVEIjXMHEQy0KxTm7vHG+xV08xUUKlZrHLPb6fZqYLEiexvfHoSj9ORcZ1Dh3msuJ
	 zAwT39zBbHhBG8YdIBPKfse5XOwNK26249/gOgPpzn6AbtPnKfZ4r9glt7/KW3Rea+
	 NxFEzh0geS49BEa9JCweweSPnFHTij9GKpeWTN0s=
Date: Sat, 3 May 2025 14:14:37 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: cve@kernel.org, linux-kernel@vger.kernel.org
Cc: linux-cve-announce@vger.kernel.org
Subject: Re: CVE-2025-37799: vmxnet3: Fix malformed packet sizing in
 vmxnet3_process_xdp
Message-ID: <2025050311-passable-hydroxide-a435@gregkh>
References: <2025050358-CVE-2025-37799-a1aa@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025050358-CVE-2025-37799-a1aa@gregkh>

On Sat, May 03, 2025 at 01:39:59PM +0200, Greg Kroah-Hartman wrote:
> The Linux kernel CVE team has assigned CVE-2025-37799 to this issue.
> 
> 
> Affected and fixed versions
> ===========================
> 
> 	Issue fixed in mainline with commit 4c22276
> 

Oops, toolchain bug, let me fix this up and re-issue this cve id, sorry
for the noise...
