Received: from ip197-132-198-217.pool-bba.aruba.it (ip197-132-198-217.pool-bba.aruba.it [217.198.132.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A511E1C22
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 15:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.198.132.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738252065; cv=none; b=SPhLMgKGKNgTepao6vTdXLsRUuLt84U0T4hjaAEMLp84GFbC7oJBqqhkPAeKmNl6IGYokD2gdQFm9ww39ELnEsAbazQd9sJ9CiOpXt8ASZzZ3CuuUING7gNf0lR0KsjiTEDwpvI02zJ0HLCY3R1wn0gwaIOKLwM+8z6yNlJhaW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738252065; c=relaxed/simple;
	bh=js8Ys5WJuShZTABPJ/NcBIoKNoL7ARDpbtUC3EX1BSA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=MvyoZbNUsWN4pfi3D0HSjmwWoMOAA30MJdvSJU6XsDpBaP70MCYVKWvkca1W9ifFdIcrTlzr97dzFb5/O7FKMea+q8ZIX28FDmawMk6cda3wQX7D1etDU8v8KBBjOvP6hy39kti1Q2wRNvRP+pevxqMnH9BVTeDsonbv/p9mRzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prosemail.net; spf=pass smtp.mailfrom=prosemail.net; dkim=pass (1024-bit key) header.d=prosemail.net header.i=@prosemail.net header.b=ivy1GmxM; arc=none smtp.client-ip=217.198.132.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prosemail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prosemail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=prosemail.net header.i=@prosemail.net header.b="ivy1GmxM"
Received: by ip197-132-198-217.pool-bba.aruba.it (prosemail) with ESMTPSA id 7DE76640E7C;
	Thu, 30 Jan 2025 16:46:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prosemail.net;
	s=mail; t=1738251998;
	bh=06Qlqv5hwjVSE3trYiGvDEdi7IGl6xhuoJiHkUDWtoU=;
	h=Date:From:Subject:To:Cc;
	b=ivy1GmxM76PRwii2Tx9uJjyKUAVYxSBjjbZjLjA7gUk9iX3hWgwlBYowU6zN1A/N2
	 ldnrZ++CwKF136yODMjkRLZeJaeXmbQlcA5WhyOmf4neo/5JXnRiFSPDCDmBOavef6
	 WZYBo9xK4rq36UJN1la06hklNHSm699/xiVnb/VY=
Message-ID: <60cee319-4914-4a98-b74d-32e06fb3cbd8@prosemail.net>
Date: Thu, 30 Jan 2025 16:46:10 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Scall <scall@prosemail.net>
Subject: lib/maple_tree.c:4056:1: error: the frame size of 1144 bytes is
 larger than 1024 bytes
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: maple-tree@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Trying to build Linux 6.12.11 with GCC 14.2.1 and KCFLAGS="-O3":

[...]
lib/maple_tree.c: In function 'mas_wr_bnode':
lib/maple_tree.c:4056:1: error: the frame size of 1144 bytes is larger 
than 1024 bytes [-Werror=frame-larger-than=]
   4056 | }
        | ^
[...]
