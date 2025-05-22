Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AC045C14;
	Thu, 22 May 2025 08:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747902652; cv=none; b=C2j0ZJceEUqhGiqcSBG1rn4qSd8C4yTBqvtCaqqKY+zxIdSR1Z8QJ063nR+4IZ05l6KvSAGRt44eUEcTuZ/9gMnIl+nOw9oT3uRsZdHr5bI69rYg8m37BHBDBWemoHw0SpBpnjo6Xca4IMsUrbVYtrSQk8LNfJNd17m/cxxT+1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747902652; c=relaxed/simple;
	bh=MRJHNZRt9utLQVgyJmGAvzAudoQRvVSqgUZWOLGd3q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jv1rrlGf73afUFrKSjcGK7LQlpHqCiRWqGXbva6y7ntXc2nqu44GosObSwF5RJddAnyqS5MQt55z9hpzQ8T7gUw7JC8eN/HjPh0r2/M7mF1OIfbcqv2rJkvs1+4jR1LbFfnrAvbJqLHiDWHjNJBl2l5lC481GzpbtYIuJsvjfJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CzSOAiWp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CzSOAiWp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B94D1C4CEE4;
	Thu, 22 May 2025 08:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747902651;
	bh=MRJHNZRt9utLQVgyJmGAvzAudoQRvVSqgUZWOLGd3q8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CzSOAiWpzq2SF4bRdzcZra8Y0lJ9jYJsXDPzTyeKMwBj3YL5xWevgvOYL1kGdJXxP
	 +0Y6IF0wYPml8dytGbDEex0dbCaNv8XxGtbNQz8CbwM7Z1sgOThHQ4nLjnY/eqWskY
	 YTIJKgza7PNoKC7rN7PuED5q59C9aCRFub2SVkuo=
Date: Thu, 22 May 2025 10:30:48 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Brigham Campbell <me@brighamcampbell.com>
Cc: Jihed Chaibi <jihed.chaibi.dev@gmail.com>,
	heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org
Subject: Re: [PATCH 1/1] usb: typec: tipd: fix typo in
 TPS_STATUS_HIGH_VOLAGE_WARNING macro
Message-ID: <2025052234-brewing-recall-a7ed@gregkh>
References: <20250521214851.386796-1-jihed.chaibi.dev@gmail.com>
 <DA2IV4ZGT2M8.3QXO3L57VXSA5@brighamcampbell.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DA2IV4ZGT2M8.3QXO3L57VXSA5@brighamcampbell.com>

On Thu, May 22, 2025 at 01:47:54AM -0600, Brigham Campbell wrote:
> On Wed May 21, 2025 at 3:48 PM MDT, Jihed Chaibi wrote:
> > "VOLAGE" should become "VOLTAGE"
> >
> > Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
> 
> Nice work! I was able to successfully compile this driver with your
> changes and I don't see any further references to the misspelled macro.
> 
> Patches which fix issues which were introduced in some previous commit
> typically indicate the offending commit via the "Fixes" tag. Admittedly,
> I don't know if the tag is reserved for technical bugs rather than typos
> such as the one you addressed, but such a tag would look like the
> following for this patch:
> 
> Fixes: e011178579b57c03 ("usb: typec: tipd: fix typo in TPS_STATUS_HIGH_VOLAGE_WARNING macro")

Too many characters for that sha1 value :)

thanks,

greg k-hj
