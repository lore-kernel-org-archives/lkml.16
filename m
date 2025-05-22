Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA92299AA0;
	Thu, 22 May 2025 16:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747931773; cv=none; b=TFuobA8Uoz3i1qdDQT7heswSziNYGtsXIvEnMPbUsUfzbCSW2IknJuh8ZidGygQndmUuTa4YSUOmxnRptCQj0xtBCurzoE+QFvcdBAr0ycPAqf36Z5sZRXmsNIKe27Nc8wuOHSIJA6i1f0/YMBPdZV0AGJksyih238Mqp2r1jbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747931773; c=relaxed/simple;
	bh=IdMoo8IqwBsFkH8KYYXaz/Iws8nO9NdTmYbr4Us1KGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l5c3bZaHvuvfLU3vev8ow3DqLripCbGcYfPlBTZMerZOpnZ/9jXzqRiyLYYAhL2y+uXBvKSBgtMDxPPDGy+yHfKBX5JM7Njh39f1fDukhaNDCzv5tHykc0XJAcQHpQOK50rONSQB6fYd0gWmhjrSHtoFy4aNon7b7A8Krogu1As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=funip3E0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="funip3E0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56A48C4CEEA;
	Thu, 22 May 2025 16:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747931772;
	bh=IdMoo8IqwBsFkH8KYYXaz/Iws8nO9NdTmYbr4Us1KGM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=funip3E0nPP1S8eKSAKcln2ydBv5YLLvj7mB7XSAmuhUI85+k2dPI9PUhQefZoLcv
	 4SAmhuZ7S8YYGRx54nIFte61hqtS+jttCfTamBWGkt7RRX2PbhbWG/OXDyz6xQr/3h
	 qvJxkWRL9/kRcdp3aAMLSunrwckI/ovnx0XY9tuA=
Date: Thu, 22 May 2025 18:36:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Brigham Campbell <me@brighamcampbell.com>
Cc: Jihed Chaibi <jihed.chaibi.dev@gmail.com>,
	heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org
Subject: Re: [PATCH 1/1] usb: typec: tipd: fix typo in
 TPS_STATUS_HIGH_VOLAGE_WARNING macro
Message-ID: <2025052239-swimmer-credibly-49a8@gregkh>
References: <20250521214851.386796-1-jihed.chaibi.dev@gmail.com>
 <DA2IV4ZGT2M8.3QXO3L57VXSA5@brighamcampbell.com>
 <2025052234-brewing-recall-a7ed@gregkh>
 <DA2TS4HXZHLK.1WH4DSREYSAP4@brighamcampbell.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DA2TS4HXZHLK.1WH4DSREYSAP4@brighamcampbell.com>

On Thu, May 22, 2025 at 10:21:10AM -0600, Brigham Campbell wrote:
> On Thu May 22, 2025 at 2:30 AM MDT, Greg KH wrote:
> >
> > Too many characters for that sha1 value :)
> 
> I heard recently about concerns regarding the collision of 12-character
> sha1 abbreviations [1] and had assumed that using 16 characters is
> acceptable. Regrettably, I neglected to read Linus's response to the
> email which rose those concerns. After reading his response, I'm
> satisfied knowing that there is still very little risk of a collision
> between the abbreviations of commit objects specifically.
> 
> I'll modify my git config to use 12 character abbrevs.

The documentation should have the git config settings that are needed:
	[core]
	        abbrev = 12
