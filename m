Received: from smtp113.iad3b.emailsrvr.com (smtp113.iad3b.emailsrvr.com [146.20.161.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D2B2951B2
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 11:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=146.20.161.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744718224; cv=none; b=IxyHy+k+XMPQnO2ttZQnzkf6AZAYSJgT6ccKzT6IepVHMA7zVAmXL+SUnWnbXL7yML9hgN2hDIdhydEZis7IYH9Lrapm9Rmu9XzJ6KLF01OmyhEpnPztK2fQls8hwZhaZig4Yld81hNTVSq2fDaqrJ/BWV5Gcgj+9UR8kF7w7b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744718224; c=relaxed/simple;
	bh=/D1SoD2BbzdR3rFVdil+XzeMl7EfIP2+LAtsJUKDewA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OCjHhd3L8LHquI+niAGGwzCOKA8CDa8e7hfuPtbyeNX2xE+kcxqyOjTVEXCwJy1IwpafOSzb/JZ0kWp24sEmK4knDRQ37BaFvZFnAC2SphHm6ntUzz1f7QZUf/CHVQsymguQjChSFNovHdLzEnMMeuzyh4ipFTNulckDMTRJfas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk; spf=pass smtp.mailfrom=mev.co.uk; dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b=WQnDvJfl; arc=none smtp.client-ip=146.20.161.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b="WQnDvJfl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20221208-6x11dpa4; t=1744717225;
	bh=/D1SoD2BbzdR3rFVdil+XzeMl7EfIP2+LAtsJUKDewA=;
	h=From:To:Subject:Date:From;
	b=WQnDvJflYaNy6TH/SRnQJe/Nau1YNulSU7wxo/gh9nNt5f6hpnR/WPZtEpjy3DfZM
	 kgDhJAg/lV4J1SOGH+nertflMfMF2GYPx4cgPZ9lByeqjVvTDLRWkUm7PEdm4i1F1e
	 5uJIOvAZlMPOs5o894A4VfvcTQcXTOHgd13KEJTI=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp15.relay.iad3b.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id D62EFC034F;
	Tue, 15 Apr 2025 07:40:24 -0400 (EDT)
From: Ian Abbott <abbotti@mev.co.uk>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Christoph Hellwig <hch@lst.de>
Subject: [PATCH 1/4] comedi: ni_pcidio: Do not bother filling buffer with 0xaa byte values
Date: Tue, 15 Apr 2025 12:35:56 +0100
Message-ID: <20250415114008.5977-2-abbotti@mev.co.uk>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250415114008.5977-1-abbotti@mev.co.uk>
References: <20250415114008.5977-1-abbotti@mev.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Classification-ID: 8a53f2c5-5989-413b-be2c-df2839710a9a-2-1

On buffer change, the driver informs the mite module about the buffer
change and then it fills the buffer with byte value `0xaa` using
`memset()`.  Do not bother filling the buffer.  None of the other Comedi
drivers do this.

The aim is to get rid of the `prealloc_buf` member of `struct
comedi_async` (which is from a `vmap()` covering the whole buffer in
those Comedi drivers that do not use DMA), and use the per-buffer-page
addresses from the `virt_addr` member of `struct comedi_buf_page` to
access the buffer contents instead.

(If necessary, we could add a `comedi_buf_memset()` function to fill the
buffer with a byte value, but it's not worth it in this case.)

Signed-off-by: Ian Abbott <abbotti@mev.co.uk>
---
 drivers/comedi/drivers/ni_pcidio.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/comedi/drivers/ni_pcidio.c b/drivers/comedi/drivers/ni_pcidio.c
index 2d58e83420e8..2c7bb9c1ea5b 100644
--- a/drivers/comedi/drivers/ni_pcidio.c
+++ b/drivers/comedi/drivers/ni_pcidio.c
@@ -747,8 +747,6 @@ static int ni_pcidio_change(struct comedi_device *dev,
 	if (ret < 0)
 		return ret;
 
-	memset(s->async->prealloc_buf, 0xaa, s->async->prealloc_bufsz);
-
 	return 0;
 }
 
-- 
2.47.2

