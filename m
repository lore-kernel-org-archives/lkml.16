Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7B42DE710
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 02:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751509629; cv=none; b=cZWkLE8bGvU4NzWB2ezovj3JPrYApo2toF2+RAjKAdmuOdRUlJrVFtjBTUe39/cHt/eiZ1Vn+aXquAOHjpy6ykY/B3IZ6kRv8PF+22tSd059LS619S6bBa21q0URCEDQOqgUsacUA/VKZb53jISJjO2fJANXSN4PZTpv0LmQb3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751509629; c=relaxed/simple;
	bh=71DegieoeZMTAuem+bE1qtCK/8zTl2c7Epuuj4ZuSDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cfai1nVXowpI04fu4SUFfE64r6JPfd5QVK+5vZ1QwE8lk+i0DwOmKmctdeliDRQoVK9euGrfZpW2JbduwDXu/A5Lu0GtbgGPljUIVe9QuOypOrpYoeKwxWcgWnuBVlyLHJRm3q8TqjJlgB9/44Ml03i95k0fOLvCeTm1XpFLjYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=VssxgqLG; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="VssxgqLG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=AHuoZlLDVso22q7Wy53t1Ivubf5QAww4dsKwn2jY8B0=; b=VssxgqLGkOZuIYNJ3iIKi1RWJf
	taJdvz4FKh0cLO3j4Pb+DC3elMJV2Pm6ZeQUSYLsM88GWD0yYU05F2ZRqeuaxhLHC2mV3rppPt92e
	ZZXeKrntq/WNOUjYmpIKbzIaLnbk38Vqg0e9n6OOpTCRmGXNQAESVjUjczxeP/4yNvx4GEGtimMC/
	IqPNs73+FdO7/lb1CSmWHW9t1K1lXBl5q2TzNS4p7Rkg4a3h7gTOJi2b6wka5CqgA+fa+P6n4hx44
	UnhRvDcOZubHkuEOdX6Jq7Jrq6vVzOoR+Rj2cpSFlJsVyG4EIUbSoT9QeTEiKXutmJX3Fp/G1T3ks
	GMD2eQfQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX9fE-0000000GTJO-0nhg;
	Thu, 03 Jul 2025 02:27:04 +0000
Date: Thu, 3 Jul 2025 03:27:04 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: syzbot <syzbot+169de184e9defe7fe709@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org, lizhi.xu@windriver.com
Subject: Re: [syzbot] Re: [syzbot] [nfs?] [net?] possible deadlock in
 rpc_close_pipes
Message-ID: <20250703022704.GI1880847@ZenIV>
References: <68656f4c.a70a0220.2b31f5.0000.GAE@google.com>
 <6865da26.a70a0220.2b31f5.0009.GAE@google.com>
 <20250703015033.GH1880847@ZenIV>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703015033.GH1880847@ZenIV>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Thu, Jul 03, 2025 at 02:50:33AM +0100, Al Viro wrote:

> As for the warning, it is a false positive caused by lockdep annotations, as
> the original report suggested.  Replace inode_lock(inode) in rpc_close_pipes()
> with inode_lock_nested(inode, I_MUTEX_CHILD) and try to reproduce that.

Nope...  I_MUTEX_CHILD is outside of I_MUTEX_NORMAL, not the other way round.

OK, so the right annotations would be I_MUTEX_CHILD in __simple_recursive_removal(),
with I_MUTEX_NORMAL in rpc_close_pipes() and, for callers of locked_recursive_removal(),
I_MUTEX_PARENT.

The nesting order is PARENT, then CHILD, then NORMAL.  Sure, we could leave
annotations in simple_recursive_removal() as-is and switch rpc_close_pipes() to
e.g. I_MUTEX_XATTR, but that's too brittle for words.

The ordering is "ancestors before descendents", and it is satisfied here; the
question is how to map it to lockdep classes ;-/
