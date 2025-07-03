Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C9025A2C0;
	Thu,  3 Jul 2025 18:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751566665; cv=none; b=lz4do2xhmspXkkmgBZdMa7UO7uI8w/2iSDkosLPoWEjs4xZmRkoOVunKHiKzL0mEYQxLBBXEGozpZ9iSS1yrLw7lIzxeLgXrBOE+UXE9QUw+R2Oot1gxTd10s9zE3pdXxcKBAt+Ua3kA6tIQqJI96sb8bFssFOidMWb7f4OheXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751566665; c=relaxed/simple;
	bh=7oS/5aSh6m5V1wzynK5AZkydMax405IFDZMPHMVAlu0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ooi+vKsCsI+cK8pULlUjz8cke9Ve5ElLTEMim8gas8lMfZW8hoxmhfr1VTcS53uhqEhcEOp4A5ICPDyFZCw0Z9za6LI49vIJR2togQ6hgJqtGXLYjfyLcNTMELfOUFhDy/+MHVyJPxi3xCUjIF7rYkLtPuENUGyynxUNtRPcqAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=e7W74O7Y; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="e7W74O7Y"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2E1E6406FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751566663; bh=KNrNFFjvmsGcrL3H7Tifc5ZRglia5fsVJUZcYmQ27fo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=e7W74O7YqCAdg6lWX6bHPoS6kGsOCxn9s7bumPuLApDU2Trykm33xNaBVoMCWrqq2
	 gGqZKTPvlMpvo/xjuOGKlh3hYU3TZkU7TQx467G8fG0ubJd4Wp3VM3z/blWCo+CbCb
	 M8h30nUnJAYJ5RU9TGsH3jDlEWBdHgwpLryKH7vTtCjBLVF5MSjERm7KC0A3OAbT2H
	 RrUa/3FqZBN7dRpgFa7TELmYScQ3L+bdX2z41JKQ3owe8xbAaG+GdxOrnT5VCD+ow6
	 yEgkW8T3LEF9f8jiy/BYoz42cR/SAXo/F4I4XRQRX889QMiPQLlqv91SQOWJk30wlH
	 JQAuJDM7uFqJA==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 2E1E6406FA;
	Thu,  3 Jul 2025 18:17:43 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Akira Yokosawa
 <akiyks@gmail.com>
Subject: Re: [PATCH 7/7] docs: kdoc: pretty up dump_enum()
In-Reply-To: <20250703175731.1a4871e3@sal.lan>
References: <20250701205730.146687-1-corbet@lwn.net>
 <20250701205730.146687-8-corbet@lwn.net> <20250703175731.1a4871e3@sal.lan>
Date: Thu, 03 Jul 2025 12:17:42 -0600
Message-ID: <874ivtkuk9.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Em Tue,  1 Jul 2025 14:57:30 -0600
> Jonathan Corbet <corbet@lwn.net> escreveu:
>
>>                  self.emit_msg(ln,
>> -                              f"expecting prototype for enum {self.entry.identifier}. Prototype was for enum {declaration_name} instead")
>> +                              f"expecting prototype for enum {self.entry.identifier}. "
>> +                              f"Prototype was for enum {declaration_name} instead")
>
> Even being a big one, my personal preference would be to break the long
> string here, as keeping together is easier for grep, but yeah, I also
> considered breaking it ;-)

Did you mean your preference would be to *not* break it?

There's a non-greppable piece at the break point anyway, so I wasn't
anticipating making life harder for anybody there.

Thanks,

jon
