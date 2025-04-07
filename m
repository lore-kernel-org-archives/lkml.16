Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938181A3147
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 22:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744066416; cv=none; b=MobS+O//xuGwBnq9Us4WKH35NDvRqBQSXdYano2IdRJ4/smzi8npvUqaPFaByO9zf7UiKNNZoayTSW+mW+OH0W+xn72JlaLMeKDZjMFwL2+Ufwp6I2JW7/jL0On17Ubd5tpvghIOHlGscrJ23VwbRONBs2hez43vQfTT9EK0gF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744066416; c=relaxed/simple;
	bh=gMiwRRR2OUtY7cZRGKwOM7nqA2JTPaH2FJ/iono1Y9c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:In-Reply-To:
	 Content-Type:References; b=fbyOz1D2YKStosNSErPw620fJQxuqtmf1zWvmxOxeAeO3N3amuXqjb7vsc2bOz3jdz4LD8kKXBMMhdgsaGVpp9IgThqLd34Ux4Vwdb8a9KGHANF8718xXjMNcNuNksjM6e0U6g1DQ0tQ268fq1vrfer6US7sieADC4e66frnhwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=fZjYZcDi; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="fZjYZcDi"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250407225325epoutp04fdc9a5b60a6c33fe8151a77b9a4c3505~0KyfcjS8O0112001120epoutp04w
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 22:53:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250407225325epoutp04fdc9a5b60a6c33fe8151a77b9a4c3505~0KyfcjS8O0112001120epoutp04w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1744066405;
	bh=iUSjEPZ83GdfEm51nmNZeuHGyd8PgfmmIt1lj/23V8k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fZjYZcDi4C75n8WiTA3pwA0tq6UrkRbx3sv0qs+OQMwiFLmcaSDjhWB+ghP1wBim6
	 /TTyAso12NMsRi/t7s/gMrYmbbwpRxuwpH4u2GMCp0jsBw43aqbMOEhXE54NqEeYr+
	 BqGDPJCnQ8Q9JsUXEdnkuXSYuKey5whNLFtnv5wU=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20250407225325epcas2p1356ee1822a883e2f657a95fa92df6414~0Kye8OZVT0399003990epcas2p1J;
	Mon,  7 Apr 2025 22:53:25 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.90]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4ZWkyX5d04z6B9m9; Mon,  7 Apr
	2025 22:53:24 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
	AF.F3.09856.46754F76; Tue,  8 Apr 2025 07:53:24 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250407225324epcas2p4c290a01ea294458318238f0b1123390e~0Kyd9t15L2709427094epcas2p4x;
	Mon,  7 Apr 2025 22:53:24 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250407225324epsmtrp21cb83ed4bb9ed850969a53e9fb620756~0Kyd86zT42005220052epsmtrp2r;
	Mon,  7 Apr 2025 22:53:24 +0000 (GMT)
X-AuditID: b6c32a47-c1fdf70000002680-b7-67f45764cf6d
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	5B.CA.08805.46754F76; Tue,  8 Apr 2025 07:53:24 +0900 (KST)
Received: from tiffany (unknown [10.229.95.142]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250407225324epsmtip1cd7d8259c362f1dba869298b2a4504cf~0KydsYAG83006630066epsmtip1a;
	Mon,  7 Apr 2025 22:53:24 +0000 (GMT)
Date: Tue, 8 Apr 2025 07:51:46 +0900
From: Donghyeok Choe <d7271.choe@samsung.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Youngmin Nam <youngmin.nam@samsung.com>, Marc Zyngier <maz@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>, Thomas Gleixner <tglx@linutronix.de>,
	Saravana Kannan <saravanak@google.com>, Ulf Hansson
	<ulf.hansson@linaro.org>, Vincent Guittot <vincent.guittot@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com, hajun.sung@samsung.com, joonki.min@samsung.com,
	ne.yoo@samsung.com, Donghyeok Choe <d7271.choe@samsung.com>
Subject: Re: [GICv3 ITS]S2IDLE framework does not invoke syscore_ops in
 GICv3 ITS driver
Message-ID: <20250407225146.GA2858456@tiffany>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250407-amiable-perfect-hummingbird-06ad83@sudeepholla>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIJsWRmVeSWpSXmKPExsWy7bCmqW5K+Jd0g5UbtC2u7Z3IbtG0/xKz
	xdXd75gtdmwXsdj0+BqrxeVdc9gsds45yWqx7HgXq0XXob9sFstP7WCx2LxpKrPF8bXhFh1H
	vjFbLD7wid2Bz2Pb7m2sHmvmrWH0WLCp1GPTqk42jzvX9rB5vDt3jt1j85J6j74tqxg9Pm+S
	C+CMyrbJSE1MSS1SSM1Lzk/JzEu3VfIOjneONzUzMNQ1tLQwV1LIS8xNtVVy8QnQdcvMAbpc
	SaEsMacUKBSQWFyspG9nU5RfWpKqkJFfXGKrlFqQklNgXqBXnJhbXJqXrpeXWmJlaGBgZApU
	mJCdMefNL7aCAxIVvUcOsTcw3hbuYuTkkBAwkfh5bxlLFyMXh5DADkaJky9+sUE4nxglWtYf
	g3K+MUq8mr6HDaZlzdsbzBCJvYwSd++uYYdwnjJKbDg/mQWkikVAReLf7FdgHWwCuhKTOreB
	2SIC6hJLzm5hBGlgFnjOLHG3+R9QgoNDWCBK4nF7HEgNr4CexIzOp0wQtqDEyZlPwGZyCrhJ
	HP+xihWkV0LgAIfEytvXmSBOcpH41dUFdZ6wxKvjW9ghbCmJz+/2skE0NDNKTLrxmgnCmcEo
	cWXyZ6huY4lZz9oZQWxmgQyJpQu6GEEukhBQljhyiwUizCfRcfgvO0SYV6KjTQiiU0XifN8D
	RphdG+a+hZroIdH6tYUJEioTmSXev9rAPIFRbhaSh2Yh2QZh60gs2P2JbRbQCmYBaYnl/zgg
	TE2J9bv0FzCyrmIUSy0ozk1PLTYqMIbHcXJ+7iZGcFrWct/BOOPtB71DjEwcjIcYJTiYlUR4
	LU99ShfiTUmsrEotyo8vKs1JLT7EaAqMnYnMUqLJ+cDMkFcSb2hiaWBiZmZobmRqYK4kznvo
	49N0IYH0xJLU7NTUgtQimD4mDk6pBibtzV+bf9aKO7kGmEgZ5wR5b+/Xk21UOH54wuUInQbH
	6M8buaIOsCx5pluasOf0+zzL/L9zNbPuvHrNb3jAp2XpV/Fp3r/L5gvbv7ANDuLuOnjMPkVw
	ztbU+feTxL7klVw6uESm5PJ7gRJezu/nPxe8Wulm2/Mo9s29JIf81+ffW98UkI5yVVCubzxV
	/eVgs86eh5aWnLf575W/ry6T9fiisSzgT+XRC+7T3/llVbEG1l84cm36g18/WqdX//hxatb9
	COWMqPbrhxJ7dHlkGVXO5dhuNhO481Rim8Hl29MLr6rH9RxYKx4i6Wd983eajEaqwJ20Fe0T
	OF7k5N9czWVwsKWo9ukytSkcJYsqrymxFGckGmoxFxUnAgDoQpI3VAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmplkeLIzCtJLcpLzFFi42LZdlhJTjcl/Eu6wauJXBbX9k5kt2jaf4nZ
	4urud8wWO7aLWGx6fI3V4vKuOWwWO+ecZLVYdryL1aLr0F82i+WndrBYbN40ldni+Npwi44j
	35gtFh/4xO7A57Ft9zZWjzXz1jB6LNhU6rFpVSebx51re9g83p07x+6xeUm9R9+WVYwenzfJ
	BXBGcdmkpOZklqUW6dslcGUs2/eTvaBBrOLLCe8Gxi2CXYycHBICJhJr3t5g7mLk4hAS2M0o
	MXnfAlaIhJRE+5aZTBC2sMT9liOsEEWPGSXOrehmB0mwCKhI/Jv9ig3EZhPQlZjUuQ3MFhFQ
	l1hydgsjSAOzwFtmifN377GAJIQFoiT2vJ0GNpVXQE9iRudTJoipU5kl+j8cYoNICEqcnPkE
	rIFZQEvixr+XQEUcQLa0xPJ/HCBhTgE3ieM/VrFOYBSYhaRjFpKOWQgdCxiZVzFKphYU56bn
	FhsWGOWllusVJ+YWl+al6yXn525iBMeUltYOxj2rPugdYmTiYDzEKMHBrCTCa3nqU7oQb0pi
	ZVVqUX58UWlOavEhRmkOFiVx3m+ve1OEBNITS1KzU1MLUotgskwcnFINTItLSye2/F7GGcNz
	z/H0D4bJXw4xvV12znBR7KxM83nNZZfX3uo8NWvHm5Vr2t5a3KhJZW8XClhYmP7gh2Z59WMz
	DcVJ86bxGkZfzvq/Ijsi7trdqsKbdyt2d8QZlZ7Peau/fvFOVia70LdPq1w3eAlZqHzf18rg
	WMWYGid38pHjZHOOLbIG4hkrmh2OHbqZEbM/p63zyjmt4BhVc2WHaydznlR6PM/ouhvNwJR2
	0WrXUf+jeo8XbXbO2fD+78SfJ/lfPua16/Xhnnu6b5lOzaw197Kena54M6t2WfiUqKBXAg2P
	Cs7diD+6/12trtyENdwrk3Yu/BFyZrbuD9Ef+9uCJiToTXjHXlL1Y9ZMn/dKLMUZiYZazEXF
	iQC32YKQGAMAAA==
X-CMS-MailID: 20250407225324epcas2p4c290a01ea294458318238f0b1123390e
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----BWvmtLGreXPtZv31XE49129YoyRr4_KGUd.k-ILdCyGA2LCZ=_aec8b_"
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
	<20250404041323.GA685160@tiffany>
	<20250407-amiable-perfect-hummingbird-06ad83@sudeepholla>

------BWvmtLGreXPtZv31XE49129YoyRr4_KGUd.k-ILdCyGA2LCZ=_aec8b_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Apr 07, 2025 at 10:17:43AM +0100, Sudeep Holla wrote:
> On Fri, Apr 04, 2025 at 01:13:23PM +0900, Donghyeok Choe wrote:
> > On Thu, Apr 03, 2025 at 10:18:54AM +0100, Sudeep Holla wrote:
> > > /me more confused.
> > > 
> > > Are you saying you have some cpuidle platform specific logic inside
> > > trace_android_vh_cpuidle_psci_enter(). I would assume it was just to
> > > trace the entry into the state and nothing more.
> > 
> > If you have any further questions, feel free to reach out.
> > 
> 
> I was trying to understand the difference in behaviour between normal
> cpuidle entering the same deepest state that is entered in s2idle state.
> I assume GIC doesn't loose power and no need for GIC ITS save/restore
> in normal cpuidle path ?
>
> If so, what triggers the GIC suspend in s2idle path if syscore_ops is
> not getting called ?
>
> Why would the firmware pull the plug on GIC ?

The GIC loses power. It is powered down to the same level as during suspend.
Therefore, it became necessary to perform GIC ITS save/restore through
a method other than the GIC ITS syscore path.
To help with better understanding, I will write a pseudo code.

void mimic_syscore_suspend()
{
	/* Perform the actions required to power off all cores. */
	...
	its_save_disable();
}

void android_vh_cpuidle_psci_enter_handler(... bool s2idle)
{

	if (!s2idle)
		return;

	set_cpu_powerdown_mark();

	if (cpu != booting core)
		return;

	/* only booting core here */
	mimic_syscore_suspend()
}

void mimic_syscore_resume()
{
	...
	its_restore_enable();
}

void android_vh_cpuidle_psci_exit_handler(... bool s2idle)
{
	if (!s2idle)
		return;

	if (cpu == booting core)
		mimic_syscore_resume();

	set_cpu_poweron_mark();
}

All cores will be marked as powered down when the HVC/SMC call for
CPU suspend is invoked. When all cores call the suspend function,
the firmware will recognize the powerdown mark and transition
the system into suspend. At this point, the entire GIC will also
be powered off.
In a cpuidle situation that is not s2idle, the cores do not mark
CPU powerdown, so the GIC ITS save/restore operation is neither
performed nor necessary.

> Do you use any suspend/resume logic in drivers/irqchip/irq-gic-pm.c ?
No, there are parts of the GIC that require secure access, so the
GIC save/restore is performed by the firmware.
Since the GIC-ITS is entirely controlled as a non-secure IP,
I think it is more efficient to perform save/restore in the kernel.


> I am still missing something in this flow.
Feel free to ask questions until everything is clear!
As I look for answers to your questions, I appreciate your insights
and find it helpful to review the s2idle sequence we are using.

Best regards,  
Donghyeok Choe

------BWvmtLGreXPtZv31XE49129YoyRr4_KGUd.k-ILdCyGA2LCZ=_aec8b_
Content-Type: text/plain; charset="utf-8"


------BWvmtLGreXPtZv31XE49129YoyRr4_KGUd.k-ILdCyGA2LCZ=_aec8b_--
