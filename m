Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC8E4409
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 01:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749001942; cv=none; b=ESfFjcvrjFXWdRaRlIy4sAJlgzfsoD1cjSPq6n/c1M8Mu5j+iNJNVCbP3F0+gpRzdan4BLAddHjxA9CvZRYzhPu0uLBLbIZOyJImwdv3Jxe+drmVdb8MR7tniPprX87Xc/ijZUR4cxvjwGyyEheApzRP1AYSr+2D68ENOAtUX08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749001942; c=relaxed/simple;
	bh=L/kQAAxd9qcP43MCIiKlycIjMIgs/hq0eot+Bvm21Qw=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=NuJoMtsnbaxf6EeP5TIda+edf+f9Vl6sPB9l5GbiSf0IECJIHzGWFCZSpzMcUYoY75/A0UYTcg3cw1DIc/X4HufACd4M19967DdeZJ1h0Vg0boRs3SITuhpHis7cUlfQEgjI3xo5HKq4fzz9eRAv6IPMRJx2f6NQyVQeamFLchY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4bBr8C5Mgqz1BFj9;
	Wed,  4 Jun 2025 09:48:27 +0800 (CST)
Received: from kwepemk200017.china.huawei.com (unknown [7.202.194.83])
	by mail.maildlp.com (Postfix) with ESMTPS id EB4C1180237;
	Wed,  4 Jun 2025 09:52:15 +0800 (CST)
Received: from [10.174.178.219] (10.174.178.219) by
 kwepemk200017.china.huawei.com (7.202.194.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 4 Jun 2025 09:52:15 +0800
Subject: Re: [PATCH v2 3/5] genirq/msi: Move prepare() call to per-device
 allocation
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
CC: Marc Zyngier <maz@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>, Timothy Hayes
	<timothy.hayes@arm.com>
References: <20250513163144.2215824-1-maz@kernel.org>
 <20250513163144.2215824-4-maz@kernel.org>
 <0b1d7aec-1eac-a9cd-502a-339e216e08a1@huawei.com>
 <aD7B96BiSb6mK9Bj@lpieralisi> <87jz5tdl9d.wl-maz@kernel.org>
 <aD8Ioy+v8k/i0e8B@lpieralisi>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <7b9710fb-9438-6158-1e79-4f28674a5077@huawei.com>
Date: Wed, 4 Jun 2025 09:52:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <aD8Ioy+v8k/i0e8B@lpieralisi>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200017.china.huawei.com (7.202.194.83)

On 2025/6/3 22:37, Lorenzo Pieralisi wrote:
> On Tue, Jun 03, 2025 at 02:09:50PM +0100, Marc Zyngier wrote:
> > On Tue, 03 Jun 2025 10:35:51 +0100,
> > Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> > >
> > > On Tue, Jun 03, 2025 at 04:22:47PM +0800, Zenghui Yu wrote:
> > > > > +	domain->dev = dev;
> > > > > +	dev->msi.data->__domains[domid].domain = domain;
> > > > > +
> > > > > +	if (msi_domain_prepare_irqs(domain, dev, hwsize, &bundle->alloc_info)) {
> > > >
> > > > Does it work for MSI?
> > >
> > > This means that it does not work for MSI for you as it stands, right ?
> > >
> > > If you spotted an issue, thanks for that, report it fully please.
> >
> > Honestly, you're barking up the wrong tree. Zenghui points us to a
> > glaring bug in the core code, with detailed information on what could
> > go wrong, as well as what is wrong in the code. It doesn't get better
> > than that.
> >
> > The usual level of bug reports is "its b0rken", sometimes followed by
> > a trace with lots of hex and no information. Spot the difference?
> 
> Agreed, thanks again Zenghui for reporting it and forgive me if the
> message sounded a bit patronizing, I did not mean it.

Never mind :-)

Zenghui
