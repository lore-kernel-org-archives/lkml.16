Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8620F2882BD
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 19:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748373727; cv=none; b=rw+Q4Hx3/x5Ub1nUAgnhuLUgG9F1OHwTUDXVFL9pfZl9nCEeWEbBeK2ymHHJkCDOOQvNdpIJU2E8bUgQ5EKP5ICgggWfmytOUyPDzJBb4OoXQp6yO4rm67hv0GcNRKMUnK82QZdi2ChJRSZsmgT9bCAMcOKh2fKZBhZ94m4XktA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748373727; c=relaxed/simple;
	bh=JxBRh0Vq4E+G8+OrUwhXT/4DRpNGa0/BjE1bb3JHjs0=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=BmVUegFrji+zbnVqc2jpDfHISdJqZ4IWMO45KXBXDnrdk0tYdyRGy7Nl+Tm6o5fbK99XjSivDtsLj694qawTcOHBhgTM3h52cA1wDsOMX0MYcUx7tOlXT5ht+mpEekkP+4RqDXK+ZEIlp/NxmV1FYSbzy8KSayp97gAXCzUIs5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=V5EVJtwJ; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="V5EVJtwJ"
Received: from smtpclient.apple ([IPv6:2600:1010:b069:8c00:5424:66c9:518d:199c])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 54RJLr0I1144786
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 27 May 2025 12:21:54 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 54RJLr0I1144786
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025052101; t=1748373714;
	bh=WKuq4Pak9aKZHDwpamW1iZupuar33qNoHd5DpIJRkC0=;
	h=From:Subject:Date:References:Cc:In-Reply-To:To:From;
	b=V5EVJtwJBXLCBAMMHPU2rdayeHCqKZ8ASrzdu1tVqcwOLEWq1t54gKhrnpFdocaHc
	 8ZF0YM3pkkOvs9d/Gg78/pGbDEOrYKAB/0ksD19t5HPqimOMMto2keMDsqaxYfdHy7
	 aKbyhdCykZkncuSetAWp0htMz29s8jcQYeefJHVhb4aGpzHdB1wcrPZ8rPDzFJiId4
	 WGsioLzv+OLUJouvVG+u7b7yPASdSCguWKLkS1lbun0R1x/dlfELrcox2jLHcYt1al
	 DQRNt/q8FwAllUbZ4XgJxC9AE5zNZGATkOJ/PC+KNTvXwVaOEdeTSQ4s7wXigicCdm
	 hwRHMlk5Yl8XA==
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Xin Li <xin@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [Bug Report] Linux v6.15-rc7 boot failure on Xen-4.17
Date: Tue, 27 May 2025 12:21:37 -0700
Message-Id: <C28A8745-02AD-489E-B2F3-6DE81C511783@zytor.com>
References: <607917bc-6788-425a-8051-181a078ddb49@suse.com>
Cc: Gupta Pawan <pawan.kumar.gupta@linux.intel.com>,
        linux-kernel@vger.kernel.org, x86@kernel.org,
        Zijlstra Peter <peterz@infradead.org>,
        Hansen Dave <dave.hansen@linux.intel.com>,
        alexandre.chartre@oracle.com,
        Cooper Andrew <andrew.cooper3@citrix.com>,
        Zhang Tao1 <tao1.zhang@intel.com>
In-Reply-To: <607917bc-6788-425a-8051-181a078ddb49@suse.com>
To: =?utf-8?Q?Gro=C3=9F_J=C3=BCrgen?= <jgross@suse.com>
X-Mailer: iPhone Mail (22F76)


> On May 27, 2025, at 11:36=E2=80=AFAM, J=C3=BCrgen Gro=C3=9F <jgross@suse.c=
om> wrote:
>=20
> =EF=BB=BFOn 27.05.25 19:54, Xin Li wrote:
>> On 5/27/2025 10:46 AM, Pawan Gupta wrote:
>>>> Attached is the serial console log and my kernel config.
>>> Serial logs aren't telling much. I do not have a Xen setup to test, with=
out
>>> Xen the config that you provided is booting a KVM guest just fine.
>> Yeah, as I replied to Juergen, the same kernel binary boots fine as
>> "native".
>> Unfortunately when booting as dom0 on Xen, it keeps rebooting w/o
>> helpful log.
>=20
> What about booting Xen on bare metal, i.e. no KVM being involved?

The same exact problem happens on Intel Simics.  And I got to see it=E2=80=99=
s a NX page fault in dom0 kernel during apply alternatives.

It takes a while for me to set it up on bare metal so it won=E2=80=99t happe=
n so soon.

A more serious question in my mind right now is that who are acutely testing=
 latest vanilla Linux on xen?=

