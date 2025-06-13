Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AA1202F8D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 17:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749835140; cv=none; b=UTBAB+tUIvjkmKdal+zec2kMHSAdcUn4tQYvcTP2VsbEKA+TjKcbxanWUuEgUa+H/2fg6upat/KDq0tMIgqgB2C6R8cBUptYuKElgnyxPyneSJKGd5zXw0TRex6eDCYz+WXd2vbcaBR0YpvnfwlsBNc9DaazGto5KhRijrFJ+ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749835140; c=relaxed/simple;
	bh=Abu6EAYhm8bB5S3eWb73lfBo9Fm8nK7/25q7uL0UYuk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Pw3E+gvYPYHZ1xflrrZz1/j3Yb2eSatbsN7YRjDtR9eeoBaO3QoIRaNzFG1fgC/8XNlVXcCgI9eIxYxl7fnOvmuQI5iVEY4Tmw4LyWB9dqd5d9JJ6L7x6PRddKi+ohU8YKDEeQUgWDUIlEHP3Fe92Fe/iEJIaGsafra08B5rT08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ABN80kqo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ABN80kqo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD23CC4CEE3;
	Fri, 13 Jun 2025 17:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749835139;
	bh=Abu6EAYhm8bB5S3eWb73lfBo9Fm8nK7/25q7uL0UYuk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ABN80kqouHD25CIXTYevWS0hBu8aECbLujppnWnnqQcbR/yYEgX22e+MOzc5rjqfC
	 k6aijIRRtSGZHiVwVXSL929H/r+3+e7WRGUTmFASrbT6oQau6h6fJLUut5r1NUOSYp
	 cUL+flN0HXfdeDiceFbNrL1X39MC5cCcSOxAfUY/F4oAXQgy+KHuBIkDjCcrJM037t
	 M0KdPEpGD6kk7KtujaWHfpCV+czfIcD3ICextA6XtD6jXBh1/Mwz//Sh/aoIITxD6f
	 rCHbItOHywel0YgO0Yu3TqdyzxvkgOjHp9C3ylGwqsFoyVFJlq/nlo3n08LtDJ3XQQ
	 OjQMgVKEik5Ag==
From: SeongJae Park <sj@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: SeongJae Park <sj@kernel.org>,
	Alexander Graf <graf@amazon.com>,
	Mike Rapoport <rppt@kernel.org>,
	Changyuan Lyu <changyuanl@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Pratyush Yadav <ptyadav@amazon.de>,
	kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH] MAINTAINERS: add linux-mm@ list to Kexec Handover
Date: Fri, 13 Jun 2025 10:18:57 -0700
Message-Id: <20250613171857.44909-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250613131917.4488-1-pratyush@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 13 Jun 2025 15:19:14 +0200 Pratyush Yadav <pratyush@kernel.org> wrote:

> From: Pratyush Yadav <ptyadav@amazon.de>
> 
> Along with kexec, KHO also has parts dealing with memory management,
> like page/folio initialization, memblock, and preserving/unpreserving
> memory for next kernel. Copy linux-mm@ to KHO patches so the right set
> of eyes can look at changes to those parts.
> 
> Signed-off-by: Pratyush Yadav <ptyadav@amazon.de>

Acked-by: SeongJae Park <sj@kernel.org>


Thanks,
SJ

[...]
