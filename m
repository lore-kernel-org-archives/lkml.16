Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FFD7E1
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 18:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748110936; cv=none; b=KCMeTTNDbdSxRlhXYk+EMMwyPeTgPOzSxXevXj/D3c2jGu/wdRNgBt62pSo17GkPqJlvoJXd4uOB7k+asSrQu/mvHGhRFsEuLVFTqIBRlzzFL+ydEodNZg0TdGort4iVCCafZPvlGKwaf4s/4TKoiKXZuN18fA5e8MPBP9zFYdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748110936; c=relaxed/simple;
	bh=feK2WLZzxmFH5ZyYIRIABEbI0ZuJNBVbfPBs72bhjpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W7/hS4TP1ZoFOnWpVqUta8c/lA7VT8rzAhKbsuDCOekIKA0wiqEGGONLcaE2aglEJhCW9oC5lqHre/kBbWHIOTGjhWpey/Hdm0MK7RE2ToSPM/nllUasq+z0VM3Ux+TiVrEvG8bo1eG9okOAQW9U+Ka+fL/Dhs1mfymNKZZTaSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JLjHDax7; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JLjHDax7"
Date: Sat, 24 May 2025 14:22:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748110931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=feK2WLZzxmFH5ZyYIRIABEbI0ZuJNBVbfPBs72bhjpM=;
	b=JLjHDax7JCMJuR3ukE1XYiUJxHh07HKRZnDGqSg48Oy0AeHkQ8/6XTWqPLjRXVck4FfH2H
	GUuHrwylB4iiDvUWz+mP/p4xfurqInCq4+IeZ/rnbb9W1SDIXZp3AJSWisVUOdytpCu1u6
	+dat6f/na+hPdDHuU7gzaXuWcBjySC0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: syzbot <syzbot+42581416dba62b364750@syzkaller.appspotmail.com>
Cc: linux-bcachefs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [bcachefs?] kernel BUG in __bch2_trans_commit (2)
Message-ID: <dec2j4p6wgw5igogydntiihg5ho4faris4ca5npk2nx5xhyffb@gcuplbejdvwl>
References: <6831dfc9.a70a0220.253bc2.0072.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6831dfc9.a70a0220.253bc2.0072.GAE@google.com>
X-Migadu-Flow: FLOW_OUT

#syz fix: bcachefs: Fix missing BTREE_UPDATE_internal_snapshot_node
