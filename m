Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554985223;
	Fri,  6 Jun 2025 01:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749171863; cv=none; b=d7z51/S6iD+JDBPbRv4SLv0g7twTQh2jqBH/UowtRQgAmI/KHGHF2nFP9yDUfzp9GKmAFiYINTvJoEjJgkkf4wQqo493o9fY7/4m+RqR9FyoOdtMa5K/dQG6aBap1BEXkMaTLE78lhs//kIpF3VUiSOabul8xfj0l5F6ZCI7HCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749171863; c=relaxed/simple;
	bh=1oo+b+4tlG9LSMUh+AqsHG3uICQNyr5wJ3nNu83UeEU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=So+3YRiST9c3EtD2fu6akhnWSRgh0MlHrJl2GZJ+upQReU/vJHfJ5B2WxYCIz3dkYmbmXopEMWwRAwdIzVNhjexC8A9peaZllLyewoCwFVNCIY/3R3qozC+MeTbX7ptPuWZ24QqGNyVU6k2Yu5NB3tvGLHJy+87cfxrF09nNb3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=jz9PQu/j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="jz9PQu/j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89A93C4CEE7;
	Fri,  6 Jun 2025 01:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1749171862;
	bh=1oo+b+4tlG9LSMUh+AqsHG3uICQNyr5wJ3nNu83UeEU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jz9PQu/jV/vUnrHUlzhV9VABEySORRa+jkOusbxBC3aTcWRpOl66E1cskwCti2REx
	 1JUcXdETxYUgQDZIT1ie/FDnOFos0R8kT49JkPpNWI4agf602+qofRq/pKpL0Dew64
	 X0c9U11ww7Mhe4aAlMEVo/bgfco9xVDlrF4NFick=
Date: Thu, 5 Jun 2025 18:04:21 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: Skip failed memfd setups in gup_longterm
Message-Id: <20250605180421.c8d8c48f3e340f9488937ab7@linux-foundation.org>
In-Reply-To: <20250605-selftest-mm-gup-longterm-tweaks-v1-1-2fae34b05958@kernel.org>
References: <20250605-selftest-mm-gup-longterm-tweaks-v1-1-2fae34b05958@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 05 Jun 2025 22:34:31 +0100 Mark Brown <broonie@kernel.org> wrote:

> Unlike the other cases gup_longterm's memfd tests previously skipped the
> test when failing to set up the file descriptor to test, restore this
> behaviour.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

I added a bunch of stuff to this.  Please check?


From: Mark Brown <broonie@kernel.org>
Subject: selftests/mm: skip failed memfd setups in gup_longterm
Date: Thu, 05 Jun 2025 22:34:31 +0100

Unlike the other cases gup_longterm's memfd tests previously skipped the
test when failing to set up the file descriptor to test.  Restore this
behavior to avoid hitting failures when hugetlb isn't configured.

Link: https://lkml.kernel.org/r/20250605-selftest-mm-gup-longterm-tweaks-v1-1-2fae34b05958@kernel.org
Fies: 66bce7afbaca ("selftests/mm: fix test result reporting in gup_longterm")
Signed-off-by: Mark Brown <broonie@kernel.org>
Reported-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Closes: https://lkml.kernel.org/r/a76fc252-0fe3-4d4b-a9a1-4a2895c2680d@lucifer.local
Cc: David Hildenbrand <david@redhat.com>
Cc: Shuah Khan <shuah@kernel.org>
