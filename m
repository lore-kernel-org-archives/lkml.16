Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B53742AB4
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 06:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750486295; cv=none; b=ok1ejK/hq9iaXbRyiLWRRlYdTKQJ/H0AR0rMBA81IRiZdgMBrQnuv9KXPOHNiedgyWl9mDxULEJXiMLVvb0t2dpXCib9eBfjOGFImbj+PLHurssh0sZahl8luEJM+kqjFAhXGJ/H9FqL4gDrG6QRnGZYRagtPCrOBEah3OywdjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750486295; c=relaxed/simple;
	bh=HsxsxikYb5N82JzhM/F/85WLCazoQYEAwcaD1vWA6Uw=;
	h=Date:Message-ID:In-Reply-To:References:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=vEvCE/hPDtyZkcSkZfjhMPjH5u5FyVTASzpe6HmCLL4sJjvRGgHDrOo0/1p3mQ/Y7z8G95DYGcUCvBUNPJJoHf/ZTVMPrMkop1sF4rB8M9PcNBhjpGVOpPJmBxVOSdYxo8gDlz2DDFnBSblEQO9Pu2uPsS+i8i8kCGhX6n4dc5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4bPP9r0htLz8R044;
	Sat, 21 Jun 2025 14:11:28 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl1.zte.com.cn with SMTP id 55L6BE2X044176;
	Sat, 21 Jun 2025 14:11:14 +0800 (+08)
	(envelope-from jiang.peng9@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid31;
	Sat, 21 Jun 2025 14:11:16 +0800 (CST)
Date: Sat, 21 Jun 2025 14:11:16 +0800 (CST)
X-Zmail-TransId: 2af968564d04ffffffffda0-110f6
X-Mailer: Zmail v1.0
Message-ID: <20250621141116690-r2XBDvxlTEKKmLkptW3g@zte.com.cn>
In-Reply-To: <62eb6d8a-7759-46b1-b06b-e7c6bc4f9a11@suse.com>
References: 20250620084104786r5xoR16_AmYZMJLnno3_Q@zte.com.cn,62eb6d8a-7759-46b1-b06b-e7c6bc4f9a11@suse.com
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <jiang.peng9@zte.com.cn>
To: <jgross@suse.com>
Cc: <sstabellini@kernel.org>, <oleksandr_tyshchenko@epam.com>,
        <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>,
        <xu.xin16@zte.com.cn>, <yang.yang29@zte.com.cn>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2Ml0geGVuL3hlbmJ1czogZml4IFc9MSBidWlsZCB3YXJuaW5nIGluIHhlbmJ1c192YV9kZXZfZXJyb3IgZnVuY3Rpb24=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 55L6BE2X044176
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 68564D10.000/4bPP9r0htLz8R044

> PS: Next time please don't send another version of a patch as a reply,
>      but as a new email thread.

Got it! New threads for future patches - thanks for the heads up.Sorry for any inconvenience caused, 
and thanks again for your patience with a newcomer like me.

Best regards
Peng
