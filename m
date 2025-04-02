Received: from server.wki.vra.mybluehostin.me (server.wki.vra.mybluehostin.me [162.240.238.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C997238176
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 12:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.240.238.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743595922; cv=none; b=nR3a8pmV3blytLutbvtKy1H0jEPQ6/+8rrVaIZyAx6866EA5oMkBr0KhR9iDFCUWeqehHJCCZVoKeKpprZXoCVPZ+dXNjyER+m1/cVLWoBwHqWgDNWVi234pd3f0O23+jrCs4tltkmY1Of9Rc08MmTDFFJs5yrAs+LRxtfXNE4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743595922; c=relaxed/simple;
	bh=FkETGtd5oirHcqy7UomTzHR0h/ZNKqneE/L9DrFUULE=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=LE9V9oIaaVGTFgfx+6xmUyo8SzdFhv9LBWHkIBLQnTx3ae8+TV6c/A8CUUShD0rCVgptKyoaNU4Tp+w1P2JTrNw5qTpJyB7myHKG63S1tSnlaJkNZnW3IR38dUd/RQoQQbOJF5uaCCBPbTP+sz1n30ChQy8W7/PpTMRe4TJuxgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com; spf=pass smtp.mailfrom=couthit.com; dkim=pass (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b=Qow0NEHv; arc=none smtp.client-ip=162.240.238.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=couthit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b="Qow0NEHv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=NHSR5BStKwi1555Ad2VJ4FWLFRVBPtFtaXf27EPrHpo=; b=Qow0NEHvhROtmsdaPYA3K9Nhdi
	iItGrN3VPudWnDfBIfeQwZfZsP414JRduZQb9hCagbv+ilAo2eHvsCpE5W8HcHGUjufwhuTHdno4j
	um0wvtBTcXt4jowdu3KbCr7hrW/2DbSsAEKBYn8tPqiyLh2YH7EXjWjB6Haa5+EUgxEdUEr0ZwaD1
	DxTbH8CDbnnI7sOQ2dS7FhN2UYVNZF6i4lX3taWIXEMLZKaUitpYxncJTvS2KEz7PjV/dRTiJe3oA
	IwiZYfubaCmjRd2q/GsgWRwanlEcfiMPKM7oIj3KYtSpFwAtZpjf7F8PeNsowyoxTiGEtWORwyViF
	n8dZ3erw==;
Received: from [122.175.9.182] (port=29799 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1tzwaz-000000002g4-2ckb;
	Wed, 02 Apr 2025 17:19:25 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id E40B017821E7;
	Wed,  2 Apr 2025 17:19:19 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id CEDCE1783FDC;
	Wed,  2 Apr 2025 17:19:19 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id KkYWWDFBf6_1; Wed,  2 Apr 2025 17:19:19 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id A534E17821E7;
	Wed,  2 Apr 2025 17:19:19 +0530 (IST)
Date: Wed, 2 Apr 2025 17:19:19 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: nm <nm@ti.com>, Kevin Hilman <khilman@baylibre.com>
Cc: basharath <basharath@couthit.com>, ssantosh <ssantosh@kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	pratheesh <pratheesh@ti.com>, Prajith Jayarajan <prajith@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	danishanwar <danishanwar@ti.com>, praneeth <praneeth@ti.com>, 
	srk <srk@ti.com>, rogerq <rogerq@ti.com>, afd <afd@ti.com>, 
	krishna <krishna@couthit.com>, pmohan <pmohan@couthit.com>, 
	mohan <mohan@couthit.com>, parvathi <parvathi@couthit.com>
Message-ID: <706306271.973226.1743594559548.JavaMail.zimbra@couthit.local>
In-Reply-To: <1365068627.843903.1742210370862.JavaMail.zimbra@couthit.local>
References: <20250108125937.10604-1-basharath@couthit.com> <20250108125937.10604-2-basharath@couthit.com> <20250307210517.5xjfc6wntcbj3s4k@precision> <1365068627.843903.1742210370862.JavaMail.zimbra@couthit.local>
Subject: Re: [PATCH v2 1/1] soc: ti: PRUSS OCP configuration
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF113 (Linux)/8.8.15_GA_3968)
Thread-Topic: PRUSS OCP configuration
Thread-Index: DvRQZaXzAimB/uZVNUsWawvfCP38JsM+ekCT
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.wki.vra.mybluehostin.me
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.wki.vra.mybluehostin.me: authenticated_id: smtp@couthit.com
X-Authenticated-Sender: server.wki.vra.mybluehostin.me: smtp@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Hi Nishanth,
 
>> On 18:29-20250108, Basharath Hussain Khaja wrote:
>>> From: Roger Quadros <rogerq@ti.com>
>>> 
>>> Updates OCP master port configuration to enable memory access outside
>>> of the PRU-ICSS subsystem.
>>> 
>>> This set of changes configures PRUSS_SYSCFG.STANDBY_INIT bit either
>>> to enable or disable the OCP master ports (applicable only on SoCs
>>> using OCP interconnect like the OMAP family).
>>> 
>>> Signed-off-by: Roger Quadros <rogerq@ti.com>
>>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>>> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
>>> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
>> 
>> On the verge of applying this patch, looking deeper, I noticed
>> drivers/bus/ti-sysc.c managing the sysc controls. infact, I wonder if
>> b2745d92bb015cc4454d4195c4ce6e2852db397e ("bus: ti-sysc: Add support
>> for PRUSS SYSC type") could be merged with this?
>> 
>> 
>> Could you say why drivers/bus/ti-sysc.c would'nt be the right solution?
>> 
>> Ccying Kevin if he has any ideas about this.
>> 
> 
> Thank you for the feedback.
> 
> We will analyze ti-sysc and revert back with an update shortly.
> 

We've reviewed the code and decided to bypass the SOC patch posted here.
Instead, we have implemented the required changes in the "drivers/bus/ti-sysc.c"
file to enable OCMC access to the PRU-ICSS and verified the Ethernet
functionality over PRUETH on AM335x, AM437x and AM57x platforms.

This patch will be abandoned and a new patch will be posted with
"drivers/bus/ti-sysc.c" changes shortly.


Thanks and Regards,
Parvathi.
