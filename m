Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF57C1EE7AA;
	Tue, 11 Feb 2025 09:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739266353; cv=none; b=hAMPcvCxoPoA/gxEvfEN8BGFHF+3Gy55CMnkYl3MSEjaRXNpeXr36hVBP5ECZXOAGoAOXMEW5nKDIpnRtKFCMmDUzhSBUrrpkrs7WhjjwOjgcQEM2yLPUoZMTCtMYmVVSXaFefQ+kCyyTRq2KWWOtrXeR0a3DboPvWpesgXyjzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739266353; c=relaxed/simple;
	bh=8OxzripF2xzlyXmpTVl3JGAG9mCjLy5VZnOsLYbxBfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LKIWN1eYZJ5iM7VqFz0xRAG+GxqxRladXe/qvcOTPm6H7+CFsk4u30CD24te2ilMnpTxlWFv1mobdxZoISOUiEUiomiW+23kkHUNrnKzu5KcsOXWtp5QjrpKgIekQsTJTkugRT81Fy9mGSp/E/OTBFkkvj6tJRFtwLdW6ajnJA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q37RKyqb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q37RKyqb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27CA8C4CEDD;
	Tue, 11 Feb 2025 09:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739266353;
	bh=8OxzripF2xzlyXmpTVl3JGAG9mCjLy5VZnOsLYbxBfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q37RKyqb3M+KGj+vqs/IdYVxdd9YaqAGblEguvi+PlKXcM/nWVICgOTI3/itPvkyA
	 RocidBpK95KiUS8ulJ0o/tth+kHU9xG0GWcu3YCSfxZ2TSEEHaFY010DZkpJMbiBRy
	 KxO8CtVZQjlJEr9NBvL/F6n1587Byo1fBrXthWujgcGtu3X3gTt/VPfXJpYxWW1FPq
	 STsKcYE2N2JqbPKugVPE7OgLuFzQz6++III7TWJ+SYRiXswQH41XhuVczvk9LN9J/C
	 QIfwjCaXCdK13G742fWp2F+EQC5UnPhocC4selZpFEh1PZbsNj+Dlt82LJSAjRO+zN
	 hdThT6+w8OoDQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1thmdE-000000007Ib-1BKS;
	Tue, 11 Feb 2025 10:32:40 +0100
Date: Tue, 11 Feb 2025 10:32:40 +0100
From: Johan Hovold <johan@kernel.org>
To: Tony Chung <tony467913@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 6/6] drivers: usb: serial: mos7840: fix the quoted
 string split across lines
Message-ID: <Z6sZOHhTvDC728lH@hovoldconsulting.com>
References: <202410250141.AEkzzW60-lkp@intel.com>
 <20241025061711.198933-7-tony467913@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025061711.198933-7-tony467913@gmail.com>

On Fri, Oct 25, 2024 at 02:17:18PM +0800, Tony Chung wrote:
> fix the coding style warning: quoted string split across lines

	Keep quoted string on a single line to make it easier to grep for.

Or similar.

Johan
