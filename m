Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E84C20C489
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748020551; cv=none; b=vEucGOea65vEZ2TL9Ls0KIDL9Q9kaPqvKW0jwFyETDTDQPnscerIZLTZ5uNruQBoMoC7C6O5juz+YS0Xs132DXfqfjR/XJMyB9W+gwlM4KnJnRmuei2oa0iMDWMo4HajoCd+5Zm+9YPopyq9e5C6+xA1UTpGDwA9GJxSwmwy4sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748020551; c=relaxed/simple;
	bh=ZqIwFnMlZ57L5F4L1qbjy7ifZde3b0cHMcvppKVO3QI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dkimr4+IZSYJ4JhEUvOEuq2f9jQoEPu5qIeTOTG6MnjhyBmedxuSnfpQifPnSSon8pytdl0nKRypuI5ZWAU5qJGdNQMDBcbFad0IA52GpT3ZYEDwhIY1+RYNn0R02jP+YSnvrKhw1d/9yJXTuzHbDKx7CJN6YH5s3KcAfrofLRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eiH4zMPi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eiH4zMPi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75B9EC4CEE9;
	Fri, 23 May 2025 17:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748020550;
	bh=ZqIwFnMlZ57L5F4L1qbjy7ifZde3b0cHMcvppKVO3QI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eiH4zMPiC0vZGJOFwMRvCKkv/BwFsfu88Sggg3pKZkh+JmWDDb6zRqqihJGliu/a5
	 bTaE/c6rr1wX1y8P4/2rRq1deolO/QaBEMzVR/CUygE0LXotk3z1yQvJ3Usxt2l/Kk
	 CJACH5gzSeGEwAG6of/HDzPn8rWorBV+EIrR6jxKN+nzWh3ZmjhgCg5upgrm5L4zKv
	 Fr6njXdtf6k4n911UmCck4btGcQJU7c86/pqdvnd/LGo14kslmHPQ7Dvh1UHkK6qOe
	 XKAjrLgnVV+a2CAk9QfvjImnGSfKiMDYaBVCmVVKX2S8o0n9KQDI6Plq5xTRXC1Unw
	 1N18Arpt7OOLA==
From: SeongJae Park <sj@kernel.org>
To: Usama Arif <usamaarif642@gmail.com>
Cc: SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	surenb@google.com,
	hannes@cmpxchg.org,
	shakeel.butt@linux.dev,
	vlad.wing@gmail.com,
	linux-mm@kvack.org,
	kent.overstreet@linux.dev,
	cl@gentwo.org,
	rientjes@google.com,
	vbabka@suse.cz,
	roman.gushchin@linux.dev,
	harry.yoo@oracle.com,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH v3] mm: slub: only warn once when allocating slab obj extensions fails
Date: Fri, 23 May 2025 10:15:48 -0700
Message-Id: <20250523171548.57624-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250523165240.1477006-1-usamaarif642@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 23 May 2025 17:52:40 +0100 Usama Arif <usamaarif642@gmail.com> wrote:

> In memory bound systems, a large number of warnings for failing this
> allocation repeatedly may mask any real issues in the system
> during memory pressure being reported in dmesg. Change this to
> warning only once.
> 
> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> Reported-by: Vlad Poenaru <vlad.wing@gmail.com>
> Closes: https://lore.kernel.org/all/17fab2d6-5a74-4573-bcc3-b75951508f0a@gmail.com/

Reviewed-by: SeongJae Park <sj@kernel.org>


Thanks,
SJ

[...]
