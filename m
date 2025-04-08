Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24A922F39F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 17:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.72.0.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744134893; cv=none; b=AiudyMqA9SwPyCe2JuDscR1R9kha1JPQnHhvZA3Vua8kbRWPhIHCLuBaRICkzKVfxkjw0BxjmtmWogPu0RiCPxmJgqDhCGwr2fyvM2dtfhEk6kqXZrfhcia/q0pbEQcs7iGwwctQioB2ZB1XOtKejYYQa5HNC4WgDkCp+z84xtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744134893; c=relaxed/simple;
	bh=DLp7+lfnL8KdjgGKxSFd10D0tbhfX1Xaz/s1ljdW/IM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=SUV+FhWeXoQ6AjIUGZqq9y5GVMSyzop2rDe0WUpo6mDOzhem4vST4DVzFDLlUye6Udw0ibNCSUmBGC5iCRfkvdzFj8qM/bE1Rv5a3nyi3Af2fDu69OyqI0RDEGJoqtFS0FNma2qP0jc6mkQFNJzG+meX1E5wCuRM2CFbCCiWzB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org; spf=pass smtp.mailfrom=gentwo.org; dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b=Okvnehus; arc=none smtp.client-ip=62.72.0.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b="Okvnehus"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1744130623;
	bh=DLp7+lfnL8KdjgGKxSFd10D0tbhfX1Xaz/s1ljdW/IM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OkvnehusfA7tseY+u6Umufo9iKk91JOFLnHLF5s7kStz3ls9AC3lb+8AEvavsJKiD
	 2Q4TtLPgBg8STW39emmX8fSaGNQgetCFLHJ0mQAHxSPO7rdrYBUaYE8L0Ei4e9cbuB
	 b016a47sQCy0qpouNfVhpWdBOk0ufRmoAikHhpqY=
Received: by gentwo.org (Postfix, from userid 1003)
	id B2C3A406F5; Tue,  8 Apr 2025 09:43:43 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id B1E7B401F1;
	Tue,  8 Apr 2025 09:43:43 -0700 (PDT)
Date: Tue, 8 Apr 2025 09:43:43 -0700 (PDT)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Harry Yoo <harry.yoo@oracle.com>
cc: Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org, 
    Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
    patches@lists.linux.dev, Pekka Enberg <penberg@kernel.org>, 
    Joonsoo Kim <iamjoonsoo.kim@lge.com>, David Rientjes <rientjes@google.com>, 
    Roman Gushchin <roman.gushchin@linux.dev>
Subject: Re: [RFC PATCH 1/2] MAINTAINERS: update SLAB ALLOCATOR maintainers
In-Reply-To: <Z_Qz55SbnHK9LoW1@harry>
Message-ID: <7edbb6f4-ba0d-3c56-5aef-066b5f4d90e9@gentwo.org>
References: <20250407200508.121357-3-vbabka@suse.cz> <Z_Qz55SbnHK9LoW1@harry>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


Acked-by: Christoph Lameter (Ampere) <cl@linux.com>

