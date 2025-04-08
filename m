Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508ED1C3314
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 21:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744147160; cv=none; b=cb31G4f6jQdcLGg2iOOwv1TbyWFanfAtI5CWNLfI2GJCSb2vNMRtRb4LB8q49zOSRUaBWY3bAra0kKqMsMKwg2VKB4TO+op/scHWQMe/ENzes0BbSTPrd7y2ORYHV1TN/WaOcJ2mdGOgqK08EV4TuNuS1McHzvZbXoCymjhtkS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744147160; c=relaxed/simple;
	bh=JBKao/2p3bD/m2F2IQwYrfUV2vZQ2S6DG9PqY2YyOGg=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Bw3GkR8kp4C/xILHQAEN3UjAw13zQuK/7PhGi/JZUZgTScn9ESPZLr/j3TijTx6kuFWKqaVG/M3NXZLiUbuKJrQ9oJUqA9y0V/SKuaVThK+eRPt3mflYvM+3MHaq3Cr0atiqwUnjXQu3E46PesEPwREsaqaIr9DFnxgajHkueyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=uYwltDef; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="uYwltDef"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78FF7C4CEE5;
	Tue,  8 Apr 2025 21:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1744147159;
	bh=JBKao/2p3bD/m2F2IQwYrfUV2vZQ2S6DG9PqY2YyOGg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uYwltDefxg8GemSxtwCQ1BzUj17aky7MPnqMB3gLOuahtHfEG26wt6tdsLPyVNIHg
	 y4RBSXdWP34uwRKh7/mnBd9b62LiGA6UwM7WdCeT+TrDZjFVetDhv8ej348g87oLHK
	 RzR4jAm2v3bcUnfyia/8YYoFtG/3mE3s15oxKqTw=
Date: Tue, 8 Apr 2025 14:19:18 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, David Hildenbrand
 <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>, Jann Horn
 <jannh@google.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add memory advice section
Message-Id: <20250408141918.64dadfbb41ada324b042d843@linux-foundation.org>
In-Reply-To: <acwykb6o3cqda46aq6li6jzjq2rovjlsuf25didyln7mfcguws@z3c2p5n6aand>
References: <20250408161105.156350-1-lorenzo.stoakes@oracle.com>
	<acwykb6o3cqda46aq6li6jzjq2rovjlsuf25didyln7mfcguws@z3c2p5n6aand>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 8 Apr 2025 13:00:41 -0400 "Liam R. Howlett" <Liam.Howlett@oracle.com> wrote:

> > +MEMORY MAPPING - MEMORY ADVICE
> 
> Advice or advise?

"madvise" is what people will search for.  Perhaps

	MEMORY MAPPING - MADVISE (MEMORY ADVICE)

