Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C0C173
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 04:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743393962; cv=none; b=qbGgtSRCAQkQ4aLO3cQXfnjoiJyBCc741wLIs8o5qbFW8t99O1ExQ/f8SXwMUd0Cd2OFAW73MNAeGRhnrUIo5klkgeQ+SUAXzunA0wf5FXgUN6mxSXIPvwWDaRS3pKjfP/nJcbLcDwfNW0YQT0r7LHX8gs7Nl9YM4EFE+FPnJa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743393962; c=relaxed/simple;
	bh=ubCca8F7NqkA+vPr2z61KceLjCHSCp3jz6S00/hsuww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U/d5tegPtjyOLJVP6TC3un+6pGhuYXmeeG+Ioxogao2bBFzQOGYYhKSM+RH/9AXgHGOosp5pfH8IvpvUE223XedhHbIf9l1tlydZBSHVBdpDHOQVZqZu+I2sceC5o2DILusaEU3z9eO5A4HrKNJwRcqIR9+n2IhqLsTEBSiirr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IUIATWI7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IUIATWI7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17D47C4CEE4;
	Mon, 31 Mar 2025 04:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743393961;
	bh=ubCca8F7NqkA+vPr2z61KceLjCHSCp3jz6S00/hsuww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IUIATWI7w8FzWfNg7INR8LTyzQ8GhyqODQabjF1W/cOhm50XO1aPx+24VV4gI3aPF
	 wmH7Bcboo0A2HEFWBnwvAZKa5tkJbUElOS296unYCzpEf9+JJ9j6NGLMu1AL7gca5v
	 kL9tTCQ6sJxVOinnFEzgKar2nu4yCOzUSPWmVYC4=
Date: Mon, 31 Mar 2025 06:04:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/13] nvmem: patches (set 1) for 6.15
Message-ID: <2025033114-slept-train-df46@gregkh>
References: <20250309145703.12974-1-srinivas.kandagatla@linaro.org>
 <c064ac7c-00c0-4d52-9dfa-35941ae37b81@linaro.org>
 <2025033053-bloated-blanching-773e@gregkh>
 <a85e75dc-8ea2-42d1-9b70-124196439fde@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a85e75dc-8ea2-42d1-9b70-124196439fde@linaro.org>

On Sun, Mar 30, 2025 at 10:03:39PM +0100, Srinivas Kandagatla wrote:
> Hi Greg,
> 
> On 30/03/2025 19:30, Greg KH wrote:
> > On Tue, Mar 25, 2025 at 11:31:38AM +0000, Srinivas Kandagatla wrote:
> > > Hi Greg,
> > > 
> > > Just want to ping you incase these patches fell through the cracks.
> > > 
> > > Normally you pick nvmem series much earlier.
> > > 
> > > Pl, let me know if there is anything that I can do to help.
> > 
> > Crap, I missed these, so sorry about that.  Are these also in linux-next
> > from your development tree?  If so, I can suck them in next week and get
> > them to Linus for -rc1.
> Yes, these are in linux-next.
> 
> pulling it for next rc1 would really help,

Ok, cool, after Linus takes this pull request I'll sync up with this and
send it to him as well.

thanks!

greg k-h
