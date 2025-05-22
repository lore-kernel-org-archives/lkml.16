Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9E2013C3C2
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 05:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747891515; cv=none; b=kZXANLCvAFILkzbWp3wWzmANvizMVojx9XyG0ucPIcm9kvq+BqqkAnEH5QOD5k7sNQhetDT8KmyRR87D2Dg96sUgCd0Ot8TUQ1aWnMfL0FqxrAdxmf0oRvGZel50Txp5PcAXRbr7zBrHqz/iTbJHTjAtm16A3uch9OB7I5h1Q70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747891515; c=relaxed/simple;
	bh=x/Pux/huB2dYDpaiohQ+vv+OuKgZHWSRmoRM+k6IiDo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=foKw+xAQH9P3gSzvWavEV+pQkLLZsaB7k7F2B2AQIf7oKleBnFVGo8b128xkgHvXuJyk9zVPASB05B/izWpzvxwunuOf1eEoJuiu3+sIIEPYD4FJmqoOvJdVgD2iZNlLteX/7utbVb9F7T+aFK7EqtE/ut+/VUBkkdRLj4OVIm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc5b-669ff7000002311f-32-682eb52a9d85
Date: Thu, 22 May 2025 14:24:53 +0900
From: Byungchul Park <byungchul@sk.com>
To: aahringo@redhat.com
Cc: kernel_team@skhynix.com, linux-kernel@vger.kernel.org
Subject: [RFC] DEPT(DEPendency Tracker) with DLM(Distributed Lock Manager)
Message-ID: <20250522052453.GA42746@system.software.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMLMWRmVeSWpSXmKPExsXC9ZZnoa7WVr0MgynLNC2+Xg+2uLxrDpsD
	k8f7fVfZPD5vkgtgiuKySUnNySxLLdK3S+DK2Dj/LlvBe7aKbR9vMjUw7mPtYuTkkBAwkfje
	NYEdxj51awsziM0ioCpxbd1XRhCbTUBd4saNn2BxEQFxiabv08HqmQUsJebdOsbUxcjBISzg
	JfFnSi1ImFfAQqL3TyM7hC0ocXLmExaIci2JG/9egpUzC0hLLP/HARIWFVCWOLDtOBPEBRdZ
	JW5sCYGwJSUOrrjBMoGRbxaSSbOQTJqFMGkBI/MqRqHMvLLcxMwcE72MyrzMCr3k/NxNjMCg
	Wlb7J3oH46cLwYcYBTgYlXh4HQ7oZgixJpYVV+YeYpTgYFYS4Y1doZMhxJuSWFmVWpQfX1Sa
	k1p8iFGag0VJnNfoW3mKkEB6YklqdmpqQWoRTJaJg1OqgTHwpr72I3VrhnnzZyfaV7bLBriy
	7bLaIvzw/L2Af/sL8r8nLb7G+VXgE7+444W3Uz6/Prb1tsbD+r2PBPpP5ae3aG9uNGNrn+WV
	6Wxuw+MueiZbVu5I9oGG1HvvuRUveDxfJXGn997fnfoa/ZNDy8q23XdTfRHZ4/R5b0fg/I+H
	3KTrWb6Z+CmxFGckGmoxFxUnAgA07+XxJgIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrNJMWRmVeSWpSXmKPExsXC5WfdrKu1VS/DoHmSpMXX68EWh+eeZLW4
	vGsOmwOzx/t9V9k8Fr/4wOTxeZNcAHMUl01Kak5mWWqRvl0CV8bG+XfZCt6zVWz7eJOpgXEf
	axcjJ4eEgInEqVtbmEFsFgFViWvrvjKC2GwC6hI3bvwEi4sIiEs0fZ/ODmIzC1hKzLt1jKmL
	kYNDWMBL4s+UWpAwr4CFRO+fRnYIW1Di5MwnLBDlWhI3/r0EK2cWkJZY/o8DJCwqoCxxYNtx
	pgmM3LOQdMxC0jELoWMBI/MqRpHMvLLcxMwcU73i7IzKvMwKveT83E2MwCBZVvtn4g7GL5fd
	DzEKcDAq8fA6HNDNEGJNLCuuzD3EKMHBrCTCG7tCJ0OINyWxsiq1KD++qDQntfgQozQHi5I4
	r1d4aoKQQHpiSWp2ampBahFMlomDU6qB0c9/+WzRx0vnLNDYahCWuO/EDdeCRN/O101OKXfm
	sV7ym5q2Sje1yOq5a6yrh/bfr6p7dJdbB7j9+N8vsMlruvzmY7y/5ilx7wkN4u15lev9+87B
	uhLbCeYu904KhGrf4VKebRjq+5/Bp/XfkzjZd74fT7bOnC1lpNHtON/43py+i5xn85OnKbEU
	ZyQaajEXFScCALVtJr4OAgAA
X-CFilter-Loop: Reflected

Hi Alexander,

We briefly talked about dept with DLM in an external channel.  However,
it'd be great to discuss what to aim and how to make it in more detail,
in this mailing list.

It's worth noting that dept doesn't track dependencies beyond different
contexts to avoid adding false dependencies by any chance, which means
though dept checks the dependency sanity *globally*, when it comes to
creating dependencies, it happens only within e.g. each single system
call context, each single irq context, each worker context, and so on,
with its unique context id assigned to each independent context.

In order for dept to work on DLM, we need a way to assign a unique
context id to each interesting context in DLM's point of view, and let
dept know the id.  Once making it done, I think dept can work on DLM
perfectly.

Thoughts or any concern?

	Byungchul
