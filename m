Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC861DE4C3
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 06:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748241559; cv=none; b=bfaHiv8nxcHmAeCBbH4olfFjdhwlKn0mosPcgCeW6s966UESDNQyeg96N8MfWmarrMep1rOpADoFnGuA/simzrDE+Xkz+EkXZK0zF2n6/QZizXL86xVDenf6EaJzmzDFckwCzpnuJZ29NxyPfnU+tGjAkoofXG4TIFCnJ2tMsuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748241559; c=relaxed/simple;
	bh=dzPA0wCJq6nCRh4A0bzOMqEcZWel0GiR+aFE6GArilk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XhZg6XVcKC2lmUjhQrxB+SRLW0T0fX5GoYJMf41x+Tj3T5AFM4rIHeMOZxjHpZmxEFNB7SqaG7G8iWpZLk/wWcQhhe1v+p0NyXDZKmQ3Dz0FcE1X6BEYx8FrbzNbU8RDuwU0KkBWjyWQBrxytNW3WsGcCGAHZ4PHaYrvUKcPFw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=QOHdLoa+; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="QOHdLoa+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dzPA0wCJq6nCRh4A0bzOMqEcZWel0GiR+aFE6GArilk=; b=QOHdLoa+cMuzjijaD4C2Un/WJA
	Zy7G8no7Gw6z7waXbmUsbiI5Aqb8+oWMCrrpLs7njYvL2VZSkyBCE6yesW12DYF/7YYENJOfkOc0z
	7CUBMRIWngFXb28oQs7zSOYlrADyTp6zysCjHolIuvjd7x4+hL2yIzRPRVDRnVDmtWJ98mqcqA7uO
	J9sgTj0RNp3h0rdvaOyTVl/5tv4R9SlA2azbZ0zqO0+9oFnduXFTBUQMP9Hr5R9zMpg52VJ59Wehw
	5NE1vt+EaP/cVIhWVH4wapifII/PM2BcrItX6CHeB/qBmKzlY9I2mC6jQ4LKdA2gADJR4Bzly6DS8
	bRQAbHgw==;
Received: from 53.red-81-38-30.dynamicip.rima-tde.net ([81.38.30.53] helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uJRUA-00DCdJ-5m; Mon, 26 May 2025 08:38:58 +0200
From: Ricardo =?utf-8?Q?Ca=C3=B1uelo?= Navarro <rcn@igalia.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Jann Horn
 <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, revest@google.com,
 kernel-dev@igalia.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH v2] mm: fix copy_vma() error handling for hugetlb mappings
In-Reply-To: <fs2zd6syrdpyrsqkfmzjjz3y3rricscyr3bnx5trnr6p5nbhmy@l6zyiaccoknt>
References: <20250523-warning_in_page_counter_cancel-v2-1-b6df1a8cfefd@igalia.com>
 <fs2zd6syrdpyrsqkfmzjjz3y3rricscyr3bnx5trnr6p5nbhmy@l6zyiaccoknt>
Date: Mon, 26 May 2025 08:38:57 +0200
Message-ID: <87frgrc1vi.fsf@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Liam, thanks for reviewing:

On Fri, May 23 2025 at 13:45:47, "Liam R. Howlett" <Liam.Howlett@oracle.com> wrote:

> nit: mremap(), do you need the ()? (is it literally this function or the
> call path?)

The mremap call path. This function isn't called directly by mremap()
but it may be called by some of the helper functions in the mremap path,
and I suppose the specific callers are prone to change in the future.

Cheers,
Ricardo
