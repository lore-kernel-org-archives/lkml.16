Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D3F4C7F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 08:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751530256; cv=none; b=d0Ku0X5UUyZgGptwFLpAtFpD8m6Dv2r9gZ5GyJXSwMlpQTMPbT5/VA+1qzcn6UVbaB2E6pGWiYpVk5yfJ2mer0gnU+RmUIsOH//mOCbKml0ht541YnWPCsxoyhZRMcFxqwBgTJeTdjmcZSg5xjvpSITXFsENN3AmihvYmQ747Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751530256; c=relaxed/simple;
	bh=4Rq9zrMmu6J3Lp7fkeLCtNeXpRY7DpBSF+kejijqoFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F7UKvoIECYEkS/X9N+iawiVnZLEquV7cJRNnz8OfDEL74rEpnmADFaJGbwAi6tSS7E5TCTXc7eTPBQHWDoovLnJeluHnHX6s8FcJC6mNloKb+rx4ww2BAlgIFzmZV+HmtbmIbDD2wREhLRVysf9V1To4JddAEaoC9JJwCG7spos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=S2vUBzri; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="S2vUBzri"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=napHHS49/Jq32cUJC2iAaoZlID0GKjavXh0R8e5L53o=; b=S2vUBzriWpjw9/YDQmNzDO7wKD
	M48OEn1tNZ0hkzSiWuFMaf6RClvq65upkyDCsWZPDRUmiWIZPW930TGnr4wwbCPPHrwfsK9S5bt8x
	/yevqyuGUAywk56PYObAppin0Awi2gRsPu7wBf7b0m/XimsuSdSmjqczkx+Rx/4Bwul3z5G9x4Hdm
	ZWI12AUWeworj02HYtEmIrqs8FR3l5Kgq6rknhBS8L2Xy84MrNY5SpvY183qUtBzaP2uluxjOFUTo
	c49qOV/RsP6upfuwaf8i9Jkrt/iQhV6C6HNdfDmYAzal58JBEMCMc9vgFovAhFkNUa3ECxjuTqGjt
	kT7XO/lQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXF1v-000000010jh-0lI5;
	Thu, 03 Jul 2025 08:10:51 +0000
Date: Thu, 3 Jul 2025 09:10:51 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: ritu pal <ritupal888@gmail.com>
Cc: linux-kernel@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
	NeilBrown <neil@brown.name>, Chen Ni <nichen@iscas.ac.cn>
Subject: Re: ipc/mqueue: release spinlock before freeing node_cache in
 mqueue_evict_inode()
Message-ID: <20250703081051.GK1880847@ZenIV>
References: <CAEy91+YpzU5tKEfsjt1_Hh0fsiCfVVK099EztXOPFGHFYyA1KQ@mail.gmail.com>
 <20250627163758.GV1880847@ZenIV>
 <CAEy91+Z=8+MsK10uiMiAf0k-EWSd3-o33yfckc3tsEz7pvmjVA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEy91+Z=8+MsK10uiMiAf0k-EWSd3-o33yfckc3tsEz7pvmjVA@mail.gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Thu, Jul 03, 2025 at 01:34:39PM +0530, ritu pal wrote:
> > That spinlock is inside the inode in question; what exactly is going to be
> > on the other side of contention?  Note that none of the file methods
> > are going to run concurrent with that...
> 
> Another thread that's waiting to acquire the spinlock to process the
> next item in the mqueue.
> This change reduces the hold time of "info->lock", since the kfree()
> of the node_cache does not require a spinlock to be held.

Describe the call chain in that other thread, please.  If there is one,
you've got a UAF scenario.
