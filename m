Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E344315F;
	Tue, 13 May 2025 04:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747109576; cv=none; b=j9Ito122ZSWDzPcgDqurDc8sGZ+BAmvGVhKBiJ5rKsZL/vlmVO7RJiupT1BZC7FGwLVsGdu8iNprUahSkuk73mAE0bkCygmBziWT6gWfVvuQxEP/S9rf5G1ybxhPZlRj4HT6iB88J3ppR1ijyjcaPGQ+l5+rRT4M9HSTQ2CO0LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747109576; c=relaxed/simple;
	bh=CVBf2Mg4fRVpOI0Gqu7cZQhJtLArYC/0vPRQrIV2x+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BPg3XZ7usY0fLS9F7Uio33W3ExQZmK+Nqe+y46cSxad3DRFnveqKLK2RYIRPbqZTlPTfyQCAitZtrG/GDWBRC0lh1+hZlBdLqzMYKLXSVu9UV54JOwb9thsYR7dJ+FJ/hts6ZeDbReEM9TDwaVvR8lYLViwWxrF7GsGgBN+T8sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=WT2BOIVj; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="WT2BOIVj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=CVBf2Mg4fRVpOI0Gqu7cZQhJtLArYC/0vPRQrIV2x+w=; b=WT2BOIVjlTvBdp/CEi4+sDXql+
	zBLf6oTdXwIprPpkur9GIK0X2eS2sFYpkEJjnNMTRyJl0hN3lr9ontQfDhtqKFN+CQnmNFcopHJXx
	l76oVJvV2X7MvGZ8DuNkRs6zKqqNZkalZFV2yvGcq3RQJhQm43S45jgeEks5j36Gv0tozRChSGXsh
	3PumLj2Ab65Te/XWYnlkR3JKKkBuRvIW57dVYwoqZDoTOjb0Gw9/k1EQUHWXG7onyDcbmf0Eoxo27
	1Jqmn3/vmxBvyQNgOrgpzEW0cHmPJJ6Q0kjDY9NLKrA8sqmiJfZ1cERLIauOPXxSgINsA3FiB2c09
	l3Zg1jAw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEh0b-000000011Vl-3sUY;
	Tue, 13 May 2025 04:12:50 +0000
Date: Tue, 13 May 2025 05:12:49 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/9] CodingStyle: make Documentation/CodingStyle into
 symlink
Message-ID: <20250513041249.GF2023217@ZenIV>
References: <20250509203430.3448-1-adobriyan@gmail.com>
 <87frhcsrva.fsf@trenco.lwn.net>
 <77f03295-df5d-4bc0-9a61-5be829969662@p183>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77f03295-df5d-4bc0-9a61-5be829969662@p183>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Mon, May 12, 2025 at 07:08:53PM +0300, Alexey Dobriyan wrote:

> I split them like referendum ballots to see where the consensus at and
> not have big single discussion thread.

Just in case - consensus would look like a lot of replies in support and not
simply the lack of replies, right?
