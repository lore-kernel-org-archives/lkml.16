Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72042283C82
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 15:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746546043; cv=none; b=dk+q9fVJ3hBK5Q01KQl9FfFpOcNYNjgXH+/Tzgao5IIRqJsbMnNbYPhXGo14NZX2LwUk6rU3+IUD/cJzbGFaiqiCXHmi4XYQAqUjIY3GpI2iiltAARkhsiODZPGh/UwLXy/W9dRsro0eoRzt5+XCuCDWMy+m6ZfBPO5nQDWNwmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746546043; c=relaxed/simple;
	bh=082OGFd0YtRtIFtzua/WfoyrO3HoRqs1mD/Tio99ZG4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ME80Hv98p8fO3q4Z2NV3/kdRX4e1ieST3oeTts93zPudgmWvrFgJpdC1La5eILZELFsuTfyTdXceLAVZTmqcPw6OLekXs2BNIEBKEvT3+Wvu/pb7lqnLFVnGvyWJk5cqdmeo26/j7x08fCd8j1+SDuosyOUSX0EbDEMYxF8IOy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=xQ+5fhAc; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="xQ+5fhAc"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1746546036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gwv48sU9PJ4+7zMEwJ0xKCOMMLiUiKmC1HBLpcwOGag=;
	b=xQ+5fhAcVue/iuF+8Br2AfJk+F2PNrGTIFtgtSGXlv969wK3d7A5JS8CAPN7x83oaZcj98
	Fjgf/tD6zhi22M7GdSK5hnUi2xVCKYcjPxZ9TojP6acImQOMyTBHo8YWcOfSntpWUymZnx
	/M0TCEFPng0lJNhGpqKSOG+t7oDZUkm4TiaLo7e/XUn9Kz9GV0oPL4oBrXuBCXMcFp8sQM
	vpxhdMdu2zG+kzoe0fbODuMiQ2c1RX/8+DvKZ9N2c+hrT5IpQdKUUsdtnStDtV/Wp/ULPp
	SQ1zrqlFWqLZi3jpaui/RZscTMVxLApJrYUeGsmfpHoFZ/yAFokQgICfO2k8NQ==
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: pmladek@suse.com, Aditya Garg <gargaditya08@live.com>
Cc: admin@kodeit.net, airlied@redhat.com, akpm@linux-foundation.org, 
 andriy.shevchenko@linux.intel.com, apw@canonical.com, asahi@lists.linux.dev, 
 corbet@lwn.net, dri-devel@lists.freedesktop.org, dwaipayanray1@gmail.com, 
 geert@linux-m68k.org, joe@perches.com, kees@kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@rasmusvillemoes.dk, lukas.bulwahn@gmail.com, marcan@marcan.st, 
 mripard@kernel.org, rostedt@goodmis.org, senozhatsky@chromium.org, 
 simona@ffwll.ch, sven@svenpeter.dev, tamird@gmail.com, tzimmermann@suse.de
In-Reply-To: <PN3PR01MB959760B89BF7E4B43852700CB8832@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <20250428123132.578771-1-pmladek@suse.com>
 <PN3PR01MB95971954FC5E026C59B6F8EDB8802@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB959760B89BF7E4B43852700CB8832@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Subject: Re: [PATCH v3] checkpatch: remove %p4cn
Message-Id: <174654603220.12228.11601081754262000250.b4-ty@rosenzweig.io>
Date: Tue, 06 May 2025 11:40:32 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On Wed, 30 Apr 2025 19:19:08 +0530, Aditya Garg wrote:
> %p4cn was recently removed and replaced by %p4chR in vsprintf. So,
> remove the check for %p4cn from checkpatch.pl.
> 
> 

Applied, thanks!

[1/1] checkpatch: remove %p4cn
      commit: a6c0a91ccb257eaec2aee080df06863ce7601315

Best regards,
-- 
Alyssa Rosenzweig <alyssa@rosenzweig.io>

