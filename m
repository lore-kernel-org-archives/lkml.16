Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1721189F3F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 01:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743644059; cv=none; b=ugCZEUbC9bgXDRLKtdt+aH1DLlwIzfQx0ia6n+GDefy5d+zb7RgP4PM/mv1M062Htp/P5vx8riXKqUOM7R7h7ojzfnidaJqrkOHXZIEF09YYlHOY5XhpQHZo10N+aiMdhX8lLACHLEpxxKPPyf9M7d+2QKH5NsyQOJQdA212mT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743644059; c=relaxed/simple;
	bh=RUrQglhP2uGzTvm3K6zC5Ju6ItNRAbOsnW/DfhmBxb0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:In-Reply-To:
	 Content-Type:References; b=SrswB8bjc+sPz6V2p96m7W3O6mxM9HbK5kG9MYAOGxzXLFvQbCIGcl37dq89uyKC41sAqmX6ommU3rd0szzJhkm5ywm7VL7bP3aMKPwT+vmDlB/0fPHssk37hCre0+e7R3ODq/26V9SLsSd65b74OvXYUBC8Y0ayj5aGFP6Artg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ls1DG/gl; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ls1DG/gl"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250403012629epoutp0114ef4cde028921ab47e63bbfc96ab742~yqpshpkGy1687616876epoutp01q
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 01:26:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250403012629epoutp0114ef4cde028921ab47e63bbfc96ab742~yqpshpkGy1687616876epoutp01q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1743643589;
	bh=w8g+yMJkj7PP7z/x7FfO0A2BRmflOUZusbSFfGg9wIE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ls1DG/glQeYF8lEiS3ueGJGNSkHTiNOevk7FcMd92hnIDTqCEVj3Tqw4NPoMotx4p
	 dznLW216sbdVVcrod7XJTohD8l+QRln7fWjS0TBDE5U4qeIH7G2AHFnL9eEzT56CCt
	 75pXK9/tzWzqu049zfbj+ItgLFTqBrP58Atyp2yA=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250403012628epcas2p346ca10ab9239ef00e78eeba378e8fd6f~yqpr7UAem2042220422epcas2p3l;
	Thu,  3 Apr 2025 01:26:28 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.100]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4ZSkbR5gsxz3hhT3; Thu,  3 Apr
	2025 01:26:27 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	A0.4F.10159.3C3EDE76; Thu,  3 Apr 2025 10:26:27 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250403012627epcas2p167a40fa02e775d5e6647d469ecc370c1~yqpq772__2437524375epcas2p13;
	Thu,  3 Apr 2025 01:26:27 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250403012627epsmtrp29839841071b9243d760fd01ad1ff5a38~yqpq7EzL_2393023930epsmtrp2F;
	Thu,  3 Apr 2025 01:26:27 +0000 (GMT)
X-AuditID: b6c32a46-9fefd700000027af-ba-67ede3c35dc5
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	9A.88.08805.3C3EDE76; Thu,  3 Apr 2025 10:26:27 +0900 (KST)
Received: from perf (unknown [10.229.95.91]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250403012627epsmtip2d7bbac47a692c1a59afd6665302ec668~yqpqq1Ep10314103141epsmtip2j;
	Thu,  3 Apr 2025 01:26:27 +0000 (GMT)
Date: Thu, 3 Apr 2025 10:30:42 +0900
From: Youngmin Nam <youngmin.nam@samsung.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Saravana Kannan <saravanak@google.com>, Sudeep Holla <sudeep.holla@arm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, Vincent Guittot
	<vincent.guittot@linaro.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com,
	hajun.sung@samsung.com, d7271.choe@samsung.com, joonki.min@samsung.com,
	Youngmin Nam <youngmin.nam@samsung.com>, ne.yoo@samsung.com
Subject: Re: [GICv3 ITS]S2IDLE framework does not invoke syscore_ops in
 GICv3 ITS driver
Message-ID: <Z+3kwsesiXyC0hbO@perf>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250402-messy-wild-squid-7b4da9@sudeepholla>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAJsWRmVeSWpSXmKPExsWy7bCmue7hx2/TDbpnaFpc2zuR3aJp/yVm
	i6u73zFb7NguYrHp8TVWi8u75rBZ7JxzktVi2fEuVouuQ3/ZLJaf2sFisXnTVGaL42vDLTqO
	fGO2WHzgE7sDn8e23dtYPdbMW8PosWBTqcemVZ1sHneu7WHzeHfuHLvH5iX1Hn1bVjF6fN4k
	F8AZlW2TkZqYklqkkJqXnJ+SmZduq+QdHO8cb2pmYKhraGlhrqSQl5ibaqvk4hOg65aZA3S5
	kkJZYk4pUCggsbhYSd/Opii/tCRVISO/uMRWKbUgJafAvECvODG3uDQvXS8vtcTK0MDAyBSo
	MCE748KK8+wFLcIVfy9OZW9gXM/XxcjJISFgItHwdgtLFyMXh5DADkaJSX+eMkE4nxglfi+d
	yA7hfGOUePrhKgtMy8ats6ESexkltjxYzAzhPGSU+NDcyQ5SxSKgIrG6ewMbiM0moCux7cQ/
	RhBbREBdYsnZLYwgDcwC15glNux9DrSQg0NYIEricXscSA2vgLJEU9ceVghbUOLkzCdgmzkF
	rCVevNgNdqyEwAEOiUfPFrJCnOQi8bfzMZQtLPHq+BZ2CFtK4vO7vWwQdrFEw/1bzBDNLYwS
	p66/YIZIGEvMetYOdh2zQIbEgjevWUEOkgC64sgtFogwn0TH4b/sEGFeiY42IYhONYlfUzYw
	QtgyErsXr4Ca6CHR+rUFGo73GSU2Tv/FOIFRbhaSf2Yh2QZh60gs2P2JbRbQCmYBaYnl/zgg
	TE2J9bv0FzCyrmIUSy0ozk1PLTYqMIJHcXJ+7iZGcFLWctvBOOXtB71DjEwcjIcYJTiYlUR4
	C7XepgvxpiRWVqUW5ccXleakFh9iNAVGzkRmKdHkfGBeyCuJNzSxNDAxMzM0NzI1MFcS5z30
	8Wm6kEB6YklqdmpqQWoRTB8TB6dUA5NWfvpzh5yJL5gCJ6fEPmVZF/7dcqfYp/iWx1u2vr1k
	J6edIeXExRVrdrZY7472pYrXddF8W8W0PqXcCDrtXxedKPPZf6PVltVeh+5n9sQzneJhbdTw
	ymw74P5us9uB3+ESr/69WPfXQPWQaKXiCYFH03/+DFn/uShQdGML56yLTx9cNvZ0StTf9+/P
	vRAPvhQzdo49Rb/VJJT6o5iDHwulPcrKlHD9d5i34Vtx0t1mhzr3P02lFQ+LHD33XfnBf9U+
	VVoy/sJCSd7CHY6hC5ljduWs3WW6dI6ftL5maDh/WWdE60Qh94gDhbsfZsmlvv7tEv9A3zN5
	/ePsqklMRzVbJrK1VV6cHBJw+/Z5JZbijERDLeai4kQAbgV3g1MEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpjkeLIzCtJLcpLzFFi42LZdlhJXvfw47fpBtdfcVhc2zuR3aJp/yVm
	i6u73zFb7NguYrHp8TVWi8u75rBZ7JxzktVi2fEuVouuQ3/ZLJaf2sFisXnTVGaL42vDLTqO
	fGO2WHzgE7sDn8e23dtYPdbMW8PosWBTqcemVZ1sHneu7WHzeHfuHLvH5iX1Hn1bVjF6fN4k
	F8AZxWWTkpqTWZZapG+XwJWx/cEv9oIjAhW3uv8wNjB28HQxcnJICJhIbNw6m72LkYtDSGA3
	o8TeQ++YIBIyErdXXmaFsIUl7rccYYUous8ocfj6I7AEi4CKxOruDWwgNpuArsS2E/8YQWwR
	AXWJJWe3MII0MAvcYpb40nwGrEhYIEpiz9tpYBt4BZQlmrr2QE19zCgxacdXdoiEoMTJmU9Y
	QGxmAS2JG/9eAjVwANnSEsv/cYCEOQWsJV682M0ygVFgFpKOWUg6ZiF0LGBkXsUomVpQnJue
	W2xYYJSXWq5XnJhbXJqXrpecn7uJERxVWlo7GPes+qB3iJGJg/EQowQHs5IIb6HW23Qh3pTE
	yqrUovz4otKc1OJDjNIcLErivN9e96YICaQnlqRmp6YWpBbBZJk4OKUamOp/65p+3XTjCtPj
	3JDqyyEpkZ+eumzhyTjGsi1R/7tP0sILufc2sp2VUQrdWfRrzqE/U1f1H09RYLknXJhnIPNh
	+dlT/CpOKe3m+yKuHXSTXbLYdMs8qUORZTqL1gjdskt8M+tW6kY56XYN65X6b07f/bttz5Gu
	WbKbXL+XKrslF50tLH0Ytok1sYlhZ/eblHshUou2hkbYcXGflJot9OKwqPCfpQrJPn8cf98s
	uLFxqSOTrsI7cbEzsgu/s7SmaPDd/SO8Mkwr+RLXnT2P/r37ErjkXdUVxh+Vn9t159lwvLnr
	EM++c+Z265i6s1qT25k9GbtqrYVPz9q5/9qcLwqHZM110w66fnu59NwOp7dKLMUZiYZazEXF
	iQCIReYLGQMAAA==
X-CMS-MailID: 20250403012627epcas2p167a40fa02e775d5e6647d469ecc370c1
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----BWvmtLGreXPtZv31XE49129YoyRr4_KGUd.k-ILdCyGA2LCZ=_802bd_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250326030527epcas2p33aa30e62cc8a00c9e151c35bee71dac5
References: <CGME20250326030527epcas2p33aa30e62cc8a00c9e151c35bee71dac5@epcas2p3.samsung.com>
	<Z+Nv8U/4P3taDpUq@perf> <8634f0mall.wl-maz@kernel.org>
	<Z+TEa8CVAYnbD/Tu@perf> <20250402-messy-wild-squid-7b4da9@sudeepholla>

------BWvmtLGreXPtZv31XE49129YoyRr4_KGUd.k-ILdCyGA2LCZ=_802bd_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Apr 02, 2025 at 12:56:53PM +0100, Sudeep Holla wrote:
> (Failed to find the original email, so reply on this instead)
> 
> On Thu, Mar 27, 2025 at 12:22:19PM +0900, Youngmin Nam wrote:
> > 
> > The problem is that syscore_ops is not invoked during the S2IDLE scenario,
> > so we cannot rely on it in that context.
> > We would like to use these suspend/resume functions during S2IDLE as well.
> 
> I have one orthogonal question. The s2idle will just use the deepest
> cpuidle state registered. So if s2idle needs this save/restore of GICv3
> ITS, how does that work when all the CPUs enter that idle state.
> 
> With respect to the PSCI CPU_SUSPEND call, it doesn't change. So I am
> bit confused as how it can work fine in normal cpuidle paths but no in
> s2idle path. What am I missing ? I do psci_enter_domain_idle_state handles
> s2idle little different but nothing to change this GICv3 ITS save/restore
> requirement between cpuidle and s2idle.
> 
> -- 
> Regards,
> Sudeep
> 
Hi Sudeep,

Thanks for asking.
As a SoC vendor, we are using the Android kernel, which includes a vendor hook like the one below.

In this function,
a vendor-specific handler attached to trace_android_vh_cpuidle_psci_enter is called.

54 static __cpuidle int __psci_enter_domain_idle_state(struct cpuidle_device *dev,
55                                                     struct cpuidle_driver *drv, int idx,
56                                                     bool s2idle)
57 {
58         struct psci_cpuidle_data *data = this_cpu_ptr(&psci_cpuidle_data);
59         u32 *states = data->psci_states;
60         struct device *pd_dev = data->dev;
61         u32 state;
62         int ret;
63
64         ret = cpu_pm_enter();
65         if (ret)
66                 return -1;
67
68         /* Do runtime PM to manage a hierarchical CPU toplogy. */
69         trace_android_vh_cpuidle_psci_enter(dev, s2idle);

Within the vendor-specific handler, if the current mode is S2IDLE and the CPU logical number is 0,
the GIC ITS suspend function is executed.

Thanks.
Youngmin

------BWvmtLGreXPtZv31XE49129YoyRr4_KGUd.k-ILdCyGA2LCZ=_802bd_
Content-Type: text/plain; charset="utf-8"


------BWvmtLGreXPtZv31XE49129YoyRr4_KGUd.k-ILdCyGA2LCZ=_802bd_--
