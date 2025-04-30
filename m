Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EED21325D
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 09:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746006718; cv=none; b=JrCaEvMjxReeFQrvcZmnwLxHlsGPbK9EaFA/H+TDfpAXmA2KoTJZPUWEc6dBfltBXjQdjo9YJEyX8gMtsCLHARggrZoU46IhnAFDf+dHlTgS9zrYWklhhVunt3gdOj5UKZhtQiGXTskmdF5J6BxniEA3aHxHibkPCh4LRR8fqLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746006718; c=relaxed/simple;
	bh=H9TVpNIUqRJqkHSoRR2HwqA45ZTtVXapiUPjmIrPXOs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Xv9Y1mJnndoOscpMnzayYqdAChti114qRHq2DNOAT3JO1heoW211DTeAjhPMDua8KXVPCWC/I/i306quGI/sDKqHJQ7BVyh53WvzVnD7A5xkgOwJDL1Xd86G1d83s29zaRYhFSqwNcdln311mrX6EnIXf7wm4X2GjbqjKHgM/WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=cQi3bRwt; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="cQi3bRwt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=H9TVpNIUqRJqkHSoRR2HwqA45ZTtVXapiUPjmIrPXOs=;
	t=1746006716; x=1747216316; b=cQi3bRwteL+axoGex7Whq7dmLg9gTlVyLy5jAkHPTLPrhjK
	adJOUCQoNIJSGVEpl/07jhNk7AZfGh2ujvGYvZb6H5oysggn47QczNME03CzEK046K+AoyEL+bnHU
	alj0xb44Xyccg6aGjjVaIK2C/D2Wo/UKvwfhA7GLvtm1s/LK7Vu84jOltyT9jrUc8DprKLlJAqSWR
	5sFxAFqCpglsswG3G38V69rPNZhJcsl5/c0jryU1myvPLfakDRYAGV4wB0NsVqgWGXUKcVHgoLJp+
	IJlpZJ8o6Wf7GY7dTGGPRHKp/RDZCNWr26HXoMjQEP2UZFhGVOyReVKyzVlbYcPA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.1)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uA46V-0000000Dars-3CIj;
	Wed, 30 Apr 2025 11:51:47 +0200
Message-ID: <0837b343960cc6392df4a04b974a2ebca4b60b9f.camel@sipsolutions.net>
Subject: Re: [PATCH v7 00/13] nommu UML
From: Johannes Berg <johannes@sipsolutions.net>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Hajime Tazaki
	 <thehajime@gmail.com>
Cc: linux-um@lists.infradead.org, ricarkol@google.com,
 Liam.Howlett@oracle.com, 	richard@nod.at, anton.ivanov@cambridgegreys.com,
 linux-mm@kvack.org, 	linux-kernel@vger.kernel.org
Date: Wed, 30 Apr 2025 11:51:47 +0200
In-Reply-To: <7271fdc2-5f3f-459d-ad64-b0275265fe2a@lucifer.local>
References: <cover.1737348399.git.thehajime@gmail.com>
	 <f4242067-0113-432e-b8d1-d26ff5e4a355@lucifer.local>
	 <m21pte6z73.wl-thehajime@gmail.com>
	 <7271fdc2-5f3f-459d-ad64-b0275265fe2a@lucifer.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Tue, 2025-04-29 at 14:23 +0100, Lorenzo Stoakes wrote:
> Thanks, appreciate the response. I would say send a v8 that's rebased to
> make life easier for maintainers :) if you already have it ready to go th=
at
> is!

There probably haven't been that many patches since, but I guess why not
:)

I was sort of hoping to get the seccomp patches from Benjamin - that
have been waiting far longer - in first to see what overlap if any there
might be, but I think he and Hajime have already concluded there wasn't
all that much overlap anyway.

But it's good to hear that it'd be useful to you.

johannes
