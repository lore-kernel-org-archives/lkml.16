Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF18F1F8751
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 14:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748960962; cv=none; b=ADSqa+W9JVDtMln1SI276LiVePXxmnLmFPb0nYqZnMmg9ITelW7rvf427yoOgUtW8cdpIxBBwxm3wFHS3fX6uwgQT4YbCFZJLXORLOneMEbbaoqOdwGcFAkIN3NNbVoer1pvbn8cIXJ0w8xOx+CVIvd2jIZChT2jT55LvN7Saos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748960962; c=relaxed/simple;
	bh=tQNECUGCwVN8w2nYeGxHhxzcbA2Ok5UYLhhpx9vz1U0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vDSrYitESHJhQgKq3eMNlYRxrGrp8M1dBfZ2oazIfAnNGND8RvtXOwOMSRDmUYCXlhKkSRd+NuyUH6GhZEhtSdq/yKtjC/KuZrs8Yi/J1qrfstVtRxURTisutGSQcQ6idWSs0UFmNcdQFbNlTmzQIpWlIhK8cb8GriK7emZhiz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=UEflr7AC; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="UEflr7AC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=biEa0C/Zx7biEXb9wrt4J7t8LJ1eZ405M+nXFoTKcvw=; b=UEflr7AC00Fja8TgNI4V56+5Xl
	lAVk1dQ6yvd1mttvOdmIvxG2jwVo34OgfToE+1k0ECnW6ZnJvEYk8ST5O7uwaTdgsZW/Gd2dgYIrx
	5v2SOfYJz4Ap/rzMsdr1YyrSGrlteiyaNLs0pOwR8pR6irR/chHc43KfQ0KpIDkSvLd3YAL12gckc
	NIAPlZDn5UUVv8l4JuexDHusjnp9gvM8EC6BTNiArB55u7nhSBf7uvcfrueJ5r5KTwqdlfkd9yDtz
	c0QlsagG6aF9PiMyZMGSppEkXAigxezW8y8cQrl0VHMf8Gc6mp4qrXJHezaITrTXXuqrT87Icik9N
	201yssGQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMSde-0000000Deph-1ZQN;
	Tue, 03 Jun 2025 14:29:14 +0000
Date: Tue, 3 Jun 2025 15:29:14 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Julian Vetter <julian@outer-limits.org>
Cc: Arnd Bergmann <arnd@arndb.de>, "Jason A . Donenfeld" <Jason@zx2c4.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Remove unaligned/packed_struct.h header
Message-ID: <20250603142914.GA299672@ZenIV>
References: <20250603132414.3676142-1-julian@outer-limits.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603132414.3676142-1-julian@outer-limits.org>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Tue, Jun 03, 2025 at 03:24:14PM +0200, Julian Vetter wrote:
> The functions in this header are deprecated and are not used anymore.
> So, remove the header entirely.

; git grep -n __get_unaligned_cpu32
include/linux/jhash.h:80:               a += __get_unaligned_cpu32(k);
include/linux/jhash.h:81:               b += __get_unaligned_cpu32(k + 4);
include/linux/jhash.h:82:               c += __get_unaligned_cpu32(k + 8);
include/linux/unaligned/packed_struct.h:16:static inline u32 __get_unaligned_cpu32(const void *p)
tools/include/linux/jhash.h:80:         a += __get_unaligned_cpu32(k);
tools/include/linux/jhash.h:81:         b += __get_unaligned_cpu32(k + 4);
tools/include/linux/jhash.h:82:         c += __get_unaligned_cpu32(k + 8);
tools/include/linux/unaligned/packed_struct.h:17:static inline u32 __get_unaligned_cpu32(const void *p)
