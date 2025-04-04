Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B37182BC
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 04:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743740115; cv=none; b=TkEbXvvdcL2aIEThE4wcArnQK7azrSW2XKWPxx7P6bqLxghmB8/0a8pMtLfMW4FJD2jMLRwjMkRN8EC78fZF20Ahy21s5BPEZposQLdSQ7m2IJeUGg+vkiyAfnj/J5txokHNj+P3mdV62a9smb0/2q8KCbQa4hp1dOUThyni3aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743740115; c=relaxed/simple;
	bh=aDFw6L71JasM237YpPT/YYAiCJ4ytUZdSAhwuEzwIfo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:In-Reply-To:
	 Content-Type:References; b=j8X/gPdbgNsGIJYn6Aq3XLJFEvOk3sorVteEbMpeVU0WyDL8z2qS6hG+CtM+3BzG8k0eYyybR9zU7E6gEzYgfDukL9reDXAKehTQefAwcerQ3eds0a6po/PMbYv4LcH9LFmlOOrs/6dMTowIXBujAZ4NpiBloZSXX3M4T2F+U3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=EC32QqUd; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="EC32QqUd"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250404041502epoutp040ca0862eb515550d14b54f45edb4f72e~zAmKHJqg40650906509epoutp04Y
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 04:15:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250404041502epoutp040ca0862eb515550d14b54f45edb4f72e~zAmKHJqg40650906509epoutp04Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1743740102;
	bh=XqYBy4gvdoVQ6qB+lepjnAo86Zkd1rhVn6wJVz03arE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EC32QqUdOjySx7qPVT/rW8CgxiRnowLTfH8bBQnXyL1FzthcOEdHPYg2koIp1MVWC
	 LvTHuXzKA8/3ce85BBwIr/xwO5wLeQT43VrEGHkZgEqNl8T5V+3i9cZz/m5br+Fp1R
	 uFZ2IAvXhxCSoH+TXuPyoQ8F1udaut6ZbQDcu9AY=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250404041502epcas2p46fa3bd561f019e66b3ef83c051e00d93~zAmJfBPLY1433714337epcas2p4F;
	Fri,  4 Apr 2025 04:15:02 +0000 (GMT)
Received: from epsmgec2p1-new.samsung.com (unknown [182.195.36.69]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4ZTQHT40G8z6B9mB; Fri,  4 Apr
	2025 04:15:01 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
	epsmgec2p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	42.21.37303.5CC5FE76; Fri,  4 Apr 2025 13:15:01 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250404041501epcas2p4b4ac00e225a28bea381f51f84914c4ac~zAmIWQFni0476804768epcas2p4K;
	Fri,  4 Apr 2025 04:15:01 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250404041500epsmtrp2eba09a6459fe7bb5c2f88fbad7ada89e~zAmIRfeZX2757627576epsmtrp2S;
	Fri,  4 Apr 2025 04:15:00 +0000 (GMT)
X-AuditID: b6c32a4d-54ffe700000091b7-f5-67ef5cc510ee
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	A0.33.08766.4CC5FE76; Fri,  4 Apr 2025 13:15:00 +0900 (KST)
Received: from tiffany (unknown [10.229.95.142]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250404041500epsmtip1b2e088aa4de4f87d087f251c220a31e4~zAmIFzYQE1809918099epsmtip1U;
	Fri,  4 Apr 2025 04:15:00 +0000 (GMT)
Date: Fri, 4 Apr 2025 13:13:23 +0900
From: Donghyeok Choe <d7271.choe@samsung.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Youngmin Nam <youngmin.nam@samsung.com>, Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Sudeep Holla <sudeep.holla@arm.com>,
	Saravana Kannan <saravanak@google.com>, Ulf Hansson
	<ulf.hansson@linaro.org>, Vincent Guittot <vincent.guittot@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com, hajun.sung@samsung.com, d7271.choe@samsung.com,
	joonki.min@samsung.com, ne.yoo@samsung.com
Subject: Re: [GICv3 ITS]S2IDLE framework does not invoke syscore_ops in
 GICv3 ITS driver
Message-ID: <20250404041323.GA685160@tiffany>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250403-rare-wasp-of-management-9bce59@sudeepholla>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKJsWRmVeSWpSXmKPExsWy7bCmhe7RmPfpBmdOSVlc2zuR3aJp/yVm
	i6u73zFb7NguYrHp8TVWi8u75rBZ7JxzktVi2fEuVouuQ3/ZLJaf2sFisXnTVGaL42vDLTqO
	fGO2WHzgE7sDn8e23dtYPdbMW8PosWBTqcemVZ1sHneu7WHzeHfuHLvH5iX1Hn1bVjF6fN4k
	F8AZlW2TkZqYklqkkJqXnJ+SmZduq+QdHO8cb2pmYKhraGlhrqSQl5ibaqvk4hOg65aZA3S5
	kkJZYk4pUCggsbhYSd/Opii/tCRVISO/uMRWKbUgJafAvECvODG3uDQvXS8vtcTK0MDAyBSo
	MCE748WpiWwFW8UqTj2/w9LAuF+oi5GTQ0LAROLhwVnsXYxcHEICexglTr9vZYFwPjFK/P65
	iRnC+cYo0bdoARNMy8pn86Fa9jJKvGtohGp5yihx/fE7sCoWARWJ65P+soDYbAK6EpM6t7GB
	2CIC6hJLzm5hBGlgFrjGLPHk7zsgh4NDWCBK4nF7HEgNL1D99MOL2CFsQYmTM5+AzeEUcJJY
	924aE0ivhMAeDok35z5CneQise3RMXYIW1ji1fEtULaUxOd3e9kgGpoZJSbdeA3VPYNR4srk
	z1DdxhKznrUzgtjMAhkSr/f8Zwe5SEJAWeLILRaIMJ9Ex+G/UGFeiY42aOipSJzve8AIs2vD
	3LdQEz0kWr+2MEFCZSOTxPmjN9knMMrNQvLQLCTbIGwdiQW7P7HNAlrBLCAtsfwfB4SpKbF+
	l/4CRtZVjFKpBcW56anJRgWGunmp5fB4Ts7P3cQITs9avjsYX6//q3eIkYmD8RCjBAezkgiv
	rdr7dCHelMTKqtSi/Pii0pzU4kOMpsAYmsgsJZqcD8wQeSXxhiaWBiZmZobmRqYG5krivIc+
	Pk0XEkhPLEnNTk0tSC2C6WPi4JRqYIozt10UwLBvfcPLNDb+ze5P/0SwnnVu23iXj2PZBJ9D
	r7do18xdofvF9PAbO8HbyW4VZ6O6wnKvaoX9td06d5mybtDbXfv45Jx+hXH9z5/CZ13ybJpS
	ldmkX9n5r10mHXC/ZSh2yuTRPrdZRad6Ziypj6ycofL08M/VFvfmzHdXWvLw5u9FEbsePnkb
	U+E/ZTXj1OMtD0t8ehjFBJ9p1gbk9MyTazwhqWf0aW2FjcjcZ7Nmvz4wY4fI/RfnhB+lnL3T
	9dpiytEl9fXro5d8WnhmMtNM2XkZ/7zm6jQHPozomdRWdPAWq5p7/pXHubxeDwTcSuNenJiy
	9mOUjW5IaeATu+V2SlG7kpoZJy5POmylxFKckWioxVxUnAgAjQCCK1gEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmphkeLIzCtJLcpLzFFi42LZdlhJTvdIzPt0g0+rzCyu7Z3IbtG0/xKz
	xdXd75gtdmwXsdj0+BqrxeVdc9gsds45yWqx7HgXq0XXob9sFstP7WCx2LxpKrPF8bXhFh1H
	vjFbLD7wid2Bz2Pb7m2sHmvmrWH0WLCp1GPTqk42jzvX9rB5vDt3jt1j85J6j74tqxg9Pm+S
	C+CM4rJJSc3JLEst0rdL4Mo498Kk4KtwxfmPNxgbGGcIdDFyckgImEisfDafHcQWEtjNKNE3
	MQMiLiXRvmUmE4QtLHG/5QhrFyMXUM1jRokz2+8zgiRYBFQkrk/6ywJiswnoSkzq3MYGYosI
	qEssObuFEaSBWeAWs8SKSY/BioQFoiT2vJ0GNpUXqGH64UXsEFO3Mkms+L6KHSIhKHFy5hOw
	BmYBLYkb/14CNXAA2dISy/9xgIQ5BZwk1r2bxjSBUWAWko5ZSDpmIXQsYGRexSiZWlCcm55b
	bFhgmJdarlecmFtcmpeul5yfu4kRHFFamjsYt6/6oHeIkYmD8RCjBAezkgivrdr7dCHelMTK
	qtSi/Pii0pzU4kOM0hwsSuK84i96U4QE0hNLUrNTUwtSi2CyTBycUg1M6a/M75RVNwV0Xq60
	qlltNHmloYcWZ+2iROl3CR79kzeLcT5TaAs+lLUwUOfmZe0JPzqXccm+nHFmcsPWbuEpi3Yy
	T7v+8KbnRPuM9pQVn8qz37T5RF+rSjxgtp91xeHgh51ef632+UyZnFFmpm724cjL85mf1BPv
	nXmTffAT650QfhvBuKUHMzK+WuTtVCo45Td32Ybr5/yEV687ul/Nif14xOrVyRcehvGx2z/u
	EordNGvyrl2OF+//lNXkllnHOcWjbONas/vHdPPadl4vFX7m/vNKeZ/oy+jFJyIvhcX8vnlE
	NZhp5ZyH7y4fzSuKcphsf4JJ4sxaZfVJF2cU190K43r8zeWsjTeLk/CaXCWW4oxEQy3mouJE
	AJpk7dYXAwAA
X-CMS-MailID: 20250404041501epcas2p4b4ac00e225a28bea381f51f84914c4ac
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----caUwc_dC5aEw_I.xGS0GMYyTEPKysFRHRKa1IoFNAgiy-i3F=_8e84e_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250326030527epcas2p33aa30e62cc8a00c9e151c35bee71dac5
References: <CGME20250326030527epcas2p33aa30e62cc8a00c9e151c35bee71dac5@epcas2p3.samsung.com>
	<Z+Nv8U/4P3taDpUq@perf> <8634f0mall.wl-maz@kernel.org>
	<Z+TEa8CVAYnbD/Tu@perf> <20250402-messy-wild-squid-7b4da9@sudeepholla>
	<Z+3kwsesiXyC0hbO@perf>
	<20250403-rare-wasp-of-management-9bce59@sudeepholla>

------caUwc_dC5aEw_I.xGS0GMYyTEPKysFRHRKa1IoFNAgiy-i3F=_8e84e_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Apr 03, 2025 at 10:18:54AM +0100, Sudeep Holla wrote:
> /me more confused.
> 
> Are you saying you have some cpuidle platform specific logic inside
> trace_android_vh_cpuidle_psci_enter(). I would assume it was just to
> trace the entry into the state and nothing more.

Hi, I am a Samsung developer working with Youngmin Nam.

Yes, you are correct. The platform-specific logic runs, and only
the booting core performs the GIC ITS save/restore. I understand that
using trace in this way might have surprised you.
However, this kind of trace usage is actually quite common
within the Android kernel.

The Android kernel aims to ensure that all SoC vendors use
the same kernel code, aiming for the benefits of the GKI project.
Since vendors often want to control kernel behavior, they utilize
traces like this to achieve that flexibility.

> In fact, it was recently added upstream as well.
> Commit 7b7644831e72 ("cpuidle: psci: Add trace for PSCI domain idle")

Then it seems that this will be used instead of the Android kernel specific
vendor hook(trace_android_vh_cpuidle_psci_enter).
We can eliminate the diff between the mainline code and the ACK.

> Further you didn't explicitly answer my question. IIUC are you calling
> GIC ITS suspend function unconditionally if its boot cpu ? Or is it
> done only for s2idle ? If done only for s2idle, how does it work for
> normal cpuidle entry to deepest idle state that matches the one entered
> during s2idle.

In the s2idle situation, only the booting core performs
the GIC ITS suspend/resume. The difference from normal cpuidle
is that in the case of s2idle, the entire system enters suspend
at a level equivalent to kernel suspend.

Through that trace(trace_android_vh_cpuidle_psci_enter),
we don't directly call syscore suspend, but rather mimic
the actions that syscore suspend would perform.

You might be concerned about the following:
While kernel suspend hotplugs out the remaining cores except for
the booting core and performs syscore suspend, in the s2idle scenario,
cores enter cpuidle in parallel when going into suspend.
I understand that you may worry about the synchronization issues
that could arise when cores enter cpuidle in parallel during
the s2idle situation.
There were many exceptional cases, and we resolved them all together
with my colleagues. We paid the price for not using the mainline kernel
code as intended.

If you have any further questions, feel free to reach out.

Best regards,  
Donghyeok Choe

------caUwc_dC5aEw_I.xGS0GMYyTEPKysFRHRKa1IoFNAgiy-i3F=_8e84e_
Content-Type: text/plain; charset="utf-8"


------caUwc_dC5aEw_I.xGS0GMYyTEPKysFRHRKa1IoFNAgiy-i3F=_8e84e_--
