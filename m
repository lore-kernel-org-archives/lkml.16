Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257B42D46D4
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 09:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751533538; cv=none; b=rwviw741kO6XrzsuStLR9VIHhKMI+MnzF+SpRHiBIwXK1XQgw+wMQjRwNV7wmGYOyxe4G4bc53RHNJO6O2zHypxpOTJngLXNbDCRTI9Vc9as2gPyZUeDcME2PHlg3HLju1VBEa+LlbXHRPu6rdE6QtNLxazW0pLvaPQuQz6jds4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751533538; c=relaxed/simple;
	bh=HuytBR7IEm92dQjuXJV/TWEqT5tjLSMXEKEM7+C3Aik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u2IfE9LnOebY5lOfOLKMETxUIja42X+22PDnJInmPng7FaIusyLRXBjLQEQwekzeW6GlqiMoxfKPnxQcuNsMaz0cJvam6iQaqr/bLa9L78s9Z8Yn5JNhJ0CS2oR3XCg/0BZfHPbW5A1Ll06f6hwnbN4oGFgSJgskvha8IgeSfeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 93B8468C4E; Thu,  3 Jul 2025 11:05:33 +0200 (CEST)
Date: Thu, 3 Jul 2025 11:05:33 +0200
From: Christoph Hellwig <hch@lst.de>
To: Kamaljit Singh <kamaljit.singh1@wdc.com>
Cc: kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	cassel@kernel.org, dlemoal@kernel.org
Subject: Re: [PATCH v2 2/3] nvme: prevent admin controller from smart log
 fetch (LID 2)
Message-ID: <20250703090533.GC4757@lst.de>
References: <20250702005830.889217-1-kamaljit.singh1@wdc.com> <20250702005830.889217-3-kamaljit.singh1@wdc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702005830.889217-3-kamaljit.singh1@wdc.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Jul 01, 2025 at 05:58:28PM -0700, Kamaljit Singh wrote:
> Similar to a discovery ctrl, prevent an admin-ctrl from getting a smart
> log. LID 2 is optional for admin controllers to support.
> 
> In the future when support for the newly added LID=0 (supported log
> pages) is added, GLP accesses can be made smarter by basing such calls
> on response from LID=0 reads.

Let's leave this in.  Failing a get_log page is fine.  The difference
for discovery controllers is that implementing it is prohibited.

