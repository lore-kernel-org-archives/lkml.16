Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8711DB346;
	Mon, 12 May 2025 13:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747058184; cv=none; b=taTl2mEPu+rNGcLsrE70uAcCVnDBszMBsq487YK6PAo+AcqUaUVw/HgcLIKACpLJSMEglAZhtrf9AuOYr3bYXhFI8Sj4+rklOBDe7yAtCsb0025VuopZ6QWsGeBicCR5q1Xlvf5MQghGqVaASMOJ1+B+YiJFEZG21FxOkjYQVAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747058184; c=relaxed/simple;
	bh=wya4mb7zQOF8vIk0PXN+HnBHOUT+qe/UhcJMymR7PjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MeCyXZ5lck6zAvoe9/W8VR52bI5VYo836BgjcwRuWJ8b64REIPLvejw0zJz73D4bJMIhvUqN01apnmUG5xRDE+HSUDQ+KunsbSuIv/QE1Q1UT5X2hLUNOdEg/cin3wHmF3jXeSVT++HiOqioq/W1yGka3rBwN6Jo4B/17Ki6qzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ng3LHTAd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ng3LHTAd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC08BC4CEE7;
	Mon, 12 May 2025 13:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747058183;
	bh=wya4mb7zQOF8vIk0PXN+HnBHOUT+qe/UhcJMymR7PjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ng3LHTAdlyoAabe8ewbkcE41KUZzWNm7hF6M8Mf7HTBtR/RNCphuQFXZek/3RdfD6
	 xUiCt7deFtwLrevW4RkpXRboAhGsnXhXKbprNjyWh/z5ofIRJOMMhMDeOwUzl1V52E
	 vP9evy6VXlEO7LNcklvKioejnV61XVsE5gII/LxvjbVs1HoZhGcjNmTpp6EWwdjBQ2
	 LHiWWgCoSMU6O4M3r21lbotuubRCn73mCiYHPKVjrhsr+LuCIm/1mL6xl1IlbppPLI
	 fmNfvTnn7esB+I4xI0VstjyPujtpjuEOwR8bAjtzb5kOgAZmwG2hQkrRQdqs8l9e3+
	 RYMft8l4Krg1A==
Date: Mon, 12 May 2025 14:56:19 +0100
From: Simon Horman <horms@kernel.org>
To: Raju Rangoju <Raju.Rangoju@amd.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Shyam-sundar.S-k@amd.com
Subject: Re: [PATCH net-next v3 2/5] amd-xgbe: reorganize the
 xgbe_pci_probe() code path
Message-ID: <20250512135619.GE3339421@horms.kernel.org>
References: <20250509155325.720499-1-Raju.Rangoju@amd.com>
 <20250509155325.720499-3-Raju.Rangoju@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509155325.720499-3-Raju.Rangoju@amd.com>

On Fri, May 09, 2025 at 09:23:22PM +0530, Raju Rangoju wrote:
> Reorganize the xgbe_pci_probe() code path to convert if/else statements
> to switch case to help add future code. This helps code look cleaner.
> 
> Signed-off-by: Raju Rangoju <Raju.Rangoju@amd.com>

Reviewed-by: Simon Horman <horms@kernel.org>

