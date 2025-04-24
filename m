Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA5328B4F4
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 19:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745524281; cv=none; b=dj+Pqym44QhS4kjbIDaiNacOWwbecyE83p1s0a1z59PpLwtVNkNOBR2dQcEo/i4ccj2zDHYDptZQLR04bIkVvhDIAZxizKB7AUk2vs69a/8M+3uhXF2E+HDHfG11opL9CvtrEBUcGm1AN/XVHeWW+OYZ8jkamUh4WI98dDg/xuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745524281; c=relaxed/simple;
	bh=aCl37Hz5cL4TialPLF9Bo0Z6/5UWbEdQ1EvxktnwbaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KqLzVPuQ7KewRLX2S+5IxfrHE2CRtVhj7kRR88rG5GzZ0XtiAgqWlqNIQ7uzTdfVyduglMoaPQZ9YoCaRtUr9qBDaA3utiQOnJDc3gsFTgFgNaxeXQNprQgfDIQF5rNyoKOq9IZQqZKVK8OaDoTqo6eCfm1xxrMmF3IQXJO6auk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=BMKQliB7; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="BMKQliB7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BnQ0RRLrmDxrzcqwVc/gOHYotLtupDD4X/LfEigcVB4=; b=BMKQliB7tjnct54r1JbytgsH4f
	RBrOCWAtycLnk9gljywcZrNE3szpY6BA8oRcOveORMeYn0L6YpkZtRfA/1BiFC/r2lfnZWYr0Kdz9
	mKzR/2Q2iGwhJ4gRmJkG3DixhflWB62lygYoeweoYcTUvZogO1K6m3J07uWbu1zW4XaC4Ro/wUyJ3
	UTLEKY3H7JKH4giSgYsTdH6nw5lec9CMjjw9H82DUcJ5abvqXAyhseHIFR/IM5a9fWGPVbPEzBKxd
	k1Yc6jZE2hQMr8AGba2e1LtdyA8LFmvwoA5YwhZzXAe5/J8T8k9TniE7b8h0fSCHC9oVv+PHJ9u29
	2l72G6qQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u82bI-00000000gDO-1JH1;
	Thu, 24 Apr 2025 19:51:12 +0000
Date: Thu, 24 Apr 2025 20:51:12 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: syzbot <syzbot+321477fad98ea6dd35b7@syzkaller.appspotmail.com>
Cc: hdanton@sina.com, linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [fs?] INFO: task hung in vfs_rename (2)
Message-ID: <20250424195112.GI2023217@ZenIV>
References: <20250424110546.4284-1-hdanton@sina.com>
 <680a27ff.050a0220.2c0118.0bf5.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <680a27ff.050a0220.2c0118.0bf5.GAE@google.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Thu, Apr 24, 2025 at 05:01:03AM -0700, syzbot wrote:
> Hello,
> 
> syzbot has tested the proposed patch but the reproducer is still triggering an issue:
> INFO: task hung in vfs_rename

Would it be too much to ask for the "proposed patch" to be posted on the same lists?
Not everyone is willing to start a browser and go digging for links just to get
some context...
