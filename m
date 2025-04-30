Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698E32DC77F
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 03:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745984805; cv=none; b=XCar79cNXmOS4hjHskopXi//iveP90EM6qvLZI0bU0M0Y4Cl0VB8ivKbefAGszo1qENrDwajhoEg4xpacIlggN+D96DSDRY4uXpohm4GpmesbXpiyEBSnQTWrToaYjAvSyZbT8yf5W+4ExiNWGmC4DDzIMGuAdTqiTT6nsqMNrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745984805; c=relaxed/simple;
	bh=wiFxRHB4CC5zRlyccDk9XsFAq1fyBRC5HCVh4uDgSb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bIHbLTK/T/jD79pBzb+ixlHdpG+QdwmyPiiaXckCMm8+HrGiwzDLcXE22ZvJNTC5Bz0udYFIZy1h9QNX19mwDghqIvTLC45fNPCmSBQ3hi/5BljKMZ0sDRUBZ/iY5FCpHNMAGrvtimqZYLeT8JREyJ6fpIm5ZTRJvbUXTy3Y20I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=K5/7REFs; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="K5/7REFs"
Date: Tue, 29 Apr 2025 23:46:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745984789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aymE9+MD+X167XR5ViSBtC9p1L+jUwJ78H8+x3zvhOM=;
	b=K5/7REFs2XIT9j9xBoVH7CaHQtxqV7HvNjtdDxy37oCAsyMrUgeuHEQrWkTeIDgu0eCQVk
	15sqQYZSRoKVyhGf9x8++SbvZV8HwaBAyLCzifEateqD/HllDrdi1AVF1O+GigeXLOTTWU
	K8crfeVEzQBQcfd0nvIa6ft7XdQugSw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: syzbot <syzbot+150f08265580ecb7c31f@syzkaller.appspotmail.com>
Cc: linux-bcachefs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [bcachefs?] kernel BUG in bch2_fill_extent
Message-ID: <jnstbfpplevjdl7sh7vam7eid5mjjfohrmwdwqcmi4fbslouhk@jqvbl7ys7vvv>
References: <6811519a.050a0220.39e3a1.0c93.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6811519a.050a0220.39e3a1.0c93.GAE@google.com>
X-Migadu-Flow: FLOW_OUT

On Tue, Apr 29, 2025 at 03:24:26PM -0700, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    c3137514f1f1 Merge tag 'riscv-for-linus-6.15-rc4' of git:/..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=10da10d4580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=90837c100b88a636
> dashboard link: https://syzkaller.appspot.com/bug?extid=150f08265580ecb7c31f
> compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
> 
> Unfortunately, I don't have any reproducer for this issue yet.

#syz fix: bcachefs: Fix losing return code in next_fiemap_extent()
