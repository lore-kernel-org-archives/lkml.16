Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA1FF1F1524;
	Tue, 13 May 2025 11:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747134845; cv=none; b=OheaNJcalpsQ+LbCPzi3/47VUhl4xuqpFFfHHs7feX3BzNxeDgTIwAL4/5/kcTU9u+zZ81aqqfixm2t2ZwoBPPErCd1XYhz5+Ja4gzDaFgWIEXM5ZX9GtdZcJAv+Et+HqsL6nhyig1GqrypxmLHN7vwDR5zdRbqPrDnMjC1nrZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747134845; c=relaxed/simple;
	bh=1eaKnnauiDDzxRMDthN8gsYILStP0DWnof6rHGvECyo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=U+VQiHDOE5hUAyBoYZyrvGGzRrk9d7mvuSr1cFDQdHJZE5reyOeyWdM3S8NjdlXHkLjdMyKK8o+Vew+mpwEHJXqAokB1NHL+nj48ZWi413fzBq+AywzEORFbDxhs1i9gWswduWWeiLdDItDJzfyGXRHxi5NpRaHC6LW8fjvwIMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=KkxDlLyy reason="signature verification failed"; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="KkxDlLyy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=PKtsvJDtnEfa84Pam4CObLn6iqlKvmlfdSp+lHkFVkg=; b=K
	kxDlLyyumAtM0JLkRtTaUrnlATpK+N8/z390FmZQkzfIFThFDVXi4QHZodEJRSOp
	yNsblihIKb5YwNJioxdrWnBKrLxWrukWu8pKzRwGhrFYv1USrD5Kg2kQxx9woPO3
	nq2FcTjZgRJLnZ4V2h42eZDPjZkAk4/zb3NRkPZjMU=
Received: from 00107082$163.com ( [111.35.191.17] ) by
 ajax-webmail-wmsvr-40-140 (Coremail) ; Tue, 13 May 2025 19:12:47 +0800
 (CST)
Date: Tue, 13 May 2025 19:12:47 +0800 (CST)
From: "David Wang" <00107082@163.com>
To: "Oliver Neukum" <oneukum@suse.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
	stern@rowland.harvard.edu, surenb@google.com,
	kent.overstreet@linux.dev, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] USB: core: add a memory pool to urb for
 host-controller private data
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <3fa2cbc3-fe81-4364-96c1-b753c52ddc16@suse.com>
References: <20250512150724.4560-1-00107082@163.com>
 <20250513055447.5696-1-00107082@163.com>
 <48d5cae9-ff7c-4076-8b71-8c16bcf00443@suse.com>
 <4006cec4.794d.196c8be2fd1.Coremail.00107082@163.com>
 <b07c7d9f-a20a-49bc-adbc-d43326b2d2df@suse.com>
 <3dd5e698.921f.196c90c33af.Coremail.00107082@163.com>
 <3fa2cbc3-fe81-4364-96c1-b753c52ddc16@suse.com>
X-NTES-SC: AL_Qu2fBf2Yu08t4SaQYOkXn0oTju85XMCzuv8j3YJeN500hyXu0S8aeXBlN37a7cO+Ii2SvxeOXx1Xze5BeIVWXYPTkN5ahDXEcC/k3l+Bf3Hh
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <7259897e.9f89.196c958e24d.Coremail.00107082@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:jCgvCgD3z_0wKSNoOYYDAA--.15400W
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/1tbiqA1MqmgjIbiEAAABsU
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkF0IDIwMjUtMDUtMTMgMTk6MDI6NDIsICJPbGl2ZXIgTmV1a3VtIiA8b25ldWt1bUBzdXNlLmNv
bT4gd3JvdGU6Cj4KPgo+T24gMTMuMDUuMjUgMTE6NDksIERhdmlkIFdhbmcgd3JvdGU6Cj4KPj4g
SGksIEkgaGF2ZSBvbmUgcXVlc3Rpb24gYWJvdXQgbWVtIGZsYWdzLgo+PiBJZiB1c2Jfc3VibWl0
X3VyYiB3YW50cyBhIG1lbW9yeSBpbiBjb250ZXh0IG9mIGZsYWdzIEEsIHNheSBHRlBfQVRPTUlD
LCBidXQgSSBhbHJlYWR5IGhhdmUgYSBtZW1vcnkgYWxsb2Mgd2l0aCAgZmxhZ3MgQiAgYW5kIGl0
cyBzaXplCj4+IGlzIGJpZyBlbm91Z2gsICBpcyBpdCBzYWZlIHRvIHJldHVybiB0aGlzIG1lbW9y
eSAgdG8gdXNiX3N1Ym1pdF91cmIgIHdoaWNoIGlzIGluIHRoZSBjb250ZXh0IG9mIGZsYWdzIEE/
Cj4KPlllcywgdGhhdCBpcyBwZXJmZWN0bHkgc2FmZS4KPgo+CUhUSAo+CQlPbGl2ZXIKCgoKQ29w
eSB0aGF0fgoKClRoYW5rcwpEYXZpZAo=
