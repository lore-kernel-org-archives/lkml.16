Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E236C296153
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 09:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751534086; cv=none; b=i0+l13SkWPjicVqQKfnepR7SYjWORwBFha0lKuz+p1GZtQU6WwAye/HYqC3oeaQwj9ybVlqyZM6bijHS9NcY5R6kxbROwqsHAnLhzhKVw3LwvNuFUP6jm441EVxz96kKpxAkfuH3Ss0ZcemC3L6K+bbDOz2amL0Xd20ole4d87c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751534086; c=relaxed/simple;
	bh=pFMG0YaoJ+b0rfZbE7Qpyb7Kq2XHeo1Tzzmk0xxOBh8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b4Js3BO+0JsEa1uhjv7KR3ji7vmw98ObHdwlSHggfzQOwLi7N47sSjGlYNat7rpork0+pSttkym/6GHq+k+K7AuuF3MRaCXpRrZEeG2mrx7bwcdPT4NEpNfQx38Pb3GwrDbrZvIWpsyAmTPz9hPqOs/jFnoFSQTnt5U6VQKPj2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf07.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 296A6140767;
	Thu,  3 Jul 2025 09:14:43 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf07.hostedemail.com (Postfix) with ESMTPA id DF0E12002E;
	Thu,  3 Jul 2025 09:14:40 +0000 (UTC)
Message-ID: <83e65ecbcc1a6af67a432a20d2a40bd80b945ee0.camel@perches.com>
Subject: Re: [PATCH v4] checkpatch: Check for missing sentinels in ID arrays
From: Joe Perches <joe@perches.com>
To: Brian Norris <briannorris@chromium.org>, Andy Whitcroft
 <apw@canonical.com>,  Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 03 Jul 2025 02:14:39 -0700
In-Reply-To: <20250702235245.1007351-1-briannorris@chromium.org>
References: <20250702235245.1007351-1-briannorris@chromium.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: DF0E12002E
X-Stat-Signature: o3w3y3w3p11afhnby3u45wzczkfx86mu
X-Rspamd-Server: rspamout06
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19OA/l/eAXftIseOTZ2q8WAkx41TDQGE94=
X-HE-Tag: 1751534080-251449
X-HE-Meta: U2FsdGVkX1+w2k13WXtPPzMt3eOf3uv8tNxeAqKIF9PxEmWgkvg4gv3XZjlPG2YUNKwq8iw4XDNGFX1torvavhhNinsJj9oOnoR156JcYStblMW9VXNC4chaqeSpETAL+5IeY9MfdWrKnawSLT3PKMYLyAzT+wjRcrV00BQriknDzMFxvGFMwaRj45lJBsUqxXAo2lSalFlBdnotQZHpsVXYO3R27j9g1qNBwXOEpQD9oNoHXVNvL/rUUy7zf8c0P4F9y+A9kUPJwY0RN237P5p0Y3dzmHD3iCLqYCefaGgD5SojdfY7kLiNJu40k7G7WDEZvV1jDNaAznjz3F+pG1HbSjldcMowPTln9w6IcZ3LPDnLurL362u/HvuypiU2kvdWRS78qq+oXW0Gbfn4tw==

On Wed, 2025-07-02 at 16:52 -0700, Brian Norris wrote:
> All of the ID tables based on <linux/mod_devicetable.h> (of_device_id,
> pci_device_id, ...) require their arrays to end in an empty sentinel
> value. That's usually spelled with an empty initializer entry (e.g.,
> "{}"), but also sometimes with explicit 0 entries, field initializers
> (e.g., '.id =3D ""'), or even a macro entry (like PCMCIA_DEVICE_NULL).
>=20
> Without a sentinel, device-matching code may read out of bounds.
[]
> Signed-off-by: Brian Norris <briannorris@chromium.org>

Acked-by: Joe Perches <joe@perches.com>

